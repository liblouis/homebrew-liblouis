require 'formula'

class Liblouisutdml < Formula
  homepage 'http://code.google.com/p/liblouisutdml'
  url 'https://liblouisutdml.googlecode.com/files/liblouisutdml-2.5.0.tar.gz'
  version '2.5.0'
  sha1 'ea2be45be601e2db4ba0757f87febccf9d507ea8'

  depends_on 'liblouis'
  depends_on 'libxml2'
  depends_on 'pkg-config' => :build

  def install
    ENV['CFLAGS'] = '-I/System/Library/Frameworks/JavaVM.framework/Headers'
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
