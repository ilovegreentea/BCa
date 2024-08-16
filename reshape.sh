#!/bin/bash
# For correct error of scanneo2

if [ -z "$1" ]; then
  echo "Please provide the sample name."
  echo "Usage: ./script.sh <sample_name>"
  exit 1
fi

# Set the sample name from the first argument
SAMPLE_NAME=$1

# Create the samples.txt file with the sample name
echo -e "unknown\t${SAMPLE_NAME}" > samples.txt

# Reheader the VCF files with the new sample name
bcftools reheader -s samples.txt -o results/${SAMPLE_NAME}/rnaseq/indel/mutect2/rna_tumor_somatic.short.indels.reheader.vcf.gz results/${SAMPLE_NAME}/rnaseq/indel/mutect2/rna_tumor_somatic.short.indels.vcf.gz
mv results/${SAMPLE_NAME}/rnaseq/indel/mutect2/rna_tumor_somatic.short.indels.reheader.vcf.gz results/${SAMPLE_NAME}/rnaseq/indel/mutect2/rna_tumor_somatic.short.indels.vcf.gz

bcftools reheader -s samples.txt -o results/${SAMPLE_NAME}/dnaseq/indel/mutect2/dna_tumor_somatic.short.indels.reheader.vcf.gz results/${SAMPLE_NAME}/dnaseq/indel/mutect2/dna_tumor_somatic.short.indels.vcf.gz
mv results/${SAMPLE_NAME}/dnaseq/indel/mutect2/dna_tumor_somatic.short.indels.reheader.vcf.gz results/${SAMPLE_NAME}/dnaseq/indel/mutect2/dna_tumor_somatic.short.indels.vcf.gz

# Remove the temporary samples.txt file
rm samples.txt
