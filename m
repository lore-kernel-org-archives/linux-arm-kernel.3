Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BC4C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 19:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgDBO0Rfj6StKE9ETlKlxeDYg7F6wFKoUAt1aJj9SlY=; b=EZIK8mTmSLK9wB6dKHfbA+09EZ
	wR7X0CIqQOj7yDEtrfh/8p9dkK4NL1CypJl5rJnzQsrlFQ7EVMT2LSZYvu5P1E+W6W8ZL+4IRkqH9
	TEpzdUtf1jYNQk/VvlBcSAujVMidImMAzMrP9S2GKdl5rkWPX71SYi/dTDic/Poy9WUdhCmWwjICa
	vWYV0jRYvgx2W1MAzU1K0mcaaT6c5VnPPgWIwNE8shtqb6UL64+uVg1TgPKHx27NAAVZ9xMvieIuJ
	/Rn1eA7NEKsA+fNInIxuid/V6pbeNdRxdcYkes4IRv6HZ9W8QBbBymf9v8UwLCasPi16s/un6iwYH
	nSQeKfjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIYLn-00000004pMR-11sq;
	Fri, 23 May 2025 19:46:39 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIYJi-00000004ozb-1cZa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 19:44:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=MgDBO0Rfj6StKE9ETlKlxeDYg7F6wFKoUAt1aJj9SlY=; b=XjUHdm32g+dcVpd6SoiNniNl4z
	kqn1xD6s/XYQ0twDkuSY5DUdE24+/kPHm4uJVYjmAasJkaB/UC/7jOBYbAWuh8XTO8zlNMdaksrBd
	vUpxdgL7qhe0sN0jIzSWvfNJhno6pG7YVs/ERs6Dv4seK6y195C/FORaIaIpt9BDN7RnpMnzPpn8n
	oI6NyRNjnZFPa6BHwNLe4+uE78xNXLskEX1PoflkoKlidKnMXCSpLBOq9QkopZz7OAwXYvtgsbj3m
	B5sYuz2/noU/7TIiPxtEUXC8kVLVRVc+t1jaT+BF0BX4aiS3Z+lrhBHd0JbdJaGipf9g2XVzMigAG
	OPnCU+Rg==;
Date: Fri, 23 May 2025 21:43:53 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] arm: dts: omap: Add support for BeagleBone Green
 Eco board
Message-ID: <20250523214353.6e46574a@akair>
In-Reply-To: <20250523-bbg-v1-1-ef4a9e57eeee@bootlin.com>
References: <20250523-bbg-v1-0-ef4a9e57eeee@bootlin.com>
	<20250523-bbg-v1-1-ef4a9e57eeee@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_124430_434900_1C04E9EC 
X-CRM114-Status: GOOD (  24.93  )
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

Am Fri, 23 May 2025 17:57:42 +0200
schrieb Kory Maincent <kory.maincent@bootlin.com>:

> SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone Green
> (BBG). It has minor differences from the BBG, such as a different PMIC,
> a different Ethernet PHY, and a larger eMMC.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
> 
> The pmic binding is currently only in regulator tree. I don't know if it
> should be merged in omap tree or in regulator tree due to that binding
> dependency.

Well, the pull request for omap stuff to soc is already sent, so this
will go into 6.17 probably while the regulator stuff seems to be
scheduled for 6.16. So this issue will solve itself.

> ---
>  arch/arm/boot/dts/ti/omap/Makefile                 |   1 +
>  arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts | 170 +++++++++++++++++++++
>  2 files changed, 171 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/Makefile b/arch/arm/boot/dts/ti/omap/Makefile
> index 95c68135dd0c..1aef60eef671 100644
> --- a/arch/arm/boot/dts/ti/omap/Makefile
> +++ b/arch/arm/boot/dts/ti/omap/Makefile
> @@ -93,6 +93,7 @@ dtb-$(CONFIG_SOC_AM33XX) += \
>  	am335x-boneblue.dtb \
>  	am335x-bonegreen.dtb \
>  	am335x-bonegreen-wireless.dtb \
> +	am335x-bonegreen-eco.dtb \
>  	am335x-chiliboard.dtb \
>  	am335x-cm-t335.dtb \
>  	am335x-evm.dtb \
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts
> new file mode 100644
> index 000000000000..521f92347bbe
> --- /dev/null
> +++ b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts
> @@ -0,0 +1,170 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2025 Bootlin
> + */
> +/dts-v1/;
> +
> +#include "am33xx.dtsi"
> +#include "am335x-bone-common.dtsi"
> +#include "am335x-bonegreen-common.dtsi"
> +#include <dt-bindings/net/ti-dp83867.h>
> +
> +/ {
> +	model = "TI AM335x BeagleBone Green Eco";
> +	compatible = "ti,am335x-bone-green-eco", "ti,am335x-bone-green",
> +		     "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
> +
these compatibles should be defined in
Documentation/devicetree/bindings/arm/ti/omap.yaml

But are that much really necessary? At least ti,am335x-bone-black looks
strange in the list, it does not look as it is derived from it.

> +	cpus {
> +		cpu@0 {
> +			cpu0-supply = <&buck1>;
> +		};
> +	};
> +
> +	sys_5v: sys-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "sys_5v";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	v3v3: v3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "v3v3";
> +		regulator-always-on;
> +	};
> +};
> +
> +&usb0 {
> +	interrupts-extended = <&intc 18>;
> +	interrupt-names = "mc";
> +};
> +
> +&baseboard_eeprom {
> +	vcc-supply = <&v3v3>;
> +};
> +
> +&i2c0 {
> +	/delete-node/ tps@24;
> +
> +	tps65214: tps@30 {

generic node names please, so pmic@30.
And maybe while you are at it, maybe you can clean up the tps@24 stuff.

Regards,
Andreas

