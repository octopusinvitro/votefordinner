require "vote_assets"

class VoteAssetsTester < Sinatra::Base
  include VoteAssets
  set :views, "#{settings.root}/../views"
end

describe "VoteAssets" do
  def app
    VoteAssetsTester.new
  end

  it "loads reset stylesheet" do
    get "/assets/main.css"
    expect(last_response.body).to include("normalize")
  end

  it "loads base stylesheet" do
    get "/assets/main.css"
    expect(last_response.body).to include(".browserupgrade")
  end

  it "compresses css" do
    get "/assets/main.css"
    expect(last_response.body.count("\n")).to eq(1)
  end

end
