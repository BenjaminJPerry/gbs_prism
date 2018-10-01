# ag_gbs_qc_prism.mk prism main makefile
#***************************************************************************************
# references:
#***************************************************************************************
# make: 
#     http://www.gnu.org/software/make/manual/make.html
#

# not part of "all" as expensive
%.taxonomy_analysis:   %.blast_analysis
	$@.sh
	date > $@

# not part of "all" as expensive
%.blast_analysis:   %.fasta_sample
	$@.sh
	date > $@

%.all:  %.kmer_analysis %.bwa_mapping 
	date > $@

%.kmer_analysis:   %.fasta_sample
	$@.sh
	date > $@

%.fasta_sample:   %.unblind
	$@.sh
	date > $@

%.unblind:   %.kgd
	$@.sh
	date > $@

%.kgd:   %.demultiplex
	$@.sh
	date > $@

%.demultiplex:
	$@.sh
	date > $@

%.bwa_mapping:
	$@.sh
	date > $@

##############################################
# specify the intermediate files to keep 
##############################################
.PRECIOUS: %.log %.ag_gbs_qc_prism %.blast_analysis %.kmer_analysis %.kgd %.demultiplex %.all %.fasta_sample

##############################################
# cleaning - not yet doing this using make  
##############################################
clean:
	echo "no clean for now" 

