Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806E3C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 08:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/dfTFSYIJI0KlIowkfqgMTTkhWReiFAfFddaWbLYdc=; b=0knl/lrOHtNuZMSJyryyKSBjGL
	6PFR6JtWEbO+74B4aOoSVk6tiZdZge7q1iIUNH33Sm8m6xtE6+WpAvo0DKvNM7mkxu4mcUEsGffgk
	3s5bAFTNjrBmB3QxUC1zrLAe4tieeb6PYGo9WQ/mhYizo8eo3o4jwbM6Fisd/+lVbbUT/uE+vJ7qC
	oGHYM4+d2DA9MHPhjbuVg5lbitImY2JjwErQTUqgruqpT1yq78mNG1ZId/aDu+LnMwjoyKQtmHPQc
	CiFQAKAcpFN5voamiXr3Am52/ehsO04r6GB05l7SSS49lnvQYxCvc14Kws+j48K1YB9YQOcip3ors
	JhNUFKQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Zps-0000000Dgvj-0Q9r;
	Thu, 10 Sep 2026 08:08:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Zpq-0000000DgvW-1saJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 08:08:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B47A600C8;
	Thu, 10 Sep 2026 08:08:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F071F000FF;
	Thu, 10 Sep 2026 08:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789027721;
	bh=N/dfTFSYIJI0KlIowkfqgMTTkhWReiFAfFddaWbLYdc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=L17xMoNDAy3MvI6ioQL67gAuAn4CgrGWq61d77/tFvaK0WueetEZOSgspX123gluw
	 hmDJYmL4zTm2JyjdCHuzTPylhEyQV7U8u38OUoX3b16tBdm4q9Z9kGta8mnvSMYCnM
	 QEKdYn8aloOUMtGbyDqcm5Xonk9dSZ2//5BOoKjJJA9yBn25u7Tp3uI47zDLvkBov2
	 ymcquXCCenh4k2WYaesvInTDvJPZmnO2Ps+LIl1QjZLnXLvktJeUBh5GuOwm3uU5NR
	 whhfeZj2fNZBPIiIA+cj03ofybaMh4dbpVlrADYOZwd4sTk1siM/cB9VFID5Vq7cdH
	 c6jolalH6VClw==
Subject: Re: [PATCH] dt-bindings: net: snps,dwmac: allow stmmaceth-ocp reset name
From: netdev-bot+sashiko@kernel.org
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, dinguyen@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, peppe.cavallaro@st.com, joabreu@synopsys.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 10 Sep 2026 08:08:39 +0000
Message-ID: <178902771990.219967.12244559692120688678@kernel.org>
In-Reply-To: <20260909080559.2028-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260909080559.2028-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 1 · Low: 0 (1)

- [Medium] The SoCFPGA-only reset name "stmmaceth-ocp" is added
  unconditionally to the *generic* snps,dwmac.yaml second-reset slot…

Pre-existing issues:
- [Low] After this patch,
  Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml…

--

dt-bindings: net: snps,dwmac: allow stmmaceth-ocp reset name

The patch relaxes the second entry of reset-names in the generic
snps,dwmac.yaml schema so that "stmmaceth-ocp" is accepted alongside
"ahb", and removes the Arria10 TODO note from the Altera SoCFPGA DWMAC
binding description.

> diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> index db93436c96fa..d8f90d36d246 100644
> --- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> +++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
> @@ -13,8 +13,6 @@ description:
>    This binding describes the Altera SOCFPGA SoC implementation of the
>    Synopsys DWMAC for the Cyclone5, Arria5, Stratix10, Agilex5 and Agilex7
>    families of chips.
> -  # TODO: Determine how to handle the Arria10 reset-name, stmmaceth-ocp, that
> -  # does not validate against net/snps,dwmac.yaml.

[Severity: Low]
This isn't a bug introduced by this patch, but after the TODO is removed
this file no longer mentions Arria10 anywhere, while the family list in
the same description block still reads:

  Synopsys DWMAC for the Cyclone5, Arria5, Stratix10, Agilex5 and Agilex7
  families of chips.

The compatible documented in this same file, altr,socfpga-stmmac-a10-s10,
is the string used by the Arria10 gmac nodes in
arch/arm/boot/dts/intel/socfpga/socfpga_arria10.dtsi.  Could Arria10 be
added to that family list along with dropping the TODO?

> 
>  select:
>    properties:
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 2449311c6d28..c7f1a7c11c8d 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -174,7 +174,7 @@ properties:
>      minItems: 1
>      items:
>        - description: GMAC stmmaceth reset
> -      - description: AHB reset
> +      - description: AHB or OCP reset
>  
>    reset-names:
>      oneOf:
> @@ -182,7 +182,7 @@ properties:
>            - enum: [stmmaceth, ahb]
>        - items:
>            - const: stmmaceth
> -          - const: ahb
> +          - enum: [ahb, stmmaceth-ocp]

[Severity: Medium]
Should this new name be gated on the Altera compatible instead of being
allowed for every DWMAC binding?

"stmmaceth-ocp" only has one in-tree consumer,
drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c:socfpga_dwmac_probe():

	dwmac->stmmac_ocp_rst = devm_reset_control_get_optional(dev, "stmmaceth-ocp");

The generic parser, stmmac_probe_config_dt() in stmmac_platform.c, only
ever asks for the second reset by the name "ahb":

	plat->stmmac_ahb_rst = devm_reset_control_get_optional_shared(
							&pdev->dev, "ahb");

Since every other DWMAC binding (mediatek, rockchip, starfive, st, qcom,
...) $refs snps,dwmac.yaml, a device tree for one of those platforms can
now write reset-names = "stmmaceth", "stmmaceth-ocp" and still pass
dt_binding_check, while no driver on those platforms looks that name up,
so that reset is never deasserted and validation reports nothing.  Would
an if/then on the compatible be preferable?  snps,dwmac.yaml already
carries such blocks (for example the compatible-gated snps,tso: false
block), and altr,socfpga-stmmac.yaml already has an allOf with an
if: on altr,socfpga-stmmac-agilex5, which looks like the natural place to
constrain the Arria10 (altr,socfpga-stmmac-a10-s10) reset naming.

> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -174,7 +174,7 @@ properties:
>      minItems: 1
>      items:
>        - description: GMAC stmmaceth reset
> -      - description: AHB reset
> +      - description: AHB or OCP reset

[Severity: Medium]
Related to the above: this description now covers two different resets
with different acquisition semantics in one slot.  The AHB reset is taken
as a shared control via devm_reset_control_get_optional_shared() in
stmmac_platform.c, while the OCP reset is taken as an exclusive control
via devm_reset_control_get_optional() in dwmac-socfpga.c.  Would separate
per-compatible descriptions make the contract clearer?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260909080559.2028-1-muhammad.nazim.amirul.nazle.asmade%40altera.com

