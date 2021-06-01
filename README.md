About
===============
It's addition for use with or instead getopts.
It's helps you writing scripts faster.

Sample of script demo_light
-----------------------
    $ cat 0.0.sample_low_help_undefine
    #!/bin/sh

    test1() {
        echo "It's test1 with $# arguments: \"$@\""
    }

    test2() {
        echo "It's test2 with $# arguments: \"$@\""
    }

    . ./argv.low.lib.sh

Samples of valid shell calls
-----------------------
    $ ./0.0.sample_low_help_undefine 
	--test1
	--test2


    $ ./0.0.sample_low_help_undefine --test1 a b
    It's test1 with 2 arguments: "a b"


Conception
===============
How people write large script usually...in my observations:
They write a few lines. After some time they append new strings. 
The exists lines makes some entity and they wrap it into a function.  
Every new entity needs external call. So it needs to have been added into the argument parses.  
**You have to edit argument parses everytime when you make or change entity? - the argv.lib.sh solve it!**  
It work with arguments without your interventions.

All possibilities
===============
Low version can accelerates your work with next functionality:
* **function** call from arguments: 
function have to begin from start of line and first string of the function have to end with `{` like `myfunction () {`
* **argument** of function by arguments: it pass with in default into your function.

Middle version to add to low version:
* **help** creation: just add variable with end **_help** in the name - it automatic will added to the help output.

You can insert library code into end of your script or use link like `. ./argv.mid.lib.sh`. Just see the samples.

Recommendation and calls
===============
Make variable in you script like next `variable=${variable:-"It's default"}`, it's will gave you opportunity to change it in envirement.
You can call it with variables changes `variable1=test ./scriptname function_in_script function_argv`
If you make custom help, use space before name function like ` help() {`

Samples in current directory
===============
    You can found it in current directory.

Status
===============
Stable. Tested on Ubuntu 18.04

Files
===============
* argv.lib.low.sh - library without annotated help
* argv.lib.mid.sh - library with annotated help
* 0.0.sample_low_help_undefine - include external link to lib, without custom help
* 0.1.sample_low_help_undefine - concat script and library, without custom help
* 1.0.sample_low_help_define   - include ex.link to lib, without custom help
* 1.1.sample_low_help_define   - concat script and library, with custom help
* 2.0.sample_mid_annotation_undefine - include ex.link, help lib, without annotation
* 2.1.sample_mid_annotation_undefine - concat with lib, help lib, without annotation
* 3.0.sample_mid_annotation_define   - include ex.link, help lib, with annotation
* 3.1.sample_mid_annotation_define   - concat with lib, help lib, with annotation
* GNUmakefile - it's need for concat src help and low lib to mid version. And test.
* test_reference - only for self tests.


License
======
    MIT License

    Copyright (c) 2021 Anton Riabchevskiy

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
    
