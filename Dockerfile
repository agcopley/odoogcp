FROM ubuntu:18.04


COPY odoo-server.conf /etc
COPY odoo-install.sh ./
COPY requirements.txt ./

WORKDIR ./
RUN chmod +x odoo-install.sh  && ./odoo-install.sh
COPY custom /odoo/custom
COPY odoo-server /odoo/odoo-server
COPY .local /odoo/.local

RUN chown -R odoo.odoo /odoo/custom && chown -R odoo.odoo /odoo/odoo-server && chown -R odoo.odoo /odoo/.local


EXPOSE 8069

ENTRYPOINT service odoo-server start && tail -f /dev/null