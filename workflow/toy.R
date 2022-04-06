inf <- snakemake@input[["annotation"]]
outf <- snakemake@output[["annotations"]]

tmp <- read.csv(inf, sep = "\t", header = TRUE)
write.table(tmp, outf, sep = "\t", row.names = FALSE)
