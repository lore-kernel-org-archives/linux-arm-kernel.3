Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA8CC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 10:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6fT0JHcBDi7nPlrNdPIWKJZ4B9TbWXF2CQmiWNWo0V8=; b=OjPZoEZcdY3vFeFtB2vqpkleRw
	aRcsqdssu2JYhL1kWgjQd848Jcxbd4pJisVjkFQDXiuhHUA0bDBINZo0I2GBF7KMl/8ED8lM1tVVI
	zcmj1MYBXfYC9NnBtfZU35EJbvh/x94eJ78zzPHtJIluNQhKosBDyI14p24tzVacsLLFgaWwHcMXj
	4x9L3HOrPmWjsAqbYIjD+xIyeCfblGOTho/7T/UZz46cCR06SuLpjNa2ONIf0P93wO36pKY0YNROb
	fQV1ydQHlcd9BiJnIKkS1qbo2UvkCVmancNKYPblPGprGR4aehxlAPvBW91rPGpTuMDb24Uumh3x8
	SVO7fLEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4HSp-00000001chS-3t3P;
	Mon, 14 Apr 2025 10:54:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4H2L-00000001Wun-2nyo;
	Mon, 14 Apr 2025 10:27:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744626451;
	bh=kh41PVQ169ONxY8zyLUhq7Qb7ay3Ohg0lpouG+/0TLU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S9nq3Eq3LbgcNAFS71/6y0Loiki36qKw4lTfmjLUQIg569/6wtxPY33vUfuackdB2
	 jIUUgl6E4af0L+/hPW/2bbvBspm7c+li4HdhUiNSOKspXpujLCNcWoKEFGCtDfpiit
	 ujYWEPyEq30v2l8yJd2TYnk8lIfR8bfYUAFyY9CtNozZm0nY/dSavqjYOIgH6B+beS
	 M28pmaVNC6YsJ4jVTe+V6wFZLTeKmD62r20+VJwLLQmrpYgG0arFjvIBRnxSEzoWuC
	 EfFKDv+Bux+rDy2OWXm7uFWcqrEuh0ZNm4kY2MyMmL98PicI57Io57ma468ZE6GG3u
	 aEunzGofAW6Ew==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0B9FD17E1034;
	Mon, 14 Apr 2025 12:27:30 +0200 (CEST)
Message-ID: <e243cca4-40d7-4cd6-804a-7e63bb5581b0@collabora.com>
Date: Mon, 14 Apr 2025 12:27:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 5/5] arm64: dts: mediatek: mt7988: Add xsphy for
 ssusb0/pcie2
To: Frank Wunderlich <linux@fw-web.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>, Sam Shih <sam.shih@mediatek.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250413085806.8544-1-linux@fw-web.de>
 <20250413085806.8544-6-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250413085806.8544-6-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_032733_889072_FF469FC2 
X-CRM114-Status: GOOD (  12.55  )
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

Il 13/04/25 10:58, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> First usb and third pcie controller on mt7988 need a xs-phy to work
> properly.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>   arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 39 +++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> index 88b56a24efca..10525d977007 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> @@ -334,6 +334,8 @@ usb@11190000 {
>   				 <&infracfg CLK_INFRA_133M_USB_HCK>,
>   				 <&infracfg CLK_INFRA_USB_XHCI>;
>   			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
> +			phys = <&xphyu2port0 PHY_TYPE_USB2>,
> +			       <&xphyu3port0 PHY_TYPE_USB3>;
>   			status = "disabled";
>   		};
>   
> @@ -398,6 +400,9 @@ pcie2: pcie@11280000 {
>   			pinctrl-0 = <&pcie2_pins>;
>   			status = "disabled";
>   
> +			phys = <&xphyu3port0 PHY_TYPE_PCIE>;
> +			phy-names = "pcie-phy";
> +
>   			#interrupt-cells = <1>;
>   			interrupt-map-mask = <0 0 0 0x7>;
>   			interrupt-map = <0 0 0 1 &pcie_intc2 0>,
> @@ -548,6 +553,40 @@ tphyu3port0: usb-phy@11c50700 {
>   			};
>   		};
>   
> +		topmisc: power-controller@11d10000 {
> +			compatible = "mediatek,mt7988-topmisc", "syscon",
> +				     "mediatek,mt7988-power-controller";
> +			reg = <0 0x11d10000 0 0x10000>;
> +			#clock-cells = <1>;
> +			#power-domain-cells = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		xs-phy@11e10000 {

That shall be just "phy@addr"

> +			compatible = "mediatek,mt7988-xsphy",
> +				     "mediatek,xsphy";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			status = "disabled";
> +
> +			xphyu2port0: usb-phy@11e10000 {

Perhaps just u2port0/u3port0 like done on the other MediaTek SoC DTs is better
for consistency :-)

Cheers!

> +				reg = <0 0x11e10000 0 0x400>;
> +				clocks = <&infracfg CLK_INFRA_USB_UTMI>;
> +				clock-names = "ref";
> +				#phy-cells = <1>;
> +			};
> +
> +			xphyu3port0: usb-phy@11e13000 {
> +				reg = <0 0x11e13400 0 0x500>;
> +				clocks = <&infracfg CLK_INFRA_USB_PIPE>;
> +				clock-names = "ref";
> +				#phy-cells = <1>;
> +				mediatek,syscon-type = <&topmisc 0x218 0>;
> +			};
> +		};
> +
>   		clock-controller@11f40000 {
>   			compatible = "mediatek,mt7988-xfi-pll";
>   			reg = <0 0x11f40000 0 0x1000>;



