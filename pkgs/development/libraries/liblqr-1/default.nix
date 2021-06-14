{ lib, stdenv, fetchurl, pkg-config, glib }:

stdenv.mkDerivation rec {
  name = "liblqr-1-0.4.2";

  src = fetchurl {
    url = "${meta.homepage}/local--files/en:download-page/${name}.tar.bz2";
    sha256 = "0dzikxzjz5zmy3vnydh90aqk23q0qm8ykx6plz6p4z90zlp84fhp";
  };

  nativeBuildInputs = [ pkg-config ];
  propagatedBuildInputs = [ glib ];

  meta = with lib; {
    homepage = "http://liblqr.wikidot.com";
    description = "Seam-carving C/C++ library called Liquid Rescaling";
    platforms = platforms.all;
    license = with licenses; [ gpl3 lgpl3 ];
  };
}
