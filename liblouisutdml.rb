require 'formula'

class Liblouisutdml < Formula
  homepage 'http://code.google.com/p/liblouisutdml'
  url 'http://www.abilitiessoft.com/liblouisutdml-2.3.1.tar.gz'
  version '2.3.1'
  sha1 '8a787530fc08f400cededd5474d5e1ba99158682'

  depends_on 'liblouis'
  depends_on 'libxml2'
  depends_on 'pkg-config' => :build

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    system "make check"
    system "make install"
  end
end
