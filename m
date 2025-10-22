Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F87CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 18:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bku8ZfM1vd1cxkJC/JuPNt08MeKU8abxyCWkKmsYXbM=; b=RUGudYdPkHNZz7uXMlW9CACg0x
	tbbtdtX1Cp/kdWZ2diDQLlaIppujibSiv4jUmyu0vsCtOeH6fbwo/x9gSo7VqD+I6dwiG8e7DQsBZ
	KkmvXBOo+BFVnROnPgthOGtkIq1IbRHiO8yyJO5XXLUEw/MMZ6R5y23InsO0b5wQcUgEroDzxBK3M
	HJMfNXPWNBxZ89WUr0KSIWwOxHO/LaKtFGPqBypjnFPp0Mhuyks972PFqQ2oi3VPnpVs879v5TWaM
	TXghsy2UcEpQ0rVUgCZxfRXocaZ3oSyY4EuywG9EzWUQIrxheN3WcexhbWYMRVMdLSqdusNZkD0Qz
	KpOlq+eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBdT1-00000003yHJ-3AyX;
	Wed, 22 Oct 2025 18:21:47 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBdT0-00000003yGe-05SY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 18:21:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Bku8ZfM1vd1cxkJC/JuPNt08MeKU8abxyCWkKmsYXbM=; b=WzZGa/PWzfHHLyzzZox92f11dx
	jfzyLEMXDOhoxlluvfXPRcA3iQ0LQWc22quFb5M9ZwO9ZNQglgdRhMkb/nMPeqzDpKL1na/fPd5bT
	Z2Ur+DfOCNO2NcllHSm7JcoNHtPDQaa/5omjJOUiWV8Te+tNc97UdHHv+nHrPJ9qk2K52/Vz73CQy
	c344P5Tn+IAbIOkGjXrnr8Bycjyz3NQEntfS2ODGglEHKEtvF2bog2NrGzJLAWxL46H8sNf9wiK5E
	stmTVIU6yCX79eMwav6tOmj905wLBoEC/Ix/xyYRsq5CsKxjFHk++iLDPiJdI5j8Urg+bLDWo3lT0
	OpD80XVQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50792)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vBdSv-000000005Iv-0yvw;
	Wed, 22 Oct 2025 19:21:41 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vBdSt-000000000vC-2c8q;
	Wed, 22 Oct 2025 19:21:39 +0100
Date: Wed, 22 Oct 2025 19:21:39 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 2/6] net: phy: add phy_may_wakeup()
Message-ID: <aPkgs44E2ahwsaWx@shell.armlinux.org.uk>
References: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
 <E1v9jCO-0000000B2O4-1L3V@rmk-PC.armlinux.org.uk>
 <432ac9c4-845d-4fe4-84fb-1b2407b88b3f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <432ac9c4-845d-4fe4-84fb-1b2407b88b3f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_112146_060822_6EC9D3D5 
X-CRM114-Status: GOOD (  14.14  )
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

On Wed, Oct 22, 2025 at 11:14:08AM -0700, Florian Fainelli wrote:
> On 10/17/25 05:04, Russell King (Oracle) wrote:
> > Add phy_may_wakeup() which uses the driver model's device_may_wakeup()
> > when the PHY driver has marked the device as wakeup capable in the
> > driver model, otherwise use phy_drv_wol_enabled().
> > 
> > Replace the sites that used to call phy_drv_wol_enabled() with this
> > as checking the driver model will be more efficient than checking the
> > WoL state.
> > 
> > Export phy_may_wakeup() so that phylink can use it.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

Note my reply to Maxime, I've changed the description to:

+/**
+ * phy_may_wakeup() - indicate whether PHY has wakeup enabled
+ * @phydev: The phy_device struct
+ *
+ * Returns: true/false depending on the PHY driver's device_set_wakeup_enabled()
+ * setting if using the driver model, otherwise the legacy determination.
+ */
+bool phy_may_wakeup(struct phy_device *phydev);
+

Are you still okay for me to add your r-b?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

