Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EAAE674A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 05:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KsIO27gsMFDVvdSYn96XeM2cN2MZTMmCMSsPkFkYeNg=; b=NlmgvH6Y7BHD/1G+9OskIhAxBi
	GrouM7bGy0xe5fMVgRMIAf5S3FplqGS81RW+WhtenZJh74l5yCmYjOdkdmImeIvqlJnrdOSvExfVO
	tARRWae4val7ga1CKknTbva6ElcioowGmELCzRlvL0w3hDxgRq1v5DI76LJGAwxkK9CYL5VQxLB6U
	BUbZpd01GhY7nb4G+uxhIuZGjZxID0MqAYxE3fXgkxiOx8wN6Y14tCsCXO3gF2UWY1JkudTQOgWPa
	o3c2S8zD49S0fm7ZXOp+OSqdTJEHtp9r92HUdHK+psL55f4LkUub+m++yL8I4pjqjbIakIYq7Xq0Z
	1Y464IvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6kJT-00000005qpJ-1IYL;
	Fri, 01 Nov 2024 05:35:11 +0000
Received: from omta034.useast.a.cloudfilter.net ([44.202.169.33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6kHj-00000005qPY-3nX5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 05:33:26 +0000
Received: from eig-obgw-6005a.ext.cloudfilter.net ([10.0.30.201])
	by cmsmtp with ESMTPS
	id 6Bo1tZhjJrKrb6kHgt6ftG; Fri, 01 Nov 2024 05:33:20 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id 6kHbtLxs1xK8v6kHcthvm7; Fri, 01 Nov 2024 05:33:17 +0000
X-Authority-Analysis: v=2.4 cv=T/9HTOKQ c=1 sm=1 tr=0 ts=6724681d
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=-pn6D5nKLtMA:10 a=6Ujbnq6iAAAA:8
 a=vU9dKmh3AAAA:8 a=uXP6E58horQQbnEz6SkA:9 a=QEXdDO2ut3YA:10
 a=-sNzveBoo8RYOSiOai2t:22 a=rsP06fVo5MYu2ilr0aT5:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KsIO27gsMFDVvdSYn96XeM2cN2MZTMmCMSsPkFkYeNg=; b=ZZ4my0joR3FM9GiojirEbvrQMi
	kacs17UJsIZgN7r0skFbn6kKVskk8xzdoj1k+crQIMRt8lsStrGfey27QnS35DwsBn9zNJfGRP1X5
	P+D2d044aw5ZSYYALvJwfRZy+NyXZvHWXqFhZMsnfKqVxBDDKExElwDuyuxnqyZIcIoP7q+Ihfe39
	+ow3nZKgE4/yk3an+6nxEG7NOsi0nrWAKNQ3R9k5b2b1SIpnu9A5EJaKylN71msYHzO5zIkkbvHHF
	Kfyn8lFW0LRQI7r7n5AbDVONZxL+C72WTCnbGqYPSm5wOPv1nWYYYIXain+H+yT1jyiYxHuI/z0A5
	/rRVTnew==;
Received: from [122.165.245.213] (port=35224 helo=[192.168.1.5])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1t6kHS-002KJ3-32;
	Fri, 01 Nov 2024 11:03:06 +0530
Message-ID: <d38ff4ee-27a6-48ef-8429-15f59230de46@linumiz.com>
Date: Fri, 1 Nov 2024 11:03:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Nishanth Menon <nm@ti.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Yangtao Li <tiny.windzz@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/13] arm64: dts: allwinner: a100: add usb related
 nodes
To: Cody Eksal <masterr3c0rd@epochal.quest>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
 <20241031070232.1793078-7-masterr3c0rd@epochal.quest>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <20241031070232.1793078-7-masterr3c0rd@epochal.quest>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1t6kHS-002KJ3-32
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.5]) [122.165.245.213]:35224
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 3
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfN7zs+u5LgUyrErpnWYRWGS2B3TEgrQjdTcF5p35QKiPQYCk9G+ni6pnFgql+F/2DV2dCNdNrBW7ygkgdRBfZ9JBGUMb/MQpD5xNgagBUYL2JIyJrfD2
 B0LNawUxXiEaVnen3Ph3EwKwckRfYjuQDTWUZKQzXmYxX7eiExqk0HZwwBJy1Sv7tBvP3IoT4WDxa61/tT9ZToNADaIeBGwP0SucGX6KAJCPkPU9kNrSQNjm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_223324_889820_887808A5 
X-CRM114-Status: GOOD (  14.23  )
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

On 10/31/24 12:32 PM, Cody Eksal wrote:
> From: Yangtao Li <frank@allwinnertech.com>
> 
> The Allwinner A100 has two HCI USB controllers, a OTG controller and a
> USB PHY. The PHY is compatible with that used by the D1, while the OTG
> controller is compatible with the A33. Add nodes for these to the base
> DTSI.
> 
> Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> [masterr3c0rd@epochal.quest: fallback to a33-musb and d1-usb-phy, edited message]
> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
Peripheral mode works after disabling ehci0 and ohci0. Otherwise,

Tested-by: Parthiban Nallathambi <parthiban@linumiz.com>

Thanks,
Parthiban
> ---
> Changes in V2:
>  - Fix sizes of reg definitions in usbphy
>  - Move #phy-cells to the end of usbphy
>  - Order nodes by MMIO address
>  - Remove dr_mode
> 
>  .../arm64/boot/dts/allwinner/sun50i-a100.dtsi | 91 +++++++++++++++++++
>  1 file changed, 91 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> index adb11b26045f..f6162a107641 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
> @@ -302,6 +302,97 @@ ths: thermal-sensor@5070400 {
>  			#thermal-sensor-cells = <1>;
>  		};
>  
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
> +
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


