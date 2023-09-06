# syntax=docker/dockerfile:1
# vfeeg-web EDA backend EEGFaktura
# Copyright (C) 2023  Matthias Poettinger
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#

FROM nginx:1.25-bookworm
LABEL org.vfeeg.vendor="Verein zur Förderung von Erneuerbaren Energiegemeinschaften"
LABEL org.vfeeg.image.authors="eegfaktura@vfeeg.org"
LABEL org.opencontainers.image.vendor="Verein zur Förderung von Erneuerbaren Energiegemeinschaften"
LABEL org.opencontainers.image.authors="eegfaktura@vfeeg.org"
LABEL org.opencontainers.image.title="eegfaktura-proxy"
LABEL org.opencontainers.image.version="0.1.0"
LABEL org.opencontainers.image.description="EEG Faktura reverse proxy"
LABEL org.opencontainers.image.licenses=AGPL-3.0
LABEL org.opencontainers.image.source=https://github.com/eegfaktura/eegfaktura-proxy
LABEL org.opencontainers.image.base.name=nginx:1.25-bookworm
LABEL description="EEG Faktura reverse proxy"
LABEL version="0.1.0"

ENV KEY_FILE=""
ENV CERT_FILE=""

RUN set -x \
    mkdir -p /etc/ssl/certs/ \
    && mkdir -p /etc/ssl/private/

COPY ssl/ /etc/ssl/
COPY nginx/docker-entrypoint.d/* /docker-entrypoint.d
COPY nginx/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443