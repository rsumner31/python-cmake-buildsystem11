include(CheckCSourceCompiles)
include(CheckCSourceRuns)
include(CheckIncludeFiles)
include(CheckTypeSize)
include(CMakePushCheckState)
include(CheckStructHasMember)
include(CheckFunctionExists)
include(CheckLibraryExists)
include(CheckSymbolExists)
include(CheckVariableExists)
include(cmake/CheckTypeExists.cmake)
include(cmake/PlatformTest.cmake)

if(WIN32)
  # From PC/pyconfig.h: 
  #  This is a manually maintained version used for the Watcom,
  #  Borland and Microsoft Visual C++ compilers.  It is a
  #  standard part of the Python distribution.
else(WIN32)

macro(ADD_COND var cond item)
  if(${cond})
    set(${var} ${${var}} ${item})
  endif(${cond})
endmacro(ADD_COND)

# Emulate AC_HEADER_DIRENT
check_include_files(dirent.h HAVE_DIRENT_H)
if(NOT HAVE_DIRENT_H)
  check_include_files(sys/ndir.h HAVE_SYS_NDIR_H)
  check_type_exists(DIR sys/dir.h HAVE_SYS_DIR_H)
  check_include_files(ndir.h HAVE_NDIR_H)
endif(NOT HAVE_DIRENT_H)

check_include_files(asm/types.h HAVE_ASM_TYPES_H)
check_include_files(arpa/inet.h HAVE_ARPA_INET_H)
check_include_files(bluetooth/bluetooth.h HAVE_BLUETOOTH_BLUETOOTH_H)
check_include_files(bluetooth.h HAVE_BLUETOOTH_H)
check_include_files(conio.h HAVE_CONIO_H)
check_include_files(curses.h HAVE_CURSES_H)
check_include_files(direct.h HAVE_DIRECT_H)
check_include_files(dlfcn.h HAVE_DLFCN_H)
check_include_files(errno.h HAVE_ERRNO_H)
check_include_files(fcntl.h HAVE_FCNTL_H)
check_include_files(fpu_control.h HAVE_FPU_CONTROL_H)
check_include_files(grp.h HAVE_GRP_H)
check_include_files(inttypes.h HAVE_INTTYPES_H)
check_include_files(io.h HAVE_IO_H)
check_include_files(langinfo.h HAVE_LANGINFO_H)
check_include_files(libintl.h HAVE_LIBINTL_H)
check_include_files(libutil.h HAVE_LIBUTIL_H)
check_include_files(linux/tipc.h HAVE_LINUX_TIPC_H)
check_include_files(locale.h HAVE_LOCALE_H)

check_include_files(sys/socket.h HAVE_SYS_SOCKET_H)

set(LINUX_NETLINK_HEADERS)
add_cond(LINUX_NETLINK_HEADERS HAVE_ASM_TYPES_H  asm/types.h)
add_cond(LINUX_NETLINK_HEADERS HAVE_SYS_SOCKET_H sys/socket.h)
set(LINUX_NETLINK_HEADERS ${LINUX_NETLINK_HEADERS} linux/netlink.h)
check_include_files("${LINUX_NETLINK_HEADERS}" HAVE_LINUX_NETLINK_H)

check_include_files(memory.h HAVE_MEMORY_H)
check_include_files(ncurses.h HAVE_NCURSES_H)
check_include_files(netdb.h HAVE_NETDB_H)
check_include_files(netinet/in.h HAVE_NETINET_IN_H)
check_include_files(netpacket/packet.h HAVE_NETPACKET_PACKET_H)
check_include_files(poll.h HAVE_POLL_H)
check_include_files(process.h HAVE_PROCESS_H)
check_include_files(pthread.h HAVE_PTHREAD_H)
check_include_files(pty.h HAVE_PTY_H)
check_include_files(pwd.h HAVE_PWD_H)
check_include_files(readline/readline.h HAVE_READLINE_READLINE_H)
check_include_files(shadow.h HAVE_SHADOW_H)
check_include_files(signal.h HAVE_SIGNAL_H)
check_include_files(stdint.h HAVE_STDINT_H)
check_include_files(stdlib.h HAVE_STDLIB_H)
check_include_files(strings.h HAVE_STRINGS_H)
check_include_files(string.h HAVE_STRING_H)
check_include_files(stropts.h HAVE_STROPTS_H)
check_include_files(sysexits.h HAVE_SYSEXITS_H)
check_include_files(sys/audioio.h HAVE_SYS_AUDIOIO_H)
check_include_files(sys/bsdtty.h HAVE_SYS_BSDTTY_H)
check_include_files(sys/epoll.h HAVE_SYS_EPOLL_H)
check_include_files(sys/event.h HAVE_SYS_EVENT_H)
check_include_files(sys/file.h HAVE_SYS_FILE_H)
check_include_files(sys/loadavg.h HAVE_SYS_LOADAVG_H)
check_include_files(sys/lock.h HAVE_SYS_LOCK_H)
check_include_files(sys/mkdev.h HAVE_SYS_MKDEV_H)
check_include_files(sys/mman.h HAVE_SYS_MMAN_H)
check_include_files(sys/modem.h HAVE_SYS_MODEM_H)
check_include_files(sys/param.h HAVE_SYS_PARAM_H)
check_include_files(sys/poll.h HAVE_SYS_POLL_H)
check_include_files(sys/resource.h HAVE_SYS_RESOURCE_H)
check_include_files(sys/select.h HAVE_SYS_SELECT_H)
check_include_files(sys/statvfs.h HAVE_SYS_STATVFS_H)
check_include_files(sys/stat.h HAVE_SYS_STAT_H)
check_include_files(sys/timeb.h HAVE_SYS_TIMEB_H)
check_include_files(sys/termio.h HAVE_SYS_TERMIO_H)
check_include_files(sys/times.h HAVE_SYS_TIMES_H)
check_include_files(sys/time.h HAVE_SYS_TIME_H)
check_include_files(sys/types.h HAVE_SYS_TYPES_H)
check_include_files(sys/un.h HAVE_SYS_UN_H)
check_include_files(sys/utsname.h HAVE_SYS_UTSNAME_H)
check_include_files(sys/wait.h HAVE_SYS_WAIT_H)
check_include_files(termios.h HAVE_TERMIOS_H)
check_include_files(term.h HAVE_TERM_H)
check_include_files(thread.h HAVE_THREAD_H)
check_include_files(unistd.h HAVE_UNISTD_H)
check_include_files(util.h HAVE_UTIL_H)
check_include_files(utime.h HAVE_UTIME_H)
check_include_files(wchar.h HAVE_WCHAR_H)
check_include_files("stdlib.h;stdarg.h;string.h;float.h" STDC_HEADERS)

check_include_files(stdarg.h HAVE_STDARG_PROTOTYPES)

find_file(HAVE_DEV_PTMX NAMES /dev/ptmx PATHS / NO_DEFAULT_PATH)
find_file(HAVE_DEV_PTC  NAMES /dev/ptc  PATHS / NO_DEFAULT_PATH)
message(STATUS "ptmx: ${HAVE_DEV_PTMX} ptc: ${HAVE_DEV_PTC}")

find_library(HAVE_LIBCURSES curses)
find_library(HAVE_LIBCRYPT crypt)
find_library(HAVE_LIBDL dl)
find_library(HAVE_LIBDLD dld)
find_library(HAVE_LIBINTL intl)
find_library(HAVE_LIBM m)
find_library(HAVE_LIBNCURSES ncurses)
find_library(HAVE_LIBNSL nsl)
find_library(HAVE_LIBREADLINE readline)
find_library(HAVE_LIBTERMCAP termcap)
find_library(HAVE_LIBUTIL    util)

if(WITH_THREAD)
  set(CMAKE_HAVE_PTHREAD_H ${HAVE_PTHREAD_H}) # Skip checking for header a second time.
  find_package(Threads)
  if(CMAKE_HAVE_LIBC_CREATE)
    set(_REENTRANT 1)
  endif()
endif()

set(_FILE_OFFSET_BITS 64)
set(_LARGEFILE_SOURCE 1)

set(__BSD_VISIBLE 1)
set(_BSD_TYPES 1)
set(__EXTENSIONS__ 1)
set(_GNU_SOURCE 1)
set(_NETBSD_SOURCE 1)

if(CMAKE_SYSTEM MATCHES OpenBSD)
  set(_BSD_SOURCE 1)
endif(CMAKE_SYSTEM MATCHES OpenBSD)

set(define_xopen_source 1)
if(APPLE)
  set(define_xopen_source 0)
endif()

if(define_xopen_source)
  set(_XOPEN_SOURCE 600)
  set(_XOPEN_SOURCE_EXTENDED 1)
  set(_POSIX_C_SOURCE 200112L)
endif()

set(CMAKE_REQUIRED_DEFINITIONS 
  -D_FILE_OFFSET_BITS=${_FILE_OFFSET_BITS}
  -D_GNU_SOURCE=${_GNU_SOURCE}
  -D_BSD_TYPES=${_BSD_TYPES}
  -DNETBSD_SOURCE=${_NETBSD_SOURCE}
  -D__BSD_VISIBLE=${__BSD_VISIBLE})
set(CMAKE_EXTRA_INCLUDE_FILES stdio.h)

add_cond(CMAKE_REQUIRED_LIBRARIES HAVE_LIBM m)
add_cond(CMAKE_REQUIRED_LIBRARIES HAVE_LIBINTL intl)
add_cond(CMAKE_REQUIRED_LIBRARIES HAVE_LIBUTIL util)
add_cond(CMAKE_EXTRA_INCLUDE_FILES HAVE_WCHAR_H wchar.h)

check_type_size(double SIZEOF_DOUBLE)
check_type_size(float SIZEOF_FLOAT)
check_type_size(fpos_t SIZEOF_FPOS_T)
check_type_size(int SIZEOF_INT)
check_type_size(long SIZEOF_LONG)
check_type_size("long long" SIZEOF_LONG_LONG)
set(HAVE_LONG_LONG ${SIZEOF_LONG_LONG})
check_type_size(off_t SIZEOF_OFF_T)
check_type_size(pthread_t SIZEOF_PTHREAD_T)
check_type_size(short SIZEOF_SHORT)
check_type_size(size_t SIZEOF_SIZE_T)
check_type_size(ssize_t HAVE_SSIZE_T)
check_type_size(time_t SIZEOF_TIME_T)
check_type_size(uintptr_t SIZEOF_UINTPTR_T)
set(HAVE_UINTPTR_T ${SIZEOF_UINTPTR_T})
check_type_size("void *" SIZEOF_VOID_P)
check_type_size(wchar_t SIZEOF_WCHAR_T)
check_type_size(_Bool SIZEOF__BOOL)
set(HAVE_C99_BOOL ${SIZEOF__BOOL})

set(AIX_GENUINE_CPLUSPLUS 0)

set(WITH_DYLD 0)
set(WITH_NEXT_FRAMEWORK 0)
if(APPLE)
  set(WITH_DYLD 1)
  set(WITH_NEXT_FRAMEWORK 0) # TODO: See --enable-framework option.
endif(APPLE)

if(HAVE_LONG_LONG)
  if(SIZEOF_OFF_T GREATER SIZEOF_LONG
      AND (SIZEOF_LONG_LONG GREATER SIZEOF_OFF_T OR SIZEOF_LONG_LONG EQUAL SIZEOF_OFF_T))      
      set(HAVE_LARGEFILE_SUPPORT 1)
  endif()
  
endif(HAVE_LONG_LONG)


set(CFG_HEADERS )

add_cond(CFG_HEADERS HAVE_SYS_EPOLL_H sys/epoll.h)
add_cond(CFG_HEADERS HAVE_SYS_EVENT_H sys/event.h)
add_cond(CFG_HEADERS HAVE_SYS_TYPES_H sys/types.h)
add_cond(CFG_HEADERS HAVE_SYS_TIME_H sys/time.h)
add_cond(CFG_HEADERS HAVE_SYS_FILE_H sys/file.h)
add_cond(CFG_HEADERS HAVE_SYS_POLL_H sys/poll.h)
add_cond(CFG_HEADERS HAVE_SYS_STATVFS_H sys/statvfs.h)
add_cond(CFG_HEADERS HAVE_SYS_STAT_H sys/stat.h)
add_cond(CFG_HEADERS HAVE_SYS_LOCK_H sys/lock.h)
add_cond(CFG_HEADERS HAVE_SYS_TIMEB_H sys/timeb.h)
add_cond(CFG_HEADERS HAVE_SYS_TIMES_H sys/times.h)
add_cond(CFG_HEADERS HAVE_SYS_UTSNAME_H sys/utsname.h)
add_cond(CFG_HEADERS HAVE_SYS_MMAN_H sys/mman.h)
add_cond(CFG_HEADERS HAVE_SYS_SOCKET_H sys/socket.h)
add_cond(CFG_HEADERS HAVE_SYS_WAIT_H sys/wait.h)
add_cond(CFG_HEADERS HAVE_PWD_H pwd.h)
add_cond(CFG_HEADERS HAVE_GRP_H grp.h)
add_cond(CFG_HEADERS HAVE_SHADOW_H shadow.h)
add_cond(CFG_HEADERS HAVE_LOCALE_H locale.h)
add_cond(CFG_HEADERS HAVE_LIBINTL_H libintl.h)
add_cond(CFG_HEADERS HAVE_FCNTL_H fcntl.h)
add_cond(CFG_HEADERS HAVE_PTY_H pty.h)
add_cond(CFG_HEADERS HAVE_SIGNAL_H signal.h)
add_cond(CFG_HEADERS HAVE_STDLIB_H stdlib.h)
add_cond(CFG_HEADERS HAVE_STRING_H string.h)
add_cond(CFG_HEADERS HAVE_UTIL_H util.h)
add_cond(CFG_HEADERS HAVE_UNISTD_H unistd.h)
add_cond(CFG_HEADERS HAVE_UTIME_H utime.h)
add_cond(CFG_HEADERS HAVE_WCHAR_H wchar.h)

if(HAVE_PTY_H)
  set(CFG_HEADERS ${CFG_HEADERS} pty.h utmp.h)
endif(HAVE_PTY_H)

set(CFG_HEADERS ${CFG_HEADERS} time.h stdio.h math.h)

check_symbol_exists(alarm        "${CFG_HEADERS}" HAVE_ALARM)
check_symbol_exists(altzone      "${CFG_HEADERS}" HAVE_ALTZONE)
check_symbol_exists(bind_textdomain_codeset "${CFG_HEADERS}" HAVE_BIND_TEXTDOMAIN_CODESET)
check_symbol_exists(chflags      "${CFG_HEADERS}" HAVE_CHFLAGS)
check_symbol_exists(chown        "${CFG_HEADERS}" HAVE_CHOWN)
check_symbol_exists(chroot       "${CFG_HEADERS}" HAVE_CHROOT)
check_symbol_exists(clock        "${CFG_HEADERS}" HAVE_CLOCK)
check_symbol_exists(confstr      "${CFG_HEADERS}" HAVE_CONFSTR)
check_symbol_exists(ctermid      "${CFG_HEADERS}" HAVE_CTERMID)
check_symbol_exists(ctermid_r    "${CFG_HEADERS}" HAVE_CTERMID_R)
check_symbol_exists(dup2         "${CFG_HEADERS}" HAVE_DUP2)
check_symbol_exists(epoll_create "${CFG_HEADERS}" HAVE_EPOLL)
check_symbol_exists(execv        "${CFG_HEADERS}" HAVE_EXECV)
check_symbol_exists(fchdir       "${CFG_HEADERS}" HAVE_FCHDIR)
check_symbol_exists(fchmod       "${CFG_HEADERS}" HAVE_FCHMOD)
check_symbol_exists(fchown       "${CFG_HEADERS}" HAVE_FCHOWN)
check_symbol_exists(fdatasync    "${CFG_HEADERS}" HAVE_FDATASYNC)
check_symbol_exists(flock        "${CFG_HEADERS}" HAVE_FLOCK)
check_symbol_exists(fork         "${CFG_HEADERS}" HAVE_FORK)
check_symbol_exists(forkpty      "${CFG_HEADERS}" HAVE_FORKPTY)
check_symbol_exists(fpathconf    "${CFG_HEADERS}" HAVE_FPATHCONF)
cmake_push_check_state()
set(CFG_HEADERS_SAVE ${CFG_HEADERS})
add_cond(CFG_HEADERS HAVE_FPU_CONTROL_H fpu_control.h)
check_symbol_exists(__fpu_control  "${CFG_HEADERS}" HAVE___FPU_CONTROL)
if(NOT HAVE___FPU_CONTROL)
  check_library_exists(ieee __fpu_control "" HAVE_LIBIEEE)
endif(NOT HAVE___FPU_CONTROL)
set(CFG_HEADERS ${CFG_HEADERS_SAVE})
cmake_pop_check_state()
check_symbol_exists(fseek64      "${CFG_HEADERS}" HAVE_FSEEK64)
check_symbol_exists(fseeko       "${CFG_HEADERS}" HAVE_FSEEKO)
check_symbol_exists(fstatvfs     "${CFG_HEADERS}" HAVE_FSTATVFS)
check_symbol_exists(fsync        "${CFG_HEADERS}" HAVE_FSYNC)
check_symbol_exists(ftell64      "${CFG_HEADERS}" HAVE_FTELL64)
check_symbol_exists(ftello       "${CFG_HEADERS}" HAVE_FTELLO)
check_symbol_exists(ftime        "${CFG_HEADERS}" HAVE_FTIME)
check_symbol_exists(ftruncate    "${CFG_HEADERS}" HAVE_FTRUNCATE)
check_symbol_exists(getcwd       "${CFG_HEADERS}" HAVE_GETCWD)
check_symbol_exists(getc_unlocked   "${CFG_HEADERS}" HAVE_GETC_UNLOCKED)
check_symbol_exists(getgroups       "${CFG_HEADERS}" HAVE_GETGROUPS)
check_symbol_exists(getloadavg   "${CFG_HEADERS}" HAVE_GETLOADAVG)
check_symbol_exists(getlogin     "${CFG_HEADERS}" HAVE_GETLOGIN)
check_symbol_exists(getpagesize  "${CFG_HEADERS}" HAVE_GETPAGESIZE)
check_symbol_exists(getpgid      "${CFG_HEADERS}" HAVE_GETPGID)
check_symbol_exists(getpgrp      "${CFG_HEADERS}" HAVE_GETPGRP)
check_symbol_exists(getpid       "${CFG_HEADERS}" HAVE_GETPID)
check_symbol_exists(getpriority  "${CFG_HEADERS}" HAVE_GETPRIORITY)
check_symbol_exists(getpwent     "${CFG_HEADERS}" HAVE_GETPWENT)
check_symbol_exists(getresgid    "${CFG_HEADERS}" HAVE_GETRESGID)
check_symbol_exists(getresuid    "${CFG_HEADERS}" HAVE_GETRESUID)
check_symbol_exists(getsid       "${CFG_HEADERS}" HAVE_GETSID)
check_symbol_exists(getspent     "${CFG_HEADERS}" HAVE_GETSPENT)
check_symbol_exists(getspnam     "${CFG_HEADERS}" HAVE_GETSPNAM)
check_symbol_exists(gettimeofday "${CFG_HEADERS}" HAVE_GETTIMEOFDAY)
check_symbol_exists(getwd        "${CFG_HEADERS}" HAVE_GETWD)
check_symbol_exists(hypot        "${CFG_HEADERS}" HAVE_HYPOT)
check_symbol_exists(kill         "${CFG_HEADERS}" HAVE_KILL)
check_symbol_exists(killpg       "${CFG_HEADERS}" HAVE_KILLPG)
check_symbol_exists(kqueue       "${CFG_HEADERS}" HAVE_KQUEUE)
check_symbol_exists(lchflags     "${CFG_HEADERS}" HAVE_LCHFLAGS)
check_symbol_exists(lchmod       "${CFG_HEADERS}" HAVE_LCHMOD)
check_symbol_exists(lchown       "${CFG_HEADERS}" HAVE_LCHOWN)
check_symbol_exists(link         "${CFG_HEADERS}" HAVE_LINK)
check_symbol_exists(lstat        "${CFG_HEADERS}" HAVE_LSTAT)
check_symbol_exists(makedev      "${CFG_HEADERS}" HAVE_MAKEDEV)
check_symbol_exists(memmove      "${CFG_HEADERS}" HAVE_MEMMOVE)
check_symbol_exists(mkfifo       "${CFG_HEADERS}" HAVE_MKFIFO)
check_symbol_exists(mknod        "${CFG_HEADERS}" HAVE_MKNOD)
check_symbol_exists(mktime       "${CFG_HEADERS}" HAVE_MKTIME)
check_symbol_exists(mremap       "${CFG_HEADERS}" HAVE_MREMAP)
check_symbol_exists(nice         "${CFG_HEADERS}" HAVE_NICE)
check_symbol_exists(openpty      "${CFG_HEADERS}" HAVE_OPENPTY)
check_symbol_exists(pathconf     "${CFG_HEADERS}" HAVE_PATHCONF)
check_symbol_exists(pause        "${CFG_HEADERS}" HAVE_PAUSE)
check_symbol_exists(plock        "${CFG_HEADERS}" HAVE_PLOCK)
check_symbol_exists(poll         "${CFG_HEADERS}" HAVE_POLL)
check_symbol_exists(putenv       "${CFG_HEADERS}" HAVE_PUTENV)
check_symbol_exists(readlink     "${CFG_HEADERS}" HAVE_READLINK)
check_symbol_exists(realpath     "${CFG_HEADERS}" HAVE_REALPATH)
check_symbol_exists(select       "${CFG_HEADERS}" HAVE_SELECT)
check_symbol_exists(setegid      "${CFG_HEADERS}" HAVE_SETEGID)
check_symbol_exists(seteuid      "${CFG_HEADERS}" HAVE_SETEUID)
check_symbol_exists(setgid       "${CFG_HEADERS}" HAVE_SETGID)
check_symbol_exists(setgroups    "${CFG_HEADERS}" HAVE_SETGROUPS)
check_symbol_exists(setlocale    "${CFG_HEADERS}" HAVE_SETLOCALE)
check_symbol_exists(setpgid      "${CFG_HEADERS}" HAVE_SETPGID)
check_symbol_exists(setpgrp      "${CFG_HEADERS}" HAVE_SETPGRP)
check_symbol_exists(setregid     "${CFG_HEADERS}" HAVE_SETREGID)
check_symbol_exists(setreuid     "${CFG_HEADERS}" HAVE_SETREUID)
check_symbol_exists(setsid       "${CFG_HEADERS}" HAVE_SETSID)
check_symbol_exists(setuid       "${CFG_HEADERS}" HAVE_SETUID)
check_symbol_exists(setvbuf      "${CFG_HEADERS}" HAVE_SETVBUF)
check_symbol_exists(sigaction    "${CFG_HEADERS}" HAVE_SIGACTION)
check_symbol_exists(siginterrupt "${CFG_HEADERS}" HAVE_SIGINTERRUPT)
check_symbol_exists(sigrelse     "${CFG_HEADERS}" HAVE_SIGRELSE)
check_symbol_exists(snprintf     "${CFG_HEADERS}" HAVE_SNPRINTF)
check_symbol_exists(socketpair   "${CFG_HEADERS}" HAVE_SOCKETPAIR)
check_symbol_exists(statvfs      "${CFG_HEADERS}" HAVE_STATVFS)
check_symbol_exists(strdup       "${CFG_HEADERS}" HAVE_STRDUP)
check_symbol_exists(strftime     "${CFG_HEADERS}" HAVE_STRFTIME)
check_symbol_exists(symlink      "${CFG_HEADERS}" HAVE_SYMLINK)
check_symbol_exists(sysconf      "${CFG_HEADERS}" HAVE_SYSCONF)
check_symbol_exists(tcgetpgrp    "${CFG_HEADERS}" HAVE_TCGETPGRP)
check_symbol_exists(tcsetpgrp    "${CFG_HEADERS}" HAVE_TCSETPGRP)
check_symbol_exists(tempnam      "${CFG_HEADERS}" HAVE_TEMPNAM)
check_symbol_exists(timegm       "${CFG_HEADERS}" HAVE_TIMEGM)
check_symbol_exists(times        "${CFG_HEADERS}" HAVE_TIMES)
check_symbol_exists(tmpfile      "${CFG_HEADERS}" HAVE_TMPFILE)
check_symbol_exists(tmpnam       "${CFG_HEADERS}" HAVE_TMPNAM)
check_symbol_exists(tmpnam_r     "${CFG_HEADERS}" HAVE_TMPNAM_R)
check_symbol_exists(truncate     "${CFG_HEADERS}" HAVE_TRUNCATE)
check_symbol_exists(uname        "${CFG_HEADERS}" HAVE_UNAME)
check_symbol_exists(unsetenv     "${CFG_HEADERS}" HAVE_UNSETENV)
check_symbol_exists(utimes       "${CFG_HEADERS}" HAVE_UTIMES)
check_symbol_exists(wait3        "${CFG_HEADERS}" HAVE_WAIT3)
check_symbol_exists(wait4        "${CFG_HEADERS}" HAVE_WAIT4)
check_symbol_exists(waitpid      "${CFG_HEADERS}" HAVE_WAITPID)
check_symbol_exists(wcscoll      "${CFG_HEADERS}" HAVE_WCSCOLL)
check_symbol_exists(_getpty      "${CFG_HEADERS}" HAVE__GETPTY)

check_struct_has_member("struct stat" st_mtim.tv_nsec "${CFG_HEADERS}" HAVE_STAT_TV_NSEC)
check_struct_has_member("struct stat" st_mtimensec "${CFG_HEADERS}"    HAVE_STAT_TV_NSEC2)
check_struct_has_member("struct stat" st_birthtime "${CFG_HEADERS}"    HAVE_STRUCT_STAT_ST_BIRTHTIME)
check_struct_has_member("struct stat" st_blksize "${CFG_HEADERS}"    HAVE_STRUCT_STAT_ST_BLKSIZE)
check_struct_has_member("struct stat" st_blocks  "${CFG_HEADERS}"    HAVE_STRUCT_STAT_ST_BLOCKS)
set(HAVE_ST_BLOCKS ${HAVE_STRUCT_STAT_ST_BLOCKS})
check_struct_has_member("struct stat" st_flags   "${CFG_HEADERS}"    HAVE_STRUCT_STAT_ST_FLAGS)
check_struct_has_member("struct stat" st_gen     "${CFG_HEADERS}"    HAVE_STRUCT_STAT_ST_GEN)
check_struct_has_member("struct stat" st_rdev    "${CFG_HEADERS}"    HAVE_STRUCT_STAT_ST_RDEV)


#######################################################################
#
# Check for various properties of floating point
#
#######################################################################

# Check whether C doubles are little-endian IEEE 754 binary64
set(check_src ${PROJECT_BINARY_DIR}/ac_cv_little_endian_double.c)
file(WRITE ${check_src} "#include <string.h>
int main() {
    double x = 9006104071832581.0;
    if (memcmp(&x, \"\\x05\\x04\\x03\\x02\\x01\\xff\\x3f\\x43\", 8) == 0)
        return 0;
    else
        return 1;
}
")
python_platform_test_run(
  DOUBLE_IS_LITTLE_ENDIAN_IEEE754
  "Checking whether C doubles are little-endian IEEE 754 binary64"
  ${check_src}
  DIRECT
  )

# Check whether C doubles are big-endian IEEE 754 binary64
set(check_src ${PROJECT_BINARY_DIR}/ac_cv_big_endian_double.c)
file(WRITE ${check_src} "#include <string.h>
int main() {
    double x = 9006104071832581.0;
    if (memcmp(&x, \"\\x43\\x3f\\xff\\x01\\x02\\x03\\x04\\x05\", 8) == 0)
        return 0;
    else
        return 1;
}
")
python_platform_test_run(
  DOUBLE_IS_BIG_ENDIAN_IEEE754
  "Checking whether C doubles are big-endian IEEE 754 binary64"
  ${check_src}
  DIRECT
  )

# Check whether C doubles are ARM mixed-endian IEEE 754 binary64
set(check_src ${PROJECT_BINARY_DIR}/ac_cv_mixed_endian_double.c)
file(WRITE ${check_src} "#include <string.h>
int main() {
    double x = 9006104071832581.0;
    if (memcmp(&x, \"\\x01\\xff\\x3f\\x43\\x05\\x04\\x03\\x02\", 8) == 0)
        return 0;
    else
        return 1;
}
")
python_platform_test_run(
  DOUBLE_IS_ARM_MIXED_ENDIAN_IEEE754
  "Checking doubles are ARM mixed-endian IEEE 754 binary64"
  ${check_src}
  DIRECT
  )

# Check whether we can use gcc inline assembler to get and set x87 control word
set(check_src ${PROJECT_BINARY_DIR}/have_gcc_asm_for_x87.c)
file(WRITE ${check_src} "int main() {
  unsigned short cw;
  __asm__ __volatile__ (\"fnstcw %0\" : \"=m\" (cw));
  __asm__ __volatile__ (\"fldcw %0\" : : \"m\" (cw));
}
")
python_platform_test(
  HAVE_GCC_ASM_FOR_X87
  "Checking whether we can use gcc inline assembler to get and set x87 control word"
  ${check_src}
  DIRECT
  )

# Check for x87-style double rounding
set(check_src ${PROJECT_BINARY_DIR}/ac_cv_x87_double_rounding.c)
file(WRITE ${check_src} "#include <stdlib.h>
#include <math.h>
int main() {
    volatile double x, y, z;
    /* 1./(1-2**-53) -> 1+2**-52 (correct), 1.0 (double rounding) */
    x = 0.99999999999999989; /* 1-2**-53 */
    y = 1./x;
    if (y != 1.)
        exit(0);
    /* 1e16+2.99999 -> 1e16+2. (correct), 1e16+4. (double rounding) */
    x = 1e16;
    y = 2.99999;
    z = x + y;
    if (z != 1e16+4.)
        exit(0);
    /* both tests show evidence of double rounding */
    exit(1);
}
")
python_platform_test_run(
  X87_DOUBLE_ROUNDING
  "Checking for x87-style double rounding"
  ${check_src}
  INVERT
  )

#######################################################################
#
# Check for mathematical functions
#
#######################################################################

cmake_push_check_state()

# Check whether tanh preserves the sign of zero
set(check_src ${PROJECT_BINARY_DIR}/ac_cv_tanh_preserves_zero_sign.c)
file(WRITE ${check_src} "#include <math.h>
#include <stdlib.h>
int main() {
    /* return 0 if either negative zeros don't exist
       on this platform or if negative zeros exist
       and tanh(-0.) == -0. */
  if (atan2(0., -1.) == atan2(-0., -1.) ||
      atan2(tanh(-0.), -1.) == atan2(-0., -1.)) exit(0);
  else exit(1);
}
")
python_platform_test_run(
  TANH_PRESERVES_ZERO_SIGN
  "Checking whether tanh preserves the sign of zero"
  ${check_src}
  DIRECT
  )

foreach(func
  acosh asinh atanh copysign erf erfc expm1 finite gamma
  hypot lgamma log1p round tgamma)
  string(TOUPPER ${func} _func_upper)
  check_function_exists(${func} HAVE_${_func_upper})
endforeach()

foreach(decl isinf isnan isfinite)
  string(TOUPPER ${decl} _decl_upper)
  check_symbol_exists(${decl} "math.h" HAVE_DECL_${_decl_upper})
endforeach()

cmake_pop_check_state()
  
#######################################################################
#
# time
#
#######################################################################
check_struct_has_member("struct tm"   tm_zone    "${CFG_HEADERS}"    HAVE_STRUCT_TM_TM_ZONE)
check_struct_has_member("struct tm"   tm_zone    "${CFG_HEADERS}"    HAVE_STRUCT_TM_TM_ZONE)
set(HAVE_TM_ZONE ${HAVE_STRUCT_TM_TM_ZONE})

if(NOT HAVE_STRUCT_TM_TM_ZONE)
  check_variable_exists(tzname HAVE_TZNAME)
else(NOT HAVE_STRUCT_TM_TM_ZONE)
  set(HAVE_TZNAME 0)
endif(NOT HAVE_STRUCT_TM_TM_ZONE)

check_type_exists("struct tm" "sys/time.h" TM_IN_SYS_TIME)

check_c_source_compiles("#include <sys/time.h>\n int main() {gettimeofday((struct timeval*)0,(struct timezone*)0);}" GETTIMEOFDAY_WITH_TZ)

if(GETTIMEOFDAY_WITH_TZ)
  set(GETTIMEOFDAY_NO_TZ 0)
else(GETTIMEOFDAY_WITH_TZ)
  set(GETTIMEOFDAY_NO_TZ 1)
endif(GETTIMEOFDAY_WITH_TZ)

#######################################################################
#
# unicode 
#
#######################################################################

#ucs2
set(PY_UNICODE_TYPE "unsigned short")
set(HAVE_USABLE_WCHAR_T 0)
set(Py_UNICODE_SIZE 2)

if   ("${Py_UNICODE_SIZE}" STREQUAL "${SIZEOF_WCHAR_T}")
  set(PY_UNICODE_TYPE wchar_t)
  set(HAVE_USABLE_WCHAR_T 1)
  message(STATUS "Using wchar_t for unicode")
else ("${Py_UNICODE_SIZE}" STREQUAL "${SIZEOF_WCHAR_T}")

  if   ("${Py_UNICODE_SIZE}" STREQUAL "${SIZEOF_SHORT}")
    set(PY_UNICODE_TYPE "unsigned short")
    set(HAVE_USABLE_WCHAR_T 0)
    message(STATUS "Using unsigned short for unicode")
  else ("${Py_UNICODE_SIZE}" STREQUAL "${SIZEOF_SHORT}")

    if   ("${Py_UNICODE_SIZE}" STREQUAL "${SIZEOF_LONG}")
      set(PY_UNICODE_TYPE "unsigned long")
      set(HAVE_USABLE_WCHAR_T 0)
      message(STATUS "Using unsigned long for unicode")
    else ("${Py_UNICODE_SIZE}" STREQUAL "${SIZEOF_LONG}")

      if(Py_USING_UNICODE)
        message(SEND_ERROR "No usable unicode type found, disable Py_USING_UNICODE to be able to build Python")
      else(Py_USING_UNICODE)
        message(STATUS "No usable unicode type found")
      endif(Py_USING_UNICODE)

    endif("${Py_UNICODE_SIZE}" STREQUAL "${SIZEOF_LONG}")

  endif("${Py_UNICODE_SIZE}" STREQUAL "${SIZEOF_SHORT}")

endif("${Py_UNICODE_SIZE}" STREQUAL "${SIZEOF_WCHAR_T}")




#######################################################################
#
# networking tests
#
#######################################################################
cmake_push_check_state()
set(CFG_HEADERS_SAVE ${CFG_HEADERS})
add_cond(CFG_HEADERS HAVE_NETDB_H netdb.h)
add_cond(CFG_HEADERS HAVE_NETINET_IN_H netinet/in.h)
add_cond(CFG_HEADERS HAVE_ARPA_INET_H arpa/inet.h)

check_symbol_exists(gai_strerror    "${CFG_HEADERS}" HAVE_GAI_STRERROR)
check_symbol_exists(getaddrinfo     "${CFG_HEADERS}" HAVE_GETADDRINFO)
check_symbol_exists(gethostbyname   "${CFG_HEADERS}" HAVE_GETHOSTBYNAME)
#check_symbol_exists(gethostbyname_r "${CFG_HEADERS}" HAVE_GETHOSTBYNAME_R) # see end of file
check_symbol_exists(getnameinfo     "${CFG_HEADERS}" HAVE_GETNAMEINFO)
check_symbol_exists(getpeername     "${CFG_HEADERS}" HAVE_GETPEERNAME)
check_symbol_exists(hstrerror       "${CFG_HEADERS}" HAVE_HSTRERROR)
check_symbol_exists(inet_aton       "${CFG_HEADERS}" HAVE_INET_ATON)
if(NOT HAVE_INET_ATON)
  check_library_exists(resolv inet_aton "" HAVE_LIBRESOLV)
endif(NOT HAVE_INET_ATON)
check_symbol_exists(inet_pton       "${CFG_HEADERS}" HAVE_INET_PTON)

check_type_exists("struct addrinfo" "${CFG_HEADERS}" HAVE_ADDRINFO)
check_struct_has_member(sockaddr sa_len "${CFG_HEADERS}" HAVE_SOCKADDR_SA_LEN )
check_type_exists("struct sockaddr_storage" "${CFG_HEADERS}" HAVE_SOCKADDR_STORAGE)

set(CFG_HEADERS ${CFG_HEADERS_SAVE})
cmake_pop_check_state()


#######################################################################
#
# multithreading stuff
#
#######################################################################
cmake_push_check_state()
set(CFG_HEADERS_SAVE ${CFG_HEADERS})

set(ATHEOS_THREADS 0)
set(BEOS_THREADS 0)
set(C_THREADS 0)
set(HURD_C_THREADS 0)
set(MACH_C_THREADS 0)
set(HAVE_PTH 0) # GNU PTH threads

set(HAVE_PTHREAD_DESTRUCTOR 0) # for Solaris 2.6
add_cond(CFG_HEADERS  HAVE_PTHREAD_H  pthread.h)
add_cond(CMAKE_REQUIRED_LIBRARIES  CMAKE_USE_PTHREADS_INIT  "${CMAKE_THREAD_LIBS_INIT}")

check_symbol_exists(pthread_init "${CFG_HEADERS}" HAVE_PTHREAD_INIT)
check_symbol_exists(pthread_sigmask "${CFG_HEADERS}" HAVE_PTHREAD_SIGMASK)

# For multiprocessing module, check that sem_open actually works.
set(check_src ${PROJECT_BINARY_DIR}/ac_cv_posix_semaphores_enabled.c)
file(WRITE ${check_src} "#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>
#include <semaphore.h>
#include <sys/stat.h>

int main(void) {
  sem_t *a = sem_open(\"/autoconf\", O_CREAT, S_IRUSR|S_IWUSR, 0);
  if (a == SEM_FAILED) {
    perror(\"sem_open\");
    return 1;
  }
  sem_close(a);
  sem_unlink(\"/autoconf\");
  return 0;
}
")
python_platform_test_run(
  POSIX_SEMAPHORES_NOT_ENABLED
  "Checking whether POSIX semaphores are enabled"
  ${check_src}
  DIRECT
  )

# Multiprocessing check for broken sem_getvalue
set(check_src ${PROJECT_BINARY_DIR}/have_broken_sem_getvalue.c)
file(WRITE ${check_src} "#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>
#include <semaphore.h>
#include <sys/stat.h>

int main(void){
  sem_t *a = sem_open(\"/autocftw\", O_CREAT, S_IRUSR|S_IWUSR, 0);
  int count;
  int res;
  if(a==SEM_FAILED){
    perror(\"sem_open\");
    return 1;

  }
  res = sem_getvalue(a, &count);
  sem_close(a);
  sem_unlink(\"/autocftw\");
  return res==-1 ? 1 : 0;
}
")
python_platform_test_run(
  HAVE_BROKEN_SEM_GETVALUE
  "Checking for broken sem_getvalue"
  ${check_src}
  INVERT
  )

set(CFG_HEADERS ${CFG_HEADERS_SAVE})
cmake_pop_check_state()

if(CMAKE_SYSTEM MATCHES BlueGene)
  # Todo: Display message
  set(WITH_THREAD OFF CACHE STRING "System doesn't support multithreading" FORCE)
endif(CMAKE_SYSTEM MATCHES BlueGene)


#######################################################################
#
# readline tests
#
#######################################################################
if(HAVE_READLINE_READLINE_H)
  cmake_push_check_state()
  set(CFG_HEADERS_SAVE ${CFG_HEADERS})

  add_cond(CFG_HEADERS HAVE_READLINE_READLINE_H readline/readline.h)
  add_cond(CMAKE_REQUIRED_LIBRARIES HAVE_LIBREADLINE ${HAVE_LIBREADLINE})
  check_symbol_exists(rl_callback_handler_install "${CFG_HEADERS}" HAVE_RL_CALLBACK)
  check_symbol_exists(rl_catch_signals            "${CFG_HEADERS}" HAVE_RL_CATCH_SIGNAL)
  check_symbol_exists(rl_completion_append_character     "${CFG_HEADERS}" HAVE_RL_COMPLETION_APPEND_CHARACTER)
  check_symbol_exists(rl_completion_display_matches_hook "${CFG_HEADERS}" HAVE_RL_COMPLETION_DISPLAY_MATCHES_HOOK)
  check_symbol_exists(rl_completion_suppress_append      "${CFG_HEADERS}" HAVE_RL_COMPLETION_SUPPRESS_APPEND)
  check_symbol_exists(rl_completion_matches       "${CFG_HEADERS}" HAVE_RL_COMPLETION_MATCHES)
  check_symbol_exists(rl_pre_input_hook           "${CFG_HEADERS}" HAVE_RL_PRE_INPUT_HOOK)

  set(CFG_HEADERS ${CFG_HEADERS_SAVE})
  cmake_pop_check_state()
endif(HAVE_READLINE_READLINE_H)


#######################################################################
#
# curses tests
#
#######################################################################
if(HAVE_CURSES_H)
  cmake_push_check_state()
  set(CFG_HEADERS_SAVE ${CFG_HEADERS})

  set(CFG_HEADERS ${CFG_HEADERS} curses.h)
  add_cond(CMAKE_REQUIRED_LIBRARIES HAVE_LIBCURSES ${HAVE_LIBCURSES})
  check_symbol_exists(is_term_resized "${CFG_HEADERS}" HAVE_CURSES_IS_TERM_RESIZED)
  check_symbol_exists(resizeterm      "${CFG_HEADERS}" HAVE_CURSES_RESIZETERM)
  check_symbol_exists(resize_term     "${CFG_HEADERS}" HAVE_CURSES_RESIZE_TERM)
  check_struct_has_member(WINDOW _flags   "${CFG_HEADERS}" WINDOW_HAS_FLAGS)

  check_c_source_compiles("#include <curses.h>\n int main() {int i; i = mvwdelch(0,0,0);}" MVWDELCH_IS_EXPRESSION)

  set(CFG_HEADERS ${CFG_HEADERS_SAVE})
  cmake_pop_check_state()
endif(HAVE_CURSES_H)


#######################################################################
#
# dynamic loading
#
#######################################################################
if(HAVE_DLFCN_H)
  cmake_push_check_state()
  set(CFG_HEADERS_SAVE ${CFG_HEADERS})

  set(CFG_HEADERS ${CFG_HEADERS} dlfcn.h)
  add_cond(CMAKE_REQUIRED_LIBRARIES HAVE_LIBDL ${HAVE_LIBDL})
  check_symbol_exists(dlopen          "${CFG_HEADERS}" HAVE_DLOPEN)

  set(CFG_HEADERS ${CFG_HEADERS_SAVE})
  cmake_pop_check_state()
endif(HAVE_DLFCN_H)


if(HAVE_DLOPEN) # OR .... )
  set(HAVE_DYNAMIC_LOADING 1)
else(HAVE_DLOPEN)
  set(HAVE_DYNAMIC_LOADING 0)
endif(HAVE_DLOPEN)


#######################################################################
#
# check some types
#
#######################################################################
check_type_exists(gid_t sys/types.h HAVE_GID_T)
if(NOT HAVE_GID_T)
  set(gid_t int)
else(NOT HAVE_GID_T)
  set(gid_t 0)
endif(NOT HAVE_GID_T)

check_type_exists(mode_t sys/types.h HAVE_MODE_T)
if(NOT HAVE_MODE_T)
  set(mode_t int)
else(NOT HAVE_MODE_T)
  set(mode_t 0)
endif(NOT HAVE_MODE_T)

check_type_exists(off_t sys/types.h HAVE_OFF_T)
if(NOT HAVE_OFF_T)
  set(off_t "long int")
else(NOT HAVE_OFF_T)
  set(off_t 0)
endif(NOT HAVE_OFF_T)

check_type_exists(pid_t sys/types.h HAVE_PID_T)
if(NOT HAVE_PID_T)
  set(pid_t int)
else(NOT HAVE_PID_T)
  set(pid_t 0)
endif(NOT HAVE_PID_T)

check_type_exists(size_t sys/types.h HAVE_SIZE_T)
if(NOT HAVE_SIZE_T)
  set(size_t "unsigned int")
else(NOT HAVE_SIZE_T)
  set(size_t 0)
endif(NOT HAVE_SIZE_T)

check_type_exists(socklen_t sys/socket.h HAVE_SOCKLEN_T)
if(NOT HAVE_SOCKLEN_T)
  set(socklen int)
else(NOT HAVE_SOCKLEN_T)
  set(socklen_t 0)
endif(NOT HAVE_SOCKLEN_T)

check_type_exists(uid_t sys/types.h HAVE_UID_T)
if(NOT HAVE_UID_T)
  set(uid_t int)
else(NOT HAVE_UID_T)
  set(uid_t 0)
endif(NOT HAVE_UID_T)

check_type_exists(clock_t time.h HAVE_CLOCK_T)
if(NOT HAVE_CLOCK_T)
  set(clock_t long)
else(NOT HAVE_CLOCK_T)
  set(clock_t 0)
endif(NOT HAVE_CLOCK_T)


check_c_source_compiles("int main() {const int i;}" const_WORKS)
if(NOT const_WORKS)
  set(const 1)
else(NOT const_WORKS)
  set(const 0)
endif(NOT const_WORKS)

check_c_source_compiles("int main() {signed int i;}" signed_WORKS)
if(NOT signed_WORKS)
  set(signed 1)
else(NOT signed_WORKS)
  set(signed 0)
endif(NOT signed_WORKS)

check_c_source_compiles("int main() {volatile int i;}" volatile_WORKS)
if(NOT volatile_WORKS)
  set(volatile 1)
else(NOT volatile_WORKS)
  set(volatile 0)
endif(NOT volatile_WORKS)

if(HAVE_STDARG_PROTOTYPES)
   set(vaargsHeader "stdarg.h")
else(HAVE_STDARG_PROTOTYPES)
   set(vaargsHeader "varargs.h")
endif(HAVE_STDARG_PROTOTYPES)
check_c_source_compiles("#include <${vaargsHeader}>\n int main() {va_list list1, list2; list1 = list2;}" NOT_VA_LIST_IS_ARRAY)
if(NOT_VA_LIST_IS_ARRAY)
  set(VA_LIST_IS_ARRAY 0)
else(NOT_VA_LIST_IS_ARRAY)
  set(VA_LIST_IS_ARRAY 1)
endif(NOT_VA_LIST_IS_ARRAY)


#######################################################################
#
# tests for bugs and other stuff
#
#######################################################################

check_c_source_compiles("
        void f(char*,...)__attribute((format(PyArg_ParseTuple, 1, 2))) {}; 
        int main() {f(NULL);} "
        HAVE_ATTRIBUTE_FORMAT_PARSETUPLE)

set(CMAKE_REQUIRED_INCLUDES ${CFG_HEADERS})
check_c_source_compiles("#include <unistd.h>\n int main() {getpgrp(0);}" GETPGRP_HAVE_ARG)

check_c_source_runs("int main() {
        int val1 = nice(1); 
        if (val1 != -1 && val1 == nice(2)) exit(0);
        exit(1);}" HAVE_BROKEN_NICE)

check_c_source_runs(" #include <poll.h>
    int main () {
    struct pollfd poll_struct = { 42, POLLIN|POLLPRI|POLLOUT, 0 }; close (42);
    int poll_test = poll (&poll_struct, 1, 0);
    if (poll_test < 0) { exit(0); }
    else if (poll_test == 0 && poll_struct.revents != POLLNVAL) { exit(0); }
    else { exit(1); } }" 
    HAVE_BROKEN_POLL)

if(HAVE_SYS_TIME_H)
  check_include_files("sys/time.h;time.h" TIME_WITH_SYS_TIME)
else(HAVE_SYS_TIME_H)
  set(TIME_WITH_SYS_TIME 0)
endif(HAVE_SYS_TIME_H)

if(HAVE_SYS_TIME_H AND HAVE_SYS_SELECT_H)
  check_include_files("sys/select.h;sys/time.h" SYS_SELECT_WITH_SYS_TIME)
else(HAVE_SYS_TIME_H AND HAVE_SYS_SELECT_H)
  set(SYS_SELECT_WITH_SYS_TIME 0)
endif(HAVE_SYS_TIME_H AND HAVE_SYS_SELECT_H)


# Check for broken unsetenv
set(check_src ${PROJECT_BINARY_DIR}/have_broken_unsetenv.c)
file(WRITE ${check_src} "#include <stdlib.h>
int main() {
  int res = unsetenv(\"DUMMY\");
}
")
python_platform_test(
  HAVE_BROKEN_UNSETENV
  "Checking for broken unsetenv"
  ${check_src}
  INVERT
  )

##########################################################

find_package(ZLIB)
if(ZLIB_FOUND)
  cmake_push_check_state()
  set(CFG_HEADERS_SAVE ${CFG_HEADERS})

  set(CFG_HEADERS ${CFG_HEADERS} zlib.h)
  add_cond(CMAKE_REQUIRED_LIBRARIES ZLIB_FOUND ${ZLIB_LIBRARIES})
  check_symbol_exists(inflateCopy      "${CFG_HEADERS}" HAVE_ZLIB_COPY)

  set(CFG_HEADERS ${CFG_HEADERS_SAVE})
  cmake_pop_check_state()
endif(ZLIB_FOUND)

############################################

set(HAVE_OSX105_SDK 0)
if(APPLE)
  # Check for OSX 10.5 SDK or later
  set(check_src ${PROJECT_BINARY_DIR}/have_osx105_sdk.c)
  file(WRITE ${check_src} "#include <Carbon/Carbon.h>
int main(int argc, char* argv[]){FSIORefNum fRef = 0; return 0;}")
  python_platform_test(
    HAVE_OSX105_SDK
    "Checking for OSX 10.5 SDK or later"
    ${check_src}
    DIRECT
    )
endif(APPLE)

# todo 
set(ENABLE_IPV6 1)
set(HAVE_UCS4_TCL 0)
set(HAVE_PROTOTYPES 1)
set(PTHREAD_SYSTEM_SCHED_SUPPORTED 1)
set(HAVE_WORKING_TZSET 1)
set(HAVE_DECL_TZNAME 0) # no test in python sources
set(HAVE_DEVICE_MACROS ${HAVE_MAKEDEV})

set(HAVE_GETHOSTBYNAME_R 0)
set(HAVE_GETHOSTBYNAME_R_3_ARG 0)
set(HAVE_GETHOSTBYNAME_R_5_ARG 0)
set(HAVE_GETHOSTBYNAME_R_6_ARG 0)

endif(WIN32)

# setup the python platform
set(PY_PLATFORM generic)

if(CMAKE_SYSTEM MATCHES Linux)
  set(PY_PLATFORM linux2)
endif(CMAKE_SYSTEM MATCHES Linux)

if(CMAKE_SYSTEM MATCHES Darwin)
  set(PY_PLATFORM darwin)
endif(CMAKE_SYSTEM MATCHES Darwin)

if(CMAKE_SYSTEM MATCHES FreeBSD)
  set(PY_PLATFORM freebsd5)  # which version to use ?
endif(CMAKE_SYSTEM MATCHES FreeBSD)

if(CMAKE_SYSTEM MATCHES NetBSD)
  set(PY_PLATFORM netbsd1)
endif(CMAKE_SYSTEM MATCHES NetBSD)

if(CMAKE_SYSTEM MATCHES AIX)
  set(PY_PLATFORM aix4)
endif(CMAKE_SYSTEM MATCHES AIX)

if(CMAKE_SYSTEM MATCHES BeOS)
  set(PY_PLATFORM beos5)
endif(CMAKE_SYSTEM MATCHES BeOS)

if(CMAKE_SYSTEM MATCHES IRIX)
  set(PY_PLATFORM irix6)
endif(CMAKE_SYSTEM MATCHES IRIX)

if(CMAKE_SYSTEM MATCHES SunOS)
  set(PY_PLATFORM sunos5)
endif(CMAKE_SYSTEM MATCHES SunOS)

if(CMAKE_SYSTEM MATCHES UnixWare)
  set(PY_PLATFORM unixware7)
endif(CMAKE_SYSTEM MATCHES UnixWare)

if(CMAKE_SYSTEM MATCHES Windows)
  set(PY_PLATFORM win32)
endif(CMAKE_SYSTEM MATCHES Windows)
