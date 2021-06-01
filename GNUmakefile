all: argv.low.lib.sh argv.mid.lib.sh   \
	0.1.sample_small_help_undefine     \
	1.1.sample_low_help_define         \
	2.1.sample_mid_annotation_undefine \
	3.1.sample_mid_annotation_define   \
	test

argv.low.lib.sh:
	@cp argv_src/argv.low.lib.sh argv.low.lib.sh

argv.mid.lib.sh:
	@echo "Concate help with low to make mid lib."
	@cat argv_src/argv.help.lib.sh > argv.mid.lib.sh
	@cat argv_src/argv.low.lib.sh >> argv.mid.lib.sh

argv.lib: argv.low.lib.sh argv.mid.lib.sh

0.1.sample_small_help_undefine:
	@echo "Embed lib to 0.0.sample_low_help_undefine."
	@cat 0.0.sample_low_help_undefine | sed '/argv.low.lib.sh/d' > 0.1.sample_low_help_undefine
	@cat argv.low.lib.sh >> 0.1.sample_low_help_undefine

1.1.sample_low_help_define:
	@echo "Embed lib to file 1.0.sample_low_help_define."
	@cat 1.0.sample_low_help_define | sed '/argv.low.lib.sh/d' > 1.1.sample_low_help_define
	@cat argv.low.lib.sh >> 1.1.sample_low_help_define

2.1.sample_mid_annotation_undefine:
	@echo "Embed lib to file 2.0.sample_mid_annotation_undefine."
	@cat 2.0.sample_mid_annotation_undefine | sed '/argv.mid.lib.sh/d' > 2.1.sample_mid_annotation_undefine
	@cat argv.mid.lib.sh >> 2.1.sample_mid_annotation_undefine

3.1.sample_mid_annotation_define:
	@echo "Embed lib to file 3.0.sample_mid_annotation_define."
	@cat 3.0.sample_mid_annotation_define | sed '/argv.mid.lib.sh/d' > 3.1.sample_mid_annotation_define
	@cat argv.mid.lib.sh >> 3.1.sample_mid_annotation_define

4.1.sample_low_default_other:
	@echo "Embed lib to file 4.0.sample_low_default_other."
	@cat 4.0.sample_low_default_other | sed '/argv.mid.lib.sh/d' > 4.1.sample_low_default_other
	@cat argv.mid.lib.sh >> 4.1.sample_low_default_other

5.1.sample_mid_default_other:
	@echo "Embed lib to file 5.0.sample_mid_default_other."
	@cat 5.0.sample_mid_default_other | sed '/argv.mid.lib.sh/d' > 5.1.sample_mid_default_other
	@cat argv.mid.lib.sh >> 5.1.sample_mid_default_other


test_eval: argv.low.lib.sh argv.mid.lib.sh
	@echo "Run tests eval"
	@mkdir -p test_output
	@chmod +x *.sample*
	@find ./ -maxdepth 1 -name '*.sample*' | sed -r 's#^\./(.*)$$#./\1 > test_output/\1#' | sh

test_validation:
	@printf "Validate test result..."
	@rm test_result 2>/dev/null || return 0
	@ls test_output/ | sed -r 's#^(.*)$$#diff -u test_output/\1 test_reference/\1 >> test_result#' | sh
	@test -s ./test_result \
		&& printf "ERROR. \nOutput does not eqvivalent reference. See file test_output!\n" \
		|| echo "OK" && return 0

test: test_eval test_validation

clean:
	@echo "Remove test result."
	@rm -r test_output 2>/dev/null || return 0 
	@rm test_result 2>/dev/null || return 0 

clean_all: clean
	@echo "Remove samples with embeded lib."
	@rm argv.mid.lib.sh                    2>/dev/null || return 0 
	@rm argv.low.lib.sh                    2>/dev/null || return 0 
	@rm 0.1.sample_low_help_undefine       2>/dev/null || return 0 
	@rm 1.1.sample_low_help_define         2>/dev/null || return 0 
	@rm 2.1.sample_mid_annotation_undefine 2>/dev/null || return 0 
	@rm 3.1.sample_mid_annotation_define   2>/dev/null || return 0 
	@rm 4.1.sample_low_default_other       2>/dev/null || return 0
	@rm 5.1.sample_mid_default_other       2>/dev/null || return 0 