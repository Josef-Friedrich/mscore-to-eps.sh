[![Build Status](https://travis-ci.org/JosefFriedrich-shell/mscore-to-eps.sh.svg?branch=master)](https://travis-ci.org/JosefFriedrich-shell/mscore-to-eps.sh)

# mscore-to-eps.sh


## Summary / Short description

> Convert MuseScore files (*.mscz, *.mscx) to the EPS file format.

## Usage

```
Usage: skeleton.sh [-h] [-n] [<path>]

Convert MuseScore files (*.mscz, *.mscx) to the EPS file format.

Convert MuseScore files to eps using 'pdfcrop' and 'pdftops' or
'Inkscape'. If <path> is omitted, all MuseScore files in the
current working directory are converted. <path> can be either a
directory or a MuseScore file.

DEPENDENCIES
	'pdfcrop' (included in TeXlive) and 'pdftops' (Poppler tools) or
	'Inkscape'

OPTIONS
	-h, --help	Show this help message.
	-n, --no-clean 	Do not remove / clean intermediate
	                *.pdf files
```

## Project pages

* https://github.com/JosefFriedrich-shell/mscore-to-eps.sh

## Testing

```
make test
```

