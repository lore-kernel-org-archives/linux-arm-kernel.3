Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18942C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 18:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tpOiw9HTh3F7o64zfMx0Qc5zC0DCSTyoEwE9klBg6Qo=; b=k7cy3k+kn6ugM82XABh2KPPtei
	Dk4oZIT3fag6KpWds2WVx98U8M070ahwkm1WaujXNCbWwgfZGGiSOxP1hS6HZQar2TtRL7MbMBVXv
	7mbg+iYjvfdcyas8muW0qkZJUHo/zo/kJxPDj+iKA+sO+YhVNH4i+54OiG8HRjgrQXps3jBrE3nCg
	QWqG5iP02AB3CWhIqfJfOKzXZI8hHEX+tTEKAQ2x1xeBUd9Uc124gJg8zSbKql4Ee58cWEImnj0zD
	gRBeomjcZvOP2S8ZMPKYjLxxaBlw0Hma1EUpp+Kk76I0MIp0RMgTlI8hRBsHS3UzNCFZz7lsbJTOm
	H2EXoJow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8yA-0000000HHES-2rvA;
	Fri, 13 Jun 2025 18:17:38 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ745-0000000H1d7-1g4K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 16:15:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B73B6444EB;
	Fri, 13 Jun 2025 16:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749831335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tpOiw9HTh3F7o64zfMx0Qc5zC0DCSTyoEwE9klBg6Qo=;
	b=WVhVRpElprwLdHmTsCy0bRkfNh/5pyGIVrCGXz8pWrlo+uOsmMVhDs4SLc4HMzMGtcif09
	vVbtg6yu2dDpEP0+YuToXiOW/FLRnlbVMcVIBIHbRPgnB8sSl8UNAqnCydUJ1xPI9FwngQ
	lhnGaovs3mbQFeB44p3DAlvdrdZcKyiyLy2njZAC2oV5w3M9GJrDDehD8BTpr+NghshLAJ
	kSz/2RRn9UqamBhD5lKaU2qC1aJTMKp8zMCNFFKP6VwbcBS5kIxs5Dej8dAKXf59sbwmKu
	Fwpr0ExY6BGszXDgca45ZIDnBaect7M0E67/h2pGLiMktEdeF9Hf1gDwUXIa3w==
Date: Fri, 13 Jun 2025 18:15:32 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Robert Nelson <robertcnelson@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas
 Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger
 Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, Paul
 Barker <paul.barker@sancloud.com>, Marc Murphy <marc.murphy@sancloud.com>,
 Jason Kridner <jkridner@gmail.com>, Andrew Davis <afd@ti.com>, Bajjuri
 Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 5/7] arm: dts: omap: Add support for BeagleBone Green
 Eco board
Message-ID: <20250613181532.7756d3e2@kmaincent-XPS-13-7390>
In-Reply-To: <CAOCHtYj8QsnzEKV8qG2_8CDuYzN-fUCdoN=YEE_EZ37yvEQ0yw@mail.gmail.com>
References: <20250613-bbg-v3-0-514cdc768448@bootlin.com>
	<20250613-bbg-v3-5-514cdc768448@bootlin.com>
	<CAOCHtYj8QsnzEKV8qG2_8CDuYzN-fUCdoN=YEE_EZ37yvEQ0yw@mail.gmail.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeegtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefguddtfeevtddugeevgfevtdfgvdfhtdeuleetffefffffhffgteekvdefudeiieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgduleemkeehkeejmeejuddttdemfedttgefmeektgehsgemfhdtkegumeegfeegsgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekheekjeemjedutddtmeeftdgtfeemkegthegsmehftdekugemgeefgegspdhhvghlohepkhhmrghinhgtvghnthdqigfrufdqudefqdejfeeltddpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvfedprhgtphhtthhopehrohgsvghrthgtnhgvlhhsohhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhonhihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtoheprhhos
 ghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprggrrhhordhkohhskhhinhgvnhesihhkihdrfhhipdhrtghpthhtoheprghnughrvggrsheskhgvmhhnrgguvgdrihhnfhhopdhrtghpthhtohepkhhhihhlmhgrnhessggrhihlihgsrhgvrdgtohhm
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_091538_074467_C568A321 
X-CRM114-Status: GOOD (  21.18  )
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

Le Fri, 13 Jun 2025 11:03:34 -0500,
Robert Nelson <robertcnelson@gmail.com> a =C3=A9crit :

> On Fri, Jun 13, 2025 at 10:50=E2=80=AFAM Kory Maincent
> <kory.maincent@bootlin.com> wrote:
> >
> > SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone Gr=
een
> > (BBG). It has minor differences from the BBG, such as a different PMIC,
> > a different Ethernet PHY, and a larger eMMC.
> >
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > ---
> >
> > Changes in v3:
> > - Move the omap.yaml binding change in another patch.
> >
> > Changes in v2:
> > - Used generic pmic node name.
> > - Add regulator prefix to fixed regulator node name.
> > - Add the compatible to omap.yaml binding
> > ---
> >  arch/arm/boot/dts/ti/omap/Makefile                 |   1 +
> >  arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts | 169
> > +++++++++++++++++++++ 2 files changed, 170 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/ti/omap/Makefile
> > b/arch/arm/boot/dts/ti/omap/Makefile index 95c68135dd0c..1aef60eef671 1=
00644
> > --- a/arch/arm/boot/dts/ti/omap/Makefile
> > +++ b/arch/arm/boot/dts/ti/omap/Makefile
> > @@ -93,6 +93,7 @@ dtb-$(CONFIG_SOC_AM33XX) +=3D \
> >         am335x-boneblue.dtb \
> >         am335x-bonegreen.dtb \
> >         am335x-bonegreen-wireless.dtb \
> > +       am335x-bonegreen-eco.dtb \
> >         am335x-chiliboard.dtb \
> >         am335x-cm-t335.dtb \
> >         am335x-evm.dtb \
> > diff --git a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts
> > b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts new file mode 1006=
44
> > index 000000000000..2e6050bd2da1
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts
> > @@ -0,0 +1,169 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2025 Bootlin
> > + */
> > +/dts-v1/;
> > +
> > +#include "am33xx.dtsi"
> > +#include "am335x-bone-common.dtsi"
> > +#include "am335x-bonegreen-common.dtsi"
> > +#include <dt-bindings/net/ti-dp83867.h>
> > +
> > +/ {
> > +       model =3D "TI AM335x BeagleBone Green Eco";
> > +       compatible =3D "seeed,am335x-bone-green-eco", "ti,am33xx"; =20
>=20
> Based on [2/7] ARM: dts: omap: Remove incorrect compatible strings
> from device trees  this should be???
>=20
> > +       model =3D "Seeed AM335x BeagleBone Green Eco";
> > +       compatible =3D "seeed,am335x-bone-green-eco", "ti,am33xx"; =20

Oh right, forgot to change the model. Thanks!

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

