# This function adds a python extension to the buildsystem.
#
# Usage:
#
# add_python_extension(
#     extension_name
#     SOURCES source1.c source2.c ...
#     [ REQUIRES variable1 variable2 ... ]
#     [ DEFINITIONS define1 define2 ... ]
#     [ LIBRARIES lib1 lib2 ... ]
#     [ INCLUDEDIRS dir1 dir2 ... ]
#     [ BUILTIN ]
# )
#
# extension_name: the name of the library without any .so extension.
# SOURCES:     a list of filenames realtive to the Modules/ directory that make
#              up this extension.
# REQUIRES:    this extension will not be built unless all the variables listed
#              here evaluate to true.  You should include any variables you use
#              in the LIBRARIES and INCLUDEDIRS sections.
# DEFINITIONS: an optional list of definitions to pass to the compiler while
#              building this module.  Do not include the -D prefix.
# LIBRARIES:   an optional list of additional libraries.
# INCLUDEDIRS: an optional list of additional include directories.
# BUILTIN:     if this is set the module will be compiled statically into
#              libpython by default.  The user can still override by setting
#              BUILTIN_[extension_name]=OFF.
#
# Two user-settable options are created for each extension added:
# ENABLE_[extension_name]   defaults to ON.  If set to OFF the extension will
#                           not be added at all.
# BUILTIN_[extension_name]  defaults to OFF unless BUILTIN is set when calling
#                           add_python_extension.  Adds the extension source
#                           files to libpython instead of compiling a separate
#                           library.
# These options convert the extension_name to upper case first and remove any
# leading underscores.  So add_python_extension(_foo ...) will create the
# options ENABLE_FOO and BUILTIN_FOO.

function(add_python_extension name)
    set(options BUILTIN)
    set(oneValueArgs)
    set(multiValueArgs REQUIRES SOURCES DEFINITIONS LIBRARIES INCLUDEDIRS)
    cmake_parse_arguments(ADD_PYTHON_EXTENSION
        "${options}"
        "${oneValueArgs}"
        "${multiValueArgs}"
        ${ARGN}
        )

    # Remove _ from the beginning of the name.
    string(REGEX REPLACE "^_" "" pretty_name "${name}")

    # Upper case the name.
    string(TOUPPER "${pretty_name}" upper_name)

    # Add a prefix to the target name so it doesn't clash with any system
    # libraries that we might want to link against (eg. readline)
    set(target_name extension_${pretty_name})

    # Add options that the user can set to control whether this extension is
    # compiled, and whether it is compiled in to libpython itself.
    option(ENABLE_${upper_name}
           "Controls whether the \"${name}\" extension will be built"
           ON
    )
    option(BUILTIN_${upper_name}
           "If this is set the \"${name}\" extension will be compiled in to libpython"
           ${ADD_PYTHON_EXTENSION_BUILTIN}
    )

    # Check all the things we require are found.
    set(missing_deps "")
    foreach(dep ${ADD_PYTHON_EXTENSION_REQUIRES} ENABLE_${upper_name})
        if(NOT ${dep})
            set(missing_deps "${missing_deps}${dep} ")
        endif(NOT ${dep})
    endforeach(dep)

    # If any dependencies were missing don't include this extension.
    if(missing_deps)
        string(STRIP "${missing_deps}" missing_deps)
        set(extensions_disabled "${extensions_disabled}${name} (not set: ${missing_deps});"
             CACHE INTERNAL "" FORCE)
        return()
    else(missing_deps)
        set(extensions_enabled "${extensions_enabled}${name};" CACHE INTERNAL "" FORCE)
    endif(missing_deps)

    # Callers to this function provide source files relative to the Modules/
    # directory.  We need to get absolute paths for them all.
    set(absolute_sources "")
    foreach(source ${ADD_PYTHON_EXTENSION_SOURCES})
        get_filename_component(ext ${source} EXT)

        # Treat assembler sources differently
        if(${ext} STREQUAL ".S")
            add_assembler(absolute_sources Modules/${source} ${ADD_PYTHON_EXTENSION_INCLUDEDIRS})
        else(${ext} STREQUAL ".S")
            list(APPEND absolute_sources ${CMAKE_SOURCE_DIR}/Modules/${source})
        endif(${ext} STREQUAL ".S")
    endforeach(source)

    if(BUILTIN_${upper_name})
        # This will be compiled into libpython instead of as a separate library
        set_property(GLOBAL APPEND PROPERTY builtin_extensions ${name})
        set_property(GLOBAL APPEND PROPERTY extension_${name}_sources ${absolute_sources})
        set_property(GLOBAL APPEND PROPERTY extension_${name}_link_libraries ${ADD_PYTHON_EXTENSION_LIBRARIES})
        set_property(GLOBAL APPEND PROPERTY extension_${name}_includedirs ${ADD_PYTHON_EXTENSION_INCLUDEDIRS})
        set_property(GLOBAL APPEND PROPERTY extension_${name}_definitions ${ADD_PYTHON_EXTENSION_DEFINITIONS})
    elseif(WIN32 AND NOT BUILD_SHARED)
        # Extensions cannot be built against a static libpython on windows
    else()

        # XXX Uncomment when CMake >= 2.8.8 is required
        #add_library(${target_name} SHARED ${absolute_sources})
        #set_target_properties(${target_name} PROPERTIES
        #    INCLUDE_DIRECTORIES ${ADD_PYTHON_EXTENSION_INCLUDEDIRS})

        if(WIN32)
            string(REGEX MATCH "Py_LIMITED_API" require_limited_api "${ADD_PYTHON_EXTENSION_DEFINITIONS}")
            if(require_limited_api STREQUAL "")
              list(APPEND ADD_PYTHON_EXTENSION_LIBRARIES libpython-shared)
            else()
              list(APPEND ADD_PYTHON_EXTENSION_LIBRARIES libpython3-shared)
            endif()
        endif()

        # XXX When CMake >= 2.8.8 is required, remove the section below
        #     configuring and using 'add_python_extension_CMakeLists.txt.in'.
        file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/${target_name}-src)
        configure_file(
            ${CMAKE_SOURCE_DIR}/cmake/add_python_extension_CMakeLists.txt.in
            ${CMAKE_CURRENT_BINARY_DIR}/${target_name}-src/CMakeLists.txt
        )
        add_subdirectory(
            ${CMAKE_CURRENT_BINARY_DIR}/${target_name}-src
            ${CMAKE_CURRENT_BINARY_DIR}/${target_name}
        )

        # XXX Uncomment when CMake >= 2.8.8 is required
        #target_link_libraries(${target_name} ${ADD_PYTHON_EXTENSION_LIBRARIES})

        if(WIN32)
            #list(APPEND ADD_PYTHON_EXTENSION_DEFINITIONS Py_NO_ENABLE_SHARED)
            target_link_libraries(${target_name} libpython-shared)
            if(MINGW)
                set_target_properties(${target_name} PROPERTIES
                    LINK_FLAGS -Wl,--enable-auto-import
                )
            endif(MINGW)
            set_target_properties(${target_name} PROPERTIES
                SUFFIX .pyd
            )
        endif()
        
        if(APPLE)
            set_target_properties(${target_name} PROPERTIES
                LINK_FLAGS -Wl,-undefined,dynamic_lookup
                SUFFIX .so
            )
        endif(APPLE)

        # Turn off the "lib" prefix and add any compiler definitions
        set_target_properties(${target_name} PROPERTIES
            ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${ARCHIVEDIR}
            LIBRARY_OUTPUT_DIRECTORY ${EXTENSION_BUILD_DIR}
            RUNTIME_OUTPUT_DIRECTORY ${EXTENSION_BUILD_DIR}
            OUTPUT_NAME "${name}"
            PREFIX ""
        )

        if(ADD_PYTHON_EXTENSION_DEFINITIONS)
            set_target_properties(${target_name} PROPERTIES
                COMPILE_DEFINITIONS "${ADD_PYTHON_EXTENSION_DEFINITIONS}")
        endif(ADD_PYTHON_EXTENSION_DEFINITIONS)

        install(TARGETS ${target_name}
                ARCHIVE DESTINATION ${ARCHIVEDIR}
                LIBRARY DESTINATION ${DYNLOAD}
                RUNTIME DESTINATION ${DYNLOAD})
    endif(BUILTIN_${upper_name})
endfunction(add_python_extension)


function(show_extension_summary)
    if(extensions_disabled)
        message(STATUS "")
        message(STATUS "The following extensions will NOT be built:")
        message(STATUS "")
        foreach(line ${extensions_disabled})
            message(STATUS "    ${line}")
        endforeach(line)
        message(STATUS "")
    endif(extensions_disabled)
endfunction(show_extension_summary)
