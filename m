Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8E9C02182
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 10:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J9qCCKssPFOhNE2Q6kDpYoA+uFQ9qxMGhFoj3QIqWXY=; b=veA8Ucrhvi+aFkd8MeQowJl+MK
	ZTVe7m9P/D7O8NtAxGRQ/MQe3lD4XIpP+dzypRDqOWJQIjwNoCppTP/W4xCrnXJCSMj08lKeljHGv
	jaG2EcxVlBs8ESSHlrnphBchgLHmMQE1G/bgvgB5NI7K4DTRNvOgb7+BaYQYTl/fEsMRN0j/cvTIx
	R32cFAmmG2d+WhrJlJKHleKirFaEEY1Jac8WlOKDf3fP1oDcNqHzwHnfIU2iErlSeV05mPjTQpvSN
	Ac3ZOs5GF0YaQQBRKv9w24nAFx0sVrJdeZpu007fl247iEfRUuX4TTLgyl1/Vlb6COh9Ikp29/HVh
	EHQsxPmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZobV-00000005H74-3HTi;
	Mon, 20 Jan 2025 10:01:57 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZoUB-00000005FWx-36ix
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 09:54:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=J9qCCKssPFOhNE2Q6kDpYoA+uFQ9qxMGhFoj3QIqWXY=; b=gcOAsWT6tsh6Zg0srbvfzKTGfd
	jyL0hmH29wdmm5FcCL0Q7b7Uvm3jGaCHg5p1N3oH2HFvIXwNq+x61zL2Kau1DZUlWq4RcY0DlnN0i
	lfxWXsKWUZxzAh8xjGiGKke/p/jYMsK8xWT/ljhwnEdLWawXonXWpH+koy5pijI9KSP3H7OtwwdKH
	1gMspWSk8odUd3VXLc+2kBuZgG8r1GblfLoQ4/WRbNSM87noB4toSJy0LUcOFqI1tnS7eONFygrGu
	aC9fFbAR9yhUCEsJyZy4nEx+8uPUUG7QZdLRLt8ORQa2zt+S6tXEVpN9XJCQcDqHadDo57Bu1uN3N
	Yt0UaE4Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38144)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tZoTw-0005zi-2P;
	Mon, 20 Jan 2025 09:54:08 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tZoTq-0002lo-1n;
	Mon, 20 Jan 2025 09:54:02 +0000
Date: Mon, 20 Jan 2025 09:54:02 +0000
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
Message-ID: <Z44dOlfRN5FmHcdS@shell.armlinux.org.uk>
References: <Z4gdtOaGsBhQCZXn@shell.armlinux.org.uk>
 <06d301db68bd$b59d3c90$20d7b5b0$@trustnetic.com>
 <Z4odUIWmYb8TelZS@shell.armlinux.org.uk>
 <06dc01db68c8$f5853fa0$e08fbee0$@trustnetic.com>
 <Z4pL3Mn6Qe7O45D7@shell.armlinux.org.uk>
 <073a01db6add$d308af40$791a0dc0$@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <073a01db6add$d308af40$791a0dc0$@trustnetic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_015423_779575_76E89AAC 
X-CRM114-Status: GOOD (  22.88  )
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

On Mon, Jan 20, 2025 at 09:51:29AM +0800, Jiawen Wu wrote:
> On Fri, Jan 17, 2025 8:24 PM, Russell King (Oracle) wrote:
> > On Fri, Jan 17, 2025 at 06:17:05PM +0800, Jiawen Wu wrote:
> > > > > Since merging these patches, phylink_connect_phy() can no longer be
> > > > > invoked correctly in ngbe_open(). The error is returned from the function
> > > > > phy_eee_rx_clock_stop(). Since EEE is not supported on our NGBE hardware.
> > > >
> > > > That would mean phy_modify_mmd() is failing, but the question is why
> > > > that is. Please investigate. Thanks.
> > >
> > > Yes, phy_modify_mmd() returns -EOPNOTSUPP. Since .read/write_mmd are
> > > implemented in the PHY driver, but it's not supported to read/write the
> > > register field (devnum=MDIO_MMD_PCS, regnum= MDIO_CTRL1).
> > >
> > > So the error occurs on  __phy_read_mmd():
> > > 	if (phydev->drv && phydev->drv->read_mmd)
> > > 		return phydev->drv->read_mmd(phydev, devad, regnum);
> > 
> > Thanks. The patch below should fix it. Please test, meanwhile I'll
> > prepare a proper patch.
> > 
> > diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> > index 66eea3f963d3..56d411bb2547 100644
> > --- a/drivers/net/phy/phylink.c
> > +++ b/drivers/net/phy/phylink.c
> > @@ -2268,7 +2268,11 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
> >  	/* Explicitly configure whether the PHY is allowed to stop it's
> >  	 * receive clock.
> >  	 */
> > -	return phy_eee_rx_clock_stop(phy, pl->config->eee_rx_clk_stop_enable);
> > +	ret = phy_eee_rx_clock_stop(phy, pl->config->eee_rx_clk_stop_enable);
> > +	if (ret == -EOPNOTSUPP)
> > +		ret = 0;
> > +
> > +	return ret;
> >  }
> > 
> >  static int phylink_attach_phy(struct phylink *pl, struct phy_device *phy,
> 
> Test pass.
> Thanks.

Thanks, I guess that's a tested-by then?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

