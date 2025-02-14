Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0A1C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 20:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3gA+i0CmP9DnNBxjfP0Se+gQOkkXX1tuBuCnmXo7jZk=; b=zrmhpi2+b8NTkOQcOi1+PbifN8
	4RNsTpa3zxj77nmgHPcYOjNArP82/q7BrvNxGn3ze3Gv+FFAoGDT1//viaE7PvSrlb8ERVpwOOUUP
	/QeovgetK9vfHn9nxaHdHBumAFxwQeIcOluEcDyLz4SSqnUhvYOCuGv9Q2dRiTu1ggB7v3rsaynUA
	CH4Ap3FtAsELWCQ9vk4iCEdcJGAOkgWJd/TveKTc5NjOW5wJT4NgPbX2MoJ8HRNwznDJ0eS+YwZVH
	deJuxl5ogvnqQct+kB5By6+cZ1EFVdSyv0Tv8RNN6NmgdwUV7vlqgBJcBospZ/3FcDmuwJk0Cl/H0
	tGs5+XJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj1zq-0000000G7wO-13Q5;
	Fri, 14 Feb 2025 20:09:10 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj1yO-0000000G7mn-3RKl;
	Fri, 14 Feb 2025 20:07:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3gA+i0CmP9DnNBxjfP0Se+gQOkkXX1tuBuCnmXo7jZk=; b=h2oPIxc5LSQ9HrqIpwYraIWK2d
	OVZnGGtUhj1zTYD3LrBiEDjWwkR36EKaperNnbYz9XKgtflB4ct53f7MvAUPjNtySI0+yXdYXgcbY
	g+16clC//0zdgygviKbeJkmU0asTKPLnMGeCNhAP5MKNFGHgJXuqBziRG9q3u+/pHVO+59fNPbZ4n
	eraqJTdMJyI62Zb6EE28ucaE/YHoxiUHijc5KzLiDu2mVn8MjlZCBeQxda/5fqqNO44ps1ppPPDBd
	OTnibedW2U6c6ESyD5jKyBA2I+RuplsWZU26A/ORoPDNb/w1oyRZkZZRlVe9iewvru+SRalFMYpRh
	o1Fw296Q==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tj1y0-00026P-Tb; Fri, 14 Feb 2025 21:07:16 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Chris Morgan <macromorgan@hotmail.com>,
 Kever Yang <kever.yang@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>,
 Tim Lunn <tim@feathertop.org>, FUKAUMI Naoki <naoki@radxa.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Stephen Chen <stephen@radxa.com>, Elon Zhang <zhangzj@rock-chips.com>,
 Alexey Charkov <alchark@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com
Subject: Re: [PATCH v3 2/2] arm64: dts: rockchip: Add Radxa ROCK 4D device tree
Date: Fri, 14 Feb 2025 21:07:15 +0100
Message-ID: <2629121.1xdlsreqCQ@diego>
In-Reply-To: <20250214152119.405803-3-detlev.casanova@collabora.com>
References: <20250214152119.405803-1-detlev.casanova@collabora.com>
 <20250214152119.405803-3-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_120740_884732_8086B25B 
X-CRM114-Status: GOOD (  16.63  )
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

Hi Detlev,

all the style nitpick I'd changed myself, but the cpu-supplies did throw me
off, see below.


Am Freitag, 14. Februar 2025, 16:19:34 MEZ schrieb Detlev Casanova:
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
> new file mode 100644
> index 0000000000000..822abb82fae40
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
> @@ -0,0 +1,650 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2024 Radxa Computer (Shenzhen) Co., Ltd.
> + *

empty comment line can probably go away

> +	vcc_12v0_dcin: regulator-vcc-12v0-dcin {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_12v0_dcin";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +	};
> +
> +	vcc_5v0_sys: regulator-vcc-5v0-sys {

alphabetical sorting, by node-name please, so
regulator-vcc-3v3* comes before regulator-vcc-5v0* etc

Goes for all regulator-* nodes of course.

> +	vcc_3v3_pcie: regulator-vcc-3v3-pcie {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_3v3_pcie";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		enable-active-high;
> +		gpio = <&gpio2 RK_PD3 GPIO_ACTIVE_HIGH>;
> +		startup-delay-us = <5000>;
> +		vin-supply = <&vcc_5v0_sys>;
> +	};
> +
> +	vcc_5v0_host: regulator-vcc-5v0-host {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc5v0_host";
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		enable-active-high;
> +		gpio = <&gpio0 RK_PD3 GPIO_ACTIVE_HIGH>;
> +		vin-supply = <&vcc_5v0_device>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usb_host_pwren>;

both of the above, alphabetical sorting of properties please

> +	};
> +};
> +
> +&cpu_l0 {
> +	cpu-supply = <&vdd_cpu_lit_s0>;
> +};

What happened to the supplies of the other cores?
cpu_l1 - cpu_l3 probably need the same reference as above.

Who is powering the cpu_b* cores?


> +&i2c1 {
> +	status = "okay";
> +
> +	pmic@23 {
> +		compatible = "rockchip,rk806";
> +		reg = <0x23>;
> +
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pmic_pins
> +			     &rk806_dvs1_null
> +			     &rk806_dvs2_null
> +			     &rk806_dvs3_null>;
> +
> +		system-power-controller;
> +
> +		vcc1-supply = <&vcc_5v0_sys>;
> +		vcc2-supply = <&vcc_5v0_sys>;
> +		vcc3-supply = <&vcc_5v0_sys>;
> +		vcc4-supply = <&vcc_5v0_sys>;
> +		vcc5-supply = <&vcc_5v0_sys>;
> +		vcc6-supply = <&vcc_5v0_sys>;
> +		vcc7-supply = <&vcc_5v0_sys>;
> +		vcc8-supply = <&vcc_5v0_sys>;
> +		vcc9-supply = <&vcc_5v0_sys>;
> +		vcc10-supply = <&vcc_5v0_sys>;
> +		vcc11-supply = <&vcc_2v0_pldo_s3>;
> +		vcc12-supply = <&vcc_5v0_sys>;
> +		vcc13-supply = <&vcc_1v1_nldo_s3>;
> +		vcc14-supply = <&vcc_1v1_nldo_s3>;
> +		vcca-supply = <&vcc_5v0_sys>;
> +
> +		gpio-controller;
> +		#gpio-cells = <2>;

alphabetical sorting ... gpio* farther up please.


> +&uart0 {
> +	pinctrl-0 = <&uart0m0_xfer>;
> +	status = "okay";
> +};
> +
> +&combphy1_psu {
> +	status = "okay";
> +};

phandles also sorted alphabetical please

> +
> +&u2phy0 {
> +	status = "okay";
> +};
> +
> +&u2phy1 {
> +	status = "okay";
> +};
> +
> +&usb_drd1_dwc3 {
> +	dr_mode = "host";
> +	status = "okay";
> +};

Thanks a lot
Heiko




