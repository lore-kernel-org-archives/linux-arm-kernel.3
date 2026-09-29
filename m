Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27E2CA5FAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 03:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJxsvFFeTjN16SEabmoTPrNq8H4f01wfiVpkQzZkGDk=; b=hUHgfVckaWt9bMEWjbktnaqL+q
	q2E3GVpv5kZaum3a2Sra9ujh5Rbez2+89Vm3kdq0uN7m/orzCfT7RK5y4e9b3PSOGQ/QGh0Jqz6tO
	ILmovVfR/vlvPZTLR0zuFOsqjj7lBNg4nb99/ite2cF4Fzl8wYSxEt7QyuTmt/FGlkSsSE35kNXw/
	41BIa8N1ygaT2cS8QR+j7mzrw1fPjMMygJmRpU5gCx6BRfV70XxJqYauGpCkmsm2Kx7RSb1KmbQh0
	WMgSc0Dva51+q3ju7tmxEcGTmkobS7BzBa88ilqAqupyzRVtgAWibTH4TCAPMwNA/lSdr0fBJ2EMD
	+grrgcHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOqL-00000002Hcc-2GxR;
	Tue, 29 Sep 2026 03:49:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOqB-00000002HZB-2AgI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 03:49:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EED8B60A59;
	Tue, 29 Sep 2026 03:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D721F0089A;
	Tue, 29 Sep 2026 03:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790653754;
	bh=NJxsvFFeTjN16SEabmoTPrNq8H4f01wfiVpkQzZkGDk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=G6J8FYL5faqwNyYDtStJi9kKiVCa2NFNNQvQDEZeKfaNI2cgqwMyxpfmcFWCd9XJB
	 HqdcCZxQKGLQHaLnJ++7kvxtMqIJY/gZYOMIMmijWfzy6cU5JXF2d88cI3kqThLAxZ
	 JLUXfrp+qu1K0MehnBwlNCam7D/JRtqvtS8mBoQHv8WeTsnKJLL+krCjif5I45QAnZ
	 tHeR2fNCYl7dah1MyOYftFZi8Bb8EV1JZI1dSl6pJENZedCw0cgbN0fQc2YYPl0Exf
	 y+6YB7rK05Iyk3GjhhXHEw7+BxP5v2s3Efl10UPD0Ou4i61mGYHURlBSxKIBK9mDl8
	 bLO4JcsA8Gg1g==
Subject: Re: [PATCH net-next v6 3/3] net: stmmac: sun8i: add support for
 Allwinner H616 EMAC1
From: netdev-bot+sashiko@kernel.org
To: james.hilliard1@gmail.com
Cc: richard.genoud@bootlin.com, maxime.chevallier@bootlin.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, wens@kernel.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 clabbe.montjoie@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, peppe.cavallaro@st.com, joabreu@synopsys.com,
 alastair@d-silva.org, mripard@kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, andre.przywara@arm.com
Date: Tue, 29 Sep 2026 03:49:12 +0000
Message-ID: <179065375273.434549.1903316827628045110@kernel.org>
In-Reply-To: <20260927-submit-h616-emac1-v1-v6-3-e64971f4e414@gmail.com>
References: <20260927-submit-h616-emac1-v1-v6-3-e64971f4e414@gmail.com>
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

- [Low] The new H616 EMAC1 variant (`emac_variant_h616_emac1` in
  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c) is meant to be…

--

net: stmmac: sun8i: add support for Allwinner H616 EMAC1

This adds an emac_variant for the H616 secondary EMAC. The variant uses a
dedicated syscon register at 0x34 and is described as RMII-only at 10/100
Mbps. It is wired internally to the co-packaged AC200/AC300 EPHY.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 5691da796454d..47954537b29e4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c

[ ... ]

> @@ -143,6 +150,13 @@ static const struct emac_variant emac_variant_h6 = {
>  	.tx_delay_max = 7,
>  };
>  
> +static const struct emac_variant emac_variant_h616_emac1 = {
> +	.syscon_field = &sun8i_syscon_reg_field_emac1,
> +	/* The co-packaged AC200/AC300 PHY does not use the H3 PHY controls. */
> +	.soc_has_internal_phy = false,
> +	.support_rmii = true,
> +};

[Severity: Low]
Does anything actually restrict this variant to RMII?

The only place support_mii, support_rmii and support_rgmii appear is in
dwmac-sun8i.c: the kernel-doc, the struct emac_variant definition and the
variant initializers. Nothing reads them.

sun8i_dwmac_set_syscon() picks the register value from plat->phy_interface
and does it the same way for every variant:

drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c:sun8i_dwmac_set_syscon() {
    ...
	switch (plat->phy_interface) {
	case PHY_INTERFACE_MODE_MII:
		/* default */
		break;
	case PHY_INTERFACE_MODE_RGMII:
	case PHY_INTERFACE_MODE_RGMII_ID:
	case PHY_INTERFACE_MODE_RGMII_RXID:
	case PHY_INTERFACE_MODE_RGMII_TXID:
		reg |= SYSCON_EPIT | SYSCON_ETCS_INT_GMII;
		break;
	case PHY_INTERFACE_MODE_RMII:
		reg |= SYSCON_RMII_EN | SYSCON_ETCS_EXT_GMII;
		break;
    ...
	regmap_field_write(gmac->regmap_field, reg);
    ...
}

Suppose a DT node with "allwinner,sun50i-h616-emac1" sets phy-mode to "mii"
or "rgmii*". Probe would still succeed, and a value without SYSCON_RMII_EN
would be written to the new register at 0x34. This MAC has no external pins.

dwmac-sun8i has no get_interfaces callback, so stmmac_phylink_setup() adds
the DT-supplied mode to supported_interfaces as is:

	if (phy_interface_empty(config->supported_interfaces))
		__set_bit(priv->plat->phy_interface,
			  config->supported_interfaces);

sun8i_dwmac_setup() also always advertises MAC_10 | MAC_100 | MAC_1000 in
mac->link.caps. With a non-RMII phy-mode, phylink could then allow gigabit
on a 10/100-only MAC.

The commit message says:

    Add an EMAC1 variant using the dedicated register and enable only RMII.

There is also no in-tree binding for "allwinner,sun50i-h616-emac1" yet. As
far as I can tell, only a correct DT enforces the RMII-only restriction.

Older variants such as emac_variant_v3s have the same unchecked flags, but
this new variant's RMII-only behaviour depends on them. Would it make sense
to reject unsupported phy_interface values in sun8i_dwmac_set_syscon() or at
probe? Another option is a get_interfaces callback built from the support_*
flags. If neither fits, the commit message could say the restriction comes
only from the DT.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260927-submit-h616-emac1-v1-v6-0-e64971f4e414%40gmail.com

