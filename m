Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC239C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 23:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8F5ej1ptoU+Wsr5Q9JKI0rkd8DnVO4ZORoq+wM0rqI=; b=VdYe8VWVvFbIQJsW38ZA/XfYNn
	mQfqJ7P07EvfZs+85Oi4fVc0m+hSWSAQ7bAaec9lQ1IsC7PlIzOah2PEAYFS6R1kxaeayyGV9lciE
	csfIODHDtDuybgzr4yhBvnkNgwh9gEb4bB3NIFmBMVwnrCuV63SsapYYwAIVgTs70zMcSbkqGtVSN
	VSGXc2huFLuEnLOer46HAFoZxcKbOBSgMZjSCMaUQs4r5v4siqML0jioIXS1VzmQMZ1h/uwsJrfF1
	V5LYqAAwH/Fyjazk0JEZ27qJYNJSUNjKNtGBE5TtbCm84nMhnoPVTNMQ6pNVxq+6YoG6ckm3bQ9lB
	1Ou0sLLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u85u0-0000000FXrU-266I;
	Thu, 24 Apr 2025 23:22:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u85sA-0000000FXjn-3bHO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 23:20:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2C472F;
	Thu, 24 Apr 2025 16:20:43 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB6653F59E;
	Thu, 24 Apr 2025 16:20:46 -0700 (PDT)
Date: Fri, 25 Apr 2025 00:19:45 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Corentin Labbe <clabbe.montjoie@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH v2 3/5] arm64: dts: allwinner: a523: Add EMAC0 ethernet
 MAC
Message-ID: <20250425001945.48473374@minigeek.lan>
In-Reply-To: <20250424-01-sun55i-emac0-v2-3-833f04d23e1d@gentoo.org>
References: <20250424-01-sun55i-emac0-v2-0-833f04d23e1d@gentoo.org>
	<20250424-01-sun55i-emac0-v2-3-833f04d23e1d@gentoo.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_162050_989520_CBD36249 
X-CRM114-Status: GOOD (  13.96  )
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

On Thu, 24 Apr 2025 18:08:41 +0800
Yixun Lan <dlan@gentoo.org> wrote:

> Add EMAC0 ethernet MAC support which found on A523 variant SoCs,
> including the A527/T527 chips. MAC0 is compatible to the A64 chip which
> requires an external PHY. This patch only add RGMII pins for now.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

Thanks, looks good now!

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 40 ++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> index ee485899ba0af69f32727a53de20051a2e31be1d..c9a9b9dd479af05ba22fe9d783e32f6d61a74ef7 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -126,6 +126,15 @@ pio: pinctrl@2000000 {
>  			interrupt-controller;
>  			#interrupt-cells = <3>;
>  
> +			rgmii0_pins: rgmii0-pins {
> +				pins = "PH0", "PH1", "PH2", "PH3", "PH4",
> +				       "PH5", "PH6", "PH7", "PH9", "PH10",
> +				       "PH14", "PH15", "PH16", "PH17", "PH18";
> +				allwinner,pinmux = <5>;
> +				function = "emac0";
> +				drive-strength = <40>;
> +			};
> +
>  			mmc0_pins: mmc0-pins {
>  				pins = "PF0" ,"PF1", "PF2", "PF3", "PF4", "PF5";
>  				allwinner,pinmux = <2>;
> @@ -409,6 +418,15 @@ i2c5: i2c@2503400 {
>  			#size-cells = <0>;
>  		};
>  
> +		syscon: syscon@3000000 {
> +			compatible = "allwinner,sun55i-a523-system-control",
> +				     "allwinner,sun50i-a64-system-control";
> +			reg = <0x03000000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +		};
> +
>  		gic: interrupt-controller@3400000 {
>  			compatible = "arm,gic-v3";
>  			#address-cells = <1>;
> @@ -521,6 +539,28 @@ ohci1: usb@4200400 {
>  			status = "disabled";
>  		};
>  
> +		emac0: ethernet@4500000 {
> +			compatible = "allwinner,sun55i-a523-emac0",
> +				     "allwinner,sun50i-a64-emac";
> +			reg = <0x04500000 0x10000>;
> +			clocks = <&ccu CLK_BUS_EMAC0>;
> +			clock-names = "stmmaceth";
> +			resets = <&ccu RST_BUS_EMAC0>;
> +			reset-names = "stmmaceth";
> +			interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "macirq";
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&rgmii0_pins>;
> +			syscon = <&syscon>;
> +			status = "disabled";
> +
> +			mdio0: mdio {
> +				compatible = "snps,dwmac-mdio";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
>  		r_ccu: clock-controller@7010000 {
>  			compatible = "allwinner,sun55i-a523-r-ccu";
>  			reg = <0x7010000 0x250>;
> 


