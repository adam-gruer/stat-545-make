.PHONY: all clean
.DELETE_ON_ERROR:
.SECONDARY:

all:  report.html


clean:
	rm -f words.txt histogram.tsv histogram.png report.html


words.txt:	/usr/share/dict/words
				cp $< $@

histogram.tsv:	histogram.r words.txt
	Rscript $<
	
histogram.png: histogram.tsv
	Rscript -e 'library(ggplot2); qplot(Length,Freq, data=read.delim("$<")); ggsave("$@")'
	rm Rplots.pdf	

report.html: report.rmd histogram.tsv histogram.png				
	Rscript -e 'Sys.setenv("RSTUDIO_PANDOC" = "/Applications/RStudio.app/Contents/MacOS/pandoc"); rmarkdown::render("$<",clean = FALSE)'
