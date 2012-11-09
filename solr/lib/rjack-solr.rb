#--
# Copyright (c) 2012 David Kellum
#
# Licensed under the Apache License, Version 2.0 (the "License"); you
# may not use this file except in compliance with the License.  You
# may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied.  See the License for the specific language governing
# permissions and limitations under the License.
#++

require 'rjack-commons-codec'
require 'rjack-lucene'
require 'rjack-jetty'
require 'rjack-httpclient-3'

require 'rjack-solr/base'

require 'java'

module RJack
  module Solr
    Dir.glob( File.join( LIB_DIR, '*.jar' ) ).each { |jar| require jar }
  end
end