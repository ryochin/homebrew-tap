class Gb < Formula
  desc "A Tiny tool for displaying your git branches nicely."
  homepage "https://github.com/ryochin/gb"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryochin/gb/releases/download/v#{version}/gb-v#{version}-aarch64-apple-darwin"
      sha256 "5d3c63457b3d3b460b816e9bddc3872992b03ecabb1246f3644b96f5fe106163"
    else
      url "https://github.com/ryochin/gb/releases/download/v#{version}/gb-v#{version}-x86_64-apple-darwin"
      sha256 "91632a5b6e02c92151d730397cd1f5b5109576812e006f61aab2c76a3b0204dc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryochin/gb/releases/download/v#{version}/gb-v#{version}-aarch64-unknown-linux-gnu"
      sha256 "2401d9a3c07dcbb06e9fbd4498a8df1395d8d90861b5a1a976d487e38243da6a"
    else
      url "https://github.com/ryochin/gb/releases/download/v#{version}/gb-v#{version}-x86_64-unknown-linux-gnu"
      sha256 "1411842890a39c73b9ffd0f523ad1f3524e5b9e0f320f7b291125c0122793b98"
    end
  end

  def install
    bin.install Dir["gb-v#{version}*"].first => "gb"
  end

  test do
    assert_match version, shell_output("#{bin}/gb --version")
  end
end
