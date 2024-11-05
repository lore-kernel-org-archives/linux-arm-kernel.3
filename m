Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFCCD2B931
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 14:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Azwtf424wL8jPtWoSRDq53GE0RrElCEJ6KIiSns1sDk=; b=eqIHIg6MB0ge8O8821QvmIlV4z
	KfsBfHl/Nut+2lpkVfcMA8kf7C2okAlJvx0nW5ThtETjNnhfV0hF4UFT7RYFUw7QCZ9rpEz0FRgcH
	cT6hEnL8JxNDm5IcuzoOFjdx8YffS3dcjjzm3Iu9We9HbOS6HL+bwYZxToMICkOpxLN4prZ9RcPrY
	MyDiDRmdNOnESc9yBenB4orhC1bpYbvL5OsKiXmmYDGx+hEX3zbYHlP4DWgZoZVpvfJsnYDjgofP1
	AVyp7WZ7LXYIR8d2UpVcj++ix1kDKrXdUp2VK2TJSBACKv73iuIKxktfch+3pvaJWRPgnZ0fVakrm
	qmPWngUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8KbJ-0000000HH8I-1lhT;
	Tue, 05 Nov 2024 14:32:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8K4w-0000000HByy-3bGi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 13:58:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 90DC65C48D0;
	Tue,  5 Nov 2024 13:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC624C4CECF;
	Tue,  5 Nov 2024 13:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730815122;
	bh=h2YyTsHPIecoq/D4+stAYCx0ZPE+tzXUnwD5nOOZyYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g4qZAbHtQ4DIqtzwwDm32mI0YSVaHX/AgRsCjaTnM5Frn69ZFO8YlR+DmhgbOgdbK
	 oiNNvQQlmLFwhNXuwWhH9x35Frw+LJ9460iZVhOravxJ+HXGwL+IS+6c/hdQZyB6TT
	 XpPzjFLTgVqlUm/ymL5qcggAQ9d7oR41h8E/6kAh8AK62wOo5Euf2ktOWiw2/WGbaY
	 2KC0/ozgfZIdyO3hM03Y6wjMj29SaRF72pRUsbmSorcvmKwNkKIeGlfD1owws/zHcD
	 P+8xz2zgoXwyPSJyYOIZtFpFUBGNMKQMGS6gYKR2sFC8Yz4I3VVWO7EiFdrcp5Zk1Q
	 AZmI5zu2ujmVQ==
Date: Tue, 5 Nov 2024 13:58:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] spi: apple: Add driver for Apple SPI controller
Message-ID: <947246c5-b9e6-43e7-a516-7b82136e6e8e@sirena.org.uk>
References: <20241105-asahi-spi-v4-0-d9734f089fc9@jannau.net>
 <20241105-asahi-spi-v4-2-d9734f089fc9@jannau.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iENhY6dim+9r+yWz"
Content-Disposition: inline
In-Reply-To: <20241105-asahi-spi-v4-2-d9734f089fc9@jannau.net>
X-Cookie: I'll be Grateful when they're Dead.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_055843_044779_532EA9C4 
X-CRM114-Status: GOOD (  14.18  )
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


--iENhY6dim+9r+yWz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 05, 2024 at 09:08:30AM +0100, Janne Grunau wrote:
> From: Hector Martin <marcan@marcan.st>
>=20
> This SPI controller is present in Apple SoCs such as the M1 (t8103) and
> M1 Pro/Max (t600x). It is a relatively straightforward design with two
> 16-entry FIFOs, arbitrary transfer sizes (up to 2**32 - 1) and fully
> configurable word size up to 32 bits. It supports one hardware CS line
> which can also be driven via the pinctrl/GPIO driver instead, if
> desired. TX and RX can be independently enabled.

This breaks the build with current code:

/build/stage/linux/drivers/spi/spi-apple.c: In function =E2=80=98apple_spi_=
probe=E2=80=99:
/build/stage/linux/drivers/spi/spi-apple.c:463:16: error: implicit declarat=
ion o
f function =E2=80=98devm_spi_alloc_master=E2=80=99; did you mean =E2=80=98d=
evm_spi_alloc_target=E2=80=99? [-Werr
or=3Dimplicit-function-declaration]
  463 |         ctlr =3D devm_spi_alloc_master(&pdev->dev, sizeof(struct ap=
ple_spi
));
      |                ^~~~~~~~~~~~~~~~~~~~~
      |                devm_spi_alloc_target
/build/stage/linux/drivers/spi/spi-apple.c:463:14: error: assignment to =E2=
=80=98struct=20
spi_controller *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from int=
eger without a cast [-Werror=3D
int-conversion]
  463 |         ctlr =3D devm_spi_alloc_master(&pdev->dev, sizeof(struct ap=
ple_spi
));
      |              ^
cc1: all warnings being treated as errors

It needs an update for the retirement of the old API name.

--iENhY6dim+9r+yWz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcqJIwACgkQJNaLcl1U
h9DgKgf/ddf0YmZ4oEkNm4wgCTlT/ycNyO5dWuRJbH1oSBwFNktY2pJQsMx3JswW
GfOvhWqiQSN7BXsCNCYwM79OA36ABMxTDU5+YhEiZVxIS2XYyLIO18tDd4KXWYUr
D1JN7D+nGYiaLi8Cfhw3AfnXc3HFDkxW/lb0Syb+V3Z2C9ETTtpcLqqKsGZld9Go
O0mIylw6nzdoNvBOX8acNRseCjifKTS34aFp5VHBlkjHud7wcsJ4mI2YFiMDjkUB
r+3i/soG9MKgVQUVmFukVNqZQtQAgZAfj4OL/B0FK9YfC5ul9RaKbqYO8dznFUBX
o5okgT+07d5QMV/0LnBW9eHfwEy9Pw==
=PxTk
-----END PGP SIGNATURE-----

--iENhY6dim+9r+yWz--

