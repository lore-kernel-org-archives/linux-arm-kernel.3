Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0650C3ABAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 16:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OduaXqO0vpWQkm2nTVR92WsTV4Q+eJ6nrxylSonj7oQ=; b=IgXKYJpphcj7CkUTbsSlNboD1y
	tXqfM4iizSop+b/iOFeaeYZj5MBm8Qzy/D4tRtgAZ6L31sJ2AwbKyU/Zu87WcQ5nl9Grgs5Kh2MdS
	g8A4ajCH1vI2Q1hEu7iJMyGH5e0peVzERlDhPC/mY0UnI6Q115ZVR12/wsa1E74tiA2gA8nSwfAu8
	3lPFyXblJet5hwNlUgWRPkJDW/ldNRBREHcZWjFT+crafy746fYWmdwuS2Q7KTMpsRfZENlDxntmN
	z/09cy086p9KZJT+8QHVmibnlJu6sIJ89DSiuAFPZOEVJbb7CbAfg9+1HegqUkWsgUr+fcfbuiemS
	VSIQXsXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9nrY-0000000AG4C-0XBs;
	Tue, 29 Apr 2025 16:31:16 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9maY-0000000A49R-2UDs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 15:09:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=OduaXqO0vpWQkm2nTVR92WsTV4Q+eJ6nrxylSonj7oQ=; b=XL
	fMdKhhooPPpr7PglDfv/395KTHmc33skhhEu3pHQ8o3hzgpAyhN4ZI6NnVsCWyMyJWIzM/TZqp+5U
	njOmiFSDSiQjslO/jdmfKlJV8RRXoFHKrgY26MgyEsLM9F3NkY5QxCr1tRxO0p7xdrsOjhszVymot
	TIKFQDB196BQykY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u9maI-00Ax53-Aq; Tue, 29 Apr 2025 17:09:22 +0200
Date: Tue, 29 Apr 2025 17:09:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, wens@csie.org,
	samuel@sholland.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h6: Add OrangePi 3 LTS DTS
Message-ID: <6a056bf8-9f39-4204-9378-8cc39be60038@lunn.ch>
References: <20250413134318.66681-1-jernej.skrabec@gmail.com>
 <2219754.irdbgypaU6@jernej-laptop>
 <34e30bf2-6f80-4c43-9e52-c1ebe0521c43@lunn.ch>
 <5880182.DvuYhMxLoT@jernej-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5880182.DvuYhMxLoT@jernej-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_080938_629590_93C730A7 
X-CRM114-Status: GOOD (  21.48  )
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

On Tue, Apr 29, 2025 at 04:51:59PM +0200, Jernej Škrabec wrote:
> Dne ponedeljek, 28. april 2025 ob 14:37:48 Srednjeevropski poletni čas je Andrew Lunn napisal(a):
> > On Sat, Apr 26, 2025 at 08:00:49PM +0200, Jernej Škrabec wrote:
> > > Dne petek, 25. april 2025 ob 17:34:14 Srednjeevropski poletni čas je Andrew Lunn napisal(a):
> > > > > > +&emac {
> > > > > > +	pinctrl-names = "default";
> > > > > > +	pinctrl-0 = <&ext_rgmii_pins>;
> > > > > > +	phy-mode = "rgmii-rxid";
> > > > > 
> > > > > So relating to what Andrew said earlier today, should this read rgmii-id
> > > > > instead? Since the strap resistors just set some boot-up value, but we
> > > > > want the PHY driver to enable both RX and TX delay programmatically?
> > > > 
> > > > Yes.
> > > > 
> > > > There is a checkpatch.pl patch working its way through the system
> > > > which will add warning about any rgmii value other than rgmii-id. Such
> > > > values need a comment that the PCB has extra long clock
> > > > lines. Hopefully that will make people actually stop and think about
> > > > this, rather than just copy broken vendor code.
> > > 
> > > I spent quite some time working on ethernet support for this board. Once
> > > I've found PHY datasheet, I confirmed that there is added delay. So this
> > > particular board needs "rgmii-rxid" mode.
> > 
> > There have been numerous discussions about what these rgmii modes
> > mean, because DT developers frequently get them wrong.
> > 
> > Does the PCB have an extra long clock line in the TX direction? That
> > is what rgmii-rxid means, the PCB is providing the TX delay, the
> > MAC/PHY pair needs to add the RX delay.
> 
> While schematic is accessible, AFAIK PCB/gerbers are not, so I can't really
> tell how long it is. But without this extra delay, ethernet doesn't work.

You are not adding an extra delay, you are subtracting a
delay. 'rgmii-rxid' says the TX delay is implemented by the PCB, hence
the PHY does not need to add the delay.

What is normal is that the PCB adds no delays, and the PHY adds the
delay for both the RX and the TX. And you represent this with
'rgmii-id'.

So what you need to find out is, where does the TX delay come from?

	Andrew

