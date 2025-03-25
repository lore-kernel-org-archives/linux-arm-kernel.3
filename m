Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E75C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 15:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UEb2Y00Ew1puHYL5oaOzdh6VZps8lUZ2BRTU7aqo884=; b=1QJWdw/gAOIu7clDBddI0hYAqg
	FoaXRVEIOaDyy+8TZhp+gdjuNRFJhodMdena3qqL2P0RhbaQVxvAz8sKh+Dk+N8IqZHAQ7KcE73fo
	ktjg7wHaTba7cMMXqF0e7H8AbP4LB/J3uP2/gfWq8ATu2gGCu3vVLZhCbXprcIh/fpGzyXmIeVOke
	6CKvg4R05CKMrIE5CmfAFIqVzQktEH5WHYu3MTLulfbqmIm4cKSb4WqtvI5ShicO/poBY3h3KXYto
	Vi8zvvOO6KfTMhvhBWlyHDwf32uebv7mCP7VkYEhmDgbfAXyDzQgI57KzShEj+qkHUacdep2kZcPT
	vDC2ZxJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6M5-00000006MEJ-3lTk;
	Tue, 25 Mar 2025 15:38:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6Il-00000006Ls6-2t1M
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Mar 2025 15:34:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UEb2Y00Ew1puHYL5oaOzdh6VZps8lUZ2BRTU7aqo884=; b=ka8gOhQmg3IOhep8D5GuUMG1NH
	THjfkAOuZFKKiyP+LssjeueFzMro4mjhWYquWnvKqV+ZSvkZyWY7x6aG+Wkb5XtnRg9nD6jnUwjcL
	F3EWOZQEsSRNTszNlUAHZizoNqjf11luJkHKb8f2/2IurWujolkSHLCXE63ChtLpWD7GgiOGZ70i0
	/p2trsPxU4pwyyKhct11xn4Rkg3hayq4a3IQbLIYzsZKLY1qBrQXaRgWJ4ijlgA0f4fxmgMXcwOAD
	jOe6sDr/rehAPFSnCGOYJMsbusenjI4OcxiftX+DgBWPQugvE7SeloxUnCGKpXlz4uTjNehwVZk6x
	ATXnb4Vw==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6Ih-00000005cLP-21rA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 15:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=UEb2Y00Ew1puHYL5oaOzdh6VZps8lUZ2BRTU7aqo884=; b=tVuLplN5WM4nKBrIbNca5mB2VL
	XKuL5B8epwLBxeRFpLYyDpPUaP3agKjFVURZ2qFL68dSs8UpHYUFfCxOVzJK6OQkv1LjafhA2CSnZ
	Tj/AFtGcuTk5o56Y7zIU5NOfRXY++dJA4S7kjstxekncmTK6cC9J0AuN/h9rSPirk+94=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tx6IX-0074Yt-MM; Tue, 25 Mar 2025 16:34:37 +0100
Date: Tue, 25 Mar 2025 16:34:37 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lukasz Majewski <lukma@denx.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, davem@davemloft.net,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH 5/5] net: mtip: The L2 switch driver for imx287
Message-ID: <0a908dc7-55eb-4e23-8452-7b7d2e0f4289@lunn.ch>
References: <20250325115736.1732721-1-lukma@denx.de>
 <20250325115736.1732721-6-lukma@denx.de>
 <32d93a90-3601-4094-8054-2737a57acbc7@kernel.org>
 <20250325142810.0aa07912@wsk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325142810.0aa07912@wsk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_153447_640347_B6A739AF 
X-CRM114-Status: GOOD (  32.29  )
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

> > > +config FEC_MTIP_L2SW
> > > +	tristate "MoreThanIP L2 switch support to FEC driver"
> > > +	depends on OF
> > > +	depends on NET_SWITCHDEV
> > > +	depends on BRIDGE
> > > +	depends on ARCH_MXS || ARCH_MXC  
> > 
> > Missing compile test
> 
> Could you be more specific?

config FEC
        tristate "FEC ethernet controller (of ColdFire and some i.MX CPUs)"
        depends on (M523x || M527x || M5272 || M528x || M520x || M532x || \
                   ARCH_MXC || ARCH_S32 || SOC_IMX28 || COMPILE_TEST)

|| COMPILE_TEST

So that it also gets build on amd64, s390, powerpc etc. The code
should cleanly build on all architectures. It if does not, it probably
means the code is using the kernel abstractions wrong. Also, most
developers build test on amd64, not arm, so if they are making tree
wide changes, you want this driver to build on amd64 so such tree wide
changes get build tested.

> There have been attempts to upstream this driver since 2020...
> The original code is from - v4.4 for vf610 and 2.6.35 for imx287.
> 
> It has been then subsequently updated/rewritten for:
> 
> - 4.19-cip
> - 5.12 (two versions for switchdev and DSA)
> - 6.6 LTS
> - net-next.
> 
> The pr_err() were probably added by me as replacement for
> "printk(KERN_ERR". I can change them to dev_* or netdev_*. This shall
> not be a problem.

With Ethernet switches, you need to look at the context. Is it
something specific to one interface? The netdev_err(). If it is global
to the whole switch, then dev_err().

> > > +	pr_info("Ethernet Switch Version %s\n", VERSION);  
> > 
> > Drivers use dev, not pr. Anyway drop. Drivers do not have versions and
> > should be silent on success.
> 
> As I've written above - there are several "versions" on this particular
> driver. Hence the information.

There is only one version in mainline, this version (maybe). Mainline
does not care about other versions. Such version information is also
useless, because once it is merged, it never changes. What you
actually want to know is the kernel git hash, so you can find the
exact sources. ethtool -I will return that, assuming your ethtool code
is correct.

> > > +	pr_info("Ethernet Switch HW rev 0x%x:0x%x\n",
> > > +		MCF_MTIP_REVISION_CUSTOMER_REVISION(rev),
> > > +		MCF_MTIP_REVISION_CORE_REVISION(rev));  
> > 
> > Drop
> 
> Ok.

You can report this via ethtool -I. But i suggest you leave that for
later patches.

> > > +	fep->reg_phy = devm_regulator_get(&pdev->dev, "phy");
> > > +	if (!IS_ERR(fep->reg_phy)) {
> > > +		ret = regulator_enable(fep->reg_phy);
> > > +		if (ret) {
> > > +			dev_err(&pdev->dev,
> > > +				"Failed to enable phy regulator:
> > > %d\n", ret);
> > > +			goto failed_regulator;
> > > +		}
> > > +	} else {
> > > +		if (PTR_ERR(fep->reg_phy) == -EPROBE_DEFER) {
> > > +			ret = -EPROBE_DEFER;
> > > +			goto failed_regulator;
> > > +		}
> > > +		fep->reg_phy = NULL;  
> > 
> > I don't understand this code. Do you want to re-implement
> > get_optional? But why?
> 
> Here the get_optional() shall be used.

This is the problem with trying to use old code. It needs more work
than just making it compile. It needs to be brought up to HEAD of
mainline standard, which often nearly ends in a re-write.

> > > +	fep->clk_ipg = devm_clk_get(&pdev->dev, "ipg");
> > > +	if (IS_ERR(fep->clk_ipg))
> > > +		fep->clk_ipg = NULL;  
> > 
> > Why?
> 
> I will update the code.

FYI: NULL is a valid clock. But do you actually want _optional()?

This is the sort of thing a 10 year old codebase will be missing, and
you need to re-write. You might also be able to use the clk _bulk_
API?

	Andrew

