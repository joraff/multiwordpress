actions :install

default_action :install

attribute :docroot, kind_of: String, required: true
attribute :title, kind_of: String, required: true
attribute :hostname, kind_of: String, required: true