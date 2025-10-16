Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22540CCD19E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 11:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FwSP4AHsXvKmS7e+QkaX6SDxzCxztDgBIUCPo7uvZmM=; b=Q6BGup+fCuKUo0Pe9CcDRd1rzr
	jEaw2uOWH2lYGi3jgn7FtrI3sVI2+7RO//jaWh5EQFuQpO+kUbFbPVrbEXPaiJAGo4OXboZko8Tl7
	bjRLYT1kr4ry44NIdTaJcpg6BwZ5OwnSXDZEP0lxeqLkzQkhiGmI3MpxL/mvFlRd4zADj8BqsE0za
	Ok/rtzlgPB30KpUl1AsrgnzS5OYH3xI0glKXZhioYqIvfbhioiHQT/q4qhvqRi1zev7lPmvmsUoiR
	k0kjgWrsOQ24uYzlZ54oqcrwiWmq8sNeDvO6EYpA5LRQYhPj3ZkvYaU5iMkFnkhFHP1DRCYet0ZEG
	+n8ALqrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9MAN-00000004YYN-08cn;
	Thu, 16 Oct 2025 11:29:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9MAJ-00000004YSc-12Ki;
	Thu, 16 Oct 2025 11:29:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760614141;
	bh=Lyvu6W6BJMbQvMe056uyOaXg7YLenPa5GIWWFX8E/rw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P+k/c9b/tT/S6b/bCGrw20R65X5wNohtsfjdiiULHXkUpfoF6JwbyHE+DAPyAy+S5
	 rW/3Um7K493Cg4w9vhOkhJG+kLzwkiv+o7p5OlsZZhgYUB0OV80ysyhfuUgJiOWnUn
	 HtGkJ40RC3joebArgmYoI5JM/tvaZenM/pyfpOCAL7CmtLI5YK14rtjWJFrwClrDbN
	 vWok5W8/IOYDyXuKXwiPLMF16fTnGxvMZJSohPiKLrw/ZfPW3aNpqSTC22L4b2ZwLr
	 rffLiZiVia1nkAbcRDLMvpGDeoehJsuCrrnWNhSaFR0XcC4tikxYlk5+oDXQ7mj0LH
	 4El5IzVEad9Mg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2992D17E1418;
	Thu, 16 Oct 2025 13:29:00 +0200 (CEST)
Message-ID: <42c6675b-3803-4a9a-a716-42e3f9c8bb49@collabora.com>
Date: Thu, 16 Oct 2025 13:28:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/15] arm64: dts: mediatek: mt7981b: Add Ethernet and
 WiFi offload support
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
 <20251016-openwrt-one-network-v1-10-de259719b6f2@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251016-openwrt-one-network-v1-10-de259719b6f2@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_042903_454452_69073C01 
X-CRM114-Status: GOOD (  12.93  )
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
> Add device tree nodes for the Ethernet subsystem on MT7981B SoC,
> including:
> - Ethernet MAC controller with dual GMAC support
> - Wireless Ethernet Dispatch (WED)
> - SGMII PHY controllers for high-speed Ethernet interfaces
> - Reserved memory regions for WiFi offload processor
> 
> Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 133 ++++++++++++++++++++++++++++++
>   1 file changed, 133 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> index 13950fe6e8766..c85fa0ddf2da8 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi

..snip..

> @@ -347,6 +389,97 @@ ethsys: clock-controller@15000000 {
>   			#reset-cells = <1>;
>   		};
>   
> +		wed: wed@15010000 {
> +			compatible = "mediatek,mt7981-wed",
> +				     "syscon";
> +			reg = <0 0x15010000 0 0x1000>;
> +			interrupt-parent = <&gic>;

That's redundant: gic is already the default interrupt parent for this node.

> +			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
> +			memory-region = <&wo_emi0>, <&wo_ilm0>, <&wo_dlm0>,
> +					<&wo_data>, <&wo_boot>;
> +			memory-region-names = "wo-emi", "wo-ilm", "wo-dlm",
> +					      "wo-data", "wo-boot";
> +			mediatek,wo-ccif = <&wo_ccif0>;
> +		};
> +

..snip..

> +
> +		eth_sram: sram@15140000 {
> +			compatible = "mmio-sram";
> +			reg = <0 0x15140000 0 0x40000>;
> +			ranges = <0 0x15140000 0 0x40000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +		};
> +
> +		wo_ccif0: syscon@151a5000 {
> +			compatible = "mediatek,mt7986-wo-ccif", "syscon";
> +			reg = <0 0x151a5000 0 0x1000>;
> +			interrupt-parent = <&gic>;

ditto.

> +			interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
>   		wifi: wifi@18000000 {
>   			compatible = "mediatek,mt7981-wmac";
>   			reg = <0 0x18000000 0 0x1000000>,
> 

Everything else looks good.

Cheers,
Angelo


