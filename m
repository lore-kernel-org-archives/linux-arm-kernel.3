Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9126C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 10:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F+U7vmV8lPrZhXZu0Mj6v6AYC0mK3xFRoMhztnGlA1I=; b=gaMHNFuXA+KG9ev5zC6KRr7Trd
	oIc8VCPvUhhaHNqyVhdqxK6kI2Is7Qu+7IUMf6fZVhVgbvTsPCCmqEuEKW+J4G6I/PYNWPnrf22Tj
	8gw9YRVOfDAhH4A0Lb4c5liOUsV63+klXj/hB+YRuvkJAlDxvIgTBTEyX/+vmfaqlIudrTeqmqryi
	T31il8glIwaewTq7JVOClaUisUExuRGUS0hrwhwx0A6o12V8RN7SKyUKjiVeSf4VGeI7eG0LEhX+f
	kAdDcDHjwc3nib43q6QoPtOejrd8tyEaq8HgS7J+rCRzZTmzv5VhcFPWbIEglIgKMXZlHxOn8ZNuh
	vqDc1c4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Mjr-0000000Cg2t-0y5r;
	Thu, 17 Apr 2025 10:44:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5MML-0000000CcKz-1WoS;
	Thu, 17 Apr 2025 10:20:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744885239;
	bh=WRnhoRkIr70U1V8oy6PCzLc05NirL3E4r0jVZ3vL3ZM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D4GS+0CN41JAGoWTB4z+qdgFS1J5ek6hhXvb5S8KRKYFOQj1yahubH3wsDCLJ1wtR
	 JKJCZwngb5wYd/lI6QD1p817VdOEUHTqBCocrUZrGkQvI8sWoZSlN37X4Llo91j8Kd
	 x5t9MAVVIJD67tWeV2s6NOMH/P34i2PeUIcvPPeg8YOBnAK3EmtNCvvuMkW3Btx6r1
	 RtdTxF8l79BAzuhbgP4FRJ6H/Mq2IPI7uBTverDeoZkLu244boW1KASMG9Q0sMNqED
	 ts5NL0t7tm0CGWcSEPKH4d2JyBxreA4VspdG3i/3aG/X3vmv33jbFfk20luPzbe/ko
	 /UYWE7qD9ohTA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B622917E0C4F;
	Thu, 17 Apr 2025 12:20:38 +0200 (CEST)
Message-ID: <a87a22b3-b263-4044-ab89-54c805fcc82a@collabora.com>
Date: Thu, 17 Apr 2025 12:20:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] mt8395-radxa-nio-12l: Add sound node for headphone
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20250417-mt8395-audio-sof-v1-0-30587426e5dd@collabora.com>
 <20250417-mt8395-audio-sof-v1-6-30587426e5dd@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250417-mt8395-audio-sof-v1-6-30587426e5dd@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_032041_581903_11171068 
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

Il 17/04/25 10:44, Julien Massot ha scritto:
> - Add memory-region based on mt8390-genio-common
> - Enable adsp node
> - Enable afe node
> - Declare the required pins
> - Add sound node for headphone output routing
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Please stick with the usual prefixes.

arm64: dts: mediatek: mt8395-nio-12l: Enable Audio DSP and sound card

Also, the commit description should not be a list of things, but rather
something that explains what you're doing fluently.

"Add a memory region for xyz, enable the Audio DSP and AFE nodes and
assign them to the newly enabled sound card node along with the required
pin configuration to achieve sound output to the 3.5mm headphone jack
found on this board."

Reword to your liking, that was just an example.

Cheers,
Angelo

> ---
>   .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 58 +++++++++++++++++++++-
>   1 file changed, 56 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> index f2eb1b683eb76f783f5a13f28a78f6e33238b5f0..329c60cc6a6be0b4be8c0b8bb033b32d35302804 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> @@ -139,9 +139,21 @@ bl31_secmon_mem: memory@54600000 {
>   			no-map;
>   		};
>   
> -		afe_mem: memory@60000000 {
> +		adsp_mem: memory@60000000 {
>   			compatible = "shared-dma-pool";
> -			reg = <0 0x60000000 0 0x1100000>;
> +			reg = <0 0x60000000 0 0xf00000>;
> +			no-map;
> +		};
> +
> +		afe_dma_mem: memory@60f00000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x60f00000 0 0x100000>;
> +			no-map;
> +		};
> +
> +		adsp_dma_mem: memory@61000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x61000000 0 0x100000>;
>   			no-map;
>   		};
>   
> @@ -152,6 +164,16 @@ apu_mem: memory@62000000 {
>   	};
>   };
>   
> +&adsp {
> +	memory-region = <&adsp_dma_mem>, <&adsp_mem>;
> +	status = "okay";
> +};
> +
> +&afe {
> +	memory-region = <&afe_dma_mem>;
> +	status = "okay";
> +};
> +
>   &cpu0 {
>   	cpu-supply = <&mt6359_vcore_buck_reg>;
>   };
> @@ -514,6 +536,18 @@ &mt6359_vsram_others_ldo_reg {
>   &pio {
>   	mediatek,rsel-resistance-in-si-unit;
>   
> +	audio_default_pins: audio-default-pins {
> +		pins-cmd-dat {
> +			pinmux = <PINMUX_GPIO70__FUNC_AUD_SYNC_MOSI>,
> +				 <PINMUX_GPIO69__FUNC_AUD_CLK_MOSI>,
> +				 <PINMUX_GPIO71__FUNC_AUD_DAT_MOSI0>,
> +				 <PINMUX_GPIO72__FUNC_AUD_DAT_MOSI1>,
> +				 <PINMUX_GPIO73__FUNC_AUD_DAT_MISO0>,
> +				 <PINMUX_GPIO74__FUNC_AUD_DAT_MISO1>,
> +				 <PINMUX_GPIO75__FUNC_AUD_DAT_MISO2>;
> +		};
> +	};
> +
>   	dsi0_backlight_pins: dsi0-backlight-pins {
>   		pins-backlight-en {
>   			pinmux = <PINMUX_GPIO107__FUNC_GPIO107>;
> @@ -854,6 +888,26 @@ &scp {
>   	status = "okay";
>   };
>   
> +&sound {
> +	compatible = "mediatek,mt8195_mt6359";
> +	model = "mt8395-evk";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&audio_default_pins>;
> +	audio-routing =
> +		"Headphone", "Headphone L",
> +		"Headphone", "Headphone R";
> +	mediatek,adsp = <&adsp>;
> +	status = "okay";
> +
> +	headphone-dai-link {
> +		link-name = "DL_SRC_BE";
> +
> +		codec {
> +			sound-dai = <&pmic 0>;
> +		};
> +	};
> +};
> +
>   &spi1 {
>   	/* Exposed at 40 pin connector */
>   	pinctrl-0 = <&spi1_pins>;
> 



