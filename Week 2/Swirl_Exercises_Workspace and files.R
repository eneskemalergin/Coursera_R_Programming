# Swirl practice :>

getwd() # Function shows the current directory.
ls() # Shows all the objects in local worksapce
list.files() # Will show every file in working directory

list.files(recursive = TRUE) # Will show also inside zip files.
dir.create("testdir") # Creates folder called "testdir"

setwd("testdir") # set my new current directory in testdir.
file.create("mytest.R") # Try to create file here
#[1] FALSE
#Warning message:
#  In file.create("mytest.R") :
#  cannot create file 'mytest.R', reason 'Permission denied'
# This proves that we create a file.
list.files()
# [1] "mytest.R"

file.exists("mytest.R") # Checks if the file exists or not
# [1] TRUE

file.info("mytest.R")  # Returns the info about the file

file.rename("mytest.R", "mytest2.R") # Changes the file name 1st argument is old name 2nd argument is new name

file.copy("mytest2.R", "mytest3.R") # Make another copy and rename it mytest3.R

file.path("mytest3.R") # provides the full path to the file

# Create a directory in the current working directory called "testdir2"
# and a subdirectory for it called "testdir3", all in one command.
