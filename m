Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9851CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 04:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45/oL7TH5+TGvWd8PazpVpDzPuV3807fNqnSSyv5vlE=; b=M1+4yezYIdP4fxeA0b+llnHXOs
	f1lV9OHBQKhx6xiGRCv2Yqj5u2QLR1YBlrCCkYObffVUGrEoXpFUtObjQiSIr+DYrZM8iakQrfVdb
	4hFnCnkrPd4a7Bgw/eBNpvm5dlYp8jto5VJDjPkLzO1GscipvD+IPKVZ2LMVbnaG/CCIE3mRGVrMA
	dPokvlwOQmoHsZy1JuUUi4qyMXigQSvEnvP+zBAe8VebQdwx/ulAhVi0eSXHD1UfnY6oVAT8M6IA9
	jKgWj6Gtlve3MayHkKkyVLiBBOyK7GBXuE+FuAepXDcxPcRldxIjEXtOB/fLWWdw0lAoEeyEfR083
	/3u6y5MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upJLb-00000001VDY-46nq;
	Fri, 22 Aug 2025 04:25:51 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBd5-00000000OvW-0DGi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 20:11:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=45/oL7TH5+TGvWd8PazpVpDzPuV3807fNqnSSyv5vlE=; b=C2KVTl9Dlq7FMvTgORUrh43h8q
	0gozHCii4BfC9lUpgox1CnoDP9nxCwjv0l/HrKnsAXnHyECWvWUprDtPOd8xfjQphKKE4LfDEsTg9
	9zkADyLw1XZXh9gyS8MFIjjkVVqDE/txbb9SSmOfDIuyUip1h+SC/04rVId9xR+51YPKKvG71qcJL
	SruIRj0e9JC4HAcjXKZ5LCydV1xrUuq5HqOihi4ZFJP4MVyo/8wHiRnWOqzj6UIDmZgJRqVPpc9bz
	hVklpy/uWsV5T8lJ8LQbLKhBkriq8wqAC0RZ6ZYYqYWs82jQp8XBQIFEZXA452ja7HUBv1RlpHZ4Q
	wx7U30qQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56772)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1upBcz-000000001bF-1JAE;
	Thu, 21 Aug 2025 21:11:17 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1upBcx-000000001NS-3Mk2;
	Thu, 21 Aug 2025 21:11:15 +0100
Date: Thu, 21 Aug 2025 21:11:15 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH v2] ARM64: dts: mcbin: fix SATA ports on Macchiatobin
Message-ID: <aKd9Y4pQ7pMFL3iY@shell.armlinux.org.uk>
References: <E1up9Jw-00BbOE-VC@rmk-PC.armlinux.org.uk>
 <aKdgHGElBEyHeP67@shell.armlinux.org.uk>
 <A598C273-6EEA-4F86-8E5E-A07F80295AA6@public-files.de>
 <4d7d6e91-7ebe-4efa-8c52-949004a20812@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d7d6e91-7ebe-4efa-8c52-949004a20812@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_131123_089376_781E22AA 
X-CRM114-Status: GOOD (  21.23  )
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

On Thu, Aug 21, 2025 at 08:25:21PM +0200, Andrew Lunn wrote:
> > Hi,
> > 
> > I sent it at least twice..maybe this new was added in between.
> > But i have no marvell board for testing so i cannot verify my changes are correct.
> > I only tried to fix binding errors.
> > regards Frank
> 
> You might be able to use ./scripts/dtc/dtx_diff
> 
> Generate the DTB before the change and after, and they should be
> identical if the disable in the dtsi is correctly re-enabled in the
> .dts file.

I'm not sure that would help, because before Frank's patch, there were
no "status" properties in any of the sata-port nodes. After Frank's
patch, we end up with a mixture of "okay" and "disabled" depending
on whether the port is actually used - and the problem here is catching
all those that are actually being used on the hardware. In other words,
those notes that should have status = "okay" rather than status =
"disabled" added to them.

As I just stated, using grep:

$ grep -rA4 sata-port@ arch/arm64/boot/dts/marvell

is sufficient to find all the locations in the dts(i) files that have
a sata-port node defined, and in the context gives the rest of the
node properties, thus showing whether there is a status property present
or missing.

This is _exactly_ how I've identified that there are two more platforms
that are similarly broken.

This is not something that one can trivially check by doing a boot test
on platforms - I missed it despite booting the kernel on another
Macchiatobin as it's only a single kernel message amongst many that
says that something's wrong.

The only real way of doing this kind of change is to use grep and
similar to check that all sites have been caught.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

