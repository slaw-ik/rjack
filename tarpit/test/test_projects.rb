#!/usr/bin/env jruby
#. hashdot.profile += jruby-shortlived
#. jruby.launch.inproc = false

#--
# Copyright (c) 2009-2011 David Kellum
#
# Licensed under the Apache License, Version 2.0 (the "License"); you
# may not use this file except in compliance with the License.  You may
# obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied.  See the License for the specific language governing
# permissions and limitations under the License.
#++

require File.join( File.dirname( __FILE__ ), "setup" )

require 'rjack-tarpit'
require 'fileutils'

class TestProjects < MiniTest::Unit::TestCase
  include FileUtils

  BASEDIR = File.dirname( __FILE__ )

  if RUBY_PLATFORM =~ /java/

    def setup
      # We clean anyway, but for test consistency...
      %w[ jproject zookeeper ].each do |p|
        rm_rf( path( p, 'target' ) )
        rm_rf( path( p, 'pkg' ) )
      end
    end

    def test_jproject
      Dir.chdir( path( 'jproject' ) ) do
        assert runv( "clean test gem" )
      end
    end

    def test_zookeeper
      Dir.chdir( path( 'zookeeper' ) ) do
        assert runv( "manifest" )
        assert runv( "clean test gem" )
      end
    end

  end

  def path( *args )
    File.join( BASEDIR, *args )
  end

  def runv( targets )
    c = "jruby -S rake #{targets}"
    puts
    puts "=== #{Dir.pwd} > #{c} ==="
    # Disable seemingly lame bundler ENV mods to make these tests work
    # the same as if we ran it in our own shell.
    r = Bundler.with_clean_env { system( c ) }
    puts
    r
  end

end
