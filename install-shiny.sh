sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/'
sudo apt-get update

sudo apt-get -y install r-base
wget https://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.5.5.872-amd64.deb
md5sum shiny-server-1.5.5.872-amd64.deb
sudo apt-get -y install gdebi-core
sudo gdebi shiny-server-1.5.5.872-amd64.deb -n

sudo su - -c "R -e \"install.packages('shiny', repos='http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('shinydashboard', repos = 'http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('scales', repos = 'http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('ggthemes', repos = 'http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('googleVis', repos = 'http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('RJDBC', repos = 'http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('here', repos = 'http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('magrittr', repos = 'http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('dply', repos = 'http://cran.rstudio.com/')\""
sudo su - -c "R -e \"install.packages('lybridate', repos = 'http://cran.rstudio.com/')\""

# Dependencias Devtools
sudo apt-get -y build-dep libcurl4-gnutls-dev
sudo apt-get -y install libcurl4-gnutls-dev
#install Plotly DevTools
sudo su - -c "R -e \"install.packages('plotly', repos = 'http://cran.rstudio.com/')\""
#install DevTools
sudo su - -c "R -e \"install.packages('devtools', repos = 'http://cran.rstudio.com/')\""
#Then, Install ggplot2 Dev GitHub
sudo su - -c "R -e \"devtools::install_github('tidyverse/ggplot2')\""
#######################################################################################################
