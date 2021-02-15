library (tidyverse)
library(kableExtra)


#Take the nucleotide and animo acid sequence 
#use expasy tool to convert nt to amino acid sequence 
#then copy both nt and amino acid sequence from the expasy too
#because expasy will remove all the whitespace and sequence will be a string
#of one line.So, youdont have to worry about the white space
nt_sequence <-"aaabbbcccdddeeefffggghhhiiijjjkkk"

aa_sequence <- "PQRSTUVWXYZ"


nchar(nt_sequence)
nchar(aa_sequence)

aa_number= c()
aa_letter=c()
nt_position=c()
nt=c()

codon_counter=1
for (i in 1:nchar(aa_sequence)){
  
  amino_acid_number= i
  aa_number=append(aa_number, amino_acid_number)
  
  amino_acid_letter = str_sub(aa_sequence,i,i)
  aa_letter=append (aa_letter,amino_acid_letter)
  
  nucleotide_position= paste(codon_counter,"-",codon_counter+2)
  nt_position=append (nt_position,nucleotide_position)
  
  codon= str_sub(nt_sequence,codon_counter,codon_counter+2)
  nt=append (nt,codon)
  
  codon_counter=codon_counter+3
  
  #print (amino_acid_number)
  #print(amino_acid_letter)
  #print (nucleotide_position)
  #print (codon)
  #print(codon_counter)
}


table <- data.frame (aa_number,aa_letter,nt_position,nt)

kbl(table) %>%
  kable_paper(bootstrap_options = "striped", full_width = F,
              position = "left",
              font_size=14
              )
