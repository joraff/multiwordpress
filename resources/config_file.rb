actions :create

default_action :create

attribute :docroot, kind_of: String, required: true
attribute :database, kind_of: String
attribute :db_username, kind_of: String
attribute :db_password, kind_of: String