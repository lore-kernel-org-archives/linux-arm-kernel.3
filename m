Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2113C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 23:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YI29IQP2xezR62b+5zBXyIijN6X8d17e5umPu2y3XFs=; b=MPY0IlC/Klkx+JSZeJnO71+AKK
	UV61JnAIXfQ/Eh0xINTshghYTAMOazQ1hP5Zh05YnGUkssw9POwdgQns4fYuymvTV43SCJgC1u2ZA
	B6OG+GDc3L+wNCJjxbCBF+eFrOKEyGNG/qR6QO3uzbRdEZUrTaHwQsNKWguckPrA3r3tJ5uONxN22
	RdecU9Ybs7+qe+Ph5qdpctZIoEYRvTeQRo5KBX5bQTQ+n1FmPcEebVCepaNHLgopvWPPY+9RbX6XI
	p4QI5t1w/w+FmBd40HsalILkNEbLaqMQSVMapILEH0a9zYukt5QcH8xgFO+rd4UQwnlb7+11C9/PL
	iQDblyKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nfo-00000003hOj-2KD6;
	Mon, 21 Sep 2026 23:43:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nfg-00000003hL2-2prR;
	Mon, 21 Sep 2026 23:43:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D2C0360235;
	Mon, 21 Sep 2026 23:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D79FC1F00893;
	Mon, 21 Sep 2026 23:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790034219;
	bh=YI29IQP2xezR62b+5zBXyIijN6X8d17e5umPu2y3XFs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VF6G0PmE1pYi7UpVqfg4pDWKTKj2ibBF/5FgWEtffUfTe90hAG7dyjixUqPHd3g0M
	 9+KOOU1DSTaNCsbpIfOpNK1Hih84qE/B3dIa8AiW9LYdqtBW2z6xHxhsGUPX+4m7WR
	 zSu6sps/VJlbLAj7bacp5Jv4zrN1zEyapITC7mAV8nSiiRdyWOJ8KoddklmfnQA785
	 AMop2h4PTO/NWm1XUS4hH/VDaCxUoxxT0mkwpEFOMehjLnAmT+1ob0tKuvjfEjL7Y6
	 yW8MCXH+8miIENqPP8sLWgUejIEikfHexhcNJi2qhjuZYzpYeET+Rv5OqmNeL5vNar
	 gHBEXO6kHHYhA==
Subject: Re: [PATCH net-next v7 02/11] dt-bindings: phy: rockchip:
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
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org
Date: Mon, 21 Sep 2026 23:43:37 +0000
Message-ID: <179003421738.2160803.13963773583177622439@kernel.org>
In-Reply-To: <20260917204624.2427486-3-coiaprant@gmail.com>
References: <20260917204624.2427486-3-coiaprant@gmail.com>
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

- [Low] Concern that the newly documented `rockchip,sgmii-mac-sel`
  property has no in-tree consumer, so a DT setting `rockchip,sgmii-mac-…

--

dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property

This adds an optional rockchip,sgmii-mac-sel property to the naneng-combphy
binding so that a device tree can select whether the RK3568 SGMII lane is
routed to GMAC0 or GMAC1 via the pipe_sgmii_mac_sel GRF bit.  The property
is restricted to the values 0 and 1, with a documented default of 1, and is
allowed only for the compatible handled by the surrounding if block.

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

[Severity: Low]
This isn't a bug, just a note for the record in case anyone looks at this
commit in isolation.

At this commit alone there is no consumer of rockchip,sgmii-mac-sel in
drivers/phy/rockchip/phy-rockchip-naneng-combphy.c, so a device tree with
rockchip,sgmii-mac-sel = <0> would pass dt_binding_check and probe while the
SGMII lane stays routed to GMAC1.

The following patch in the series, "phy: rockchip: naneng-combphy: add SGMII
MAC selection for RK3568", adds the consumer:

  rockchip_combphy_parse_dt() {
      ...
      priv->sgmii_mac_sel = 1;
      device_property_read_u32(dev, "rockchip,sgmii-mac-sel", &priv->sgmii_mac_sel);
      ...
  }

  rk3568_combphy_cfg() {
      ...
      case PHY_TYPE_SGMII:
          rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_sgmii_mac_sel,
                                       priv->sgmii_mac_sel > 0);
      ...
  }

The 0/1 encoding and the default of 1 in the schema match that driver code,
and bindings-before-driver is the expected submission order, so nothing needs
changing here.

> +
>    "#phy-cells":
>      const: 1
>  

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260917204624.2427486-1-coiaprant%40gmail.com

