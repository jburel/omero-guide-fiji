FROM imagedata/jupyter-docker:0.10.0
MAINTAINER ome-devel@lists.openmicroscopy.org.uk


# Install BeakerX
# Necessary to instal in a separate command
RUN conda install -c anaconda numpy
RUN conda install -c conda-forge beakerx && \
    # Jupyterlab component for ipywidgets (must match jupyterlab version) \
    jupyter labextension install beakerx-jupyterlab

USER root
RUN mkdir /opt/java-apps && fix-permissions /opt/java-apps

RUN apt-get install -y -q unzip

# Install FIJI and few plugins
RUN cd /opt/java-apps && \
    wget -q https://downloads.imagej.net/fiji/latest/fiji-linux64.zip && \
    unzip fiji-linux64.zip
RUN cd /opt/java-apps/Fiji.app/plugins && \
    wget -q https://github.com/ome/omero-insight/releases/download/v5.5.11/omero_ij-5.5.11-all.jar

RUN /opt/java-apps/Fiji.app/ImageJ-linux64 --update add-update-site BF https://sites.imagej.net/Bio-Formats/


RUN apt-get update && \
    apt-get install -y \
        apt-utils \
        software-properties-common && \
    apt-get upgrade -y
 
# get Xvfb virtual X server and configure
RUN apt-get install -y \
        xvfb \
        x11vnc \
        x11-xkb-utils \
        xfonts-100dpi \
        xfonts-75dpi \
        xfonts-scalable \
        xfonts-cyrillic \
        x11-apps \
        libxrender1 \
        libxtst6 \
        libxi6 
                    
# Setting ENV for Xvfb and Fiji
ENV DISPLAY :99
ENV PATH $PATH:/opt/java-apps/Fiji.app/

# Adjust start.sh
RUN sed -i 's/exec/exec xvfb-run/' /usr/local/bin/start.sh

USER $NB_UID

# Clone the source git repo into notebooks (keep this at the end of the file)
COPY --chown=1000:100 . notebooks
