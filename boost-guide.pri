# This file is used by ALL recipes and it contains ...

# ... QMake specific settings that shall not be modified
TEMPLATE = app
CONFIG += console
CONFIG -= qt
CONFIG += thread

# ... and a big portion of settings that reader may modify:

DEVHOME = $$(BOOST_PATH)
isEmpty(BOOST_PATH) {
    # Path to the Boost.
    BOOST_PATH = C:/Boost
}

# Compiler to use (comment out to use default one).
#QMAKE_CXX = clang++

# Paths to boost headers and libraries
# (if you are using Linux and installed Boost from repository you may comment out those lines).
INCLUDEPATH += $$BOOST_PATH/include/boost-1_70
QMAKE_RPATHDIR += $$BOOST_PATH/lib

# Boost specific defines.
#DEFINES += BOOST_THREAD_VERSION=4
#DEFINES += BOOST_ASIO_DISABLE_STD_ATOMIC=1          # Workaround for GCC-4.6 issues with atomics
#DEFINES += BOOST_ASIO_DISABLE_HANDLER_TYPE_REQUIREMENTS=1 # Workaround for move-only functors support for ASIO

# Flags to set your compiler into C++03/C++11/C++14 mode.
msvc {
    # MSVC compilers
    CPP03FLAG =
    CPP11FLAG =
    CPP14FLAG =
} else {
    # all other compilers
    CPP03FLAG = -std=c++03
    CPP11FLAG = -std=c++0x
    CPP14FLAG = -std=c++14
}

# Disabling some annoing warnings and adding paths to the Boost libraries.
msvc {
    QMAKE_LFLAGS += /LIBPATH:$$BOOST_PATH/lib
    DEFINES += _CRT_SECURE_NO_WARNINGS
} else {
    LIBS += -L$$BOOST_PATH/lib
    QMAKE_CXXFLAGS += -Wno-deprecated-declarations -Wno-unused-variable
}
