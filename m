Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74042C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 21:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MZOonTfrv64GIV5+rDFu+eH6vhEGsf8KKT5JpDnAQ04=; b=D1y2dH+y4VfMYsJkF8lXecsnKB
	71cbaBoiJ4xgJLhIlsRgY9U7GGpHg81rs3jnNvBPKNpsM8SXn6zcnF+Q3miaNjyONWEpRZkyFRq3/
	ZCqQc9bsWEz1xVZInJG7Hs8+XWGTZdnxU+d74MhNNQVDml0tr4eZz4D1ZuRR0/4ha4R5zJILMnoVu
	VB2P/Ha4nwKgPaubtcRRXl0/a7E4zeN8vTA+I8UC9TJPb8s67hNXzBYPfeZAgOUBdpKYzwTzuk0AW
	I2I54eWkOdgxS5FR5lL8QTCQzM95zHuj+YYkkPP/1bMvP+RwdbpNP5eJ6AT2T156USldW4pK38t+k
	Q4PK0JsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOkCf-00000005HXi-1U1i;
	Mon, 09 Jun 2025 21:38:49 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOjDI-00000005AAE-0IsQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 20:35:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9510442C7;
	Mon,  9 Jun 2025 20:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749501320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MZOonTfrv64GIV5+rDFu+eH6vhEGsf8KKT5JpDnAQ04=;
	b=YrK78fOZJDmLOg1RDpxGMfVw6vaSzXByQyQaykHVH/1X5NOCYhIm4g1T8qzTHme003x90b
	VnwtXQG6E3xFyRfYrU7hSlHzRD162lYU64kTsqLgoLLmF6jKimBGtw0wQ91RimxpOgxvsz
	Fjj6+uSdffdgYJ+k6BDdyyHCA0P9A3+uFbcPcaUY6npbyjb+aGuqFx/8Od5QMD/FKV1MmY
	DdoYGs4QkA4O7Yg7S87xmuutd6w0GyjsDlaTg8FTDDAAq9u4NSW60dKjHpuatxw/rkIStT
	O4SWy0Zii9SUoCuFoSZrOkqHZDjkJZBGQOpTz2H74DBpOE4YfnzSVDBIFBy26w==
Date: Mon, 9 Jun 2025 22:35:16 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/5] arm: dts: omap: Remove incorrect compatible
 strings from device trees
Message-ID: <20250609223516.32ec18be@kmaincent-XPS-13-7390>
In-Reply-To: <20250609220809.3a488972@akair>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
	<20250609-bbg-v2-1-5278026b7498@bootlin.com>
	<20250609220809.3a488972@akair>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdeljeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfdutdefvedtudegvefgvedtgfdvhfdtueeltefffefffffhgfetkedvfeduieeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudelmeekheekjeemjedutddtmeelhegvvgemrggvugdvmeeitgeksgemudgsfegsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkeehkeejmeejuddttdemleehvggvmegrvgguvdemiegtkegsmedusgefsgdphhgvlhhopehkmhgrihhntggvnhhtqdgirffuqddufedqjeefledtpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtoheprghnughrvggrsheskhgvmhhnrgguvgdrihhnfhhopdhrtghpthhtohepthhonhihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtoheprhhosghhsehkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprggrrhhordhkohhskhhinhgvnhesihhkihdrfhhipdhrtghpthhtohepkhhhihhlmhgrnhessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtoheprhhoghgvrhhqsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_133524_715906_89F31304 
X-CRM114-Status: GOOD (  18.22  )
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

Le Mon, 9 Jun 2025 22:08:09 +0200,
Andreas Kemnade <andreas@kemnade.info> a =C3=A9crit :

> Am Mon, 09 Jun 2025 17:43:51 +0200
> schrieb Kory Maincent <kory.maincent@bootlin.com>:
>=20
> > Several device trees incorrectly included ti,am335x-bone-black or
> > ti,am335x-bone in their compatible lists without including the
> > corresponding bone-black-common or bone-common device tree files.
> > Remove these incompatible strings to fix the inconsistency.
> >  =20
> thanks for cleaning up some mess.
>=20
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > ---
> >=20
> > Change in v2:
> > - New patch
> > ---
> >  arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts | 2 +-
> >  arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts          | 2 +-
> >  arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts     | 2 +-
> >  arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts       | 2 +-
> >  arch/arm/boot/dts/ti/omap/am335x-shc.dts                | 2 +-
> >  5 files changed, 5 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
> > b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts index
> > a4f5b5262645..fb88eebb8c5d 100644 ---
> > a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts +++
> > b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts @@ -11,7 +11,=
7 @@
> > =20
> >  / {
> >  	model =3D "TI AM335x BeagleBone Green Wireless";
> > -	compatible =3D "ti,am335x-bone-green-wireless",
> > "ti,am335x-bone-green", "ti,am335x-bone-black", "ti,am335x-bone",
> > "ti,am33xx";
> > +	compatible =3D "ti,am335x-bone-green-wireless", "ti,am335x-bone",
> > "ti,am33xx";=20
> this looks like too much cleanup, also according your omap.yaml stuff,
> ti,am335x-bone-green should still be included.

Oh indeed! Thanks.

--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

