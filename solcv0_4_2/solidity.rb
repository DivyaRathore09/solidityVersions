require 'formula'

class Solidity < Formula

  desc "The Solidity Contract-Oriented Programming Language"
  homepage "http://solidity.readthedocs.org"
  url "https://github.com/ethereum/solidity/archive/v0.4.2.tar.gz"
  version "0.4.2"
  sha256 "0dd176919cab5492aecb27d1d8de39182b5e880979d5082fca6d7a01ebce28f1"

  depends_on "cmake" => :build
  depends_on "boost" => "c++11"
  depends_on "cryptopp"
  depends_on "gmp"
  depends_on "jsoncpp"

  def install
    system "/bin/echo 'af6afb04' > commit_hash.txt"
    touch "prerelease.txt"
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "#{bin}/solc", "--version"
  end
end
