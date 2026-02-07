class Dirkill < Formula
  desc "Fast, reliable and interactive directory deletion tool"
  homepage "https://github.com/jewlexx/dirkill"
  url "https://github.com/jewlexx/dirkill/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "e5096f9e550a9281ce790379f81b9806f71e9b4104ebfd117a0bda6b43f8bccb"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/jewlexx/homebrew-tap/releases/download/dirkill-0.3.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "670eb0162c0bbf103a8ad0718b3003cd54b43e966f4638f88b354e04e7685034"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "baf1c4c81a8ba7489d48734494ea6f2570d5357f95c821e4526e00e7610e1ca8"
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
