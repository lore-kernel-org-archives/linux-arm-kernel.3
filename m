Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA2ACAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJktQMdqIHogk394FiivhFmOdjrHiCFPa1pHkmNNloE=; b=JiVKQPS8f/5lzG3BoV4t1Cc9ut
	uywj8iqjd9HMZSjYWZ++2e2Fbya/PFkA7rP8wlkXFVItcKGhdWvDZDbPIQr66FUcdtezNwUNxpB6+
	8fe6lleEbyZHVWIYYyPoo3TE4W6MDiAwMVfxgmGF/4Ckh82ff/sLYQIX36ubp9/tIGsJrFgzVb1G2
	wnh+1fSuoi7ECiSyEEFQK4Phv9dgrWVDYlghTmXp+LCvKmxqbkMRZEq/ln5vcL9dOSOoLSz1xwuL0
	928NWtq869sAM77ekNLXs8yuxmdH2NirulTzvgxILd2rC5jLtC4gCTIDBtLyla8jAOnwI6UMuURIy
	ky8R+Weg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuUn-0000000CvEX-3W7l;
	Wed, 17 Sep 2025 15:55:01 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuUl-0000000CvCZ-2NAD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 15:55:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=AJktQMdqIHogk394FiivhFmOdjrHiCFPa1pHkmNNloE=; b=tA7yjSBfh1hpMlPKDhAteZScZ3
	LWtL4OhwJkoeY112/UKM1Lj8dS10jvM+/d6/xo7uOMTYDiqIm1NQXobdmEP65om9Qn9i5wDxhEPd0
	P+IcrmnIkqG20n8KABAmHw35SvqVVXkkU52TAhEpRjB553kSnPam6Gyb9lSssnWmtArp8+a58ynQ2
	BDtXU4CWBHtd28yI7/zUBK8UQClI5b7KUxLuPnp+KI2wVmuPFgZljQtubiVf3vGnXc158jeQGCHYZ
	QbXZ0eaG7ML9xwJ8sYFm6VONwlxAFv8YKbLmt62yyEzyVX9cwqj2YVfya/NnroZvUcrbbMUwW7293
	2hky0hiA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45608)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uyuUV-0000000053e-1IFT;
	Wed, 17 Sep 2025 16:54:43 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uyuUQ-000000000Jt-3aAP;
	Wed, 17 Sep 2025 16:54:38 +0100
Date: Wed, 17 Sep 2025 16:54:38 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Tristram Ha <Tristram.Ha@microchip.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 3/4] net: phy: smsc: fix and improve WoL
 support
Message-ID: <aMrZvvVBwmWGjr4P@shell.armlinux.org.uk>
References: <20250917-wol-smsc-phy-v2-0-105f5eb89b7f@foss.st.com>
 <20250917-wol-smsc-phy-v2-3-105f5eb89b7f@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917-wol-smsc-phy-v2-3-105f5eb89b7f@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_085459_603723_E8EF42EA 
X-CRM114-Status: GOOD (  11.70  )
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

On Wed, Sep 17, 2025 at 05:36:38PM +0200, Gatien Chevallier wrote:
> @@ -673,6 +726,9 @@ int smsc_phy_probe(struct phy_device *phydev)
>  
>  	phydev->priv = priv;
>  
> +	if (phydev->drv->set_wol)
> +		device_set_wakeup_capable(&phydev->mdio.dev, true);

This suggests that you know that this device is _always_ capable of
waking the system up, irrespective of the properties of e.g. the
interrupt controller. If this is not the case, please consider the
approach I took in the realtek driver.

In that case, you also need to add checks in the get_wol() and
set_wol() methods to refuse WoL configuration, and to report that
WoL is not supported.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

