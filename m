Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F474C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 12:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QlRB9Iaokfu0oipHLYE3CeIxI9maDwC7586JM6Zrrcs=; b=laQWYNDX8IiLgLcXtah6lskGVS
	ZhgpJVuqGwt02K5NJDHDZ6N3oTUdkC9hlySx1XegW5JYMYjwGPMj69ovDnN/kzHPvshUcIWooIYRG
	uCZUDlQpN1HsYwlDmNkD8tyE+1+HusRwcFvz7R3fK2j2kc5FVZIfPekeQENaN/4aLJRHStEuLF+g0
	YIdZ4pk/ukmTAaiDJEYffXn2qHAcGI3JeFxXTXESjxNHhRRX6G1L+OiIr6DT9JymyZSknuw0DX1kn
	I7vGzj5oqw5Nvy+HO6+0457jKHgydDbTres5CARGMprQswn7b2rFRnA8alPywX0LeETNyJttXpdu6
	XLJQrcBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD026-00000000YkK-1uO1;
	Thu, 08 May 2025 12:07:22 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD008-00000000YaI-20DO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 12:05:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0AF7114800B7;
	Thu,  8 May 2025 14:05:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1746705914; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=QlRB9Iaokfu0oipHLYE3CeIxI9maDwC7586JM6Zrrcs=;
	b=D009CDIO4uX44xO7JFbCItOhC77Mhdg1qz/LCj1MPQummr1uvp6uLhO14nYwCQbamhPH1m
	J4c+BPCmtCJ3iRq65gWS0BdqEXeKQMLIaz7WGMUauKPvAJSAQu1kmDT5Wi5ufXQoB+l4NZ
	T4HIhGpm276h0WvaRvgeSbtc3jWvYsfni4jgFzAYgDMR7Sx/L+NRkfPJMshTaHrUVlb3WW
	7nKVWDSw1JIAPI0LBLnghBb7S0qAvYKezgfyNgl5aOQwkLwuZAo4QEL2RExD1Llu+phqjG
	2EmE6QmVpj7oT36SECecjm+USZfsC2QtC2HVno7OpWrjA8UVpbCC2FKc7xDTrg==
Date: Thu, 8 May 2025 14:05:07 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Michael Klein <michael@fossekall.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: bananapi: add support for PHY LEDs
Message-ID: <20250508-strategy-simmering-20a48db6b6dd@thorsis.com>
Mail-Followup-To: Michael Klein <michael@fossekall.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
References: <20250507182005.8660-1-michael@fossekall.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507182005.8660-1-michael@fossekall.de>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_050520_972935_3238A1F7 
X-CRM114-Status: GOOD (  17.70  )
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

Hallo Michael,

Am Wed, May 07, 2025 at 08:20:04PM +0200 schrieb Michael Klein:
> The RTL8211E ethernet PHY driver has recently gained support for
> controlling PHY LEDs via /sys/class/leds. The Bananapi M1 has three
> LEDs connected to the RTL8211E PHY. Add the corresponding nodes to
> the device tree.
> 
> v2: Refine commit message

This changelog should usually go below the '---' so it won't end up in
the commit message, but in the e-mail only.

Greets
Alex

> 
> Signed-off-by: Michael Klein <michael@fossekall.de>
> ---
>  .../boot/dts/allwinner/sun7i-a20-bananapi.dts | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts b/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
> index 46ecf9db2324..d8b362c9661a 100644
> --- a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
> +++ b/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
> @@ -48,6 +48,7 @@
>  
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/leds/common.h>
>  
>  / {
>  	model = "LeMaker Banana Pi";
> @@ -169,6 +170,32 @@ &ir0 {
>  &gmac_mdio {
>  	phy1: ethernet-phy@1 {
>  		reg = <1>;
> +
> +		leds {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			led@0 {
> +				reg = <0>;
> +				color = <LED_COLOR_ID_GREEN>;
> +				function = LED_FUNCTION_LAN;
> +				linux,default-trigger = "netdev";
> +			};
> +
> +			led@1 {
> +				reg = <1>;
> +				color = <LED_COLOR_ID_AMBER>;
> +				function = LED_FUNCTION_LAN;
> +				linux,default-trigger = "netdev";
> +			};
> +
> +			led@2 {
> +				reg = <2>;
> +				color = <LED_COLOR_ID_BLUE>;
> +				function = LED_FUNCTION_LAN;
> +				linux,default-trigger = "netdev";
> +			};
> +		};
>  	};
>  };
>  
> -- 
> 2.39.5
> 
> 

