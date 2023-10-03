#!/bin/bash

# Download and extract SonarQube
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-<version>.zip
unzip sonarqube-<version>.zip

# Move SonarQube to the desired location
mv sonarqube-<version> /opt/sonarqube

# Configure SonarQube properties
cp /opt/sonarqube/conf/sonar.properties /opt/sonarqube/conf/sonar.properties.backup
echo "sonar.jdbc.url=jdbc:postgresql://localhost/sonar" >> /opt/sonarqube/conf/sonar.properties
echo "sonar.jdbc.username=sonar" >> /opt/sonarqube/conf/sonar.properties
echo "sonar.jdbc.password=sonar" >> /opt/sonarqube/conf/sonar.properties

# Set up SonarQube as a service (assuming systemd)
cp /opt/sonarqube/bin/linux-x86-64/sonar.sh /etc/init.d/sonar
chmod +x /etc/init.d/sonar
systemctl enable sonar
systemctl start sonar
