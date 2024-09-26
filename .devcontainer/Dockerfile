FROM ubuntu:latest
# Install flutter dependencies
RUN apt-get update
RUN apt-get install -y curl git wget unzip sed gnupg1
RUN apt-get clean
# Clone the flutter repo
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
# Set flutter path
ENV PATH="${PATH}:/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin"
# Run flutter doctor
RUN flutter doctor -v
RUN flutter channel stable
RUN flutter upgrade