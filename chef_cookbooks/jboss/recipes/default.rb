#
# Cookbook Name:: jboss
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "java::default"

cookbook_file "jboss.zip" do
    path "/tmp/jboss.zip"
	action :create_if_missing
	end
cookbook_file "jboss" do
    path "/etc/init.d/jboss"
    mode "0755"
    group "root"
    owner "root"
    action :create_if_missing
    end

execute "add_chkconfig" do
    command "chkconfig --add jboss"
    end

yum_package "unzip" do
    action :install
    end

execute "unzip jboss" do
    command "unzip /tmp/jboss.zip -d /opt"
    creates "/opt/jboss-5.1.0.GA"
    end
