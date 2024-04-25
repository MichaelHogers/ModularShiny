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
    libcurl4-openssl-dev \
    libssl-dev \
    make \
    pandoc \
    zlib1g-dev  \
    libicu-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# passed through via docker build command in
# .github/workflows/ShinyAdmin-deployment.yaml
ARG GITHUB_PAT
ENV GITHUB_PAT=$GITHUB_PAT

COPY . ShinyAdmin
RUN R -e 'print(dir("/ShinyAdmin"));install.packages("pak"); pak::local_install("ShinyAdmin");'
EXPOSE 3838
CMD  ["R", "-e", "options('shiny.port'=3838,shiny.host='0.0.0.0'); ShinyAdmin::start_app(port = 3838, host = '0.0.0.0')"]