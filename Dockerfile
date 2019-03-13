# FROM amazonlinux:2

# RUN echo $' \
# public class Hello { \
# public static void main(String[] args) { \
# System.out.println("Welcome to Amazon Corretto!"); \
# } \
# }' > Hello.java
# RUN javac Hello.java



# RUN yum update -y
# RUN amazon-linux-extras enable corretto8
# RUN yum install -y java-1.8.0-amazon-corretto

# COPY . .

# ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-amazon-corretto.x86_64/jre/

# RUN ["./gradlew", "help", "--console=plain", "-i"] 

FROM gradle:jdk10

USER root

RUN apt-get install -y curl \
  && curl -sL https://deb.nodesource.com/setup_9.x | bash - \
  && apt-get install -y nodejs \
  && curl -L https://www.npmjs.com/install.sh | sh 

RUN npm install -g hackmyresume
RUN apt-get install -y aspell
RUN echo "exit 0" > /usr/bin/lp; chmod +x /usr/bin/lp
RUN apt-get install -y awscli
RUN apt-get install -y wkhtmltopdf
# RUN echo "exit 0" > /usr/bin/gdrive; chmod +x /usr/bin/gdrive
RUN apt-get install -y python-pip
RUN pip install cfn-lint
RUN apt-get install -y ruby
RUN gem install cfn-nag

RUN apt-get install -y golang
RUN go get github.com/prasmussen/gdrive
RUN cp /root/go/bin/gdrive /usr/bin/gdrive

USER gradle
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
# RUN ./gradlew build
