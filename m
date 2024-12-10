Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA549E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 10:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/ecQv4FKuCtZE1AnEV/ijXpIAnWHT6qeI4gnhaOi3s=; b=pfwNLjA+FKT+vk3GfLfdo4LjPm
	yrunMfXkS6bmtSbAjhTK1ApBx6BT9uWkr1I2iV4lZTcZSBA/kXymO0mJNNDLxmg9LiRSV5FmEZYB2
	V24DIphYGfb36Hmk3v2YxUNPstnqYFUqlq/xYsJSlsen0Gf4cIAOtgeUseIvpdBXugzNfqWppiX7U
	hwTDsm/Oa/pVaQnRBUyf6COxzRO7L4jaskLOwSoy8xIy1uaWGb6fesNvOlx4JjzwNe1KfaBm8v4qz
	Pi5nOunS6esspG1Y7d0aooa01vrfvCd75wUx5X+5HlsduBD69K9FuPZzU42UbIwXUBecxTRLbCNiT
	q0vHpFDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKxwE-0000000BE5G-3iUK;
	Tue, 10 Dec 2024 10:57:58 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKxtJ-0000000BDHz-1gwD;
	Tue, 10 Dec 2024 10:54:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=I/ecQv4FKuCtZE1AnEV/ijXpIAnWHT6qeI4gnhaOi3s=; b=AEgkMytKAjtQ4a1u/MLo8pPK9r
	lU+a/eCQz7xpnrtDWYQyayPmWoYDo1jY7H1LXJWbT+J4TInvHdQpMhnXnBCV5UUegjvDHswnupRVb
	3qSvaVJsf7KZtNGiD/0RJ5oQbmC3hFcswx4DNN0KplCbrLNt9sNzvozb2frb6hbl1a5TRpCK9w4rY
	0tMfIFPQo9bPUoWbDNlVV9r/l+uLkIE+duuQzU4Vr7sfLPyCkgpcSF1vKpy89NceO/xSh+RNPihof
	iDdpism0coDEv0NrmMTaULx4L1dyPWqbFzSNFydHtLkRCU8nzx5RAeEqEJyUT17xVPYzLs1Ot8xrK
	i7w7euVA==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tKxt2-0004QH-Ie; Tue, 10 Dec 2024 11:54:40 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Peter Geis <pgwipeout@gmail.com>
Cc: Peter Geis <pgwipeout@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 Diederik de Haas <didi.debian@cknow.org>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Levin Du <djw@t-chip.com.cn>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 5/6] arm64: dts: rockchip: correct rk3328-roc regulator map
Date: Tue, 10 Dec 2024 11:54:39 +0100
Message-ID: <14451790.lVVuGzaMjS@diego>
In-Reply-To: <20241210013010.81257-6-pgwipeout@gmail.com>
References: <20241210013010.81257-1-pgwipeout@gmail.com>
 <20241210013010.81257-6-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_025457_443621_A1AFF457 
X-CRM114-Status: GOOD (  19.45  )
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

Am Dienstag, 10. Dezember 2024, 02:30:09 CET schrieb Peter Geis:
> The rk3328-roc-cc input power is sourced from a micro-usb port, while
> the rk3328-roc-pc input power is sourced from a usb-c port. Both inputs
> are 5vdc only. Remove the 12v input from the device tree.

full stop. Please don't do "While we are at it" commits.

> While we are at it, add missing voltages and supply to vcc_phy, missing
> voltages to vcc_host1_5v, and standardize the order of regulator
> properties among the fixed regulators.

This second part wants to be its own commit :-) .

Thanks
Heiko

> Fixes: 2171f4fdac06 ("arm64: dts: rockchip: add roc-rk3328-cc board")
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
> 
>  arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi | 23 +++++++++++++-------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi b/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
> index f782c8220dd3..6984387ff8b3 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
> @@ -24,22 +24,23 @@ gmac_clkin: external-gmac-clock {
>  		#clock-cells = <0>;
>  	};
>  
> -	dc_12v: regulator-dc-12v {
> +	/* fed from passive usb input connector */
> +	dc_5v: regulator-dc-5v {
>  		compatible = "regulator-fixed";
> -		regulator-name = "dc_12v";
> +		regulator-name = "dc_5v";
>  		regulator-always-on;
>  		regulator-boot-on;
> -		regulator-min-microvolt = <12000000>;
> -		regulator-max-microvolt = <12000000>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
>  	};
>  
>  	vcc_sd: regulator-sdmmc {
>  		compatible = "regulator-fixed";
> +		regulator-name = "vcc_sd";
>  		gpio = <&gpio0 RK_PD6 GPIO_ACTIVE_LOW>;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&sdmmc0m1_pin>;
>  		regulator-boot-on;
> -		regulator-name = "vcc_sd";
>  		regulator-min-microvolt = <3300000>;
>  		regulator-max-microvolt = <3300000>;
>  		vin-supply = <&vcc_io>;
> @@ -50,22 +51,25 @@ vcc_sdio: regulator-sdmmcio {
>  		states = <1800000 0x1>, <3300000 0x0>;
>  		regulator-name = "vcc_sdio";
>  		regulator-type = "voltage";
> +		regulator-always-on;
>  		regulator-min-microvolt = <1800000>;
>  		regulator-max-microvolt = <3300000>;
> -		regulator-always-on;
>  		vin-supply = <&vcc_sys>;
>  	};
>  
>  	vcc_host1_5v: vcc_otg_5v: regulator-vcc-host1-5v {
>  		compatible = "regulator-fixed";
> +		regulator-name = "vcc_host1_5v";
>  		enable-active-high;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&usb20_host_drv>;
> -		regulator-name = "vcc_host1_5v";
>  		regulator-always-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
>  		vin-supply = <&vcc_sys>;
>  	};
>  
> +	/* sourced from usb input through 3A fuse */
>  	vcc_sys: regulator-vcc-sys {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vcc_sys";
> @@ -73,7 +77,7 @@ vcc_sys: regulator-vcc-sys {
>  		regulator-boot-on;
>  		regulator-min-microvolt = <5000000>;
>  		regulator-max-microvolt = <5000000>;
> -		vin-supply = <&dc_12v>;
> +		vin-supply = <&dc_5v>;
>  	};
>  
>  	vcc_phy: regulator-vcc-phy {
> @@ -81,6 +85,9 @@ vcc_phy: regulator-vcc-phy {
>  		regulator-name = "vcc_phy";
>  		regulator-always-on;
>  		regulator-boot-on;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vcc_io>;
>  	};
>  
>  	leds {
> 





