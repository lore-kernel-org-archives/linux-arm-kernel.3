Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE602CCF2CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 06:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7foX2sltJUBrduQaVLWCnWkINXoCkL4ewEk5y5ZKQ58=; b=iX24z/4TUCxwLbgZowwumwkDOT
	j54YF3xmDMxl1AHps+IwktubHqvrSvdbKUfPJG8ygTbeFfU9RP+hMfZwhx9y9kLLBVjKzuN8VC2y9
	KCtUztz+Kf0IFHw/ShuEi3a+HWlOlagGBS73jUi+jRVu3BVQBaDX9RYlL8Anjyg25S6VrMrCsttkc
	Kxd7NeOZvZhEkX3GTIMqIOski9hKXAtjqFxbScPqFIncN8W738f2Rx5hC/BDnZIhi3qEpAh3DIp/C
	Th4a3GqxFHIpwtFz3WSuVw3k+uh8igaVTRk0JzrUnixqC9SqR4M8JiT7b+2hfndFg8BCDJHzeB+2m
	R3RDI9jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIKeE-00000005die-3qzf;
	Sun, 18 Oct 2026 06:45:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIKeA-00000005di4-2e76;
	Sun, 18 Oct 2026 06:45:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 56CD744500;
	Sun, 18 Oct 2026 06:45:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 320A71F000C5;
	Sun, 18 Oct 2026 06:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792305930;
	bh=7foX2sltJUBrduQaVLWCnWkINXoCkL4ewEk5y5ZKQ58=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Zogmw17uoSjVmvTpbTjGgSQHk/XQKQObiSDRXGOMLOqj8YxLEaWE4DCQwudfUyuzJ
	 GEjLPRfApfAvyS6x9APx5Yr4MO9E5I5b3tCAZ13Dkxzy9mbt+Ekz4FsLZNlY/nKd2U
	 HGStFM2SUZoqs2sWqHojVeCh/dswU9yY6cQkSWRrSmQYR3pZbp9SFVeSCJajUEv3SJ
	 iWzKzWf9ZXpjSsIVp9Pj4sxX2VktaHgX/3fcJ3GC+2rWUAisjlXlQsKYqmQsJ5SeS/
	 quS33+0yUAwrG7STT+Sqeo/LJ9sCsyXWivR63BWr+mj2518y1r7+JfT+BwB3K1Qirz
	 tOmqHQkZZMKWQ==
Subject: Re: [PATCH net-next v12 2/6] dt-bindings: net: pcs: add
 rockchip,rk3568-xpcs support
From: netdev-bot+sashiko@kernel.org
To: coiaprant@gmail.com
Cc: kuba@kernel.org, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, hkallweit1@gmail.com, linux@armlinux.org.uk,
 david.wu@rock-chips.com, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Sun, 18 Oct 2026 06:45:28 +0000
Message-ID: <179230592878.3135.12873232337699291552@kernel.org>
In-Reply-To: <20261017054406.1828061-3-coiaprant@gmail.com>
References: <20261017054406.1828061-3-coiaprant@gmail.com>
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

- [Low] The new binding
  Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml…

--

dt-bindings: net: pcs: add rockchip,rk3568-xpcs support

This patch adds a device tree binding for the Synopsys DesignWare XPCS on
the Rockchip RK3568 SoC. The XPCS sits on the APB3 bus and connects
internally to the Naneng Combo SerDes PHY. It supports 1000BASE-X, SGMII
and QSGMII.

> diff --git a/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml b/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
> new file mode 100644
> index 0000000000000..a331880eb11c1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml

[ ... ]

> +properties:
> +  compatible:
> +    const: rockchip,rk3568-xpcs
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: APB3 bus interface clock (clk_csr_i), required for register access
> +      - description: EEE clock (clk_eee_i), required for Energy Efficient Ethernet operation
> +
> +  clock-names:
> +    items:
> +      - const: csr
> +      - const: eee
> +
> +  phys:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - phys
> +  - power-domains
> +
> +additionalProperties: false

[Severity: Low]
Should this binding let the XPCS act as a clock provider?

The RK3568 CRU uses XPCS-named clocks as parents for the GMAC RX/TX
muxes, in drivers/clk/rockchip/clk-rk3568.c:

PNAME(mux_gmac0_rx_tx_p) = { "clk_gmac0_rgmii_speed", "clk_gmac0_rmii_speed", "clk_gmac0_xpcs_mii" };
PNAME(mux_gmac1_rx_tx_p) = { "clk_gmac1_rgmii_speed", "clk_gmac1_rmii_speed", "clk_gmac1_xpcs_mii" };

These are the parents of SCLK_GMAC0_RX_TX and SCLK_GMAC1_RX_TX.
rk356x-base.dtsi passes those clocks to the GMAC as mac_clk_rx,
mac_clk_tx and clk_mac_speed. Nothing in the tree registers
clk_gmac0_xpcs_mii or clk_gmac1_xpcs_mii today.

For SGMII on GMAC0/GMAC1, a board DT would need assigned-clock-parents
to point SCLK_GMACn_RX_TX at the XPCS MII clock. This schema has no
#clock-cells or clock-output-names, and additionalProperties: false
means dt_binding_check rejects them. So the DT can't name the XPCS node
as the source of that clock. Boards would have to use a fixed-clock
placeholder carrying the CRU's string name instead.

Documentation/devicetree/bindings/writing-bindings.rst says "DO attempt
to make bindings complete even if a driver doesn't support some
features". The commit message explains why the SRST_XPCS* resets are
left out but says nothing about the MII clock outputs.

Could #clock-cells (and clock-output-names, if needed) be added for the
per-port MII clocks? Or could the commit message say why they are left
out?

> +
> +examples:

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261017054406.1828061-1-coiaprant%40gmail.com

