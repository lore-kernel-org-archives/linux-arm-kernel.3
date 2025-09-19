Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1EFCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 07:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hb4JA4fTwI5S97+qQFy6E++mwXzjCgpI2x6Kz7sl75c=; b=EyTtX5mO9ynh9s6EIkJSN89AMA
	7FfxSZf+osAYHOsvHDiC/CHXOA1cRPv1anj2lOYcx/MwigQacxNl6oFRwVqnXMBPXDV+ixXyeI4SK
	s0GOjVzJFcgzIPjKs/YU3t8V5uHSou5HR+KGZ9tFTcdDrDqXN0IF4NJe2p3iQUahxZp4aiDrVn2V9
	lOT7GIfzhjx2/I7sZRdD+JaAgMqEWGF7M4RkiZsAgtVPpMFRftJ15K9T3fDqHXDLWmsIwTj6o6i0r
	u9y2i2HaqS6KmaRvM3cJp33CBEX0MpNh9nH5aqQCn4sV06XnmvKSMI0KAC2VlqgiN0dmvpsNaI1mN
	utr4RuYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVab-000000023xi-0OHn;
	Fri, 19 Sep 2025 07:31:29 +0000
Received: from smtp28.bhosted.nl ([2a02:9e0:8000::40])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVaX-000000023xB-3LtY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 07:31:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=protonic.nl; s=202111;
	h=content-transfer-encoding:content-type:mime-version:references:in-reply-to:
	 message-id:subject:cc:to:from:date:from;
	bh=hb4JA4fTwI5S97+qQFy6E++mwXzjCgpI2x6Kz7sl75c=;
	b=pZW+VN/zunUr8uqIHPr8ZaMHKz5+wpBS9g8mkldWI1GlhOZ01lslSu5UYQzFFEQjJGU6szmDdCNKa
	 ySq3Dw2xuCzKeSw0pwSskYbqCuz5OEfnY7UVSvHFYKJCvZo6jQszXDWFPZ9S0lHA5mO4bq7UxDJs1q
	 xBBj42CcHzqdnv8cwgal4DV4B9DJtas2zLBBc+SXtplp2DWYC4MvM8ZMDPG+mJQw0QhmfFYwq5zgRO
	 jhAfBFwCAQrZ41fpzXDmJErIh4nugZek44vJMRmcedZPGs7MtWD1uwQ/GB2R2Bj0uLtVXBoG70fM67
	 tPnUN4xs3iJtqwqVRpwzZVXsJ+2N6Yg==
X-MSG-ID: a2929316-952a-11f0-8678-0050568164d1
Date: Fri, 19 Sep 2025 09:31:19 +0200
From: David Jander <david@protonic.nl>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Jonas Rebmann <jre@pengutronix.de>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2 3/3] arm64: dts: add Protonic PRT8ML board
Message-ID: <20250919093119.24d2711a@erd003.prtnl>
In-Reply-To: <aMzlXerFpsfdHnwB@pengutronix.de>
References: <20250918-imx8mp-prt8ml-v2-0-3d84b4fe53de@pengutronix.de>
	<20250918-imx8mp-prt8ml-v2-3-3d84b4fe53de@pengutronix.de>
	<af554442-aeec-40d2-a35a-c7ee5bfcb99a@lunn.ch>
	<20250918165156.10e55b85@erd003.prtnl>
	<7f1d9289-4102-4db9-a2bb-ff270e8871b7@lunn.ch>
	<20250918173347.28db5569@erd003.prtnl>
	<aMzlXerFpsfdHnwB@pengutronix.de>
Organization: Protonic Holland
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_003126_269416_04107D09 
X-CRM114-Status: GOOD (  32.44  )
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

On Fri, 19 Sep 2025 07:08:45 +0200
Oleksij Rempel <o.rempel@pengutronix.de> wrote:

> On Thu, Sep 18, 2025 at 05:33:47PM +0200, David Jander wrote:
> > On Thu, 18 Sep 2025 17:04:55 +0200
> > Andrew Lunn <andrew@lunn.ch> wrote:
> >   
> > > > Yes, unfortunately the SJA1105Q does not support PAUSE frames, and the i.MX8MP
> > > > FEC isn't able to sustain 1000Mbps (only about 400ish) due to insufficient
> > > > internal bus bandwidth. It will generate PAUSE frames, but the SJA1105Q
> > > > ignores these, leading to packet loss, which is obviously worse than
> > > > restricting this link to 100Mbps. Ironically both chips are from the same
> > > > manufacturer, yet are incompatible in this regard.    
> > > 
> > > Thanks for the explanation. Maybe add a comment that the bandwidth is
> > > limited due to the lack of flow control resulting in packet loss in
> > > the FEC.
> > >
> > > Anything which looks odd deserves a comment, otherwise somebody will
> > > question it....  
> > 
> > Yes! This is a golden tip. Ironically what I said above is incorrect. Sorry
> > for the noise.
> > 
> > Ftr: I wrote this DT about 4 years ago, so my memory failed me, and a comment
> > in the code would have saved me this embarrassment ;-)
> > 
> > The comment above applies to the i.MX6 SoC's which had this limitation. On the
> > i.MX8MP we had a different problem that also caused the SJA1105Q not to work
> > reliably at 1000Mbps either. We haven't been able to find the issue, but so far
> > this switch hasn't been able to work at 1000Mbps reliable on any platform,
> > possibly for different reasons in each case.  
> 
> May be it is doe to RGMII clock switching issue and the requirement to
> have specific silence time for proper clock frequency detection on the
> switch side?

I doubt it is that, because it works well at 100Mbps still in RGMII mode, and
according to the documentation the delay line is active for all rates.

OTOH, this switch probably has some other issues related to the RXC delay
line. It is always the RX path (RX at the switch, TX at the MAC) that
randomly does not work.

OT (but still posting in case someone here knows something):
Coincidentally I am currently working on a different design with a SJA1105Q
switch connected to a LAN743X MAC. The complication is that this MAC cannot
disable the TXC (RXC at the switch) at all. Still working on this, but right
now it looks like not even with the RX delay line deactivated (doing the delay
at the MAC) is the switch working reliably (at 1000Mbps). Investigation still
on-going so take with grain of salt.

> Or it is just artifact from iMX6 platform and it should be retested?

I remember having tested it and it not working reliably, but that was 4 years
ago or so. Drivers have evolved since, so maybe it is worth testing again?

Best regards,

-- 
David Jander


