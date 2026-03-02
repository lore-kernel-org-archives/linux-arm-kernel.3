Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA80E9B365
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ok3fRgSARHAkAxOad7EvY0OyS9Ys2Vgqj4W/YMVQmao=; b=o7vOHeimcGFntaSO26Fovtximr
	4yl9I1XmWBu2TgKqPvNEYxFO1A8E828vVSVrs1LDc7P+wUqX7e9ya8F8oksDfJ0G3oE4LrS36gtBp
	2WoLM6lYk1wg0xUeRRdl2huqKvJvTMBApb2HiP9TG3ImAE9J0mWiNfnhkYvTWeUowFcm2TmgJUIs9
	VqzVsROgHavmn9ZIawAdJ5ShepskG8ULJVa/RKv+Y8fXJBI+QOoIsElF6oZUJJE0bLT/n+Ycn48zo
	DNO+zvrMkH5tqHU8o9eybgBYD6SwbVa9uI0JNMvYN83ffi12jezbg8AC900X2rBbJkFnTfqvSRQfV
	Y5hCFJaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1Ql-0000000Cp94-2f51;
	Mon, 02 Mar 2026 11:27:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1Qj-0000000Cp8N-0Lzc;
	Mon, 02 Mar 2026 11:27:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ok3fRgSARHAkAxOad7EvY0OyS9Ys2Vgqj4W/YMVQmao=; b=ZOCld0Z8aeDFYYmMH1oESJCjBz
	MPe/7G+YZZxYo8Vv4TGNuDp5tsfHOlKpNPAqFw4b3yeiWNKkiFavXMk2BctJnzLqgIzqJgzR8Nfjx
	gTkO+8xz4KGx0GjWtHTh2sulK3872LYd5azkXyQgOH4AnJ8C0MX9632mufdFeIoTxK+tjQFRT2d/l
	/k5sz/FgbocX4mfevpPYzrV2R9rdRgHmxEK8jbEL9PmruPcv5z0L+kUi30cb8GHaLoWWhxYzZ4wkm
	2UOZH0+CYT+UQv3/eaI6LN9fd6k9Q/XZw2Re3ESr5bwzuDO8gm/Pw/InVL2nHuKaXJt05h11QCIdn
	X1U96CyQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dennis@ausil.us
Cc: FUKAUMI Naoki <naoki@radxa.com>, Hsun Lai <i@chainsx.cn>,
 Jonas Karlman <jonas@kwiboo.se>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 John Clark <inindev@gmail.com>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, Andrew Lunn <andrew@lunn.ch>,
 Alexey Charkov <alchark@gmail.com>, Peter Robinson <pbrobinson@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dennis Gilmore <dennis@ausil.us>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add Orange Pi 5 Pro board support
Date: Mon, 02 Mar 2026 12:26:58 +0100
Message-ID: <7914983.EvYhyI6sBW@phil>
In-Reply-To: <20260228205418.2944620-3-dennis@ausil.us>
References: <20260228205418.2944620-1-dennis@ausil.us>
 <20260228205418.2944620-3-dennis@ausil.us>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_032717_125598_234D0C34 
X-CRM114-Status: GOOD (  19.97  )
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

Hi Dennis,

Am Samstag, 28. Februar 2026, 21:54:17 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb dennis@ausil.us:
> From: Dennis Gilmore <dennis@ausil.us>
>=20
> Add device tree for the Xunlong Orange Pi 5 Pro (RK3588S). The Pro
> differs from the base Orange Pi 5 in the following ways:
>=20
> - No SPI NOR flash; eMMC module slot instead, you can optionally solder
>   a SPI NOR fin place and turn off the eMMC
> - PCIe-attached NIC (pcie2x1l1) replaces the GMAC1 ethernet
> - PCIe NVMe slot (pcie2x1l2)
> - AP6256 WiFi (BCM43456) via SDIO with mmc-pwrseq
> - BCM4345C5 Bluetooth via uart9 with full RTS/CTS
> - Two-colour (blue/green) GPIO LED using modern color/function binding
> - audio is wired up differently
>=20
> Vendors description and links to schematics available:
> http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details=
/Orange-Pi-5-Pro.html
>=20
> Signed-off-by: Dennis Gilmore <dennis@ausil.us>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 376 ++++++++++++++++++
>  2 files changed, 377 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.d=
ts
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/=
rockchip/Makefile
> index 4d384f153c13..c99dca2ae9e7 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -214,6 +214,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-nanopi-r6c.d=
tb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-odroid-m2.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-5.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-5b.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-5-pro.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-orangepi-cm5-base.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-radxa-cm5-io.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588s-roc-pc.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts b/ar=
ch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
> new file mode 100644
> index 000000000000..d656328c906d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
> @@ -0,0 +1,376 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;
> +
> +#include "rk3588s-orangepi-5.dtsi"
> +
> +/ {
> +	model =3D "Xunlong Orange Pi 5 Pro";
> +	compatible =3D "xunlong,orangepi-5-pro", "rockchip,rk3588s";
> +
> +	aliases {
> +		/delete-property/ ethernet0;
> +		mmc0 =3D &sdhci;
> +		mmc1 =3D &sdmmc;
> +		mmc2 =3D &sdio;
> +	};
> +
> +	/* Pro uses gpio-leds instead; pwm0 LED is not wired up */
> +	/delete-node/ pwm-leds;
> +
> +	/*
> +	 * Pro uses i2s2 (i2s2m1 mux) for audio, not i2s1. Recreate the sound
> +	 * card node pointing at i2s2_2ch instead.
> +	 */
> +	/delete-node/ analog-sound;

I think it would make more sense to move the relevant not-shared part
out of the dtsi instead. Yes the duplication in orangepi-5 and orangepi-5b
should be fine.

Having a devicetree with so many /delete-node/ and /delete-property/
elements sprinkled throughout the file, will definitly cause readability
(and handling issues) in the future.

Additionally this makes all the comments in the file explaining individual
difference unnecessary.


Thanks
Heiko



