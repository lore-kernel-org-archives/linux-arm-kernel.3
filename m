Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D1DEA4E20
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=il68Z83N54IOTGokO6swTi5ttt0/huaeojxmXuzWWyc=; b=B+3nA6aKwlBMmsbgS+rAzPojRJ
	WBvyehqgm/VeQ3rKO3rH9S9EYvj75fq7Jk4jTNC7kfO37Uwo/VkGRlGX4V1AckyeLODRCf07vWop6
	96ydh2ZA8U2LVkyg9VsdLcTR+OTitSdJFe0LOogbxDWa6PjbL7C2Dv2dKZYb9H/3kAoXJ77rdWTRW
	Q/NNB7wnxroTWAthDAjrWRQNPPp+oj5jjfwar0S2q5ce7sAuyuwEZyhb5ytSPD3o1n7ZXzpX1Tr8+
	lgys2JT82VnGVUH2w3UXoUN1uG9mG1Ywf7XmunMteoS4MBRDjlecluR3uGHJyNCxfYZlrOsiRRVWB
	JZ4nVWQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx52x-0000000DLZF-417y;
	Mon, 02 Mar 2026 15:18:59 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx52v-0000000DLYf-2b22
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:18:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6175EC40F86;
	Mon,  2 Mar 2026 15:19:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 225A35FE89;
	Mon,  2 Mar 2026 15:18:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 64EA610369572;
	Mon,  2 Mar 2026 16:18:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772464735; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=il68Z83N54IOTGokO6swTi5ttt0/huaeojxmXuzWWyc=;
	b=JC5GMdQd4r9g1TJS82pF5kuiZRmoXqRrMkBb+I07BWW5wPvwL1GkEG5Oz1UJwJMKUO6Ren
	MKuJ/2VkLwzIyRqQPP4TqJwP2c316GpwoeQbJbfulTSA7BuWCzDxBNgBImDGOsk72dJlAd
	dhvaZZ1ojt1hEoJ+naUCrelXPfW7aRg6qfTHXLNrQCYrTc9Y7QNEPLOD8O5d9BupWOhVKt
	9C5qr+0Gddcv7MzHb7/03MT4aEWJ52apgy1owOBJ3hiOGsaFWKnBacwfhkDUckU/wsG59o
	Xb0ExUL/4xeBW8rSPvS149PB+ldr7nzB0kib/tehn06mny80uaXNnyfsgwNl2w==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Elad Nachman <enachman@marvell.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm/arm64: dts: marvell: Drop unused .dtsi
In-Reply-To: <20260128015521.3694910-1-robh@kernel.org>
References: <20260128015521.3694910-1-robh@kernel.org>
Date: Mon, 02 Mar 2026 16:18:53 +0100
Message-ID: <87y0kafeea.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_071857_802281_DFBAAD14 
X-CRM114-Status: GOOD (  18.72  )
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

"Rob Herring (Arm)" <robh@kernel.org> writes:

> These .dtsi files are not included anywhere in the tree and can't be
> tested.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Applied on mvebu/dt64

Thanks,

Gregory
> ---
> v2:
>  - Keep armada-7020.dtsi and armada-ap806-dual.dtsi which now
>    have a user.
> ---
>  arch/arm/boot/dts/marvell/armada-380.dtsi     | 148 ------------------
>  arch/arm64/boot/dts/marvell/armada-8020.dtsi  |  20 ---
>  .../dts/marvell/cn9130-db-comexpress.dtsi     |  96 ------------
>  3 files changed, 264 deletions(-)
>  delete mode 100644 arch/arm/boot/dts/marvell/armada-380.dtsi
>  delete mode 100644 arch/arm64/boot/dts/marvell/armada-8020.dtsi
>  delete mode 100644 arch/arm64/boot/dts/marvell/cn9130-db-comexpress.dtsi
>
> diff --git a/arch/arm/boot/dts/marvell/armada-380.dtsi b/arch/arm/boot/dt=
s/marvell/armada-380.dtsi
> deleted file mode 100644
> index e94f22b0e9b5..000000000000
> --- a/arch/arm/boot/dts/marvell/armada-380.dtsi
> +++ /dev/null
> @@ -1,148 +0,0 @@
> -// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> -/*
> - * Device Tree Include file for Marvell Armada 380 SoC.
> - *
> - * Copyright (C) 2014 Marvell
> - *
> - * Lior Amsalem <alior@marvell.com>
> - * Gregory CLEMENT <gregory.clement@free-electrons.com>
> - * Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> - */
> -
> -#include "armada-38x.dtsi"
> -
> -/ {
> -	model =3D "Marvell Armada 380 family SoC";
> -	compatible =3D "marvell,armada380";
> -
> -	cpus {
> -		#address-cells =3D <1>;
> -		#size-cells =3D <0>;
> -		enable-method =3D "marvell,armada-380-smp";
> -
> -		cpu@0 {
> -			device_type =3D "cpu";
> -			compatible =3D "arm,cortex-a9";
> -			reg =3D <0>;
> -		};
> -	};
> -
> -	soc {
> -		internal-regs {
> -			pinctrl@18000 {
> -				compatible =3D "marvell,mv88f6810-pinctrl";
> -			};
> -		};
> -
> -		pcie {
> -			compatible =3D "marvell,armada-370-pcie";
> -			status =3D "disabled";
> -			device_type =3D "pci";
> -
> -			#address-cells =3D <3>;
> -			#size-cells =3D <2>;
> -
> -			msi-parent =3D <&mpic>;
> -			bus-range =3D <0x00 0xff>;
> -
> -			ranges =3D
> -			       <0x82000000 0 0x80000 MBUS_ID(0xf0, 0x01) 0x80000 0 0x00002000
> -				0x82000000 0 0x40000 MBUS_ID(0xf0, 0x01) 0x40000 0 0x00002000
> -				0x82000000 0 0x44000 MBUS_ID(0xf0, 0x01) 0x44000 0 0x00002000
> -				0x82000000 0 0x48000 MBUS_ID(0xf0, 0x01) 0x48000 0 0x00002000
> -				0x82000000 0x1 0     MBUS_ID(0x08, 0xe8) 0 1 0 /* Port 0 MEM */
> -				0x81000000 0x1 0     MBUS_ID(0x08, 0xe0) 0 1 0 /* Port 0 IO  */
> -				0x82000000 0x2 0     MBUS_ID(0x04, 0xe8) 0 1 0 /* Port 1 MEM */
> -				0x81000000 0x2 0     MBUS_ID(0x04, 0xe0) 0 1 0 /* Port 1 IO  */
> -				0x82000000 0x3 0     MBUS_ID(0x04, 0xd8) 0 1 0 /* Port 2 MEM */
> -				0x81000000 0x3 0     MBUS_ID(0x04, 0xd0) 0 1 0 /* Port 2 IO  */>;
> -
> -			/* x1 port */
> -			pcie@1,0 {
> -				device_type =3D "pci";
> -				assigned-addresses =3D <0x82000800 0 0x80000 0 0x2000>;
> -				reg =3D <0x0800 0 0 0 0>;
> -				#address-cells =3D <3>;
> -				#size-cells =3D <2>;
> -				interrupt-names =3D "intx";
> -				interrupts-extended =3D <&gic GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
> -				#interrupt-cells =3D <1>;
> -				ranges =3D <0x82000000 0 0 0x82000000 0x1 0 1 0
> -					  0x81000000 0 0 0x81000000 0x1 0 1 0>;
> -				bus-range =3D <0x00 0xff>;
> -				interrupt-map-mask =3D <0 0 0 7>;
> -				interrupt-map =3D <0 0 0 1 &pcie1_intc 0>,
> -						<0 0 0 2 &pcie1_intc 1>,
> -						<0 0 0 3 &pcie1_intc 2>,
> -						<0 0 0 4 &pcie1_intc 3>;
> -				marvell,pcie-port =3D <0>;
> -				marvell,pcie-lane =3D <0>;
> -				clocks =3D <&gateclk 8>;
> -				status =3D "disabled";
> -
> -				pcie1_intc: interrupt-controller {
> -					interrupt-controller;
> -					#interrupt-cells =3D <1>;
> -				};
> -			};
> -
> -			/* x1 port */
> -			pcie@2,0 {
> -				device_type =3D "pci";
> -				assigned-addresses =3D <0x82001000 0 0x40000 0 0x2000>;
> -				reg =3D <0x1000 0 0 0 0>;
> -				#address-cells =3D <3>;
> -				#size-cells =3D <2>;
> -				interrupt-names =3D "intx";
> -				interrupts-extended =3D <&gic GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> -				#interrupt-cells =3D <1>;
> -				ranges =3D <0x82000000 0 0 0x82000000 0x2 0 1 0
> -					  0x81000000 0 0 0x81000000 0x2 0 1 0>;
> -				bus-range =3D <0x00 0xff>;
> -				interrupt-map-mask =3D <0 0 0 7>;
> -				interrupt-map =3D <0 0 0 1 &pcie2_intc 0>,
> -						<0 0 0 2 &pcie2_intc 1>,
> -						<0 0 0 3 &pcie2_intc 2>,
> -						<0 0 0 4 &pcie2_intc 3>;
> -				marvell,pcie-port =3D <1>;
> -				marvell,pcie-lane =3D <0>;
> -				clocks =3D <&gateclk 5>;
> -				status =3D "disabled";
> -
> -				pcie2_intc: interrupt-controller {
> -					interrupt-controller;
> -					#interrupt-cells =3D <1>;
> -				};
> -			};
> -
> -			/* x1 port */
> -			pcie@3,0 {
> -				device_type =3D "pci";
> -				assigned-addresses =3D <0x82001800 0 0x44000 0 0x2000>;
> -				reg =3D <0x1800 0 0 0 0>;
> -				#address-cells =3D <3>;
> -				#size-cells =3D <2>;
> -				interrupt-names =3D "intx";
> -				interrupts-extended =3D <&gic GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> -				#interrupt-cells =3D <1>;
> -				ranges =3D <0x82000000 0 0 0x82000000 0x3 0 1 0
> -					  0x81000000 0 0 0x81000000 0x3 0 1 0>;
> -				bus-range =3D <0x00 0xff>;
> -				interrupt-map-mask =3D <0 0 0 7>;
> -				interrupt-map =3D <0 0 0 1 &pcie3_intc 0>,
> -						<0 0 0 2 &pcie3_intc 1>,
> -						<0 0 0 3 &pcie3_intc 2>,
> -						<0 0 0 4 &pcie3_intc 3>;
> -				marvell,pcie-port =3D <2>;
> -				marvell,pcie-lane =3D <0>;
> -				clocks =3D <&gateclk 6>;
> -				status =3D "disabled";
> -
> -				pcie3_intc: interrupt-controller {
> -					interrupt-controller;
> -					#interrupt-cells =3D <1>;
> -				};
> -			};
> -		};
> -	};
> -};
> diff --git a/arch/arm64/boot/dts/marvell/armada-8020.dtsi b/arch/arm64/bo=
ot/dts/marvell/armada-8020.dtsi
> deleted file mode 100644
> index b6fc18876093..000000000000
> --- a/arch/arm64/boot/dts/marvell/armada-8020.dtsi
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> -/*
> - * Copyright (C) 2016 Marvell Technology Group Ltd.
> - *
> - * Device Tree file for the Armada 8020 SoC, made of an AP806 Dual and
> - * two CP110.
> - */
> -
> -#include "armada-ap806-dual.dtsi"
> -#include "armada-80x0.dtsi"
> -
> -/* The RTC requires external oscillator. But on Aramda 80x0, the RTC clo=
ck
> - * in CP master is not connected (by package) to the oscillator. So
> - * disable it. However, the RTC clock in CP slave is connected to the
> - * oscillator so this one is let enabled.
> - */
> -
> -&cp0_rtc {
> -	status =3D "disabled";
> -};
> diff --git a/arch/arm64/boot/dts/marvell/cn9130-db-comexpress.dtsi b/arch=
/arm64/boot/dts/marvell/cn9130-db-comexpress.dtsi
> deleted file mode 100644
> index 028496ebc473..000000000000
> --- a/arch/arm64/boot/dts/marvell/cn9130-db-comexpress.dtsi
> +++ /dev/null
> @@ -1,96 +0,0 @@
> -// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> -/*
> - * Copyright (C) 2023 Marvell International Ltd.
> - *
> - * Device tree for the CN9130-DB Com Express CPU module board.
> - */
> -
> -#include "cn9130-db.dtsi"
> -
> -/ {
> -	model =3D "Marvell Armada CN9130-DB COM EXPRESS type 7 CPU module board=
";
> -	compatible =3D "marvell,cn9130-cpu-module", "marvell,cn9130",
> -		     "marvell,armada-ap807-quad", "marvell,armada-ap807";
> -
> -};
> -
> -&ap0_reg_sd_vccq {
> -	regulator-max-microvolt =3D <1800000>;
> -	states =3D <1800000 0x1 1800000 0x0>;
> -	/delete-property/ gpios;
> -};
> -
> -&cp0_reg_usb3_vbus0 {
> -	/delete-property/ gpio;
> -};
> -
> -&cp0_reg_usb3_vbus1 {
> -	/delete-property/ gpio;
> -};
> -
> -&cp0_reg_sd_vcc {
> -	status =3D "disabled";
> -};
> -
> -&cp0_reg_sd_vccq {
> -	status =3D "disabled";
> -};
> -
> -&cp0_sdhci0 {
> -	status =3D "disabled";
> -};
> -
> -&cp0_eth0 {
> -	status =3D "disabled";
> -};
> -
> -&cp0_eth1 {
> -	status =3D "okay";
> -	phy =3D <&phy0>;
> -	phy-mode =3D "rgmii-id";
> -};
> -
> -&cp0_eth2 {
> -	status =3D "disabled";
> -};
> -
> -&cp0_mdio {
> -	status =3D "okay";
> -	pinctrl-0 =3D <&cp0_ge_mdio_pins>;
> -	phy0: ethernet-phy@0 {
> -		status =3D "okay";
> -	};
> -};
> -
> -&cp0_syscon0 {
> -	cp0_pinctrl: pinctrl {
> -		compatible =3D "marvell,cp115-standalone-pinctrl";
> -
> -		cp0_ge_mdio_pins: ge-mdio-pins {
> -			marvell,pins =3D "mpp40", "mpp41";
> -			marvell,function =3D "ge";
> -		};
> -	};
> -};
> -
> -&cp0_sdhci0 {
> -	status =3D "disabled";
> -};
> -
> -&cp0_spi1 {
> -	status =3D "okay";
> -};
> -
> -&cp0_usb3_0 {
> -	status =3D "okay";
> -	usb-phy =3D <&cp0_usb3_0_phy0>;
> -	phy-names =3D "usb";
> -	/delete-property/ phys;
> -};
> -
> -&cp0_usb3_1 {
> -	status =3D "okay";
> -	usb-phy =3D <&cp0_usb3_0_phy1>;
> -	phy-names =3D "usb";
> -	/delete-property/ phys;
> -};
> --=20
> 2.51.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

