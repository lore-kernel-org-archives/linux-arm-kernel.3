Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D4AC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 18:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxebnu98m4tIYnDFX7Ssph7AnvZbMmHlUSJWYuXN+jw=; b=dKtlyiNBDKx2ZHOMpjhWRsDcs9
	Z1Sig5S8kHsy+BNQL+y3TJKsJSynSZnorp+lf1PCdHqT3fql7p+ESCb6CBbKq+LXWXjA87HE7y7di
	Eo8tsrjS0wEfIJUcGZrp8YxyQAzFAlsIdtAWPzcotVUSg3o+THRWYEOsJHwLbFLSQ3LJ44b/m2XPf
	GP+qE9gQ2v/zc99CR4x8wH9WwELrXF8LjiGAinqksJDfRhOli+oMcixcGKwQr5JllRA1rxht30WsR
	DB7NB81T5mU7uU2Gl4lU03DPP7QJSFrfTUg7MffUEAXNMUHrmowMfNiWioV4rxHPBRPyYNMhkCEfg
	Yo2wognQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Gzw-0000000CFGh-0SV2;
	Thu, 17 Sep 2026 18:38:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Gzq-0000000CFEk-3wYr;
	Thu, 17 Sep 2026 18:38:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C194E600D4;
	Thu, 17 Sep 2026 18:38:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E79FA1F00893;
	Thu, 17 Sep 2026 18:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789670289;
	bh=yxebnu98m4tIYnDFX7Ssph7AnvZbMmHlUSJWYuXN+jw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Z8ljo9ih31/foT9aRUgqlAoM2YjYSBOuxI8gBJwP/Kq9cRZlpzVPz+gD8By6pVDH+
	 phpLR//Njg7RPEsmD6K2vQ6twMkCjY/oM0yYOSr/uUBICYrgdWueJqYnSv62M/xEKf
	 2j8nOmAdcmOqfSmltzjZr2nGOfjCSGAD5s0Nd32+qIqMJC04ZeFa5IrdmPISufInEQ
	 edztpctqu8vcDcmAothpwmvpXhGM9hWOvP7mqNSEegRXyWsdE7vefFFyj8IWg0uNeA
	 Zdlsm87M79WfTxgPovHPiL7XOfCOvfGKBGBNjavhQWeF9ijBNG7YO55T9EcSKl64y7
	 hkd/CpZs4UEDw==
Subject: Re: [PATCH net-next v6 02/11] dt-bindings: phy: rockchip:
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
Date: Thu, 17 Sep 2026 18:38:07 +0000
Message-ID: <178967028750.22033.16679846848252928482@kernel.org>
In-Reply-To: <20260915123802.1561724-3-coiaprant@gmail.com>
References: <20260915123802.1561724-3-coiaprant@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 0 · Low: 1

- [Low] Concern (verified FALSE POSITIVE, retained only per validation
  policy): the binding was said to document `rockchip,sgmii-mac-sel`…

--

dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property

This adds an optional uint32 property rockchip,sgmii-mac-sel to the
naneng-combphy binding, gated so it is only accepted for
rockchip,rk3568-naneng-combphy.  The value selects whether SGMII is routed
to GMAC0 (0) or GMAC1 (1), with 1 documented as the hardware reset value.

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
This isn't a bug, just a note on patch ordering for anyone reading this
patch on its own: at this commit there is no in-tree consumer of
rockchip,sgmii-mac-sel yet, so the new ABI looks inert here.

Checking the rest of the series, the consumer does arrive immediately
after in "phy: rockchip: naneng-combphy: add SGMII MAC selection for
RK3568", which parses the property in rockchip_combphy_parse_dt():

    priv->sgmii_mac_sel = 1;
    device_property_read_u32(dev, "rockchip,sgmii-mac-sel", &priv->sgmii_mac_sel);

and applies it in the PHY_TYPE_SGMII branch of rk3568_combphy_cfg():

    rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_sgmii_mac_sel,
                                 priv->sgmii_mac_sel > 0);

with the RK3568 descriptor .pipe_sgmii_mac_sel = { 0x0040, 1, 1, 0x00, 0x01 },
and the Photonicat DT patch then sets rockchip,sgmii-mac-sel = <0> on
&combphy2.  So the GMAC0 routing does work at the end of the series and
there is nothing to fix; would it be worth mentioning the driver patch in
this commit message so the dependency is obvious when the binding is
reviewed in isolation?

> [ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260915123802.1561724-1-coiaprant%40gmail.com

