Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4391E674AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 07:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NpA/fOuGGd5dNbhqnLS8Lrzej2mOQJtFUDD4TURMyd8=; b=UTVXtmnuZIWt6IihRUNUwHXIgr
	hVpjLa+YQiH4M9I9Bn0P9rtUvDEUcweYhjQI1ZpF3hJ8l1rAW09SuQpbI3XRR7bIv5siSQtGz8FEv
	xXw91VJZh0pBTODpdR32PKIGfGHKlmKGXzQ/Mbr1C3L6GCiemiWZ0v7k4Fmt3N8O/XV9EMAHSM6or
	bo1JQ1Q4J4+Ok4XJKWPsZ7h1ru2O9PNm6aaQyD7sCV6m3kZDhg91dHfRH/ImZnWAgG3tQqia0Om49
	i1EjMwzbgmVxKZAaRhs/lAWoom5qAAM3z/V0t0OfgN6f9cNF9m68+WJnT1vBWNw00xxuQKSxmi5DL
	6qe9S8Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6m7k-00000006857-3FU6;
	Fri, 01 Nov 2024 07:31:12 +0000
Received: from thales.epochal.quest ([51.222.15.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6kvi-00000005wHu-1okd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 06:14:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1730441679;
	bh=D/kAMVeeZ1GBnRC8sst69KP3zOv7FeYAbNLbfbLkabo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HNrTED0L2H9cloFtJBd+q9cfwbKmy6zBOcIMvUfokosLXqYALQbi2ufYWQucriNPy
	 lRUGasfiv0WrWp77DVYYc6qOam68sb5H9DrRBCituuBLxwsrLBaatU26bm9xpNSr4r
	 VKrOlrQraJCCHR2x36dujf6u6FcBA6uAl9WWX9Z2U+ovyD4qW4FkPpvV07bbqdf8kh
	 uQfRc6E659H7m5CiJL3i8YgreDllYuf7nRjHIiKbW1i7FxRNhPp6euibTYWxn3rTb6
	 d3awEskB1M93ZKRzD3rYikffpDwV6LHj/YwJexbfGKpY4U+Rgau2CeyjFD36Brdfzr
	 fPDVGy/RP8PgA==
X-Virus-Scanned: by epochal.quest
MIME-Version: 1.0
Date: Fri, 01 Nov 2024 03:14:32 -0300
From: Cody Eksal <masterr3c0rd@epochal.quest>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Maxime Ripard <mripard@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Nishanth Menon <nm@ti.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Vinod Koul
 <vkoul@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Viresh Kumar
 <viresh.kumar@linaro.org>, Yangtao Li <tiny.windzz@gmail.com>, Parthiban
 <parthiban@linumiz.com>, Andre Przywara <andre.przywara@arm.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/13] arm64: dts: allwinner: a100: add usb related
 nodes
In-Reply-To: <20241031070232.1793078-7-masterr3c0rd@epochal.quest>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
 <20241031070232.1793078-7-masterr3c0rd@epochal.quest>
Message-ID: <c231d0fbd13e2ff6ea23dc907b46112f@epochal.quest>
X-Sender: masterr3c0rd@epochal.quest
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_231442_580943_FBF05F20 
X-CRM114-Status: UNSURE (   8.86  )
X-CRM114-Notice: Please train this message.
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

On 2024/10/31 4:02 am, Cody Eksal wrote:
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi 
> b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> index adb11b26045f..f6162a107641 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> @@ -302,6 +302,97 @@ ths: thermal-sensor@5070400 {
>  			#thermal-sensor-cells = <1>;
>  		};
> +
> +		usb_otg: usb@5100000 {
> +			compatible = "allwinner,sun50i-a100-musb",
> +				     "allwinner,sun8i-a33-musb";
> +			reg = <0x05100000 0x0400>;
> +			clocks = <&ccu CLK_BUS_OTG>;
> +			resets = <&ccu RST_BUS_OTG>;
> +			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "mc";
> +			phys = <&usbphy 0>;
> +			phy-names = "usb";
> +			extcon = <&usbphy 0>;
> +			status = "disabled";
> +		};
Quick note: it was determined that if ehci0 and/or ohci0 are enabled,
peripheral mode does not function correctly. From my understanding, it 
is
an unrelated issue in musb that causes this; the PHY gets claimed by the
HCI nodes before MUSB, and due to some other issue, the PHY doesn't get
properly rerouted to MUSB. With those nodes disabled, attaching gadgets 
to
MUSB works correctly, and with them enabled, host mode works properly.

- Cody
> +		usbphy: phy@5100400 {
> +			compatible = "allwinner,sun50i-a100-usb-phy",
> +				     "allwinner,sun20i-d1-usb-phy";
> +			reg = <0x05100400 0x100>,
> +			      <0x05101800 0x100>,
> +			      <0x05200800 0x100>;
> +			reg-names = "phy_ctrl",
> +				    "pmu0",
> +				    "pmu1";
> +			clocks = <&ccu CLK_USB_PHY0>,
> +				 <&ccu CLK_USB_PHY1>;
> +			clock-names = "usb0_phy",
> +				      "usb1_phy";
> +			resets = <&ccu RST_USB_PHY0>,
> +				 <&ccu RST_USB_PHY1>;
> +			reset-names = "usb0_reset",
> +				      "usb1_reset";
> +			status = "disabled";
> +			#phy-cells = <1>;
> +		};
> +
> +		ehci0: usb@5101000 {
> +			compatible = "allwinner,sun50i-a100-ehci",
> +				     "generic-ehci";
> +			reg = <0x05101000 0x100>;
> +			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_OHCI0>,
> +				 <&ccu CLK_BUS_EHCI0>,
> +				 <&ccu CLK_USB_OHCI0>;
> +			resets = <&ccu RST_BUS_OHCI0>,
> +				 <&ccu RST_BUS_EHCI0>;
> +			phys = <&usbphy 0>;
> +			phy-names = "usb";
> +			status = "disabled";
> +		};
> +
> +		ohci0: usb@5101400 {
> +			compatible = "allwinner,sun50i-a100-ohci",
> +				     "generic-ohci";
> +			reg = <0x05101400 0x100>;
> +			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_OHCI0>,
> +				 <&ccu CLK_USB_OHCI0>;
> +			resets = <&ccu RST_BUS_OHCI0>;
> +			phys = <&usbphy 0>;
> +			phy-names = "usb";
> +			status = "disabled";
> +		};

