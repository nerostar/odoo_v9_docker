FROM postgres:9.3

ENV DEBIAN_FRONTEND noninteractive


# Install the default packages
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y \
    postgis postgresql-13-postgis-3-scripts

RUN createdb odoo_v9 -U odoo
RUN psql odoo_v9 -U odoo -c 'CREATE EXTENSION postgis;CREATE EXTENSION postgis_topology;'

RUN pg_restore -Fc -d odooV9 odoo_v9-202210011315.bak -O -j 15 -U odoo

RUN psql odoo_v9 -U odoo -c "UPDATE res_users SET password_crypt = '\$pbkdf2-sha512\$6400\$nPM.p/S.9z5HqNV6z5mT8g\$j2g9YBCVmVxjyhIP8unpKFYDK6ZknKOvKK435j6Nsy0md8v8K0DpOtM9V1q1ISIhfBy0uN9BeDWbPWGGlcS3fg';"
RUN psql odoo_v9 -U odoo -c "UPDATE ir_cron SET active=FALSE;"
RUN psql odoo_v9 -U odoo -c "UPDATE ir_mail_server SET smtp_port=1025;"
RUN psql odoo_v9 -U odoo -c "DELETE FROM ir_config_parameter WHERE key LIKE 'website.recaptcha.%';"


ENTRYPOINT ["tail", "-f", "/dev/null"]
