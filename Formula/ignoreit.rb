class Ignoreit < Formula
  desc "Quickly load .gitignore templates"
  homepage "https://github.com/jewlexx/ignoreit"
  url "https://github.com/jewlexx/ignoreit/archive/refs/tags/v3.0.0.tar.gz"
  sha256 "d35bf50294bce2feddf2e2d8c63ea9a80e2958f7975dce324e8b5f00eaa31af0"
  license "MIT"

  bottle do
    root_url "https://github.com/jewlexx/homebrew-tap/releases/download/ignoreit-3.0.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "bb8267f82ae0352a0f920c1c1a0869a138f20e1368710ac08a7f0fe68fa1d877"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "935dd021d4f23c4f17c9c187a8af1cbdc62b14c90b6716b9b0ff94461e92fbb6"
  end

  depends_on "rust" => :build
  depends_on "sqlx-cli" => :build

  def install
    ENV["DATABASE_URL"] = "sqlite:gitignores.db"
    system "sqlx", "database", "create"
    system "sqlx", "migrate", "run"
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"ignoreit", "pull", "rust", "-o=#{testpath}/test.gitignore"
    assert_path_exists testpath/"test.gitignore"
  end
end
