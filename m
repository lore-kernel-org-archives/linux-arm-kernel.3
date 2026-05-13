Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69571CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 19:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PjwdZnGMafMUAXlwoDYJu7XCJtlyP+MGZdLjge7uq2o=; b=KxrvB2UdunBOQyzOHfqhBzm85X
	7Qb0khnS9Hrv+6YeU8UNuyXhz+0V+u2jYNrD7DRgvUDd3gz/PSRMdGidavR99nFNvRuxWzxOhElcN
	m3f2+OlwWYJP2Rd/0hwPzjAMZR2CYDCiaoduh6fESBFTo9oy55jAjiuIz+N7VCg2moEtEj9VjHBvH
	3mMG/c9zfNe0oCKX9Ir1cGlRp95QqJMoR1x6Oa1EfH6qf4MAiZezzUIxtR5cMlRG5HIYGn9sIq544
	i9UBstqEadKTPN75FzH4E+SxM4vvWAd+IlxAwQ9uIEVMiXvaro/N6wG00t+eEv/99EYauVfBzPwtf
	SskoIkoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNF3I-00000003Y6i-1cXB;
	Wed, 13 May 2026 19:15:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNF3H-00000003Y6S-0AGi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 19:15:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 23CF1600AE;
	Wed, 13 May 2026 19:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5DFBC19425;
	Wed, 13 May 2026 19:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778699725;
	bh=PjwdZnGMafMUAXlwoDYJu7XCJtlyP+MGZdLjge7uq2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rorca4yKcR0UvmQ9gFa2iw5rNfofSdwMTdtbpp63XHOj3eGTKE2Fun+85tzr8+J/3
	 WnhSKmjGpNSaK0/Lm1qgXWR/63fEVq0iVCWS2r4lg53roiDvLquAhpuVH+V+rOD6x8
	 dCFI+xtTcbtEPxNR6E6zFOzfyGyhKhTUpENrDue5DWSBcnmERHy6mzD3GgIy4OhgES
	 c6MiQjvYSGUSsl3+PizY1+hrdzqMy1EaYPID393I0s5NcDsqsWbtatCBQQo6gwIam1
	 BVlHTzkJbvz+fLTkkGkEdz9n4sx7Ng13A1LhRWjZN6itR8DVMSKCFk4TwUB5/ntCvv
	 Pr64hY38CJoQA==
Date: Wed, 13 May 2026 20:15:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maksim Kiselev <bigunclemax@gmail.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: iio: adc: Add GPADC for Allwinner
 A523
Message-ID: <20260513-retreat-accompany-d3d2c5314402@spud>
References: <20260513-sunxi-a523-gpadc-v2-0-d5efde151dac@mmpsystems.pl>
 <20260513-sunxi-a523-gpadc-v2-1-d5efde151dac@mmpsystems.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T0kZ9Mx4riVIcj7x"
Content-Disposition: inline
In-Reply-To: <20260513-sunxi-a523-gpadc-v2-1-d5efde151dac@mmpsystems.pl>
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


--T0kZ9Mx4riVIcj7x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 06:59:42AM +0200, Michal Piekos wrote:
> Add support for the GPADC for the Allwinner A523. It differs from the
> D1/T113s/R329/T507 by having two clocks.
>=20
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--T0kZ9Mx4riVIcj7x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagTNyAAKCRB4tDGHoIJi
0lhuAQDymppi/A7f9420QrmVJJ6kfQRuhlS2uA4AZgvA3B4+QQEAoYZJzXdLJ8X3
vOkfbI8aNxT7XjRdXyjPG+HWOUKtEAU=
=+BH6
-----END PGP SIGNATURE-----

--T0kZ9Mx4riVIcj7x--

