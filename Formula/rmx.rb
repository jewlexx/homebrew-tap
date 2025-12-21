# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://docs.brew.sh/rubydoc/Formula
class Rmx < Formula
  desc "Extended rm command"
  homepage "https://codeberg.org/cordor/rmx"
  url "https://codeberg.org/cordor/rmx/archive/v0.2.1.tar.gz"
  sha256 "040fba2ab4fbed88956f06e9a6f784ec6de174481cc222840f90d78e1b072597"
  license "GPL-3.0-or-later"

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
    system "touch", testpath/"test.txt"
    assert_predicate testpath/"test.txt", :exist?
    system "#{bin}/rmx", testpath/"test.txt"
    refute_predicate testpath/"test.txt", :exist?
  end
end
