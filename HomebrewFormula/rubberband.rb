require 'formula'

# Originally from http://tuohela.net/irc/rubberband.rb
# Modified by mtolly to include libsndfile dependency,
# and to install pkg-config file.

class Rubberband < Formula
  homepage ''
  url 'http://code.breakfastquay.com/attachments/download/34/rubberband-1.8.1.tar.bz2'
  sha256 'ff0c63b0b5ce41f937a8a3bc560f27918c5fe0b90c6bc1cb70829b86ada82b75'

  depends_on 'pkg-config'
  depends_on 'libsamplerate'
  depends_on 'libsndfile'
  depends_on 'vamp-plugin-sdk' => :optional

  if MacOS.version >= :yosemite
    patch :p1 do
      url "https://raw.githubusercontent.com/j3ffhubb/homebrew-musikernel/master/HomebrewFormula/rubberband-1.8.1-yosemite.diff"
      #url "http://tuohela.net/irc/rubberband-1.8.1-yosemite.diff"
      sha256 "b3a4facb412942ce20dfc1b27f85755e5d812ad6e7c7b0e61656fa4a6de5109e"
    end
  end

  def install
    system "make", "-f", "Makefile.osx"
    bin.install "bin/rubberband"
    lib.install "lib/librubberband.dylib"
    include.install Dir['rubberband']
    (lib+'pkgconfig/rubberband.pc').write pc_file
  end

  def pc_file; <<-EOS
    prefix=#{opt_prefix}
    exec_prefix=${prefix}
    libdir=${exec_prefix}/lib
    includedir=${prefix}/include

    Name: rubberband
    Version: 1.8.1
    Description:
    Libs: -L${libdir} -lrubberband
    Cflags: -I${includedir}
    EOS
  end

  test do
    system "false"
  end
end
