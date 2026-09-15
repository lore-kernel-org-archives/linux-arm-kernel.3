Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8A5C88E7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 19:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3hXn1baUNhRBy6ZdAycWNIKKqnZoz6mdI1Ok9vpRhU4=; b=0nJfNwDOUvu5Eav++1+ARbu+uq
	VseSM038CnoMGXbIUhAoRqcHCSAwLEUcJQjwR9I3kOkcVQ5LfzmipokJnPzA2d2z0//qh1QFylWIj
	My5QZrBgZKxhHeADfK6fMMFOSmcFaYk4YvXJgdoa+fw6oLW/hAsFHKB4IYwwOX1Y/aVFF6nA5Cqqn
	kvZu24PPuakykVlhxXo8SP1ZSkxORmubIoWZiElczjAbzGsZ6adeapJdS/U7a/VBlJSni8WXBTK1l
	rkmlS1FyPDcJgWowmIXW9zBFIUCZckzUPmKxoAQaShI8kHzginkgKmGnXMx352g1+hDLL53sLwHUK
	9YEwmjuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ZIA-00000007tlT-3iIr;
	Tue, 15 Sep 2026 19:58:11 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ZI8-00000007tkl-3Ld1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 19:58:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3hXn1baUNhRBy6ZdAycWNIKKqnZoz6mdI1Ok9vpRhU4=; b=bsCxyAg7Vr88tUywNVj/X/NAlB
	F1JWOCIYcR6qiIsC8AWkNSB8NA/itPjfBE1/4jB4GvKFB3rAWKBy2xVvPWncbnN7nMmVrtBtgVTNL
	CA/a9Nv5jaK4B7zfk+WJ+GIw0jl2CnP3uWHYog6NGsE7EPcy1LVsRk/2SvVeEQoRNaE4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x6ZHw-005LFQ-Mk; Tue, 15 Sep 2026 21:57:56 +0200
Date: Tue, 15 Sep 2026 21:57:56 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Rob Herring <robh@kernel.org>,
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
Message-ID: <95dcbf3e-193d-460b-b6b9-cd412394e4c6@lunn.ch>
References: <20260911091952.96233-1-francesco@dolcini.it>
 <20260911091952.96233-4-francesco@dolcini.it>
 <42ed88a6-d208-482b-94aa-2e45b69c173e@lunn.ch>
 <20260915132806.GA226756@francesco-nb>
 <100eef7b-e1d6-411b-bac5-98790e8f9ea7@lunn.ch>
 <aqmG91HwmKe-enfy@francesco-nb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqmG91HwmKe-enfy@francesco-nb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_125808_841331_7EA82789 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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

> Would you mind to articulate in which situation such race condition can
> happen?

Most PHYs have a number of interrupt sources. Taking a random example:

/* DM9161 Interrupt Register */
#define MII_DM9161_INTR_DPLX_CHANGE     0x0010
#define MII_DM9161_INTR_SPD_CHANGE      0x0008
#define MII_DM9161_INTR_LINK_CHANGE     0x0004

#define MII_DM9161_INTR_CHANGE  \
        (MII_DM9161_INTR_DPLX_CHANGE | \
         MII_DM9161_INTR_SPD_CHANGE | \
         MII_DM9161_INTR_LINK_CHANGE)

and a completely made up example which results in problems...

Three interrupts are enabled. Say the PHY reports a duplex change
first. That causes the interrupt line to go low, giving a downward
edge. The interrupt handler fires, and reads the interrupt status
register. In order the clear the interrupt you need to access another
register about duplex. Before you do that, the link interrupt fires,
setting the link bit in the status register. However, there is not
another edge, because the duplex interrupt has not been cleared
yet. The PHY driver does clear the duplex interrupt and exits the
interrupt handler.

The interrupt line is still low, indicating a link interrupt, but
without an edge, no interrupt handler is triggered. The interrupt has
been lost, and the link is reported down, despite being up.

If however you are using level interrupts, as soon as the interrupt
handler exits, and reenables the interrupt in the parent interrupt
controller, it fires again, and the link interrupt is handled.

If you have multiple interrupts indicated by a single line, you should
use level handling in the parent interrupt controller.

	Andrew

