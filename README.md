# CMake_Test_Runner

### Put the following text in your CMake file:

	if(EXISTS "${CMAKE_BINARY_DIR}/test_runner/run_test.cmake")
		execute_process(COMMAND git pull
				RESULT_VARIABLE result
				WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/test_runner)
	else()
		execute_process(COMMAND git clone --sparse https://github.com/NelosG/CMake_Test_Runner.git test_runner
				RESULT_VARIABLE result
				WORKING_DIRECTORY ${CMAKE_BINARY_DIR})
	endif()

	if(result)
		message(FATAL_ERROR "CMake step for test_runner failed: ${result}")
	endif()

	set(path_to_test_runner "${CMAKE_BINARY_DIR}/test_runner/run_test.cmake")


### Usage: 
    add_test(<Name of test>
            ${CMAKE_COMMAND}
            -D "test_cmd=<run your program>"
    
            #it is possible not to specify
            [-D "args=<some args...>"]
    
            #you must specify at least 1, if ${input_file} is defined ${input} will be ignored
            [-D "input=<some input ...>"] or [-D "input_file=<path to input file>"]
    
            #you must specify at least 1, if ${result} is defined ${result_file} will be ignored
            [-D "result=<some output...>"] or [-D "result_file=<path to result file>"]
    
            -P ${path_to_test_runner}
        )
