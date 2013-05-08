Firmware para la MallaCritica
=============================

Ir a las [descargas][] de [OpenWrt][] y descargar el [ImageBuilder][] para la
versión y hardware que vamos a usar, en este momento [Attidude Adjustment][1].

    wget http://....OpenWrt-ImageBuilder-ar71xx_generic-for-linux-i486.tar.bz2
    tar xf OpenWrt-ImageBuilder-ar71xx_generic-for-linux-i486.tar.bz2

Esta imagen es genérica para todos los ar71xx, es decir los TPLink que usamos
normalmente.


Preparar los archivos
---------------------

Crear un directorio con todos los archivos de configuración que queramos
incluir en la imagen.

Por ahora sólo necesitamos la configuración de fstab para automontar el root
del sistema y tener más espacio para instalar programas y servir archivos.

    git clone git://git.hackcoop.com.ar/MallaCritica.git

Esto clona el overlay dentro del directorio *MallaCritica/files/*.


Preparar la imagen
------------------

Para crear una imagen hay que saber el nombre del perfil para el modelo del
router. Con

    make info

se pueden ver todos los modelos soportados con los paquetes que incluyen por
defecto. Para el TPLink WR703N el nombre de perfil es *TLWR703N*.

> Atención: si se escribe mal el nombre del perfil o de uno que no exista
> ImageBuilder corre igual pero no devuelve los firmware.bin.

Para crear la imagen por defecto, basta con:

    make image PROFILE=TLWR703N

Pero para agregar los paquetes de MallaCritica y los archivos de configuración
hay que agregar dos variables más:

    make image PROFILE=TLWR703N FILES=MallaCritica/files/ PACKAGES="..."

La lista de paquetes a usar (o no usar, si se prefijan con "-", ej. "-unrar")
se encuentra dentro de files/packages.list. Para pasársela al `make` hay que
cargarla en una variable:

    PACKAGES="$(cat MallaCritica/packages.list | tr "\n" " ")"
    make image PROFILE=TLWR703N FILES=files/ PACKAGES="$PACKAGES"

Luego de correr este último comando, el firmware para MallaCritica debería
encontrarse en el directorio *bin/ar71xx/*.


Instalación
-----------

Flashear el router normalmente o siguiendo las instrucciones de
[sys.upgrade][].

Preparar la tarjeta de memoria para el sistema externo. Se crean dos
particiones, la primera de tipo ext4 y la segunda swap. La regla es usar
2 o 4 veces la cantidad de RAM para la swap.

Luego, se descomprime el archivo rootfs.tar.gz en la primera partición. Este
archivo contiene el sistema base.

    mount /dev/sdb1 /mnt
    cd /mnt
    tar xf /path/a/imagebuilder/bin/ar71xx/openwrt-ar71xx-generic-rootfs.tar.gz
    cd ..
    umount /mnt

Una vez que está hecho esto, se conecta la tarjeta de memoria en el router
apagado y se lo enciende. Si todo va bien, al loguearse por telnet, el comando
`df -h` debería mostrar el tamaño de la tarjeta para *rootfs*.


Compilar paquetes
-----------------

Para compilar los paquetes del directorio _packages_ hay que descargar el
[SDK][2] y descomprimirlo.  Para compilar un paquete, hay que copiar el
directorio, por ejemplo _package/sundown/_, dentro del directorio de paquetes
del SDK (_package/_).  Luego se lo compila:

    $ make package/sundown/compile

Si la compilación falla, se puede ver el error agregando verborragia:

    $ make package/sundown/compile V=99

Los paquetes (.ipk) se guardan dentro del directorio _bin/ar71xx/packages/_

Si el paquete tiene dependencias que no están incluidas en el firmware
original, la compilación va a fallar porque el SDK no va a encontrar las
cabeceras.  Para incluirlas hay que copiar el directorio del paquete junto con
el que se quiere compilar.  Los paquetes originales de OpenWrt se encuentran
en el [git o svn de paquetes][3].  Lo mejor es usar los paquetes de la versión
de OpenWrt para la que se está empaquetando.

    $ git clone git://git.openwrt.org/12.09/packages.git owrt_packages
    $ cp -r package/opentracker sdk/packages/
    $ cp -r owrt_packages/lib/libowfat sdk/packages
    $ cd sdk
    $ make package/opentracker/compile

Con esto se compilan todas las dependencias y el paquete que necesitamos.

Si lo que necesitamos es compilar un módulo del kernel, al parecer no es
posible hacerlo desde el SDK sino que hay que compilar OpenWrt desde cero (o al
menos esto era cierto la última vez que probé -- fauno).


Crear un repositorio
--------------------

Para generar la base de datos de paquetes incluyendo los propios, hay que
copiar los paquetes al directorio _packages/_ y correr el siguiente comando del
ImageBuilder:

    $ cp sdk/bin/ar71xx/packages/* ib/packages/
    $ cd ib
    $ make package_index

El directorio _packages/_ del ImageBuilder contiene todos los paquetes
distribuidos por OpenWrt, por lo que se puede utilizar como un mirror local si
se sirve ese directorio por HTTP con un servidor web y se edita el _opkg.conf_
del router.

Tip: También es posible ahorrarse esos pasos y copiar _ib/packages_ a un
directorio servido por web y hacer links simbólicos al ib y al sdk:

    $ mv ib/packages /srv/http/
    $ rm -r sdk/bin/ar71xx/packages
    $ ln -s /srv/http/packages ib/
    $ ln -s /srv/http/packages sdk/bin/ar71xx/

Con esto sólo es necesario correr `make package_index` desde el ImageBuilder
("ib").


Problemas conocidos
-------------------

* La partición swap no es montada automáticamente: correr
  `swapon -f /dev/sda2`. Con esto se ajusta el _page size_.

[ImageBuilder]: http://wiki.openwrt.org/doc/howto/obtain.firmware.generate
[descargas]: http://downloads.openwrt.org
[OpenWrt]: https://openwrt.org
[sys.upgrade]: http://wiki.openwrt.org/doc/howto/sys.upgrade
[1]: http://downloads.openwrt.org/attitude_adjustment/12.09-rc2/ar71xx/generic/OpenWrt-ImageBuilder-ar71xx_generic-for-linux-i486.tar.bz2
[2]: http://downloads.openwrt.org/attitude_adjustment/12.09-rc2/ar71xx/generic/OpenWrt-SDK-ar71xx-for-linux-i486-gcc-4.6-linaro_uClibc-0.9.33.2.tar.bz2
[3]: https://dev.openwrt.org/wiki/GetSource
