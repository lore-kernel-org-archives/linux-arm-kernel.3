Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F43CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 09:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y0ebg5JYBQo93J+yDyT483SON+/adfVmrWmE2TfO5rU=; b=JfW5JJDlKprV9+DvSx5DfensZF
	TLPXH/64Xt3wMO06jCS1v8/6UckGGPBNvqMXSq6g8RbA7ASMjWcWjUIOyLNf52tbEs/El2OVRDUKF
	sxjLza0FjY6viWgNCU7ztq7zIYeYTq0wiPdRETSYAeX/omjG3dEqYmT5NWgZSZc6z6IeemsolcXHO
	GrhujJ0/MUuFKNxoL/7NO+i0Jx2aAE4eRzowuiY04W/fplCkZ1Vg1X2ZamzSwJ70EKjV4/n0qNuon
	wp0GgpO1/Ul1YntAA+2AI1G35O3/MhtKxvYGJmBDLS8j8yH99tVApP18nnlReG3ohwjhQjNjIT7xn
	fK2tJYUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHLU-0000000A20o-1QzQ;
	Thu, 02 Jan 2025 09:18:24 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHKI-0000000A1rm-3RYI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 09:17:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=y0ebg5JYBQo93J+yDyT483SON+/adfVmrWmE2TfO5rU=; b=mbx+aB1irJScO3s1js3RX9QgJi
	sTP1lXV9i4EmdKhwfSYGJtnXZ45gKyckkykk1YzokCgwlfN+x6Msm2JBtU+KeRjVfPFfcfEkuWThz
	9YsfMB1N2AYGUkqUgCOTgFyMRdKpxLq/WS6OqTtGB2h5lyHOI9chM5ucpVkkuQ25wX3JrZVFagkW1
	0PZM13qmuC9xDo+rujrCoOQNTHUgB1C24Zw29R4kwpFfzNh3e5z9/bEJeEQYPdLhJPy2+IYqnItlH
	3WctIYCphARWHzle8H+e2asvYtRaYbpFtk7uO+lNCcoJblpr5Yt4PHW824uRYUNfqQCtPYL7wEvqE
	JoujGgKw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34372)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tTHK7-0001nt-1u;
	Thu, 02 Jan 2025 09:16:59 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tTHK4-00009Q-2g;
	Thu, 02 Jan 2025 09:16:56 +0000
Date: Thu, 2 Jan 2025 09:16:56 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 3/5] net: pcs: mtk-lynxi: fill in PCS
 supported_interfaces
Message-ID: <Z3ZZiCbQb3jFvZMv@shell.armlinux.org.uk>
References: <Z1yJQikqneoFNJT4@shell.armlinux.org.uk>
 <E1tMBRF-006vae-WC@rmk-PC.armlinux.org.uk>
 <20241217141547.7748b3d3@fedora.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217141547.7748b3d3@fedora.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_011710_881102_40366FA5 
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

On Tue, Dec 17, 2024 at 02:15:47PM +0100, Maxime Chevallier wrote:
> Hi Russell,
> 
> On Fri, 13 Dec 2024 19:35:01 +0000
> "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:
> 
> > Fill in the new PCS supported_interfaces member with the interfaces
> > that the Mediatek LynxI supports.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  drivers/net/pcs/pcs-mtk-lynxi.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/net/pcs/pcs-mtk-lynxi.c b/drivers/net/pcs/pcs-mtk-lynxi.c
> > index 7de804535229..1377fb78eaa1 100644
> > --- a/drivers/net/pcs/pcs-mtk-lynxi.c
> > +++ b/drivers/net/pcs/pcs-mtk-lynxi.c
> > @@ -306,6 +306,11 @@ struct phylink_pcs *mtk_pcs_lynxi_create(struct device *dev,
> >  	mpcs->pcs.poll = true;
> >  	mpcs->interface = PHY_INTERFACE_MODE_NA;
> >  
> > +	__set_bit(PHY_INTERFACE_MODE_SGMII, mpcs->pcs.supported_interfaces);
> > +	__set_bit(PHY_INTERFACE_MODE_QSGMII, mpcs->pcs.supported_interfaces);
> 
> I'm sorry if I missed something, but I don't find where the QSGMII
> support comes from based on the current codebase :/
> 
> I didn't spot that in the inband_caps commit, sorry :(
> 
> > +	__set_bit(PHY_INTERFACE_MODE_1000BASEX, mpcs->pcs.supported_interfaces);
> > +	__set_bit(PHY_INTERFACE_MODE_2500BASEX, mpcs->pcs.supported_interfaces);

This list comes from the behaviour of the PCS as it stood before any of
these changes - the PCS code itself never validates the interface it's
passed, except for the call to
phylink_mii_c22_pcs_encode_advertisement() and checking that the
return value is non-negative. This is the only place that the
interfaces will be restricted - and they will be restricted to the
four interfaces I've listed above.

I don't have information on the hardware; so I can only go by the
behaviour of the existing code when making changes - and I take the
approach when adding new stuff of trying to avoid changing the code
behaviour, even if the existing code is doing something wrong.

I think, therefore, that a patch to remove stuff that isn't actually
supported should come after these patches, because that changes the
driver behaviour - otherwise the reason why QSGMII isn't included in
the patch would have needed to be described in each commit adding
extra code dealing with the interface mode.

It would've been nice had the driver implemented .pcs_validate() from
the start, which would've made it obvious which interface modes were
supported!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

