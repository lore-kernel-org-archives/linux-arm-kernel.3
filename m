Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7D9C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 13:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8RbXTh1moYBuJYDFqQJgcBiuoaXsIkIu6hEWa4JAps=; b=ZB7Rrsli7MdQ3IR7zvVrINsRkL
	9js4tpZ9GcnRZduiGZ5/4Zz86aDHnQBPUxM9wotubpuhSaQDFNOUfDs2AGyhB2zS1WNHdQSFnz2/X
	+IHt2F11rVr8BKV2xCYDYT2ZLnMKUMGG3kQowCFj5uHYHAHp0IHFUAxGtD/Z24z0nGIa+cVrPS0p6
	lxvNndcMHBW4bgyxqX63OQGJHB8KSWcLYq/9aZuIE9avaOiCjWYSXSTkWzWAYsVu0+3UzwN8OyWnU
	hHgdPXWAkC/4YAVOaJjyCeACYolE1/DVO0Ky9r2KesZuD7oGZa/P43cQh/qX/d5jz/zBJdegEp/sJ
	nYs573+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td8BA-000000071Nm-48J8;
	Wed, 29 Jan 2025 13:32:28 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td89q-000000071J1-44dD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 13:31:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=Z8RbXTh1moYBuJYDFqQJgcBiuoaXsIkIu6hEWa4JAps=; b=eo
	OGrk6Bqgm9UrPGuFXMR27VYtK1S+Dhj4ljLHq/COZ8tpF8ZKBX+/j1FNN4q1/ZcS+W8MIyFZMGMJR
	ktPruYLtgnYdekrO1eEjIifLb7OTqBnJgx2aS/QMbUhMTBPeGJP/s+jXapNW9xCCiltak8GxumwTB
	M7Xhmx348XZ56gA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1td89k-0098Yd-AT; Wed, 29 Jan 2025 14:31:00 +0100
Date: Wed, 29 Jan 2025 14:31:00 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RESEND PATCH] ARM: dts: socfpga: Add basic support for
 Terrasic's de10-nano
Message-ID: <768a2957-4e3e-4b19-a350-3ba9a301d21d@lunn.ch>
References: <20250128172917.4565-2-u.kleine-koenig@baylibre.com>
 <f9aad21c-64f9-413b-a3ea-18825515944c@lunn.ch>
 <tjkdekrcxoot3inwcboqc76iljbkjgjaamo55u2k2glr7aubjh@y3465k547zwz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tjkdekrcxoot3inwcboqc76iljbkjgjaamo55u2k2glr7aubjh@y3465k547zwz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_053107_013930_E3E77205 
X-CRM114-Status: GOOD (  19.15  )
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

On Wed, Jan 29, 2025 at 09:35:21AM +0100, Uwe Kleine-König wrote:
> Hello Andrew,
> 
> On Tue, Jan 28, 2025 at 06:44:26PM +0100, Andrew Lunn wrote:
> > > +&gmac1 {
> > > +	/* Uses a KSZ9031RNX phy */
> > > +	status = "okay";
> > > +	phy-mode = "rgmii";
> > > +
> > > +	rxd0-skew-ps = <420>;
> > > +	rxd1-skew-ps = <420>;
> > > +	rxd2-skew-ps = <420>;
> > > +	rxd3-skew-ps = <420>;
> > > +	txen-skew-ps = <0>;
> > > +	txc-skew-ps = <1860>;
> > > +	rxdv-skew-ps = <420>;
> > > +	rxc-skew-ps = <1680>;
> > > +};
> > 
> > The convectional meaning of phy-mode 'rgmii' is that the PCB provides
> > the 2ns delay. Here you are abusing the
> > 
> > > +	txc-skew-ps = <1860>;
> > > +	rxc-skew-ps = <1680>;
> > 
> > To add these delays.
> 
> Ah, at some point I already knew that. Thanks for repeating that hint.

No problem a with the hint. This is a nice easy case. Some vendors
have made a big mess with RGMII delays, hiding it in the bootloader,
and giving customers bad advice. That is much harder to fix.

> (Back then it was for
> arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts.)
> 
> > Please test without these two lines, and change phy-mode to
> > 'rgmii-id'. 1680 is rather low, so it might not work. Look for CRC
> > errors for received packets.
> 
> I did an apt upgrade involving > 100 MB downloads with rgmii-id and
> afterwards I had:
> 
> 	# ip -stats link show dev eth0
> 	2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP mode DEFAU
> 	LT group default qlen 1000
> 	    link/ether ee:5f:09:22:72:da brd ff:ff:ff:ff:ff:ff
> 	    RX:  bytes packets errors dropped  missed   mcast
> 	     158336739  113000      0       0       0       0
> 	    TX:  bytes packets errors dropped carrier collsns
> 		482481    5094      0       0       0       0
> 
> so that seems to be fine, right?

Yes, this looks good.

Thanks
	Andrew

