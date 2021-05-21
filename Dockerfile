# Dockerfile.rails
FROM ruby:2.5.7 AS rails-toolbox

## do OS stuff
RUN apt -y update && apt -y upgrade
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt -y install nodejs
RUN npm --global install yarn

ENV TARGET_DIR=/apps/dm-2
RUN mkdir -p ${TARGET_DIR}
WORKDIR ${TARGET_DIR}

copy ./ ./

## do the JS install stuff
RUN cd client && yarn

## do the ruby install stuff
RUN gem install bundler && \
bundler update mimemagic && \
bundler install

CMD ["./startup.sh"]