class Easyedit < Formula
  desc "Easy editor on FreeBSD"
  homepage "http://mahon.cwx.net/"

  url "http://web.archive.org/web/20120206120635/http://mahon.cwx.net/sources/ee-1.5.2.src.tgz"
  sha256 "e08d7511a48b43ee354042fe3fe7d9cb3431238caedcf4ac729c61a447003918"

  patch do
    url "https://gist.githubusercontent.com/ryochin/462a600ec6e8345f5cd2cf9126a8d3c8/raw/15fd0ee11681183a387ca442b61d17887f05ec2c/ee-signal.patch"
    sha256 "cbf14def33e5b63f5f4fa6d8d774b8d3e4d292cf5c33cdc1979ecede000c8b6c"
  end

  def install
    system "sh ./create.make"
    system "make -f make.local"
    bin.install "ee" => "easyedit"

    man1.install "ee.1"
  end
end
