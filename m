Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D425CCA600D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 16:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uaNaa9Tn58yyTSAMBp+pidOqkG6cVxAP3V+r3sTN9A0=; b=V5lqpmtYuQbVsqhLewLU27wziq
	m7AtbyjfA5uVDoonG3SsvcmGDY2LC4PJ4/hDht3557plk/rGmSc9WXMxrLWtM7OxpJFrLqqgjFvDs
	XWMNGUQ7/tobA2rIGsj+/HpWyngE5dJdfDcsyMv7CuhXwnh+seTA7kV2h45Tec+XEx4CycP3a8JAF
	9gjEmq3B2IFLkIFh+rLdq3E37/50U6jZgB2OljvY2C+2rA26QPf8iz9Le+38GGRpR5LaP/lDpYrwj
	KVI1myKm3ZeLlDwVlDVVRe5AXFqIgxshqcOJAvtSUSwQiZkpNaEaJpDLsna/PwJ3uNHuXMakiCAkk
	vdD5Ve8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEr3C-00000004hMM-2tVH;
	Thu, 08 Oct 2026 16:32:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEr39-00000004hKh-07lk;
	Thu, 08 Oct 2026 16:32:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B07B43C4A;
	Thu,  8 Oct 2026 16:32:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3241F00893;
	Thu,  8 Oct 2026 16:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791477174;
	bh=uaNaa9Tn58yyTSAMBp+pidOqkG6cVxAP3V+r3sTN9A0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QiQKgjxRRf9tJvBoefNoxF5aewDt6d/O2/i/GA1w4yFcMQfSYI16bB0123CNEB257
	 Ac/xfEMnbG1/OouPWijBVSRMyBHljsnLxf0vZyRGEIBiQXr+CB9WuAcD5/cYIt3quz
	 PrJhnTKJiOVIJfBP5MItzIcWlafYCLB93hQ+0omLNVJt6648g7+g8oljTvhmIljAvD
	 PpGnXHnR9OklzP+F76H5pZFKVmCVQLp+X49gSZMuK3T1fv8fgoWTwuJh/L7GamgEby
	 b8OkneTI6PDBPNV607dsdx7H157TR7s3893UdXOJRdCSe8ALOwfVAVIiXhN6QWo13X
	 nJOmSZYe5Dmcw==
Subject: Re: [PATCH net-next v10 2/6] net: pcs: xpcs: add ANRESTART support
 for SGMII link recovery
From: netdev-bot+sashiko@kernel.org
To: coiaprant@gmail.com
Cc: kuba@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, maxime.chevallier@bootlin.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, david.wu@rock-chips.com,
 netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Thu, 08 Oct 2026 16:32:52 +0000
Message-ID: <179147717283.434549.13991419652494046497@kernel.org>
In-Reply-To: <20261005223011.1124347-3-coiaprant@gmail.com>
References: <20261005223011.1124347-3-coiaprant@gmail.com>
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

- [Low] Concern: the patch goes against the phylink_pcs_ops contract.
- [Low] Race between concurrent pcs_get_state() callers.

--

net: pcs: xpcs: add ANRESTART support for SGMII link recovery

This patch sets BMCR_ANRESTART together with BMCR_ANENABLE in
xpcs_config_aneg_c37_sgmii(), and clears DW_VR_MII_AN_INTR_STS there as
well. It also restarts AN from xpcs_get_state_c37_sgmii() when the link is
down and AN completion is latched. The goal is to recover the link on
RK3568 XPCS hardware, which does not restart SGMII AN by itself after a
disconnect.

> diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
> index b415b93d77c15..6466e0ff2a98b 100644
> --- a/drivers/net/pcs/pcs-xpcs.c
> +++ b/drivers/net/pcs/pcs-xpcs.c

[ ... ]

> @@ -816,9 +825,14 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs,
>  	if (ret < 0)
>  		return ret;
>
> +	/* Clear CL37 AN complete status */
> +	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
> +	if (ret < 0)
> +		return ret;
> +
>  	if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED)
>  		ret = xpcs_write(xpcs, MDIO_MMD_VEND2, MII_BMCR,
> -				 mdio_ctrl | BMCR_ANENABLE);
> +				 mdio_ctrl | BMCR_ANENABLE | BMCR_ANRESTART);

[Severity: Low]
This is a small question about the phylink_pcs_ops contract, not a
functional regression. The pcs_config() kernel-doc in
include/linux/phylink.h says:

 * pcs_config() will be called when configuration of the PCS is required
 * or when the advertisement is possibly updated. It must not unnecessarily
 * disrupt an established link.

As far as I can tell, the existing code earlier in
xpcs_config_aneg_c37_sgmii() already clears BMCR_ANENABLE and sets it again
on every in-band call, and that alone restarts CL37 AN:

	if (mdio_ctrl & BMCR_ANENABLE) {
		ret = xpcs_write(xpcs, MDIO_MMD_VEND2, MII_BMCR,
				 mdio_ctrl & ~BMCR_ANENABLE);

Returning a positive value from pcs_config() to request a restart is also
not an option for SGMII. phylink_pcs_an_restart() only calls
pcs_an_restart() when phy_interface_mode_is_8023z() is true.

So the added BMCR_ANRESTART should not disrupt an established link any more
than before. Is the extra bit expected to have an effect beyond the
existing ANENABLE toggle on RK3568? If so, would it help to say so in the
comment above?

>
>  	return ret;
>  }
> @@ -1093,9 +1107,18 @@ static int xpcs_get_state_c37_sgmii(struct dw_xpcs *xpcs,
>  		return 0;
>  	}
>
> -	/* Clear AN complete status or interrupt */
> -	if (state->an_complete)
> -		xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
> +	if (state->an_complete) {
> +		/* Clear AN complete status or interrupt */
> +		ret = xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
> +		if (ret < 0)
> +			return ret;
> +
> +		/* Initiate the next round of AN */
> +		ret = xpcs_modify(xpcs, MDIO_MMD_VEND2, MII_BMCR, BMCR_ANRESTART,
> +				  BMCR_ANRESTART);
> +		if (ret < 0)
> +			return ret;
> +	}

[Severity: Low]
Can two pcs_get_state() callers running at the same time race on this
sequence?

xpcs_get_state_c37_sgmii() reads DW_VR_MII_AN_INTR_STS to compute
an_complete. It then clears the register and sets BMCR_ANRESTART, each in
its own MDIO transaction. The MDIO bus lock only covers one access at a
time.

Nothing serialises the callers against each other:

  phylink_resolve() -> phylink_mac_pcs_get_state()
    holds pl->state_mutex but not RTNL

  phylink_ethtool_ksettings_get() -> phylink_mac_pcs_get_state()
    holds only RTNL (MLO_AN_INBAND with no pl->phydev)

  phylink_mii_ioctl() -> phylink_mii_read() -> phylink_mac_pcs_get_state()
    holds only RTNL

One possible interleaving:

ethtool path                            phylink_resolve()
xpcs_get_state_c37_sgmii()
  read AN_INTR_STS: ANCMPLT, no link
  <delayed>
                                        xpcs_get_state_c37_sgmii()
                                          read AN_INTR_STS: ANCMPLT
                                          write AN_INTR_STS = 0
                                          set BMCR_ANRESTART
                                        new AN completes, link up
  write AN_INTR_STS = 0
  set BMCR_ANRESTART

Here, would the late write from the ethtool path discard the newly latched
ANCMPLT? Would its ANRESTART then abort the negotiation that just
succeeded?

The same interleaving looks possible against xpcs_config_aneg_c37_sgmii().
That function now also clears DW_VR_MII_AN_INTR_STS and sets
BMCR_ANENABLE | BMCR_ANRESTART while holding only state_mutex.

The commit message says:

    The latch is cleared before issuing the restart, not after: clearing it
    afterwards would discard a freshly latched ANCMPLT from the new
    negotiation.

Doesn't that reasoning assume a single caller? Before this patch, the clear
in get_state was not followed by a restart, so this race had no visible
effect.

With the restart, the result would be a spurious AN restart. That can delay
link-up, or briefly flap a link that was just reported up, until the next
negotiation completes.

>
>  	return 0;
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261005223011.1124347-1-coiaprant%40gmail.com

