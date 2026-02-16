Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125EFE81A25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 15:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C+tdW27UyjmL/YGLro3NutiDN/boatLgbGvmemeFrI0=; b=RILAfJy//AvwThmnMJXdddUGY0
	qY37dWXJIvTloKKScpqjvlx5Nww/K+b6rC45bL31yA/ne3dWJw09JlZWIAvk2uMLq5KcUfZsjZTAd
	oWNV44083FhYg2zqkhZXLTJXxEUi7DtnZ7Ua9XS6CgypypeQgl/7roy8BdWPoqPMTbN4DpNni4PN5
	KW3z9fpsLGG7WhsFRNmTO/taJbNeIRsABxvBvHOFwyZPsXNVKK6coSoO6HFSXghMBy/VEzzqfHtLS
	daD5V/07yTN0BNmw+Pf411U6dUP5mKApsnDss9YljiuUcZQlSy9Q2H3d5QsLx2Ubv1yKbtUeLYHX2
	eDtNQtrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs0Gp-00000006r9Y-3gES;
	Mon, 16 Feb 2026 15:12:19 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs0Gj-00000006r6S-2VRy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 15:12:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5D40A1A0FCC;
	Mon, 16 Feb 2026 15:12:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 31968606CF;
	Mon, 16 Feb 2026 15:12:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A3B971036916C;
	Mon, 16 Feb 2026 16:11:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771254723; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=C+tdW27UyjmL/YGLro3NutiDN/boatLgbGvmemeFrI0=;
	b=cn4ubqFaLEFHWMpwCSy3F3VvF6VhBECXclViZUVpjom+GQxzPQrgq3/AP5iFCGxdHZ3kB9
	HZHqFZGQJxmTnr8OubiiV4u3PV4XaWsp/LqBtHiG0e1VEeNG0RfnnYo+5POrXo9V8z0bUT
	Yq8h0oY0/RE+RCWOlttRISGSnGT1n4cmAGQe1RUvUCe+W1UhgytI1lan3kG70I4/BSEIlK
	oWsq+/M9Z7RkauVggRyasxxxIhjKIBalk4lMzj8DA3AWV75lb48jM8TssSXnnr4YGHkphY
	lUPEQC4Y9vFmCNTvT3LanyKgFf8v6iBmE7TYE6XoEKVSWTzjc8Zf/CQest6V/w==
Date: Mon, 16 Feb 2026 16:11:55 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Robert Nelson <robertcnelson@gmail.com>
Cc: Andreas Kemnade <andreas@kemnade.info>, "H. Nikolaus Schaller"
 <hns@goldelico.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Bajjuri Praneeth <praneeth@ti.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Louis Chauvet
 <louis.chauvet@bootlin.com>
Subject: Re: [PATCH 1/5] ARM: dts: ti: Enable overlays for all DTB files
Message-ID: <20260216161155.09fae580@kmaincent-XPS-13-7390>
In-Reply-To: <CAOCHtYicmeSzH5Q2_qTwAZw3s+__JRwUrXvz01+KCsJJHAznUw@mail.gmail.com>
References: <20260212-feature_bbge-v1-0-29014a212f35@bootlin.com>
	<20260212-feature_bbge-v1-1-29014a212f35@bootlin.com>
	<B3366A17-641F-4E02-A5D4-978F525E0A96@goldelico.com>
	<20260212174718.7daccb70@kemnade.info>
	<719BF710-26DF-49AB-A016-D2306F0389E2@goldelico.com>
	<20260212231907.6120a2e2@kemnade.info>
	<CAOCHtYicmeSzH5Q2_qTwAZw3s+__JRwUrXvz01+KCsJJHAznUw@mail.gmail.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_071214_272993_0231B9FC 
X-CRM114-Status: GOOD (  31.26  )
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

On Thu, 12 Feb 2026 21:16:05 -0600
Robert Nelson <robertcnelson@gmail.com> wrote:

> On Thu, Feb 12, 2026 at 4:19=E2=80=AFPM Andreas Kemnade <andreas@kemnade.=
info> wrote:
> >
> > On Thu, 12 Feb 2026 17:55:43 +0100
> > "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
> > =20
> > > > Am 12.02.2026 um 17:47 schrieb Andreas Kemnade <andreas@kemnade.inf=
o>:
> > > >
> > > > On Thu, 12 Feb 2026 16:49:43 +0100
> > > > "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
> > > > =20
> > > >>> Am 12.02.2026 um 16:26 schrieb Kory Maincent (TI)
> > > >>> <kory.maincent@bootlin.com>:
> > > >>>
> > > >>> Allow overlays to be applied to any DTB. This adds around ~40% to=
 the
> > > >>> total size of the DTB files on average. =20
> > > >>
> > > >> Is this unconditionally enabled or can it be turned off by some
> > > >> CONFIG? We have our own defconfig so I would not worry if if is
> > > >> enabled in omap2plus_defconfig and disabled in ours.
> > > >>
> > > >> We have several devices where the boot loader can't handle overlays
> > > >> (never touch a working boot-loader :) So this seems to only contri=
bute
> > > >> to build and load time without benefit.
> > > >> =20
> > > > As long as you do not add overlays, the bootloader does not care. I
> > > > would like to simply carry around the 1-bit mmc overlay for one bro=
ken
> > > > board. That would help me. So I think there is a benefit but nobody
> > > > forces you to use it. =20
> > >
> > > Well, it does not force to use the really good feature, but it forces=
 to
> > > add ~40% more file size and some more compile time, if I understand it
> > > correctly.=20
> > Compile time, hardly measurable even if you just do make dtbs.
> >
> > Size on disk:
> > a) if it lives around in a /boot partitions with kernels and initrams i=
n it,
> >    then we are around 1% more space needed.
> >
> > b) if it has separate partitions maybe on some mtd: Looking around: GTA=
04
> >    has quite some headroom left. Usage is still <50% even with symbols
> >    enabled.
> >
> > But on the other no one else seems to enable that besides for devices w=
ith
> > open expansion boards carrying "hats". So overall, should we really be =
the
> > exception? =20
>=20
> Do we want to maybe transition like TI did for k3?
>=20
> Start with board specific DTC_FLAGS flags for specific boards:
>=20
> and then just enabling overlays by default :
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/arch/arm64/boot/dts/ti/Makefile?id=3Dbca4146b1f66dbca07591bfd6ad695c699b5a=
093
>=20
> If we do board-specific, all the "Beagle" related items can be auto
> enabled `-@`..

Yes, I will move on to this solution for now to avoid too many complaints a=
bout
the devicetree size increases.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

