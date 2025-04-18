ARG BUILD_FROM
FROM $BUILD_FROM

# Install requirements for add-on
RUN apk add --no-cache python3 py3-pip gcc python3-dev
RUN pip3 install inetbox-py --break-system-packages

#RUN apk add --no-cache python3 py3-pip gcc python3-dev git
#RUN pip3 install git+https://github.com/ochorocho/inetbox.py.git --break-system-packages
# RUN pip3 install inetbox-py --break-system-packages

# Copy rootfs
COPY rootfs /
RUN chmod a+x /run.sh /write_configuration.sh

CMD [ "/run.sh" ]

WORKDIR /