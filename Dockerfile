FROM bioconductor/bioconductor_docker:RELEASE_3_17

LABEL name="basicsworkflow2020-docker" \
      version="0.4.0" \
      url="https://github.com/Alanocallaghan/bocker" \
      maintainer="alan.ocallaghan@outlook.com" \
      description="Docker image containing BASiCS and related packages" \
      license="GPL-3"

RUN apt-get update

RUN apt-get install -y --no-install-recommends \
    apt-utils \
    libssh2-1-dev \
    texlive \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-bibtex-extra \
    texlive-science \
    texi2html \
    texinfo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN Rscript -e 'BiocManager::install(c( \
    "readxl", \
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
    "tidyr", \
    "hexbin", \
    "AnnotationDbi", \
    "BASiCS", \
    "BiocStyle", \
    "biomaRt", \
    "EnsDb.Mmusculus.v79", \
    "GenomicFeatures", \
    "org.Mm.eg.db", \
    "scran", \
    "ComplexHeatmap", \
    "scater", \
    "scRNAseq", \
    "SingleCellExperiment", \
    "BiocWorkflowTools"), Ncpus = 4)'
