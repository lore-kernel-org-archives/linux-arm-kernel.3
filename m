Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B405C7115E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 08:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yX6a2kX+avN/Me66IK4ZdJGprGWZ34+Ag3m54z+SpxI=; b=q7Kk65A0+nNVOM0vWO20ls9qSb
	k4VtoMdB98SUhrnkS9yhuOEMw/QK75dQ4trnYolM/4a4KyNPMNmJa0kQ42AetjLYb8l7bhzwGkHS6
	RDbZ8NNURzx4KA3cNnEeEKxYn2Lw9rfGQ+hV5DJfUNnhsl4M61HeKfc9jsU8GcfQObGTOHS45/sOA
	n4J+ERYjZNyjxMcr8TtEbABj9+/2oeloTKl3Ih5tdYNH/OW00peFv6tp4hjiV+Kn1SFs0U5f6JQib
	YpHSUxlgY+WsgcUHDmlnlcbvb49IDRld7x7HRcYzGNwevUgCqCr/cErjb+lhfOKsMZwQfMQtXIceC
	IzrkQtxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAq8-0000000CSrf-2Yla;
	Thu, 19 Jun 2025 08:41:44 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSAP0-0000000CP6a-3MlY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 08:13:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7AF2C433B5;
	Thu, 19 Jun 2025 08:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750320818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yX6a2kX+avN/Me66IK4ZdJGprGWZ34+Ag3m54z+SpxI=;
	b=Eue6OoenItyJlrcTK8NqgxPTI37swvCJGgAJnJELLfqV+fYQW8Ef/A/4O+hUj/Fs9GmeKs
	1YinOFWt6yZ6GN+aca9mfFx3psV6E0SPYS7N0rdzu7OMDQMdAUHg5K08EIBWvQvVOT9bDS
	ttk4rJxeh5JZto5P6K5u5VVYaHE/amvOT/jBSqTCvRAJ+Fwlkq3cIyh8CPEg0+SxiNBY3U
	ROtfmJYWC659jVw5L2J3nlpXGdwZlB+mJ4+ZCxELo6quZVZKzP0fLtGZE9R4ZO2gRbDzBD
	2zOjaJpWPmj+vQBeoaAKdQMKWTuevNg8edK5uTNGLn3lGNMAbfPgBC2JAW45Aw==
Date: Thu, 19 Jun 2025 10:13:34 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas
 Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, Russell
 King <linux@armlinux.org.uk>, Paul Barker <paul.barker@sancloud.com>, Marc
 Murphy <marc.murphy@sancloud.com>, Jason Kridner <jkridner@gmail.com>,
 Andrew Davis <afd@ti.com>, Bajjuri Praneeth <praneeth@ti.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/7] arm: dts: omap: Remove incorrect compatible
 strings from device trees
Message-ID: <20250619101334.5b67741c@kmaincent-XPS-13-7390>
In-Reply-To: <7hzfe4ok9c.fsf@baylibre.com>
References: <20250617-bbg-v4-0-827cbd606db6@bootlin.com>
	<20250617-bbg-v4-2-827cbd606db6@bootlin.com>
	<7hzfe4ok9c.fsf@baylibre.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdehtdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfdutdefvedtudegvefgvedtgfdvhfdtueeltefffefffffhgfetkedvfeduieeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehkmhgrihhntggvnhhtqdgirffuqddufedqjeefledtpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtohepkhhhihhlmhgrnhessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepthhonhihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodguthesk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtoheprggrrhhordhkohhskhhinhgvnhesihhkihdrfhhipdhrtghpthhtoheprghnughrvggrsheskhgvmhhnrgguvgdrihhnfhhopdhrtghpthhtoheprhhoghgvrhhqsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_011343_311323_01DACD31 
X-CRM114-Status: GOOD (  25.34  )
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

Le Wed, 18 Jun 2025 13:41:19 -0700,
Kevin Hilman <khilman@baylibre.com> a =C3=A9crit :

> Kory Maincent <kory.maincent@bootlin.com> writes:
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
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com> =20
>=20
> While I agree with adding the new compatibles for clarity, I question
> removing the old ones after so much time in the kernel.=20
>=20
> As mentioned in earlier reviews, there is other tooling outside the
> kernel that has been built around these strings.  The one that I have in
> mind is KernelCI based tooling that tracks boards based on compatible
> strings.
>=20
> While the KernelCI tooling does evolve with these kinds of kernel
> changes, it also still builds and tests older kernels.  So if we want
> these tools to know that "beagle,am335x-bone" on a new kernel and
> "ti,am335x-bone" on an older stable kernel are actually the same board,
> the tools will need to keep track of that mapping as these change.
>=20
> So instead of removing them, can't we just make the new ones higher prio
> than the old ones?  That way the tools can see both, and also see which
> one is higher prio.

But we can't add something like what you describe to the bindings. I don't =
think
they will accept this. And if we don't align the bindings the dtbs check wi=
ll
complain forever.

> I fully realize this is not necessarily the best technical argument to
> keeping the old and wrong names, so I will defer to DT maintainers on
> this one.  But since it's been wrong for a long time, I'm a bit
> reluctant to remove them completely knowing there will be external tools
> breakage.

Yes, still waiting DT maintainers point of vue on this. :/

I am wondering if I will separate my patch series, the cleaning part raises
lots of push back.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

