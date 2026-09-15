Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF5EC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 16:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtjhYharta0kivYdIPNAaN7YMmTxSs/zZpGGaIGucV4=; b=dTDhvHVC+6v3f56RBYghoWLg7p
	qcIEXAWr4yVakkMZ0GvowMWxu1Rk1ZOnUTMlBKzDjbFKxxUQUMKVWk19Kmp/rC3Ueqt+twJhhU/zI
	o/h5hU4oHxh3+Fb+MPN6JCxIZwE5LO+fRLcwW7k0KHvOQrMCfRnplhmzLYAlmSPTuZl9JJHjUi53c
	9GGmIkfiRtmagds5tHMySsdYER8BIe8+bVvvbwdKmV/RoIKSXDiflQSe99YjoE/EYrMcUKT7H8NoB
	ePwk+x+aUCoIkYc59uoDDqYsNqGMCQS3dG5+RE5Dt+ETe7vLJDU5hYCfQ+fx4YkxyxaZkJ3jePgXg
	wWDpw9eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WLZ-00000007UNW-36bK;
	Tue, 15 Sep 2026 16:49:29 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WLX-00000007UMv-3vi4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 16:49:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xtjhYharta0kivYdIPNAaN7YMmTxSs/zZpGGaIGucV4=; b=T1vPOGEefpHtsFpnGzCF0cC40Z
	DVSD+cr+mnNnE1iXzuntsCtbw+ERlW+tYCLLRbzGOfQycMVcvh3AG2ZcIWgBG6CiqZRRgwz5g3lFe
	MqsGorSinRKDBb0kDk061OeHvRIZzuWlZcL5CPC/39XumXC6WBXwWL9ZfJaoi0REffr8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x6WLP-005JkN-6Z; Tue, 15 Sep 2026 18:49:19 +0200
Date: Tue, 15 Sep 2026 18:49:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Franz Schnyder <franz.schnyder@toradex.com>
Subject: Re: [PATCH v2 3/7] arm64: dts: freescale: Add Lino iMX93
Message-ID: <100eef7b-e1d6-411b-bac5-98790e8f9ea7@lunn.ch>
References: <20260911091952.96233-1-francesco@dolcini.it>
 <20260911091952.96233-4-francesco@dolcini.it>
 <42ed88a6-d208-482b-94aa-2e45b69c173e@lunn.ch>
 <20260915132806.GA226756@francesco-nb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915132806.GA226756@francesco-nb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_094927_981061_D8D9E9B5 
X-CRM114-Status: GOOD (  13.16  )
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

On Tue, Sep 15, 2026 at 03:28:06PM +0200, Francesco Dolcini wrote:
> Hello Andrew,
> thanks for the review.
> 
> On Tue, Sep 15, 2026 at 03:19:45PM +0200, Andrew Lunn wrote:
> > > +	ethphy1: ethernet-phy@1 {
> > > +		reg = <1>;
> > > +		interrupt-parent = <&adapter_gpio_expander>;
> > > +		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
> > 
> > Falling interrupts is probably wrong. They are normally level, active
> > low.
> 
> 
> It is wanted. The I2C ioexpander component used for the interrupt
> supports only edge interrupts. We tested it and it works fine like that.

It works, until it does not work, because you hit a race condition
with the hardware, two interrupts in quick succession. The second one
gets lost, and your link remains down forever.

>  - when we tested it, the SW emulation was not really reliable, and we
>    prefer to play on the safe side

If you want to be safe, delete the interrupt properties and let phylib
poll the PHY. That always works.

     Andrew

