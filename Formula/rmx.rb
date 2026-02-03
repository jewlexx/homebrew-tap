class Rmx < Formula
  desc "Extended rm command"
  homepage "https://codeberg.org/cordor/rmx"
  url "https://codeberg.org/cordor/rmx/archive/v0.2.2.tar.gz"
  sha256 "25f2a86b5af770059ab7f1af74b0a693e380d4f7f08cd2729864593728eb4c0b"
  license "GPL-3.0-or-later"

  bottle do
    root_url "https://github.com/jewlexx/homebrew-tap/releases/download/rmx-0.2.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "a62be9b77e9200bd3e85e996407dd20496ba97463d37a37b9f813d45e7490fd4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "65aff3007930102cbfb242b7bb836414a755127e73644361fc88dba88cd983f6"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test rmx`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    touch testpath/"test.txt"
    assert_path_exists testpath/"test.txt"
    system "#{bin}/rmx", testpath/"test.txt"
    refute_path_exists testpath/"test.txt"
  end
end
