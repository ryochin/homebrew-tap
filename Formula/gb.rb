class Gb < Formula
  desc "A Tiny tool for displaying your git branches nicely."
  homepage "https://github.com/ryochin/gb"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryochin/gb/releases/download/v#{version}/gb-v#{version}-aarch64-apple-darwin"
      sha256 "682016392252549a3619d2a67286ea5c8b1c84c658f61a1723db5979d8013230"
    else
      url "https://github.com/ryochin/gb/releases/download/v#{version}/gb-v#{version}-x86_64-apple-darwin"
      sha256 "e2bee428bbb05d76ef1b0d5810f7f80a0b2fc8d8f5de4a446fcadfe748424aa4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryochin/gb/releases/download/v#{version}/gb-v#{version}-aarch64-unknown-linux-gnu"
      sha256 "71780df76f8de9323cadbadb4fe4fe83d11394d01374ca5670be5f85c73a2460"
    else
      url "https://github.com/ryochin/gb/releases/download/v#{version}/gb-v#{version}-x86_64-unknown-linux-gnu"
      sha256 "843b4a90d03cc5ecde04736fda20b169cfe10a4363cfe285a0b57c9bbfa9650a"
    end
  end

  def install
    bin.install Dir["gb-v#{version}*"].first => "gb"
  end

  test do
    assert_match version, shell_output("#{bin}/gb --version")
  end
end
