Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E9EFEEF31
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 12:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUe9COmHpHLq20IfDV7wBf0fs3/+ozBHLuEm1gRfjmQ=; b=qS7jPvTlb7m8u65v+HzRc1aCwG
	Cf6oPJ0SuUXy8EpmWJLi9pHtKYeqwIkmXsb+1/QbyKJm86OhcVe62tq2pnQ2cOjGelDrPQVZR2+Q8
	4l2eThmYtF1sMdme2Qtqjt27KE6t1ALoPCek/bOpaY6IaK3nzJXMmGS3wfLJVOYBAvPs4GUD7qHrN
	QLf8bUN/PXn7ZESbzZiU/aSjm8ihcr0KPnU4KtERewcqGNrFvlLJGWYuN0dFTIKA3DXNpd8e44bZp
	DYc8dJwnK1EGdmUl3hu/EpHvlR53sHhEttbd3O3p9ucUnohkGn14eMJW8yLRmopGGk/C/uyJSHDHL
	A4e9Gc9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA5lA-00000006SP2-3n5n;
	Tue, 07 Apr 2026 12:42:24 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA5l8-00000006SNk-1Sz7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 12:42:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=IUe9COmHpHLq20IfDV7wBf0fs3/+ozBHLuEm1gRfjmQ=; b=BZCSfvhG87/QSajNbHNCC3NuB4
	/W7rNrQu3UatpnJolElrFKOZq4jMof0N2Rt1geik4YqdBd3IP/DQcBOg5A7gQw3AT8mK0wp9rlqDg
	FV4mFajmd/brcgrS4FcrpjbVvrHE2GjkAWpTwPX9TEZW5WqyXGbcuIcpzVv5Yl8IARAQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wA5ko-00F81f-Uo; Tue, 07 Apr 2026 14:42:02 +0200
Date: Tue, 7 Apr 2026 14:42:02 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: PK Lee <pkleequanta@gmail.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Jason-Hsu@quantatw.com, p.k.lee@quantatw.com
Subject: Re: [PATCH v12 2/2] arm: dts: aspeed: ventura: add Meta Ventura BMC
Message-ID: <435616b8-8d4c-4814-8f21-d667755473f1@lunn.ch>
References: <20260226055521.1655243-1-pkleequanta@gmail.com>
 <20260226055521.1655243-3-pkleequanta@gmail.com>
 <258747f4-9da5-44da-8eb9-24f8a8cbff3a@lunn.ch>
 <CAK8yEODCyYxkggU+7=xzWFcXP6RMTpNbHyYRHZhahX7=b6reqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8yEODCyYxkggU+7=xzWFcXP6RMTpNbHyYRHZhahX7=b6reqA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_054222_389817_F960610B 
X-CRM114-Status: GOOD (  16.68  )
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

On Tue, Apr 07, 2026 at 05:05:12PM +0800, PK Lee wrote:
> > > +&mac3 {
> > > +     status = "okay";
> > > +     phy-mode = "rmii";
> > > +     pinctrl-names = "default";
> > > +     pinctrl-0 = <&pinctrl_rmii4_default>;
> > > +     fixed-link {
> > > +             speed = <100>;
> > > +             full-duplex;
> > > +     };
> >
> > What is on the other end of this fixed link?
> 
> The other end of this fixed link is the CPU port of a Marvell 88E6393X
> switch. We are using this switch in unmanaged mode rather than using
> the DSA subsystem. Therefore, we use a fixed-link to force the mac3 to
> 100Mbps full-duplex RMII to match the CPU port configuration.

You are mixing up terms. The 88E6393X does not have a dedicated port
for connecting to the host CPU. Any port can be connected to the host,
using DSA tags. And all the ports are 1G or faster, so it seems odd to
limit it to 100Mbps. There is something consider a CPU port, but that
connects the internal Z80 CPU to the switch fabric.

> > > +};
> > > +
> > > +&mdio0 {
> > > +     status = "okay";
> > > +};
> >
> > If there are no devices on the bus, why enable it?
> 
> We intentionally enable it so user-space tools can access the switch
> registers. I have added a comment in v13 to clarify this.

Why would user space want to access the switch registers for an
unmanaged switch? It sounds like you are using Marvells SDK in
userspace to manage the switch, rather than using DSA.

	Andrew

