Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D2AC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 18:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RsWVaUzWvEZ4fZMUNRQ9q/wlooicPIF66TOc3eIAYX8=; b=nLgGETD/SIyxV9+dSP2KyDMGKu
	gAuKTYyQl97K0VsNjLbgOiHBaJ8Syx8lPMnDT2Eh8vhtzU84nd0gbVt84p4oyryITQeNgXaQi9Ob7
	uKoXKABit5l0ngTmRxepmBrcxrJ1x5m0IGkY0bH8rwtZYc15AUfUP1VlbR0TJln/7IvUF7j0Ewa1m
	wR4DBeKLvrUJmWNqPOZnOzthya/54/u0A/2xvlLe+xkbAxWoXwk6GpFGXzcVaWUKDzNLorP2nJgye
	p1MkiGYO9sCuQxNUdq4xob8sKcHskGQFom/fP7HrqvSjm7sgtFoTarjyc08jdc4SK7r+RGmxYTe4t
	JCMqQhPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP426-00000007qS9-3qwz;
	Tue, 10 Jun 2025 18:49:14 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0ur-00000007JnP-3NtD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 15:29:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 156C3A5141C;
	Tue, 10 Jun 2025 15:29:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 630B3C4CEED;
	Tue, 10 Jun 2025 15:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749569372;
	bh=qUnJvb2oUe9IlYbfN0wDYHHg76thgwuul6xFyCTVAzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JySKFZu7LyDYRY/pSwCbSB+8HoaOzBcXvldD/C+w3dRJGGaX9sPjAnW2ba57VrWGZ
	 dixiMvE/hIIiuhk8q1MOvZJ4bCFRbyT6QX+DzeRfTyZIv+1/ADuQCnH64b9FqSG4j5
	 oeqONBT3lhI/VpLxrelx3ajO8jUG4V7/tDwQuR5jc8Ur4mhEXd4pdv4/RkEAOH25J+
	 tOyfk6Nz59ns7MLiZlT3AXGemRMHD6j1VuoentHGvj2iEliNUpKbwUIZzq2F8W+4E9
	 VOMaQZpwsAd3AuvDd7ONiJ04sopINazrc5y5KH3QGiTQFJk4Tw16m4UPklkv8Hb0ov
	 kdwXB8gop02bw==
Date: Tue, 10 Jun 2025 16:29:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Kory Maincent <kory.maincent@bootlin.com>,
	Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Bajjuri Praneeth <praneeth@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/5] binding: omap: Add lots of missing omap AM33
 compatibles
Message-ID: <20250610-during-unstirred-9e5b3de34467@spud>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
 <20250609-bbg-v2-2-5278026b7498@bootlin.com>
 <20250609-hacking-corporate-d53531577680@spud>
 <20250609215044.33ef6b52@akair>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bq1VQ7xvQiSm4oQx"
Content-Disposition: inline
In-Reply-To: <20250609215044.33ef6b52@akair>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_082933_912926_A5EE5869 
X-CRM114-Status: GOOD (  14.81  )
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


--bq1VQ7xvQiSm4oQx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 09, 2025 at 09:50:44PM +0200, Andreas Kemnade wrote:
> Am Mon, 9 Jun 2025 18:03:05 +0100
> schrieb Conor Dooley <conor@kernel.org>:
>=20
> > > +      - description: TI bone variants based on TI AM335 =20
> >=20
> > "bone variant" sounds like some shortand or nickname. Are the boards not
> > called "beaglebone green" and "beaglebone black"? Whatever about the
> > compatible, the description should use the full name I think.
> >=20
> we have an enum below it listing all those variants. So "variants"
> makes sense here, but better "TI Beaglebone variants"

Yes, this was a comment on calling it a "bone", when that's not what the
boards are called in their marketing material etc, not objecting to the
word variant.

--bq1VQ7xvQiSm4oQx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEhPVgAKCRB4tDGHoIJi
0kf0AQCBG5FUfKJFQESxkHdprjsOpc1aEZNx782kfcj1wwZEvQD+PYJgZ7einBw4
BiQ/5XM+7HXejbeVK1mMvNsoQFAZPAE=
=agcq
-----END PGP SIGNATURE-----

--bq1VQ7xvQiSm4oQx--

