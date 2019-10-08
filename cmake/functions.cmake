# В текущей версии CMake не может включить режим C++17 в некоторых компиляторах.
# Функция использует обходной манёвр.
function(custom_enable_cxx17 TARGET)
    # Включаем C++17 везде, где CMake может.
	target_compile_features(${TARGET} PUBLIC cxx_std_17)
endfunction(custom_enable_cxx17)

# Функция добавляет цель-библиотеку.
function(custom_add_library_from_dir TARGET)
    # Собираем файлы с текущего каталога
    file(GLOB TARGET_SRC "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp" "${CMAKE_CURRENT_SOURCE_DIR}/*.h")
    add_library(${TARGET} ${TARGET_SRC})
endfunction()

# Функция добавляет цель исполняемого файла.
function(custom_add_executable_from_dir TARGET)
    # Собираем файлы с текущего каталога
    file(GLOB TARGET_SRC "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp" "${CMAKE_CURRENT_SOURCE_DIR}/*.h")
    add_executable(${TARGET} ${TARGET_SRC})
endfunction()

# Функция добавляет цель исполняемого файла, содержащего тесты библиотеки.
function(custom_add_test_from_dir TARGET LIBRARY)
    custom_add_executable_from_dir(${TARGET})
    # Добавляем путь к заголовку фреймворка Catch
    target_include_directories(${TARGET} PRIVATE "${CMAKE_SOURCE_DIR}/libs/catch")
    # Добавляем компоновку с проверяемой библиотекой
    target_link_libraries(${TARGET} ${LIBRARY})
    # Регистрируем исполняемый файл в CMake как набор тестов.
    add_test(${TARGET} ${TARGET})
endfunction()
