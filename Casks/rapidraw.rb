cask "rapidraw" do
  arch arm: "macos-14_aarch64", intel: "macos-15-intel_x64"

  version "1.6.5"
  sha256 arm:   "ae2c9d353b721068de32b2ee972ff83fdf54ba43cc4cf7bafe32e66d34065af2",
         intel: "b88067ede66f9c2954217f5abd2fb33525d71ff647291ea5507daa3c9ae0f271"

  url "https://github.com/CyberTimon/RapidRAW/releases/download/v#{version}/02_RapidRAW_v#{version}_#{arch}.dmg"
  name "RapidRAW"
  desc "Open-source RAW photo editor"
  homepage "https://github.com/CyberTimon/RapidRAW"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "RapidRAW.app"
end
