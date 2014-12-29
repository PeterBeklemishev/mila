Understanding Make -- Background
================================

If you've used make before, you can safely skip this section, which contains a bit of background on using make. 

A makefile is simply a way of associating short names, called targets, with a series of commands to execute when the action is requested. For instance, a common makefile target is "clean," which generally performs actions that clean up after the compiler--removing object files and the resulting executable. 

Make, when invoked from the command line, reads a makefile for its configuration. If not specified by the user, make will default to reading the file "Makefile" in the current directory. Generally, make is either invoked alone, which results in the default target, or with an explicit target. (In all of the below examples, % will be used to indicate the prompt.) 

To execute the default target:

    % make
  
to execute a particular target, such as clean:

    % make clean
  
Besides giving you short build commands, make can check the timestamps on files and determine which ones need to be recompiled; we'll look at this in more detail in the section on targets and dependencies. Just be aware that by using make, you can considerably reduce the number of times you recompile.

Elements of a Makefile
======================

Most makefiles have at least two basic components: macros and target definitions. Macros are useful in the same way constants are: they allow you to quickly change major facets of your program that appear in multiple places. For instance, you can create a macro to substitute the name of your compiler. Then if you move from using gcc to another compiler, you can quickly change your builds with only a one-line change.

Comments
--------

Note that it's possible to include comments in makefiles: simply preface a comment with a pound sign, #, and the rest of the line will be ignored.

Macros
------

Macros are written in a simple x=y form. For instance, to set your C compiler to gcc, you might write:

    CC=gcc
  
To actually convert a macro into its value in a target, you simply enclose it within $(): for instance, to convert CC into the name of the compiler:

    $(CC) a_source_file.c
    
might expand to

    gcc a_source_file.c
    
It is possible to specify one macro in terms of another; for instance, you could have a macro for the compiler options, OPT, and the compiler, CC, combined into a compile-command, COMP:
 
    COMP = $(CC) $(OPT)
    
There are some macros that are specified by default; you can list them by typing

    % make -p
    
For instance, CC defaults to the cc compiler. Note that any environment variables that you have set will be imported as macros into your makefile (and will override the defaults).

Targets
-------

Targets are the heart of what a makefile does: they convert a command-line input into a series of actions. For instance, the "make clean" command tells make to execute the code that follows the "clean" target. Targets have three components: the name of the target, the dependencies of the target, and finally the actions associated with the target:

    target: [dependencies]
        <command>
        <command 2>
        ...

__Note that each command must be proceeded by a tab (yes, a tab, not four, or eight, spaces). Be sure to prevent your text editor from expanding the tabs!__

The dependencies associated with a target are either other targets or files themselves. If they're files, then the target commands will only be executed if any of the dependent files have changed since the last time the command was executed. If the dependency is another target, then that target's commands will be evaluated in the same way. 

A simple command might have no dependencies if you want it to execute all the time. For example, "clean" might look like this:

    clean:
        rm -f *.o core
        
On the other hand, if you have a command to compile a program, you probably want to make the compilation depend on the source files to compile. This might result in a makefile that looks like this:

    CC = gcc
    FILES = in_one.c in_two.c
    OUT_EXE = out_executable

    build: $(FILES)
        $(CC) -o $(OUT_EXE) $(FILES)
        
Now when you type "make build" if the dependencies in_one.c and in_two.c are older than the object files created, then make will reply that there is "nothing to be done." Note that this can be problematic if you leave out a dependency! 

If this were an issue, one option would be to include a target to force a rebuild. This would depend on both the "clean" target and the build target (in that order). The above sample file could be amended to include this:

    CC = gcc
    FILES = in_one.c in_two.c
    OUT_EXE = out_executable

    build: $(FILES)
        $(CC) -o $(OUT_EXE) $(FILES)

    clean:
        rm -f *.o core

    rebuild: clean build
    
Now when rebuild is the target, make will first execute the commands associated with clean and then those associated with build.

When Targets Fail
-----------------

When a target is executed, it returns a status based on whether or not it was successful--if a target fails, then make will not execute any targets that depend on it. For instance, in the above example, if "clean" fails, then rebuild will not execute the "build" target. Unfortunately, this might happen if there is no core file to remove. Fortunately, this problem can be solved easily enough by including a minus sign in front of the command whose status should be ignored:
    
    clean:
        -rm -f *.o core

The Default Target
------------------

Typing "make" alone should generally result in some kind of reasonable behavior. When you type "make" without specifying a target in the corresponding makefile, it will simply execute the first target in the makefile. Note that in the above example, the "build" target was placed above the "clean" target--this is more reasonable (and intuitive) behavior than removing the results of a build when the user types "make"!

Reading Someone Else's Makefile
===============================

I hope that this document is enough to get you started using simple makefiles that help to automate chores or maintain someone else's work. The trick to understanding makefiles is simply to understand all of your compiler's flags--much (though not all) of the crypticness associated with makefiles is simply that they use macros that strip some of the context from an otherwise comprehensible compiler command. Your compiler's documentation can help enormously here. 

The second thing to remember is that when you invoke make, it will expand all of the macros for you--just by running make, it's very easy to see exactly what it will be doing. This can be tremendously helpful in figuring out a cryptic command. 
