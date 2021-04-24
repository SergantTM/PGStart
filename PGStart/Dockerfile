FROM postgres:11.11
LABEL MAINTAINER ="SergantTM"
ENV scripts /dump/scripts
ENV app /dump/app
WORKDIR ${app}
COPY app/ ${app}
COPY scripts/ ${scripts} 
RUN /bin/bash -c "source  /dump/app/install.sh"
#RUN [ "sh", "-c", "source  /dump/app/install.sh"]
WORKDIR ${scripts}
#RUN /bin/sh -c 'sh ./dump/app/install.sh'