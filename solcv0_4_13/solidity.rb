require 'formula'

class Solidity < Formula

  desc "The Solidity Contract-Oriented Programming Language"
  homepage "http://solidity.readthedocs.org"
  url "https://github.com/ethereum/solidity/releases/download/v0.4.13/solidity_0.4.13.tar.gz"
  version "0.4.13"
  sha256 "09a987a973ab8f614a836039c022125531475392bee510c4ca394deaea35f82a"

  depends_on "cmake" => :build
  depends_on "boost" => "c++11"
  depends_on "cryptopp"
  depends_on "gmp"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "#{bin}/solc", "--version"
  end
end
