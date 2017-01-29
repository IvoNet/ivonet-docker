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
    apt-get install -y ImageMagick && \
    apt-get install -y build-essential && \
    apt-get install -y python && \
    apt-get install -y python-dev && \
    apt-get install -y python-wxgtk2.8 && \
    apt-get install -y python-pip && \
    apt-get install -y python-lxml && \
    apt-get install -y curl && \
    apt-get install -y bash && \
    apt-get install -y firefox && \
    apt-get install -y git
#########################################
##          Install app components     ##
#########################################
RUN pip install --upgrade pip
RUN pip install wxpython && \
    pip install -U robotframework && \
    pip install -U selenium && \
    pip install -U robotframework-selenium2library && \
    pip install -U robotframework-ftplibrary && \
    pip install -U invoke && \
    pip install -U docutils && \
    pip install -U Pygments && \
    pip install -U pyyaml && \
    pip install -U robotframework-databaselibrary && \
    pip install -U robotframework-httplibrary && \
    pip install -U robotframework-anywherelibrary && \
    pip install -U https://github.com/bulkan/robotframework-difflibrary/archive/master.zip && \
    pip install -U robotframework-faker && \
    pip install -U Paver && \
    pip install -U robotframework-rfdoc && \
    pip install -U robotframework-selenium2screenshots && \
    #pip install robotframework-sshlibrary && \
    pip install -U robotframework-hub && \
    pip install -U robotframework-lint && \
    pip install -U robotframework-pageobjects && \
    pip install -U robotframework-pycurllibrary && \
    pip install -U sphinxcontrib-robotframework && \
    pip install -U jedi && \
    pip install -U pep8 && \
    pip install -U pylint && \
    pip install -U pyflakes && \
    pip install -U requests && \
    pip install -U rope

RUN echo 'admin ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

#########################################
##          GUI APP INSTALL            ##
#########################################

# Install steps for X app

WORKDIR /nobody
RUN git clone https://github.com/robotframework/RIDE.git /nobody/RIDE && \
    mkdir -p /etc/my_init.d
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
