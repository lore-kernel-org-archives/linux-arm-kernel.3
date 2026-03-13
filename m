Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF7F107BCD7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 18:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+qVS4z1gzmGHTn3yGgVuL3BnpF+9hxqm2vWf7jAJi0=; b=FWjXrQaIRcuBerkmg8cdxOADjv
	z5KEL9T6i3z8a6Rqd7zFNDQofmds7QgE7YNj7+ex3EZMgxgempX8IkmD+z/E+Retbtefek4SBEqvR
	YKmtTKVN1uOgyaw9vgK/x6pOB7DWs3gozKiRvKBC2h07WnKoVtRULwoyOETmw/jkD8kXR45q3lMDn
	ics8ggWtcwRx7VGr8ieTb3o0df5s5VvrPZQ7QowaTV+0D5ULDqKDPPupQ//6HE98V18afueO5E6Yn
	QovAYWFyidsYAriiUoxiIwS8zDWXFZdVVZFhHkuYzn9O/xv81ZrchmRKDcHcI30y8i9XyOXeIaFtQ
	BY/HnagQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w17Py-00000000wAN-3prO;
	Fri, 13 Mar 2026 18:39:26 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w17Ps-00000000w8k-40vo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 18:39:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=T+qVS4z1gzmGHTn3yGgVuL3BnpF+9hxqm2vWf7jAJi0=; b=0bDTK99wzI5gcfsFCw/9TTqyvQ
	KUZ968+cdLFxfiKtAfFQu2DvC+TSzGcRZuWZwaQOmbDVWrs912dhyjQAb3YreNegieJzFI6GiVqi2
	8NAU/EW2VrGHzqA22iUborfuRt3H/nLyk0Wi0RGfv5FovQhyUzHwsAl9XC4Xvsej03OE3R6GR2ADC
	0DThwqqPwI9cUdfzTVyy0jEPziXG2PbbhPCFqsehDLbQkq1qIybH3g7d03l+WbOtz26BMUW9Pni4U
	PEAn4bKy8K0nt8ZnX2V0PgwEkREDjnzS0GSSwNJWibL81/kvi+vIyOXxcZ2nT9Uxn9HNK8rUbXQqk
	v3+eT2HQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52306)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w17Pj-000000001P2-3sGf;
	Fri, 13 Mar 2026 18:39:12 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w17Pg-000000008RL-2anq;
	Fri, 13 Mar 2026 18:39:08 +0000
Date: Fri, 13 Mar 2026 18:39:08 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Georg Gottleuber <ggo@tuxedocomputers.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Christoffer Sandberg <cs@tuxedocomputers.com>,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH net-next] net: stmmac: fix dwmac4 transmit performance
 regression
Message-ID: <abRZzNmfK13nrxhR@shell.armlinux.org.uk>
References: <E1vgY1k-00000003vOC-0Z1H@rmk-PC.armlinux.org.uk>
 <6f4929c3-d727-44a3-abc5-c33923dc69d7@tuxedocomputers.com>
 <abQ8tlRYrU5W4VaK@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abQ8tlRYrU5W4VaK@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_113921_019882_80C4333D 
X-CRM114-Status: GOOD (  34.06  )
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

On Fri, Mar 13, 2026 at 04:35:02PM +0000, Russell King (Oracle) wrote:
> On Fri, Mar 13, 2026 at 04:03:16PM +0100, Georg Gottleuber wrote:
> > Am 16.01.26 um 01:49 schrieb Russell King (Oracle):
> > > dwmac4's transmit performance dropped by a factor of four due to an
> > > incorrect assumption about which definitions are for what. This
> > > highlights the need for sane register macros.
> > > 
> > > Commit 8409495bf6c9 ("net: stmmac: cores: remove many xxx_SHIFT
> > > definitions") changed the way the txpbl value is merged into the
> > > register:
> > > 
> > >         value = readl(ioaddr + DMA_CHAN_TX_CONTROL(dwmac4_addrs, chan));
> > > -       value = value | (txpbl << DMA_BUS_MODE_PBL_SHIFT);
> > > +       value = value | FIELD_PREP(DMA_BUS_MODE_PBL, txpbl);
> > > 
> > > With the following in the header file:
> > > 
> > >  #define DMA_BUS_MODE_PBL               BIT(16)
> > > -#define DMA_BUS_MODE_PBL_SHIFT         16
> > > 
> > > The assumption here was that DMA_BUS_MODE_PBL was the mask for
> > > DMA_BUS_MODE_PBL_SHIFT, but this turns out not to be the case.
> > > 
> > > The field is actually six bits wide, buts 21:16, and is called
> > > TXPBL.
> > > 
> > > What's even more confusing is, there turns out to be a PBLX8
> > > single bit in the DMA_CHAN_CONTROL register (0x1100 for channel 0),
> > > and DMA_BUS_MODE_PBL seems to be used for that. However, this bit
> > > et.al. was listed under a comment "/* DMA SYS Bus Mode bitmap */"
> > > which is for register 0x1004.
> > > 
> > > Fix this up by adding an appropriately named field definition under
> > > the DMA_CHAN_TX_CONTROL() register address definition.
> > > 
> > > Move the RPBL mask definition under DMA_CHAN_RX_CONTROL(), correctly
> > > renaming it as well.
> > > 
> > > Also move the PBL bit definition under DMA_CHAN_CONTROL(), correctly
> > > renaming it.
> > > 
> > > This removes confusion over the PBL fields.
> > > 
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > 
> > Thank you for this patch, which significantly speeds up the transmit (by
> > more than a factor of nine on our devices with Motorcomm yt6801).
> > 
> > Unfortunately, this patch also causes DMA errors on two of our devices;
> > logs from a iperf3 test are attached.
> > 
> > Strangely enough, a third device with the same Motorcomm yt6801 does not
> > appear to be affected by the DMA errors. However, further testing is needed.
> > 
> > Do you have any ideas for further tests?
> 
> I would suggest dumping the contents of these control registers prior
> to commit 8409495bf6c9, and after this commit, comparing their values
> to identify what has changed. I'm sorry, I don't have the bandwidth to
> inspect the patches to see what may have been inadvertently changed.

Note that dwmac-motorcomm was merged between the broken commit
8409495bf6c9 and the fix 5ccde4c81e84. However, the broken commit was
merged on 12 Jan, but there were postings of dwmac-motorcomm before
this:

https://lore.kernel.org/netdev/20251014164746.50696-5-ziyao@disroot.org/

which uses the same parameters.

So, I wonder whether what you're running into is that with the
breakage, the PCIe errors are masked. However, what I will note is that
setting TxPBL to zero (as will happen with the breakage, since 32 & 1
is 0) is documented as having undefined behaviour - so it's definitely
wrong. Even if zero works there, you're operating the IP in undefined
documented territory. If you really want to test that, with commit
5ccde4c81e84 applied, set txpbl to 64, as

	FIELD_PREP(DMA_CHAN_TX_CTRL_TXPBL_MASK, 64)

will be zero because it overflows the 21:16 bitmask.

I suspect if you wind the kernel tree back to the before 8409495bf6c9,
and then apply the motorcomm support patches, you may well see these
PCIe errors - and that would rule out these changes. It would suggest
that this is a pre-existing problem, or maybe a hardware issue.

Another idea would be to try reducing txpbl to see if there's a value
where things stabilise.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

