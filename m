Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F29F428CE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 19:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zzfItcPbm51n9sUCqPS3pMEdP67XndcXm/lQ9tFu+D0=; b=kOgaAeO7wDLSp7sN0IqDJ/slwd
	P9tJN8rqVwAY9y5S5E+fZr3t53R5UsPpxqxUfTG+Hx6qW1ptkpfZoyXGBtc/BbysaeMu6Rr0c+6Dp
	rNt+AzMPoqjkQaPh2hlRi1u0cJ34aJWYIs74qUTyqeSLxKHGUUrHQ/6Yf3SRmeyOj/4OvI4uoyYfm
	TVcqNA0vlrTujjjNPWuWWkXWXfnZq47Lxsy7bA7/3XwI/CeDdRJ+7cGhZP4c7QsnedSLzjwFs5R8k
	UWJDSRBog8rNb8EmN58OUDFWE33iQ8GdBqcN+5po2hoQiCwrRwue9BhMAcITJ+eYmJQJfPswd6CNT
	IRcGJKMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD6Nr-00000001ZLa-3cBH;
	Wed, 15 Apr 2026 19:58:47 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD6NW-00000001ZJt-1xcU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 19:58:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zzfItcPbm51n9sUCqPS3pMEdP67XndcXm/lQ9tFu+D0=; b=WRxrdmIsc4eRiptzsUaHuJhBKe
	+UVOxQ0GJxULMlm3Gx+I9D42waGwzfpRMjNhf4nurL3eYPd1HdhdlvmLK71QFhp0NqOqCtdkcrrqZ
	KAQhYz+iCGUUYGP4vm66y5hr6xtILN/vce8MNQ5ihZahNRmB90D3K3p5wokjUq1X27a42va07e2AE
	VbYPoGKiDBDRBJXwHicnFlufKVEmimawsz2detW0wGLMlD5hmTaefp64z1J/ORfEQDff6kEnmuVOV
	aEbLNlCkIXAzRAWynK05SMR4CFYa9jXTmb6kqUCBaFr9jIU0r5fFUjp2Xw0tQMYWxTGtQE2QtPVcz
	H6quAEaA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40820)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wD6NJ-000000002SU-0s9z;
	Wed, 15 Apr 2026 20:58:13 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wD6NG-000000002VN-0Po4;
	Wed, 15 Apr 2026 20:58:10 +0100
Date: Wed, 15 Apr 2026 20:58:09 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sam Edwards <cfsworks@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Baruch Siach <baruch@tkos.co.il>,
	Serge Semin <fancer.lancer@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH net v5] net: stmmac: Prevent NULL deref when RX memory
 exhausted
Message-ID: <ad_t0aOKdC6f5Ja8@shell.armlinux.org.uk>
References: <20260415023947.7627-1-CFSworks@gmail.com>
 <ad-LAB08-_rpmMzK@shell.armlinux.org.uk>
 <ad-8q4OrOm-VtGrO@shell.armlinux.org.uk>
 <CAH5Ym4gy6g8d88-vGhe1zxoV7jNH_fXHsDSdDWC4x00H7s-3=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5Ym4gy6g8d88-vGhe1zxoV7jNH_fXHsDSdDWC4x00H7s-3=w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_125833_895599_F4861FBB 
X-CRM114-Status: GOOD (  34.35  )
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

On Wed, Apr 15, 2026 at 10:53:15AM -0700, Sam Edwards wrote:
> On Wed, Apr 15, 2026 at 9:28 AM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > On Wed, Apr 15, 2026 at 01:56:32PM +0100, Russell King (Oracle) wrote:
> > > Locally, while debugging my issues, I used this to prevent cur_rx
> > > catching up with dirty_rx:
> > >
> > >                 status = stmmac_rx_status(priv, &priv->xstats, p);
> > >                 /* check if managed by the DMA otherwise go ahead */
> > >                 if (unlikely(status & dma_own))
> > >                         break;
> > >
> > >                 next_entry = STMMAC_NEXT_ENTRY(rx_q->cur_rx,
> > >                                                priv->dma_conf.dma_rx_size);
> > >                 if (unlikely(next_entry == rx_q->dirty_rx))
> > >                         break;
> > >
> > >                 rx_q->cur_rx = next_entry;
> > >
> > > If we care about the cost of reloading rx_q->dirty_rx on every
> > > iteration, then I'd suggest that the cost we already incur reading and
> > > writing rx_q->cur_rx is something that should be addressed, and
> > > eliminating that would counter the cost of reading rx_q->dirty_rx. I
> > > suspect, however, that the cost is minimal, as cur_tx and dirty_rx are
> > > likely in the same cache line.
> 
> No, no, I like your approach better. :) It also removes the need for
> the `limit` clamp at the top of the function, so later code can assume
> limit==budget.
> 
> > > It looks like any fix to stmmac_rx() will also need a corresponding
> > > fix for stmmac_rx_zc().
> 
> I agree that stmmac_rx_zc() is likely also broken (in a similar way,
> but not similar enough to permit a "corresponding" fix), but I don't
> agree that there's a dependency relationship here. This patch is
> addressing #221010, which affects the generic/non-ZC codepath; I'm
> afraid the ZC codepath warrants its own investigation.

The code structure is identical. The only difference is what happens
to the packets.

Both paths take the NAPI limit. Both paths process up to that limit of
descriptors. The state saving / restoring is similar. The read_again
label is the same, the condition after is the same.

The ZC path differs at this point in that it will attempt to refill
every 16 descriptors that have been processed.

Both paths then read the descriptor and check the ownership.
Both paths then increment cur_rx to point to the next entry around
the ring.
Both paths then get the following descriptor pointer and prefetch
it.
Both paths then get the extended status if we're using extended
descriptors.
Both paths then handle frame discard.
Both paths then jump back to read_again if this isn't the last
segment and we have an error.
Both paths then check for error.
... and so it goes on.

The ZC path to me looks like a copy-paste-and-tweak approach to
adding support. The difference seems to be centered only around
the handling of the data buffers in the descriptors. The overall
mechanism of processing the descriptors follows the same layout
in both functions.

> > I have some further information, but a new curveball has just been
> > chucked... and I've no idea what this will mean at this stage. Just
> > take it that I won't be responding for a while.
> 
> I think I follow your meaning. Good luck getting it straightened out!

It looks like further curveballs have been thrown as a result,
destroying all "plans" for the next days/week. I have aboslutely
no ideas how much time or when I'll be able to look at anything
at the moment, so don't assume that because I find an opportunity
to send an email, everthing is back to normal.

I'll also note that over the last two days I've written several
emails on this, spent many hours on them, only to discard them
as other ideas/research and maybe even the passage of time means
they're no longer appropriate to send.

Jakub: sorry, I just *can't* review stuff on netdev with everything
that is going on, not when .... cna't complete this.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

