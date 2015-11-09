#install.packages("seqinr")
library("seqinr")

alignmentGeneious <- read.fasta(file = "Alignment - geneious(fasta).fasta")
primateseq <- alignmentGeneious[[1]]
length(primateseq)
table(primateseq)
primateseq[1:2151]

# GC content = (number of Gs + number of Cs)*100/(genome length)
GCpercent <- (192+232)*100/(139+232+192+139)
GCpercent
GC(primateseq) # This function automatically omits "-"

# Calculate GC content every 500 nucleotides
starts <- seq(1, length(primateseq)-50, by = 50)
starts
for (i in 1:length(starts)) {
  chunk <- primateseq[starts[i]:(starts[i]+49)]
  chunkGC <- GC(chunk)
  print (chunkGC) 
}

# This is a sliding window plot of GC content
Starts <- seq(1, length(primateseq)-50, by = 50)
n <- length(Starts)    # Find the length of the vector "starts"
chunkGCs <- numeric(n) # Make a vector of the same length as vector "starts", but just containing zeroes
for (i in 1:n) {
  Chunk <- primateseq[starts[i]:(starts[i]+49)]
  ChunkGC <- GC(Chunk)
  print(ChunkGC)
  chunkGCs[i] <- ChunkGC
}
plot(starts,chunkGCs,type="b",xlab="Nucleotide start position",ylab="GC content")


