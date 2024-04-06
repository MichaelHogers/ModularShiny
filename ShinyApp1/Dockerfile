# contains devtools
FROM --platform=linux/x86_64 rocker/r-ver:4.3.1

# Set CRAN repository, download method and number of
# Two mirrors, sometimes new package releases might not be propagated to the
# rstudio package manager or vice versa
RUN echo "options(repos = c(rstudio = 'https://packagemanager.rstudio.com/cran/latest', cran = 'https://cloud.r-project.org/'), download.file.method = 'libcurl', Ncpus = 4)" >> /usr/local/lib/R/etc/Rprofile.site

# Install system dependencies
RUN apt-get update -qq && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    git \
    libcurl4-openssl-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libfribidi-dev \
    libgit2-dev \
    libglpk-dev \
    libgmp3-dev \
    libharfbuzz-dev \
    libicu-dev \
    libjpeg-dev \
    libpng-dev \
    libpq-dev \
    libssl-dev \
    libtiff-dev \
    libxml2-dev \
    make \
    pandoc \
    zlib1g-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

COPY . ShinyApp1
RUN R -e 'print(dir("/ShinyApp1"));install.packages("pak"); pak::local_install("ShinyApp1");'
EXPOSE 3838
CMD  ["R", "-e", "options('shiny.port'=3838,shiny.host='0.0.0.0'); ShinyApp1::start_app(port = 3838, host = '0.0.0.0')"]