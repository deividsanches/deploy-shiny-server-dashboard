#!/bin/bash

#ADD REPOSITORY CRAN RSTUDIO
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/'

#install required packages
apt-get update
apt-get -y install python-pip
apt-get -y istall git
apt-get -y install r-cran-rjava
apt-get -y install r-base
apt-get -y install gdebi-core
apt-get -y build-dep libcurl4-gnutls-dev
apt-get -y install libcurl4-gnutls-dev
pip install awscli --upgrade --user
wget https://download3.rstudio.org/ubuntu-12.04/x86_64/shiny-server-1.5.5.872-amd64.deb
md5sum shiny-server-1.5.5.872-amd64.deb
gdebi shiny-server-1.5.5.872-amd64.deb -n

# Install required packages for Dashboard
su - -c "R -e \"install.packages('shiny', repos='http://cran.rstudio.com/')\""
su - -c "R -e \"install.packages('shinydashboard', repos = 'http://cran.rstudio.com/')\""
su - -c "R -e \"install.packages('scales', repos = 'http://cran.rstudio.com/')\""
su - -c "R -e \"install.packages('ggthemes', repos = 'http://cran.rstudio.com/')\""
su - -c "R -e \"install.packages('googleVis', repos = 'http://cran.rstudio.com/')\""
su - -c "R -e \"install.packages('rJava', repos = 'http://cran.rstudio.com/')\""
su - -c "R -e \"install.packages('RJDBC', repos = 'http://cran.rstudio.com/')\""
su - -c "R -e \"install.packages('here', repos = 'http://cran.rstudio.com/')\""
su - -c "R -e \"install.packages('magrittr', repos = 'http://cran.rstudio.com/')\""
su - -c "R -e \"install.packages('dply', repos = 'http://cran.rstudio.com/')\""
su - -c "R -e \"install.packages('lubridate', repos = 'http://cran.rstudio.com/')\""
su - -c "R -e \"install.packages('plotly', repos = 'http://cran.rstudio.com/')\""
su - -c "R -e \"install.packages('devtools', repos = 'http://cran.rstudio.com/')\""
su - -c "R -e \"devtools::install_github('tidyverse/ggplot2')\""

#echo "Campo Interativo"
#read Campo-interativo

echo "Informe qual porta deseja instalar o Dashboard" 
read port
  if [ "$port" ] ; then
         echo "Porta $port Escolhida " 
    else
sed  -i "s/3838/$port/g" /etc/shiny-server/shiny-server.conf
  fi
#         /bin/mkdir -p $DIR_BACK
#        echo "O Diretorio não existia no entanto foi criado "$DIR""
#     echo ""
#fi
#sed -i "s/@server_name_or_ip/${IP}/g" /etc/ipsec.conf
sed  -i "s/3838/$port/g" /etc/shiny-server/shiny-server.conf

cd /srv/shiny-server/
git clone https://git-codecommit.sa-east-1.amazonaws.com/v1/repos/sharecare-rshiny-dashboard
systemctl restart shiny-server
