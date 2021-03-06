#!/usr/bin/env bats

setup() {
	. ./test/lib/test-helper.sh
	source_exec mscore-to-eps.sh
}

T='./test/files'

@test "unittest: _pdf_pages" {
	[ "$TRAVIS" != 'true' ] || skip
	[ "$(_pdf_pages $T/PDF_one-page.pdf)" -eq 1 ]
	[ "$(_pdf_pages $T/PDF_two-pages.pdf)" -eq 2 ]
}

@test "unittest: _pdftops" {
	[ "$TRAVIS" != 'true' ] || skip
	if command -v pdfcrop > /dev/null 2>&1; then
		cp $T/PDF_two-pages.pdf $T/PDF_two-pages_tmp.pdf
		_pdftops $T/PDF_two-pages_tmp.pdf 2
		[ -f $T/PDF_two-pages_tmp_2.eps ]
		rm -f $T/PDF_two-pages_tmp.pdf
		rm -f $T/PDF_two-pages_tmp_2.eps
	else
		skip
	fi
}

@test "unittest: _check_for_executable unkown" {
	run _check_for_executable e763978f71116cbe0301d7007d06b2f73cc511b25f58dfc77a496d10830ae186
	[ "$status" -eq 2 ]
	[ "${lines[0]}" = 'Missing binary “e763978f71116cbe0301d7007d06b2f73cc511b25f58dfc77a496d10830ae186”!' ]
}

@test "unittest: _check_for_executable known" {
	run _check_for_executable echo
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = '' ]
}
