from ubuntu

volume /www
onbuild add ./content /md
add . /build
workdir /build

cmd ["sh", "compile.sh"]
