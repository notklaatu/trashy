AC_INIT([trashy], [2.5.1], [klaatu@member.fsf.org])
AM_INIT_AUTOMAKE
AC_PROG_CC
AC_CONFIG_FILES([Makefile])
AC_OUTPUT
# provides host_os
AC_CANONICAL_HOST

build_linux=no
build_win=no
build_darwin=no

# Detect target system
case "${host_os}" in
    linux*)
        build_linux=yes
        ;;
    cygwin*|mingw*)
        build_win=yes
        ;;
    darwin*)
        build_darwin=yes
        ;;
    *)
        AC_MSG_ERROR(["OS $host_os is not directly supported, but if you run Bash then you can probably install manually"])
        ;;
esac

# Pass to automake
AM_CONDITIONAL([LINUX], [test "$build_linux" == "yes"])
AM_CONDITIONAL([WIN], [test "$build_win" == "yes"])
AM_CONDITIONAL([DARWIN], [test "$build_darwin" == "yes"])
