
Identical to "small-quiver-test.t" but using the NoQVs model.

  $ export DATA=$TESTDIR/../data
  $ export INPUT=$DATA/hcv/aligned_reads.cmp.h5
  $ export REFERENCE=$DATA/hcv/HCV_Ref_For_187140.fasta

Quiver actually makes one error here, which is kind of disappointing,
but this data is from a really ancient instrument-software version, so
I'm not all that surprised.

  $ quiver -pC2.NoQVsModel -x0 -q0 $INPUT -r $REFERENCE -o v.gff -o v.vcf -o css.fa -o css.fq

  $ cat v.gff | tr '\t' ' '
  ##gff-version 3
  ##pacbio-variant-version 2.1
  ##date * (glob)
  ##feature-ontology http://song.cvs.sourceforge.net/*checkout*/song/ontology/sofa.obo?revision=1.12
  ##source GenomicConsensus * (glob)
  ##source-commandline * (glob)
  ##source-alignment-file * (glob)
  ##source-reference-file * (glob)
  ##sequence-region 5primeEnd 1 156
  ##sequence-region 3primeEnd 1 386
  3primeEnd . deletion 296 296 . . . reference=G;variantSeq=.;coverage=92;confidence=4
  3primeEnd . deletion 369 369 . . . reference=G;variantSeq=.;coverage=83;confidence=6

  $ cat v.vcf | tr '\t' ' '
  ##fileformat=VCFv4.2
  ##fileDate=* (glob)
  ##source=GenomicConsensusV* (glob)
  ##reference=file://* (glob)
  ##contig=<ID=5primeEnd,length=156>
  ##contig=<ID=3primeEnd,length=386>
  ##INFO=<ID=DP,Number=1,Type=Integer,Description="Approximate read depth; some reads may have been filtered">
  #CHROM POS ID REF ALT QUAL FILTER INFO
  3primeEnd 295 . TG T 4 PASS DP=92
  3primeEnd 368 . AG A 6 PASS DP=83

  $ cat css.fa
  >5primeEnd|quiver
  GGAACCGGTGAGTACACCGGAATTGCCAGGACGACCGGGTCCTTTCGTGGATAAACCCGC
  TCAATGCCTGGAGATTTGGGCGTGCCCCCGCAAGACTGCTAGCCGAGTAGTGTTGGGTCG
  CGAAAGGCCTTGTGGTACTGCCTGATAGGGTGCTTG
  >3primeEnd|quiver
  TACCTGGTCATAGCCTCCGTGAAGGCTCTCAGGCTCGCTGCATCCTCCGGGACTCCCTGA
  CTTTCACAGATAACGACTAAGTCGTCGCCACACACGAGCATGGTGCAGTCCTGGAGCCCA
  GCGGCTCGACAGGCTGCTTTGGCCTTGATGTAGCAGGTGAGGGTGTTACCACAGCTGGTC
  GTCAGTACGCCGCTCGCGCGGCACCTGCGATAGCCGCAGTTTTCCCCCCTTGAATTAGTA
  AGAGGGCCCCCGACATAGAGCCTCTCGGTGAGGGACTTGATGGCCACGCGGGCTTGGGGT
  CCAGGTCACAACATTGGTAAATTGCCTCCTCTGTACGGATATCGCTCTCAGTGACTGTGG
  AGTCAAACAGCGGGTATCATACGA

  $ cat css.fq
  @5primeEnd|quiver
  GGAACCGGTGAGTACACCGGAATTGCCAGGACGACCGGGTCCTTTCGTGGATAAACCCGCTCAATGCCTGGAGATTTGGGCGTGCCCCCGCAAGACTGCTAGCCGAGTAGTGTTGGGTCGCGAAAGGCCTTGTGGTACTGCCTGATAGGGTGCTTG
  +
  "POPOPOPOOOOOOOOOPLPKPOPOOPOOPOOOOKPOPPOLPOPPOOOOPOOOPPOPPOOOOOPOOOPOOPOOOOPPFPPOOOO5PPPPOOOPOOOOOOOOOOPOOOOOOOOOPOPPOOOOOOPPOPOPOPOOOPOOOOOOPOOOOOOPPOOOOPO
  @3primeEnd|quiver
  TACCTGGTCATAGCCTCCGTGAAGGCTCTCAGGCTCGCTGCATCCTCCGGGACTCCCTGACTTTCACAGATAACGACTAAGTCGTCGCCACACACGAGCATGGTGCAGTCCTGGAGCCCAGCGGCTCGACAGGCTGCTTTGGCCTTGATGTAGCAGGTGAGGGTGTTACCACAGCTGGTCGTCAGTACGCCGCTCGCGCGGCACCTGCGATAGCCGCAGTTTTCCCCCCTTGAATTAGTAAGAGGGCCCCCGACATAGAGCCTCTCGGTGAGGGACTTGATGGCCACGCGGGCTTGGGGTCCAGGTCACAACATTGGTAAATTGCCTCCTCTGTACGGATATCGCTCTCAGTGACTGTGGAGTCAAACAGCGGGTATCATACGA
  +
  "8<=A:@NNOOOOOPOKPOOOOPFPOIOOOOKPOOOOOOOOOOKPOFP>PPOOO5PPOOOOJPPOOOOOOONPOOOOOOPOOOOOOOOPOOOOOOOOOOOONPOOOOOONPOOPOO>PPOOOKPOOOOOOOOPOOOOOPPNPNPOPOONOOOOOOOPOOOJPPOOOPOOPOOOOOOOPOOOOOOOOOOOOPOOOOOOOOOPOOOPOOOOOOOONPOOOOEPPP(PPPPPOPOOPOPOOOOPOOOPP0PPPPOOOOOOOOOOPOOOOOPOOOLPPOOOPOOONPOPOOOONPPOOP%PPPOKPOOPOOOOOPOOOPOPOOPPOPOOPONPOOOOOOOOPOOOOOOOOOOOOOOOOOOOOMPOOOO*PP'OOOGPPO??OOOOKF@
