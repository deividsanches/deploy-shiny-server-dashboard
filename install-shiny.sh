#!/bin/bash

#ADD REPOSITORY CRAN RSTUDIO
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/'

#install required packages
sudo apt-get update
sudo apt-get -y install r-cran-rjava
sudo apt-get -y install r-base
sudo apt-get -y install gdebi-core
sudo apt-get -y build-dep libcurl4-gnutls-dev
sudo apt-get -y install libcurl4-gnutls-dev
wget https://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.5.5.872-amd64.deb
md5sum shiny-server-1.5.5.872-amd64.deb
sudo gdebi shiny-server-1.5.5.872-amd64.deb -n

# Install required packages for Dashboard
sudo su - -c "R -e \"install.packages('shiny', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('shinydashboard', repos = 'http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('scales', repos = 'http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('ggthemes', repos = 'http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('googleVis', repos = 'http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('rJava', repos = 'http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('RJDBC', repos = 'http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('here', repos = 'http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('magrittr', repos = 'http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('dply', repos = 'http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('lubridate', repos = 'http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('plotly', repos = 'http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('devtools', repos = 'http://cran.rstudio.com/')\""
sudo su - -c "R -e \"devtools::install_github('tidyverse/ggplot2')\""

#echo "Campo Interativo"
#read Campo-interativo
