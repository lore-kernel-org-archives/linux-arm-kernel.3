Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BC11073CA8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 12:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZm0OMiCYQ+7g0KMOOJaEeMtCB1NoXIae3H5HwDH82U=; b=4DnbUm1S48s6TNMO8FsnV3BZ8A
	NiXKuOWLB3S/0n3oJJAOQucS5bEkpsmvtN2D94kXRTD9UwlnQzTrRQ3xVI8j0pB2qy2DlWRPh5Kmc
	TojXsSUGJDXmhEjrvtwdDuB5N0pVoFe/qpg54Bp+Ju0cby5U8Sg+qCSA8gLGB1Ll6XhVwDEHgox2N
	GXmCQafQTUGlK1hbBSPG9Ud7wElyTyMCTWSxSQYMmyYf125SLjoPGyFRZvRYmqUiLGupdSljEFzKa
	xOq8a3d+VnzxVqOXiHFuVNQI7Ghd+fKrn0HtK9TikGQPlqnIDt6sb+bEV5Hd9hQTWz03Nq3EcnvFW
	uOyPSoIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAS7R-00000008rLI-00Mf;
	Wed, 08 Apr 2026 12:34:53 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAS7P-00000008rKg-0Aj9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 12:34:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=UZm0OMiCYQ+7g0KMOOJaEeMtCB1NoXIae3H5HwDH82U=; b=lUcQs91sIVusfR1u89Stz05ODI
	AMhxret+/edGus9rBRyTcLUGXHf1+j7vips6AbSB6HSPe9HBw1p0HiJ6vLRsEXaM20P3nzGqQFLn7
	Efio5MaldMKsoTnJqx0IzS6klKtDGHTB874frDoDMPk7FfEAj85BYwcWdzltEDxPDzEM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wAS7A-00FHkV-QP; Wed, 08 Apr 2026 14:34:36 +0200
Date: Wed, 8 Apr 2026 14:34:36 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "P.K. Lee" <pkleequanta@gmail.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Jason-Hsu@quantatw.com, p.k.lee@quantatw.com
Subject: Re: [PATCH v12 2/2] arm: dts: aspeed: ventura: add Meta Ventura BMC
Message-ID: <e7a1588d-b4d4-4aa7-ba94-da3e2591d49c@lunn.ch>
References: <20260226055521.1655243-1-pkleequanta@gmail.com>
 <20260226055521.1655243-3-pkleequanta@gmail.com>
 <258747f4-9da5-44da-8eb9-24f8a8cbff3a@lunn.ch>
 <CAK8yEODCyYxkggU+7=xzWFcXP6RMTpNbHyYRHZhahX7=b6reqA@mail.gmail.com>
 <435616b8-8d4c-4814-8f21-d667755473f1@lunn.ch>
 <CAK8yEOAYC0iApNHBApt+xu1Fz=+N1wX0XrLGOPzmeRq=OjWnhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8yEOAYC0iApNHBApt+xu1Fz=+N1wX0XrLGOPzmeRq=OjWnhg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_053451_081081_C56B9896 
X-CRM114-Status: GOOD (  16.76  )
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

> > > > If there are no devices on the bus, why enable it?
> > >
> > > We intentionally enable it so user-space tools can access the switch
> > > registers. I have added a comment in v13 to clarify this.
> >
> > Why would user space want to access the switch registers for an
> > unmanaged switch? It sounds like you are using Marvells SDK in
> > userspace to manage the switch, rather than using DSA.
> >
> 
> We do have a custom user-space daemon that configures the switch
> registers for our specific use case. Should I remove the &mdio0 node
> if it is only enabled and has no other configuration in the upstream
> device tree?

Please just be truthful that you have a user space driver, so need the
bus enabled.

I also guess you have some other kernel code that allows you to
actually use the bus from user space? The typical ethernet IOCTL
handler does not work for you, since you don't have an ethernet device
using this bus. Such code is unlikely to be accepted into mainline. We
don't like user space drivers when there is a perfectly good kernel
driver for this switch.

	Andrew

