remote_file "testweb.zip" do
	action :create_if_missing
	source "http://www.cumulogic.com/download/Apps/testweb.zip"
	path "/tmp/testweb.zip"
end

execute "unzip_app" do
	command "unzip /tmp/testweb.zip -d /tmp"
	creates "/tmp/testweb"
end

include_recipe "jboss::stop"

remote_file "testweb.war" do
	source "file:///tmp/testweb/testweb.war"
	path "/opt/jboss-5.1.0.GA/server/default/deploy/testweb.war"
	action :create_if_missing
end

remote_file "testweb.xml" do
	source "file:///tmp/testweb/testweb.xml"
	path "/opt/jboss-5.1.0.GA/server/default/deploy/testweb.xml"
	action :create_if_missing
end

include_recipe "jboss::start"
