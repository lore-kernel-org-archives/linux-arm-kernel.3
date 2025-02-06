Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA88C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 10:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ih0vTgIRG71UdmqFP4/qdzylk6AkxFKsTts6yUtzYE=; b=OvspPWsK6wibCg9/vYyVA4xsoW
	Lowk6zDCgTlgtbZiLryb0VaDg3RrTRyxBxHoAeCwt1xE+jc4+Qb030zDJgJRLzYml256TKijrcc2G
	0atdLmSFpsOg5EHdG/j9A5HcHY5TYzjt7mdi2vSFK7XkKMIJCDuduFETIjaidXLCeiPHMS+bYOshk
	WXsdaRbpDiJxzVaq3c324H5vkYBrEU21FAfX2OL9gqTHKg18Dbt52DmpqBVuoBj9ywwHMvx44w95c
	nR4FGlSFx/PKz2EwqrGWyuOTSaWQ/Rf7KlHmBj2nVCFXdsh2cKNeBv1cX/3TrSLZtJiCu7zoPj3LF
	7SHZ9mJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzSM-0000000610T-3Evy;
	Thu, 06 Feb 2025 10:50:02 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzQF-000000060sA-11iX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:47:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6ih0vTgIRG71UdmqFP4/qdzylk6AkxFKsTts6yUtzYE=; b=BIHfj6YIbRDZFdO9ZZtShujABm
	userF61Hy9yhwgP5nkGWyFxChpyFKXYxyF6BidELnuAQKCaHGc9LvbSC4Ior//F5rsopVKNxgF6ye
	f38ooUKmLZb0NhHx2eAch6c/JVGF/XSEs1ZRaJiBtsae9D1J2tTOES2CzPC2ErMafbe5ET16Lqomq
	E59eI5kV78330zzh/yDGOm78HXgqARurUhTwGCkwSXpYoevQiXlDbOjgWJak/BinuAnKxoezVM4Is
	Pknvglxm1ywPfD7G3VTyfaZU25CNZtYCAoMYR/AP5qZxRFpI2dCW2hJQxIwQiGZESQvlf7XYBGdBk
	WSx/XQsw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52382)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tfzQ4-0001nS-1b;
	Thu, 06 Feb 2025 10:47:40 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tfzQ1-0003Mv-2j;
	Thu, 06 Feb 2025 10:47:37 +0000
Date: Thu, 6 Feb 2025 10:47:37 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net] Revert "net: stmmac: Specify hardware capability
 value when FIFO size isn't specified"
Message-ID: <Z6STSb0ZSKN1e1rX@shell.armlinux.org.uk>
References: <E1tfeyR-003YGJ-Gb@rmk-PC.armlinux.org.uk>
 <2cff81d8-9bda-4aa0-80b6-2ef92cd960a6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cff81d8-9bda-4aa0-80b6-2ef92cd960a6@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_024751_283031_4C929D92 
X-CRM114-Status: GOOD (  18.80  )
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

On Thu, Feb 06, 2025 at 09:08:10AM +0100, Paolo Abeni wrote:
> On 2/5/25 1:57 PM, Russell King (Oracle) wrote:
> > This reverts commit 8865d22656b4, which caused breakage for platforms
> > which are not using xgmac2 or gmac4. Only these two cores have the
> > capability of providing the FIFO sizes from hardware capability fields
> > (which are provided in priv->dma_cap.[tr]x_fifo_size.)
> > 
> > All other cores can not, which results in these two fields containing
> > zero. We also have platforms that do not provide a value in
> > priv->plat->[tr]x_fifo_size, resulting in these also being zero.
> > 
> > This causes the new tests introduced by the reverted commit to fail,
> > and produce e.g.:
> > 
> > 	stmmaceth f0804000.eth: Can't specify Rx FIFO size
> > 
> > An example of such a platform which fails is QEMU's npcm750-evb.
> > This uses dwmac1000 which, as noted above, does not have the capability
> > to provide the FIFO sizes from hardware.
> > 
> > Therefore, revert the commit to maintain compatibility with the way
> > the driver used to work.
> > 
> > Reported-by: Guenter Roeck <linux@roeck-us.net>
> > Link: https://lore.kernel.org/r/4e98f967-f636-46fb-9eca-d383b9495b86@roeck-us.net
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Given the fallout caused by the blamed commit, the imminent net PR, and
> the substantial agreement about the patch already shared by many persons
> on the ML, unless someone raises very serious concerns very soon, I'm
> going to apply this patch (a little) earlier than the 24h grace period,
> to fit the mentioned PR.

Thanks. Here's the missing Fixes tag that I missed:

Fixes: 8865d22656b4 ("net: stmmac: Specify hardware capability value when
FIFO size isn't specified")

Not sure if patchwork will pick that up.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

