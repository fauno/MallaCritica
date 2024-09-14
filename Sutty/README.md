# Sutty móvil

* Raspberry Pi (cualquier modelo)
* OpenWrt
* Computadora con Linux

## Comenzar

Primero, clonar este repositorio, que ya tiene todos los archivos
necesarios:

```bash
cd ~/Projects/Sutty/ # Si somos suttiers :B
git clone https://gitea.sutty.coop.ar/Sutty/Movil.git
cd Movil # Ingresar al directorio
```

## Descargar la base

En la [wiki de
OpenWrt](https://openwrt.org/toh/raspberry_pi_foundation/raspberry_pi#installation)
hay una tabla con los _firmware_ soportados para cada modelo de
Raspberry Pi, pero nosotres lo que queremos es el Image Builder
correspondiente.

Con Image Builder podemos generar un _firmware_ propio de OpenWrt sin
tener que instalar los paquetes y configuraciones manualmente.

Para eso hay que copiar el _link_ de instalación y eliminarle la parte
del archivo:

```
https://downloads.openwrt.org/releases/21.02.3/targets/bcm27xx/bcm2708/openwrt-21.02.3-bcm27xx-bcm2708-rpi-ext4-factory.img.gz

# Eliminar "openwrt-21.02.3-bcm27xx-bcm2708-rpi-ext4-factory.img.gz"

https://downloads.openwrt.org/releases/21.02.3/targets/bcm27xx/bcm2708/
```

Dentro de ese directorio, buscar y descargar el archivo que comience con
`openwrt-imagebuilder-`.  Luego, descomprimirlo.  Para hacer todo de una
sola vez:

```bash
wget -O - PEGAR_LA_URL_AQUI | tar xvJ
# Ingresar al directorio creado, por ejemplo
cd openwrt-imagebuilder # Presionar Tab para autocompletar el resto
# Obtener información del firmware por defecto y perfiles
make info
```

Devuelve:

```
Current Target: "bcm27xx/bcm2708"
Current Revision: "r16554-1d4dea6d4f"
Default Packages: base-files ca-bundle dropbear fstools libc libgcc libustream-wolfssl logd mtd netifd opkg uci uclient-fetch urandom-seed busybox procd bcm27xx-gpu-fw kmod-usb-hid kmod-sound-core kmod-sound-arm-bcm2835 kmod-fs-vfat kmod-nls-cp437 kmod-nls-iso8859-1 partx-utils mkf2fs e2fsprogs dnsmasq firewall ip6tables iptables kmod-ipt-offload odhcp6c odhcpd-ipv6only ppp ppp-mod-pppoe
Available Profiles:

rpi:
    Raspberry Pi B/B+/CM/Zero/ZeroW
    Packages: cypress-firmware-43430-sdio cypress-nvram-43430-sdio-rpi-zero-w kmod-brcmfmac wpad-basic-wolfssl iwinfo
    hasImageMetadata: 1
    SupportedDevices: rpi-b rpi-b-plus rpi-cm rpi-zero rpi-zero-w raspberrypi,model-b raspberrypi,model-b-plus raspberrypi,model-b-rev2 raspberrypi,compute-module raspberrypi,compute-module-1 raspberrypi,model-zero raspberrypi,model-zero-w
```

**Donde** `rpi` **es el nombre del perfil que vamos a usar luego.**
Dependiendo del Image Builder puede haber varios perfiles, especialmente
si estamos trabajando con _routers_.

```
# Comprobar que tenemos todas las dependencias instaladas
make image PROFILE=rpi # Cambiar por el nombre del perfil que necesitemos
```

En Archlinux y derivados probablemente tengamos que instalar el
paquete `base-devel`, en Ubuntu/Debian/Mint y otros, el paquete
`build-essential`.

## Generar el _firmware_

Los archivos de configuración y la lista de paquetes a instalar se
encuentra en el repositorio que clonamos.  Hay que decirle al Image
Builder dónde encontrarlos.

```
packages # la lista de paquetes a incluir/excluir
files/   # el directorio con todos los archivos de configuración
```

Para generar un _firmware_ sin modificaciones, podemos correr `make
image PROFILE=rpi` donde `PROFILE` es el perfil que estemos utilizando.
Si todo sale bien podemos probar con modificaciones:

```bash
# Usamos ../ asumiendo que el Image Builder se descargó dentro del
# repositorio Movil
#
# `tr` reemplaza los saltos de línea por espacios del archivo packages
make image PROFILE=rpi FILES=../files/ PACKAGES="$(tr "\n" " " < ../packages)"
```

Esto genera una imagen nueva superponiendo el directorio `files/` al `/`
del _firmware_ y agregando o quitando paquetes del archivo `packages`.
