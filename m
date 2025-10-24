Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA72CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 10:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=St90YPnsStMZ+8WdvRz0HPPenligqgpjDzaMg+CNa44=; b=eCzCZO5LyCOcPbidwyN2Htxr/J
	LcwzWMr6tlh5xD5UgvuTyNchen6UdwYC9J2P4rFglvbSeRHxAJFPbzgQiups1+HHLWCNdgRpmd2e1
	CmwjzpUDbQTPHYQWVXj36xl36lkL8LUjE1yqpWCQcDKswoXvdKWypZ9vNnSagOXxD5ZZK+3WEGB8k
	r3Z6pqrnG/XvXHfo+qNnsE9inHhiuP1eh/z4dMyzfIKskNo+lzlWFJjhpA0phe0nn0c/BRGMEi1PH
	TNA2uDlgxJB5Zffqlz5xnmPVWoSK4UW+y2dTtQsXeX4NU3LyciXSqgaycKWNuYOQ42c3U6kKQz3PC
	i5JEzM+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCFLw-000000094Y8-1w1y;
	Fri, 24 Oct 2025 10:49:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCFLt-000000094Wv-047m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 10:48:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=St90YPnsStMZ+8WdvRz0HPPenligqgpjDzaMg+CNa44=; b=0RI7a9/r0zJ+F/hwqE74pmKjfc
	HybwQpD3cclhhl9ZA6zhGD/G7u5/Uj29NVHdGAPqYUtoWC9Az8sjpbvM9NK7nROw3vTU7ttqLtXrB
	Lg4Ykv78Mjp81NuN3j9s5itvmdCVFlxsSYgEPSE8StTB/UNHIO+saNGpYwm94Oq7jR52u9sk49y1R
	1EJ1pgip2mnwmtUI9OLG0QS7bnBGAm+tJxIF2Hb/Pw5dynnSt7/gQ73Ikn5jKzEVHWK9qdQIaEwjA
	ErLm79mHxFQWnTsmDl2wQhlqLWReETrFaraFxHxY6gnqIQdhzKAqQenFfc8KiMO0QtQvfYdbvlf7L
	9WBBTNOQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43764)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vCFLd-000000007RV-2TKn;
	Fri, 24 Oct 2025 11:48:41 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vCFLX-000000002dR-44CK;
	Fri, 24 Oct 2025 11:48:35 +0100
Date: Fri, 24 Oct 2025 11:48:35 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
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
	Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH net-next 0/8] net: stmmac: hwif.c cleanups
Message-ID: <aPtZg_v3H53hiQXo@shell.armlinux.org.uk>
References: <aPn3MSQvjUWBb92P@shell.armlinux.org.uk>
 <28d91eca-28dd-4e5b-ae60-021e777ee064@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28d91eca-28dd-4e5b-ae60-021e777ee064@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_034857_375220_91874696 
X-CRM114-Status: GOOD (  22.18  )
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

On Fri, Oct 24, 2025 at 08:44:07AM +0200, Maxime Chevallier wrote:
> Hello Russell,
> 
> On 23/10/2025 11:36, Russell King (Oracle) wrote:
> > Hi,
> > 
> > This series cleans up hwif.c:
> > 
> > - move the reading of the version information out of stmmac_hwif_init()
> >   into its own function, stmmac_get_version(), storing the result in a
> >   new struct.
> > 
> > - simplify stmmac_get_version().
> > 
> > - read the version register once, passing it to stmmac_get_id() and
> >   stmmac_get_dev_id().
> > 
> > - move stmmac_get_id() and stmmac_get_dev_id() into
> >   stmmac_get_version()
> > 
> > - define version register fields and use FIELD_GET() to decode
> > 
> > - start tackling the big loop in stmmac_hwif_init() - provide a
> >   function, stmmac_hwif_find(), which looks up the hwif entry, thus
> >   making a much smaller loop, which improves readability of this code.
> > 
> > - change the use of '^' to '!=' when comparing the dev_id, which is
> >   what is really meant here.
> > 
> > - reorganise the test after calling stmmac_hwif_init() so that we
> >   handle the error case in the indented code, and the success case
> >   with no indent, which is the classical arrangement.
> > 
> >  drivers/net/ethernet/stmicro/stmmac/common.h |   3 +
> >  drivers/net/ethernet/stmicro/stmmac/hwif.c   | 166 +++++++++++++++------------
> >  2 files changed, 98 insertions(+), 71 deletions(-)
> 
> I didn't have the bandwidth to do a full review, however I ran tests
> with this series on dwmac-socfpga and dwmac-stm32, no regressions found.
> 
> For the series,
> 
> Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks, it's good to have someone else testing. I do need to post v2
with some tweaks to patches 2, 3 and 4 due to a typo that gets
eliminated in later patches. "verison*" -> "version*" in one instance.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

