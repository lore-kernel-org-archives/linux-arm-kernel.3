Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E489EA811B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 14:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H1rJVDNfzQ3s3Z60p+VWWkPc+ZTadoIhN4O4/sbN3dw=; b=XzVLidOOUhaBUcLrA8pxDyuTNs
	qa8MFmJCyxKtzuvRB+JmMcbIDT4Uv8oqb0iWdwLLwFIkSg2x265bMNEcJVrXtQEgJzVRNDCf8klpG
	YJ0puUdngo9w1IBNYbYXgdEXCMjygwIqhzYFt//1FFLQv1/geHo+h/IweGk/luOVHl0EH6uIJtVMl
	2GQjgnHgqeWcpzhOJsTjPUKKHQneCcL5irJU1bJj50Qt1+9mEjhvmmaPR+C5sBw2y9VuHGw44n17f
	9Pl8VPp4kiEDNeD0g0wPiBhr2r0MzqB2wRf6tdwN/PRGVGeGC8fUms2RETlvnrBPPRVqdjRUkrc/n
	5zn89V3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpoma-0000000H3MO-3rSM;
	Tue, 10 Feb 2026 14:32:04 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpomY-0000000H3M3-2xXH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 14:32:04 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9DE41E47;
	Tue, 10 Feb 2026 15:31:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770733872;
	bh=ohaP3f+gViFDezM3994yui/Gxiyd8URY9/WYP1iyMS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LJyeDzAt0bLbhVjCL4vTlxiUHIIOka4k7W80G+K1eI/qEJnnw7IZsvmRkLS0IZ5eu
	 /P8P1k3ciHGtjc2cvrrwRYzYsLptM/BHmO+U0t/nt8mLaHFwUpw4QIFjfZAOIxdget
	 ihtxzCPs/wRtvB5QYVaBc+j8pypFa1LYi79R+674=
Date: Tue, 10 Feb 2026 16:31:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, imx@lists.linux.dev,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Clark Wang <xiaoning.wang@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frank Li <Frank.Li@nxp.com>, Heiko Schocher <hs@denx.de>,
	Jakub Kicinski <kuba@kernel.org>, Joy Zou <joy.zou@nxp.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Martyn Welch <martyn.welch@collabora.com>,
	Mathieu Othacehe <othacehe@gnu.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Richard Hu <richard.hu@technexion.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Wei Fang <wei.fang@nxp.com>,
	Xiaoliang Yang <xiaoliang.yang_1@nxp.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] net: stmmac: imx: Disable EEE
Message-ID: <20260210143157.GM2405149@killaraus.ideasonboard.com>
References: <20260209202155.2388099-1-laurent.pinchart@ideasonboard.com>
 <aYsj5IayQd3NRflL@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aYsj5IayQd3NRflL@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_063202_910038_CFCA2347 
X-CRM114-Status: GOOD (  35.45  )
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

On Tue, Feb 10, 2026 at 12:26:12PM +0000, Russell King (Oracle) wrote:
> On Mon, Feb 09, 2026 at 10:21:55PM +0200, Laurent Pinchart wrote:
> > The i.MX8MP suffers from an interrupt storm related to the stmmac and
> > EEE. A long and tedious analysis ([1]) concluded that the SoC wires the
> > stmmac lpi_intr_o signal to an OR gate along with the main dwmac
> > interrupts, which causes an interrupt storm for two reasons.
> > 
> > First, there's a race condition due to the interrupt deassertion being
> > synchronous to the RX clock domain:
> > 
> > - When the PHY exits LPI mode, it restarts generating the RX clock
> >   (clk_rx_i input signal to the GMAC).
> > - The MAC detects exit from LPI, and asserts lpi_intr_o. This triggers
> >   the ENET_EQOS interrupt.
> > - Before the CPU has time to process the interrupt, the PHY enters LPI
> >   mode again, and stops generating the RX clock.
> > - The CPU processes the interrupt and reads the GMAC4_LPI_CTRL_STATUS
> >   registers. This does not clear lpi_intr_o as there's no clk_rx_i.
> > 
> > An attempt was made to fixing the issue by not stopping RX_CLK in Rx LPI
> > state ([2]). This alleviates the symptoms but doesn't fix the issue.
> > Since lpi_intr_o takes four RX_CLK cycles to clear, an interrupt storm
> > can still occur during that window. In 1000T mode this is harder to
> > notice, but slower receive clocks cause hundreds to thousands of
> > spurious interrupts.
> > 
> > Fix the issue by disabling EEE completely on i.MX8MP.
> > 
> > [1] https://lore.kernel.org/all/20251026122905.29028-1-laurent.pinchart@ideasonboard.com/
> > [2] https://lore.kernel.org/all/20251123053518.8478-1-laurent.pinchart@ideasonboard.com/
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > This patch depends on https://lore.kernel.org/all/E1vNUjC-0000000FhjR-0h6P@rmk-PC.armlinux.org.uk/
> 
> ... and a few other patches as well. There is also a conflicting change
> in net-next:
> 
> commit dc6597fab3e3d291da9e0b4c6f7da01a5a863e80
> Author: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> Date:   Tue Jan 20 21:30:04 2026 +0100
> 
>     net: stmmac: dwmac-imx: keep preamble before sfd on i.MX8MP
> 
> > base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
> 
> This is v6.19
> 
> > prerequisite-patch-id: 9229185bf29c206923075a0450e763664af050bb
> > prerequisite-patch-id: e17c3f8a7cb2b18fc0c3c6250773a9680bdabdba
> > prerequisite-patch-id: a3c3f8b08fd66ee3ccce632aad3f4a3c21c92718
>
> I have no idea what these are. These don't exist in Linus', net, nor
> net-next trees. I'm not sure what generates these, but they are useless
> unless they also indicate the summary line for the commit in question,
> so that one can have some clue what change they're referring to.

The first two are mistakes, I had two unrelated DT changes at the base of my
branch that I needed for testing, and I forgot to rebase before running
git-format-patch. They can be ignored.

The last one is your patch
(https://lore.kernel.org/all/E1vNUjC-0000000FhjR-0h6P@rmk-PC.armlinux.org.uk/).
Note that the value is the patch-id, not the commit ID.

> While this is a fix, I think you previously suggested that this isn't
> a regression, which suggests it should be merged in net-next (currently
> closed due to the merge window) rather than net.

I think I was first notified of the issue more than a year ago, so I
would indeed not count it as a regression. net-next is fine with me.

> Also, referring to another patch doesn't get it applied - netdev
> workflow uses patchwork, and patches to be applied need to be there.
> If patches depend on each other, they need to be submitted as a
> series. So either I need to pick up your patch and send it along
> with mine, or you need to pick up my patch and send it with yours.
> We need to come to agreement on who is submitting it.

I'm happy to submit a series with both, rebased on top of net-next to
handle the conflict you pointed out. Is that fine with you ?

-- 
Regards,

Laurent Pinchart

