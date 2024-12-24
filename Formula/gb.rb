class Gb < Formula
  desc "A Tiny tool for displaying your git branches nicely."
  homepage "https://github.com/ryochin/gb"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryochin/gb/releases/download/v#{version}/gb-v#{version}-aarch64-apple-darwin"
      sha256 "dbd59d2d8df7a24ee74e7215244f43510d0c89bb4b176b980d0f11085dedd746"
    else
      url "https://github.com/ryochin/gb/releases/download/v#{version}/gb-v#{version}-x86_64-apple-darwin"
      sha256 "b6a456b3884d2de6332fedacde8c4561c0a402594dd12d174ec9163c3c85fa9e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryochin/gb/releases/download/v#{version}/gb-v#{version}-aarch64-unknown-linux-gnu"
      sha256 "3199127ea33a297c4ad25e504039da53ee195e8d118af96a653414763987713c"
    else
      url "https://github.com/ryochin/gb/releases/download/v#{version}/gb-v#{version}-x86_64-unknown-linux-gnu"
      sha256 "40d78990bbef8f283133ef1ef15e630b8056ce7399cf0eb218d7cdcd7ffd8010"
    end
  end

  def install
    bin.install Dir["gb-v#{version}*"].first => "gb"
  end

  test do
    assert_match version, shell_output("#{bin}/gb --version")
  end
end
