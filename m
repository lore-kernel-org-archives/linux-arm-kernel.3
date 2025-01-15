Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA28C02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 08:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GR9mz+FgAMLJ4OnOLV7A3sC/xxj/5HtLMQ444x20sbU=; b=kEboz9vrME1EENUHjeeubL+zR4
	OfqgBnPyZr50elBEVMTsiHCJf+wDb5g2GDjBy1fks6/VYBYdUYr2W7UHOn8f15aeehXy1kv4uP2S6
	1H+u1juZQpOVs41/B9SEuPyYRS4RJDRTLMq6nUwr3nooL6ECj2KtvkgxswnrsQ9zUWB1dmF0tzoKG
	TP3RUtneR1dZHT1hO3xCVq2gI5cGGlmOA3LYJ65HoFhcvP6fmKBf5Hor6O0KZXfcrgLUR22HkOC3O
	LvWMwc8j8qkI9sZ7Eq+QxoZb19rNL7bFNm7cjTN4BFFd9PjKRTJbt/9nGE9+IoYQJ73H9fHMc0/l9
	FdR/Vqug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzBI-0000000BBNZ-1VNH;
	Wed, 15 Jan 2025 08:55:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXz7R-0000000BA2t-1A6s;
	Wed, 15 Jan 2025 08:51:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B6D5F5C5B48;
	Wed, 15 Jan 2025 08:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6126AC4CEDF;
	Wed, 15 Jan 2025 08:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736931080;
	bh=GwlvPNaPX/8qtQSzF5HZ0CbwmzU3891kv5TaAZRdsyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rH0sF1vkNx1L3XZR86dN2P0tkIbKx0cq7/VFJWk1hqRrbs+P5kaJmWPQBophzb7t7
	 JNV2Xt3UDsKJ5zkok7ejBI4wME6Bjv2433J6mKbuyYrjv8TV4rcc3TwwR5GLWdICl3
	 QQb0j9PWDphGTXNEwnQ1/ljAToRflqx+4YzOobwDC71fMcYPx0Uc92lcGE7cMHfO7f
	 YKfm+Y3HaMlyIFtPXDJ5flLcG+hEXEz0ZHhgRfRjX8eC3Y5XywINkbjslgncWwFfMs
	 07q81fNT7UrDUBb9jWtPaID6nOIahSdAoe92BDmxVHjCf6jBVuV1rUiwJdoPGSS6QA
	 OkcQ8ZtKBiCpQ==
Date: Wed, 15 Jan 2025 09:51:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, upstream@airoha.com
Subject: Re: [PATCH 1/2] dt-bindings: mmc: mtk-sd: Add eMMC for AN7581
Message-ID: <phnwf7vkincyeua3jhboi5pod7uwkigwc2ibpygrg7gezeh36d@gpx6krsqfbqe>
References: <20250115073026.31552-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250115073026.31552-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_005121_399592_14B78885 
X-CRM114-Status: GOOD (  21.67  )
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

On Wed, Jan 15, 2025 at 08:29:50AM +0100, Christian Marangi wrote:
> Document eMMC compatible for AN7581. This eMMC controller doesn't have
> regulator exposed to the system and have a single clock only for source
> clock and only default pintctrl.
> 
> Rework the schema to permit these new requirements and make supply
> optional only for airoha,an7581-mmc compatible.
> 
> Also provide an example for airoha,an7581-mmc.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
> This depends on patch merged in clk-next 
> bfe257f9780d8f77045a7da6ec959ee0659d2f98
> 
>  .../devicetree/bindings/mmc/mtk-sd.yaml       | 64 +++++++++++++++++--
>  1 file changed, 58 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index f86ebd81f5a5..6dad5455b369 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -27,6 +27,7 @@ properties:
>            - mediatek,mt8183-mmc
>            - mediatek,mt8196-mmc
>            - mediatek,mt8516-mmc
> +          - airoha,an7581-mmc

Please keep things ordered. The list is nicely ordered so far.

>        - items:
>            - const: mediatek,mt7623-mmc
>            - const: mediatek,mt2701-mmc
> @@ -48,11 +49,11 @@ properties:
>    clocks:
>      description:
>        Should contain phandle for the clock feeding the MMC controller.
> -    minItems: 2
> +    minItems: 1
>      maxItems: 7
>  
>    clock-names:
> -    minItems: 2
> +    minItems: 1
>      maxItems: 7
>  
>    interrupts:
> @@ -72,7 +73,7 @@ properties:
>        Should at least contain default and state_uhs. To support SDIO in-band wakeup, dat1 pin
>        will be switched between GPIO mode and SDIO DAT1 mode, state_eint is mandatory in this
>        scenario.
> -    minItems: 2
> +    minItems: 1
>      items:
>        - const: default
>        - const: state_uhs
> @@ -170,9 +171,6 @@ required:
>    - clock-names
>    - pinctrl-names
>    - pinctrl-0
> -  - pinctrl-1
> -  - vmmc-supply
> -  - vqmmc-supply
>  
>  allOf:
>    - $ref: mmc-controller.yaml#
> @@ -335,6 +333,40 @@ allOf:
>              - const: axi_cg
>              - const: ahb_cg
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: airoha,an7581-mmc
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: source clock
> +
> +        clock-names:
> +          items:
> +            - const: source
> +
> +        pinctrl-names:
> +          items:
> +            - const: default
> +    else:

No else, you are now duplicating other "if:then" cases. There is already
such for "reg" so it does not really make it more readable. Just be sure
each variant has a strict, upper and lower, constraints.


> +      properties:
> +        clocks:
> +          minItems: 2
> +
> +        clock-names:
> +          minItems: 2
> +
> +        pinctrl-names:
> +          minItems: 2
> +
> +      required:
> +        - pinctrl-1
> +        - vmmc-supply
> +        - vqmmc-supply

These should go to each variant's if:then: or separate if:then: covering
all existing variants for the required fields.

> +
>  unevaluatedProperties: false
>  
>  examples:
> @@ -389,5 +421,25 @@ examples:
>          vqmmc-supply = <&mt6397_vgp3_reg>;
>          mmc-pwrseq = <&wifi_pwrseq>;
>      };
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/en7523-clk.h>
> +    mmc@1fa0e000 {
> +        compatible = "airoha,an7581-mmc";
> +        reg = <0x1fa0e000 0x1000>,
> +              <0x1fa0c000 0x60>;
> +        clocks = <&scuclk EN7581_CLK_EMMC>;
> +        clock-names = "source";
> +        interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&mmc_pins>;
> +        bus-width = <4>;
> +        max-frequency = <52000000>;
> +        disable-wp;
> +        cap-mmc-highspeed;
> +        non-removable;
> +

Drop blank line.


Best regards,
Krzysztof


