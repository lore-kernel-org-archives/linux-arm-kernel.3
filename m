Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067C2CA0FE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 00:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LEW2I1czzyMeSYLfep8ZMRopXKRwX2OobVyqzpp69zA=; b=z2iAsL12/RFxTQOSWYNPNShvvo
	KhTjPu6wGxBQPYFY5rOCm2uQj3eYzEqakge0LVipnhsMc/dxdQjoMktJ6mQkkL55wmf+Kv+fQFEhq
	Of3jCxRizuYwqgsGorPKO/LiBaywcFgwEiOzcyD6N7++rHL+PHAtP6YiZ0N9YNmIy8wPNpbCHAgKc
	cH7P2oo1ntRy/b23D0uuSpbEr+vZ2krwV+uFAK4tTl5RHhD3GmJWO8+4ruJsmPyKeXloDT9JrCI8B
	jLOmxYFXGmsGIZDSLILCnXAUhgAGPJYQDOpGLDM5AVIxhE6RPE9OifsqVsewSFICh5y6vS2zR3PIK
	lk9oABTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFcY-000000011ZN-3xh3;
	Fri, 22 Aug 2025 00:27:06 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBSW-00000000Mov-2sGi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 20:00:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LEW2I1czzyMeSYLfep8ZMRopXKRwX2OobVyqzpp69zA=; b=jS+BWXocQtJe2lsrRpis+FI719
	Yq2WuUIGnfIs8pxCZrjqDBhbhqygL7Wb7fbzdGNoK6Fk++4O2W/0YBat8PmYlhqs/9RwtgCNGtXqu
	9RvMIc+3o88b6G3mQ1lG7UZw7v7xr4Glx5R+W7uzyeMoDMaJ2p3toSenoLLdIFOhbj1xhLLpRaOb1
	z+E6f6zCIjtSnLCo2VJVWSwTMbUGmUi63iQNL1L1povm7BTH2E9GzhXNgWpTUOkBHJNcOkMx8L7c4
	znFhOeLEc4bhqVZerWfO/44/lWexEaxwYji3Ix3yuLeVpF8nQIdnOZYcDuH0VkB75Og2iz+mZ/ZTx
	+oh5wVqw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40740)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1upBSQ-000000001au-1ESV;
	Thu, 21 Aug 2025 21:00:22 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1upBSO-000000001MS-2U9R;
	Thu, 21 Aug 2025 21:00:20 +0100
Date: Thu, 21 Aug 2025 21:00:20 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH v2] ARM64: dts: mcbin: fix SATA ports on Macchiatobin
Message-ID: <aKd61N0AptNzYc0Z@shell.armlinux.org.uk>
References: <E1up9Jw-00BbOE-VC@rmk-PC.armlinux.org.uk>
 <aKdgHGElBEyHeP67@shell.armlinux.org.uk>
 <A598C273-6EEA-4F86-8E5E-A07F80295AA6@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A598C273-6EEA-4F86-8E5E-A07F80295AA6@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_130028_736814_E893C4A2 
X-CRM114-Status: GOOD (  30.49  )
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

On Thu, Aug 21, 2025 at 08:20:07PM +0200, Frank Wunderlich wrote:
> Am 21. August 2025 20:06:20 MESZ schrieb "Russell King (Oracle)" <linux@armlinux.org.uk>:
> >On Thu, Aug 21, 2025 at 06:43:28PM +0100, Russell King (Oracle) wrote:
> >> Booting 6.16 on the Macchiatobin, I discover that I can no longer
> >> access my disks, and thus the userspace boot fails. The cause appears
> >> to be that one of the SATA controllers doesn't have any ports:
> >> 
> >> [    1.190312] ahci f4540000.sata: supply ahci not found, using dummy regulator
> >> [    1.196255] ahci f4540000.sata: supply phy not found, using dummy regulator
> >> [    1.202026] ahci f4540000.sata: No port enabled
> >> 
> >> This is as a result of the blamed commit below which added a default
> >> disabled status to the .dtsi, but didn't properly update the mcbin
> >> dtsi file. Fix this regression.
> >> 
> >> Fixes: 30023876aef4 ("arm64: dts: marvell: only enable complete sata nodes")
> >> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> >
> >Frank,
> >
> >I think this is also similarly broken by your patch:
> >
> >arch/arm64/boot/dts/marvell/armada-8040-db.dts
> >
> >as you've updated the ports on one SATA controller but not the other
> >in the same way as you omitted the second controller on mcbin.
> >
> >I'd also question this:
> >
> >arch/arm64/boot/dts/marvell/cn9132-clearfog.dts
> >
> >as you updated the other cn9132, but not this one which was introduced
> >in 6.11, and your change was in 6.13. Please can you look at both of
> >these and send appropriate fixes?
> >
> >Thanks.
> >
> 
> Hi,
> 
> I sent it at least twice..maybe this new was added in between.

Nope. You patched Macchiatobin badly - you failed to use grep to find
all the sites that you needed to update.

$ grep -rA4 sata-port@ arch/arm64/boot/dts/marvell

would've shown you where you need to patch.

The timeline here is:

- I added support for Macchiatobin in November 2018. There was no need
  to describe the ports at that point.

- Miquel Raynal updated the description in July 2019 to add the
  sata-port nodes for each of the _three_ ports that are present on
  the hardware.

- You patched the file in January 2025, only touching the cp0_sata0
  device, ignoring the cp1_sata0 description below it.

So no, it has not been added since, it was always there.

> But i have no marvell board for testing so i cannot verify my changes
> are correct.

It will only show up if one has a platform that has disks connected
to all three SATA connectors, otherwise it's lost in the kernel boot
log noise.

The only way to do this is to take care, use grep to find all the
sites that need to be updated, make the changes, and then check again
using grep that you have indeed got all the necessary sites.

> I only tried to fix binding errors.

I have to say that this is the root of the problem - while it may
seem helpful to fix warnings etc one sees, it is only helpful if they
are done carefully and with utmost care to avoid the attempt causing
a regression.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

