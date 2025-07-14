Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5209BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 06:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cyz+/Q9UvRk0mPtcMDSS3fKd4RSCgKo+4UfOQAG/mHE=; b=sJ4EONQryRFsWdpCK9xMr+s50U
	e+EB7gfEBtzef3wyytbDzTPmu+hZAHbajOkCevUAAhpb8LkcuTGEOAdF7w6A8+iGOInrGMsh+Ku1e
	LDXUigzO/+jVtVbNEiPHYT2c3qC3idOFJB0vBoZ5U+j6COWvAc+EmVBVQvxAehvS9aEfAWDYyhoTD
	R2yfkcun55JWRQ45BL/QtbGUf6YJCWSNEFUMKd4FP0ubwqJZgfAcITzG2rN/ZoKNU91Dp/G9eCv5h
	0tUhZn0NpNLCmBSqMpQxonIWJvQdDOJxOQ4rP2uIhWvEKwfTPd/yeDk9wdOGxBLmi2H3cQym+VV9A
	eyxntqRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCUD-00000001JLq-22AL;
	Mon, 14 Jul 2025 06:16:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCGu-00000001H6P-0yHj;
	Mon, 14 Jul 2025 06:02:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 87096461AC;
	Mon, 14 Jul 2025 06:02:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD1D4C4CEED;
	Mon, 14 Jul 2025 06:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752472958;
	bh=mwksL5g+ek+4+NJV5sWXHoC3uZulpG3hdPudzC2//WE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q7fEW1NMcgVLY9/EsCySsOSV7cx9B4TKxh2qRERIQArZhdyyo4rv3au33Vc4dELw8
	 Qqf2CbS7Kotn+iqHYNSPbJfZzR+qcv0XMuauiO7s8aSe+5kXEV7+ebbhujDzeZHu4M
	 3Gqgf92zITOpwotvUdwKgVgeJR7SCBD6AA5qRaN9wqCCuemCgal+pTMb1Fpvg84GU0
	 2Q9QjteS6bNoM6P1FQUvx7PVz0HR9x5UOLKotU/RA7lzw1/N8C9857lCGtj6Fy7HsZ
	 PtBo5+qJ4CvLPJPsisCHnmZq5MBUXcz/FJ6SPqAUL4FhD7GCo+gV2NQfjF2vevFRCv
	 tZGAS++M3X4pQ==
Date: Mon, 14 Jul 2025 08:02:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	heiko@sntech.de, quentin.schulz@cherry.de, dsimic@manjaro.org, naoki@radxa.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add OneThing Cloud OEC turbo
Message-ID: <20250714-wise-tall-parrot-3e4347@krzk-bin>
References: <20250713163255.163669-1-jerrysteve1101@gmail.com>
 <20250713163255.163669-4-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250713163255.163669-4-jerrysteve1101@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_230240_385011_C29037A9 
X-CRM114-Status: GOOD (  12.73  )
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

On Mon, Jul 14, 2025 at 12:32:55AM +0800, Jun Yan wrote:
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include "rk3566.dtsi"
> +
> +/ {
> +	model = "OneThing Cloud OEC turbo";
> +	compatible = "onething,cloud-oec-turbo", "rockchip,rk3566";
> +
> +	aliases {
> +		ethernet0 = &gmac1;
> +		mmc0 = &sdhci;
> +	};
> +
> +	chosen: chosen {
> +		stdout-path = "serial2:1500000n8";
> +	};
> +
> +	/* No hardware video output port */
> +	/delete-node/ display-subsystem;

Nodes should be disabled, not removed. What does it mean it is being
removed? You physically take it out from the hardware? How could it
exist in the first place in the SoC if it is not present on the board?

> +
> +	gmac1_clkin: external-gmac1-clock {
> +		compatible = "fixed-clock";
> +		clock-frequency = <125000000>;
> +		clock-output-names = "gmac1_clkin";
> +		#clock-cells = <0>;
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		rgb_led_r: rgb-led-r {

led-0

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +			color = <LED_COLOR_ID_RED>;
> +			default-state = "off";
> +			function = LED_FUNCTION_STATUS;
> +			gpios = <&gpio0 RK_PC3 GPIO_ACTIVE_LOW>;
> +		};

...

> +
> +&gmac1 {
> +	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
> +	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&gmac1_clkin>;
> +	phy-mode = "rgmii";
> +	clock_in_out = "input";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac1m1_miim
> +		    &gmac1m1_tx_bus2
> +		    &gmac1m1_rx_bus2
> +		    &gmac1m1_rgmii_clk
> +		    &gmac1m1_rgmii_bus
> +		    &gmac1m1_clkinout>;
> +	snps,reset-gpio = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
> +	snps,reset-active-low;
> +	/* Reset time is 20ms, 100ms for rtl8211f */
> +	snps,reset-delays-us = <0 20000 100000>;
> +
> +	tx_delay = <0x4f>;
> +	rx_delay = <0x2d>;
> +	phy-handle = <&rgmii_phy1>;
> +	status = "okay";
> +};
> +
> +&gpu {
> +	status = "okay";
> +};
> +
> +&mdio1 {
> +	rgmii_phy1: ethernet-phy@1 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0x1>;
> +	};
> +};
> +
> +&pinctrl {
> +	usb {
> +		vcc5v0_usb_host_en: vcc5v0_usb_host_en {

Follow DTS coding style.

> +			rockchip,pins = <0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +};

Best regards,
Krzysztof


