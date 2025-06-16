Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34205C71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 17:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPuvx70ZOohoMirTtBhIdmAQVlAZJUxM/oDnk3mWn5M=; b=BYfo4NkHbUwgqvM7KVxyZHNx+c
	/dTVaxuoEsHWYDjU7htVqLd0e4tcnwg1QQ0NzUto5OMdpxE6/F0oi/ea6LslsEjpXoKu8UlnX11Mo
	07YEJEcKYRYXWZeF5G2n9BU5FIE27oqJpJjoIY4gZqK8Lx3m/8T3unCw7oFU2toEhkFkv2mboz/SP
	cVeRT5feQu7nXgu7P3kXcuygwXQKKgRLUXpVvBjlK7Y68g52QC0gYbGM7M+UfiyP0fsskGuBHe/gL
	nWphr1cTQeT9B/8cZ/vGT/8fNYMdtGv8Ts6+MaW5I4ttznTL2+s96V0SMI0nncZ9tff3nccu/LfrX
	f6ZXsSjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRDLI-000000054nd-3lgV;
	Mon, 16 Jun 2025 17:09:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBCF-00000004lQI-3jjG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 14:52:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 215E2443FB;
	Mon, 16 Jun 2025 14:52:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A616C4CEEA;
	Mon, 16 Jun 2025 14:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750085547;
	bh=bPuvx70ZOohoMirTtBhIdmAQVlAZJUxM/oDnk3mWn5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AviViFz8EDSu4pci4/s35SA1EqiENbj+hMVxRmOPRm70Az5musdKvmu9A76JmREBN
	 lqQVDakjXqlhAIkWJp9ABAW4/s5Led2bkjbdMB4FEDiYrdTH/U6abDbfSI6xaLtwhz
	 V762DmpOqOrEs9gpSu8bLgLPnCqRXf67JzcKF7EwByyiSrBE2Ixn6TZ0zkVRmiPzlu
	 cBTXzeuatxpRD+D/ljoBdyEmczJe0grP7mkQHUkRIw+5Tjs5XpNjpmmgh2T+5P79Y1
	 x6UZbY/qPahUUjKXdMSQv/lP2nTTHYIAjTulak70ZXln6pW/68GWC1HxrAy4PmCMBd
	 98szxgsNLrYUQ==
Date: Mon, 16 Jun 2025 15:52:20 +0100
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
Subject: Re: [PATCH v3 4/7] dt-bindings: omap: Add Seeed BeagleBone Green Eco
Message-ID: <20250616-scientist-displease-7fba3321aa8f@spud>
References: <20250613-bbg-v3-0-514cdc768448@bootlin.com>
 <20250613-bbg-v3-4-514cdc768448@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NffML9ZiH2lsh2fO"
Content-Disposition: inline
In-Reply-To: <20250613-bbg-v3-4-514cdc768448@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_075227_946967_A5C677FC 
X-CRM114-Status: GOOD (  10.16  )
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


--NffML9ZiH2lsh2fO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 05:49:47PM +0200, Kory Maincent wrote:
> Document the seed,am335x-bone-green-eco compatible string in the
> appropriate place within the omap family binding file.
>=20
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--NffML9ZiH2lsh2fO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFAvpAAKCRB4tDGHoIJi
0nSjAP0QTnkfbkMNtybseo1N8W/Zu0dXYmt/Zvr8lhBp4dvehAD7BpcL4CUzvHX9
ruQ7cqsF7o2eAFOxPej8RZ+ayyl54gU=
=zZQH
-----END PGP SIGNATURE-----

--NffML9ZiH2lsh2fO--

