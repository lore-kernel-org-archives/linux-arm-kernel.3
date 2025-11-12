Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72EBCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 12:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lU6jZkeZpiccZijv3aker05TIimOBqJ5loP8s0voplg=; b=C4s3mis6BZ6Cd8Uxu8wkkWKkD5
	KeinvNGru3uAJQVX8x81Jc2Gpnq1nI74LrhWn/gzZIzOOOCEuSvJL/KjWlZ5XukIRaNsU3MH/LIho
	4u8hruKa22PZrr3n2tROSuNf8rjzRGlc9AgBKith7ovAWE0+oCZhH0ROr5OchUmnM2/ebPxUYLgPf
	zhhiNFrDcHGV1mu3lzGBcat9DfzUWy7/AMNC9pp/+H4NYh91jCF1JL+/XgvqHuXq1skvexTMprkS/
	P+GCcY1UQIF+Nt0SXOdxVP2nUa+2m6/wgZK4JbVX9mVQ6vLrURrThsnE/6EkYJHGEH8hVbEUIoKkE
	vE7+LHFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJA3r-00000008mYh-32r3;
	Wed, 12 Nov 2025 12:34:55 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJA3p-00000008mY2-2t4c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 12:34:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lU6jZkeZpiccZijv3aker05TIimOBqJ5loP8s0voplg=; b=JuSd8DtrtxZHo+q7x6jNuqyhbo
	Eo9hGjnc+ZerLKyTFmDMb1hhueSDKbxjz7l8sUMngWorzKWh5b0ywy22T2UlWRO7KNNKHwNqGCSyX
	2qKfp96th4vtX+Os7B5Sbl2d0LTwy3YkweYyLvoQr/9SR+VwBZWiEfOf7n4WSxt8y3pFML7u9G/jV
	oYFIPpHltz+Bt/THIZytvxIYGwJ3r716lchKojdF/G+IVxGc8ldr5V7Rqjm2LaCJ0gbvdksypXYVF
	q7Ey1X1TEmEwJnVt6ca+4M5kE6PbzF+7Z9M8lLXjEyaXYMjwix7GbvkfNkvG0XjCmxisjALerzWdR
	iXlJV5mQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43608)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vJA3l-000000003t5-3LII;
	Wed, 12 Nov 2025 12:34:49 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vJA3k-000000003sa-1FY7;
	Wed, 12 Nov 2025 12:34:48 +0000
Date: Wed, 12 Nov 2025 12:34:48 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <aRR-6Nl3ELB2v8gV@shell.armlinux.org.uk>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
 <aP83bMDWCre7-Sjw@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aP83bMDWCre7-Sjw@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_043453_742034_24F86178 
X-CRM114-Status: GOOD (  19.87  )
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

On Mon, Oct 27, 2025 at 10:12:12AM +0100, Oleksij Rempel wrote:
> Please note, RTL8211E PHY do use undocumented SmartEEE mode by default.

Same as RTL8211F I believe (as used on the Jetson Xavier NX platform I
have.) I submitted commit bfc17c165835 ("net: phy: realtek: disable
PHY-mode EEE") to get EEE working on this platform.

> It ignores RGMII LPI opcodes and doing own thing. It can be confirmed by
> monitoring RGMII TX and MDI lines with oscilloscope and changing
> tx-timer configurations. I also confirmed this information from other
> source. To disable SmartEEE and use plain MAC based mode, NDA documentation
> is needed.

What I saw there was similar to what you describe (although I have no
way to monitor these signals.) No interrupt storms, but while the
stmmac TX path would enter LPI mode (whether that provoked anything
in the PHY, I do not know), the RX path never entered LPI mode because
the PHY never forwarded that status.

So, I don't think having SmartEEE enabled on the RTL8211E would cause
this interrupt storm that Laurent is reporting.

In Emanuele's case, things are different. The TI PHY reports that EEE
is supported, implements the autoneg registers for EEE, but *doesn't*
implement the necessary hardware for detecting/entering/exiting LPI
mode. So, if EEE is negotiated, the remote end thinks it can enter
LPI mode... which likely causes the link to drop as the TI PHY can't
cope with that, and I suspect that's the cause of Emanuele's problem.

I'm wondering why "arm64: dts: imx8mp: add cpuidle state "cpu-pd-wait""
impacts this - could it be that entering the idle state does more than
just affecting the CPU domain, but interferes with the EQOS domain in
some way. Given that the entry/exit to this state is all buried in
PSCI stuff, without digging through the ATF implementation for this
platform and then cross-referencing the iMX8M documentation, I don't
know what effect this has on the system. Is it possible that PSCI is
messing with the EQOS?

What about the clock tree? Is it possible that the stmmac and/or RGMII
clocks could be lost when cpu-pd-wait state is entered on all CPUs?

Has anyone checked whether there's anything in the errata
documentation?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

