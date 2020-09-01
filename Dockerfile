# Inheritance from bioconductor docker
FROM bioconductor/bioconductor_docker:RELEASE_3_11

LABEL name="bocker" \
      version="0.0.1" \
      url="https://github.com/Alanocallaghan/bocker" \
      maintainer="alan.ocallaghan@outlook.com" \
      description="Docker image containing BASiCS and related packages" \
      license="GPL-3"

# Update apt-get
# Follows Bioc suggestion, required to compile Rmarkdown into pdf
RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
    apt-utils \
	texlive \
	texlive-latex-extra \
	texlive-fonts-extra \
	texlive-bibtex-extra \
	texlive-science \
	texi2html \
	texinfo \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

# Trying to fix rmarkdown issue	
RUN touch /home/rstudio/.Rprofile

RUN Rscript -e 'install.packages(c( \
  "bit64", \
  "coda", \
  "knitr", \
  "ggplot2", \
  "ggpointdensity", \
  "rmarkdown", \
  "RSQLite", \
  "reshape2", \
  "magick", \
  "patchwork", \
  "hexbin"), Ncpus = 4)'

RUN Rscript -e 'BiocManager::install(c( \
  "AnnotationDbi", \
  "BASiCS", \
  "BiocStyle", \
  "biomaRt", \
  "EnsDb.Mmusculus.v79", \
  "GenomicFeatures", \
  "goseq", \
  "org.Mm.eg.db", \
  "scran", \
  "ComplexHeatmap", \
  "scater", \
  "SingleCellExperiment", \
  "BiocWorkflowTools"), Ncpus = 4)'

RUN Rscript -e 'devtools::install_github("catavallejos/BASiCS")'
