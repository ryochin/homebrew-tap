class Glint < Formula
  desc "A fast and flexible command-line tool to colorize text lines using regular expressions."
  homepage "https://github.com/ryochin/glint"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ryochin/glint/releases/download/v#{version}/glint-v#{version}-aarch64-apple-darwin"
      sha256 "718c0bb7c971ab32bdf429ba460a5a46ddbe622c711c7c3e06d70b5ae0f3638e"
    else
      url "https://github.com/ryochin/glint/releases/download/v#{version}/glint-v#{version}-x86_64-apple-darwin"
      sha256 "e04834b4a12e7dcee7c895fe85099661bf6f6069a29a24595c69eaccf815830c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ryochin/glint/releases/download/v#{version}/glint-v#{version}-aarch64-unknown-linux-gnu"
      sha256 "1d6a13f3b4d43783e054b6b53a1bed093a160efca65e70843ec939b0c47b46fd"
    else
      url "https://github.com/ryochin/glint/releases/download/v#{version}/glint-v#{version}-x86_64-unknown-linux-gnu"
      sha256 "60ad7e54505a7d5e789b4e0137830ba256d041bcf288312c51fb478405961965"
    end
  end

  def install
    bin.install Dir["glint-v#{version}*"].first => "glint"
  end

  test do
    assert_match version, shell_output("#{bin}/glint --version")
  end
end
