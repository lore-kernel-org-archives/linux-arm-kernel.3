Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06389C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fz/yhgramPyqO11h3jGH/apBj+buGxJvV8oh1IsOZuw=; b=BAZFLQljE+SCossHyDkoeXFuFR
	OF2wuI32owRdQGvnDHgeQsaSQbj0gCTV/gD0Icziu6nW33XbOfUvRI89SMk0XRjjR9rpF0v/RTiR4
	YItsMN+aEy5bYbAEY9XrT03ojAwb+eMfDvyNzSGCnajucPz3MPmh6WpzMPqoPCg02tStHwByCkGG6
	cwL9Ktj515c47nF3XN0A7GwSISAQHqA873hrF7qS++TKeaEXsjJeOEA/Bn770t6v1fa+fBHmIF6vx
	jAkB04Qc48aCV810pcSIL1IU561kPPG2dIBeK2tt6ty4XhkS18xqrXIM9rfXQ0hvvauiJkgjCHiJG
	zgjws0EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvLa-0000000041f-0R3H;
	Mon, 03 Aug 2026 16:17:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvLZ-0000000041U-0jzL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:17:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 598D260A5F;
	Mon,  3 Aug 2026 16:17:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C145D1F00A3D;
	Mon,  3 Aug 2026 16:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785773820;
	bh=fz/yhgramPyqO11h3jGH/apBj+buGxJvV8oh1IsOZuw=;
	h=Date:From:To:Cc:Subject;
	b=F92EOKaNAqy4yd36v4eHUzQ4wojTze8kPEQfkjQJDB1N+R1AY+KoFCrZubtsafb7w
	 /JRuiZxMDXRAo3lpJXE8axmD3KDlYBMIIeQjaXnOy0lymPp8XzVo3TjDVrWW7ImtvN
	 8cXUzc6HO3H/AR7wb1CqRY+fmC/I98Qgcv1MUwG1vAdvxRBIZOivPbklQYLkCajSTn
	 IqKbtejx/171WxG+Mohx8wvsOvfumYpdyAzMJaOxRilMTlfJLsFnrwRMB0MZjxGllK
	 q4/7ou4vGhnfyd8C0nuKLgM7NTZIBy9rxzfo+wX1zOZ2V94sABg/s2ttdrsNwxvnT8
	 qO6u35bs7GuQw==
Date: Tue, 4 Aug 2026 00:16:55 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner DT Changes for 7.3
Message-ID: <anC-91INc6lOHrg1@home.wens.tw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RAz7QJWQMC7QD/S6"
Content-Disposition: inline
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--RAz7QJWQMC7QD/S6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunx=
i-dt-for-7.3

for you to fetch changes up to be145483f8eee440d335ed794a2294fd55ff2a35:

  arm64: dts: allwinner: Correct white-space style (2026-08-03 23:37:01 +08=
00)

The top two patches were just merged, but they are pure whitespace fixes
=66rom the DT maintainer, and they compile correctly. So I just sent them
together.

----------------------------------------------------------------
Allwinner device tree changes for 7.3

Some changes for old chips/devices and some for recent ones.

- A10 PMU interrupt number fixed
- A100/A133 gained LRADC
- enabled overlay support for sun8i-h2-plus pi boards
- A523 family gained consumer IR receiver
- H728-based X96QPRO+ gained SPDIF audio output
- PinePhone's mpu6050 mount orientation fixed
- style fixes

New board added:
- Baijie Helper A133
- NetCube Systems OpenNMC (dobermann)

----------------------------------------------------------------
Alexander Sverdlin (5):
      dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., Ltd.
      dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible
      dt-bindings: input: sun4i-lradc-keys: Add A100/A133 compatible
      arm64: dts: allwinner: a100: Add LRADC node
      arm64: dts: allwinner: A133: add support for Baijie Helper A133 board

Andre Przywara (2):
      ARM: dts: allwinner: a10: Fix PMU interrupt
      arm64: dts: allwinner: a523: enable IR on the Avaota A1

Justin Suess (3):
      media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
      arm64: dts: allwinner: a523: add IR receiver nodes
      arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+

Krzysztof Kozlowski (3):
      ARM: dts: allwinner: sun8i-h3: Correct indentation
      ARM: dts: allwinner: Correct white-space style
      arm64: dts: allwinner: Correct white-space style

Lukas Schmid (3):
      dt-bindings: arm: sunxi: Add NetCube Systems OpenNMC (dobermann)
      riscv: dts: allwinner: d1s-t113: Add uart4 pinctrl required by NetCub=
e Systems OpenNMC
      ARM: dts: allwinner: add support for NetCube Systems OpenNMC (doberma=
nn)

Nisarg Rajput (1):
      ARM: dts: allwinner: enable overlay support for sun8i-h2-plus pi boar=
ds

Ondrej Jirman (1):
      arm64: dts: allwinner: sun50i-a64-pinephone: Fix mpu6050 mount matrix

Per Larsson (2):
      arm64: dts: allwinner: a523: Add SPDIF output PH pin mux option
      arm64: dts: allwinner: a523: Enable SPDIF on X96QPRO+

 Documentation/devicetree/bindings/arm/sunxi.yaml   |   7 +
 .../input/allwinner,sun4i-a10-lradc-keys.yaml      |   1 +
 .../bindings/media/allwinner,sun4i-a10-ir.yaml     |   8 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/allwinner/Makefile               |   5 +
 arch/arm/boot/dts/allwinner/sun4i-a10-gemei-g9.dts |   2 +-
 arch/arm/boot/dts/allwinner/sun4i-a10-inet1.dts    |   4 +-
 arch/arm/boot/dts/allwinner/sun4i-a10.dtsi         |   2 +-
 .../boot/dts/allwinner/sun8i-h3-nanopi-duo2.dts    |   4 +-
 .../allwinner/sun8i-t113s-netcube-dobermann.dts    | 149 ++++++++++++++++
 .../dts/allwinner/sun8i-t113s-netcube-nagami.dtsi  |   2 +-
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi     |  10 ++
 .../allwinner/sun50i-a133-helperboard-core.dtsi    | 197 +++++++++++++++++=
++++
 .../boot/dts/allwinner/sun50i-a133-helperboard.dts | 148 ++++++++++++++++
 .../boot/dts/allwinner/sun50i-a64-pinephone.dtsi   |   4 +-
 .../boot/dts/allwinner/sun50i-a64-sopine.dtsi      |   2 +-
 .../allwinner/sun50i-h5-libretech-all-h5-cc.dts    |   2 +-
 .../boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts  |   2 +-
 .../dts/allwinner/sun50i-h5-orangepi-zero-plus.dts |   2 +-
 .../dts/allwinner/sun50i-h616-orangepi-zero.dtsi   |   2 +-
 .../dts/allwinner/sun50i-h618-orangepi-zero2w.dts  |   2 +-
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi     |  43 +++++
 .../boot/dts/allwinner/sun55i-h728-x96qpro+.dts    |  30 ++++
 .../boot/dts/allwinner/sun55i-t527-avaota-a1.dts   |   8 +-
 .../boot/dts/allwinner/sun55i-t527-orangepi-4a.dts |   2 +-
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi  |   6 +
 27 files changed, 627 insertions(+), 20 deletions(-)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-doberma=
nn.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard-c=
ore.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-helperboard.d=
ts

--RAz7QJWQMC7QD/S6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmpwvvcACgkQOJpUIZwP
JDCfDxAAuv0e7TK4s9DBsBe2bzD+oC230jbqF07LjH5l05/fy8bGNoYwWS8S4nkz
si/vkNMT3xFqJgnVr3XHPkel08a9eDPML6sSi13MqHG+EqGEXBx3zm+gr7pFV3Na
8F5mUuCIRJ8gembiARkMf+F5YLZIq9L762rgzbFs4KHmFoH5r6q4JX4MGqKTQbaV
k41vcbNf7k4n3+Sjt29Ck49nvPsnDLqdvqdEHus8Dn81BxGuLAY3YkM2m10Z5rYO
p3KBsftI2sACzwMQCgLVPNNaoFZtCK5usb2mlC7D0S6uq55LDRas/qfoacvkIxsy
AVmrIbTqGXNE/LQVb4Ct7jP9WcfZI1d70ZgRoSYawLu/uxVjOdcD6XfK9rg0CodB
vzcBQbwU1exg5p0O3qtoH7d24Ru2+Px3qmC7xHQSwNOCOOHqmJlRUSeaQnqmbP7b
paV0kULrJlUBYfRPbl0ZJb1uejocx4eQ945jPSaDNEInWujqEzpG/05uNRNaGaP9
bm4JymygUvWykNn1d3JpNWqCjSnJDHX2ce+OCC9J6zHovECTrNin7jQU7kDliBJw
pO8r3F/lEvc10ySQKX62SFYwlOj+YgD+QYfvF2XNLsuGVNkxQlyPlFAN+uuFRDVa
jI1EuA6U+zgcQOxfRkBz4gYbEYSoQCX6ukKTkqF/b9mduxFh2BI=
=dy0/
-----END PGP SIGNATURE-----

--RAz7QJWQMC7QD/S6--

