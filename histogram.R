words <- readLines(con = "words.txt")

lengths <- nchar(words)

freq <- table(lengths)
write.table(freq,
						file = "histogram.tsv",
						col.names = c("Length","Freq"),
						sep="\t",
						row.names = FALSE,
						quote = FALSE
						)

