Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5022C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 09:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rxpc53pcs9/ImiGc8WRsxEwJ2C+yK+Q3uRnvwi8vl9Q=; b=Rm0ehP+/b5X09VssEEHpZpAZ7N
	MVSjVVz7TDUVDxjNMeXYDQ8oj5t5SH/IpbuEAkyW1z+r5I7mt6p0v3nPwqtnt2H/64qDfnZaVO5tD
	2CbKxRSRqZPJ7z/WKAwToPlj/qj9eie152WC0+gX1zTP8bFAliHoAw6AQaYBNkponZ3GsF9qwwN5K
	06E9FVPo+PRA3dTR60Lul/cA7oZPDOIZC3c/lBcFF0qbzGYUIaZ2T200lzDKqv6vBy2sICh961QdZ
	GcOBLUsAIZriU1iE9HbWTOG+hmzSI+FrCdSbIeDLlBBVBiIDhNiUN0z9EXy8h21BUOkvcs/1FF8oq
	fFO41KoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR64x-00000003ud5-0mSC;
	Mon, 16 Jun 2025 09:24:35 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR5NF-00000003ojT-0y0z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 08:39:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 015B841D11;
	Mon, 16 Jun 2025 08:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750063161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rxpc53pcs9/ImiGc8WRsxEwJ2C+yK+Q3uRnvwi8vl9Q=;
	b=T/g6uJv0DktbNAIvT3CUgs9nfD/z4ZaAY3tuOQTayPiC0nbFM+l2YdnEbaj/nFUkpWxPhs
	4m4Vy/sV+HEfIXAPoQeAGKuUQD/oQrz9paXLq7+JtdFkhW+RvILvIY9gwSn4mc/N6Fagfe
	vJBxZjnRlTianYyyw503L4LUKI9wnWd4vZr/FeXpnMZ9MaikThEW04EhwklB35zWnFrKyI
	hdPe29pa4tcimfUjhBBQLYvCfLoqgFcvBSQhBSCV2APqaqNCq2tdpQ+8DktqrhzOggczTJ
	9lcsAQ2IsSAF11BQGJdOwjD4RhlSWcZvo9ri1x3oX0yttKz6tTH711SiZOSUvA==
Date: Mon, 16 Jun 2025 10:39:19 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Jason Kridner <jkridner@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas
 Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger
 Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, Paul
 Barker <paul.barker@sancloud.com>, Marc Murphy <marc.murphy@sancloud.com>,
 Andrew Davis <afd@ti.com>, Bajjuri Praneeth <praneeth@ti.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/7] ARM: dts: omap: Remove incorrect compatible
 strings from device trees
Message-ID: <20250616103919.2d678c1a@kmaincent-XPS-13-7390>
In-Reply-To: <CA+T6QPnaCFZyRsv9q3bcOrTc22nA0AOXy0tR_SpAkGVVPQqfLg@mail.gmail.com>
References: <20250613-bbg-v3-0-514cdc768448@bootlin.com>
	<20250613-bbg-v3-2-514cdc768448@bootlin.com>
	<CA+T6QPnaCFZyRsv9q3bcOrTc22nA0AOXy0tR_SpAkGVVPQqfLg@mail.gmail.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvieduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefguddtfeevtddugeevgfevtdfgvdfhtdeuleetffefffffhffgteekvdefudeiieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepkhhmrghinhgtvghnthdqigfrufdqudefqdejfeeltddpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvvddprhgtphhtthhopehjkhhrihgunhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehtohhnhiesrghtohhmihguvgdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopegrrghrohdrkhhoshhkihhnvghnsehikhhirdhfihdprhgtphhtthhopegrnhgurhgvrghssehkvghmnhgruggvrdhinhhfohdprhgtphhtthhopehkhhhilhhmrghnsegsrgihlhhisghrvgdrtghomh
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_013925_724345_4E791255 
X-CRM114-Status: GOOD (  21.43  )
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

Le Fri, 13 Jun 2025 13:52:23 -0500,
Jason Kridner <jkridner@gmail.com> a =C3=A9crit :

> On Fri, Jun 13, 2025 at 10:49=E2=80=AFAM Kory Maincent <kory.maincent@boo=
tlin.com>
> wrote:
>=20
> > Several device trees incorrectly included extraneous compatible strings
> > in their compatible property lists. The policy is to only describe the
> > specific board name and SoC name to avoid confusion.
> >
> > Remove these incorrect compatible strings to fix the inconsistency.
> >
> > Also fix board vendor prefixes for BeagleBoard variants that were
> > incorrectly using "ti" instead of "beagle" or "seeed".
> >
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > ---
> >
> > Changes in v3:
> > - Remove extraneous compatible strings.
> > - Replace BeagleBone board name vendor.
> >
> > Changes in v2:
> > - New patch
> > ---
> >  arch/arm/boot/dts/ti/omap/am335x-base0033.dts                   | 2 +-
> >  arch/arm/boot/dts/ti/omap/am335x-bone.dts                       | 4 ++=
--
> >  arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts         | 4 ++=
--
> >  arch/arm/boot/dts/ti/omap/am335x-boneblack.dts                  | 4 ++=
--
> >  arch/arm/boot/dts/ti/omap/am335x-boneblue.dts                   | 4 ++=
--
> >  arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts         | 4 ++=
--
> >  arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts                  | 4 ++=
--
> >  arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts                 | 3 +--
> >  arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts               | 2 +-
> >  arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts             | 2 +-
> >  arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts               | 4 ++=
--
> >  arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts | 5 +-=
---
> >  arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts          | 5 +-=
---
> >  arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dts               | 2 +-
> >  arch/arm/boot/dts/ti/omap/am335x-shc.dts                        | 2 +-
> >  15 files changed, 22 insertions(+), 29 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/ti/omap/am335x-base0033.dts
> > b/arch/arm/boot/dts/ti/omap/am335x-base0033.dts
> > index 46078af4b7a3..176de29de2a6 100644
> > --- a/arch/arm/boot/dts/ti/omap/am335x-base0033.dts
> > +++ b/arch/arm/boot/dts/ti/omap/am335x-base0033.dts
> > @@ -9,7 +9,7 @@
> >
> >  / {
> >         model =3D "IGEP COM AM335x on AQUILA Expansion";
> > -       compatible =3D "isee,am335x-base0033", "isee,am335x-igep0033",
> > "ti,am33xx";
> > +       compatible =3D "isee,am335x-base0033", "ti,am33xx";
> >
> >         hdmi {
> >                 compatible =3D "ti,tilcdc,slave";
> > diff --git a/arch/arm/boot/dts/ti/omap/am335x-bone.dts
> > b/arch/arm/boot/dts/ti/omap/am335x-bone.dts
> > index b5d85ef51a02..2790c0c5a473 100644
> > --- a/arch/arm/boot/dts/ti/omap/am335x-bone.dts
> > +++ b/arch/arm/boot/dts/ti/omap/am335x-bone.dts
> > @@ -8,8 +8,8 @@
> >  #include "am335x-bone-common.dtsi"
> >
> >  / {
> > -       model =3D "TI AM335x BeagleBone";
> > -       compatible =3D "ti,am335x-bone", "ti,am33xx";
> > +       model =3D "AM335x BeagleBone"; =20
>=20
>=20
> We have software that looks at these in running systems, so I=E2=80=99d b=
e ok not
> to change. If changing, why not =E2=80=9CBeagleBoard.org BeagleBone=E2=80=
=9D? Not sure of
> the convention to mention the SoC, but AM335x is not part of the product
> name.

Is it ok to change it or not then? Ok to move on to BeagleBoard.org.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

