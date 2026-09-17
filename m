Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65FAC982D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 18:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/HZTASVkqKaji0QyjTNpQOcpYSX+5MHinbb2iPHtgk=; b=nobbFY5bDSRju1CR27fR0kOZSz
	+4U9eS2LUxysB2q6lf9GdK1SQfrTHm0wDtzx3c1FD6Lml91LdivPfpQCmfjrtmn5XRde7izPbj1MY
	wtj0PklwvIqGdBtNH4hw3qkR2uQ1QSeCO9fwql9LcB2NZiZcet45uWnmi0srv92IPwN44Wp2vlQk9
	R0gu8Z35IL7oC8fc7TDBY6UNyzjMSx3/Zt67CRny+nAIRbv2A8YzBeH1WLZFCd2qk0cwzE5ETZgpO
	QO7S/5bzjlPN7TducZO/2tUAxtltwtrqIQqdhKHvKQ82UBIXhzD0WmSWfkPe1U0jZztvsceFGFxsN
	s1JGSBJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7H08-0000000CFPn-2Jax;
	Thu, 17 Sep 2026 18:38:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7H02-0000000CFJZ-19oo;
	Thu, 17 Sep 2026 18:38:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B44643E24;
	Thu, 17 Sep 2026 18:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D2E31F000FF;
	Thu, 17 Sep 2026 18:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789670301;
	bh=7/HZTASVkqKaji0QyjTNpQOcpYSX+5MHinbb2iPHtgk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DzUy4DNsPs6KVxt3KwqIt7hsBJPGJfY5+jH/P+/NawPmKCuwHebVhj5iWmcMGZab0
	 ivWn04rnlTtaofhzwCPdSwq0X6GdxAydr7CYNce8WNGUsE5uYRw712OW7NVlP+nyqt
	 y+VISEl3gdx6iVV3h3pAG3y/kUgYM6UZex7J3xOwH7CS45MpkR238mqmq7cbCGQhAC
	 hHvYz0hVDC0FiObk0dp3wjKiJkIMqZAvKHmY2T2uz+AyucMQGh++gjX3Axmhzm0v0M
	 IbJu6pq1XWBIVbMX9pzHBNlM84TCf2lOZhIFGYwB1I6vB/2rGzD3h0E2OdqJ0RvXDy
	 N6T9w5dr/lBpw==
Subject: Re: [PATCH net-next v6 08/11] dt-bindings: net: rockchip-dwmac:
 document pcs-handle
From: netdev-bot+sashiko@kernel.org
To: coiaprant@gmail.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, vkoul@kernel.org,
 maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 romain.gantois@bootlin.com, hkallweit1@gmail.com, neil.armstrong@linaro.org,
 linux@armlinux.org.uk, shawn.lin@rock-chips.com, david@ixit.cz,
 netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org
Date: Thu, 17 Sep 2026 18:38:20 +0000
Message-ID: <178967030009.22033.606150817628079939@kernel.org>
In-Reply-To: <20260915123802.1561724-9-coiaprant@gmail.com>
References: <20260915123802.1561724-9-coiaprant@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 0 · Low: 2

- [Low] Commit message describes code that does not exist at this commit:
  the message states the Rockchip dwmac glue "now supports SGMII on…
- [Low] The new `allOf` conditional in
  Documentation/devicetree/bindings/net/rockchip-dwmac.yaml keys only on…

--

dt-bindings: net: rockchip-dwmac: document pcs-handle

This adds a pcs-handle property to the Rockchip GMAC binding and a new
allOf conditional making it required whenever phy-mode is "sgmii".  Two
observations below, one about the commit message wording and one about
the scope of the new conditional.

>     The Rockchip dwmac glue driver now supports SGMII on RK3568 and
>     requires a PCS, referenced through the "pcs-handle" property.  The
>     property is parsed by rk_pcs_init() and a missing phandle fails the
>     probe, so describe it in the binding and require it when phy-mode
>     is "sgmii".

[Severity: Low]
This isn't a bug, but the wording is in the past tense for code that is not
present yet at this commit.  At fc2e19066d08,
drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c has no rk_pcs_init(), no
"pcs-handle" parsing, and no pcs_init/pcs_exit/select_pcs callbacks or
SGMII support.

Checking the end of the series, those all arrive in the following patch
("net: stmmac: dwmac-rk: add SGMII support for RK3568"), which adds
rk_pcs_init() with:

	pcs_node = of_parse_phandle(np, "pcs-handle", 0);
	if (!pcs_node)
		return -ENODEV;

and installs the callbacks in rk_gmac_probe() for
PHY_INTERFACE_MODE_SGMII.

Putting the binding before the driver is the usual convention, so would it
be worth rewording to say the property will be parsed by rk_pcs_init() in
the following patch, rather than that it already is?

> diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> index 80c252845349c..67b21ea77ec96 100644
> --- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> @@ -120,6 +120,12 @@ properties:
>      maximum: 0x7F
>      default: 0x10
>  
> +  pcs-handle:
> +    description:
> +      Specifies a reference to a node representing the PCS device
> +      connected to this GMAC. Required when phy-mode is "sgmii".
> +    maxItems: 1
> +
>  phy-supply:
>      description: PHY regulator
>  
> @@ -159,6 +165,15 @@ allOf:
>          clocks:
>            minItems: 5
>  
> +  - if:
> +      properties:
> +        phy-mode:
> +          contains:
> +            const: sgmii
> +    then:
> +      required:
> +        - pcs-handle
> +

[Severity: Low]
Should this conditional also key on compatible?  As written it keys only on
phy-mode, so required: [pcs-handle] applies to all sixteen compatibles this
schema selects (px30, rk3128, rk3228, rk3288, rk3308, rk3328, rk3366,
rk3368, rk3399, rk3506, rk3528, rk3568, rk3576, rk3588, rv1108, rv1126).

At the end of the series only rk3568_ops provides .set_to_sgmii, and
dwmac-rk.c derives the capability from it:

	bsp_priv->supports_sgmii = ops->supports_sgmii || !!ops->set_to_sgmii;

so the PCS requirement looks specific to rockchip,rk3568-gmac.

The reverse direction is open too: pcs-handle is added unconditionally, so a
GMAC node on a Rockchip SoC with no XPCS can carry a pcs-handle and still
pass dt_binding_check.  The rest of this file already gates SoC-specific
constraints on compatible with a negative else branch, for example:

  - if:
      properties:
        compatible:
          contains:
            enum:
              - rockchip,rk3576-gmac
              - rockchip,rk3588-gmac
    then:
      required:
        - rockchip,php-grf
    else:
      properties:
        rockchip,php-grf: false

Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml uses
"pcs-handle: false" in the else branch for the same purpose.  Would nesting
the new block under a check for rockchip,rk3568-gmac, plus
"pcs-handle: false" for the variants without a PCS, describe the hardware
more accurately?

No in-tree DT is affected today: the only Rockchip GMAC node with
phy-mode = "sgmii" is in rk3568-photonicat.dts, and it already provides
pcs-handle = <&xpcs_mii0>.

>  unevaluatedProperties: false
>  
>  examples:

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260915123802.1561724-1-coiaprant%40gmail.com

