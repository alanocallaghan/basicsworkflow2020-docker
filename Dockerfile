FROM bioconductor/bioconductor_docker:RELEASE_3_18

LABEL name="basicsworkflow2020-docker" \
      version="0.5.3" \
      url="https://github.com/Alanocallaghan/bocker" \
      maintainer="alan.ocallaghan@outlook.com" \
      description="Docker image containing BASiCS and related packages" \
      license="GPL-3"

RUN apt update && \
    apt install -y \
    apt-utils \
    libssh2-1-dev \
    texlive \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-fonts-recommended \
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

# pepew https://github.com/bwlewis/irlba/issues/70
RUN Rscript -e 'devtools::install_github("bwlewis/irlba")'
