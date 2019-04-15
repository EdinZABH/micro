FROM ubuntu

# Declare constants
ENV NVM_VERSION v0.33.0
ENV NODE_VERSION v9.9.0
ENV NVM_DIR=$HOME/.nvm/

RUN apt-get update && apt-get -y install curl 

# Install NVM
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
# Install NODE
COPY . .
RUN . "$NVM_DIR/nvm.sh" && \
    nvm install $NODE_VERSION && nvm use --delete-prefix $NODE_VERSION
RUN cp /.nvm/versions/node/${NODE_VERSION}/bin/node /usr/bin/
RUN cp /.nvm/versions/node/${NODE_VERSION}/bin/npm /usr/bin/
CMD ["node", "index.js"]
