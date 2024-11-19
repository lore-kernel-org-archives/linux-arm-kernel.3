Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688E9D44167
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 15:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=poVgrhfUM+w7fZDkJyIhYRLNyzyYxc9sRedM9mebQyU=; b=f2zO+3Im0Gzb/cpHxK8DUS9ovT
	V+/YHAnMMRXQqK9YyZxdk802BJJUrDH6C2HoWCZOaKWdMofjel1EFRIvSQZYLmOa5BZrc0kz+4Qur
	FVEM4JC6cQRtBuf7IKYJXRqGtmGFOB7MC3DtxcoQTkKK+XAZcbywvDAo/NMvgYaqMPUYwYGj1Ju/K
	qkSHvW3i/Na/9rB0KG+a5d2Eeyb/+v4atPi6KJp2jYa/yMXKCi6KaJR6vcaL68HecX/QJJA5emv+G
	1cpec02KL0Iblu7rnYF0NAPfIjK+cEfzwVGuD+Ru6u/oDo5SR3SxrbFtc2D5M6xvgfbT850eG+7Jk
	2F9uezcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDQ1T-0000000CpwW-1XFb;
	Tue, 19 Nov 2024 15:20:11 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDPue-0000000CoJI-1fWR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 15:13:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=poVgrhfUM+w7fZDkJyIhYRLNyzyYxc9sRedM9mebQyU=; b=FaCH43yWjab6ndkadF8fIiRFz1
	zMdvViicV8uSf7OH8YbZP+N1mNCX82vf0lppr2RYLCo+zGlJRe9mjnx7EauAwuLxkvViXEtLXAc4O
	KkB4cuGmG8IsldKM5SiReNHK4rSCGBTHO28XXGAgxRwODxdSiCyZAJnZNvFJl7VMrOUL4AFrpdx42
	c0fq5Ci8Dw68TJu9WhKbcOY1ZRlQOA8Y75/uH2XK37+85pfdLzwPcY6gp4iwn6jBeboeJGMysgED3
	HdC8gy7uUGoKhwf0ZC8faNEteVT0RLwxJPM111Ubu7jBNSrD8Mqs9yP3qwKRJK8hAWKAJEXs050an
	VGtPADUQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42520)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tDPuJ-0003n3-2E;
	Tue, 19 Nov 2024 15:12:48 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tDPuH-00069E-0j;
	Tue, 19 Nov 2024 15:12:45 +0000
Date: Tue, 19 Nov 2024 15:12:45 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Gupta, Suraj" <Suraj.Gupta2@amd.com>
Cc: Sean Anderson <sean.anderson@linux.dev>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"Simek, Michal" <michal.simek@amd.com>,
	"Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
	"horms@kernel.org" <horms@kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"git (AMD-Xilinx)" <git@amd.com>,
	"Katakam, Harini" <harini.katakam@amd.com>
Subject: Re: [PATCH net-next 2/2] net: axienet: Add support for AXI 2.5G MAC
Message-ID: <Zzyq7eLyALyXnvuS@shell.armlinux.org.uk>
References: <20241118081822.19383-1-suraj.gupta2@amd.com>
 <20241118081822.19383-3-suraj.gupta2@amd.com>
 <ZztjvkxbCiLER-PJ@shell.armlinux.org.uk>
 <657764fd-68a1-4826-b832-3bda91a0c13b@linux.dev>
 <Zztml-Te38P3M7cM@shell.armlinux.org.uk>
 <BL3PR12MB65716077E66F2141CC618DD9C9202@BL3PR12MB6571.namprd12.prod.outlook.com>
 <ZzyQQV4qM_fTrpMf@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzyQQV4qM_fTrpMf@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_071308_435884_9AA39FF0 
X-CRM114-Status: GOOD (  32.99  )
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

On Tue, Nov 19, 2024 at 01:18:57PM +0000, Russell King (Oracle) wrote:
> On Tue, Nov 19, 2024 at 10:28:48AM +0000, Gupta, Suraj wrote:
> > > -----Original Message-----
> > > From: Russell King <linux@armlinux.org.uk>
> > > 
> > > On Mon, Nov 18, 2024 at 11:00:22AM -0500, Sean Anderson wrote:
> > > > On 11/18/24 10:56, Russell King (Oracle) wrote:
> > > > > On Mon, Nov 18, 2024 at 01:48:22PM +0530, Suraj Gupta wrote:
> > > > >> Add AXI 2.5G MAC support, which is an incremental speed upgrade of
> > > > >> AXI 1G MAC and supports 2.5G speed only. "max-speed" DT property is
> > > > >> used in driver to distinguish 1G and 2.5G MACs of AXI 1G/2.5G IP.
> > > > >> If max-speed property is missing, 1G is assumed to support backward
> > > > >> compatibility.
> > > > >>
> > > > >> Co-developed-by: Harini Katakam <harini.katakam@amd.com>
> > > > >> Signed-off-by: Harini Katakam <harini.katakam@amd.com>
> > > > >> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> > > > >> ---
> > > > >
> > > > > ...
> > > > >
> > > > >> -  lp->phylink_config.mac_capabilities = MAC_SYM_PAUSE |
> > > MAC_ASYM_PAUSE |
> > > > >> -          MAC_10FD | MAC_100FD | MAC_1000FD;
> > > > >> +  lp->phylink_config.mac_capabilities = MAC_SYM_PAUSE |
> > > > >> + MAC_ASYM_PAUSE;
> > > > >> +
> > > > >> +  /* Set MAC capabilities based on MAC type */  if (lp->max_speed
> > > > >> + == SPEED_1000)
> > > > >> +          lp->phylink_config.mac_capabilities |= MAC_10FD |
> > > > >> + MAC_100FD | MAC_1000FD;  else
> > > > >> +          lp->phylink_config.mac_capabilities |= MAC_2500FD;
> > > > >
> > > > > The MAC can only operate at (10M, 100M, 1G) _or_ 2.5G ?
> > > >
> > > > It's a PCS limitation. It either does (1000Base-X and/or SGMII) OR
> > > > (2500Base-X). The MAC itself doesn't have this limitation AFAIK.
> > > 
> > > That means the patch is definitely wrong, and the proposed DT change is also
> > > wrong.
> > > 
> > > If it's a limitation of the PCS, that limitation should be applied via the PCS's
> > > .pcs_validate() method, not at the MAC level.
> > > 
> > As mentioned in IP PG (https://docs.amd.com/r/en-US/pg051-tri-mode-eth-mac/Ethernet-Overview#:~:text=Typical%20Ethernet%20Architecture-,MAC,-For%2010/100), it's limitation in MAC also.
> 
> I'm not reading it as a limitation of the MAC.
> 
> The limitation stated there is that internal mode (GMII) is only
> supported for 2.5Gbps speeds. At 2.5Gbps speeds, the clock rate is
> increased from 125MHz to 312.5MHz (which makes it non-compliant
> with 802.3-2008, because that version doesn't define 2.5Gbps speeds.)
> 
> So long as the clock rate and interface can be safely switched, I
> don't see any reason to restrict the MAC itself to be either
> 10/100/1G _or_ 2.5G.
> 
> Note that 2.5G will only become available if it is supported by one
> of the supported interface modes (e.g. 2500base-X). If the supported
> interface modes do not include a mode that supports >1G, then 2.5G
> won't be available even if MAC_2500FD is set in mac_capabilities.

Reading further, PG047 which is the PCS, suggests that it can operate
at 10, 100, 1G, and 2.5G.

Moreover, what I read there is that where a PCS core supports 2.5G, it
can operate at 10, 100, 1G or 2.5G depending on the clock. Note 2 in
"Transceiver ports".

However, it doesn't support TBI at 2.5Gbps mode, only the 2500BASE-X
PMA/PMD.

Also states "The core operates at 125 MHz for the 1 Gbps data rate
(1.25Gbps line rate) and 312.5 MHz at 2.5 Gbps data rates (3.125 Gbps
line rate) in modes having device transceivers." These differences in
clocking are typical for systems that support 1G and 2.5G.

So, I'm still wondering what the limitation is. If the MAC transmit
clock can only run at 125MHz, or only at 312.5MHz, depending on the
design, then yes, it would be appropriate to limit the MAC to 1G
(and below) or 2.5G speeds.

However, if there's designs that allow the transmit clock to be
configured at run time, then the system supports both speeds.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

