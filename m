Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A01DCD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 02:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PiiHDF+nX4+QzwmcKPsuaf62O5ixDsbk+wGUlXGzkVQ=; b=m//ZQjr0bOPb1z/faU5QZubXNa
	H3u4cFGxmDnNHaVfS+eAMTMwi4aFKuCrAexlyi/sE1dOeT3Yb28axsY4DPLY9ZwdTBd7pyQjyNuo7
	NwOLnAZVgZyol8uYGtLJDFxny8VDB6jou6htS8Q8aFrcEu4Xw6tR+oa4QMOx40fSUnJXnuAjF7Og9
	Mhrxx6v5gQdlMhYbMmT7lnazpDYlMa22n6QyG170+L2yAQVFDcXDq5+hZxIscfCUK+Go4s5HE0QDg
	lLDO397jVjN1cvH/qpytcN1wxebhE8rEBkbsvO/hPP4ID4/Lh5PPM0A9tO5KXvsyHbEyxss63SHoL
	yxpI0sCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOnYJ-0000000DuVs-1iXx;
	Mon, 18 May 2026 02:17:55 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOnYG-0000000DuUR-3srv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 02:17:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779070670;
	bh=PiiHDF+nX4+QzwmcKPsuaf62O5ixDsbk+wGUlXGzkVQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ge1iBDQ6IshC+uFwYBYN09lGe9yZ80q6yvJlNL6cbZWZRF7ta/0Yd+PqmCXc6ArY/
	 lCTER7bV69sG41xzIsPJ+EJ4RSn5HwUft2rdlzgIFwVESJ/MZE2D07LZyFV41Z95BN
	 p44G2o3kx0vBTDUoMB3/m65JszEzJEQ6+CEMCPg11RlI01Q470HvoWx+ykgOmA4K3A
	 XDYsCQZ5SM2O5PBrpVP9MqipBie08SGpQq4L3Mb+9m7xjy3yW5nUzLOvWdnXt5DhPz
	 JykTCkzdKCiy6GC5VD+DyiQm/ZI9Wv+hNN9qXDGh5f6/Nuw6QR4kmdaJpCHavxrT6b
	 5kxMjD5/JC8LA==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7157A6037B;
	Mon, 18 May 2026 10:17:50 +0800 (AWST)
Message-ID: <9b81b5cf24afb2fd587c62ffd808366ac2fe5cd7.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>, joel@jms.id.au
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org
Date: Mon, 18 May 2026 11:47:50 +0930
In-Reply-To: <20260514031622.1416922-3-prasanth.padarthi10@gmail.com>
References: <20260514031622.1416922-1-prasanth.padarthi10@gmail.com>
	 <20260514031622.1416922-3-prasanth.padarthi10@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_191753_170531_1942D5C9 
X-CRM114-Status: GOOD (  13.97  )
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

Hi Prasanth,

On Thu, 2026-05-14 at 08:46 +0530, Prasanth Kumar Padarthi wrote:
> Add initial device tree support for the ASRock Rack B650D4U BMC.
> The B650D4U is a server motherboard utilizing the ASPEED AST2600
> SoC for management.
>=20
> Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0.../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts=C2=A0 | 71 +++++++++++=
++++++++
> =C2=A02 files changed, 72 insertions(+)
> =C2=A0create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d=
4u.dts
>=20
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed=
/Makefile
> index c4f064e4b..124d4f8f8 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> =C2=A0	aspeed-bmc-asrock-romed8hm3.dtb \
> =C2=A0	aspeed-bmc-asrock-spc621d8hm3.dtb \
> =C2=A0	aspeed-bmc-asrock-x570d4u.dtb \
> +	aspeed-bmc-asrock-b650d4u.dtb \
> =C2=A0	aspeed-bmc-asus-x4tf.dtb \
> =C2=A0	aspeed-bmc-bytedance-g220a.dtb \
> =C2=A0	aspeed-bmc-delta-ahe50dc.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arc=
h/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> new file mode 100644
> index 000000000..130b7f3e0
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> @@ -0,0 +1,71 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +
> +/ {
> +	model =3D "ASRock Rack B650D4U BMC";
> +	compatible =3D "asrock,b650d4u-bmc", "aspeed,ast2600";
> +
> +	aliases {
> +		serial4 =3D &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial4:115200n8";
> +	};
> +
> +	memory@80000000 {
> +		device_type =3D "memory";
> +		reg =3D <0x80000000 0x40000000>;
> +	};
> +};
> +
> +/* BMC Console UART */
> +&uart5 {
> +	status =3D "okay";
> +};
> +
> +/* SPI Flash Management */
> +&fmc {
> +	status =3D "okay";
> +	flash@0 {
> +		status =3D "okay";
> +		m25p,fast-read;
> +		label =3D "bmc";

Have you considered describing the flash layout here?

> +	};
> +};
> +
> +/* Dedicated Management LAN */
> +&mdio0 {
> +	status =3D "okay";
> +
> +	ethphy0: ethernet-phy@0 {
> +		compatible =3D "ethernet-phy-ieee802.3-c22";
> +		reg =3D <0>;
> +	};
> +};
> +
> +&mac0 {
> +	status =3D "okay";
> +	phy-mode =3D "rgmii-rxid";
> +	phy-handle =3D <&ethphy0>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
> +};
> +
> +/* I2C Bus for FRU/EEPROM Storage */
> +&i2c7 {
> +	status =3D "okay";
> +	eeprom@57 {
> +		compatible =3D "atmel,24c02";
> +		reg =3D <0x57>;
> +		pagesize =3D <16>;
> +	};
> +};
> +
> +/* System Watchdog */
> +&wdt1 {
> +	status =3D "okay";
> +	aspeed,reset-type =3D "soc";
> +};

My preference is that the nodes are ordered alphabetically by label
name. Can you please fix that? While it's also fine to order them e.g.
by unit address, alphabetical order is much easier for me to assess by
inspection.

Andrew

