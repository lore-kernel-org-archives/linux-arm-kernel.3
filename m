Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD715C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 23:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dju3+S6OUKK1WseHTuR/piRFLe87JxUt0W2aIyTXBpA=; b=bOyPWk1ZTWsthf9IADI7t1FKzg
	KfqixjJ+Nbu5hMbOgMkE96yEp/ix+KaC88ayutpRvMJeIWUgyfjlD9JkwCZWgnkpg2agRA0Fc40CL
	JQKiz38Ow5RdvkK4n8mlfpCuGuCQ9oLMIkXjLZxzk5XzXLE5bjB2ue0PYS5m1SudBAtRtjhs+/scF
	sRg48Yo5Qr/A840icJgJnnSBJdeblGs/uRBGPdQI2a6+NKtVs8ukGTkJ6tCF7Z/3CSi3IfvHucr9N
	MJc9hgoGHooNZX110NI7hdtSFLDCqwaPrPwoKbH3hVFZQ00VHr4uTop3jDs6Yo/zL3P1wkawij1+N
	Yn7i5Uig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nhI-00000003iU7-3Kn7;
	Mon, 21 Sep 2026 23:45:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nfs-00000003hRp-2Yew;
	Mon, 21 Sep 2026 23:43:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B85440E26;
	Mon, 21 Sep 2026 23:43:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E211F0089C;
	Mon, 21 Sep 2026 23:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790034232;
	bh=Dju3+S6OUKK1WseHTuR/piRFLe87JxUt0W2aIyTXBpA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=MgxPIqsOU1REpixYxa96+IORbVp6Tfd7AxMK0tmm/0cZ2aOxEycf8zX1drqBzeh57
	 dd5TD8jzq9pQXMdVUx1jU97L9dZy2NXLjjp3Op8LMkiO47sfHLFtt8zQgBOeRX2a7u
	 PEmTeDSE40l9VfplmQ4FxQnfWyC2IIlgnR0/dJstnvb7j+ouadQwUt3u5rLfup8R6P
	 OGx8GL/GReRuhavMLID+WImU0vO1HJaWHyB1alsiwPVqS1/WC4eIF94nDkKY/1U8aF
	 2khhtiWIx8cYJaG2lniLkxu8twsyi/SlSdNeelWBXrokljXoAYTMqg2upvqeOHeqhW
	 SpZfARksSZO+A==
Subject: Re: [PATCH net-next v7 08/11] dt-bindings: net: rockchip-dwmac:
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
Date: Mon, 21 Sep 2026 23:43:50 +0000
Message-ID: <179003423043.2160803.14939298320345950361@kernel.org>
In-Reply-To: <20260917204624.2427486-9-coiaprant@gmail.com>
References: <20260917204624.2427486-9-coiaprant@gmail.com>
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] Concern (INVALIDATED): the commit message claims `pcs-handle`
  "will be parsed by rk_pcs_init(), and a missing phandle fails the…

--

dt-bindings: net: rockchip-dwmac: document pcs-handle

This adds a pcs-handle property to the Rockchip GMAC binding and makes it
required when phy-mode is "sgmii" on rockchip,rk3568-gmac.  The property
describes the PCS device used by the SGMII support added by a later patch
in the same series.

No regressions to report on this patch.

> diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
> index 80c252845349c..bb7540e838033 100644
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
>    phy-supply:
>      description: PHY regulator
>  

[ ... ]

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: rockchip,rk3568-gmac
> +        phy-mode:
> +          contains:
> +            const: sgmii
> +    then:
> +      required:
> +        - pcs-handle
> +

One concern was raised during review of the hunks above and then dropped
after checking the rest of the series: the claim that the commit message
references a rk_pcs_init() that does not exist in tree, leaving a required
property with no consumer.

Looking at the end of the series, drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
does gain rk_pcs_init(), which parses the new property:

  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:rk_pcs_init() {
      ...
      pcs_node = of_parse_phandle(np, "pcs-handle", 0);
      if (!pcs_node)
              return -ENODEV;

      xpcs = xpcs_rk_create(priv->device, pcs_node);
      ...
  }

and rk_gmac_probe() installs it for PHY_INTERFACE_MODE_SGMII:

  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:rk_gmac_probe() {
      ...
      if (plat_dat->phy_interface == PHY_INTERFACE_MODE_SGMII) {
              /* SGMII clock always runs at 125 MHz */
              plat_dat->set_clk_tx_rate = NULL;

              /* SGMII requires a PCS */
              plat_dat->default_an_inband = true;
              plat_dat->pcs_init = rk_pcs_init;
      ...
  }

So the documented property does have an in-tree consumer and the commit
message matches the code.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260917204624.2427486-1-coiaprant%40gmail.com

