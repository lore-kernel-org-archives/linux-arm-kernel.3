Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D685C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Jun 2025 22:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RV2Ao9LrCXX4C6ZPYabE/JoQFUM+lMGNIBm5R3kM+Pk=; b=1RorGJmapI63LK1x3BqWQ4toTA
	lFCMjkKgTCNB+vbNFGhn7l6oMDQRrjs+K/JQgPa2oE5g+vF/XR4IUqHLZg9KWxa3HehVEx5Vsvw/2
	D5WSlHttMTwd3AJx3oZIFflTY4LmW2On+8bwDQH3zMFnxkT6Cbhfh346lxGVSRpYO3QtwLH7aYf5R
	GhprvcB9EFs9JDmnSvGEh6aZllLpCejc36ESY8RKKhwUwqDpyyobwMjTU8oBh226BKOLvTCcuLZ0W
	XRYPGgznLXTiWGXSV6/TY3YA3qhg8tt1TOWUz2g3t8ocMTQB1ejzkwynVsXhzviW/XNg7N78sDFlg
	Y2R8TqJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW0iJ-00000000oj9-2I7B;
	Sun, 29 Jun 2025 22:41:31 +0000
Received: from relay15.mail.gandi.net ([2001:4b98:dc4:8::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW0fz-00000000oeM-4665
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Jun 2025 22:39:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 175E04317F;
	Sun, 29 Jun 2025 22:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751236740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RV2Ao9LrCXX4C6ZPYabE/JoQFUM+lMGNIBm5R3kM+Pk=;
	b=aCsLkVVacrBB0W2vMPwzfHp6ABwHsIWFTAqQ76GXLfApfoCWhqFZQmyRAHvjCmnnVhS2DD
	m4Q9/g6XtMp8KyaIPhtCqlGFnnC/8M4Hn6QS15BpNbBAyaR3XUH0xIn6+kPwNyTo44aNPR
	WBWSx4/quo6LIN10cDpRZZnqyBI7sH/X/qD0ymt8TIx8RN8zTpDkQ4xCIEekt1gReP7DHn
	ukoJLaBOvr5DuVxQziBKzysA484Pvs+wKOhrTKAZBlUuJl5VquFMzcMqs81V1LXtIePEhx
	nn9qa5hqV3441Vrg3YqE2RDLvHY8Rq0m9bf9n/m+yUyicd2qISF3WRHXbnp6YA==
Date: Mon, 30 Jun 2025 00:38:54 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas
 Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger
 Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, Paul
 Barker <paul.barker@sancloud.com>, Marc Murphy <marc.murphy@sancloud.com>
Cc: Jason Kridner <jkridner@gmail.com>, Andrew Davis <afd@ti.com>, Bajjuri
 Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas
 Bonnefille <thomas.bonnefille@bootlin.com>, Romain Gantois
 <romain.gantois@bootlin.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 0/5] Add support for BeagleBone Green Eco board
Message-ID: <20250630003854.79d6d9c4@kmaincent-XPS-13-7390>
In-Reply-To: <20250620-bbg-v5-0-84f9b9a2e3a8@bootlin.com>
References: <20250620-bbg-v5-0-84f9b9a2e3a8@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutddtgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefguddtfeevtddugeevgfevtdfgvdfhtdeuleetffefffffhffgteekvdefudeiieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdtrgemledtieefmegtlehfvdemledvvdgrmeeltdelvgemgehfgeelmeehtddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggstdgrmeeltdeifeemtgelfhdvmeelvddvrgemledtlegvmeegfhegleemhedtuddtpdhhvghlohepkhhmrghinhgtvghnthdqigfrufdqudefqdejfeeltddpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopehtohhnhiesrghtohhmihguvgdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvr
 hhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrghrohdrkhhoshhkihhnvghnsehikhhirdhfihdprhgtphhtthhopegrnhgurhgvrghssehkvghmnhgruggvrdhinhhfohdprhgtphhtthhopehkhhhilhhmrghnsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopehrohhgvghrqheskhgvrhhnvghlrdhorhhg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_153908_622614_C1279E9D 
X-CRM114-Status: UNSURE (   8.64  )
X-CRM114-Notice: Please train this message.
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

Le Fri, 20 Jun 2025 10:15:51 +0200,
Kory Maincent <kory.maincent@bootlin.com> a =C3=A9crit :

> SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone Green
> (BBG). It has minor differences from the BBG, such as a different PMIC,
> a different Ethernet PHY, and a larger eMMC.
>=20
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Hello,

Any news on this patch series?

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

