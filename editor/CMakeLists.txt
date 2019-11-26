project(Editor)

# add_compile_options(-Wall -Wno-reorder -Wno-unknown-pragmas -Wno-multichar -Wno-missing-braces)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt5 REQUIRED Widgets)

set(sources src/main.cpp)
add_executable(${PROJECT_NAME} WIN32 ${sources})

target_link_libraries(${PROJECT_NAME} Qt5::Widgets)

get_target_property(QT5_QMAKE_EXECUTABLE Qt5::qmake IMPORTED_LOCATION)
get_filename_component(QT5_WINDEPLOYQT_EXECUTABLE ${QT5_QMAKE_EXECUTABLE} PATH)
set(QT5_WINDEPLOYQT_EXECUTABLE "${QT5_WINDEPLOYQT_EXECUTABLE}/windeployqt.exe")

set(MODE debug)
message(STATUS "Linking editor in mode = ${MODE}")
add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD COMMAND ${QT5_WINDEPLOYQT_EXECUTABLE} --qmldir ${CMAKE_CURRENT_SOURCE_DIR} $<TARGET_FILE_DIR:${PROJECT_NAME}> --${MODE})
