Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA62CEE33B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 17:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ix3qrQo4JTxUkNTnS7E6e3XShNCoCiRudEoAtypBRpU=; b=M06MxsfjfkBKxq84mQF1+0mwtz
	MHfe1r6umuVqtisbuTZ5LvY2IT27mJCQTV6fM+re1Ej3IowiE8ygTk/Moo60fyjrrCZwtbo+XvE/v
	hSkatX212YRBTSPHWsbrC/YbeKiX8NM5IchpiHsrQQQ/bXAzvRCbCJ5nDMt5ihIR1uXQSx5ssbyb3
	u4eU6ciGgXSCeFX2Oexa3c9D+dRR6WbP9jrnqlm8Qqiw4Y48F550XvAKi6htIS/O9sRxW/kPKMPdr
	CQMy2MiBOd/DDtoG0G9wicW2FltweoDChokaI4cWQiUCPjfr/EP+1UiMU8b8rcg4gQST2ehopbh9p
	HAk7i04w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPHv-00000000psa-1Jzt;
	Tue, 18 Nov 2025 17:14:43 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPHs-00000000prw-2Dwc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 17:14:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ix3qrQo4JTxUkNTnS7E6e3XShNCoCiRudEoAtypBRpU=; b=oo3H7YWA+QMQ7erolFEZGTdwDM
	3czWcf7ljYhymkaI7QbzlkQjYtD9nXQj/d/6sv8b0ZLU/FOGMFxgPOxAs4Uypl6K3T+1GEdQ6YuOl
	npYlXMn2ZKTyKb8C4IAJvJgr7s6QRMrdlX7kZXFrmyd2jG7YRt1fJ8gq02FOEduEIPDgfEAgjzz4u
	QxlxVc/KRGsIN5HGNBpzgo2iUAXqvwCu69IGzdZjC9iAUzGdq0VbRqA9ehqmDNFLwYUWpFs0oyldW
	AlnXKjG4GNJHMX4xp9fXiZZ0zhVfcxGDVqdXXAV9mpoV8tJG0czgIcO6/UO9IYT4nZoHpzzIfbe5e
	MEpV4xcw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54398)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vLPHY-000000003Vz-1zpn;
	Tue, 18 Nov 2025 17:14:20 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vLPHS-000000002cb-0W9K;
	Tue, 18 Nov 2025 17:14:14 +0000
Date: Tue, 18 Nov 2025 17:14:13 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Rayagond Kokatanur <rayagond@vayavyalabs.com>,
	Giuseppe CAVALLARO <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH net v2] net: stmmac: add clk_prepare_enable() error
 handling
Message-ID: <aRypZZ88K8tnh9Ha@shell.armlinux.org.uk>
References: <20251114142351.2189106-1-Pavel.Zhigulin@kaspersky.com>
 <4a3a8ba2-2535-461d-a0a5-e29873f538a4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a3a8ba2-2535-461d-a0a5-e29873f538a4@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_091440_567072_4B888782 
X-CRM114-Status: GOOD (  25.87  )
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

On Tue, Nov 18, 2025 at 03:30:09PM +0100, Paolo Abeni wrote:
> On 11/14/25 3:23 PM, Pavel Zhigulin wrote:
> > The driver previously ignored the return value of 'clk_prepare_enable()'
> > for both the CSR clock and the PCLK in 'stmmac_probe_config_dt()' function.
> > 
> > Add 'clk_prepare_enable()' return value checks.
> > 
> > Found by Linux Verification Center (linuxtesting.org) with SVACE.
> > 
> > Fixes: bfab27a146ed ("stmmac: add the experimental PCI support")
> > Signed-off-by: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
> > ---
> > v2: Fix 'ret' value initialization after build bot notification.
> > v1: https://lore.kernel.org/all/20251113134009.79440-1-Pavel.Zhigulin@kaspersky.com/
> > 
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > index 27bcaae07a7f..8f9eb9683d2b 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > @@ -632,7 +632,9 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
> >  			dev_warn(&pdev->dev, "Cannot get CSR clock\n");
> >  			plat->stmmac_clk = NULL;
> >  		}
> > -		clk_prepare_enable(plat->stmmac_clk);
> > +		rc = clk_prepare_enable(plat->stmmac_clk);
> > +		if (rc < 0)
> > +			dev_warn(&pdev->dev, "Cannot enable CSR clock: %d\n", rc);
> >  	}
> > 
> >  	plat->pclk = devm_clk_get_optional(&pdev->dev, "pclk");
> > @@ -640,7 +642,12 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
> >  		ret = plat->pclk;
> >  		goto error_pclk_get;
> >  	}
> > -	clk_prepare_enable(plat->pclk);
> > +	rc = clk_prepare_enable(plat->pclk);
> > +	if (rc < 0) {
> > +		ret = ERR_PTR(rc);
> > +		dev_err(&pdev->dev, "Cannot enable pclk: %d\n", rc);
> > +		goto error_pclk_get;
> > +	}
> 
> It looks like the driver is supposed to handle the
> IS_ERR_OR_NULL(plat->pclk) condition. This check could cause regression
> on existing setup currently failing to initialize the (optional) clock
> and still being functional.
> 
> I *think* we are better off without the added checks.

Note that the clk API permits NULL as valid. CCF checks for this
in clk_prepare() and avoids returning an error:

        if (!clk)
                return 0;

Same check in clk_enable(). So if plat->pclk is NULL, then no error
will be returned.

Places that set plat->pclk:

stmmac_probe_config_dt() - checks for error-pointers and fails. This
will cause driver probe failure.

dwc_qos_probe() - uses stmmac_pltfr_find_clk() which returns the
clk from the bulk-get or NULL. These clocks will have been obtained
using devm_clk_bulk_get_all_enabled(), which I think will return an
error if any fail, which fails the driver probe.

So, I don't think plat->pclk can be an error-pointer here.

Therefore, I don't think there's any concern with error pointers
or NULL in plat->pclk.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

