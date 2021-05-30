cmake_minimum_required(VERSION 3.13)

find_package(Java REQUIRED)
project(example)

set(CMAKE_CXX_STANDARD 17)


add_executable(A A.cpp)
set(JAVA_SOURCE B.java)
add_executable(C C.cpp)



include(UseJava)

add_jar(Algos_JAVA ${JAVA_SOURCE})

get_target_property(_jarFile Algos_JAVA JAR_FILE)
get_target_property(_classDir Algos_JAVA CLASSDIR)


set(test_java "${Java_JAVA_EXECUTABLE} -cp ${_jarFile}")


#example
enable_testing()

set(path_to_test_runner ${CMAKE_SOURCE_DIR}/../run_test.cmake)

add_test(TestA
        ${CMAKE_COMMAND}
        -D test_cmd=${CMAKE_BINARY_DIR}/A.exe
        -D input=60
        -D "result=2 2 3 5"
        -P ${path_to_test_runner}
        )

add_test(TestB
        ${CMAKE_COMMAND}
        -D "test_cmd=${test_java} B"
        -D input_file=${CMAKE_SOURCE_DIR}/tests_files/input_file.txt
        -D result_file=${CMAKE_SOURCE_DIR}/tests_files/expected_output_file.txt
        -P ${path_to_test_runner}
        )

add_test(TestC
        ${CMAKE_COMMAND}
        -D test_cmd=${CMAKE_BINARY_DIR}/C.exe
        -D "input=3 2 5 9"
        -D result=38
        -P ${path_to_test_runner}
        )
