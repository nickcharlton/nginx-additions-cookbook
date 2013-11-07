name             'nginx-additions'
maintainer       'Nick Charlton'
maintainer_email 'nick@nickcharlton.net'
license          'MIT'
description      'Configures a collection of additions to the default nginx cookbook.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

# it follows Debian convention, so let's be explicit
supports 'ubuntu'
supports 'debian'

# and obviously, we need nginx
depends 'nginx'

