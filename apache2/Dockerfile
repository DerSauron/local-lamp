FROM httpd:2.4

ARG USER_ID
ARG GROUP_ID

RUN groupadd -g ${GROUP_ID} service_user && useradd -M -u ${USER_ID} -g ${GROUP_ID} service_user

COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf
