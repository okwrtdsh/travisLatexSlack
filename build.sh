#!/bin/bash -eu

rm -rf $OUTPUT_DIR
mkdir $OUTPUT_DIR
current=$(pwd)

for fpath in `find . -name "*.tex"`; do
	dname=$(dirname $fpath)
	froot=${fpath%.*}
	name=${froot##*/}
	platex -output-directory=$dname $froot
	cd $dname
	pbibtex -kanji=utf8 $name
	cd $current
	platex -output-directory=$dname $froot
	platex -output-directory=$dname $froot
	dvipdfmx -o "$OUTPUT_DIR/${name}_$(date "+%Y%m%d%H%M%S").pdf" $froot
done

cd $OUTPUT_DIR
echo "# LIST" > README.md
ls *.pdf | sort | sed -e 's/^\(.*\)_[0-9]*\.pdf/* [\1](.\/\0)/g' >> README.md
