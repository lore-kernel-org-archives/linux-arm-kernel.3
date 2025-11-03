Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3D9CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 08:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d3T6zvBwWtcDikB3EvsmcmRMRSfKTigwPeDjYvbeKoI=; b=e4Xb35IXLES1qzAiUELyfTA4Xx
	OSoiF3iSjIcaYjl2Ya9SuE8jXBQx90fGpkYftwj1W+T5NOOYFw/n1hn+178ekPuuO0rpnU2gmXbZy
	2f9W8O5xRHFBeTr0p1tbM/jRkj1JuG5S4ju3zVpiOIAxo6xua6PrhuxC41dbMLvHl2CAFxXhpqKIQ
	l9hijMSuD62WKrO6Bzpu5ecpYmU1eh38WU2YhB5vIBw8tOsuwaGYN2FHnZlKNhedP+2hmcHVpy79f
	nrTkgGFxgV9qCk2kfE4wyobCp3N2CpBwQoJPDBzoYbuPT1UOpYsEGx1mwM5K8epM1xUG++p5em6c+
	IFuf7CDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFqAz-00000009SUM-4C4X;
	Mon, 03 Nov 2025 08:44:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFqAx-00000009STF-1d8C;
	Mon, 03 Nov 2025 08:44:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762159469;
	bh=pcZ33mdM8HReLodUv0lZriPlCCx/Bf24CmKMc0Svvy8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BWIJmt80XBuwFXq8VSpppUMxGRo2XS0HDV66ojU1NOb7prrkEmP7cxOqiD5li7Ofg
	 RgTMmjXCKyLnfQWUzoy5k95p4uyVasN03CIsB8HyhIyk4cDQXGc3j2YhzfsFsv9+17
	 8HAEmCaxNSOjGxMQpErDjoLxCXjsd8QefCQrZwI7u3DiGaEZ4YgihN2UCDGopCuHrk
	 vvQx3qo51DkK9E63L9jbn5O/qC+D2aNqj69rUOM5oCXZz+IDCm3lPdnk7ssUT7l19n
	 53582eSur4BENwCS1yBKOI6W0kugUddjopf79Vi4SvtZzJ7MaT0Tvx05Bw/c+gRfz9
	 FTpwcyHQcGLFA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D772817E1299;
	Mon,  3 Nov 2025 09:44:27 +0100 (CET)
Message-ID: <9cba2013-0f01-40ab-9d3b-10f4bc3f02f3@collabora.com>
Date: Mon, 3 Nov 2025 09:44:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/15] arm64: dts: mediatek: mt7981b-openwrt-one:
 Enable wifi
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
References: <20251101-openwrt-one-network-v2-0-2a162b9eea91@collabora.com>
 <20251101-openwrt-one-network-v2-14-2a162b9eea91@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251101-openwrt-one-network-v2-14-2a162b9eea91@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_004431_578732_C6A53966 
X-CRM114-Status: GOOD (  13.98  )
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

Il 01/11/25 14:32, Sjoerd Simons ha scritto:
> Enable Dual-band WiFI 6 functionality on the Openwrt One
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
> ---
> V1 -> V2: Update eeprom node label
> ---
>   .../boot/dts/mediatek/mt7981b-openwrt-one.dts      | 24 ++++++++++++++++++++++
>   arch/arm64/boot/dts/mediatek/mt7981b.dtsi          |  2 +-
>   2 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
> index 90edb9f493c6d..b13f16d7816bf 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
> @@ -129,6 +129,22 @@ conf-pd {
>   			pins = "SPI2_CLK", "SPI2_MOSI", "SPI2_MISO";
>   		};
>   	};
> +
> +	wifi_dbdc_pins: wifi-dbdc-pins {
> +		mux {
> +			function = "eth";
> +			groups = "wf0_mode1";
> +		};
> +
> +		conf {
> +			pins = "WF_HB1", "WF_HB2", "WF_HB3", "WF_HB4",
> +			       "WF_HB0", "WF_HB0_B", "WF_HB5", "WF_HB6",
> +			       "WF_HB7", "WF_HB8", "WF_HB9", "WF_HB10",
> +			       "WF_TOP_CLK", "WF_TOP_DATA", "WF_XO_REQ",
> +			       "WF_CBA_RESETB", "WF_DIG_RESETB";
> +			drive-strength = <MTK_DRIVE_4mA>;

You forgot to address my comment here. drive-strength = <4>;

Regards,
Angelo

> +		};
> +	};
>   };
>   
>   &spi2 {
> @@ -200,6 +216,14 @@ &usb_phy {
>   	status = "okay";
>   };
>   
> +&wifi {
> +	nvmem-cells = <&wifi_factory_calibration>;
> +	nvmem-cell-names = "eeprom";
> +	pinctrl-names = "dbdc";
> +	pinctrl-0 = <&wifi_dbdc_pins>;
> +	status = "okay";
> +};
> +
>   &xhci {
>   	phys = <&u2port0 PHY_TYPE_USB2>;
>   	vusb33-supply = <&reg_3p3v>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> index eb2effb3c1ed2..17dd13d4c0015 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> @@ -490,7 +490,7 @@ wo_ccif0: syscon@151a5000 {
>   			interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>;
>   		};
>   
> -		wifi@18000000 {
> +		wifi: wifi@18000000 {
>   			compatible = "mediatek,mt7981-wmac";
>   			reg = <0 0x18000000 0 0x1000000>,
>   			      <0 0x10003000 0 0x1000>,
> 



