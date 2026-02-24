Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504B3E9B248
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 10:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WdEZMFpQwHHmjmHMSwjs7JUUFErg72GIrhiSikPqoEI=; b=n2+dOdSmFkIsKROFuw6LdHCkH2
	2PxsKvu+Qh1cSuZs0leg9GreCPpitfR9/5KSAbFgo8rjRQrqe40aObrdb580ufoljMtTcDoAjepFo
	RR32BqE0YJb2s7yU7JMWtTiXShBf7+uqGmJnAwEDg331Yxrx3t02SgAw2h7hfKwvLRh03m+HDH9ev
	hp/YyZtjvVXdrjdwaQp1cVx4Uw+ZCO7dyXFr9K3S+uNV5RW4ZeRaJPN6OUkBQA4CAWZE7lvL8U0tA
	Eqec/wHQRgfryWY9s4VAqy6xX8jpZdL0ukwG9FuiL0K6ckfKSzvRCBUJkuTPT7GFhf7BwmwbZYA3N
	+TC2JyQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vupFI-00000001oml-0JAz;
	Tue, 24 Feb 2026 10:02:24 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vupFE-00000001omO-0gXf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 10:02:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WdEZMFpQwHHmjmHMSwjs7JUUFErg72GIrhiSikPqoEI=; b=fBhIoRXhvjPAk7lxdXgmVZ4eF0
	CYw+FGwMDwqu2PAtevCfLNsu9NyKOKz0/xKV95U85oWU2Hy7s1Z2x1Hd1QNY9P+VwUrIYUTZdG0qh
	cQBKxf+uZGDhSPthm26p01JeytMS4I8YLZPsbacg8uu6MyvCAroM/DFupj3tpMwR+ENOH0YYqKV1+
	mFqJa8z5kdEMmUmdqb9WfBSDRCFp5eMhi6UAnq7olMESK+Nijbo16rClkZ+LxfvDvimBAY70bJ6T2
	5egdIJrpto1hSoHd0P6Fg0yoQ+1m6PPyoLHeDbyMBxKHVm5c8x9KgMbQBj6ta8YkUtI8x8GCODxqw
	+N2jBGmA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48140)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vupF0-0000000053j-2ZSh;
	Tue, 24 Feb 2026 10:02:06 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vupEw-000000008Gi-48I1;
	Tue, 24 Feb 2026 10:02:03 +0000
Date: Tue, 24 Feb 2026 10:02:02 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: ptp: limit n_per_out
Message-ID: <aZ13Gjav_5PYNGEN@shell.armlinux.org.uk>
References: <E1vuUvf-0000000AfhS-0lJR@rmk-PC.armlinux.org.uk>
 <aZ1uxX_fddwO7UYD@horms.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ1uxX_fddwO7UYD@horms.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_020220_504471_51726589 
X-CRM114-Status: GOOD (  33.52  )
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

On Tue, Feb 24, 2026 at 09:26:29AM +0000, Simon Horman wrote:
> On Mon, Feb 23, 2026 at 12:20:47PM +0000, Russell King (Oracle) wrote:
> > ptp_clock_ops.n_per_out sets the number of PPS outputs, which the PTP
> > subsystem uses to validate userspace input, such as the index number
> > used in a PTP_CLK_REQ_PEROUT request.
> > 
> > stmmac_enable() uses this to index the priv->pps array, which is an
> > array of size STMMAC_PPS_MAX. ptp_clock_ops.n_per_out is initialised
> > using priv->dma_cap.pps_out_num, which is a three bit field read from
> > hardware.
> > 
> > Documentation that I've checked suggests that values >= 5 are reserved,
> > but that doesn't mean such values won't appear, and if they do, we
> > can overrun the priv->pps array in stmmac_enable().
> > 
> > stmmac_ptp_register() has protection against this in its loop, but it
> > doesn't act to limit ptp_clock_ops.n_per_out.
> > 
> > Fix this by introducing a local variable, pps_out_num which is limited
> > to STMMAC_PPS_MAX, and use that when initialising the array and setting
> > priv->ptp_clock_ops.n_per_out.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> > 
> > This could be a user exploitable bug (although one has to be root
> > so the gun is already pointing at one's foot.) This is the commit
> > which introduced the problem:
> 
> Hi Russell,
> 
> From the description I assumed that for this problem to manifest
> out-of-range values would need to be turned by hardware.
> But maybe I misunderstand things.
> 
> Could you elaborate on the vector you have in mind?

priv->dma_cap.pps_out_num is initialised from hardware:

dwmac4.h:#define GMAC_HW_FEAT_PPSOUTNUM         GENMASK(26, 24)
dwmac4_dma.c:   dma_cap->pps_out_num = (hw_cap & GMAC_HW_FEAT_PPSOUTNUM) >> 24;
dwxgmac2.h:#define XGMAC_HWFEAT_PPSOUTNUM               GENMASK(26, 24)
dwxgmac2_dma.c: dma_cap->pps_out_num = (hw_cap & XGMAC_HWFEAT_PPSOUTNUM) >> 24;

As can be seen, these are three bit fields, and as noted in my commit
description, values in this field above 4 appear to be reserved, but
"reserved" doesn't mean they will never be seen.

Meanwhile, priv->pps[] is defined as:

#define STMMAC_PPS_MAX          4
        struct stmmac_pps_cfg pps[STMMAC_PPS_MAX];

The code in stmmac_ptp_register() takes account of that, and is careful
not to overrun the priv->pps[] array:

	for (i = 0; i < priv->dma_cap.pps_out_num; i++) {
		if (i >= STMMAC_PPS_MAX)
			break;
		priv->pps[i].available = true;
	}

but the code there goes on to assign it to the number of per_out:

	if (priv->dma_cap.pps_out_num)
		priv->ptp_clock_ops.n_per_out = priv->dma_cap.pps_out_num;

Core PTP code uses this to validate user input. This limits the value
that can appear in rq->perout.index for a PTP clock ->enable() call
for PTP_CLK_REQ_PEROUT.

stmmac_enable() implements this method, and with no bounds checks,
does this:

                cfg = &priv->pps[rq->perout.index];

                cfg->start.tv_sec = rq->perout.start.sec;
                cfg->start.tv_nsec = rq->perout.start.nsec;

Thus, if priv->dma_cap.pps_out_num were to indicate e.g. 7, then
there is nothing to prevent rq->perout.index being e.g. 6, and thus
overflowing the priv->pps[] array. This will likely write to other
struct stmmac_priv members if it were to occur.

So... there's two views one can take here:

- hardware will never indicate values > 4. If that's the case, then
  what's the point of the limiting check in stmmac_ptp_register() ?

- hardware might one day support more than 4 outputs, resulting in
  priv->dma_cap.pps_out_num being greater than 4. This will be a
  silent overrun until someone attempts to configure an output > 4,
  at which point non-PPS data of struct stmmac_priv will be
  overwritten.

Either code should care about values > 4, or it shouldn't. The current
code cares about it in one place but then ignores it in all other
places where the index is under userspace control, allowing the
potential for array overrun.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

