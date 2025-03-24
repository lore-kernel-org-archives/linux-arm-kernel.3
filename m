Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2953AC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 14:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFeQSyZl4NfpSlb//kIPLvcrvmIhKlyGWfhzpbK655A=; b=P3hOxVBtkXv6Udsjtv/4/LstwS
	Z9FXAUWFGKR8GlT4wA2gApbhykKWtAL7mCvvQdmeNhyoqtKNIBtgqeMwDOhQGSY9XcACqxfvb2bWq
	zTUL3TfMn+5ogKpiigEYZhBEtQ4/EkZMAGhmdg34O2cZe8V6pGmCzFTwZ7toE4CVz02aQTI90uETa
	vs5KinyL9LomjF+5VdQcq5uhMaUtxcNzImLBgmjqCx/Lou+oJnFASN0XJvZttiYs2eNKYlttRdTNu
	pvgnpvyaKVsdbmy3gCJIl2bhB4q8oawY65aKjeCn9QNDw9u+KwsU8VUY5GOgZlbVu3ITPjw1gf84Z
	2HDxXjTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twiWi-00000003ME9-3aJU;
	Mon, 24 Mar 2025 14:11:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twiUZ-00000003Lxr-0KdZ;
	Mon, 24 Mar 2025 14:09:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742825365;
	bh=zEZSfIN6Fl3MEvV/0zekr5/YFxEumJScw7YduuaZH0w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hGbYObwCSzoMoUuei5KO2c0n1ogWFHwWv6dnJYjUJzp/5l+wPKvHZ2G4z8mlpLgQS
	 gUfa8uFaVqfwsgcb/DCgmYTCWHMDSCFcsbIoAtycwxOvyRJbtwg6omYK4fjg2dtEWq
	 mg2drmy/m3aCanjQGo4c4lTRec86x6pf5sQJLrH3PnnwNVErpkCCk/9MVW84K9AID5
	 W+cNucu8TyZzZv/Suzy1L4icNc+1YxwsNBf1UrfpMmPNnwABHYz3h60UYJ1EYPmtDH
	 au+C3CMjPvV9tI785lT6f3JWQDE4eOk9FMZ7MXQTpRy6tYDyaa+Q0cZwrVsYGVF2zu
	 4L/0gkykc2IYg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AC28F17E088D;
	Mon, 24 Mar 2025 15:09:24 +0100 (CET)
Message-ID: <ecd8a46e-0f87-498e-8a12-fdeae6f5791d@collabora.com>
Date: Mon, 24 Mar 2025 15:09:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2] arm64: dts: mediatek: add mmc2 support for
 mt8365-evk
To: Alexandre Mergnat <amergnat@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 macpaul.Lin@mediatek.com
Cc: vsatoes@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250109-mmc2-support-v2-1-5f660c809610@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250109-mmc2-support-v2-1-5f660c809610@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_070927_295936_3C6CF7A3 
X-CRM114-Status: GOOD (  17.78  )
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

Il 24/03/25 14:54, Alexandre Mergnat ha scritto:
> Adds support for the MMC2 interface on the MT8365 EVK board.
> It introduces a fixed regulator for the MMC2 VDD33 supply and configures
> the MMC2 node with a 4-bit bus width, high-speed capabilities, UHS
> modes, and appropriate power supplies. Enabled SDIO IRQ, wakeup source,
> and kept power during suspend (to save firmware module) for wireless
> chip functionality.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
> Changes in v2:
> - Apply alphabetical order to pinctrl property items.
> - Improve commit message
> - Link to v1: https://lore.kernel.org/r/20250109-mmc2-support-v1-1-9b9d1b1ae35d@baylibre.com
> ---
>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 103 +++++++++++++++++++++++++---
>   1 file changed, 94 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> index 7d90112a7e274..a87f1b3ed6500 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> @@ -53,6 +53,15 @@ memory@40000000 {
>   		reg = <0 0x40000000 0 0xc0000000>;
>   	};
>   
> +	mmc2_vdd33: mmc2_vdd33-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "mmc2_vdd33";

mmc2-vdd33 please

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
> @@ -324,8 +355,8 @@ cmd-dat-pins {
>   				 <MT8365_PIN_94_MSDC0_DAT6__FUNC_MSDC0_DAT6>,
>   				 <MT8365_PIN_93_MSDC0_DAT7__FUNC_MSDC0_DAT7>,
>   				 <MT8365_PIN_98_MSDC0_CMD__FUNC_MSDC0_CMD>;
> -			input-enable;
>   			bias-pull-up;
> +			input-enable;

This is a cleanup and goes to a different commit

>   		};
>   
>   		rst-pins {
> @@ -337,8 +368,8 @@ rst-pins {
>   	mmc0_uhs_pins: mmc0-uhs-pins {
>   		clk-pins {
>   			pinmux = <MT8365_PIN_99_MSDC0_CLK__FUNC_MSDC0_CLK>;
> -			drive-strength = <MTK_DRIVE_10mA>;
>   			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> +			drive-strength = <MTK_DRIVE_10mA>;

While at it, in a cleanup commit, if you could also remove those MTK_DRIVE_xxx and
use just the number that'd be great.

>   		};
>   
>   		cmd-dat-pins {
> @@ -351,21 +382,21 @@ cmd-dat-pins {
>   				 <MT8365_PIN_94_MSDC0_DAT6__FUNC_MSDC0_DAT6>,
>   				 <MT8365_PIN_93_MSDC0_DAT7__FUNC_MSDC0_DAT7>,
>   				 <MT8365_PIN_98_MSDC0_CMD__FUNC_MSDC0_CMD>;
> -			input-enable;
> -			drive-strength = <MTK_DRIVE_10mA>;
>   			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +			drive-strength = <MTK_DRIVE_10mA>;
> +			input-enable;
>   		};
>   
>   		ds-pins {
>   			pinmux = <MT8365_PIN_104_MSDC0_DSL__FUNC_MSDC0_DSL>;
> -			drive-strength = <MTK_DRIVE_10mA>;
>   			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> +			drive-strength = <MTK_DRIVE_10mA>;
>   		};
>   
>   		rst-pins {
>   			pinmux = <MT8365_PIN_97_MSDC0_RSTB__FUNC_MSDC0_RSTB>;
> -			drive-strength = <MTK_DRIVE_10mA>;
>   			bias-pull-up;
> +			drive-strength = <MTK_DRIVE_10mA>;
>   		};
>   	};
>   
> @@ -386,16 +417,16 @@ cmd-dat-pins {
>   				 <MT8365_PIN_91_MSDC1_DAT2__FUNC_MSDC1_DAT2>,
>   				 <MT8365_PIN_92_MSDC1_DAT3__FUNC_MSDC1_DAT3>,
>   				 <MT8365_PIN_87_MSDC1_CMD__FUNC_MSDC1_CMD>;
> -			input-enable;
>   			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +			input-enable;
>   		};
>   	};
>   
>   	mmc1_uhs_pins: mmc1-uhs-pins {
>   		clk-pins {
>   			pinmux = <MT8365_PIN_88_MSDC1_CLK__FUNC_MSDC1_CLK>;
> -			drive-strength = <8>;
>   			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> +			drive-strength = <8>;
>   		};
>   
>   		cmd-dat-pins {
> @@ -404,9 +435,63 @@ cmd-dat-pins {
>   				 <MT8365_PIN_91_MSDC1_DAT2__FUNC_MSDC1_DAT2>,
>   				 <MT8365_PIN_92_MSDC1_DAT3__FUNC_MSDC1_DAT3>,
>   				 <MT8365_PIN_87_MSDC1_CMD__FUNC_MSDC1_CMD>;
> -			input-enable;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
>   			drive-strength = <6>;
> +			input-enable;
> +		};
> +	};
> +
> +	mmc2_default_pins: mmc2-default-pins {
> +		clk-pins {
> +			pinmux = <MT8365_PIN_81_MSDC2_CLK__FUNC_MSDC2_CLK>;
> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> +			drive-strength = <4>;
> +		};
> +
> +		cmd-dat-pins {
> +			pinmux = <MT8365_PIN_82_MSDC2_DAT0__FUNC_MSDC2_DAT0>,
> +				 <MT8365_PIN_83_MSDC2_DAT1__FUNC_MSDC2_DAT1>,
> +				 <MT8365_PIN_84_MSDC2_DAT2__FUNC_MSDC2_DAT2>,
> +				 <MT8365_PIN_85_MSDC2_DAT3__FUNC_MSDC2_DAT3>,
> +				 <MT8365_PIN_80_MSDC2_CMD__FUNC_MSDC2_CMD>;
>   			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +			drive-strength = <4>;
> +			input-enable;
> +		};
> +
> +		sys-en-pins {
> +			pinmux = <MT8365_PIN_120_DMIC1_CLK__FUNC_GPIO120>;

My schematics say that the DMIC1_CLK pin is PERST_N, DMIC_DAT0 is PWR_EN: what's
the intention here?!

In any case, this is not a mmc2 pin, but something else :-)

Cheers,
Angelo


