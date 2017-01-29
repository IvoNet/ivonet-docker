FROM hurricane/dockergui:x11rdp1.3

MAINTAINER IvoNet <webmaster@ivonet.nl>

#########################################
##        ENVIRONMENTAL CONFIG         ##
#########################################

# Set environment variables

# User/Group Id gui app will be executed as default are 99 and 100
ENV USER_ID=99
ENV GROUP_ID=100

# Gui App Name default is "GUI_APPLICATION"
ENV APP_NAME="Ride"

# Default resolution, change if you like
ENV WIDTH=1280
ENV HEIGHT=720

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

#########################################
##    REPOSITORIES AND DEPENDENCIES    ##
#########################################
RUN echo 'deb http://archive.ubuntu.com/ubuntu trusty main universe restricted' > /etc/apt/sources.list && \
    echo 'deb http://archive.ubuntu.com/ubuntu trusty-updates main universe restricted' >> /etc/apt/sources.list && \

# Install packages needed for app

    export DEBCONF_NONINTERACTIVE_SEEN=true DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y ImageMagick \
                       build-essential \
                       python \
                       python-dev \
                       python-wxgtk2.8 \
                       python-pip \
                       python-lxml \
                       curl \
                       bash \
                       firefox \
                       git
#########################################
##          Install app components     ##
#########################################
RUN pip install --upgrade pip
RUN pip install wxpython && \
    pip install -U robotframework \
                   selenium \
                   robotframework-selenium2library \
                   robotframework-ftplibrary \
                   invoke \
                   docutils \
                   Pygments \
                   pyyaml \
                   robotframework-databaselibrary \
                   robotframework-httplibrary \
                   robotframework-anywherelibrary \
                   https://github.com/bulkan/robotframework-difflibrary/archive/master.zip \
                   robotframework-faker \
                   Paver \
                   robotframework-rfdoc \
                   robotframework-selenium2screenshots \
                   robotframework-hub \
                   robotframework-lint \
                   robotframework-pageobjects \
                   robotframework-pycurllibrary \
                   sphinxcontrib-robotframework \
                   jedi \
                   pep8 \
                   pylint \
                   pyflakes \
                   requests \
                   rope


#########################################
##          GUI APP INSTALL            ##
#########################################

# Install steps for X app

WORKDIR /nobody
RUN git clone https://github.com/robotframework/RIDE.git /nobody/RIDE && \
    mkdir -p /etc/my_init.d && \
    echo 'admin ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
WORKDIR /nobody/RIDE
RUN /usr/bin/python setup.py install
ADD firstrun.sh /etc/my_init.d/firstrun.sh
RUN chmod +x /etc/my_init.d/firstrun.sh

# Copy X app start script to right location
COPY startapp.sh /startapp.sh

#########################################
##         EXPORTS AND VOLUMES         ##
#########################################

ENV HOME /nobody
VOLUME ["/config", "/robot"]
EXPOSE 3389 8080
