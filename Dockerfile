FROM jenkins/jenkins:lts-jdk17

USER root

# Install necessary tools
RUN apt-get update && \
    apt-get install -y curl git apt-transport-https ca-certificates gnupg lsb-release && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Switch back to jenkins user
USER jenkins

# Disable setup wizard and update checks
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false -Dhudson.model.UpdateCenter.never=true"

# Copy init scripts to disable update sites and security prompts
COPY --chown=jenkins:jenkins init.groovy.d/ /usr/share/jenkins/ref/init.groovy.d/

# Install Jenkins plugins offline (pre-downloaded to plugins.txt)
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --war /usr/share/jenkins/jenkins.war --plugin-file /usr/share/jenkins/ref/plugins.txt

# Expose Jenkins ports
EXPOSE 8080 50000