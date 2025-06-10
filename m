Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41500C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 08:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tbFv7luxCC5IISk2uJse1688WeTghFStrZlFWtawY5I=; b=pQBeS7R/iNBtB7AYZ9aedwisYX
	tTU+TMjeOUdbMpJgb7gD+Q3noGJn4ovUb8X+64XUkZGxG5/sR6uXmFDqCtjTc60E4j9YKYynowTje
	eYahzEwnSqJstHeoh7zPMHGSB41C1UQrZCh1lmbtY5z4hb+RXb8gtUu5g1dQa+lWRfD81+DHCaL8X
	T9jtf5Y6ZNMxjt0uisqWM8qMcFrW3hxN4Lguo1TTWtaU70J71rjJHgSf5LWY5OOZBBPfp6XuyK+UV
	45PMpQAsdGQskFFq3MyTqkRFgbEBfMqHniatsGXBevq7CwhY60FKSARCGqY2rpRb9sRh2Ee8fz5xx
	GAcjvLUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOu1e-000000067Ib-0jlr;
	Tue, 10 Jun 2025 08:08:06 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOtzS-000000066wv-0rLw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 08:05:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3485B43B18;
	Tue, 10 Jun 2025 08:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749542747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tbFv7luxCC5IISk2uJse1688WeTghFStrZlFWtawY5I=;
	b=AMYHv+YB2V7GGqx349LfS0wy7zrqWUk+OUwn0m+foMWfBSDDu5wpy+lDYu019KHki8B4YE
	BQBxd6TlDpxQWsejIBbs9J7RWu+BCJRDcHfjvRbRLm68MKlhzst1Nq7pyacfC2PpiF4Ei5
	NsQwQzU/SxuxZ8pKvZJBdVYU4H8/S7MLDs1R7stTtZAJUAExVtevtUrZ1sTAfTpLcvPMKZ
	wly9lvCjL7kqqmPRMUjTCYWpbpwIqZDEZAXCWlZf1EBndFl7S4yKOvtBImE4kpmJUPDno6
	bcXXcjnnNaW/x66rz/2j0xZCVbaY5Ps8BS4gADOgWkEwBPuEHvEtBuoKsXUMKw==
Date: Tue, 10 Jun 2025 10:05:44 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Andrew Davis <afd@ti.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas
 Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger
 Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, Bajjuri
 Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 2/5] binding: omap: Add lots of missing omap AM33
 compatibles
Message-ID: <20250610100544.4beb07e2@kmaincent-XPS-13-7390>
In-Reply-To: <53b48816-37e6-49e8-a5cf-adcca04c57a7@ti.com>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
	<20250609-bbg-v2-2-5278026b7498@bootlin.com>
	<53b48816-37e6-49e8-a5cf-adcca04c57a7@ti.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddutdegjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefguddtfeevtddugeevgfevtdfgvdfhtdeuleetffefffffhffgteekvdefudeiieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepkhhmrghinhgtvghnthdqigfrufdqudefqdejfeeltddpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduledprhgtphhtthhopegrfhgusehtihdrtghomhdprhgtphhtthhopehtohhnhiesrghtohhmihguvgdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrg
 hdprhgtphhtthhopegrrghrohdrkhhoshhkihhnvghnsehikhhirdhfihdprhgtphhtthhopegrnhgurhgvrghssehkvghmnhgruggvrdhinhhfohdprhgtphhtthhopehkhhhilhhmrghnsegsrgihlhhisghrvgdrtghomh
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_010551_020647_8E1EBEC4 
X-CRM114-Status: GOOD (  18.74  )
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

Le Mon, 9 Jun 2025 18:34:10 -0500,
Andrew Davis <afd@ti.com> a =C3=A9crit :

> On 6/9/25 10:43 AM, Kory Maincent wrote:
> > Add several compatible strings that were missing from the binding
> > documentation. Add description for Bone, BoneBlack and BoneGreen
> > variants.
> >=20
> > Add several compatible that were missing from the binding.
> >=20
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > ---
> >=20
> > Change in v2:
> > - New patch
> > ---
> >   Documentation/devicetree/bindings/arm/ti/omap.yaml | 38
> > ++++++++++++++++++++++ 1 file changed, 38 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > b/Documentation/devicetree/bindings/arm/ti/omap.yaml index
> > 3603edd7361d..c43fa4f4af81 100644 ---
> > a/Documentation/devicetree/bindings/arm/ti/omap.yaml +++
> > b/Documentation/devicetree/bindings/arm/ti/omap.yaml @@ -104,12 +104,50=
 @@
> > properties:
> >         - description: TI AM33 based platform
> >           items:
> >             - enum:
> > +              - bosch,am335x-guardian
> >                 - compulab,cm-t335
> > +              - grinn,am335x-chilisom
> > +              - gumstix,am335x-pepper
> > +              - moxa,uc-2101
> >                 - moxa,uc-8100-me-t
> > +              - myir,myc-am335x
> > +              - myir,myd-am335x
> >                 - novatech,am335x-lxm
> > +              - oct,osd3358-sm-refdesign
> > +              - tcl,am335x-sl50
> >                 - ti,am335x-bone
> >                 - ti,am335x-evm
> > +              - ti,am335x-evmsk
> > +              - ti,am335x-pocketbeagle
> > +              - ti,am335x-shc
> >                 - ti,am3359-icev2
> > +              - vscom,onrisc
> > +          - const: ti,am33xx
> > +
> > +      - description: TI bone variants based on TI AM335 =20
>=20
> Do we really need these "bone variants" split out from the above
> list of TI AM33 based boards? We don't do that for any of the other
> boards, you get a SoC and a Board compatible, every classification
> in-between is just unneeded.

As omap maintainers prefer. I did that to have the least amount of change in
the devicetree. We could have U-boot using these compatible but after a qui=
ck
check it seems not.

Regards,
--
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

