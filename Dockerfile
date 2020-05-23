FROM ubuntu

RUN apt-get update && \
  apt-get install -y curl spatialite-bin libsqlite3-mod-spatialite \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /data

ARG country=us
RUN curl https://data.geocode.earth/wof/dist/spatial/whosonfirst-data-admin-${country}-latest.spatial.db.bz2 | \
    bunzip2 > whosonfirst-data-admin-${country}-latest.spatial.db

ENV country ${country}
CMD spatialite whosonfirst-data-admin-${country}-latest.spatial.db

