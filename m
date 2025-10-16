Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE69CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 11:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YsXVrucIIt3TphSHL/s7HdBlXHWh9AuDf624Z4bHkuM=; b=oFd0xRdVJWWewIRS+cYc8Evqt/
	onXokTt4hyXaTKjjSE0bhs4F7oyU1ZS5NTouN3LpGDio85N4pabeyf4MlwwXlqwesqY8BNq1NAS7x
	1uuWYpGfq2XsV2myBpK+saVt4HdNbp9SMiUa1Ez3WG6b+vzZU4AGhNBvKPp7LbsgkNA+dRACJnhHU
	s7XNpp0azAwK8XjFI/55h19SIx/kzvDUGMgUI3HUMKtQvMVttmcYbPQKKAf3CVYLex2KuJmNy/oc/
	1FEPTkBDP9b6OE/Zqw2jzJTsGBVLvlSVX8YBZmY03gohfkrc/9Paygvlmd4ZsVyOJoXO3/OjeMDRC
	eVHPhijA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9MAM-00000004YWt-0cdo;
	Thu, 16 Oct 2025 11:29:06 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9MAF-00000004YO7-1Q31;
	Thu, 16 Oct 2025 11:29:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760614137;
	bh=a6EjBxSL+AztzP80wd9ior27gbskV5duRrn8UtU92OY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FydvyZ78tjryCDGlhIks+F1YqEJueAtJgd8GtlWtWs6sKRBlhIiAG/XWJMkHcjHSx
	 d50HPq3ja2DGVi/jmj4frdJXmUkYqo3aeWzXztJo1ERWnzkinwgwxsNcQBoyWHIWVG
	 VR0jcXLfK3y45ji4ipPW/X/86cnxGqabJdJb7pAkarYIE0ISOr5T/82wy59BDB7TVc
	 GD+ggRlOAI5J0CdRkTNfb7ORmKKJulmaYkOYL6XfIPMOsl1QLGjqB1YwQgXAidNHN8
	 5KPK3tMDhmma1gHJfL7TpqKXQUyYymAqzRvXt5Wbl4MDx+0E4a533zfopgYCCyhAV+
	 dmkpyRpsMLqWQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 479B417E1407;
	Thu, 16 Oct 2025 13:28:56 +0200 (CEST)
Message-ID: <c9865ab0-cbc2-47b5-b7cf-acb8b9c52695@collabora.com>
Date: Thu, 16 Oct 2025 13:28:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] arm64: dts: mediatek: mt7981b-openwrt-one: Enable
 SPI NOR
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
 <20251016-openwrt-one-network-v1-11-de259719b6f2@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251016-openwrt-one-network-v1-11-de259719b6f2@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_042859_556098_8AF9D4EC 
X-CRM114-Status: GOOD (  15.69  )
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
> The openwrt one has a SPI NOR flash which from factory is used for:
> * Recovery system
> * WiFi eeprom data
> * ethernet Mac addresses
> 
> Describe this following the same partitions as the openwrt configuration
> uses.
> 
> Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
> ---
>   .../boot/dts/mediatek/mt7981b-openwrt-one.dts      | 83 ++++++++++++++++++++++
>   1 file changed, 83 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
> index b6ca628ee72fd..9878009385cc6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
> @@ -3,6 +3,7 @@
>   /dts-v1/;
>   
>   #include "mt7981b.dtsi"
> +#include "dt-bindings/pinctrl/mt65xx.h"
>   
>   / {
>   	compatible = "openwrt,one", "mediatek,mt7981b";
> @@ -54,6 +55,25 @@ mux {
>   		};
>   	};
>   
> +	spi2_flash_pins: spi2-pins {
> +		mux {
> +			function = "spi";
> +			groups = "spi2";
> +		};
> +
> +		conf-pu {
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_11>;
> +			drive-strength = <MTK_DRIVE_8mA>;

drive-strength = <8>;

> +			pins = "SPI2_CS", "SPI2_WP";
> +		};
> +
> +		conf-pd {
> +			bias-pull-down = <MTK_PUPD_SET_R1R0_11>;
> +			drive-strength = <MTK_DRIVE_8mA>;

ditto

> +			pins = "SPI2_CLK", "SPI2_MOSI", "SPI2_MISO";
> +		};
> +	};
> +
>   	uart0_pins: uart0-pins {
>   		mux {
>   			function = "uart";
> @@ -62,6 +82,69 @@ mux {
>   	};
>   };
>   
> +&spi2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spi2_flash_pins>;
> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <40000000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			partition@0 {
> +				reg = <0x00000 0x40000>;
> +				label = "bl2-nor";
> +			};
> +
> +			partition@40000 {
> +				reg = <0x40000 0xc0000>;
> +				label = "factory";
> +				read-only;
> +
> +				nvmem-layout {
> +					compatible = "fixed-layout";
> +					#address-cells = <1>;
> +					#size-cells = <1>;
> +
> +					eeprom_factory_0: eeprom@0 {

wifi_calibration:

> +						reg = <0x0 0x1000>;
> +					};
> +
> +					macaddr_factory_4: macaddr@4 {

macaddr_factory_gmac1?

You're not using this in the later commit where you enable ethernet nodes,
did you miss adding that to gmac1 or what is this used for?

> +						reg = <0x4 0x6>;
> +						compatible = "mac-base";
> +						#nvmem-cell-cells = <1>;
> +					};
> +
> +					macaddr_factory_24: macaddr@24 {

macaddr_factory_gmac0 ?


Cheers,
Angelo

