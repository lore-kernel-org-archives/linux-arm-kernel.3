Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F287C9831E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 02:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2DcEvfwfmeVBZJUGXm+guglmvCS4PPEV/BwTo5J2CK8=; b=FvNPr4Ebzy4mB8NNn+eutpDwLo
	grNYdohGicJKR16HQfBuLG8MzuopevCUnlDJasnAiKKG+b+goUPDJka7BxAGGunkVXzTI5eG8JqVX
	BR9M67VnEwfBSXMnlm/eQJg125eL22jUo1/YebC+5L9hhRk9YpX7uvzvzM2paL3P2I6mAIbzS8yY1
	UGxfUw5kxdKvmLOfXqiGUhWopxCLOyXlMrR3+zRkKACDtNvnTJWuqTgZcNSjP1ECnzgIVaYlIMIsv
	mR5C3EWzq7JL8GdIRok51orxhJGDSrAbDTpG/GcbZVEYIG4f7DOezO9kfZz1wcZW6IFnIeC+2aBSB
	vP5BoRew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9vHx-0000000CVn5-2HOa;
	Fri, 25 Sep 2026 02:03:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9vHo-0000000CVjS-2l7D;
	Fri, 25 Sep 2026 02:03:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 867AC6022E;
	Fri, 25 Sep 2026 02:03:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C17431F00893;
	Fri, 25 Sep 2026 02:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790301819;
	bh=2DcEvfwfmeVBZJUGXm+guglmvCS4PPEV/BwTo5J2CK8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=j2IWEw2XjaXAKHXjlq/hSecnxIaNI96jV/cdtiOIjs0hrVaqddPU2KgtIpqwzhdI/
	 Vc5t30TIluHsim1Cu1eDG5nQqEDg3gVLlmTWWLCYyBeowOiQj4SoL2WadbBJNOKL0Y
	 25PeBfxgqNu4iqIxwOOOIgU3Cr6JRMB6JcjnkBlS0wuyjZjCiVmL9VaPH82NSqQEbz
	 v03gQ3C23S0I/LA2DNOFFLny5UAHXkXHXQr1o+w4diItkyxnNOahXcKY4MQj+voR7f
	 nzToISoDB7OAxyJgYRcGP507tClq2PJpZnUDDD2Jyfi8CKMKqQLtewrhNZBqr4W+zF
	 Yq8/xKfPQ7COQ==
Subject: Re: [PATCH net-next v10 02/11] dt-bindings: phy: rockchip:
 naneng-combphy: add rockchip,sgmii-mac-sel property
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
 linux-renesas-soc@vger.kernel.org
Date: Fri, 25 Sep 2026 02:03:37 +0000
Message-ID: <179030181733.2160803.4810080310196721706@kernel.org>
In-Reply-To: <20260922200336.2201212-3-coiaprant@gmail.com>
References: <20260922200336.2201212-3-coiaprant@gmail.com>
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

- [Low] Concern (verified FALSE POSITIVE, retained for policy): "The
  binding documents `rockchip,sgmii-mac-sel` but no in-tree code reads…

--

dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property

This adds an optional rockchip,sgmii-mac-sel property to the Rockchip
naneng-combphy binding so a device tree can select whether the RK3568
SGMII interface is routed to GMAC0 or GMAC1. The property is a uint32
limited to 0 or 1, defaulting to 1, and is only allowed for the RK3568
compatible.

> diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
> index 379b08bd9e97a..8e898bce9af73 100644
> --- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
> @@ -80,6 +80,15 @@ properties:
>      description:
>        Some additional pipe settings are accessed through GRF regs.
>  
> +  rockchip,sgmii-mac-sel:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +    default: 1
> +    description:
> +      Select gmac0 or gmac1 to be used as SGMII controller.
> +      The hardware reset value is GMAC1 (1). Set this to 0 to route
> +      SGMII to GMAC0.
> +

[Severity: Low]
This isn't a bug, just a note on ordering within the series.

At this commit alone, nothing in tree reads rockchip,sgmii-mac-sel, so a
device tree setting it to 0 would validate without any effect on the
pipe GRF mux bit.

Checking the rest of the series, the consumer does land immediately
afterwards: rockchip_combphy_parse_dt() in
drivers/phy/rockchip/phy-rockchip-naneng-combphy.c gains

	priv->sgmii_mac_sel = 1;
	device_property_read_u32(dev, "rockchip,sgmii-mac-sel", &priv->sgmii_mac_sel);

and the PHY_TYPE_SGMII case of rk3568_combphy_cfg() programs the bit
described here:

		rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_sgmii_mac_sel,
					     priv->sgmii_mac_sel > 0);

with the matching descriptor added to rk3568_combphy_grfcfgs, so the
behaviour is complete at the end of the series and no change is needed
here.

> [ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260922200336.2201212-1-coiaprant%40gmail.com

