Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D8BEC01B1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrsfFTGfYyLKxF07ePPhHcfSutGOTt7NkUKvGum/24k=; b=Lqv2Vt/Yddkap3UvEXsckONeFo
	haTrU69Kz2wrfkjNn+AySyiEzug6meYTpOXg+M7d/ykjEMJIhWeD518IMoi+rlfGYyCFRL/b1ELxm
	aqVku4eBPcDbSnyq6N+f4sJFC5uRI/j+i259c1pCeJ3fhKm5P0LinsnXFgMOGA5hrIBRnG3LWeiY4
	GzMtE7dXkci4uKfM82JbpbU5wxIyWduZhgLbpM7i7yUdwwNnEQKcPGYisvsQsECAiKWHukvSbJDBp
	AJ3mxxoh3xNAtEalkNJdCvV7iQz3GXlQ85F046gfcrVr2B8wfgz1ktPuAGn/gZFbjuCSC4ayeEkhb
	JSLr5LMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4c0k-0000000GQEo-0fsk;
	Mon, 23 Mar 2026 09:55:50 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4c0i-0000000GQET-1597
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 09:55:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lrsfFTGfYyLKxF07ePPhHcfSutGOTt7NkUKvGum/24k=; b=KSobhkUH1DcN4nToJvqyD5yAUQ
	/YpHvXdbSzU/y6TgMZ2xtyfj7RPYzfRRFYJvfvJV8J5aiOWZgDg8+Otj13FDeCHV8cyXcj6+gVISn
	Gp4j/vwmO0HAIkQSvho4ojB8Cgnow6dWrQ8onHswqgD55iniIYO9q8WKP/M6Pywi3EkY5I4Zv2Zlc
	Ua/Yy8CL4gLXFmaIx4CdSXbes8YbsXVCJiC+jHf4ODYwLNia5zNHTJrLJobSaLhf1VGO+gw3NHXJU
	BrNyURQGWUCtEdKSVuVDuWRkDoObJqSlntuD5RJHQOZuDT6VsZjm1Fu0tj4lLxOAuljroKiHj9FE6
	tHgTrPqA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57086)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w4c0X-000000000GI-2nAx;
	Mon, 23 Mar 2026 09:55:37 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w4c0W-000000003w9-0ocX;
	Mon, 23 Mar 2026 09:55:36 +0000
Date: Mon, 23 Mar 2026 09:55:36 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: netdev@vger.kernel.org, imx@lists.linux.dev,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frank Li <Frank.Li@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
	Joy Zou <joy.zou@nxp.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/2] net: stmmac: provide flag to disable EEE
Message-ID: <acEOGMHfYsxv3GOk@shell.armlinux.org.uk>
References: <20260323093933.1785583-1-laurent.pinchart@ideasonboard.com>
 <20260323093933.1785583-2-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323093933.1785583-2-laurent.pinchart@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_025548_317607_2D547777 
X-CRM114-Status: GOOD (  19.79  )
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

On Mon, Mar 23, 2026 at 11:39:32AM +0200, Laurent Pinchart wrote:
> From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> 
> Some platforms have problems when EEE is enabled, and thus need a way
> to disable stmmac EEE support. Add a flag before the other LPI related
> flags which tells stmmac to avoid populating the phylink LPI
> capabilities, which causes phylink to call phy_disable_eee() for any
> PHY that is attached to the affected phylink instance.
> 
> iMX8MP is an example - the lpi_intr_o signal is wired to an OR gate
> along with the main dwmac interrupts. Since lpi_intr_o is synchronous
> to the receive clock domain, and takes four clock cycles to clear, this
> leads to interrupt storms as the interrupt remains asserted for some
> time after the LPI control and status register is read.
> 
> This problem becomes worse when the receive clock from the PHY stops
> when the receive path enters LPI state - which means that lpi_intr_o
> can not deassert until the clock restarts. Since the LPI state of the
> receive path depends on the link partner, this is out of our control.
> We could disable RX clock stop at the PHY, but that doesn't get around
> the slow-to-deassert lpi_intr_o mentioned in the above paragraph.
> 
> Previously, iMX8MP worked around this by disabling gigabit EEE, but
> this is insufficient - the problem is also visible at 100M speeds,
> where the receive clock is slower.
> 
> There is extensive discussion and investigation in the thread linked
> below, the result of which is summarised in this commit message.
> 
> Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Closes: https://lore.kernel.org/r/20251026122905.29028-1-laurent.pinchart@ideasonboard.com
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

As you are sending this on my behalf, you need to add your s-o-b after
mine:

 Any further SoBs (Signed-off-by:'s) following the author's SoB are from
 people handling and transporting the patch, but were not involved in its
 development. SoB chains should reflect the **real** route a patch took
 as it was propagated to the maintainers and ultimately to Linus, with
 the first SoB entry signalling primary authorship of a single author.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

