Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D41CD149F9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 00:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wQyaREyI02dVpWrHh5IW74tlfaGfUJTmgG6plgvhZc8=; b=Cjv/qreAc8j29f7B/ZKfAA+Jrh
	wOmQmJT6uyqP2AQeP9CTxAApnS+TIQvxVNXXREvzFHQuLR7/ITCrB5LAMana/gDJG4G4DWp1HeD+s
	gxhIoAbDZ40a0boXrOH0MgXaIA4BJxyATghzk9GZu/TciU6KCCzhqAUArxgdAxBYDoQrh815gBI6F
	CUJJ6wpLzOhydviXf2R0kzJmRkcSoH599plmrQoNCyDwYMqmRDeJGoCCx+Mnt1tENX1VGJCRNFNXW
	Ub4PyKp2eQIULcDNHnGTD+0K0J5PEAeTr5iYslu898SZJ6O49rkUxP6dyo6WRrIbERUngf56tQOxv
	bBNodPAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Uwv-00000005fnf-2TeB;
	Sat, 26 Oct 2024 00:46:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4UvK-00000005fbJ-19bq;
	Sat, 26 Oct 2024 00:45:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19F9A339;
	Fri, 25 Oct 2024 17:45:25 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8BFB3F71E;
	Fri, 25 Oct 2024 17:44:50 -0700 (PDT)
Date: Sat, 26 Oct 2024 01:44:44 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Cody Eksal <masterr3c0rd@epochal.quest>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-usb@vger.kernel.org, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Parthiban <parthiban@linumiz.com>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Vinod Koul <vkoul@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Thierry Reding
 <treding@nvidia.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Yangtao Li <tiny.windzz@gmail.com>, Viresh
 Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd
 <sboyd@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH 07/13] arm64: dts: allwinner: a100: add usb related
 nodes
Message-ID: <20241026014444.12c8c99b@minigeek.lan>
In-Reply-To: <20241024170540.2721307-8-masterr3c0rd@epochal.quest>
References: <20241024170540.2721307-1-masterr3c0rd@epochal.quest>
	<20241024170540.2721307-8-masterr3c0rd@epochal.quest>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_174458_447460_8E61CD25 
X-CRM114-Status: GOOD (  19.95  )
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

On Thu, 24 Oct 2024 14:05:25 -0300
Cody Eksal <masterr3c0rd@epochal.quest> wrote:

Hi,

> From: Yangtao Li <frank@allwinnertech.com>
> 
> Allwinner A64 have two HCI USB controllers, a OTG controller and a USB
> PHY device, let's add nodes on dts.
> 
> Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> [masterr3c0rd@epochal.quest: fallback to a33-musb instead of h3-musb]
> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
> ---
>  .../arm64/boot/dts/allwinner/sun50i-a100.dtsi | 91 +++++++++++++++++++
>  1 file changed, 91 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> index adb11b26045f..0aee1b578661 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> @@ -302,6 +302,97 @@ ths: thermal-sensor@5070400 {
>  			#thermal-sensor-cells = <1>;
>  		};
>  
> +		usbphy: phy@5100400 {
> +			#phy-cells = <1>;

Please keep the compatible string first, and move #phy-cells to the end.

> +			compatible = "allwinner,sun50i-a100-usb-phy";
> +			reg = <0x05100400 0x14>,
> +			      <0x05101800 0x4>,
> +			      <0x05200800 0x4>;

We need at least 0x24 for the phy_ctrl and 0x14 for the PMUs. But I
wonder if we should use 0x100 for all of them, like for the D1, as there
are more registers. The fact that the Linux driver doesn't use more
shouldn't prevent the DT from describing them.

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
> +		};
> +
> +		ehci0: usb@5101000 {

The nodes are ordered by their MMIO base address, so please move them
around accordingly.

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
> +			dr_mode = "otg";

dr_mode should be set in the board .dts, so please remove that line
from here.

For the records: I checked the MMIO base addresses, clock and reset
names and the IRQs against the manual: they all match.

Cheers,
Andre

> +			status = "disabled";
> +		};
> +
> +		ehci1: usb@5200000 {
> +			compatible = "allwinner,sun50i-a100-ehci",
> +				     "generic-ehci";
> +			reg = <0x05200000 0x100>;
> +			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_OHCI1>,
> +				 <&ccu CLK_BUS_EHCI1>,
> +				 <&ccu CLK_USB_OHCI1>;
> +			resets = <&ccu RST_BUS_OHCI1>,
> +				 <&ccu RST_BUS_EHCI1>;
> +			phys = <&usbphy 1>;
> +			phy-names = "usb";
> +			status = "disabled";
> +		};
> +
> +		ohci1: usb@5200400 {
> +			compatible = "allwinner,sun50i-a100-ohci",
> +				     "generic-ohci";
> +			reg = <0x05200400 0x100>;
> +			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_OHCI1>,
> +				 <&ccu CLK_USB_OHCI1>;
> +			resets = <&ccu RST_BUS_OHCI1>;
> +			phys = <&usbphy 1>;
> +			phy-names = "usb";
> +			status = "disabled";
> +		};
> +
>  		r_ccu: clock@7010000 {
>  			compatible = "allwinner,sun50i-a100-r-ccu";
>  			reg = <0x07010000 0x300>;


