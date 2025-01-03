Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D0EE7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 10:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZan5g6f2SEgDlQXO6n1vhyWtzmWRowd6YIvg4wtslk=; b=vYqWhnaa6ymma8SsT3aQIkXZrP
	SX0QPoZe6OaNYG/dYLOigBMoX57tbXy36JG62QtwyfMKIozC4mdE4ON/KNWBKeWrFdGCg6SjPeBMv
	eMkQoQnBvkmBwWSIR1kIHWWBD7vZncPZsSars4Ku3/6kUnTw2EMX/GbOVVdK9RsXlRb3ONx+GB3LY
	RpdY6pu4KLc4nPXXgJT+5H2cXwQsdIXyWnG+f2mK/JeoiCKyXsJRN007nsl0DTl5pMvhM4VtqVreg
	keG1XekI+AK9hBYqNKprIKMdFS0aL6B/Z5CI/YZMnRYD8nu7Ex2m7LzHNAYPuq8F3Rn6gQ5Sl0bP3
	DLK/CfCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTfMN-0000000Cm2S-0YAp;
	Fri, 03 Jan 2025 10:56:55 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTfL9-0000000Clhs-2gDE;
	Fri, 03 Jan 2025 10:55:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YZan5g6f2SEgDlQXO6n1vhyWtzmWRowd6YIvg4wtslk=; b=uHOfGNRRPNpgL63qIKRxTA+fJg
	K71jZSfgd1QBebFOFk2VCg/KgVbzEXJgB3NHC1iWi0Y6kGZckE+SvokfgS4yIB5q3GLLmemlQWJNZ
	1MvHN+aUPxcf1WtRtPjjT5jwtuMF3NwPpBRuvrKnmJVRJ4jbYMNYm3+beTMOlD8TsKvdiUpUahayT
	Nmatxz5UBnSEB8DVA+ne4CD3tzYrM4ZW/QcypKI4bVqPTm3ih2j38CETGDcbLZZp5H0rXCFh94qyO
	oUlD3Asp17eTwL9dyQmVIchVw0idDFi+bM1CAgmgnRG0KzHcjgJMq0/yMMqzjZXx3xUJRor5GofNP
	iamZ1aHQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44782)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tTfKp-0002yX-1M;
	Fri, 03 Jan 2025 10:55:19 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tTfKl-0001Ft-0Q;
	Fri, 03 Jan 2025 10:55:15 +0000
Date: Fri, 3 Jan 2025 10:55:14 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 2/3] net: pcs: pcs-mtk-lynxi: implement
 pcs_inband_caps() method
Message-ID: <Z3fCEnQvmgXaOGB7@shell.armlinux.org.uk>
References: <Z1F1b8eh8s8T627j@shell.armlinux.org.uk>
 <E1tJ8NR-006L5P-E3@rmk-PC.armlinux.org.uk>
 <Z1UMEnlZ_ivTsru5@pidgin.makrotopia.org>
 <Z1VjJ8ago-HetCxi@shell.armlinux.org.uk>
 <Z3aGDHU2TLV_YtZW@pidgin.makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3aGDHU2TLV_YtZW@pidgin.makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_025539_678772_C4F122D1 
X-CRM114-Status: GOOD (  32.48  )
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

On Thu, Jan 02, 2025 at 12:26:52PM +0000, Daniel Golle wrote:
> On Sun, Dec 08, 2024 at 09:13:11AM +0000, Russell King (Oracle) wrote:
> > On Sun, Dec 08, 2024 at 03:01:38AM +0000, Daniel Golle wrote:
> > > On Thu, Dec 05, 2024 at 09:42:29AM +0000, Russell King (Oracle) wrote:
> > > > Report the PCS in-band capabilities to phylink for the LynxI PCS.
> > > > 
> > > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > > ---
> > > >  drivers/net/pcs/pcs-mtk-lynxi.c | 16 ++++++++++++++++
> > > >  1 file changed, 16 insertions(+)
> > > > 
> > > > diff --git a/drivers/net/pcs/pcs-mtk-lynxi.c b/drivers/net/pcs/pcs-mtk-lynxi.c
> > > > index 4f63abe638c4..7de804535229 100644
> > > > --- a/drivers/net/pcs/pcs-mtk-lynxi.c
> > > > +++ b/drivers/net/pcs/pcs-mtk-lynxi.c
> > > > @@ -88,6 +88,21 @@ static struct mtk_pcs_lynxi *pcs_to_mtk_pcs_lynxi(struct phylink_pcs *pcs)
> > > >  	return container_of(pcs, struct mtk_pcs_lynxi, pcs);
> > > >  }
> > > >  
> > > > +static unsigned int mtk_pcs_lynxi_inband_caps(struct phylink_pcs *pcs,
> > > > +					      phy_interface_t interface)
> > > > +{
> > > > +	switch (interface) {
> > > > +	case PHY_INTERFACE_MODE_1000BASEX:
> > > > +	case PHY_INTERFACE_MODE_2500BASEX:
> > > > +	case PHY_INTERFACE_MODE_SGMII:
> > > > +	case PHY_INTERFACE_MODE_QSGMII:
> > > 
> > > QSGMII is not supported by this PCS.
> > 
> > Well...
> > - lynx_pcs_get_state(), lynx_pcs_config(), and lynx_pcs_link_up()
> >   include QSGMII in their case statements.
> > - lynx_pcs_config_giga() refers to QSGMII in a comment, grouping it
> >   with SGMII configuration.
> 
> These functions are in pcs-lynx.c and not in pcs-mtk-lynxi.c.
> There is no reference to QSGMII anywhere in pcs-mtk-lynxi.c, what made
> you assume it would be supported?
> 
> > 
> > I think if the hardware doesn't support QSGMII, these references to it
> > should be removed?
> > 
> > I also think that adding a .pcs_validate() method would be a good idea
> > to reject interface modes that the PCS does not support.
> 
> I can add the pcs_validate function and send the patch doing that to be
> included in net-next.

With the addition of the supported_interfaces bitmap, there's no point
if all the validation function is doing is checking the interfaces.

The supported_interfaces bitmap takes over that in core phylink code
(and if a MAC supplies a PCS for an interface that is in the MAC's
supported_interfaces bitmap but does not have the interface bit set in
the PCS's supported_interfaces, phylink will produce a kernel message
at error severity before .pcs_validate is called.

At a point in the near future, I will be making the PCS
supported_interfaces mandatory - but in the mean time this patch set
makes it optional.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

