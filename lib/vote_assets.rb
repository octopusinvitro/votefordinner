module VoteAssets

  def self.included (klass)
    environment = Sprockets::Environment.new klass.settings.root
    environment.append_path "../assets/css/"
    environment.append_path "../assets/js/"
    klass.set :environment, environment

    # compress assets
    environment.css_compressor = :scss
    # environment.js_compressor  = :uglify

    klass.get "/assets/*" do
      env["PATH_INFO"].sub!("/assets", "")
      klass.settings.environment.call(env)
    end

  end
end
