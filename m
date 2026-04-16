Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F8EF8A17A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 13:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zOnYPi75gzmQEwbyZJqH4NCjwCJ3I8rG438d8AQ1+0U=; b=HtdldXuFk8LvMrQyUa0mko+W96
	IIwDGAuGjKUdIviAM4Sp/Z7lekdxfw0b2m5t690VdYI5QZB/4VJwJPtzW80h/CpuRw8OmFR34PeqV
	xzPCg2Xy6pO/UchZWIhQ4xfRUkwTX/YNuNxKg/VtvURgZDZfF14Sxl4uCN0xz3I/0tH+UytOimm8L
	fH5aOYUvKsS+TE8LBseOnqqfpsBZRtQJOdrPmKjOHEivXb8bmnNL0xczeCmHzFe4ADPFm0OrxVJIt
	4GfNttfXBs0YXsE3Mw9ZkXL+rcCDKGQkBcGdROWYBzM34UOB1Sb+r8AGAnfJl/autkk5datm0OGl8
	Wjo8MsEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDN4p-00000002Wk6-3ijo;
	Thu, 16 Apr 2026 13:48:15 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDN4m-00000002Wjl-0QD9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 13:48:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zOnYPi75gzmQEwbyZJqH4NCjwCJ3I8rG438d8AQ1+0U=; b=n6F771f72013HJNfmIqPEmVhNi
	QE0xN6gU/HImq42GSRXuZgq3TjaGa1aeKVavGBIdDNRHPsdHZUUoouucS9r/v2FuVAQlDW+l1Gv8N
	Y7iaE43hAGc7wNNDYHUh3DapeKFaYEgnKAQxoGl46yX63qHZNyt0lSXLHMfSvnW/3JkUG6trNUN02
	2C2B2POZuW7NtIFVdNXpYrAzp64+nhJpeK+1zaosi936fktn8foNbfBwpegMLNwxidI3r/bhg6mJT
	mfmRxjueya3O/l0jhchVIxwIbwZvqG43tq/tjFuBe7SZC0njfOuEPPQhvmzqyfVv8OPtoV0TmrW6Z
	/Rrnc21g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53316)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wDN4b-000000003Gr-0UCP;
	Thu, 16 Apr 2026 14:48:01 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wDN4X-000000003FZ-3ckE;
	Thu, 16 Apr 2026 14:47:57 +0100
Date: Thu, 16 Apr 2026 14:47:57 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
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
Subject: Re: [PATCH net-next 5/6] net: stmmac: move PHY handling out of
 __stmmac_open()/release()
Message-ID: <aeDojTdDTELfpT0X@shell.armlinux.org.uk>
References: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
 <5987484.DvuYhMxLoT@steina-w>
 <aeC-tc2CooYDoBok@shell.armlinux.org.uk>
 <2410317.ElGaqSPkdT@steina-w>
 <aeDSTIS9-TDSihbX@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeDSTIS9-TDSihbX@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_064812_314827_0F7CEB2D 
X-CRM114-Status: GOOD (  47.28  )
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

On Thu, Apr 16, 2026 at 01:13:00PM +0100, Russell King (Oracle) wrote:
> On Thu, Apr 16, 2026 at 02:02:53PM +0200, Alexander Stein wrote:
> > Hi Russel,
> > 
> > Am Donnerstag, 16. April 2026, 12:49:25 CEST schrieb Russell King (Oracle):
> > > On Thu, Apr 16, 2026 at 08:20:13AM +0200, Alexander Stein wrote:
> > > > Am Mittwoch, 15. April 2026, 14:59:32 CEST schrieb Russell King (Oracle):
> > > > > On Wed, Apr 15, 2026 at 08:08:40AM +0200, Alexander Stein wrote:
> > > > > > Hi,
> > > > > > 
> > > > > > Am Dienstag, 23. September 2025, 13:26:19 CEST schrieb Russell King (Oracle):
> > > > > > > Move the PHY attachment/detachment from the network driver out of
> > > > > > > __stmmac_open() and __stmmac_release() into stmmac_open() and
> > > > > > > stmmac_release() where these actions will only happen when the
> > > > > > > interface is administratively brought up or down. It does not make
> > > > > > > sense to detach and re-attach the PHY during a change of MTU.
> > > > > > 
> > > > > > Sorry for coming up now. But I recently noticed this commit breaks changing
> > > > > > the MTU on i.MX8MP. Once I simply change the MTU I run into some DMA error:
> > > > > > $ ip link set dev end1 mtu 1400
> > > > > > imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-0
> > > > > > imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-1
> > > > > > imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-2
> > > > > > imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-3
> > > > > > imx-dwmac 30bf0000.ethernet end1: Register MEM_TYPE_PAGE_POOL RxQ-4
> > > > > > imx-dwmac 30bf0000.ethernet end1: Link is Down
> > > > > > imx-dwmac 30bf0000.ethernet end1: Failed to reset the dma
> > > > > > imx-dwmac 30bf0000.ethernet end1: stmmac_hw_setup: DMA engine initialization failed
> > > > > 
> > > > > This basically means that a clock is missing. Please provide more
> > > > > information:
> > > > > 
> > > > > - what kernel version are you using?
> > > > 
> > > > Currently I am using v6.18.22.
> > > > $ ethtool -i end1
> > > > driver: st_gmac
> > > > version: 6.18.22
> > > > firmware-version: 
> > > > expansion-rom-version: 
> > > > bus-info: 30bf0000.ethernet
> > > > supports-statistics: yes
> > > > supports-test: no
> > > > supports-eeprom-access: no
> > > > supports-register-dump: yes
> > > > supports-priv-flags: no
> > > > 
> > > > > - has EEE been negotiated?
> > > > 
> > > > No. It is marked as not supported
> > > > 
> > > > $ ethtool --show-eee end1
> > > > EEE settings for end1:
> > > >         EEE status: not supported
> > > > 
> > > > > - does the problem persist when EEE is disabled?
> > > > 
> > > > As EEE is not supported the problem occurs even with EEE disabled.
> > > > 
> > > > > - which PHY is attached to stmmac?
> > > > 
> > > > It is a TI DP83867.
> > > > 
> > > > imx-dwmac 30bf0000.ethernet eth1: PHY [stmmac-1:03] driver [TI DP83867] (irq=136)
> > > > 
> > > > > - which PHY interface mode is being used to connect the PHY to stmmac?
> > > > 
> > > > For this interface
> > > > > phy-mode = "rgmii-id";
> > > > is set.
> > > > 
> > > > In case it is helpful. My platform is arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
> > > > Thanks for assisting. If there a further questions, don't hesitate to ask.
> > > 
> > > Thanks.
> > > 
> > > So, as best I can determine at the moment, we end up with the following
> > > sequence:
> > > 
> > > stmmac_change_mtu()
> > >  __stmmac_release()
> > >   phylink_stop()
> > >    phy_stop()
> > >     phy->state = PHY_HALTED
> > >     _phy_state_machine() returns PHY_STATE_WORK_SUSPEND
> > >     _phy_state_machine_post_work()
> > >      phy_suspend()
> > >       genphy_suspend()
> > >        phy_set_bits(phydev, MII_BMCR, BMCR_PDOWN)
> > > 
> > > With the DP83867, this causes most of the PHY to be powered down, thus
> > > stopping the clocks, and this causes the stmmac reset to time out.
> > > 
> > > Prior to this commit, we would have called phylink_disconnect_phy()
> > > immediately after phylink_stop(), but I can see nothing that would
> > > be affected by this change there (since that also calls
> > > phy_suspend(), but as the PHY is already suspended, this becomes a
> > > no-op.)
> > > 
> > > However, __stmmac_open() would have called stmmac_init_phy(), which
> > > would reattach the PHY. This would have called phy_init_hw(), 
> > > resetting the PHY, and phy_resume() which would ensure that the
> > > PDOWN bit is clear - thus clocks would be running.
> > > 
> > > As a hack, please can you try calling phylink_prepare_resume()
> > > between the __stmmac_release() and __stmmac_open() in
> > > stmmac_change_mtu(). This should resume the PHY, thus restoring the
> > > clocks necessary for stmmac to reset.
> > 
> > I tried the following patch. This works as you suspected.
> 
> Brilliant, thanks for proving the theory why it broke.
> 
> I'll have a think about the best way to solve this, because
> phylink_prepare_resume() is supposed to be paired with phylink_resume()
> and that isn't the case here.
> 
> Please bear with me as my availability for looking at the kernel is
> very unpredictable at present (family health issues.)

I have some patches which passed build testing, but more chaos means
I can't post them nor test them. I'll do something when I'm next able
to, whenever that will be.

The next problem will be netdev's policy over reviews vs patches
balance which I'm already in deficit, and I have *NO* *TIME*
what so ever to review patches - let alone propose patches to
fix people's problems.

So I'm going to say this plainly: if netdev wants to enforce that
rule, then I won't be fixing people's problems.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

