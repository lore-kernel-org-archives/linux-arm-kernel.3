Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98443CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 15:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8WH71db750jps9WxI3z1NEUJwkE3VXRhtPG7iUgTWY=; b=jgojj8mlwSrl//GUdTiSNCKWro
	v0UgyFw4Pftk2+EEMLvKRMAgde6obuMYeWxGJ1TchonQDPj7sqBau09Tn444wXqSTli/hizisCiF2
	khSibREL1fEbLRMT3HofZ/Me/vNzaFiXxFEzkIa5bt6ciRv2iPaz7HHivCfO8U3mt/7aMZ0UI842K
	oTpdRv+YWoYEA5K/IbW6yCCfLsELO69envFI4/WkGbalJXbKUBUIz67HmV8nicyyoghpWPuJXCPJ8
	5vELnmzG9X+8+HSYIGtXLbgUgFWdkRE72Ki8DWJEyoX/i0YOAdAr1iAL0FQeyyIroQopNe19k0vhO
	wA4KWmDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v935i-000000022Xi-2jsL;
	Wed, 15 Oct 2025 15:07:02 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v935g-000000022Wu-1vng
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 15:07:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=i8WH71db750jps9WxI3z1NEUJwkE3VXRhtPG7iUgTWY=; b=04hQz4eK43+AW/wKb5wdQbpX7W
	9qjxEPcOHoILOsxV1PI8IytNEk84VUOiE3we1jZwRHbOWnulNKUJp706hKrMypx3oAeFgwVnxQJp1
	7NcBfL3w49o/pLRiGOLUQIQ/mWRC0KCTP8+VfDs1dsu+lXWJju+rDn+BWTwR/+t0mRP2hDyld2Iy+
	Y+3njCB/O24OWRDwUd5m5IiCMsrA2qo8dBfgqnXLAfyzO2XLKOXq0hFkLwNxW1dEVY+Dz3X9mnDRT
	2VTa9nPxpngzLSATgjGK+7eSuRfEQT3c4w5Fc5pxwzaBcGyASUd1jlsNEB+d8MwZ634P3VQG8TnLz
	W4C0Q8HQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37834)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v935W-000000004wH-29yk;
	Wed, 15 Oct 2025 16:06:50 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v935S-000000002Le-3AO4;
	Wed, 15 Oct 2025 16:06:46 +0100
Date: Wed, 15 Oct 2025 16:06:46 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/3] net: stmmac: Move subsecond increment
 configuration in dedicated helper
Message-ID: <aO-4hnUINpQ0JORE@shell.armlinux.org.uk>
References: <20251015102725.1297985-1-maxime.chevallier@bootlin.com>
 <20251015102725.1297985-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015102725.1297985-2-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_080700_497687_2FA21BE8 
X-CRM114-Status: GOOD (  12.71  )
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

On Wed, Oct 15, 2025 at 12:27:21PM +0200, Maxime Chevallier wrote:
> +static void stmmac_update_subsecond_increment(struct stmmac_priv *priv)
> +{
> +	bool xmac = priv->plat->has_gmac4 || priv->plat->has_xgmac;

Just to say that I have patches that get rid of these has_xxx flags for
the cores, and these changes (and the additional platform glue patches
that have been posted) will conflict with them.

Given the rate of change in stmmac, at some point we're going to have
to work out some way of stopping stmmac development to get such an
invasive cleanup change merged - but with my variability and pressures
on the time I can spend even submitting patches, I've no idea how that
will work... I was going to send them right at the start of this
cycle, but various appointments on Monday and Tuesday this week plus
work pressures prevented that happening.

So, I decided instead to send out the first stmmac PCS series... which
means I now need to wait for that to be merged before I can think about
sending out anything else stmmac-related. (and there's more PCS patches
to come beyond the 14 I sent today.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

