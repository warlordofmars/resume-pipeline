FROM gradle:jdk10

USER root

RUN apt-get install -y curl \
  && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
  && apt-get install -y nodejs aspell awscli wkhtmltopdf python-pip ruby \
  && curl -L https://www.npmjs.com/install.sh | sh \
  && npm install -g hackmyresume \
  && pip install cfn-lint \
  && gem install cfn-nag

USER gradle
WORKDIR /home/gradle/src
