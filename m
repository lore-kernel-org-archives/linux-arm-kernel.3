Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8646710A1E68
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 11:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DH6OZbGLz6JBjk1mkEJ81mLvO4rTm1UWMB27HtaTvcM=; b=CfLjvH623CidTBqZCDAMTX0cMV
	EO6YqTfBhynn9l0W8fT7itp8YdH4Fb+BC8zqIEWrcX/rSjowclydUcMs6O7aNCAoxGKyAm/RO0tMO
	wyHQORZDx4ODELRFpJpOdVUPuW2v1oceCZ9vWyhI5wFqctFrm+pUlfM54QtWOfZZcQP26WxIgjf8F
	Tmn0uDPsBe1uCp3w82P0YLjAwVcziqWuGsRboLDWbrNURmIwesausluqaKy5Z5lEoFCekpy2ok3KM
	sKiBUZCcTLC8RQskmfxUrmJZs+mvlvLFEiFc7lbFaVF/aSwRXKugLofrrEG94uT8yAd1Lk1VDcCd1
	LiDHULZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5igg-00000005L1A-4ARF;
	Thu, 26 Mar 2026 11:15:42 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5igc-00000005Kzo-1uQh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 11:15:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DH6OZbGLz6JBjk1mkEJ81mLvO4rTm1UWMB27HtaTvcM=; b=xW/QOBApGKxhjAHWxrKhsO4paW
	xK89CYlamTAn1AP6eLV9cfTVNJI/ewzZy4wSLYyakacZky5MH/QjCd+aKaHQx3a/Z/96yfR2syCNf
	P7Cx+SApeqNc8KkuiEUlIqS+R3iXol9E9BdXOjbht4BGl5zgx7C4J+ncxsMCrBjxcgmQxVoIMCy8O
	bmV29jQB6/srewPeRNWQ2iusgKWNQnulKaLN4O6Qqy6Jipt82HSlULinu1fjin3ig1Bef4/90SKCV
	Vuy5IGxBRdNgfYPJr7LNDBpXhCL7zIPubChZXshfZ9GXodTgobhevtupjsvNn+LWl+JYpjAcoyUPY
	P37m3+bQ==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1w5igY-00000000ajn-1kSH;
	Thu, 26 Mar 2026 12:15:34 +0100
Date: Thu, 26 Mar 2026 12:14:44 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] net: stmmac: skip VLAN restore when VLAN hash ops are
 missing
Message-ID: <lhlghwdoe6o7eecxpgbnv3e5nb7n2snk6jd6fn4wbolbqwjax4@czydhov4pv4s>
References: <20260321-vlan-restore-error-v2-1-45cf56a5223d@mmpsystems.pl>
 <abb1c779-b306-42f8-b2b1-aa56bfcebe1b@bootlin.com>
 <TY7P301MB198407F8C0280B991334304ED356A@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY7P301MB198407F8C0280B991334304ED356A@TY7P301MB1984.JPNP301.PROD.OUTLOOK.COM>
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_041539_409040_067549B6 
X-CRM114-Status: GOOD (  33.12  )
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

On Thu, Mar 26, 2026 at 08:07:33AM +0000, Ovidiu Panait wrote:
> Hi,
> 
> > 
> > Hi,
> > 
> > On 21/03/2026 06:38, Michal Piekos wrote:
> > > stmmac_vlan_restore() unconditionally calls stmmac_vlan_update() when
> > > NETIF_F_VLAN_FEATURES is set. On platforms where priv->hw->vlan (or
> > > ->update_vlan_hash) is not provided, stmmac_update_vlan_hash() returns
> > > -EINVAL via stmmac_do_void_callback(), resulting in a spurious
> > > "Failed to restore VLANs" error even when no VLAN filtering is in use.
> > >
> > > Check presence of VLAN HW FILTER flags before stmmac_vlan_update().
> > >
> > > Tested on Orange Pi Zero 3.
> > >
> > > Fixes: bd7ad51253a7 ("net: stmmac: Fix VLAN HW state restore")
> > > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > > ---
> > > This patch fixes a noisy "Failed to restore VLANs" message on platforms
> > > where stmmac VLAN hash ops are not implemented.
> > > stmmac_vlan_restore() calls stmmac_vlan_update() without checking for
> > > VLAN hash ops presence which results in -EINVAL.
> > 
> > I've been seeing the same message on socfpga. My two cents on that is
> > that this error messages doesn't bring anything to the table anyways.
> > 
> > As Russell explains, it's either triggered when the vlan op isn't
> > implemented (the stmmac callback macro stuff turns that into a -EINVAL),
> > or when some capabilities arent present. All in all, it's always stuff
> > that users can't really do anything about, as it's HW limitations, I
> > think we can simply discard this message.
> > 
> > Also, nothing actually checks what stmmac_vlan_restore() returns, so we
> > might as well return void ?
> > 
> 
> I think this is the best solution until the VLAN capabilities handling is
> cleaned up.
> 
> Michal, please let me know if you will be handling this in v3 or I should
> send a fix for it.
> 

I will provide the fix for it latest during the weekend.

Michal

> Thanks,
> Ovidiu
> 
> > Maxime
> > 
> > > ---
> > > Changes in v2:
> > > - Replace check for hash ops with check for HW FILTER flags
> > > - Link to v1: https://lore.kernel.org/r/20260314-vlan-restore-error-v1-
> > 1-4fc6c3e2115f@mmpsystems.pl
> > > ---
> > >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > index 6827c99bde8c..cfc0ce9cec9c 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > @@ -6863,7 +6863,8 @@ static int stmmac_vlan_restore(struct stmmac_priv
> > *priv)
> > >  {
> > >  	int ret;
> > >
> > > -	if (!(priv->dev->features & NETIF_F_VLAN_FEATURES))
> > > +	if (!(priv->dev->features &
> > > +	      (NETIF_F_HW_VLAN_CTAG_FILTER | NETIF_F_HW_VLAN_STAG_FILTER)))
> > >  		return 0;
> > >
> > >  	if (priv->hw->num_vlan)
> > >
> > > ---
> > > base-commit: 42bddab0563fe67882b2722620a66dd98c8dbf33
> > > change-id: 20260314-vlan-restore-error-f8b3a1c7f50a
> > >
> > > Best regards,
> 

