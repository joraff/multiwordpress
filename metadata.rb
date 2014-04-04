name             'wordpress'
maintainer       'TEXAS A&M UNIVERSITY College of Liberal Arts'
maintainer_email 'jrafferty@tamu.edu'
license          'All rights reserved'
description      'Installs/Configures wordpress'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "mysql"
depends "apache2"
depends "nginx"
depends "php"
depends "database"
depends "ark"
