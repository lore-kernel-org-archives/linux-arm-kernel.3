Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00ACC36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 20:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7QP+eYqdEw5ZqsTPzeRcWfs0jUCXEWKFFVGkcN3guI=; b=4559lxbgFMjJ3O3PA8kouHi6xK
	0bqCvZT/Imuy3oPUOJDxEPQyWORRWGufAJAhB8ehcUK4f+lFlJwDT5xwSYuWv9AVdAIkQgY8AbcP6
	o+5U4sYSdtB5VuG3mj7EZzMgkSWsh6bW00LvZ6445IrkaOAibfxEVckQeOdTNwCOJgUPq7HmO8it1
	ZMZs+WXtGWABIFBP/iP32lCOhfvz4W2CDWbiXOKjFXu3VZsaTzmlDOXo89yjaDnzdGzPJqFDJ9DNe
	/Ma+7s1eEXY+BEGvil3G4k7aqYBuxNu44jME0Q23Fr45XxT3wkMl+sa+RxGfpUnWRYHkyIYRvJ3d3
	Op6ppsOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twobe-00000004DXM-0n3E;
	Mon, 24 Mar 2025 20:41:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twoK6-00000004BBm-36g9;
	Mon, 24 Mar 2025 20:23:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 113865C4AE2;
	Mon, 24 Mar 2025 20:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83861C4CEDD;
	Mon, 24 Mar 2025 20:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742847781;
	bh=ncQqNWoVKSEqFbwPcK2In9RG6rSS6r5IytFyAcwNeig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ejdlva0sboLce56+dojF4alyQ3vY8mOJn8F6yLgWJGTF/CcudDO3RVMp5mP75rcD6
	 G+1clGY+geRG3CDgrjFOYaVkzKpT6q2xh0KqWSoxKUTlA4Z60ejkSttvQY2qO/XCHL
	 3aUG4WA/EhAHgNf1nogUFmWyg3lM3I8Zh8RH8zeZvk9LL9XyjdEySvVApXpSCuLx/0
	 LhwcrKg1+0TGmeqr33zDUDpZ6CQR1iV0P+ehOebOOT9s4tiIvuTr2BBdwXQAMzbV2w
	 1tTXf/bbdgfmjKRdn2o82+/D4wI3opV0ARajLgWq0jZORADZkDDcG9Qm6puTtvM1p3
	 bRimxV8JuiCsw==
Date: Mon, 24 Mar 2025 15:23:00 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Teng <andy.teng@mediatek.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: mediatek: Correct indentation
 and style in DTS example
Message-ID: <20250324202300.GA804681-robh@kernel.org>
References: <20250324125105.81774-1-krzysztof.kozlowski@linaro.org>
 <20250324125105.81774-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324125105.81774-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_132302_887509_BA04CB42 
X-CRM114-Status: GOOD (  16.03  )
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

On Mon, Mar 24, 2025 at 01:51:05PM +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../pinctrl/mediatek,mt65xx-pinctrl.yaml      | 83 +++++++------------
>  .../pinctrl/mediatek,mt7622-pinctrl.yaml      | 48 +++++------
>  .../pinctrl/mediatek,mt8183-pinctrl.yaml      | 68 +++++++--------
>  .../pinctrl/mediatek,mt8192-pinctrl.yaml      | 76 ++++++++---------
>  4 files changed, 127 insertions(+), 148 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> index 5f2808212f39..b9680b896f12 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> @@ -137,64 +137,43 @@ examples:
>          #size-cells = <2>;
>  
>          pinctrl@1c20800 {
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

Perhaps drop the unused labels while you are here. Either way,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


