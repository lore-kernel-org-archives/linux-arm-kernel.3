Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC25C7114A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 19:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFvaZPsj89bK1e6TtRA9hK2VWG2Z97VXIvjyuBUmYi8=; b=enKlz9HHhaac+Zi9ofqj128Z26
	7yk+W5GAyJgbHNZWBuPhkCjO2Ljr1Gfr/CLrFlZrMVw4Xuzph31PgpwRaCsCF5lVvzb2gz6Mxt82D
	GPDE6dJo5mcBbAh4C6TO7KI7BqcRcpdEXry+RVEtz5WTSnRHfoblGxP0PCD9D+0a/7Q02bOxh/M09
	KJsUVcpNyWPCGRh0MOk/dmnrDTyjkDtibM8kcx0tEXwE1k69Nv+qq3/YIOaaOUc+KvYnbRUAkgjys
	ofiySpjBJJyXrTS4nkZZtNCvSzjy+AXdWWkFGn+MTiwpKbmpBemc5UmWD7404uGeiUwJ5b9DsKNue
	YI6uWbnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ9hC-0000000HNch-4Bua;
	Fri, 13 Jun 2025 19:04:11 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ868-0000000H9oP-32dk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 17:21:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E9F1439C1;
	Fri, 13 Jun 2025 17:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749835305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NFvaZPsj89bK1e6TtRA9hK2VWG2Z97VXIvjyuBUmYi8=;
	b=R4LShqXipvsxVDwypZ8S+KVkqWhF2zcN7yOVYmnFZ4hxx2Y8DOZ4uXur4lCcAQlDojkX9g
	t1EAsawwkCXD4DX0QytsDjPnRrCTMKKA2C7sLSYBYaMK9XTPv5NW/xsX9fiqeZlgamjfcM
	7Ea4r4rkM/YpFJVSVoBflTXPq09+dY3ABZGwpedgopieyujCQTQjOGNKkTASPzthHReBKS
	tfiu98+BOaIP/zYGC7GLMmUqlMzGA8uWwXjTCdEdc2RSACSRgC8VdrgCqyGr85cM3vzJ3g
	1LVCTjL2ZVcLAuJ78O/bIfPAEWL8+XVf3fJuxjktFiddNTIiEzv/PWTy5Z+qPQ==
Date: Fri, 13 Jun 2025 19:21:42 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Andrew Davis <afd@ti.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas
 Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger
 Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, Paul
 Barker <paul.barker@sancloud.com>, Marc Murphy <marc.murphy@sancloud.com>,
 Jason Kridner <jkridner@gmail.com>, Bajjuri Praneeth <praneeth@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 1/7] dt-bindings: omap: Add missing AM33xx compatible
 strings
Message-ID: <20250613192142.5077fc75@kmaincent-XPS-13-7390>
In-Reply-To: <db82d506-3d10-4f6d-a100-d29e3685ba46@ti.com>
References: <20250613-bbg-v3-0-514cdc768448@bootlin.com>
	<20250613-bbg-v3-1-514cdc768448@bootlin.com>
	<db82d506-3d10-4f6d-a100-d29e3685ba46@ti.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefguddtfeevtddugeevgfevtdfgvdfhtdeuleetffefffffhffgteekvdefudeiieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgduleemkeehkeejmeejuddttdemfedttgefmeektgehsgemfhdtkegumeegfeegsgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekheekjeemjedutddtmeeftdgtfeemkegthegsmehftdekugemgeefgegspdhhvghlohepkhhmrghinhgtvghnthdqigfrufdqudefqdejfeeltddpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvvddprhgtphhtthhopegrfhgusehtihdrtghomhdprhgtphhtthhopehtohhnhiesrghtohhmihguvgdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgp
 dhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrghrohdrkhhoshhkihhnvghnsehikhhirdhfihdprhgtphhtthhopegrnhgurhgvrghssehkvghmnhgruggvrdhinhhfohdprhgtphhtthhopehkhhhilhhmrghnsegsrgihlhhisghrvgdrtghomh
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_102148_907873_4BBB6196 
X-CRM114-Status: GOOD (  16.43  )
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

Le Fri, 13 Jun 2025 12:10:47 -0500,
Andrew Davis <afd@ti.com> a =C3=A9crit :

> On 6/13/25 10:49 AM, Kory Maincent wrote:
> > Add several compatible strings that were missing from the binding
> > documentation for AM33xx-based boards. Update vendor prefix from
> > "ti" to "beagle" for BeagleBone to match actual hardware vendors.
> >=20
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > ---
> >=20
> > Change in v3:
> > - Change vendor prefix from ti to beagle
> > - Remove BeagleBone board variant description.
> >=20
> > Change in v2:
> > - New patch
> > ---
> >   Documentation/devicetree/bindings/arm/ti/omap.yaml | 22
> > +++++++++++++++++++++- 1 file changed, 21 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > b/Documentation/devicetree/bindings/arm/ti/omap.yaml index
> > 3603edd7361d..45fa1c61cafd 100644 ---
> > a/Documentation/devicetree/bindings/arm/ti/omap.yaml +++
> > b/Documentation/devicetree/bindings/arm/ti/omap.yaml @@ -104,12 +104,32=
 @@
> > properties:
> >         - description: TI AM33 based platform
> >           items:
> >             - enum:
> > +              - beagle,am335x-bone
> > +              - beagle,am335x-bone-black
> > +              - beagle,am335x-bone-black-wireless
> > +              - beagle,am335x-bone-blue
> > +              - beagle,am335x-pocketbeagle
> > +              - bosch,am335x-guardian
> >                 - compulab,cm-t335
> > +              - grinn,am335x-chiliboard
> > +              - grinn,am335x-chilisom
> > +              - gumstix,am335x-pepper
> > +              - isee,am335x-base0033
> > +              - moxa,uc-2101
> >                 - moxa,uc-8100-me-t
> > +              - myir,myc-am335x
> > +              - myir,myd-am335x
> >                 - novatech,am335x-lxm
> > -              - ti,am335x-bone
> > +              - oct,osd3358-sm-refdesign
> > +              - sancloud,am335x-boneenhanced
> > +              - seeed,am335x-bone-green
> > +              - seeed,am335x-bone-green-wireless
> > +              - tcl,am335x-sl50
> >                 - ti,am335x-evm
> > +              - ti,am335x-evmsk
> > +              - ti,am335x-shc =20
>=20
> SHC looks like a Bosch board.

Oh indeed it is, I missed that, thanks!

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

