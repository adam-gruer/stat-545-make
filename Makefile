all: words.txt histogram.tsv


clean:
	rm -f words.txt
	rm -f histogram.tsv

words.txt:	/usr/share/dict/words
				cp $< $@

histogram.tsv:	histogram.r words.txt
	Rscript $<
				