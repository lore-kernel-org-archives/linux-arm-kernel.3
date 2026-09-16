Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F94EC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 05:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I+tkhFfWBsJlP15FZEQQsLoKTghh1QY7GM+Pdd6KOXw=; b=KFKM8GKv23RfcK9ThAzNzQPcQY
	pR5hvmFBZzWESEjVJW9hJL304egktLTR7OcSECejM6tkskTutpoCupYnYzvqDYgDNmkDV0l6HEw+R
	1NNP0ryE1SkGvAHtaR6liWqsr8NIQCC6s81KJbU280lVP3cG982yIPLS0v5Pvhf16oqT2APw9UJ2r
	MPvVRUja/zhUu1PKDdlwjxCTJwzkNDbWNq0YcjuuiNV0K0uVI8pnX0hYCMvRANpwp53jGHs4Q8n4R
	ifSMYk0gipBFLUeP7JKamQKHQp0MrhMtPPCwp2Nbfa5Kl3CaVUVFo4zwv7skavwh7ASt3MycyInVh
	j+81uMRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ies-00000008R1r-3zdt;
	Wed, 16 Sep 2026 05:58:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ie1-00000008Qng-0syC
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 05:57:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=I+tkhFfWBsJlP15FZEQQsLoKTghh1QY7GM+Pdd6KOXw=; b=XHcHAFS0lAWHxW3ijzwRKtcNmW
	EFz2WXDFT+4SwAmhPDvw8kGk/Wlzi8UpMQBhyGoYoDn7x2Nv49i1One/on50nneSOvnR0qM/kEWnr
	B7QfooxAhms8Jpvsok5E2e405FVe0Wq/UNtXL2X3I03ihymLYp2NgM5Osla1XU2EVEOcxN5kFb1Y4
	u49UJSzmEm1faqDylv8y0qydbFSjOyQBrlbbZXdLp0EQi7n6BzEHuZu2eujIc/bjp9ZAUzhQ+3aHs
	yiioif1t6kaBCGY04FPQyuzjjqaQtCYxyG+ELPrpSy+zqr18dCTMhj0hgPoIC5O0rC0e5wlv38c4Y
	BZ2WpHwQ==;
Received: from mail11.truemail.it ([217.194.8.81])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6idx-00000007W5T-13C3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 05:57:19 +0000
Received: from francesco-nb (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 0ED471FC29;
	Wed, 16 Sep 2026 07:57:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789538231;
	bh=I+tkhFfWBsJlP15FZEQQsLoKTghh1QY7GM+Pdd6KOXw=; h=From:To:Subject;
	b=fx9Qj3JZ2EMKzxNkjNReNY44VYRgPYzHAHBCHTH6s1fnwISrik4vk57VVsohipOia
	 dpj8A7BVuE6jSnPeL50iZRrViP+bpLASPYVBs2dceMgORVJJerYBOpgY0J7BfaRCjv
	 2CJqhgSgotHJmdUvRy4zKpWYUdwD51So/ALnBUNcwgZ+zSs4947ApkcuKjkmpk8qtL
	 JJFicrOGLAd8pa0GK3uTfgFIvabqMkt4m6UESgc87jII3t9mEkCgZM/g/8menIiTO8
	 b0hOKS2o4gNRlbTJQYYgUdrhtB+FOdTJ1NE4oXKcyMHbpCsutI07YePPnud51g7oZT
	 6qfMbGg45nwSA==
Date: Wed, 16 Sep 2026 07:57:06 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Franz Schnyder <franz.schnyder@toradex.com>
Subject: Re: [PATCH v2 3/7] arm64: dts: freescale: Add Lino iMX93
Message-ID: <20260916055706.GA20310@francesco-nb>
References: <20260911091952.96233-1-francesco@dolcini.it>
 <20260911091952.96233-4-francesco@dolcini.it>
 <42ed88a6-d208-482b-94aa-2e45b69c173e@lunn.ch>
 <20260915132806.GA226756@francesco-nb>
 <100eef7b-e1d6-411b-bac5-98790e8f9ea7@lunn.ch>
 <aqmG91HwmKe-enfy@francesco-nb>
 <95dcbf3e-193d-460b-b6b9-cd412394e4c6@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95dcbf3e-193d-460b-b6b9-cd412394e4c6@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_065717_608184_C938ECB6 
X-CRM114-Status: GOOD (  18.05  )
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

Hello Andrew,
thanks a lot for the detailed explanation.

On Tue, Sep 15, 2026 at 09:57:56PM +0200, Andrew Lunn wrote:
> > Would you mind to articulate in which situation such race condition can
> > happen?
> 
> Most PHYs have a number of interrupt sources. Taking a random example:
> 
> /* DM9161 Interrupt Register */

...

> The interrupt line is still low, indicating a link interrupt, but
> without an edge, no interrupt handler is triggered. The interrupt has
> been lost, and the link is reported down, despite being up.
> 
> If however you are using level interrupts, as soon as the interrupt
> handler exits, and reenables the interrupt in the parent interrupt
> controller, it fires again, and the link interrupt is handled.
> 
> If you have multiple interrupts indicated by a single line, you should
> use level handling in the parent interrupt controller.

I looked into the specific ethernet phy used here, TI DP83867, and
I would say that the falling edge interrupt should be safe on this
specific board/phy.

There is a single ISR register, and it's a single read/clear atomic
operation (MII_DP83867_ISR 0x13, dp83867_ack_interrupt).  This is done
before doing any access to any other register, so the interrupt will
just fires again if anything happen. I do not see the race condition window.

I know it is not conclusive, but we have multiple boards with the
same edge interrupt configuration and the same ethernet phy (the
interrupt is wired directly to a TI SoC, that supports only edge
interrupt, not to a gpio expander) and we never had any failure. Our
test coverage is quite good IMO, commit 91a7cda1f4b8 ("net: phy: Fix
race condition on link status change") is something I did because our
testing had some sporadic failures for a different race condition.

What do you think? *IF* my reasoning is correct I would suggest to keep
the code as it is now.

Francesco


