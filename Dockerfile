FROM ubuntu:12.04
ENV DEBIAN_FRONTEND noninteractive

# software-properties-common contains "add-apt-repository" command for PPA conf
RUN apt-get update && apt-get install -y software-properties-common python-software-properties

# add a repo for libre2
RUN add-apt-repository -y ppa:pi-rho/security
RUN add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"

RUN apt-get update -q && \
    apt-get install -y netbase ca-certificates python \
        python-dev build-essential \
        xvfb libqt4-webkit python-qt4 libre2-dev \
        python-pip libicu48 xvfb flashplugin-installer \
        libffi-dev

RUN pip install -U pip
ADD . /app
RUN pip install -r /app/requirements.txt

WORKDIR /app

VOLUME ["/etc/splash/proxy-profiles", "/etc/splash/js-profiles", "/etc/splash/filters"]

EXPOSE 8050 8051 5023
ENTRYPOINT [ \
    "./splash.sh", \
    "--proxy-profiles-path",  "/etc/splash/proxy-profiles", \
    "--js-profiles-path", "/etc/splash/js-profiles", \
    "--filters-path", "/etc/splash/filters" \
]

