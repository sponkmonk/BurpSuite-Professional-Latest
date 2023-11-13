#!/bin/bash

# Download Burpsuite Professional Latest.
    echo 'Downloading Burpsuite Professional Latest...'
    
    mkdir -p /usr/share/burpsuite
    cp loader.jar /usr/share/burpsuite/
    cp burp_suite.ico /usr/share/burpsuite/
    rm install.ps1
    rm -rf .git
    cd /usr/share/burpsuite/
	rm burpsuite.jar
    
    html=$(curl -s https://portswigger.net/burp/releases)
    version=$(echo $html | grep -Po '(?<=/burp/releases/professional-community-)[0-9]+\-[0-9]+\-[0-9]+' | head -n 1)
    Link="https://portswigger-cdn.net/burp/releases/download?product=pro&version=&type=jar"
    echo $version
    wget "$Link" -O burpsuite_pro_v$version.jar --quiet --show-progress
    
# Execute Key Generator.
    echo 'Starting Key Generator'
    
    (java -jar loader.jar) &
    sleep 2s

# Execute Burp Suite Professional with Keyloader
    echo 'Executing BurpSuite Professional with Key Generator"
        
# Execute Burp Suite Professional with Keyloader
    echo 'Executing BurpSuite Professional with Key Generator'
    
   echo "java --add-opens=java.desktop/javax.swing=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm.Opcodes=ALL-UNNAMED -javaagent:$(pwd)/loader.jar -noverify -jar $(pwd)/burpsuite_pro_v$version.jar &" > burpsuite
    chmod 777 burpsuite
    cp burpsuitepro /bin/burpsuite
    (./burpsuite)
