Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46433CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 11:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9mieTrT7MiH0/STt7PcCTrEA2xOPPz3H28rzpE9zS8Y=; b=ItrzA4VUd71dirgJc0O+cHCHjs
	z3H/EaVxbMNxSGxHjG029ml/6kW1GmrkHaydID0Qw0kMRrkivweK9Fy5WZCjcgRv/+rVtOfBFCLzL
	hyG5RHX3LSZMXh8chpHLJpg3lZLvOps80ZmEx0wCMLp2erTgUlhhw6KxOmOTMeu3DS0xATigpfVrG
	mTeqEm8WH7U3+1rq7TyfY8YNGgZ9EfwVUwOTi0YSgouf1ut7e/JTKHK6JX3Eqof9HDoudtLaz6K9J
	yQ9fo81SvQcb2maRjq7Hnisr+x4gBJ9TctTu4ofKI/Li0fFVmHqv4NVe+5zo/AxkEj0a8PjrWd9Oy
	zoWAA0Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9MAC-00000004YNI-45no;
	Thu, 16 Oct 2025 11:28:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9MA9-00000004YMU-2PyU;
	Thu, 16 Oct 2025 11:28:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760614131;
	bh=+wVRuiQnZqQTQ83N4gc5pdZaUVwxqdGkvElu0H8WEmQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DRqiCVfGvV57D50LE8su2GRqaZLq3rrABrFVgonzCYXAgI/VwlNkQ/zATG7M7A9p+
	 OfBTDu2enhUjXetbR+bDKGwhTMXFe5LrnNN/lO7lOjrQQEDT09nb5gU6WMmlgliWNE
	 K63Q50Mz2OLlil5SmFgu88kZuUqYKJtCTQKPOoI8qzoC6PHm5b7JIrWsiChKes2yvG
	 VcKcmzDmtRqTsxRAKW4PGntbW2jRn6W7QzKLBNiP3cSDm2Zv6BPI/lV0DuvDP5N09k
	 qRm/xBKDUb7UFXvLgZBdvF4zQ+904CjlQCwmHcZkS8H+QfLJHFXUYy+5QSN4DCY/Gb
	 DjyeePEguMP7w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5184A17E05FE;
	Thu, 16 Oct 2025 13:28:50 +0200 (CEST)
Message-ID: <7333fc2b-bc30-41bf-be09-2b9ff7c3599f@collabora.com>
Date: Thu, 16 Oct 2025 13:28:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/15] arm64: dts: mediatek: mt7981b-openwrt-one: Enable
 leds
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
 <20251016-openwrt-one-network-v1-15-de259719b6f2@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251016-openwrt-one-network-v1-15-de259719b6f2@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_042853_789787_4753EC03 
X-CRM114-Status: GOOD (  12.95  )
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
> The Openwrt One has 3 status leds at the front (red, white, green) as
> well as 2 software controlled leds for the LAN jack (amber, green).
> 
> Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
> ---
>   .../boot/dts/mediatek/mt7981b-openwrt-one.dts      | 57 ++++++++++++++++++++++
>   1 file changed, 57 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
> index 4d1653c336e71..0c0878488ae98 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts
> @@ -43,6 +43,50 @@ reg_5v: regulator-5v {
>   		regulator-boot-on;
>   		regulator-always-on;
>   	};
> +
> +	pwm-leds {

Please keep the nodes ordered by name.

Cheers,
Angelo

> +		compatible = "pwm-leds";
> +
> +		led-0 {
> +			color = <LED_COLOR_ID_WHITE>;
> +			default-brightness = <0>;
> +			function = LED_FUNCTION_STATUS;
> +			max-brightness = <255>;
> +			pwms = <&pwm 0 10000>;
> +		};
> +
> +		led-1 {
> +			color = <LED_COLOR_ID_GREEN>;
> +			default-brightness = <0>;
> +			function = LED_FUNCTION_STATUS;
> +			max-brightness = <255>;
> +			pwms = <&pwm 1 10000>;
> +		};
> +	};
> +
> +	gpio-leds {
> +		compatible = "gpio-leds";
> +
> +		led-0 {
> +			color = <LED_COLOR_ID_RED>;
> +			function = LED_FUNCTION_STATUS;
> +			gpios = <&pio 9 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		led-1 {
> +			color = <LED_COLOR_ID_AMBER>;
> +			function = LED_FUNCTION_LAN;
> +			gpios = <&pio 34 GPIO_ACTIVE_LOW>;
> +			linux,default-trigger = "netdev";
> +		};
> +
> +		led-2 {
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_LAN;
> +			gpios = <&pio 35 GPIO_ACTIVE_LOW>;
> +			linux,default-trigger = "netdev";
> +		};
> +	};
>   };
>   
>   &eth {
> @@ -109,6 +153,13 @@ mux {
>   		};
>   	};
>   
> +	pwm_pins: pwm-pins {
> +		mux {
> +			function = "pwm";
> +			groups = "pwm0_0", "pwm1_1";
> +		};
> +	};
> +
>   	spi2_flash_pins: spi2-pins {
>   		mux {
>   			function = "spi";
> @@ -152,6 +203,12 @@ conf {
>   	};
>   };
>   
> +&pwm {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pwm_pins>;
> +	status = "okay";
> +};
> +
>   &spi2 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&spi2_flash_pins>;
> 



