Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A49FC71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 13:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9e0ar1sgFXhVsoTqepigfauoukIlQ93Op70pYJgpDmk=; b=t9eqFDesCnZ7WnB5pKva6sPYAL
	4sNa6Vm4UjTtmmMkfH+xPQqh932iswimGDl4FYNP8s1lDSecvvhukk01Cd4kL8ekE1gh4klIXVDXH
	4xpvtyV5Cq7zgT0+DW4pVl0ITAkaqwXup979QfhjQRepYVy2sfM+ZnY/AHTwD9Icfm+GnlBeNHtNd
	9B8NjofZSzxmHTxq9GYihmUuxiSJA8ciVRF2RhuuBn8ybpl3aBMYXt/Uk7pyoT5ZDOPAGePMPUfBk
	mMPc3V7OscfJ3pohgBhIQJcGCIryOh9e7pleGS/FshQK73DJTsZHqXDdB8+KYTrVK6LjUSiZx2fcd
	ABBzd0cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRA3e-00000004ZZG-17iE;
	Mon, 16 Jun 2025 13:39:30 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8xk-00000004N59-1NU4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 12:29:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1EF243896;
	Mon, 16 Jun 2025 12:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750076957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9e0ar1sgFXhVsoTqepigfauoukIlQ93Op70pYJgpDmk=;
	b=PE8qN9crPUfVsmmKX1QwY80baPPMNqjFlfFPzpM5Eq0j5MuzDvPUVMJpKUpg6WV/76Cyw0
	d7iRil/yVoRQNmsCfRQv+rsi/o5Xa7H9KKAnpaPoMBX94B4lAkPcEj0rL6uorWEet1Cgpt
	vmDQXP8/yafePzzRl1VVgmiMEqXaF1Mvgpa+AcpEi0yHtzgrNPJAdcnRUTjC9fOcw+kaFT
	8CVbyEHQYK9g2DwNs8JiLHR/MtnP8AqquUzEaOtd+yih2pO2DsxOQLY7gwYpyiRxdqDXkg
	FDjcd97wb0m0vlbTllM9Y6+wt/Q17I0PvXaQ6jPcYSCGnUjrx4I0jmliYaeJ/g==
Date: Mon, 16 Jun 2025 14:29:13 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Josua Mayer <josua.mayer@jm0.eu>
Cc: Jason Kridner <jkridner@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Paul Barker <paul.barker@sancloud.com>, Marc
 Murphy <marc.murphy@sancloud.com>, Andrew Davis <afd@ti.com>, Bajjuri
 Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/7] ARM: dts: omap: Remove incorrect compatible
 strings from device trees
Message-ID: <20250616142913.1afad458@kmaincent-XPS-13-7390>
In-Reply-To: <7e854232-f02f-4ad6-b65e-22c18d1d9fe5@jm0.eu>
References: <20250613-bbg-v3-0-514cdc768448@bootlin.com>
	<20250613-bbg-v3-2-514cdc768448@bootlin.com>
	<CA+T6QPnaCFZyRsv9q3bcOrTc22nA0AOXy0tR_SpAkGVVPQqfLg@mail.gmail.com>
	<20250616103919.2d678c1a@kmaincent-XPS-13-7390>
	<7e854232-f02f-4ad6-b65e-22c18d1d9fe5@jm0.eu>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvieehkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehuddtveeigfevgeegfefghefgkeeigfefgefhvdeufeejledtledvgfffieekveenucffohhmrghinhepuggvsghirghnrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehkmhgrihhntggvnhhtqdgirffuqddufedqjeefledtpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdefpdhrtghpthhtohepjhhoshhurgdrmhgrhigvrhesjhhmtddrvghupdhrtghpthhtohepjhhkrhhiughnvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhonhihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhop
 ehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprggrrhhordhkohhskhhinhgvnhesihhkihdrfhhipdhrtghpthhtoheprghnughrvggrsheskhgvmhhnrgguvgdrihhnfhho
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_052920_837840_AE4A8070 
X-CRM114-Status: GOOD (  19.52  )
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

Le Mon, 16 Jun 2025 14:39:03 +0300,
Josua Mayer <josua.mayer@jm0.eu> a =C3=A9crit :

> Hi Kory,
>=20
> Am 16.06.25 um 11:39 schrieb Kory Maincent:
> > Le Fri, 13 Jun 2025 13:52:23 -0500,
> > Jason Kridner <jkridner@gmail.com> a =C3=A9crit :
> > =20
> >> On Fri, Jun 13, 2025 at 10:49=E2=80=AFAM Kory Maincent <kory.maincent@=
bootlin.com>
> >> wrote:
> >> =20
>  [...] =20
> >>
> >> We have software that looks at these in running systems, so I=E2=80=99=
d be ok not
> >> to change. If changing, why not =E2=80=9CBeagleBoard.org BeagleBone=E2=
=80=9D? Not sure of
> >> the convention to mention the SoC, but AM335x is not part of the produ=
ct
> >> name. =20
> > Is it ok to change it or not then? Ok to move on to BeagleBoard.org. =20
> The Debian project most notably uses the "model" string:
>=20
> https://salsa.debian.org/installer-team/flash-kernel/-/blob/master/db/all=
.db?ref_type=3Dheads#L2191
>=20
> When that changes inside a dtb by kernel update, users may be unable to=20
> boot.
> Therefore I would recommend against changing "model" values.

Maybe they will have to follow the change.
Don't know if this should not be changed over time even if they are wrong f=
rom
the beginning.

It would be nice to have a devicetree maintainer's opinion on this but I do=
n't
think they will reach this message.

I think I will keep old model values for this series then, I don't want to
block this series on this topic.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

