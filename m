Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444A4C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 08:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EEaIv+Hi76rasf64bdQJwGs7atfBV9pno+CUMgL0TfY=; b=NP7R2Z98NlzTSHSHriQi5ySUor
	KhYNmhw97DFqZAwzWfd4Ny25CPq70mbR0P/rqdeXGYPDlF+bHx5a2GSEx8DwmPscupRJtEBYQ0wrj
	JQ9Vc6t0sjpABSbYNYaO+0nDMCHr2oRCNGpr6r6OskEBo/Mmk0jduoE+/ophQj+U9XQQoMxnXqH/i
	B39iaw4FDB/9KL90R83M3a/Pz+uARmfKkM9OPJU2hjNRijibT50Mo3ZBTP9YHgwEzpndhC55vAiBh
	lKbPAYgt8b751SAyvoOsJxmCp9J+gl3kuVXx4XMtatYND7KRV/p9st2KG7PQmhe7jt0q7rdvH9VW5
	YM18/IRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2n2O-00000009hFI-0szQ;
	Thu, 10 Apr 2025 08:13:28 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mXH-00000009bYG-0hkH;
	Thu, 10 Apr 2025 07:41:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744270877;
	bh=T0rl6mtqXz5LmV5LLiBAssGxQHXvEWWXL3EDzwmnWEk=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=aot9COSTnnKvgbGAq80PH5OkL2BX7fTgqBgoPPT/KOmtsS0JQ3I5AnxJ2kkahytDZ
	 RMauBQEs4WXQ/fG7+K7cGkem33n5Afdt7mMk2Z3tQBcxJdlFLLdbTUO5xgN1I85hyL
	 AIUiTLipV5O01P4BySbn1VtLc+LOJFa+/qrPh/OkaN3DE5U5Y6ySrwh5nM3/4QHcR7
	 al3BIoEy24HMwNHPcIYwwHGTTMZsVpVWxlPq8HYjOi+LycGoj+BuWGykl3AB3Haem0
	 jt6Om8U14QSdNDNd9ADCaxME29oX/M67NRdEOcbR6F4FvC1LUKphUd1T86EmUifUX3
	 /XxVPg5vq0Z6Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C03ED17E0904;
	Thu, 10 Apr 2025 09:41:16 +0200 (CEST)
Message-ID: <58b3bbe7-c036-45c6-b6e9-e2fc150a9256@collabora.com>
Date: Thu, 10 Apr 2025 09:41:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: mediatek: Correct indentation
 and style in DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Andy Teng <andy.teng@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250324125105.81774-1-krzysztof.kozlowski@linaro.org>
 <20250324125105.81774-2-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250324125105.81774-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_004119_372977_48221AD2 
X-CRM114-Status: GOOD (  14.32  )
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

Il 24/03/25 13:51, Krzysztof Kozlowski ha scritto:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../pinctrl/mediatek,mt65xx-pinctrl.yaml      | 83 +++++++------------
>   .../pinctrl/mediatek,mt7622-pinctrl.yaml      | 48 +++++------
>   .../pinctrl/mediatek,mt8183-pinctrl.yaml      | 68 +++++++--------
>   .../pinctrl/mediatek,mt8192-pinctrl.yaml      | 76 ++++++++---------
>   4 files changed, 127 insertions(+), 148 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> index 5f2808212f39..b9680b896f12 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> @@ -137,64 +137,43 @@ examples:
>           #size-cells = <2>;
>   
>           pinctrl@1c20800 {
> -          compatible = "mediatek,mt8135-pinctrl";
> -          reg = <0 0x1000B000 0 0x1000>;
> -          mediatek,pctl-regmap = <&syscfg_pctl_a>, <&syscfg_pctl_b>;
> -          gpio-controller;
> -          #gpio-cells = <2>;
> -          interrupt-controller;
> -          #interrupt-cells = <2>;
> -          interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
> -              <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> -              <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
> +            compatible = "mediatek,mt8135-pinctrl";
> +            reg = <0 0x1000B000 0 0x1000>;
> +            mediatek,pctl-regmap = <&syscfg_pctl_a>, <&syscfg_pctl_b>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
> +            interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
>   
> -          i2c0_pins_a: i2c0-pins {
> -            pins1 {
> -              pinmux = <MT8135_PIN_100_SDA0__FUNC_SDA0>,
> -                <MT8135_PIN_101_SCL0__FUNC_SCL0>;
> -              bias-disable;
> -            };
> -          };
> -
> -          i2c1_pins_a: i2c1-pins {
> -            pins {
> -              pinmux = <MT8135_PIN_195_SDA1__FUNC_SDA1>,
> -                <MT8135_PIN_196_SCL1__FUNC_SCL1>;
> -              bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> -            };
> -          };
> -
> -          i2c2_pins_a: i2c2-pins {
> -            pins1 {
> -              pinmux = <MT8135_PIN_193_SDA2__FUNC_SDA2>;
> -              bias-pull-down;
> +            i2c0_pins_a: i2c0-pins {

Agreeing with Rob - if you can please also remove the labels while at it,
that'd be great, but regardless of that...

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



