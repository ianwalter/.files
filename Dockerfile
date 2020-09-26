FROM ianwalter/pnpm:v1.1.0

# https://github.com/microsoft/vscode-dev-containers/blob/d901694db66bade0575db92284bf4f1aa5bf6039/containers/docker-from-docker/README.md

# Install Docker Community Edition CLI.
RUN apt-get update \
  && apt-get install -y apt-transport-https ca-certificates curl gnupg2 lsb-release \
  && curl -fsSL https://download.docker.com/linux/$(lsb_release -is | tr '[:upper:]' '[:lower:]')/gpg | apt-key add - 2>/dev/null \
  && echo "deb [arch=amd64] https://download.docker.com/linux/$(lsb_release -is | tr '[:upper:]' '[:lower:]') $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list \
  && apt-get update \
  && apt-get install -y docker-ce-cli

# Install Docker Compose.
RUN LATEST_COMPOSE_VERSION=$(curl -sSL "https://api.github.com/repos/docker/compose/releases/latest" | grep -o -P '(?<="tag_name": ").+(?=")') \
  && curl -sSL "https://github.com/docker/compose/releases/download/${LATEST_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
  && chmod +x /usr/local/bin/docker-compose

# Install development tools.
RUN apt-get install -y zsh zplug vim jq

# Set the current working directory to root's home directory.
WORKDIR /root

# Set up a directory for global npm packages.
RUN mkdir ~/.npm-global && npm config set prefix '~/.npm-global'

# Make the .zsh directory where plugins will be installed.
RUN mkdir .zsh

# Use the typewritten prompt: https://github.com/reobin/typewritten
RUN git clone https://github.com/reobin/typewritten.git .zsh/typewritten

# Use zsh-completions: https://github.com/zsh-users/zsh-completions
RUN git clone git://github.com/zsh-users/zsh-completions.git .zsh/zsh-completions

# Use zsh-suggestions: https://github.com/zsh-users/zsh-autosuggestions
RUN git clone https://github.com/zsh-users/zsh-autosuggestions .zsh/zsh-autosuggestions

# Use zsh-syntax-highlighting: https://github.com/zsh-users/zsh-syntax-highlighting
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git .zsh/zsh-syntax-highlighting

# Install n so that you can easily switch Node.js versions.
RUN npm install -g n

# Copy the files from .devcontainer to the current working directory.
COPY .devcontainer/ .
