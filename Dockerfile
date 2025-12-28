FROM perl:5.38

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    build-essential \
    cpanminus \
    default-libmysqlclient-dev \
    ispell \
    libdb-dev \
    libpq-dev \
    libssl-dev \
    pkg-config \
    zlib1g-dev \
 && rm -rf /var/lib/apt/lists/*

RUN cpanm --notest DBI
RUN cpanm --notest DBD::MariaDB
RUN cpanm --notest DBD::Pg
RUN cpanm --notest DB_File Lingua::Ispell MLDBM Text::Soundex

WORKDIR /app
COPY . /app

COPY docker/entrypoint.sh /usr/local/bin/rockserv-entrypoint
COPY docker/healthcheck.sh /usr/local/bin/rockserv-healthcheck
RUN chmod +x /usr/local/bin/rockserv-entrypoint /usr/local/bin/rockserv-healthcheck

ENV ROCKSERV_GAME=dillfrog
EXPOSE 4000 2331

ENTRYPOINT ["rockserv-entrypoint"]
