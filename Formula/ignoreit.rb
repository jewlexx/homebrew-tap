class Ignoreit < Formula
  desc "Quickly load .gitignore templates"
  homepage "https://github.com/jewlexx/ignoreit"
  url "https://github.com/jewlexx/ignoreit/archive/refs/tags/v3.0.0.tar.gz"
  sha256 "d35bf50294bce2feddf2e2d8c63ea9a80e2958f7975dce324e8b5f00eaa31af0"
  license "MIT"

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
