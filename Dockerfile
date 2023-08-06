FROM mcr.microsoft.com/azure-cli
#RUN apk add python3 python3-dev py3-pip build-base libressl-dev musl-dev libffi-dev jq bash
RUN apk add bash openssh
RUN pip3 install pip --upgrade
RUN pip3 install certbot certbot-dns-porkbun
RUN python3 -m venv .
ADD bootstrap.sh certbot_auth.sh /
ENV DOMAIN=todo.plok.work
ENV AKV=uwukeyv
RUN ["/bin/bash", "/bootstrap.sh"]
ENTRYPOINT ["/bin/bash", "/certbot_auth.sh"]