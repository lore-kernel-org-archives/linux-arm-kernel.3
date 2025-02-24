Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA844C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 19:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9fNRf84FTtJjHliYcAUhh7w6jjxdbYy6571+0WzKs8U=; b=LIWRBnu91w1HPIKRFD8aSBWN4O
	L7gy1lwP8eudfMFxW/tnd89X5i1DMTxuuHKvS2K3XP/2cSBNPS4n5/fj/OaTkCvDFykDQM5YW+WgF
	nQOevyueIsVbPKFRgZwO8Z9vI626+YwIbQkIACEVhpn0MkvPb1F6ANxFYUgj4tW/vwEvkgWPp2mPb
	0b8GaMTVC1u6vCZxpVDlnR6Wl47qgjPfV2GkHR0MdN5U7pwWXvYZlY1ULZbfMhwR7vqmWXhErWYTa
	WOjFXDFp1U+AC4NljWfsOSGcRUvaIHSerRfgC1rysBgDQ9ClDbPgvL/b0Aa99o8xiIuf/Bd/oCIwi
	q+QkjB4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tme5S-0000000Exqw-38ac;
	Mon, 24 Feb 2025 19:25:54 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tme3y-0000000Exbc-0yMB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 19:24:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9fNRf84FTtJjHliYcAUhh7w6jjxdbYy6571+0WzKs8U=; b=FjydXtq8/upia+NN3lmp+mKknf
	lL8PdXsnIs4kBH71ncA9vo3jC18J02I8lHXuvCw8olTvs1dr2d4xlZEy/IIfy0tKRFA1N+h4KSKqt
	j0l9RqdLq4S1GDTAvgIb8thmaEiKA5CxmSloYiJmrxmcj5ZT0PecVTcD5RwlC/Cjsyi0+kT8VKa2C
	r6YO6J2VuRfb6yCT5U3Sp08LyWlA+iNQ58K9eUQ3ekGQ2OCGPB9IrY180vVSOEjCoLvQ+1pCF2Q3b
	puAVRKj4x7rFujSibeSUCWJIRdWZZmbkAK5pIKz1O7XGjsThwahg4JjK50UDHQuyi7yWVHIpVJuJ4
	+JQg74ow==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50622)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tme3p-0007O7-2i;
	Mon, 24 Feb 2025 19:24:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tme3l-0005G0-14;
	Mon, 24 Feb 2025 19:24:09 +0000
Date: Mon, 24 Feb 2025 19:24:09 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: dwc-qos: clean up clock
 initialisation
Message-ID: <Z7zHWceA9SmtcXPm@shell.armlinux.org.uk>
References: <E1tlRMP-004Vt5-W1@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tlRMP-004Vt5-W1@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_112422_268369_F2B9A5A1 
X-CRM114-Status: GOOD (  13.31  )
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

On Fri, Feb 21, 2025 at 11:38:25AM +0000, Russell King (Oracle) wrote:
> Clean up the clock initialisation by providing a helper to find a
> named clock in the bulk clocks, and provide the name of the stmmac
> clock in match data so we can locate the stmmac clock in generic
> code.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> dwc_eth_find_clk() should probably become a generic helper given that
> plat_dat->clks is part of the core platform support code, but that
> can be done later when converting more drivers - which I will get
> around to once I've got the set_clk_tx_rate() patch series out that
> someone else needs to make progress.

Jakub,

This one can also be removed from patchwork.

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

