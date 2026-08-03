Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6EDC55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 18:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+rNOCgic9Kg3tyw9O1nqGoQ5hjaojitt9FcWiBaYtU4=; b=dO/UaKH/91oOTVPxpig/0oajN1
	lTwNA2Xfla9yILwjw1PL3wDqF+3xftBIKtooN3Idf8pdOcQs9FeNamGi7XELtbqYCDBXPvB2vaSgO
	3OJwQPhM7ARjqNWDW5KQx6PoLct6d3fG27RkwICqtrCQRyr4paz2VUIzGZjZFZ8VNvBT7xgN3KHPC
	MqjpLYy8e7ZU+6lj7Rrmg/fIyhGGIA0fppCpItwkJuO82CH13+nO+uGJnOLBaVDv1EpFaIApRtVns
	q3/XlDJXzMePjosr3kc0CgoSx3emRLSKyujapSKPnANtv6xmpwf4GSmkcxVTj2CID5glgFEUHlDDg
	pcNR+W6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqx9o-00000000Ld0-2JN2;
	Mon, 03 Aug 2026 18:13:00 +0000
Received: from ms.puri.sm ([135.181.196.210])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqx9k-00000000Lao-42Md;
	Mon, 03 Aug 2026 18:12:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=smtp2;
	t=1785780772; bh=HNTPaYDGutREzLTVPWESt82E01iFz+jQ39UPafEurv0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=J4qIa0M3q9Mja66JJpMWCm3Si2k+eQxKBPYsxWlsjhzfhFhyNWkHOce9T4N2rqDaA
	 kEmxNLjWJMeQEHDhJ5UGXkpeibsTQ5FNwkQR0x7UnO77zXdxXGMA00/OFQkd/fCgSc
	 6gZulAcTEPaP0/4e+WFabqGthdJvYdZUuaEdjBfYKwQQ3V4pyKcPDqIGq8SVIBvdNT
	 XG4o2BAoNJclC5KD2v8WfgpNg7zAq0p3jURjCMHKPQ58y8ibkwVhykQHlXlncggeTq
	 mDrVCDZBH3C/DsnWTYfXBbi4VpA/j86hwwBXQPHp1E0qCCB5XIeh536HehZjTFh+3v
	 36zRINnOxbN2Q==
Received: from pliszka.localnet (79.184.66.106.ipv4.supernova.orange.pl [79.184.66.106])
	by ms.puri.sm (Postfix) with ESMTPSA id A9F351F617;
	Mon, 03 Aug 2026 11:12:47 -0700 (PDT)
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Ondrej Jirman <megi@xff.cz>,
 Olivier Benjamin <olivier.benjamin@bootlin.com>,
 Manuel Traut <manut@mecka.net>,
 Alexander Warnecke <awarnecke002@hotmail.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Martin Kepplinger <martin.kepplinger@puri.sm>,
 Shawn Guo <shawnguo@kernel.org>, david@ixit.cz
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 phone-devel@vger.kernel.org, imx@lists.linux.dev,
 David Heidelberg <david@ixit.cz>, stable@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: imx8mq-librem5: Dongwoon DW9714 coil requires
 higher voltage
Date: Mon, 03 Aug 2026 20:12:44 +0200
Message-ID: <yJywMSNTQGGZm3rbxd56Yw@puri.sm>
In-Reply-To: <20260801-pp-pro-camera-v1-4-7b4d90788f9f@ixit.cz>
References: <20260801-pp-pro-camera-v1-0-7b4d90788f9f@ixit.cz>
 <20260801-pp-pro-camera-v1-4-7b4d90788f9f@ixit.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_111257_176366_49494137 
X-CRM114-Status: GOOD (  15.43  )
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

On sobota, 1 sierpnia 2026 02:35:23 czas =C5=9Brodkowoeuropejski letni Davi=
d=20
Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
>=20
> By datasheet the VDD (in-kernel named vcc) range is between 2.3 to 4.3 V.
> Usually it's around 2.8 V. Here it matches the reg_vcam_2v8.

It doesn't - VCAM_2V8 isn't connected to DW9714 (and neither is CSI_1V8);=20
VCAM_AFVDD is.

> 1.8 V here is likely used for i2c level shifter.

I'm not sure where you've got an I2C level shifter from, there's none invol=
ved=20
there. CSI_1V8 is passed to the rear camera module as DOVDD and is consumed=
 by=20
S5K3L6 as VDDIO, and both S5K3L6 and DW9714 are connected to I2C4_SDA/
I2C4_SCL, operating at the 1.8V level, only though an EMI filter (F7 in the=
=20
schematic).

>=20
> Fixes: f00df2bdb512 ("arm64: dts: imx8mq-librem5: describe the voice coil
> motor for focus control") Cc: stable@vger.kernel.org
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
> b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi index
> f5d529c5baf3e..583cba2d3bebf 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
> @@ -1167,17 +1167,17 @@ &i2c4 {
>  	pinctrl-1 =3D <&pinctrl_i2c4_gpio>;
>  	scl-gpios =3D <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>  	sda-gpios =3D <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>  	status =3D "okay";
>=20
>  	vcm@c {
>  		compatible =3D "dongwoon,dw9714";
>  		reg =3D <0x0c>;
> -		vcc-supply =3D <&reg_csi_1v8>;
> +		vcc-supply =3D <&reg_vcam_2v8>;
>  	};
>=20
>  	bat: fuel-gauge@36 {
>  		compatible =3D "maxim,max17055";
>  		reg =3D <0x36>;
>  		interrupt-parent =3D <&gpio3>;
>  		interrupts =3D <20 IRQ_TYPE_LEVEL_LOW>;
>  		pinctrl-names =3D "default";





