#!/usr/bin/env bats

T='./test/files/'


@test "unittest: _pdf_pages" {
	[ "$TRAVIS" != 'true' ] || skip
	source ./mscore-to-eps.sh

	[ "$(_pdf_pages "$T"PDF_one-page.pdf)" -eq 1 ]
	[ "$(_pdf_pages "$T"PDF_two-pages.pdf)" -eq 2 ]
}

@test "unittest: _pdftops" {
	[ "$TRAVIS" != 'true' ] || skip
	if command -v pdfcrop > /dev/null 2>&1; then
		source ./mscore-to-eps.sh
		_pdftops "$T"PDF_two-pages.pdf 2
		[ -f "$T"PDF_two-pages_2.eps ]
		rm -f "$T"PDF_two-pages_2.eps
	else
		skip
	fi
}
