class Gb < Formula
  desc "A Tiny tool for displaying your git branches nicely."
  homepage "https://github.com/ryochin/gb"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryochin/gb/releases/download/v#{version}/gb-v#{version}-aarch64-apple-darwin"
      sha256 "3ac4955d0464ac3a46de2b4a63b64904436ccbb937d69f5157e2266f076e1027"
    else
      url "https://github.com/ryochin/gb/releases/download/v#{version}/gb-v#{version}-x86_64-apple-darwin"
      sha256 "1dc9d3b567a71ab1c1ba29ce0be08a65c288fc8c5159da249283530103ce8c39"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryochin/gb/releases/download/v#{version}/gb-v#{version}-aarch64-unknown-linux-gnu"
      sha256 "8f9ef973a14a4649ddd9390f42ff53f1b430af7f3833cc038bcbd4a3a635c207"
    else
      url "https://github.com/ryochin/gb/releases/download/v#{version}/gb-v#{version}-x86_64-unknown-linux-gnu"
      sha256 "a4f4069c01c3f9c6d689baa3429f13292f525362bd43b8b61c4451d00e9d9c76"
    end
  end

  def install
    bin.install Dir["gb-v#{version}*"].first => "gb"
  end

  test do
    assert_match version, shell_output("#{bin}/gb --version")
  end
end
