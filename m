Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC7DC531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 16:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDRKfVv1qWyvVa1COFLzJ7BEn2acoJlNWoIveDyamYA=; b=SNzA4PFgMw+yTGpnhwzbu3qzj8
	DvHA7QDo4YbHBlGadIXO4Eg7p3CMOH6tVI9N5PzaJQefdS9p3uaNc2oS+CWwgBH9rvosgwkq88Cf0
	XIyUYu8X9toiUkSy7cmwwkiUQ3SpeRQ4OgH+Q0kPlh4wc7YsKBpHeVFzV01uR+BBS5f4JYcDI/r5t
	hn7z+xfORjS12wEy1h3ry7prkPkay76zPmPocyZ8kXZJc0+SOqVdC8+s5m9Kyisl3q1la6lmCUAVo
	j0qnvDAi2jx2tvTR3hYDT/L/dUcJamkSg8Rf/K1kYe5Fzp2VTsqnijqUOxmqEEZX5O9TZoPcJ3JvW
	IAZW6kbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmvrB-0000000EfbX-34L4;
	Thu, 23 Jul 2026 16:01:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmvrA-0000000Efb1-1olf;
	Thu, 23 Jul 2026 16:01:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D84264037F;
	Thu, 23 Jul 2026 16:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F0A21F000E9;
	Thu, 23 Jul 2026 16:01:04 +0000 (UTC)
Date: Thu, 23 Jul 2026 17:00:59 +0100
From: Lee Jones <lee@kernel.org>
To: rva333@protonmail.com
Cc: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Andy Shevchenko <andy@kernel.org>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ben Grisdale <bengris32@protonmail.ch>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mfd: mediatek: mt6397: add mt6323
 PMIC EFUSE
Message-ID: <20260723160059.GB3526803@google.com>
References: <20260713-mt6323-nvmem-v3-0-205c39267a24@protonmail.com>
 <20260713-mt6323-nvmem-v3-1-205c39267a24@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713-mt6323-nvmem-v3-1-205c39267a24@protonmail.com>
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

On Mon, 13 Jul 2026, Roman Vivchar via B4 Relay wrote:

> From: Roman Vivchar <rva333@protonmail.com>
> 
> The MediaTek mt6323 PMIC includes an EFUSE used for storing calibration
> data.
> 
> Add the devicetree binding documentation for the MediaTek mt6323 EFUSE.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>  .../devicetree/bindings/mfd/mediatek,mt6397.yaml    | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> index 3cbc0dc12c31..d2de227ae7a6 100644
> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> @@ -159,6 +159,23 @@ properties:
>      required:
>        - compatible
>  
> +  efuse:
> +    type: object
> +    unevaluatedProperties: false
> +    description:
> +      The efuse is responsible for storing calibration data, such as thermal
> +      sensor calibration.
> +
> +    properties:
> +      compatible:
> +        const: mediatek,mt6323-efuse
> +
> +      nvmem-layout:
> +        $ref: /schemas/nvmem/layouts/nvmem-layout.yaml#
> +
> +    required:
> +      - compatible
> +
>    leds:
>      type: object
>      additionalProperties: false
> @@ -307,6 +324,10 @@ examples:
>          interrupt-controller;
>          #interrupt-cells = <2>;
>  
> +        efuse {
> +          compatible = "mediatek,mt6323-efuse";

Nit: This tabbing looks off to me.

The example below uses 4-spaces, this uses 2.

> +        };
> +
>          leds {
>              compatible = "mediatek,mt6323-led";
>              #address-cells = <1>;
> 
> -- 
> 2.54.0
> 
> 

-- 
Lee Jones

