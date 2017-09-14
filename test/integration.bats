#!/usr/bin/env bats

T='./test/files/'

@test "execute: mscore-to-eps.sh ${T}no-mscore" {
	run ./mscore-to-eps.sh "$T"no-mscore
	[ "$status" -eq 1 ]
	[ "${lines[0]}" = "No files to convert found!" ]
}

@test "execute: mscore-to-eps.sh -h" {
	run ./mscore-to-eps.sh -h
	[ "$status" -eq 0 ]
	[ "${lines[0]}" = "Usage: mscore-to-eps.sh [-hnsv] [<path>]" ]
}

@test "execute: mscore-to-eps.sh ${T}single-page.mscx" {
	[ "$TRAVIS" != 'true' ] || skip
	run ./mscore-to-eps.sh "$T"single-page.mscx
	[ "$status" -eq 0 ]
	[ -f "$T"single-page.eps ]
	rm -f "$T"single-page.eps
}

@test "execute: mscore-to-eps.sh ${T}multiple-pages.mscx" {
	[ "$TRAVIS" != 'true' ] || skip
	run ./mscore-to-eps.sh "$T"multiple-pages.mscx
	[ "$status" -eq 0 ]
	[ -f "$T"multiple-pages_1.eps ]
	rm -f "$T"multiple-pages_1.eps
	[ -f "$T"multiple-pages_2.eps ]
	rm -f "$T"multiple-pages_2.eps
}

@test "execute: mscore-to-eps.sh ${T}" {
	[ "$TRAVIS" != 'true' ] || skip
	run ./mscore-to-eps.sh "$T"
	[ "$status" -eq 0 ]
	[ -f "$T"single-page.eps ]
	rm -f "$T"single-page.eps
	[ -f "$T"multiple-pages_1.eps ]
	rm -f "$T"multiple-pages_1.eps
	[ -f "$T"multiple-pages_2.eps ]
	rm -f "$T"multiple-pages_2.eps
}
