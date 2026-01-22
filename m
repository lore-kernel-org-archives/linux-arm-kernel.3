Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C13AC44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 12:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99WeiO5u+l3PtnXWsgEb1Ggl01P6ZHYFWERHUSgNsgI=; b=m6hMytRTVWs+580XS+XihcMu3N
	QjHaS8j6fzsD+z1QsFtsXeb3Ul1P/BYT8ye9i2epj3plRsR1AkLLhGGkcqJq022fofINaXtbT2vxQ
	amsUTIy9WzBArltmbBjqhXPkC2uA3NOQmDphxmvV5fQrHLp3LxoaDpcjp6R3FMeew5qZLBlwVmUhF
	yD1RmnUZDdcMxa7KBlekpEjh8fhUEIlnI/YFZ2wlH3ArPPyJEQqxityAUNtJs1C1xbSWiJrpSmkH8
	hW1e6xf1GMoSse6a7mbZ6XnQvjBbWQorvPVezCGHSoiqfm2xi2xvLXzvXdXjDj8KiURc1JllN2IIG
	2wqwrBcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vitZ0-000000072Bj-3o8i;
	Thu, 22 Jan 2026 12:13:26 +0000
Received: from pandora.armlinux.org.uk ([78.32.30.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vitYx-000000072A9-3jzb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 12:13:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=99WeiO5u+l3PtnXWsgEb1Ggl01P6ZHYFWERHUSgNsgI=; b=iyD8MTpBQ4AJ8EUuEnND0jx9k8
	tsG6pbPaRaORNoZBNHSVbFHVoJYD2c3zOuR1xwZJpuuir+y/nMifRqKAFGb6EebfoWcDqFy/E3iWo
	483US66ALS+CQtAu36tdq29upmjLkNeRgZ4t1SV3fgHqVelgbg/sJa0Kq8nt9zuUM12sFjo76OQEP
	XVSssTnrgQZ2mQ0AeX2zrkL5aEzwzAkl1WxpEhnHDXPrV0ZINtPPwZj4jIE7nHiLp731Qtud22sU1
	HyrBZVcYHPb6iDXfWigJ9+2o+xlwW9949IWohqC1eqmPcx7N5zB9WYbGP0uxlrCJEj4CE9P0inQMD
	HTG2wdyQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51682)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vitYi-000000000LC-0kvR;
	Thu, 22 Jan 2026 12:13:08 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vitYf-000000000zX-1d0f;
	Thu, 22 Jan 2026 12:13:05 +0000
Date: Thu, 22 Jan 2026 12:13:05 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Stefan Eichenberger <eichest@gmail.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, hkallweit1@gmail.com,
	linux-stm32@st-md-mailman.stormreply.com,
	maxime.chevallier@bootlin.com, francesco.dolcini@toradex.com,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH net-next v3 1/3] net: phy: add a new phy_device flag to
 keep preamble before sfd
Message-ID: <aXIUUStYnRt2Ad0x@shell.armlinux.org.uk>
References: <20260120203905.23805-1-eichest@gmail.com>
 <20260120203905.23805-2-eichest@gmail.com>
 <86b8feca-8e82-465e-a17a-b751758306ce@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86b8feca-8e82-465e-a17a-b751758306ce@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_041324_214902_509753B0 
X-CRM114-Status: GOOD (  14.56  )
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

On Thu, Jan 22, 2026 at 12:37:17PM +0100, Paolo Abeni wrote:
> On 1/20/26 9:30 PM, Stefan Eichenberger wrote:
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > 
> > Add a new flag, PHY_F_KEEP_PREAMBLE_BEFORE_SFD, to indicate that the PHY
> > shall not remove the preamble before the SFD if it supports it. MACs
> > that do not support receiving frames without a preamble can set this
> > flag.
> > 
> > Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> I understand this has been suggested by Russell, and LGTM, but still it
> would be nice explicit ack from the phy lib crew to ensure it matches
> expectations.

Since I suggested it, I feel it would only be right for Andrew to ack
it to show his agreement with my suggestion.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

