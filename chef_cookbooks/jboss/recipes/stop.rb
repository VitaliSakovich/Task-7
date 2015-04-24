service "jboss" do
	action :start

	start_command "/etc/init.d/jboss stop"
end
