cmake_minimum_required(VERSION 3.14)

project(Thermostat_UI LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# QtCreator supports the following variables for Android, which are identical to qmake Android variables.
# Check https://doc.qt.io/qt/deployment-android.html for more information.
# They need to be set before the find_package(...) calls below.

#if(ANDROID)
#    set(ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android")
#    if (ANDROID_ABI STREQUAL "armeabi-v7a")
#        set(ANDROID_EXTRA_LIBS
#            ${CMAKE_CURRENT_SOURCE_DIR}/path/to/libcrypto.so
#            ${CMAKE_CURRENT_SOURCE_DIR}/path/to/libssl.so)
#    endif()
#endif()

find_package(QT NAMES Qt6 Qt5 COMPONENTS Core Quick REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Core Quick REQUIRED)

SET(SRC_DIR "${PROJECT_SOURCE_DIR}/Controllers")

include_directories("${SRC_DIR}")

file(GLOB HEADER_FILES "${SRC_DIR}/*.h")
file(GLOB SRC_FILES "${SRC_DIR}/*.cpp")

set(PROJECT_SOURCES
        main.cpp
        qml.qrc
        ${HEADER_FILES}
        ${SRC_FILES}
)

if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
    qt_add_executable(Thermostat_UI
        ${PROJECT_SOURCES}
    )
else()
    if(ANDROID)
        add_library(Thermostat_UI SHARED
            ${PROJECT_SOURCES}
        )
    else()
        add_executable(Thermostat_UI
          ${PROJECT_SOURCES}
        )
    endif()
endif()

target_compile_definitions(Thermostat_UI
  PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(Thermostat_UI
  PRIVATE Qt${QT_VERSION_MAJOR}::Core Qt${QT_VERSION_MAJOR}::Quick)
