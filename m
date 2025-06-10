Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8260CC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 10:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TgKyCq0suARse86RWO6v52OcwDaIabQUncCNwXGdf7k=; b=d31nfOzPxJ2bnz22P6wvx8GLhg
	0ZBZsHGvBDjxX+n/nlMZMJ0ddjF2Tdh1xWLyhbYd3RPFJnLaJspemOE4dYcUCXoDjrvQYnlGZP4IZ
	QRBhYYAVmhNo27tXSmwsjWJQ19sRO+dFHBU0fB9JLcZU55MX/RRNrDCHbME2IG8yzh9QqKU+ArdOK
	HOiG/BqNkWBh8ve3ShhROsfrfX8u30xmTTSKVD7JBCrZyvzLESAG9hdAfU0Y/DQeein6jrk6HHWnN
	bAwYIaLff5SjNZtEsC7s+PvY4ZQI2FujCTd38QFuoLdsGoTjcOp7rKRcMqGklGmWtDfybgXs84jlV
	Vz1CtINw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwfp-00000006ZRR-1pvY;
	Tue, 10 Jun 2025 10:57:45 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvuR-00000006SXK-4A7x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 10:08:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=TgKyCq0suARse86RWO6v52OcwDaIabQUncCNwXGdf7k=;
	b=orhA1OCR69h5nCVM63EeQylwCHOfbCK+3JKxQmRztw+SZQkhiSKHB/EsB1w1sw
	CDrdgCAlQI+ONYUQ73RYGJMXSmZPGPN7DXXR41Cc3p1pxaa/DdI3/FpEGkO/kw4U
	Nz11icyvNrVeXoYoD+egEO9QY0R1FNp8EQBaahR4vDZus=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCXfxcXBEhol69VAA--.35126S3;
	Tue, 10 Jun 2025 18:08:25 +0800 (CST)
Date: Tue, 10 Jun 2025 18:08:23 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Xu Yang <xu.yang_2@nxp.com>, Peter Chen <peter.chen@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: i.MX kernel hangup caused by chipidea USB gadget driver
Message-ID: <aEgEF6YKYccequVw@dragon>
References: <aEZxmlHmjeWcXiF3@dragon>
 <c56pgxmfscg6tpqxjayu4mvxc2g5kgmfitpvp36lxulpq4jxmg@ces5l7ofab6s>
 <c7bfdfec-bc49-4ce5-8dd9-7a69d8e24ceb@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7bfdfec-bc49-4ce5-8dd9-7a69d8e24ceb@rowland.harvard.edu>
X-CM-TRANSID: M88vCgCXfxcXBEhol69VAA--.35126S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrWkZryrXFWkZr4fKr15Jwb_yoW8Crykpa
	y3KF47Kan8XFWfurnFkr18JFWqy39YkrZrCryDXr47Cay3uw1fGF43KrW5KFyqkrn3Gwna
	vFy2q34kKF1DZ3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UQ2-5UUUUU=
X-Originating-IP: [117.82.86.8]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhRoZWhH6wl3OQAAsI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_030848_394832_DB1EC6A2 
X-CRM114-Status: GOOD (  26.98  )
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

Hi Alan,

On Mon, Jun 09, 2025 at 09:54:45AM -0400, Alan Stern wrote:
> On Mon, Jun 09, 2025 at 07:53:22PM +0800, Xu Yang wrote:
> > Hi Shawn,
> > 
> > Thanks for your reports!
> > 
> > On Mon, Jun 09, 2025 at 01:31:06PM +0800, Shawn Guo wrote:
> > > Hi Xu, Peter,
> > > 
> > > I'm seeing a kernel hangup on imx8mm-evk board.  It happens when:
> > > 
> > >  - USB gadget is enabled as Ethernet
> > >  - There is data transfer over USB Ethernet
> > >  - Device is going in/out suspend
> 
> > During the scp process, the usb host won't put usb device to suspend state.
> > In current design, then the ether driver doesn't know the system has
> > suspended after echo mem. The root cause is that ether driver is still tring
> > to queue usb request after usb controller has suspended where usb clock is off,
> > then the system hang.
> > 
> > With the above changes, I think the ether driver will fail to eth_start_xmit() 
> > at an ealier stage, so the issue can't be triggered.
> > 
> > I think the ether driver needs call gether_suspend() accordingly, to do this,
> > the controller driver need explicitly call suspend() function when it's going
> > to be suspended. Could you check whether below patch fix the issue?
> 
> The situation is more complicated than this.
> 
> In general, a USB gadget cannot allow itself to be suspended while the 
> USB bus it is connected to remains active.  Not unless it can be set to 
> wake up when a USB packet arrives, and even that probably won't work 
> because the wakeup sequence would take too long and the USB transfer 
> would time out on the host.
> 
> The best way to fix this problem is for the gadget to disconnect itself 
> from the USB bus whenever it goes into suspend, and to reconnect when it 
> resumes.

Thank you so much for the insight!  It matches my testing pretty well.
The disconnect/reconnect gadget in udc suspend/resume is more reliable
than suspend/resume gadget.

Shawn


