Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F21C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 20:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w587efkOjiQf9pLi3wYoyzihoJi5RgWEhsC3DWDduOI=; b=AkolJTmeUwEfGWdBJj8ftgwM/X
	PvZVR74lwUS7a1aGi61ARBAVsCRmxlU3RB3RLxd39rl8UuZO3xKdwSDsiuaeLnmNLkpKtiSXtjpsq
	8727bplZLH5m80nQ0G1DWy/FK+iusPQ3xkH3/UEI4TJt7dX38/yNIF/UBrGDX9Q9u5ncw5fNhB5g9
	GilXfLQdDfrwVfjIr/QBEODw+HgFbFvBeTn83l6+KRc4oXbbwRv5/8GXmXPSXF/uFpns5+Os10EZq
	XIe4vqg3mD1hob4VapRGOTbbLZaMY/Gq84rcTWJPtfHk2Wf+WGKQ4blqZyCIwoSQaeGfxe6C4P3A7
	KpA9kWKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DEN-00000004aLw-2ElB;
	Mon, 14 Sep 2026 20:24:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DEF-00000004aGx-2AEB;
	Mon, 14 Sep 2026 20:24:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 35B1140F0E;
	Mon, 14 Sep 2026 20:24:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B9161F0089E;
	Mon, 14 Sep 2026 20:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789417479;
	bh=w587efkOjiQf9pLi3wYoyzihoJi5RgWEhsC3DWDduOI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=c8Q/E5xBLlpVxk8HmFhY6cfDA7hI4fRNR/3W/efZKa9vyQzeaSLvRcYsG0+FW8ZYy
	 7ZSdFWp7b1aOLOdyfjh8uENE+aE35r9MiUTDggEJCKY89RvwO5cSsj06/p0MWVzxe9
	 AlDg3ZeTnVfNeKU38bTpzyjnywHAwVAGSgBPkkaLKXZ1u23spa1IqMF8tJwLFQtW8t
	 MDFeFzcuTHiB0wd+hLlHUmO95dCZR4CVRhzi9M0R2wARVMqBVJAsI5BNkmk8l/bCjL
	 WIldtGsE3g4di0Z8D9Ys5RybXB9k6t1tqJPFF7hZtOtDc5IzmQ07sm29oq5sazcLQr
	 H8h4foIq0Z7Vg==
Subject: Re: [PATCH net-next v5 02/11] dt-bindings: phy: rockchip:
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
Date: Mon, 14 Sep 2026 20:24:37 +0000
Message-ID: <178941747711.22033.8495700704733189874@kernel.org>
In-Reply-To: <20260913185849.907479-3-coiaprant@gmail.com>
References: <20260913185849.907479-3-coiaprant@gmail.com>
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

- [Low] Concern (validated as NOT a defect in the series context): the
  binding adds `rockchip,sgmii-mac-sel` while, at this commit alone, no…

--

dt-bindings: phy: rockchip: naneng-combphy: add rockchip,sgmii-mac-sel property

This adds an optional rockchip,sgmii-mac-sel property to the naneng-combphy
binding so a board can select whether the RK3568 SGMII interface is routed
to GMAC0 or GMAC1.  The property is restricted to the RK3568 compatible via
the existing allOf conditional and defaults to 1 (GMAC1).

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
At this commit alone, is rockchip,sgmii-mac-sel read by anything?

rockchip_combphy_parse_dt() in
drivers/phy/rockchip/phy-rockchip-naneng-combphy.c does not look it up,
struct rockchip_combphy_grfcfg has no pipe_sgmii_mac_sel descriptor, and
no in-tree DTS sets it, so a kernel built from exactly this commit would
silently ignore the property.

This resolves itself later in the same series: "phy: rockchip:
naneng-combphy: add SGMII MAC selection for RK3568" adds the parsing

	priv->sgmii_mac_sel = 1;
	device_property_read_u32(dev, "rockchip,sgmii-mac-sel", &priv->sgmii_mac_sel);

along with the RK3568 pipe-GRF descriptor

	.pipe_sgmii_mac_sel	= { 0x0040, 1, 1, 0x00, 0x01 },

and the write in the PHY_TYPE_SGMII path of rk3568_combphy_cfg(), and
"arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port" adds the
first user:

	&combphy2 {
		rockchip,sgmii-mac-sel = <0>;
		status = "okay";
	};

So this is noted only for the record, since the binding and its consumer
being split across consecutive patches is the normal series layout.

The remaining point is a design question rather than a bug: is a raw
uint32 MAC index the interface preferred here, or would a phandle to the
GMAC controller node be a better fit for describing the routing?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260913185849.907479-1-coiaprant%40gmail.com

