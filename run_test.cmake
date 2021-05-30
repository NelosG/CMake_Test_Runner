#run_test.cmake will run your program by feeding your ${input} or the contents of an ${input_file} to stdin
#and compare its output on stdout with the ${result} or contents of the ${result_file}
#
#usage:
#
#   add_test(<Name of test>
#           ${CMAKE_COMMAND}
#           -D "test_cmd=<run your program>"
#
#           #it is possible not to specify
#           [-D "args=<some args...>"]
#
#           #you must specify at least 1, if ${input_file} is defined ${input} will be ignored
#           [-D "input=<some input ...>"] or [-D "input_file=<path to input file>"]
#
#           #you must specify at least 1, if ${result} is defined ${result_file} will be ignored
#           [-D "result=<some output...>"] or [-D "result_file=<path to result file>"]
#
#           -P <path to run_test.cmake>
#           )



#Check variables
if( NOT test_cmd )
    message( FATAL_ERROR "Variable test_cmd not defined" )
endif( NOT test_cmd )

if( NOT result )
    if( NOT result_file )
        message( FATAL_ERROR "Result not defined" )
    else()
        file(READ ${result_file} result)
    endif()
endif( NOT result)

if( NOT input_file )
    if( NOT input )
        message( FATAL_ERROR "Variables input_test_file and input not defined" )
    else()
        #create input_file with your input (it will be removed at the end)
        set(input_file ${CMAKE_BINARY_DIR}/input.txt)
        set(DEL 1)
        file(WRITE ${input_file} ${input})
    endif()
endif( NOT input_file )

# convert the space-separated string to a list
separate_arguments( args )

#set output_file
set(output_test ${CMAKE_BINARY_DIR}/result.txt)

#run executable
execute_process(
        COMMAND cmd /c "${test_cmd} ${args} < ${input_file} > ${output_test}"
)

#clean
file(READ ${output_test} out)
file(REMOVE ${output_test})
if( DEL)
    file(REMOVE ${input_file})
endif()

#delete whitespaces in the begin and end of string
string(STRIP ${out} output)
string(STRIP ${result} result)

#compare strings
if( NOT "${output}" STREQUAL "${result}" )
    message( SEND_ERROR "Output does not match result!" )
endif( NOT "${output}" STREQUAL "${result}" )