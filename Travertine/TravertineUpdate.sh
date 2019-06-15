echo "Downloading last build of Travertine"
rm Travertine.jar
wget https://papermc.io/ci/job/Travertine/lastSuccessfulBuild/artifact/Travertine-Proxy/bootstrap/target/Travertine.jar

echo "Setuping Travertine modules"
rm -R modules
mkdir modules
cd modules
wget https://papermc.io/ci/job/Travertine/lastSuccessfulBuild/artifact/Travertine-Proxy/module/cmd-alert/target/cmd_alert.jar
wget https://papermc.io/ci/job/Travertine/lastSuccessfulBuild/artifact/Travertine-Proxy/module/cmd-find/target/cmd_find.jar
wget https://papermc.io/ci/job/Travertine/lastSuccessfulBuild/artifact/Travertine-Proxy/module/cmd-list/target/cmd_list.jar
wget https://papermc.io/ci/job/Travertine/lastSuccessfulBuild/artifact/Travertine-Proxy/module/cmd-send/target/cmd_send.jar
wget https://papermc.io/ci/job/Travertine/lastSuccessfulBuild/artifact/Travertine-Proxy/module/cmd-server/target/cmd_server.jar
wget https://papermc.io/ci/job/Travertine/lastSuccessfulBuild/artifact/Travertine-Proxy/module/reconnect-yaml/target/reconnect_yaml.jar
