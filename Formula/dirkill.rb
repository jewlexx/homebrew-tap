class Dirkill < Formula
  desc "Fast, reliable and interactive directory deletion tool"
  homepage "https://github.com/jewlexx/dirkill"
  url "https://github.com/jewlexx/dirkill/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "2df343e9462011343acbd6443a90ce79e1ddc4e423c6027fc526ccbad07a8619"
  license "Apache-2.0"

  depends_on "rust" => :build

  # Additional dependency
  # resource "" do
  #   url ""
  #   sha256 ""
  # end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "true"
  end
end
