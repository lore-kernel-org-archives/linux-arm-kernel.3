Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F5DC9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 08:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9JXzLiGWrc0ZvP4dkaspzOQkbHcGxUbgkFcHqpN3P5g=; b=AzFu3ff+uGSLNtLCmCewH1V2oW
	KY4c6reYBL2fEjTsoD3llzWxKQKPKi9plFCLHAwuIHkuVVkTpRbgUBuhxD7fCcsfg7/RQCaTu49P7
	hR4h8VYUTMXB6sq7kF1B47Kg5QnvYOy+cGDGBG48xllhLi6ieHxn79yXh3839XV1hMYlv1D3/td6e
	ejncXFZL0Ts8uipYssDUsnI/3h0sP4OwqD+RxQi01/KPCR01c0LI3X+xn4liK2sj91Zptd53ik6pb
	ywRPgKOCPGTOkJQFJVtdNF8aaR2nEhXAJTyIBrZtjZf2rpZUIzH0+a3oXgfOVZcttpF6qv5hBA0cW
	1xul7Qjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6Ks-000000000Bc-2CBJ;
	Mon, 28 Sep 2026 08:03:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6Kr-000000000BB-0Drj;
	Mon, 28 Sep 2026 08:03:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7625541986;
	Mon, 28 Sep 2026 08:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28BBB1F000FF;
	Mon, 28 Sep 2026 08:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790582620;
	bh=9JXzLiGWrc0ZvP4dkaspzOQkbHcGxUbgkFcHqpN3P5g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fSiiO4zMb6Cnyw7M0Eogzh+70yORIy0JvRrrAKzkLMS9bLL2URV20ljgLZWW+9Xw0
	 6D7Y/9dtojnI6MITmOfKa2hAYy460BcFH/tcqbNcmUmaw3/ocnCfJg65sFBAq0V5E+
	 SyXh3JfneqT3SldJUJqErEDXFRwamAYGVYg7Qs3I3JpzMzm+SUZVsei2eJd4dLE4Pw
	 Jaox6HR/fqtj5JGF43cmKGOuT4M0cOv7Fp0PJk2ILgyJjkM6nQqhIYifBf5tO5RUt3
	 96BE1W4sqCZqGGhQ5wXj1Ijw5MWwOSXXKR37Jxt40liY3eMQmJlA2YztFUp78eUC+7
	 QUAyJ0KIm5e9Q==
Subject: Re: [PATCH net-next v2 1/7] dt-bindings: net: mediatek-dwmac: add
 support for MT8189 SoC
From: netdev-bot+sashiko@kernel.org
To: louisalexis.eyraud@collabora.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, richardcochran@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, biao.huang@mediatek.com,
 maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, kernel@collabora.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Mon, 28 Sep 2026 08:03:38 +0000
Message-ID: <179058261870.3145.1804834157018403758@kernel.org>
In-Reply-To: <20260924-dwmac-mediatek-mt8189-v2-1-430bd74d5ef9@collabora.com>
References: <20260924-dwmac-mediatek-mt8189-v2-1-430bd74d5ef9@collabora.com>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The MT8189 binding lets a DT pass validation even though the
  driver cannot probe it.
- [Low] The patch restructures how the existing mt2712/mt8188/mt8195
  compatibles are validated, but the commit message only mentions adding…
- [Low] Not confirmed (resolved later in the series).

Pre-existing issues:
- [Low] This problem wasn't introduced by this patch, but the
  `mediatek,tx-delay-ps`/`mediatek,rx-delay-ps` descriptions still say…

--

dt-bindings: net: mediatek-dwmac: add support for MT8189 SoC

This adds the mediatek,mt8189-gmac compatible to the MediaTek DWMAC
binding with a two-entry clock list (mac_main, ptp_ref). It also documents
the MT8189 RX/TX delay stage divider of 180 ps. The existing clock
definitions are moved into per-compatible allOf if:then blocks.

> diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> index 3aab21b8e8de..6624dff015f0 100644
> --- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml

[ ... ]

> @@ -36,6 +34,7 @@ properties:
>            - const: snps,dwmac-4.20a
>        - items:
>            - enum:
> +              - mediatek,mt8189-gmac
>                - mediatek,mt8195-gmac
>            - const: snps,dwmac-5.10a

[Severity: Low]
At this commit, mediatek,mt8189-gmac has no driver match. Neither of the
existing variants fits its 180 ps stage divider or its two-clock set.

This is resolved later in the series. "net: stmmac: mediatek: add support
for MT8189 SoC" adds:

	{ .compatible = "mediatek,mt8189-gmac",
	  .data = &mt8189_gmac_variant },

to mediatek_dwmac_match[]. That variant uses mac_main/ptp_ref and
MT8189_DLY_*_STAGE_DIV = 180, which matches this binding. So this is only
the normal binding-first ordering of a series.

[ ... ]

> @@ -44,26 +43,6 @@ properties:
>            - const: mediatek,mt8195-gmac
>            - const: snps,dwmac-5.10a
>  
> -  clocks:
> -    minItems: 5
> -    items:
> -      - description: AXI clock
> -      - description: APB clock
> -      - description: MAC Main clock
> -      - description: PTP clock
> -      - description: RMII reference clock provided by MAC
> -      - description: MAC clock gate
> -
> -  clock-names:
> -    minItems: 5
> -    items:
> -      - const: axi
> -      - const: apb
> -      - const: mac_main
> -      - const: ptp_ref
> -      - const: rmii_internal
> -      - const: mac_cg
> -
>    interrupts:
>      maxItems: 1

[Severity: Low]
This moves the existing clocks and clock-names definitions for mt2712,
mt8188 and mt8195 out of the top-level properties and into an allOf
if:then block. It also moves the snps,dwmac.yaml $ref to after required.

The commit message only talks about adding MT8189. Could it also describe
this restructuring?

Documentation/devicetree/bindings/writing-schema.rst also says:

  In top level 'properties' define the property with the broadest
  constraints. In 'if:then:' blocks, further narrow the constraints for
  those properties. Do not define the properties within an 'if:then:'
  block

Would it fit that convention better to keep clocks and clock-names at the
top level with the widest limits (for example minItems: 2, maxItems: 6),
and only narrow them per compatible in the if:then branches?

> @@ -86,8 +65,10 @@ properties:
>        or will round down. Range 0~31*170.
>        For MT2712 RMII/MII interface, Allowed value need to be a multiple of 550,
>        or will round down. Range 0~31*550.
> -      For MT8188/MT8195 RGMII/RMII/MII interface, Allowed value need to be a multiple of 290,
> -      or will round down. Range 0~31*290.
> +      For MT8188/MT8195 RGMII/RMII/MII interface, Allowed value need to be a
> +      multiple of 290, or will round down. Range 0~31*290.
> +      For MT8189 RGMII/RMII/MII interface, Allowed value need to
> +      be a multiple of 180, or will round down. Range 0~31*180.

[Severity: Low]
This is a pre-existing issue, not something this patch introduced. The
mediatek,tx-delay-ps and mediatek,rx-delay-ps descriptions still start
with:

      The internal TX clock delay (provided by this driver) in nanoseconds.

The property names use picoseconds, and so does the driver (for example
"Invalid TX clock delay: %dps"). Should this say picoseconds?

The MT2712 range handling has a similar pre-existing problem.
mt2712_gmac_variant uses tx_delay_max/rx_delay_max = 17600 for every
phy-mode. As a result, an RGMII value above the documented 31*170 still
passes the check in mediatek_dwmac_config_dt():

	if (tx_delay_ps < plat->variant->tx_delay_max) {
		mac_delay->tx_delay = tx_delay_ps;

mt2712_delay_ps2stage() then divides by 170, and FIELD_PREP silently
truncates the result into the 5-bit ETH_DLY_*_STAGES field. Is that
intended?

[ ... ]

> @@ -147,6 +130,56 @@ required:
>    - phy-mode
>    - mediatek,pericfg
>  
> +allOf:
> +  - $ref: snps,dwmac.yaml#

[ ... ]

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8189-gmac
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: MAC Main clock
> +            - description: PTP clock
> +
> +        clock-names:
> +          items:
> +            - const: mac_main
> +            - const: ptp_ref

[Severity: Medium]
With this branch, an mt8189 node can only list mac_main and ptp_ref, so
there is no way to provide rmii_internal.

However, mediatek,rmii-clk-from-mac is still allowed at the top level for
every compatible, and nothing here sets it to false for mt8189. The
updated delay text also says MT8189 supports RMII.

Consider an mt8189 node with phy-mode = "rmii" and
mediatek,rmii-clk-from-mac. It passes dt_binding_check. With the driver
change later in this series ("net: stmmac: mediatek: add support for
MT8189 SoC"), mediatek_dwmac_clk_init() then does:

drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c:mediatek_dwmac_clk_init() {
    ...
	if (plat->rmii_clk_from_mac) {
		plat->rmii_internal_clk = devm_clk_get(plat->dev, "rmii_internal");
		if (IS_ERR(plat->rmii_internal_clk))
			ret = PTR_ERR(plat->rmii_internal_clk);
    ...
}

Wouldn't mediatek_dwmac_probe() then fail with -ENOENT?

The mt8189 variant also reuses mt8195_set_interface(), which programs
MT8195_RMII_CLK_SRC_INTERNAL in this case. So the driver treats this mode
as valid for MT8189, but the binding can't describe it.

If MT8189 can't supply the RMII reference clock from the MAC, should this
branch set mediatek,rmii-clk-from-mac: false? If it can, should an
optional rmii_internal clock be allowed here?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260924-dwmac-mediatek-mt8189-v2-0-430bd74d5ef9%40collabora.com

