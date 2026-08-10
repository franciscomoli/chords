FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        perl \
        cpanminus \
        build-essential \
        ca-certificates \
        openssl \
        libssl-dev \
        libpdf-api2-perl \
        libharfbuzz-dev \
        fonts-dejavu \
    && rm -rf /var/lib/apt/lists/*

# ---------------------------------------------------------
# Dependencias HTTPS
# ---------------------------------------------------------

RUN cpanm --notest IO::Socket::SSL

RUN perl -MIO::Socket::SSL -e 'print "IO::Socket::SSL OK\n"'

RUN cpanm --notest LWP::Protocol::https

RUN perl -MLWP::Protocol::https -e 'print "LWP HTTPS OK\n"'

# ---------------------------------------------------------
# Dependencias de ChordPro
# ---------------------------------------------------------

RUN cpanm --notest HarfBuzz::Shaper

RUN perl -MHarfBuzz::Shaper -e 'print "HarfBuzz OK\n"'

RUN cpanm --notest Pod::Usage

RUN perl -MPod::Usage -e 'print "Pod::Usage OK\n"'

# ---------------------------------------------------------
# ChordPro
# ---------------------------------------------------------

RUN cpanm --notest --verbose App::Music::ChordPro

RUN chordpro --version

WORKDIR /chords

ENTRYPOINT ["chordpro"]