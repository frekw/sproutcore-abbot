# Import all build tasks
import *Dir.glob(File.join(File.dirname(current_path), 'buildtasks', '**', '*.rake'))

mode :all do
  config :all,

    # REQUIRED CONFIGS 
    # You will not usually need to override these configs, but the code 
    # assumes they will be present, so you must support them.
    :build_prefix => 'tmp/build',
    :staging_prefix => 'tmp/staging',
    :url_prefix    => 'static',
  
    # Defines the directories that may contain targets, and maps them to a 
    # target type.  When a project tries to find all of the targets in a 
    # project, it will use this map to find them.
    :target_types => { 
      :apps       => :app, 
      :clients    => :app, 
      :frameworks => :framework,
      :themes     => :theme
    },
  
    # Allows the target to have other targets nested inside of it.  Override 
    # this in your target Buildfile to disable nesting.
    :allow_nested_targets => true,

    # The default preferred language.  Assets will be pulled from this 
    # language unless otherwise specified.
    :preferred_language => :en,
    
    # Do not include fixtures in built project.
    :load_fixtures => false,
    
    # Do not include debug directory in built project
    :load_debug => false,
    
    # Do not load protocols in production mode
    :load_protocols => false,
    
    # Do not build tests.
    :load_tests => false,
    
    # Generate a combined javascript and stylesheet
    :combine_javascript => true,
    :combine_stylesheets => true,
    
    # by default all targets autobuild
    :autobuild => true,
    
    # by default do not minify javacript or stylesheets
    :minify => true,
    :minify_css => false,
    
    # use the default layout defined in SproutCore
    :layout => 'sproutcore:lib/index.rhtml',
    
    # name a framework to use as the theme.  will be included in required
    # frameworks automatically if found.
    :theme  => 'sproutcore/standard_theme',
    
    :use_packed => true
end


mode :debug do
  config :all,
  
    # in debug mode, load fixtures, debug, tests, and protocols
    :load_fixtures  => true,
    :load_debug     => true,
    :load_tests     => true,
    :load_protocols => true,
    
    # Do not combine javascript and stylesheet
    :combine_javascript => false,
    :combine_stylesheets => false,
    
    :minify_javascript => false,
    
    :build_prefix => 'tmp/debug/build',
    :staging_prefix => 'tmp/debug/staging',
    
    # debug settings for sc-server
    :serve_exceptions => true,
    :reload_project   => true,

    # In debug mode, we want to simply compute the build number each time
    # to ensure the latest version is always loaded.
    :build_number     => nil,
    
    # the fast build number method uses file mtimes.  It will work correctly
    # on a single machine, but it may produce different build numbers from
    # one machine to the next, so it should not be used in production mode 
    # builds.
    :compute_fast_builder_numbers => true,
    
    :use_packed => false
    

end


