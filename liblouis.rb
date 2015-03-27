require 'formula'

class Liblouis < Formula
  homepage 'https://code.google.com/p/liblouis'
  url 'http://liblouis.googlecode.com/files/liblouis-2.5.2.tar.gz'
  version '2.5.2'
  sha1 '93437f3c3a9a178ad08bdf6daca2a82cf3df2cc2'

  depends_on 'pkg-config' => :build

  option 'enable-ucs4', 'Enable 4 byte-wide characters.'
  option 'with-python', 'Build Python bindings.'

  def install
    args = ["--disable-debug",
            "--disable-dependency-tracking",
            "--prefix=#{prefix}"]
    args << "--enable-ucs4" if build.include? 'enable-ucs4'

    system "./configure", *args
    system "make"
    system "make check"
    system "make install"

    if build.include? 'with-python'
      python_lib = lib/which_python/'site-packages'
      python_lib.mkpath
      ENV.append 'PYTHONPATH', python_lib
      ENV.append 'LD_LIBRARY_PATH', lib
      cd 'python' do
        system "python", "setup.py", "install", "--install-lib=#{python_lib}"
      end
    end
  end

  def which_python
    "python" + `python -c 'import sys;print(sys.version[:3])'`.strip
  end
end
