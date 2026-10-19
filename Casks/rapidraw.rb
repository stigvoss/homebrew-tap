cask "rapidraw" do
  arch arm: "14_aarch64", intel: "15-intel_x64"

  version "1.6.6"
  sha256 arm:   "2dac5dc7f23d86b60c8f6b96e9c25619fea8748ee5be0056b8899e4da1878565",
         intel: "2ec697753d4b784105d127eae865faaa7e7bd3a553d5430933d4434f0d429ac3"

  url "https://github.com/CyberTimon/RapidRAW/releases/download/v#{version}/02_RapidRAW_v#{version}_macos-#{arch}.dmg"
  name "RapidRAW"
  desc "GPU-accelerated RAW image editor"
  homepage "https://github.com/CyberTimon/RapidRAW"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "RapidRAW.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-d", "com.apple.quarantine", "{{appdir}}/RapidRAW.app"],
        sudo: false
  end

  zap trash: [
    "~/Library/Application Support/io.github.CyberTimon.RapidRAW",
    "~/Library/Caches/io.github.CyberTimon.RapidRAW",
    "~/Library/Preferences/io.github.CyberTimon.RapidRAW.plist",
    "~/Library/WebKit/io.github.CyberTimon.RapidRAW",
  ]
end
