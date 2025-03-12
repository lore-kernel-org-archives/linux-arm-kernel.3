Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8766AC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 19:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F33ePOWArlXRReOL+ROoU2zMPCNTE1WroPgaIoYuTZ4=; b=0TWiJqmoJefQWirr5pY6aXB4Zq
	wVu5d1my9OOQ9t1S2HuwGlzzqPxHDKcV5pMur9p8UroJ3JE91GWfUQwQE6HKVLIyIZ5hZofJnbQ3A
	bJ2QF3ArNCnP5ctS0dbbpBPa8q9vxCr03+PpIm/wMkorpPKwbzqa1Y9fSis2wvFP+LfzI2QJFBbg4
	K40BvlAL1UDPUNNAaFo0xECqR+5zkU6VpbQqFcIA9U0SJ3QZf8Snr1Cpxy0gW/FpgDg18zsm8ybiA
	xwIpYFlRrw3MU9UQzao6AUCwxNnhbw/pE3+h0NckE5UeziOO4dhX3lJ65kGKbCZv2Ofli/mZk+JvP
	9BOsgv4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsRzZ-00000009MQZ-49Vz;
	Wed, 12 Mar 2025 19:43:49 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsRwp-00000009M1V-0hra
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 19:41:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=F33ePOWArlXRReOL+ROoU2zMPCNTE1WroPgaIoYuTZ4=; b=KtN+MmIK5oqH/DVENgXBtOHXPl
	ltCNMiJ+zxb5qPcZ1udz+U4sLwA3Oa1S+wAb8vS1PLc4CdiW4lAJLqTkoszXIcYbi/eT/rS+uBM9a
	fs0gCOztnapuKDeAejq8miFq3rReKS8hF9Wn2VWBHhes7gY+UUf5BhVsiXVgZ9HS9tjXnNpax3vht
	QjlaqYF9CpL6Bl3HrJrkfRvIYz1/V6MM7c6pDuMVINuSjkDfawXFkE+uggePUgoIvQ1GDMQcyVx8L
	coaQO3hQfyil1uyfkvotzqTmuyxtEPRXppQGvfBx0e0BaW1FENu06qrqUR4TlF/c0oFMDTIlL0rhF
	RB3ba9Vg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40360)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tsRwZ-00063Y-1c;
	Wed, 12 Mar 2025 19:40:43 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tsRwW-0004oj-3A;
	Wed, 12 Mar 2025 19:40:41 +0000
Date: Wed, 12 Mar 2025 19:40:40 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Gupta, Suraj" <Suraj.Gupta2@amd.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	"Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"Simek, Michal" <michal.simek@amd.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"git (AMD-Xilinx)" <git@amd.com>,
	"Katakam, Harini" <harini.katakam@amd.com>
Subject: Re: [PATCH net-next V2 2/2] net: axienet: Add support for 2500base-X
 only configuration.
Message-ID: <Z9HjOAnpNkmZcoeo@shell.armlinux.org.uk>
References: <20250312095411.1392379-1-suraj.gupta2@amd.com>
 <20250312095411.1392379-3-suraj.gupta2@amd.com>
 <ad1e81b5-1596-4d94-a0fa-1828d667b7a2@lunn.ch>
 <Z9GWokRDzEYwJmBz@shell.armlinux.org.uk>
 <BL3PR12MB6571795DA783FD05189AD74BC9D02@BL3PR12MB6571.namprd12.prod.outlook.com>
 <34ed11e7-b287-45c6-8ff4-4a5506b79d17@lunn.ch>
 <BL3PR12MB6571540090EE54AC9743E17EC9D02@BL3PR12MB6571.namprd12.prod.outlook.com>
 <fd686050-e794-4b2f-bfb8-3a0769abb506@lunn.ch>
 <BL3PR12MB6571959081FC8DDC5D509560C9D02@BL3PR12MB6571.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL3PR12MB6571959081FC8DDC5D509560C9D02@BL3PR12MB6571.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_124059_356194_A3038B37 
X-CRM114-Status: GOOD (  29.11  )
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

On Wed, Mar 12, 2025 at 04:08:02PM +0000, Gupta, Suraj wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> > -----Original Message-----
> > From: Andrew Lunn <andrew@lunn.ch>
> > Sent: Wednesday, March 12, 2025 9:03 PM
> > To: Gupta, Suraj <Suraj.Gupta2@amd.com>
> > Cc: Russell King <linux@armlinux.org.uk>; Pandey, Radhey Shyam
> > <radhey.shyam.pandey@amd.com>; andrew+netdev@lunn.ch;
> > davem@davemloft.net; edumazet@google.com; kuba@kernel.org;
> > pabeni@redhat.com; robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > Simek, Michal <michal.simek@amd.com>; netdev@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> > kernel@lists.infradead.org; git (AMD-Xilinx) <git@amd.com>; Katakam, Harini
> > <harini.katakam@amd.com>
> > Subject: Re: [PATCH net-next V2 2/2] net: axienet: Add support for 2500base-X only
> > configuration.
> >
> > Caution: This message originated from an External Source. Use proper caution
> > when opening attachments, clicking links, or responding.
> >
> >
> > On Wed, Mar 12, 2025 at 03:06:32PM +0000, Gupta, Suraj wrote:
> > > [AMD Official Use Only - AMD Internal Distribution Only]
> > >
> > > > -----Original Message-----
> > > > From: Andrew Lunn <andrew@lunn.ch>
> > > > Sent: Wednesday, March 12, 2025 8:29 PM
> > > > To: Gupta, Suraj <Suraj.Gupta2@amd.com>
> > > > Cc: Russell King <linux@armlinux.org.uk>; Pandey, Radhey Shyam
> > > > <radhey.shyam.pandey@amd.com>; andrew+netdev@lunn.ch;
> > > > davem@davemloft.net; edumazet@google.com; kuba@kernel.org;
> > > > pabeni@redhat.com; robh@kernel.org; krzk+dt@kernel.org;
> > > > conor+dt@kernel.org; Simek, Michal <michal.simek@amd.com>;
> > > > netdev@vger.kernel.org; devicetree@vger.kernel.org;
> > > > linux-kernel@vger.kernel.org; linux-arm- kernel@lists.infradead.org;
> > > > git (AMD-Xilinx) <git@amd.com>; Katakam, Harini
> > > > <harini.katakam@amd.com>
> > > > Subject: Re: [PATCH net-next V2 2/2] net: axienet: Add support for
> > > > 2500base-X only configuration.
> > > >
> > > > Caution: This message originated from an External Source. Use proper
> > > > caution when opening attachments, clicking links, or responding.
> > > >
> > > >
> > > > > > On Wed, Mar 12, 2025 at 02:25:27PM +0100, Andrew Lunn wrote:
> > > > > > > > +   /* AXI 1G/2.5G ethernet IP has following synthesis options:
> > > > > > > > +    * 1) SGMII/1000base-X only.
> > > > > > > > +    * 2) 2500base-X only.
> > > > > > > > +    * 3) Dynamically switching between (1) and (2), and is not
> > > > > > > > +    * implemented in driver.
> > > > > > > > +    */
> > > >
> > > > > - Keeping previous discussion short, identification of (3) depends
> > > > > on how user implements switching logic in FPGA (external GT or RTL
> > > > > logic). AXI 1G/2.5G IP provides only static speed selections and
> > > > > there is no standard register to communicate that to software.
> > > >
> > > > So if anybody has synthesised it as 3) this change will break their system?
> > > >
> > > >         Andrew
> > >
> > > It will just restrict their system to (2)
> >
> > Where as before, it was doing SGMII/1000base-X only. So such systems break?
> >
> >         Andrew
> 
> If the user wants (3), they need to add their custom FPGA logic which anyway will require additional driver changes. (3) was not completely supported by existing driver.

This is not an approach that works with the Linux kernel, sorry.

What we have today is a driver that works for people's hardware - and
we don't know what the capabilities of that hardware is.

If there's hardware out there today which has XAE_ABILITY_2_5G set, but
defaults to <=1G mode, this will work with the current driver. However,
with your patch applied, it stops working because instead of the driver
indicating MAC_10FD | MAC_100FD | MAC_1000FD, it only indicates
MAC_2500FD. If this happens, it will regress users setups, and that is
something we try not to do.

Saying "someone else needs to add the code for their FPGA logic" misses
the point - there may not be "someone else" to do that, which means
the only option is to revert your change if it were merged. That in
itself can cause its own user regressions because obviously stuff that
works with this patch stops working.

This is why we're being cautious, and given your responses, it's not
making Andrew or myself feel that there's a reasonable approach being
taken here.

From everything you have said, I am getting the feeling that using
XAE_ABILITY_2_5G to decide which of (1) or (2) is supported is just
wrong. Given that we're talking about an implementation that has been
synthesized at 2.5G and can't operate slower, maybe there's some way
that could be created to specify that in DT?

e.g. (and I'm sure the DT folk aren't going to like it)...

	xlnx,axi-ethernet-X.YY.Z-2.5G

(where X.YY.Z is the version) for implementations that can _only_ do
2.5G, and leave all other implementations only doing 1G and below.

Or maybe some DT property. Or something else.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

