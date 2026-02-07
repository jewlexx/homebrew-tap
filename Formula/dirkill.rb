class Dirkill < Formula
  desc "Fast, reliable and interactive directory deletion tool"
  homepage "https://github.com/jewlexx/dirkill"
  url "https://github.com/jewlexx/dirkill/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "e5096f9e550a9281ce790379f81b9806f71e9b4104ebfd117a0bda6b43f8bccb"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/jewlexx/homebrew-tap/releases/download/dirkill-0.3.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "de82f4b9a551fa4aba53ed1fe773052c46fe42f50e781f9d920a1ec9ad2d6fd4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6a927b5a41e6cf470c4df0d80d75afc890ebf91d0e945efebad5bab1cc14b80b"
  end

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
