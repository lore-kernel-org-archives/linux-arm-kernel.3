Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3873BC5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 07:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=si4fJtrb4SjlaZ/uoyds5L3GRJvAj8inoK2ofwi4AWA=; b=W6m26xJwOq4xRsGGFn3Spo5P5d
	pEYkJ9ty6enw8vD8VJb8UL0UAvD3I1CfwQIrkrQm5+2itCSYRBDx5fL7jxw2m3vHDcN0bHibvSmEA
	DygMPSptpb1QA2xUJPZVQJfjXHp2+SJrskGT5zVDVZq8ILulaA2VX4SJ8VKwsKvn4uD51qOLFRKAA
	0VleHTApZuhjAnUb4YMyqiEJwu6qvCmzYoTloFVSHUm2wYeZutg2pCRnT/nxn8sfEbGk3qcjKMvEE
	CJWUOwzT7iqyy2gZ2wTqSYczwCLhFF4IQM1TrxWqJ2pIoe0DBKyWf7np6Q7kIQVTCRrzVtci91pAt
	H6PV5RHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtKIQ-0000000BBp0-2wPg;
	Mon, 10 Aug 2026 07:19:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtKIO-0000000BBop-3S01;
	Mon, 10 Aug 2026 07:19:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 87BD541FAC;
	Mon, 10 Aug 2026 07:19:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 099691F000E9;
	Mon, 10 Aug 2026 07:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786346380;
	bh=si4fJtrb4SjlaZ/uoyds5L3GRJvAj8inoK2ofwi4AWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q1axmX7glEH5aaa1mV2uIJhsqDhnfuzk0X8yVcg7WRGxmyHS37mubIRoZFBqfXKvs
	 Qb6h+DKcUwvImzMU9UQ3zJ9F7gzlPOl/oOG+U528A0sCPW/xLaMd1zdcg4RFgHiPlZ
	 iqLgnBykoynPUZqHcWRnPy5EWEH/TYZBnR3P6H41pZj6Jhm+koiKGTVGVWPa0Yy7iQ
	 EWVyGEYyVX7caBWnoZtuIxkqFFc6Fui9B9K7PMA73LtNlSqexUb/5YLEDVFMX1QXcH
	 D/c+BksV6ceLcqdL+go6PYM0VuD8Qc8wzzAI0xl17UuQI/XzPMfklJMIY1NpynfKeP
	 8He7Xb5YwPUbg==
Date: Mon, 10 Aug 2026 09:19:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peter Robinson <pbrobinson@gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add
 compatible
Message-ID: <20260810-mustard-sloth-of-enterprise-84b68d@quoll>
References: <20260804-bcm2712-d-stepping-compatible-v3-0-1860094486eb@linutronix.de>
 <20260804-bcm2712-d-stepping-compatible-v3-2-1860094486eb@linutronix.de>
 <6ed9b2e5-b700-477a-8f6f-cb48c597a111@gmx.net>
 <vv6ufnanks27moditlav2ebaub6m5te5tag3m6qv5l65cm25iw@i7m54od3wz4k>
 <ddcb0d9a-2dd4-4808-84db-caf6ea64b48e@gmx.net>
 <pwdgjsfwdnkce4lkkda2hlopajuwuit6jkx2wztoeu4jzzv5ay@yoo4ofvwgrnu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <pwdgjsfwdnkce4lkkda2hlopajuwuit6jkx2wztoeu4jzzv5ay@yoo4ofvwgrnu>
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

On Wed, Aug 05, 2026 at 02:52:44PM +0200, Gregor Herburger wrote:
> Hi Stefan,
> On Wed, Aug 05, 2026 at 01:55:50PM +0200, Stefan Wahren wrote:
> > Hi Gregor,
> > 
> > drop Eric and add Peter.
> > 
> > Am 05.08.26 um 09:27 schrieb Gregor Herburger:
> > > On Tue, Aug 04, 2026 at 04:57:09PM +0200, Stefan Wahren wrote:
> > > > Hi Gregor,
> > > > 
> > > > sorry for my late reply.
> > > > 
> > > > Am 04.08.26 um 15:13 schrieb Gregor Herburger:
> > > > > The bcm2712 found on the Raspberry Pi 5 is available in the d Stepping
> > > > > and in a c Stepping. There are two separate dts files. The
> > > > > bcm2712-rpi-5-b.dts for the c Stepping and the bcm2712-d-rpi-5-b.dts for
> > > > > the d Stepping. The d stepping does not set its own compatible/model
> > > > > string but uses "raspberrypi,5-model-b".
> > > > In case the SoC and not the board has a D stepping, why do just change the
> > > > board compatible without the SoC compatible like "brcm,bcm2712-d0"?
> > > You mean changing both compatible strings? Like this:
> > > 	compatible = "raspberrypi,5-model-b-d0", "brcm,bcm2712-d0";
> > I just want to mention that your explanation doesn't match to your changes.
> > The first compatible represent the whole board (RPi 5) and the second one
> > represent only the SoC (BCM2712). Since the SoC is different according your
> > explanation, i would expect the SoC compatible needs to be changed. And in
> > case the SoC changes, also the board won't be compatible anymore, correct?
> Yes the SoC differs in these two versions and the board is maybe the same (but

Different SoC means different SoC-compatible. If the soc is soldered to
the board, then it also means board is different. Otherwise how can it
be the same board if it comes with different elements?

Of course boards can share schematics and everything except some
component so you could have common compatible.

1. Rpi 5b d0
2. Rpi 5b
3. bcm2712-d0

> not compatible). Compatible strings should go from most specific to most general
> [0]. If we would have the same first string for both steppings it wouldn't be
> distinguishable. So at least the first string must be unique.
> 
> E.g systemd-boot only matches the first compatible string [1].


If systemd-boot is not following established for 10 years DT practices
that systemd-boot's fault, not something to be fixed in DT.

But anyway I did not hear anyone adding/using wrong or fake compatibles
to satisfy systemd-boot for other hardware.

Best regards,
Krzysztof


