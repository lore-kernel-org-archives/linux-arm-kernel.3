Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70044C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 17:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmTRd7cG1P44Mw4Qdx6fGexr/qg2QQsm2Eiwg7qSOlc=; b=i6c+pu/F1VO+jGDZsB5wlgy06E
	XfNCIxuVFjgvyyojWq9QakUA2qKwukzbUWzoXLsjYK3W1/XC2mrRSeJUQJerOBzSDynvSDJusuvlE
	hKiEAlzRhE3N8HbIbnz3B7HJiiT6O7z7ackk/rT0qX5XpSOL/A/zfFyvY36aD91/E+HBfLyLndPJY
	tSiSojNl2KcfgqsCuE5HZ+V7JGoZljiPFdk4Pb1RWkG1EymA6tYFMH4IrU7DJ3d0S61OMwTjk1sQy
	yZg050uoeX4m0GIQkk8ahPx/3eeuJBXRS27J95TIdlE0UesiSXcPndROMwToyTyYN9UfhV5yS4Bm8
	dqz7f1ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZqk-00000007zDf-3OBa;
	Tue, 17 Jun 2025 17:11:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRYYL-00000007mts-2sQt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 15:48:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 93994A5171D;
	Tue, 17 Jun 2025 15:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 458E9C4CEE3;
	Tue, 17 Jun 2025 15:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750175328;
	bh=gmTRd7cG1P44Mw4Qdx6fGexr/qg2QQsm2Eiwg7qSOlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wui6XRS836ZHKlYutz44rbTY/RJ4ZwZePbS7hdtApYSsmdfJf31pJXkpEiQjjFKbv
	 ojum6YEE15KIv9z2zryztQSUhgEwUbCJYBIlT8VWp11UPwT9cE204mFKzuU5+tbxPA
	 kZiT3jWLlogU5+0UwNIuGG9MhimxBHkphXwQH9u8mT1dubCofXhTYNG+DaeNfLXdjV
	 17UgA603VyB9FcQ6H78F+Aylgrhlupb1J8pg+MVKwwQzfIu5ZMYbyy8lk2DDFupiiz
	 ZSdNT8XO4DhY7j2c7Xk0wF/wSXXGluCEYmcwt5uHu13w0uIm0SdEsDpB8/iYrlza6O
	 qF5CvsZsNIvow==
Date: Tue, 17 Jun 2025 16:48:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Paul Barker <paul.barker@sancloud.com>,
	Marc Murphy <marc.murphy@sancloud.com>,
	Jason Kridner <jkridner@gmail.com>, Andrew Davis <afd@ti.com>,
	Bajjuri Praneeth <praneeth@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/7] dt-bindings: omap: Add missing AM33xx compatible
 strings
Message-ID: <20250617-flaring-thesaurus-1847aac1a580@spud>
References: <20250617-bbg-v4-0-827cbd606db6@bootlin.com>
 <20250617-bbg-v4-1-827cbd606db6@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dwcojE+WiyTAewaF"
Content-Disposition: inline
In-Reply-To: <20250617-bbg-v4-1-827cbd606db6@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_084849_786831_3A9CCD78 
X-CRM114-Status: GOOD (  10.79  )
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


--dwcojE+WiyTAewaF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 01:59:24PM +0200, Kory Maincent wrote:
> Add several compatible strings that were missing from the binding
> documentation for AM33xx-based boards. Update vendor prefix from
> "ti" to "beagle" for BeagleBone to match actual hardware vendors.
>=20
> Reviewed-by: Andrew Davis <afd@ti.com>
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--dwcojE+WiyTAewaF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFGOWgAKCRB4tDGHoIJi
0giYAQDfl18/v+0Cb4uHY3q4Td70JepYf/uzfRt3FvTGFIwxkwD/bKzTGC5ixBGY
fb7Oo9bjWcM2vvew+15LVJUJm89gAgU=
=3fUN
-----END PGP SIGNATURE-----

--dwcojE+WiyTAewaF--

