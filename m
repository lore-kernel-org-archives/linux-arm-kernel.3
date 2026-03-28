Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5D110F3DE9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 17:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9Hfk5LT2CR+gwGA+kiCrqo/JJcx85QeXRTI7J2zjwk=; b=qt10jjKja/rZoE5o1q2rIefts+
	17u8QklZOuTJ+mm5HyE1U69GPW8py+BbJxe/RtZWY/1ylCxD4wZPUHX67pGTptxX5CkZr7uYZOiJv
	UJAaOLbObMO0cH6eEAEO2Wm34rBfDQayIKJpZcob1MHI6T+YCEq8IJ3FU7uchppsnIQutkH1p5R42
	wu8dUIxPj7DVLzHDjhwGRymOu90WsNou3UuQJ2jmSmzeBsxM2Zy8DjjTS/jH5qZZkauHcZSPeAncN
	xe1U3bMuIH59Yqfubec2uVB3mPbYE0Y6q39xr2wQ2/qr5EVhgd1OP3jCl/p99HHWtx5/ZB4mlQvPO
	mx2gWqCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6XQN-000000099IQ-1lCY;
	Sat, 28 Mar 2026 17:26:15 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6XQK-000000099Hw-1UrM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 17:26:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=n9Hfk5LT2CR+gwGA+kiCrqo/JJcx85QeXRTI7J2zjwk=; b=sPXXa6JDfYwpjzfZmoWh8H9a6X
	1Ia+N8IOKORvp8HcU3HMLlHzYyG+EKlq7ywX4KOo4hdbt8U2tx+J/USGKC+sTXZU+mx1TPst4BTTe
	MyvkuzLk4rUNBt4AVUAhCiWTre1FZbX8XeEGYL+CVKuPKKvR2ouKQ4GUxZnLw1PUZlO67/ZY4eSby
	4NMqG6C2drl8YEq1hLfVakpgttvxZTP6YbKHjcKMWo0OkO+luUu2X8/LCHOQqfAnh2ohmwn9Eex/i
	VprMw/DJSXyYphC1zCUh+8DuhBQ4l9w9MXacjMTjpHMzfAxPeeTL5VdxSK4ElEWBRzjMirq7sP64u
	eqmWS+Rw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49404)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w6XQA-000000007Jc-0fDn;
	Sat, 28 Mar 2026 17:26:02 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w6XQ6-000000000pe-3OlK;
	Sat, 28 Mar 2026 17:25:58 +0000
Date: Sat, 28 Mar 2026 17:25:58 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Ong Boon Leong <boon.leong.ong@intel.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 2/2] net: stmmac: simplify GSO/TSO test in
 stmmac_xmit()
Message-ID: <acgPJgW9r0l952qu@shell.armlinux.org.uk>
References: <acZQaDeCoib5S5UA@shell.armlinux.org.uk>
 <E1w63fl-0000000E3Vb-3JkY@rmk-PC.armlinux.org.uk>
 <aceQRSc5o4D-HHmq@shell.armlinux.org.uk>
 <acegAqUb-Dzy87d8@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acegAqUb-Dzy87d8@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_102612_853270_A2E55F23 
X-CRM114-Status: GOOD (  50.05  )
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

On Sat, Mar 28, 2026 at 09:31:46AM +0000, Russell King (Oracle) wrote:
> On Sat, Mar 28, 2026 at 08:24:37AM +0000, Russell King (Oracle) wrote:
> > On Fri, Mar 27, 2026 at 09:40:09AM +0000, Russell King (Oracle) wrote:
> > > The test in stmmac_xmit() to see whether we should pass the skbuff to
> > > stmmac_tso_xmit() is more complex than it needs to be. This test can
> > > be simplified by storing the mask of GSO types that we will pass, and
> > > setting it according to the enabled features.
> > > 
> > > Note that "tso" is a mis-nomer since commit b776620651a1 ("net:
> > > stmmac: Implement UDP Segmentation Offload"). Also note that this
> > > commit controls both via the TSO feature. We preserve this behaviour
> > > in this commit.
> > > 
> > > Also, this commit unconditionally accessed skb_shinfo(skb)->gso_type
> > > for all frames, even when skb_is_gso() was false. This access is
> > > eliminated.
> > > 
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > 
> > AI review of this patch regurgitates Jakub's point that was discussed.
> > 
> > > @@ -3700,7 +3700,7 @@ static int stmmac_hw_setup(struct net_device *dev)
> > >  	stmmac_set_rings_length(priv);
> > >  
> > >  	/* Enable TSO */
> > > -	if (priv->tso) {
> > > +	if (priv->gso_enabled_types) {
> > >  		for (chan = 0; chan < tx_cnt; chan++) {
> > >  			struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[chan];
> > >  
> > 
> > ...
> > 
> > > @@ -7828,7 +7834,7 @@ static int __stmmac_dvr_probe(struct device *device,
> > >  		ndev->hw_features |= NETIF_F_TSO | NETIF_F_TSO6;
> > >  		if (priv->plat->core_type == DWMAC_CORE_GMAC4)
> > >  			ndev->hw_features |= NETIF_F_GSO_UDP_L4;
> > > -		priv->tso = true;
> > > +		stmmac_set_gso_types(priv, true);
> > 
> > Clearly, the issue it is regurgitating has been there for a long time
> > and isn't a new issue introduced by this patch.
> > 
> > AI needs to stop doing this, because it is encouraging multiple changes
> > in a single patch, which is against the normal kernel process.
> > 
> > As already pointed out, there are multiple issues with stmmac TSO
> > support, particularly with glue drivers that enable TSO on some
> > queues/channels and not others, since netdev core TSO support is
> > global across all channels.
> > 
> > So, won't the AI response in this patch - it's just another pre-
> > existing issue that needs fixing in a separate patch.
> 
> Looking at the TSO vs TBS issue (which precludes the use of TSO on a
> channel in stmmac) I can't find an obvious reason for this in the
> available documentation. However, unfortunately, iMX8MP doesn't support
> TSO, so the TSO bits are elided there, but does support TBS (needing
> enhanced descriptors to be enabled). STM32MP151 on the other hand
> supports TSO but not TBS, and thus fails to mention anything about
> enhanced descriptors or TBS.
> 
> When stmmac_enable_tbs() enables TBS, it isn't actually enabling a
> feature specific bit, but switching the channel to use enhanced
> descriptor format. This format extends the basic descriptors by
> placing four extra 32-bit words before the basic descriptor.
> 
> Looking at the enhanced normal descriptor format for TDES3, it
> indicates that the format includes bit 18 in the control field, which
> is the TSE bit (TCP segmentation enable for this packet.) So, it seems
> it's not a limitation of the descriptor format.
> 
> So, either "TSO and TBS cannot co-exist" is incorrect, or there is a
> hardware limitation that isn't documented between these two manuals.
> 
> One other interesting point is that stmmac_tso_xmit() seems to
> handle the case where TSO and TBS are enabled on the channel:
> 
>                 if (tx_q->tbs & STMMAC_TBS_AVAIL)
>                         mss_desc = &tx_q->dma_entx[tx_q->cur_tx].basic;
>                 else
>                         mss_desc = &tx_q->dma_tx[tx_q->cur_tx];
> 
>                 stmmac_set_mss(priv, mss_desc, mss);
> ...
>         if (tx_q->tbs & STMMAC_TBS_AVAIL)
>                 desc = &tx_q->dma_entx[first_entry].basic;
>         else
>                 desc = &tx_q->dma_tx[first_entry];
>         first = desc;
> 
> etc.
> 
> Avoiding enabling TSO for a TBS channel was added by this commit:
> 
> commit 5e6038b88a5718910dd74b949946d9d9cee9a041
> Author: Ong Boon Leong <boon.leong.ong@intel.com>
> Date:   Wed Apr 21 17:11:49 2021 +0800
> 
>     net: stmmac: fix TSO and TBS feature enabling during driver open
> 
>     TSO and TBS cannot co-exist and current implementation requires two
>     fixes:
> 
>      1) stmmac_open() does not need to call stmmac_enable_tbs() because
>         the MAC is reset in stmmac_init_dma_engine() anyway.
>      2) Inside stmmac_hw_setup(), we should call stmmac_enable_tso() for
>         TX Q that is _not_ configured for TBS.
> 
>     Fixes: 579a25a854d4 ("net: stmmac: Initial support for TBS")
>     Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
>     Signed-off-by: David S. Miller <davem@davemloft.net>
> 
> which doesn't really explain the background, and leaves all the TBS
> cruft in the TSO transmit path (nothing like properly updating the
> driver, eh? No wonder stmmac is such a mess!)

The more I look at this, the more I'm convinced this commit is
incorrect, even if it is the case that the hardware doesn't support
TSO and TBS together.

When TSO is enabled (NETIF_F_TSO set in the netif's features) then
the core net layer can submit skbuffs that need to be processed using
TSO.

If such a skbuff hits a channel that has TSO disabled (because the
above commit caused:

	stmmac_enable_tso(priv, priv->ioaddr, 1, chan);

not to be called) then the TSE bit in the transmit control register
will not be set, thereby disabling TSO on this particular channel.

However, stmmac_xmit() will still call through to stmmac_tso_xmit()
which will dutifully populate the transmit ring with descriptors that
assume TSE has been set in the transmit control register.

It seems to me _that_ is even more broken than "the hardware doesn't
support TSO and TBS together" - I have no idea what the stmmac hardware
does if it encounters descriptors with TSE set but TSE is disabled in
the transmit control register. My guess would be it would ignore the
TSE bit in the descriptor and assume that it's one very large packet
to be sent - and either error out because it's longer than the
maximum the hardware can support or it will just try to transmit it
anyway.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

