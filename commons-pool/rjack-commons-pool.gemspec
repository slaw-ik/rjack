# -*- ruby -*-

gem 'rjack-tarpit', '~> 2.0'
require 'rjack-tarpit/spec'

RJack::TarPit.specify do |s|
  require 'rjack-commons-pool/base'

  s.version = RJack::CommonsPool::VERSION

  s.add_developer( 'David Kellum', 'dek-oss@gravitext.com' )

  s.depend 'minitest',              '~> 4.7.4',     :dev
  s.depend 'rdoc',                  '~> 4.0.1',     :dev

  s.assembly_version = '1.0'

  s.jars = [ "commons-pool-#{ RJack::CommonsPool::POOL_VERSION }.jar" ]
end
