alias v='vim'
# nvim aka neovim is a rewrite of vim which I generally use
alias n='nvim'
# git shortcut for looking at the diff of staged changes
alias gdca='git diff --cached'
# git shortcut for ignoring submodules in status
alias gst='git status --ignore-submodules=all'
# git list of branches ordered by latest committer date
alias gbbd="git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format='%(refname:short)'"
# tree is a command to look at a recursive file structure
# Run: brew install tree
# These aliases filter out common files for different languages
alias tree-js='tree -I node_modules'
alias tree-java="tree -P '*.java' --prune"
alias tree-java-test="tree -P '*.java' --prune -I 'main'"
alias tree-java-code="tree -P '*.java' --prune -I 'test'"
alias tree-java-bean="tree -P '*.xml'"

# bundle is a ruby specific tool
alias be='bundle exec'
alias k8='kubectl'
# alias agc='ag --color-path="1;30" --path-to-ignore="~/.agignore"'
alias mvnc="rainbow -- mvn"
alias config='nvim  ~/.vimrc ~/.zshrc ~/.zprofile'

alias uuid='uuidgen | tr "[:upper:]" "[:lower:]"'
alias ldap='docker run artifactory.roving.com/get-ldap-secret'

alias refresh-permalink='mvn clean install -DskipTests && cp permalink-webapp/target/permalink-webapp-*.war . && vagrant ssh -c "sudo /etc/init.d/tomee-permalink stop && sudo rm -rf /opt/cc/tomee/permalink/webapps/ROOT* && sudo cp /vagrant/permalink-webapp*.war /opt/cc/tomee/permalink/webapps/ROOT.war && sudo /etc/init.d/tomee-permalink start"'
alias refresh-postflight='mvn clean install -DskipTests && cp postflight-web/target/postflight-web-*.war . && vagrant ssh -c "sudo /etc/init.d/tomee-postflight stop && sudo rm -rf /opt/cc/tomee/postflight/webapps/ROOT* && sudo cp /vagrant/postflight-web*.war /opt/cc/tomee/postflight/webapps/ROOT.war && sudo /etc/init.d/tomee-postflight start"'
alias refresh-scheduler='mvn clean install -DskipTests && cp scheduler-web/target/scheduler-web-*.war . && vagrant ssh -c "sudo /etc/init.d/tomee-schedulerapi stop && sudo rm -rf /opt/cc/tomee/schedulerapi/webapps/ROOT && sudo cp /vagrant/scheduler-web*.war /opt/cc/tomee/schedulerapi/webapps/ROOT.war && sudo /etc/init.d/tomee-schedulerapi start"'
alias refresh-email-syndicator='mvn clean install -DskipTests && cp ./email-syndicator-web/target/email-syndicator-*.war . && vagrant ssh -c "sudo /etc/init.d/tomee-email-syndicator stop && sudo rm -rf /opt/cc/tomee/email-syndicator/webapps/ROOT && sudo cp /vagrant/email-syndicator-web*.war /opt/cc/tomee/email-syndicator/webapps/ROOT.war && sudo /etc/init.d/tomee-email-syndicator start"'
alias refresh-login='mvn clean install -DskipTests && cp target/login.war . && vagrant ssh -c "sudo /etc/init.d/tomee-login stop && sudo rm -rf /opt/cc/tomee/login/webapps/login* && sudo cp /vagrant/login.war /opt/cc/tomee/login/webapps/login.war && sudo /etc/init.d/tomee-login start"'
# alias refresh-login='mvn clean install -DskipTests && cp target/login.war . && vagrant ssh -c "sudo /etc/init.d/tomcat-login stop && sudo rm -rf /opt/cc/tomcat/login/webapps/login* && sudo cp /vagrant/login.war /opt/cc/tomcat/login/webapps/login.war && sudo /etc/init.d/tomcat-login start"'
alias d1-refresh-login='mvn clean install -DskipTests && cp target/login.war . && scp -o PreferredAuthentications=password -o PubkeyAuthentication=no login.war c1-vmdjb287:/tmp  && ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no -t c1-vmdjb287 "sudo /etc/init.d/tomee-login stop &&  sudo rm -rf /opt/cc/tomee/login/webapps/login* && sudo cp /tmp/login.war /opt/cc/tomee/login/webapps/login.war && sudo /etc/init.d/tomee-login start && tail -f /opt/cc/logs/server-login.log"'

alias d1-refresh-permalink='mvn clean install -DskipTests && cp permalink-webapp/target/*.war permalink-webapp.war && scp -o PreferredAuthentications=password -o PubkeyAuthentication=no permalink-webapp.war c1-vmdjb208:/tmp  && ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no -t c1-vmdjb208 "sudo /etc/init.d/tomee-permalink stop &&  sudo rm -rf /opt/cc/tomee/permalink/webapps/permalink* && sudo cp /tmp/permalink.war /opt/cc/tomee/permalink/webapps/permalink.war && sudo /etc/init.d/tomee-permalink start && tail -f /opt/cc/logs/server-permalink.log"'

alias refresh-accountsvc='mvn clean install -DskipTests && vagrant ssh -c "sudo /etc/init.d/tomee-account-svc stop &&  sudo rm -rf /opt/cc/tomee/account-svc/apps/accountsvc/accountsvc* && sudo cp /vagrant/ear/target/accountsvc.ear /opt/cc/tomee/account-svc/apps/accountsvc/accountsvc.ear && sudo /etc/init.d/tomee-account-svc start"'
# alias d1-refresh-accountsvc='mvn clean install -DskipTests && && scp ear/target/accountsvc.ear c1-vmdjb286:/tmp  && ssh -t c1-vmdjb286 "sudo /etc/init.d/tomee-account-svc stop &&  sudo rm -rf /opt/cc/tomee/account-svc/webapps/login* && sudo cp /tmp/accountsvc.ear /opt/cc/tomee/account-svc/webapps/accountsvc.ear && sudo /etc/init.d/tomee-account-svc start"'

alias run-integration-test-no-cleanup='mvn -Dsynd.test.reclaim=false clean verify -Ppackage-for-testing -Pintegration-test -DskipTests'
alias run-integration-test-rabbit-cleanup-only='mvn -Dtest.spec.path=`pwd`/src/test/resources/test-spec.json vagrant:cleanup-rabbit'
alias run-integration-test-rabbit-setup-only='mvn -Dtest.spec.path=`pwd`/src/test/resources/test-spec.json vagrant:setup-rabbit'
