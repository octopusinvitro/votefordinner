module VoteAssets

  # require "sass"

  def self.included (klass)
    environment = Sprockets::Environment.new klass.settings.root
    environment.append_path "../assets/css/"
    environment.append_path "../assets/js/"
    klass.set :environment, environment

    # compress assets
    # environment.js_compressor  = :uglify
    environment.css_compressor = :scss

    klass.get "/assets/*" do
      env["PATH_INFO"].sub!("/assets", "")
      klass.settings.environment.call(env)
    end

  end
end
