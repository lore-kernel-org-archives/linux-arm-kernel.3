Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B90CCD1A1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 11:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sIwtLMS6MmVyfVCvT1w6pF8H5OPJCUkm9KctOwZhfKk=; b=OPp7y6K3sJSRK1JRDV+PH0eeLQ
	UWTJXYGkokkQSCRwdftRnswTsQU0JnDfFz/OBI3L4tX4haX8HLJV/dgdP2NkBimJcoUZVu3DzFY8W
	wmxJCkkUHYXDcOZM5AHiTcDsXzyrH7QCo81SREk5ZxJEMYL/SsmYBG+FbiW5dVdev1l7xqNgVz/JN
	w2IvN6Tdp23Wcz6awKcHwCNOkVXLpTgEj9QLQtISWkJtwV3W3E4gveBUWY/p2xls221TPKzk/G4ln
	DHKGf8SnbTwMquZZXhknDxp9FzkhTGadPmG0NzGZhu3DyhOvc/THHgrBEPxjWcS/p469qTNp0J2OL
	07Uq2tJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9MAj-00000004Z3G-0xy3;
	Thu, 16 Oct 2025 11:29:29 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9MAd-00000004Ys1-0hj3;
	Thu, 16 Oct 2025 11:29:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760614160;
	bh=L5eCza82ytFr8BVqmkmTv1s+8qWAjleYWe5VZvel0wc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JCQ167QBhQIRODWZKKIxlfh6W4KgHrm0lN24lSsjGWAM/Ixkmq6dMcdn3BS2AHXN5
	 qNs9a19o2/vMIqaAT3HHlZOYyXbu9Jv0ztTr5iinHBp9Oq1q4MM2+1JMHfwd/wlTCR
	 3jevnQr9/eHORuUzSQBIM1W0j3LV74fIJKeFKRy1lgH2d21fhAKjyvc14LKa6VUxTb
	 l/IPM4qvirw6rsoNJKEYAxj+iJYJGoW3r5bFfxChz14P8daP6kpKOyE3ap53x2JHRB
	 9jVawUNle5c8C+/aX0z1qxFN2EKlphBLcbGNnentpmgcqDrkdZtfNzeaGCytm3rIam
	 jE6de30OQpJWw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C721B17E15DB;
	Thu, 16 Oct 2025 13:29:19 +0200 (CEST)
Message-ID: <a5f19be8-d063-49bf-951d-cc7f14b64987@collabora.com>
Date: Thu, 16 Oct 2025 13:29:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] arm64: dts: mediatek: mt7981b: Add PCIe and USB
 support
To: Sjoerd Simons <sjoerd@collabora.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Lee Jones <lee@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, netdev@vger.kernel.org,
 Daniel Golle <daniel@makrotopia.org>, Bryan Hinton <bryan@bryanhinton.com>
References: <20251016-openwrt-one-network-v1-0-de259719b6f2@collabora.com>
 <20251016-openwrt-one-network-v1-7-de259719b6f2@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251016-openwrt-one-network-v1-7-de259719b6f2@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_042923_434712_90E9FEAE 
X-CRM114-Status: GOOD (  14.81  )
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

Il 16/10/25 12:08, Sjoerd Simons ha scritto:
> Add device tree nodes for PCIe controller and USB3 XHCI host
> controller on MT7981B SoC. Both controllers share the USB3 PHY
> which can be configured for either USB3 or PCIe operation.
> 
> The USB3 XHCI controller supports USB 2.0 and USB 3.0 SuperSpeed
> operation. The PCIe controller is compatible with PCIe Gen2
> specifications.
> 
> Also add the topmisc syscon node required for USB/PCIe PHY
> multiplexing.
> 
> Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 82 +++++++++++++++++++++++++++++++
>   1 file changed, 82 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> index b477375078ccd..13950fe6e8766 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> @@ -2,6 +2,7 @@
>   
>   #include <dt-bindings/clock/mediatek,mt7981-clk.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/phy/phy.h>
>   #include <dt-bindings/reset/mt7986-resets.h>
>   
>   / {
> @@ -221,6 +222,57 @@ auxadc: adc@1100d000 {
>   			status = "disabled";
>   		};
>   
> +		xhci: usb@11200000 {
> +			compatible = "mediatek,mt7986-xhci", "mediatek,mtk-xhci";
> +			reg = <0 0x11200000 0 0x2e00>,
> +			      <0 0x11203e00 0 0x0100>;

reg fits in one line.

> +			reg-names = "mac", "ippc";
> +			clocks = <&infracfg CLK_INFRA_IUSB_SYS_CK>,
> +				 <&infracfg CLK_INFRA_IUSB_CK>,
> +				 <&infracfg CLK_INFRA_IUSB_133_CK>,
> +				 <&infracfg CLK_INFRA_IUSB_66M_CK>,
> +				 <&topckgen CLK_TOP_U2U3_XHCI_SEL>;
> +			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
> +			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> +			phys = <&u2port0 PHY_TYPE_USB2>,
> +			       <&u3port0 PHY_TYPE_USB3>;

phys fits in one line.

Other than that, looks good; after applying the proposed changes:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



