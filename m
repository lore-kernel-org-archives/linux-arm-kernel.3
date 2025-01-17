Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45C4C02188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 12:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OgMlLosfXsyCFfHkGv5D0Rn1NUZBobKjUdTqgKXXGio=; b=C5s2dEPEXjIrfkBlZ359L5zFZ5
	IW259R0bUUJr3RpflxYSgnPmT0+zdpmR2mBStZIC3c4WQkzzjslcyVbpUTJmz0YISskm5Mwrb4OE6
	wY30xFWm3AUf/Vum30QOaFiafSOpVOJW/3snHIWf34VnmYs21aGrCIxk4b8qdLWlwaNfkmHx5cgix
	9VDrDUEzuVh3QsxM/Rco4Mv+92RUgvJneLdFvrR4uy6Q8xoD9+gBhehQ6c89nVZp3Npqi9fum7XVv
	dIK0WW3g9pr2uVAHQtTu4Ab0YlaCkqXl+LdYdvRhxQ9g3elQWk7+oPTkdLzdzBfzZERlXLw6lg4Tt
	TFUbnvkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYlPp-00000000EDt-01Xx;
	Fri, 17 Jan 2025 12:25:33 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYlOZ-00000000E9d-0SeQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 12:24:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OgMlLosfXsyCFfHkGv5D0Rn1NUZBobKjUdTqgKXXGio=; b=knUrbu7E0b5Baxh2gMk5za1r1C
	NUpRTrv2mjlOq3x1/1UTg27s0nHK1C9vUk9kMsQX07YBphpWZxUCCQd1tCY5N3l6y4+02QVavv7gR
	8SYim/nsRlC7qsXa2jicBD8+yy4Pi+ECnh1KWECUjQT+62c9ToKuGkzkMf5+NZYL9TDFtp4NpkaDn
	vfFGft0YLbekf1QqHmHZnB6cNcay5aY0Io/HY74XxBV6f/McISad4NWr1LBzG489dw0GSQZ2J5CPJ
	9qQqbQQWETeTAVc5lYVoByWttoh7NGpNwk1vVBZPAnpxsUrlYaouohiupHn2T/PY778N/G8P9wI5K
	Ty2uXj9Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48914)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tYlOL-0003dd-1E;
	Fri, 17 Jan 2025 12:24:01 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tYlOG-0008GV-1N;
	Fri, 17 Jan 2025 12:23:56 +0000
Date: Fri, 17 Jan 2025 12:23:56 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jiawen Wu <jiawenwu@trustnetic.com>
Cc: 'Andrew Lunn' <andrew@lunn.ch>,
	'Heiner Kallweit' <hkallweit1@gmail.com>, mengyuanlou@net-swift.com,
	'Alexandre Torgue' <alexandre.torgue@foss.st.com>,
	'Andrew Lunn' <andrew+netdev@lunn.ch>,
	'Bryan Whitehead' <bryan.whitehead@microchip.com>,
	"'David S. Miller'" <davem@davemloft.net>,
	'Eric Dumazet' <edumazet@google.com>,
	'Jakub Kicinski' <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	'Marcin Wojtas' <marcin.s.wojtas@gmail.com>,
	'Maxime Coquelin' <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org, 'Paolo Abeni' <pabeni@redhat.com>,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH net-next 0/9] net: add phylink managed EEE support
Message-ID: <Z4pL3Mn6Qe7O45D7@shell.armlinux.org.uk>
References: <Z4gdtOaGsBhQCZXn@shell.armlinux.org.uk>
 <06d301db68bd$b59d3c90$20d7b5b0$@trustnetic.com>
 <Z4odUIWmYb8TelZS@shell.armlinux.org.uk>
 <06dc01db68c8$f5853fa0$e08fbee0$@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06dc01db68c8$f5853fa0$e08fbee0$@trustnetic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_042415_148407_CF24011E 
X-CRM114-Status: GOOD (  16.32  )
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

On Fri, Jan 17, 2025 at 06:17:05PM +0800, Jiawen Wu wrote:
> > > Since merging these patches, phylink_connect_phy() can no longer be
> > > invoked correctly in ngbe_open(). The error is returned from the function
> > > phy_eee_rx_clock_stop(). Since EEE is not supported on our NGBE hardware.
> > 
> > That would mean phy_modify_mmd() is failing, but the question is why
> > that is. Please investigate. Thanks.
> 
> Yes, phy_modify_mmd() returns -EOPNOTSUPP. Since .read/write_mmd are
> implemented in the PHY driver, but it's not supported to read/write the
> register field (devnum=MDIO_MMD_PCS, regnum= MDIO_CTRL1).
> 
> So the error occurs on  __phy_read_mmd():
> 	if (phydev->drv && phydev->drv->read_mmd)
> 		return phydev->drv->read_mmd(phydev, devad, regnum);

Thanks. The patch below should fix it. Please test, meanwhile I'll
prepare a proper patch.

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 66eea3f963d3..56d411bb2547 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2268,7 +2268,11 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 	/* Explicitly configure whether the PHY is allowed to stop it's
 	 * receive clock.
 	 */
-	return phy_eee_rx_clock_stop(phy, pl->config->eee_rx_clk_stop_enable);
+	ret = phy_eee_rx_clock_stop(phy, pl->config->eee_rx_clk_stop_enable);
+	if (ret == -EOPNOTSUPP)
+		ret = 0;
+
+	return ret;
 }
 
 static int phylink_attach_phy(struct phylink *pl, struct phy_device *phy,

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

