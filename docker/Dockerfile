FROM ubuntu

# Disable debconf dialogs
ENV DEBIAN_FRONTEND noninteractive
# Disable upstart service
ENV RUNLEVEL 1

RUN apt-get update && \
    apt-get install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \
        software-properties-common && \
    apt-add-repository ppa:brightbox/ruby-ng && \
    apt-get update
RUN apt-get install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \
        ruby2.2 ruby2.2-dev \
        build-essential zlib1g zlib1g-dev libxml2-dev libxslt-dev libsqlite3-dev \
        git nodejs
RUN gem install rails rspec-rails
RUN mkdir /data && cd /data && \
    git clone https://github.com/micahyoung/railsrc.git
RUN cd /data/railsrc && rake

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data/railsrc

# Define default command.
CMD ["rake"]

