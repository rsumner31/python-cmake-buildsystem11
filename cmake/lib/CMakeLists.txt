# Install all the python module source from Lib/

set(libdir ${SRC_DIR}/Lib)
file(GLOB_RECURSE libfiles RELATIVE ${libdir} "${libdir}/*")

if(UNIX)
    set(plat_subdir "plat-linux2")
endif()

foreach(file ${libfiles})
    # Don't install files for other platforms
    string(REGEX MATCH "^plat-" is_platform_file "${file}")
    if(plat_subdir)
        string(REGEX MATCH "^${plat_subdir}" is_matching_platform_file "${file}")
    endif()

    # Exclude tests if BUILD_TESTING is OFF
    string(REGEX MATCH "^test" is_test "${file}")
    set(include_file 1)
    if(NOT BUILD_TESTING AND is_test)
        set(include_file 0)
    endif()

    if(include_file AND (NOT is_platform_file OR is_matching_platform_file))
        get_filename_component(path ${file} PATH)

        # Copy lib files to build tree
        file(MAKE_DIRECTORY ${PROJECT_BINARY_DIR}/${PYTHONHOME}/${path})
        file(COPY ${libdir}/${file} DESTINATION ${PROJECT_BINARY_DIR}/${PYTHONHOME}/${path})

        # Install
        install(FILES ${libdir}/${file} DESTINATION ${PYTHONHOME}/${path})

    endif(NOT is_platform_file OR is_matching_platform_file)
endforeach(file)

# Setup landmark allowing to run the interpreter from a build tree. See 'getpath.c' for details.
file(MAKE_DIRECTORY ${BIN_BUILD_DIR}/Modules)
file(WRITE ${BIN_BUILD_DIR}/Modules/Setup "")

# See "is_python_build()" in sysconfig.py
file(WRITE ${BIN_BUILD_DIR}/Modules/Setup.local "")
