Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D1FFC98318
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 02:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vHTRX6NVnIzYhl1q0206js2CPkE+VZBEqeQmH9KkdfM=; b=BLgYlbfMeXWckLnQRDpEiQ4a7i
	f4xVqNOj/4i2addPdg6OQSD3gCZ10ECdYqx+yBL9CDKfWqZlmWtFaR6RROXIeKT5f0ORnUDdHBqyV
	i/pGSNXwc3nFIx4ktOvVk1/bbcSGwglFT2I/sWSnQau8yTQXxla2HvHuo2qPctl/7x3B6zeWorRRI
	w7hzdyOK3g7am8DYPK7O4ZqqTt8Z+KJ+Fiyf/u6+gkSsFVnsp8nNseoSgh8QkNG4XUaQSmv2tnFwP
	LFJSLKY5O8/3Z/DwBsLEgj+GzZ0Mnu0cYqJ1Kly+5uZgSae/1B9xJ/qQmdecjCSRmM2aPzWl8yZzn
	RPaf3bIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9vIr-0000000CWKQ-1cbX;
	Fri, 25 Sep 2026 02:04:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9vHy-0000000CVnY-2Yb6;
	Fri, 25 Sep 2026 02:03:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 06CDC43ECD;
	Fri, 25 Sep 2026 02:03:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8564D1F000FF;
	Fri, 25 Sep 2026 02:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790301829;
	bh=vHTRX6NVnIzYhl1q0206js2CPkE+VZBEqeQmH9KkdfM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mgVAq8bPAQzYHrRjTciQZUSfWuf81rC3O6ZV9dfxyi/1aqkrqiZzI6GadkzgRL1y3
	 EfWbrkfsBKXOsq/2nZILOap+uN7fn76DwpkmTEuqSCmUJkVacefWLSdpt/Jan7Fcj9
	 QbFw3jA3WubUH5Am32CSY+w3DzEomay3CxSPCB9gPxifSTDWpjwEo2k9gGZ61bBTLb
	 s8ABaQVENxleT9nkB760gh2gDT7d7C+PuKbXGJPHwqEK/HwQdtgJPJCUxuU74Gj0+D
	 62bc75KHESnNyO7I79Ub1iBruwCERlWDJuqU1RnhZAH2fge4mMhSsfHdGJUidZtPrF
	 3OW84fTmqzrEg==
Subject: Re: [PATCH net-next v10 10/11] arm64: dts: rockchip:
 rk3568-photonicat: enable SGMII LAN port
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
Date: Fri, 25 Sep 2026 02:03:48 +0000
Message-ID: <179030182812.2160803.15624484068208460829@kernel.org>
In-Reply-To: <20260922200336.2201212-11-coiaprant@gmail.com>
References: <20260922200336.2201212-11-coiaprant@gmail.com>
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

- [Low] The commit message of "arm64: dts: rockchip: rk3568-photonicat:
  enable SGMII LAN port" describes the combphy2, xpcs/xpcs_mii0 and…

--

arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port

This commit enables the SGMII LAN port on the Ariaboard Photonicat. It
routes combphy2 to GMAC0, enables the xpcs node, configures gmac0 for
SGMII and adds the YT8521SC PHY on mdio0. It also adds LED nodes to both
the new SGMII PHY and the existing RGMII WAN PHY on mdio1.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
> index 58c1052ba8ef3..fdaa4a2a4328b 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts

[ ... ]

> @@ -260,9 +262,18 @@ &cpu3 {
>  	cpu-supply = <&vdd_cpu>;
>  };
>  
> -/* Motorcomm YT8521SC LAN port (require SGMII) */
> +/* Motorcomm YT8521SC LAN port */
>  &gmac0 {
> -	status = "disabled";
> +	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>;
> +	assigned-clock-parents = <&clk_gmac0_xpcs_mii>;
> +	managed = "in-band-status";
> +	pcs-handle = <&xpcs_mii0>;
> +	phy-handle = <&sgmii_phy>;
> +	phy-mode = "sgmii";
> +	phy-supply = <&vcc_3v3>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac0_miim>;
> +	status = "okay";
>  };

[Severity: Low]
This isn't a bug, but the commit message describes the combphy2,
xpcs/xpcs_mii0 and mdio0 changes and not this &gmac0 rework. The gmac0
rework is the main functional change in the patch. Could the message
describe it too?

In this hunk, status = "disabled" becomes a full SGMII configuration
that:

  - reparents SCLK_GMAC0_RX_TX to the 125 MHz clk_gmac0_xpcs_mii clock
    through assigned-clock-parents
  - sets managed = "in-band-status". The commit "net: stmmac: dwmac-rk:
    add SGMII support for RK3568" says boards must use it because
    out-of-band SGMII breaks RX at 10/100
  - adds pcs-handle = <&xpcs_mii0>, phy-handle, phy-supply and the
    gmac0_miim pinctrl

The commit message also says:

  "Also add LED configuration for the existing RGMII PHY on mdio1 for
  consistency."

Those LED_FUNCTION_WAN nodes go on rgmii_phy, which drives the separate
WAN port that already works. Could that go in its own patch? As it
stands, reverting or bisecting the SGMII LAN enablement also drops the
WAN LED change.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260922200336.2201212-1-coiaprant%40gmail.com

