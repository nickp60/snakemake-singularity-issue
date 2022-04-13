# Configuring Snakemake/singularity for acessing remote files
##  Input and outputs

Generate a "remote file":
```
cat << EOF > ~/remote.txt
accession_id    tax_id_species  taxon
NR_163665.1     1973495 k__Bacteria;p__Proteobacteria;c__Gammaproteobacteria;o__Enterobacterales;f__Morganellaceae;g__Proteus;s__Proteus_alimentorum
NR_163664.1     2058287 k__Bacteria;p__Proteobacteria;c__Alphaproteobacteria;o__Rhodobacterales;f__Rhodobacteraceae;g__Aestuariibius;s__Aestuariibius_insulae
NR_163663.1     2050951 k__Bacteria;p__Proteobacteria;c__Alphaproteobacteria;o__Rhodobacterales;f__Rhodobacteraceae;g__Pseudomaribius;s__Pseudomaribius_aestuariivivens
NR_163662.1     2056778 k__Bacteria;p__Proteobacteria;c__Gammaproteobacteria;o__Alteromonadales;f__Colwelliaceae;g__Thalassotalea;s__Thalassotalea_insulae
NR_163661.1     2014887 k__Bacteria;p__Proteobacteria;c__Betaproteobacteria;o__Burkholderiales;f__Oxalobacteraceae;g__Herbaspirillum;s__Herbaspirillum_robiniae
NR_163660.1     1888893 k__Bacteria;p__Proteobacteria;c__Betaproteobacteria;o__Burkholderiales;f__Alcaligenaceae;g__Parvibium;s__Parvibium_lacunae
NR_163659.1     1912871 k__Bacteria;p__Proteobacteria;c__Epsilonproteobacteria;o__Campylobacterales;f__Campylobacteraceae;g__Arcobacter;s__Arcobacter_canalis
NR_163658.1     2026199 k__Bacteria;p__Proteobacteria;c__Betaproteobacteria;o__Burkholderiales;f__Burkholderiaceae;g__Paraburkholderia;s__Paraburkholderia_aromaticivorans
NR_163657.1     2049468 k__Bacteria;p__Proteobacteria;c__Alphaproteobacteria;o__Rhodobacterales;f__Rhodobacteraceae;g__Paracoccus;s__Paracoccus_alimentarius
EOF
```

generate a local input file:
```
echo -e "metric\tvalue\na\t1" > blast_hits.csv
```

create a conda env:
```
conda create -n thisenv r-base
``

## Running the pipeline
```

snakemake -c 1  -j 1 --use-singularity  --use-conda  --config blast=$PWD/blast_hits.csv  anno=$HOME/remote.txt  --directory ./results/ --keep-going
```

## Solution 1: Running with remote location:
```
snakemake -c 1  -j 1 --use-singularity  --use-conda  --config blast=$PWD/blast_hits.csv  anno=$HOME/remote.txt  --directory ./results/ --keep-going --singularity-args "-B HOME"
```

## Solution 2: Hard-linking
