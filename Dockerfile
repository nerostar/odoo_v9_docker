FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive


# Install the default packages
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y \
    vim cron supervisor postgresql-client python-pip python-dev libffi-dev libssl-dev \
    node-less python-babel python-dateutil python-decorator python-docutils \
    python-feedparser python-imaging python-jinja2 python-ldap libreoffice \
    python-mako python-mock python-openid python-passlib python-psutil \
    python-psycopg2 python-pychart python-pydot python-pyparsing python-pypdf \
    python-reportlab python-suds python-unittest2 python-shapely\
    python-libxslt1 python-lxml python-pyproj python-magic python-matplotlib \
    fontconfig fontconfig-config fonts-dejavu-core fonts-liberation ghostscript \
    graphviz gsfonts libart-2.0-2 libavahi-client3 libavahi-common-data \
    libavahi-common3 libcairo2 libcdt5 libcgraph6 libcups2 libcupsfilters1 \
    libcupsimage2 libdatrie1 libfontconfig1 libgd3 libglib2.0-0 libglib2.0-data \
    libgraphite2-3 libgs9 libgs9-common libgvc6 libgvpr2 libharfbuzz0b libice6 \
    libidn11 libijs-0.35 libjbig2dec0 libjs-jquery libltdl7 libpango-1.0-0 \
    libpangocairo-1.0-0 libpangoft2-1.0-0 libpathplan4 libpixman-1-0 libsm6 \
    libthai-data libthai0 libvpx1 libx11-6 libx11-data libxau6 libxaw7 \
    libxcb-render0 libxcb-shm0 libxcb1 libxdmcp6 libxext6 libxmu6 libxpm4 \
    libxrender1 libxt6 libyaml-0-2 poppler-data python-antlr zlib1g-dev libjpeg8-dev\
    python-egenix-mxdatetime python-egenix-mxtools python-mako python-mock \
    python-openid python-openssl python-passlib python-psutil python-psycopg2 \
    python-pychart python-pydot python-pyinotify python-pyparsing python-pypdf \
    python-renderpm python-reportlab python-reportlab-accel python-suds \
    python-support python-vatnumber python-vobject python-werkzeug python-xlwt \
    python-yaml shared-mime-info x11-common python-gevent python-gevent-websocket && \

    # Clean APT temporary files
    apt-get clean && \
    apt-get autoclean

# Instalar Nginx
RUN apt-get install -y nginx


COPY ./libs/treepoem-2.0.0-py2.py3-none-any.whl /root/treepoem-2.0.0-py2.py3-none-any.whl
COPY ./libs/pip-20.3.4-py2.py3-none-any.whl /root/pip-20.3.4-py2.py3-none-any.whl
#COPY ./libs/requests-2.21.0-py2.py3-none-any.whl /root/requests-2.21.0-py2.py3-none-any.whl
COPY ./libs/requests-2.22.0.tar.gz /root/requests-2.22.0.tar.gz
COPY ./libs/ndg_httpsclient-0.5.0-py2-none-any.whl /root/ndg_httpsclient-0.5.0-py2-none-any.whl
COPY ./libs/pyasn1-0.4.5-py2.py3-none-any.whl /root/pyasn1-0.4.5-py2.py3-none-any.whl
COPY ./libs/nose-1.3.7-py2-none-any.whl /root/nose-1.3.7-py2-none-any.whl
COPY ./libs/tornado-4.2.tar.gz /root/tornado-4.2.tar.gz
COPY ./libs/certifi-2017.4.17-py2.py3-none-any.whl /root/certifi-2017.4.17-py2.py3-none-any.whl
COPY ./libs/backports.ssl_match_hostname-3.7.0.1.tar.gz /root/backports.ssl_match_hostname-3.7.0.1.tar.gz
COPY ./libs/psycogreen-1.0.2.tar.gz /root/psycogreen-1.0.2.tar.gz
COPY ./libs/ics-0.3.1-py2.py3-none-any.whl /root/ics-0.3.1-py2.py3-none-any.whl
COPY ./libs/XlsxWriter-2.0.0-py2.py3-none-any.whl /root/XlsxWriter-2.0.0-py2.py3-none-any.whl
COPY ./libs/appy-0.9.11.tar.gz /root/appy-0.9.11.tar.gz
COPY ./libs/arrow-0.4.2.tar.gz /root/arrow-0.4.2.tar.gz
COPY ./libs/backports.functools_lru_cache-1.6.4-py2.py3-none-any.whl /root/backports.functools_lru_cache-1.6.4-py2.py3-none-any.whl
COPY ./libs/TatSu-4.3.0-py2.py3-none-any.whl /root/TatSu-4.3.0-py2.py3-none-any.whl
COPY ./libs/workalendar-6.0.1-py2-none-any.whl /root/workalendar-6.0.1-py2-none-any.whl
COPY ./libs/pygooglechart-0.4.0.tar.gz /root/pygooglechart-0.4.0.tar.gz
COPY ./libs/xlrd-1.2.0-py2.py3-none-any.whl /root/xlrd-1.2.0-py2.py3-none-any.whl
COPY ./libs/workdays-1.4.tar.gz /root/workdays-1.4.tar.gz
COPY ./libs/Unidecode-1.2.0-py2.py3-none-any.whl /root/Unidecode-1.2.0-py2.py3-none-any.whl
COPY ./libs/Pillow-5.1.0.tar.gz /root/Pillow-5.1.0.tar.gz
COPY ./libs/python_resize_image-1.1.18-py2.py3-none-any.whl /root/python_resize_image-1.1.18-py2.py3-none-any.whl
COPY ./libs/xlutils-2.0.0-py2.py3-none-any.whl /root/xlutils-2.0.0-py2.py3-none-any.whl
COPY ./libs/python-gitlab-1.8.0.tar.gz /root/python-gitlab-1.8.0.tar.gz
COPY ./libs/qrcode-4.0.1.tar.gz /root/qrcode-4.0.1.tar.gz
COPY ./libs/ERPpeek-1.6.1-py2.py3-none-any.whl /root/ERPpeek-1.6.1-py2.py3-none-any.whl
COPY ./libs/geojson-1.3.3-py2.py3-none-any.whl /root/geojson-1.3.3-py2.py3-none-any.whl
COPY ./libs/pyCalverter-1.6.1.tar.gz /root/pyCalverter-1.6.1.tar.gz
COPY ./libs/lunardate-0.1.5.tar.gz /root/lunardate-0.1.5.tar.gz
COPY ./libs/pyluach-1.0.1.tar.gz /root/pyluach-1.0.1.tar.gz
COPY ./libs/ephem-3.7.6.0.tar.gz /root/ephem-3.7.6.0.tar.gz
COPY ./libs/idna-2.8-py2.py3-none-any.whl /root/idna-2.8-py2.py3-none-any.whl
COPY ./libs/chardet-3.0.4-py2.py3-none-any.whl /root/chardet-3.0.4-py2.py3-none-any.whl
COPY ./libs/urllib3-1.24.1-py2.py3-none-any.whl /root/urllib3-1.24.1-py2.py3-none-any.whl
COPY ./libs/setuptools-44.1.1-py2.py3-none-any.whl /root/setuptools-44.1.1-py2.py3-none-any.whl
COPY ./libs/zeep-3.3.1-py2.py3-none-any.whl /root/zeep-3.3.1-py2.py3-none-any.whl
COPY ./libs/isodate-0.6.0-py2.py3-none-any.whl /root/isodate-0.6.0-py2.py3-none-any.whl
COPY ./libs/six-1.12.0-py2.py3-none-any.whl /root/six-1.12.0-py2.py3-none-any.whl
COPY ./libs/requests_toolbelt-0.9.1-py2.py3-none-any.whl /root/requests_toolbelt-0.9.1-py2.py3-none-any.whl
COPY ./libs/appdirs-1.4.3-py2.py3-none-any.whl /root/appdirs-1.4.3-py2.py3-none-any.whl
COPY ./libs/attrs-19.1.0-py2.py3-none-any.whl /root/attrs-19.1.0-py2.py3-none-any.whl
COPY ./libs/defusedxml-0.5.0-py2.py3-none-any.whl /root/defusedxml-0.5.0-py2.py3-none-any.whl
COPY ./libs/cached_property-1.5.1-py2.py3-none-any.whl /root/cached_property-1.5.1-py2.py3-none-any.whl
COPY ./libs/debugpy-1.4.1-py2.py3-none-any.whl /root/debugpy-1.4.1-py2.py3-none-any.whl

RUN pip install /root/pip-20.3.4-py2.py3-none-any.whl
RUN pip install /root/setuptools-44.1.1-py2.py3-none-any.whl

RUN cd /root/ && tar -xvf backports.ssl_match_hostname-3.7.0.1.tar.gz
RUN cd /root/backports.ssl_match_hostname-3.7.0.1 && python setup.py install

RUN cd /root/ && tar -xvf psycogreen-1.0.2.tar.gz
RUN cd /root/psycogreen-1.0.2 && python setup.py install

RUN pip install /root/certifi-2017.4.17-py2.py3-none-any.whl

RUN cd /root/ && tar -xvf tornado-4.2.tar.gz
RUN cd /root/tornado-4.2/ && python setup.py build && python setup.py install

RUN pip install /root/idna-2.8-py2.py3-none-any.whl
RUN pip install --ignore-installed /root/chardet-3.0.4-py2.py3-none-any.whl
RUN pip install --ignore-installed /root/urllib3-1.24.1-py2.py3-none-any.whl

RUN cd /root/ && tar -xvf requests-2.22.0.tar.gz
RUN cd /root/requests-2.22.0 && python setup.py install

# RUN pip install --ignore-installed /root/requests-2.21.0-py2.py3-none-any.whl
RUN pip install /root/pyasn1-0.4.5-py2.py3-none-any.whl
RUN pip install /root/ndg_httpsclient-0.5.0-py2-none-any.whl
RUN pip install /root/nose-1.3.7-py2-none-any.whl
RUN pip install /root/backports.functools_lru_cache-1.6.4-py2.py3-none-any.whl
RUN pip install /root/TatSu-4.3.0-py2.py3-none-any.whl

RUN cd /root/ && tar -xvf arrow-0.4.2.tar.gz
RUN cd /root/arrow-0.4.2 && python setup.py install

RUN pip install /root/treepoem-2.0.0-py2.py3-none-any.whl

RUN pip install /root/ics-0.3.1-py2.py3-none-any.whl
RUN pip install /root/XlsxWriter-2.0.0-py2.py3-none-any.whl

RUN cd /root/ && tar -xvf appy-0.9.11.tar.gz
RUN cd /root/appy-0.9.11 && python setup.py install


# RUN pip install workalendar pygooglechart xlrd workdays unidecode Pillow python-resize-image xlutils python-gitlab qrcode erppeek geojson --upgrade

RUN cd /root && tar -xvf pyCalverter-1.6.1.tar.gz
RUN cd /root/pyCalverter-1.6.1 && python setup.py install

RUN cd /root && tar -xvf lunardate-0.1.5.tar.gz
RUN cd /root/lunardate-0.1.5 && python setup.py install

RUN cd /root && tar -xvf pyluach-1.0.1.tar.gz
RUN cd /root/pyluach-1.0.1 && python setup.py install

RUN cd /root && tar -xvf ephem-3.7.6.0.tar.gz
RUN cd /root/ephem-3.7.6.0 && python setup.py install

RUN pip install /root/workalendar-6.0.1-py2-none-any.whl

RUN cd /root/ && tar -xvf pygooglechart-0.4.0.tar.gz
RUN cd /root/pygooglechart-0.4.0 && python setup.py install

RUN cd /root/ && tar -xvf workdays-1.4.tar.gz
RUN cd /root/workdays-1.4 && python setup.py install

RUN pip install /root/Unidecode-1.2.0-py2.py3-none-any.whl

RUN cd /root/ && tar -xvf Pillow-5.1.0.tar.gz
RUN cd /root/Pillow-5.1.0 && python setup.py install

RUN pip install /root/python_resize_image-1.1.18-py2.py3-none-any.whl

RUN pip install /root/xlrd-1.2.0-py2.py3-none-any.whl

RUN pip install /root/xlutils-2.0.0-py2.py3-none-any.whl

RUN cd /root/ && tar -xvf python-gitlab-1.8.0.tar.gz
RUN cd /root/python-gitlab-1.8.0 && python setup.py install

RUN cd /root/ && tar -xvf qrcode-4.0.1.tar.gz
RUN cd /root/qrcode-4.0.1 && python setup.py install

RUN pip install /root/ERPpeek-1.6.1-py2.py3-none-any.whl

RUN pip install /root/geojson-1.3.3-py2.py3-none-any.whl

RUN pip install /root/isodate-0.6.0-py2.py3-none-any.whl
RUN pip install  --ignore-installed /root/six-1.12.0-py2.py3-none-any.whl
RUN pip install /root/requests_toolbelt-0.9.1-py2.py3-none-any.whl
RUN pip install /root/appdirs-1.4.3-py2.py3-none-any.whl
RUN pip install /root/attrs-19.1.0-py2.py3-none-any.whl
RUN pip install /root/defusedxml-0.5.0-py2.py3-none-any.whl
RUN pip install /root/cached_property-1.5.1-py2.py3-none-any.whl
RUN pip install /root/zeep-3.3.1-py2.py3-none-any.whl

# RUN pip install -U debugpy==1.5.1
RUN pip install /root/debugpy-1.4.1-py2.py3-none-any.whl

ADD http://nightly.odoo.com/9.0/nightly/deb/odoo_9.0c.latest_all.deb
#ADD http://nightly.odoo.com/9.0/nightly/deb/odoo_9.0c.20180305_all.deb /root/odoo_v9.deb
RUN dpkg -i /root/odoo_v9.deb

ADD bin/* /usr/local/bin/
RUN chmod a+x /usr/local/bin/*
# ADD etc/supervisord/* /etc/supervisor/conf.d/

RUN usermod -s /bin/bash odoo
ADD etc/openerp-server.conf /etc/odoo/
ADD etc/sitecustomize.py /etc/python2.7/

# RUN chown odoo.odoo /opt/odoo-attachments/data/ -R
# RUN chown odoo.odoo /var/log/odoo/ -R

# ENTRYPOINT ["/usr/bin/supervisord", "-n"]
CMD ["python" ,"-m", "debugpy", "--listen", "0.0.0.0:8888", "/usr/bin/openerp-server","-c","/etc/odoo/openerp-server.conf"]

