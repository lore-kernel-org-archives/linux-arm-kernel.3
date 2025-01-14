Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23DFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 10:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EgDVsyR3KbScI6jcSPg7gWlvGaF54deikM4NZlf8tyo=; b=mj85+nDxVrRMMFV7oiowcTRNrC
	gObLWVnxZqhD5quW0GatKEefNxsCLytfgCXg5yKaVfJjMNB6OLCZXd9qtn9tBRfEBxc8n2AkS8Kfw
	VJiFaojwobxAdP5NXU1FTioWGvhwJxbz+2RUHiL0Zng/HokK0OuBPtRGbLoOdXCQ3ZxK49LtfcCQ+
	9caFi0/TDGI1NiVksVm1bto8G3DPXT/Rb9WPGbP3vHGsgtnlKctbwbSCFhJ/9BV6fgVbcxtPJBKn0
	gZy7NjIJU9ZI5+yW5dcfqEe+GYqQh23E2wFO86xVRAOYzw77H0vCYjgaOtx5UXMRWhP5MKxwR+CX1
	exb25e4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeNQ-000000088UB-2FGX;
	Tue, 14 Jan 2025 10:42:28 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeJV-000000087nP-0DX7;
	Tue, 14 Jan 2025 10:38:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736851103;
	bh=B+LNGJoxm+2ZW+2zkFsa63Rt6e6ValKEjmMu+3Ps3uM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bK3YiFMbI4ErOnyOl2Px+n/9/cs5S8qo0bWabVA4U52QgrvPsaNtTIiiZSnhzf6Wa
	 hE+kkN2oepDtoaHq1a+0k4zzG3OyglKrxQXdgKaxNSQC+2XbdRsSvqoKCGKXRbHqk3
	 es/GP4cSpxAY/EZKcVkLzUMv6CiJ993BfXq4zutma0evuapWmsLzjdJv6OAazQYIUk
	 OpYFw+Vdzida0LD3hYbnwV/yLIoDaS3hntF7yv9m84+FTv7D6tTwodIsufLDW42OsW
	 GIgHaV95HysTN62KcVFMIQWGN/sBqDUIBztuDWeACTs0cyDjk9LP2u3Mqb9UxaYNGA
	 ofZ0CtzX/k/2Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C206A17E0239;
	Tue, 14 Jan 2025 11:38:22 +0100 (CET)
Message-ID: <91ac34bf-e184-486d-9af7-f9ddaf8f26ed@collabora.com>
Date: Tue, 14 Jan 2025 11:38:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: add mmc2 support for mt8365-evk
To: Alexandre Mergnat <amergnat@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 macpaul.Lin@mediatek.com
Cc: vsatoes@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250109-mmc2-support-v1-1-9b9d1b1ae35d@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250109-mmc2-support-v1-1-9b9d1b1ae35d@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_023825_258538_2CC11A3C 
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

Il 10/01/25 12:10, Alexandre Mergnat ha scritto:
> Adds support for the MMC2 interface on the MT8365 EVK board.
> It introduces a fixed regulator for the MMC2 VDD33 supply and configures
> the MMC2 node with a 4-bit bus width, high-speed capabilities, UHS
> modes, and appropriate power supplies. Enabled SDIO IRQ, wakeup source,
> and kept power during suspend for wireless chip functionality.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 85 +++++++++++++++++++++++++++++
>   1 file changed, 85 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> index 7d90112a7e27..309dc76322d4 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> @@ -53,6 +53,15 @@ memory@40000000 {
>   		reg = <0 0x40000000 0 0xc0000000>;
>   	};
>   
> +	mmc2_vdd33: mmc2_vdd33-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "mmc2_vdd33";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&pio 121 0>;
> +		enable-active-high;
> +	};
> +
>   	usb_otg_vbus: regulator-0 {
>   		compatible = "regulator-fixed";
>   		regulator-name = "otg_vbus";
> @@ -197,6 +206,28 @@ &mmc1 {
>   	status = "okay";
>   };
>   
> +&mmc2 {
> +	assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL>;
> +	assigned-clocks = <&topckgen CLK_TOP_MSDC50_2_SEL>;
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	cap-sdio-irq;
> +	hs400-ds-delay = <0x12012>;
> +	keep-power-in-suspend;

Why keep-power-in-suspend?

> +	max-frequency = <200000000>;
> +	non-removable;
> +	pinctrl-0 = <&mmc2_default_pins>;
> +	pinctrl-1 = <&mmc2_uhs_pins>;
> +	pinctrl-names = "default", "state_uhs";
> +	sd-uhs-sdr104;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	vmmc-supply = <&mmc2_vdd33>;
> +	vqmmc-supply = <&mt6357_vcn18_reg>;
> +	wakeup-source;
> +	status = "okay";
> +};
> +
>   &mt6357_pmic {
>   	interrupts-extended = <&pio 145 IRQ_TYPE_LEVEL_HIGH>;
>   	interrupt-controller;
> @@ -410,6 +441,60 @@ cmd-dat-pins {
>   		};
>   	};
>   
> +	mmc2_default_pins: mmc2-default-pins {
> +		clk-pins {
> +			pinmux = <MT8365_PIN_81_MSDC2_CLK__FUNC_MSDC2_CLK>;

pinmux is always first, but then:

b ias-pull-....
d rive-strength

Alphabetical order please :-)

Cheers,
Angelo


