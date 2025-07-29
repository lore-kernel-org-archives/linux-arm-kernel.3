Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340ACC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 14:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8wGSo9XATI3giAKMDKds/aq062osT6tctjbABHT4DA=; b=jrAhgHdisw3Rnt4XqbDVZyHmji
	gY88UtqLqgjp2+mJ96NI6Y6N7m0AaA6eiOO1iI0jvvYQCnWhqi1LrMVnYrrGPV8uWaLYubWod/lX0
	q/fjQOxlE5eBrbZqNbCOMFCunFyjwcDzRen5nj0QbS88/c/uY6PHil7APSpbi2pCDJdIdc4QGJ7tv
	zZ2iViJSKyCdf1g5VBoDt+F2xOsV44gh4SWocPFrhS5SB+qaCkogK8bDKJ4nuFBL8zvzt3CSyEzqR
	ccxMgE+BE729fE8ajrWm9zFDFlh5UwCXo/E718OX/8zk033UhMXZ7PgxfL1V4k5DUmhi/kksP82HF
	CHIvRLlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugled-0000000GwyI-3eMH;
	Tue, 29 Jul 2025 14:50:11 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uglZ5-0000000GwLn-1a8o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 14:44:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=t8wGSo9XATI3giAKMDKds/aq062osT6tctjbABHT4DA=; b=rOFvNinTRkQwE4gVwqDsOV+G2g
	WQMQIiYCE+SssYAg7ZmPkhr+NqZpwkOw3HtWlU2BEnRn5RJeQsHxrrGp6SfzRT/fBT/2iwJfhbObM
	DocjlT/P0G4Oc1nNbgHI9erZEnHZdsfxXr8lIWupUSzqpWD8nTKs6QvLUiNEk/5XqTO+fxuR9xcMS
	ACzWzfIol4DruUvddnbxZFuxwgim5xkFpuFN7sB2Y5dYMYLBW75N/DI8WdO9yNVQgysyQhxjLvqrG
	P9OswWzkGnZ6wHTK6hRcJQZBCNpyrOm0dczrDBk/L97ZwFMkvlvu0vrmLeTuNs5OctVa6zhpphXOt
	hFC+au7A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60690)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uglYu-00023b-2f;
	Tue, 29 Jul 2025 15:44:16 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uglYr-0007Ud-0E;
	Tue, 29 Jul 2025 15:44:13 +0100
Date: Tue, 29 Jul 2025 15:44:12 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 6/7] net: stmmac: add helpers
 to indicate WoL enable status
Message-ID: <aIjePMWG6pEBvna6@shell.armlinux.org.uk>
References: <aIebMKnQgzQxIY3j@shell.armlinux.org.uk>
 <E1ugQ33-006KDR-Nj@rmk-PC.armlinux.org.uk>
 <eaef1b1b-5366-430c-97dd-cf3b40399ac7@lunn.ch>
 <aIe5SqLITb2cfFQw@shell.armlinux.org.uk>
 <77229e46-6466-4cd4-9b3b-d76aadbe167c@foss.st.com>
 <aIiOWh7tBjlsdZgs@shell.armlinux.org.uk>
 <aIjCg_sjTOge9vd4@shell.armlinux.org.uk>
 <d300d546-09fa-4b37-b8e0-349daa0cc108@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d300d546-09fa-4b37-b8e0-349daa0cc108@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_074427_417777_E4195078 
X-CRM114-Status: GOOD (  45.56  )
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

On Tue, Jul 29, 2025 at 03:10:56PM +0200, Gatien CHEVALLIER wrote:
> 
> 
> On 7/29/25 14:45, Russell King (Oracle) wrote:
> > On Tue, Jul 29, 2025 at 10:03:22AM +0100, Russell King (Oracle) wrote:
> > > With Thierry's .dts patch, PHY interrupts completely stop working, so
> > > we don't get link change notifications anymore - and we still don't
> > > seem to be capable of waking the system up with the PHY interrupt
> > > being asserted.
> > > 
> > > Without Thierry's .dts patch, as I predicted, enabling WoL at the
> > > PHY results in Bad Stuff happening - the code in the realtek driver
> > > for WoL is quite simply broken and wrong.
> > > 
> > > Switching the pin from INTB mode to PMEB mode results in:
> > > - No link change interrupts once WoL is enabled
> > > - The interrupt output being stuck at active level, causing an
> > >    interrupt storm and the interrupt is eventually disabled.
> > >    The PHY can be configured to pulse the PMEB or hold at an active
> > >    level until the WoL is cleared - and by default it's the latter.
> > > 
> > > So, switching the interrupt pin to PMEB mode is simply wrong and
> > > breaks phylib. I guess the original WoL support was only tested on
> > > a system which didn't use the PHY interrupt, only using the interrupt
> > > pin for wake-up purposes.
> > > 
> > > I was working on the realtek driver to fix this, but it's pointless
> > > spending time on this until the rest of the system can wake up -
> > > and thus the changes can be tested. This is where I got to (and
> > > includes work from both Thierry and myself, so please don't pick
> > > this up as-is, because I can guarantee that you'll get the sign-offs
> > > wrong! It's a work-in-progress, and should be a series for submission.)
> > 
> > Okay, with this patch, wake-up now works on the PHY interrupt line, but
> > because normal interrupts aren't processed, the interrupt output from
> > the PHY is stuck at active level, so the system immediately wakes up
> > from suspend.
> > 
> 
> If I'm following correctly, you do not use the PMEB mode and share
> the same pin for WoL and regular interrupts (INTB mode)?

As the driver is currently structured, switching the pin to PMEB mode
in .set_wol() breaks phylib, since as soon as one enables WoL at the
PHY, link state interrupts are no longer delivered.

It may be appropriate to switch the pin to PMEB mode in the suspend
method while waiting for a wakeup but we need code in place to deal
with the resulting interrupt storm (by clearing the wakeup) and that
code is missing.

The other approach would be to leave the pin in INTB mode, and
reconfigure the interrupt enable register (INER) to allow WoL
interrupts, maybe disabling link state interrupts (more on that
below.) This has the advantage that reading the interrupt status
register clears the interrupt - and that code already exists so we
avoid the interrupt storm.

> > Without the normal interrupt problem solved, there's nothing further
> > I can do on this.
> > 
> > Some of the open questions are:
> > - whether we should configure the WoL interrupt in the suspend/resume
> >    function
> 
> For the LAN8742 PHY with which I worked with, the recommendation when
> using the same pin for WoL and regular interrupt management is to mask
> regular interrupt and enable the WoL IIRC.

That's only really appropriate if the MAC isn't involved in WoL. Let's
say that the PHY can support magic-packet WoL, but the MAC can also
support unicast frame WoL, and the user has enabled both.

The system goes to sleep (e.g. overnight) and during the night, there's
a hiccup which causes the link to drop and re-establish at a slower
speed.

Since the MAC has not been reconfigured (because the link state
interrupt is disabled, and thus won't wake the system) the MAC can now
no longer receive unicast frames to check whether they match the
despired system wakeup condition.

So, this poses another question: do we really want to support
simultaneous PHY and MAC level WoL support, or should we only allow
one or other device to support WoL?

If we explicitly deny the WoL at both approach, then we don't have
to care about link state interrupts, because the PHY will be able
to cope with the different link speed without needing to wake the
iystem to reconfigure the network interface for the new link
parameters.

> This prevents the PHY from waking up from undesired events while still
> being able use the WoL capability and should be done in suspend() /
> resume() callbacks. I guess this means also that you share the same
> interrupt handler that must manage both WoL events and regular events.
> 
> On the other hand, on the stm32mp135f-dk, the nPME pin (equivalent to
> PMEB IIUC) is wired and is different from the nINT pin. Therefore, I
> guess it should not be done during suspend()/resume() and it really
> depends on how the PHY is wired. Because if a WoL event is received at
> runtime, then the PHY must clear the flags otherwise the WoL event won't
> trigger a system wakeup afterwards.
> 
> I need to look at how the PHYs can handle two different interrupts.

The RTL8211F only has one pin (pin 31) which can be used in INTB mode
or PMEB mode. You can't have independent interrupt and wakeup signals
with this PHY.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

