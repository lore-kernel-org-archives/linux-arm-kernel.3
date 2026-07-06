Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84EFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWf6/Ryhn4/D0YoaG/94TirMZBE2/5qPaMdIEL3nxDk=; b=3GkAHh3AsAsuF/fn3msaXTIi5v
	WyhNIjADOX7Vsnsx606kixAEIDp1qVPICiuSvnO/q2v8qQPihfdSBIjqfUW3p/afqhU89ORPOdQL9
	TKwyJFas4W8Vuyixsz1Qd6xdkZ1WZpDZNJcFg600gCFPe7pSQ56Adj+uDorfUWiMLqyf1KwhdRkMS
	UxHttBfJGLp5M0ev81CeCaX8Xx4/Jx5O3SGSQGyu2nf4yF67TV8TqHjwRxu5R2BMPF5euSR7A6VZW
	yPfU/vtTXk93CgTCldmNavv3/BRs6XR0HFnaq1F2pJbTeUoIp2pyMddkF/fliPah17ad56omg73E6
	TvdhIxoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgguE-0000000CGfA-2s0b;
	Mon, 06 Jul 2026 10:50:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgguC-0000000CGe6-3Dre
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 10:50:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 347092BC4
	for <linux-arm-kernel@lists.infradead.org>; Mon,  6 Jul 2026 03:50:22 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4F2703F85F
	for <linux-arm-kernel@lists.infradead.org>; Mon,  6 Jul 2026 03:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783335026; bh=BOxCbahYeMXBie3ntQ0u/5h11UMYD4HNYtTnrFGC5LA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BWGKe4CBdeec3sUNFz/cLfgLvwFyCOWjmq3s9Q1EvMuLusrJuDcQ2U10Pnn0dRdNE
	 6wnH6avlbX8yECd5YbZF7S/R4qFRLLraGcJuwvW9ZBximFiA7JWumGyQ8EKwcTdIyG
	 jXnSKDaMsz7qs+cVziaWcQgEo8SE8YJ2+uQ7ni6E=
Date: Mon, 6 Jul 2026 11:50:17 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: arm: Correct indentation
Message-ID: <akuIad1FdhC9rTqE@e142607>
References: <20260706101942.341681-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260706101942.341681-2-krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_035028_882853_45255F54 
X-CRM114-Status: GOOD (  16.96  )
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

On Mon, Jul 06, 2026 at 12:19:43PM +0200, Krzysztof Kozlowski wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
> 
> Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
> ---
>  arch/arm/boot/dts/arm/arm-realview-eb.dtsi     | 2 +-
>  arch/arm/boot/dts/arm/arm-realview-pb1176.dts  | 2 +-
>  arch/arm/boot/dts/arm/arm-realview-pb11mp.dts  | 6 +++---
>  arch/arm/boot/dts/arm/arm-realview-pbx.dtsi    | 6 +++---
>  arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts | 4 ++--
>  5 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/arm/arm-realview-eb.dtsi b/arch/arm/boot/dts/arm/arm-realview-eb.dtsi
> index ae370d4eb9d8..f90e28ee4cb9 100644
> --- a/arch/arm/boot/dts/arm/arm-realview-eb.dtsi
> +++ b/arch/arm/boot/dts/arm/arm-realview-eb.dtsi
> @@ -51,7 +51,7 @@ vmmc: regulator-vmmc {
>  		regulator-min-microvolt = <3300000>;
>  		regulator-max-microvolt = <3300000>;
>  		regulator-boot-on;
> -        };
> +	};
>  
>  	xtal24mhz: mclk: kmiclk: sspclk: uartclk: wdogclk: clock-24000000 {
>  		#clock-cells = <0>;
> diff --git a/arch/arm/boot/dts/arm/arm-realview-pb1176.dts b/arch/arm/boot/dts/arm/arm-realview-pb1176.dts
> index a75d8b107fe1..1cd095496832 100644
> --- a/arch/arm/boot/dts/arm/arm-realview-pb1176.dts
> +++ b/arch/arm/boot/dts/arm/arm-realview-pb1176.dts
> @@ -53,7 +53,7 @@ vmmc: regulator-vmmc {
>  		regulator-min-microvolt = <3300000>;
>  		regulator-max-microvolt = <3300000>;
>  		regulator-boot-on;
> -        };
> +	};
>  
>  	veth: regulator-veth {
>  		compatible = "regulator-fixed";
> diff --git a/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts b/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts
> index 59c78def83f2..635b09030f60 100644
> --- a/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts
> +++ b/arch/arm/boot/dts/arm/arm-realview-pb11mp.dts
> @@ -153,7 +153,7 @@ vmmc: regulator-vmmc {
>  		regulator-min-microvolt = <3300000>;
>  		regulator-max-microvolt = <3300000>;
>  		regulator-boot-on;
> -        };
> +	};
>  
>  	veth: regulator-veth {
>  		compatible = "regulator-fixed";
> @@ -544,7 +544,7 @@ timer01: timer@10011000 {
>  			interrupts = <0 1 IRQ_TYPE_LEVEL_HIGH>;
>  			arm,sp804-has-irq = <1>;
>  			clocks = <&sp810_syscon 0>,
> -			         <&sp810_syscon 1>,
> +				 <&sp810_syscon 1>,
>  				 <&pclk>;
>  			clock-names = "timer0clk",
>  				    "timer1clk",
> @@ -558,7 +558,7 @@ timer23: timer@10012000 {
>  			interrupts = <0 2 IRQ_TYPE_LEVEL_HIGH>;
>  			arm,sp804-has-irq = <1>;
>  			clocks = <&sp810_syscon 2>,
> -			         <&sp810_syscon 3>,
> +				 <&sp810_syscon 3>,
>  				 <&pclk>;
>  			clock-names = "timer0clk",
>  				    "timer1clk",
> diff --git a/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi b/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi
> index 0d3d96ffa6e6..366c8baefe8c 100644
> --- a/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi
> +++ b/arch/arm/boot/dts/arm/arm-realview-pbx.dtsi
> @@ -52,7 +52,7 @@ vmmc: regulator-vmmc {
>  		regulator-min-microvolt = <3300000>;
>  		regulator-max-microvolt = <3300000>;
>  		regulator-boot-on;
> -        };
> +	};
>  
>  	veth: regulator-veth {
>  		compatible = "regulator-fixed";
> @@ -373,7 +373,7 @@ timer01: timer@10011000 {
>  			compatible = "arm,sp804", "arm,primecell";
>  			reg = <0x10011000 0x1000>;
>  			clocks = <&sp810_syscon0 0>,
> -			         <&sp810_syscon0 1>,
> +				 <&sp810_syscon0 1>,
>  				 <&pclk>;
>  			clock-names = "timerclk0",
>  				    "timerclk1",
> @@ -384,7 +384,7 @@ timer23: timer@10012000 {
>  			compatible = "arm,sp804", "arm,primecell";
>  			reg = <0x10012000 0x1000>;
>  			clocks = <&sp810_syscon0 2>,
> -			         <&sp810_syscon0 3>,
> +				 <&sp810_syscon0 3>,
>  				 <&pclk>;
>  			clock-names = "timerclk2",
>  				    "timerclk3",
> diff --git a/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts b/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts
> index 6ef23c53d2d8..64f87e6c12bf 100644
> --- a/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts
> +++ b/arch/arm/boot/dts/arm/vexpress-v2p-ca15_a7.dts
> @@ -209,11 +209,11 @@ dma@7ff00000 {
>  		clock-names = "apb_pclk";
>  	};
>  
> -        scc@7fff0000 {
> +	scc@7fff0000 {
>  		compatible = "arm,vexpress-scc,v2p-ca15_a7", "arm,vexpress-scc";
>  		reg = <0 0x7fff0000 0 0x1000>;
>  		interrupts = <0 95 4>;
> -        };
> +	};
>  
>  	timer {
>  		compatible = "arm,armv7-timer";
> -- 
> 2.53.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

