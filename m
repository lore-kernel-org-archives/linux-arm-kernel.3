Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD3CD0EE00
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 17:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CA1eO0p5f45jexjHhUafXRPgJKY3/dZ1DSzr3e6oBAQ=; b=UduwS2jMC7IM2Lgz18a6diCDCq
	DO2+jTChXB7Uc/KycDrxNtKAWRz1jv762+B7EFAQrw0KjkX0IOICujeJYQuK9k93x5ZmvOR+ZXtwL
	afN6YZljqsCBYSYq00vpdEEZ0Vz9wPE0xMgfiXjnkvwsSPu9VKjmkApAikTIimXWjFd6iw92AOViR
	PDc4rcER5vo6Xkd5QESdoMNJAqEf8BxdETO2anipD/IHh/Xh6NsZFYXm5/V7dlwUW4/ys2Pobr7+b
	RJgohWqaa07XGQLuM81VuQmCY0oEhJvpHh1H+GSta9fpNOkRt6ScsxctrDSz1ukcfgz8tI06vBCIj
	RrQbm1eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNxCE-0000000DhqW-0z6X;
	Tue, 25 Nov 2025 17:51:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNxCB-0000000Dhq7-3w4N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 17:51:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8343041B1B;
	Tue, 25 Nov 2025 17:51:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 768FDC4CEF1;
	Tue, 25 Nov 2025 17:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764093078;
	bh=hZ0nCEHlVTA1nsg5CMprLuL2BGcLkzepCg2uCqMklmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S9MljQDDRBfARVdY/tjLEq9bwY//3TDVrIdDDigSlOfmGuZAkhiyV56M+OlVe8mNI
	 Md7NU9yswT934agZKZJt2d8ZHbOs4oYb6/8WJ1jbXWCANdCkYoz8f9m88ggDYfmEgp
	 9aFW7/21ZK2ajdRHsECBgTJmQhs17VkhgsbpzodH8Z/HLzoYigbeogY7q5nJzI3dFM
	 XNnZ7BrBZMnR1hHrKa+QnP2AWznPuiddgFzd0dGiOZItQtC1Go4iBJj5iM4bFsluWi
	 GrOZi4AChXs/yNqlTeEJ07Rx43nnh8+2Gn9Wqxu1VfAL6PEMXNyrwDG6rDcdb5nePg
	 6zgvAVi6IVJxw==
Date: Tue, 25 Nov 2025 17:51:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Han Xu <han.xu@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-spi@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	frank.li@nxp.com
Subject: Re: [PATCH v6 2/2] spi: add driver for NXP XSPI controller
Message-ID: <519e20a0-8568-485e-a66d-04309ba0d43a@sirena.org.uk>
References: <20251125-xspi-v6-0-22b22de50cda@nxp.com>
 <20251125-xspi-v6-2-22b22de50cda@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0fBe0dDGaWuEA0re"
Content-Disposition: inline
In-Reply-To: <20251125-xspi-v6-2-22b22de50cda@nxp.com>
X-Cookie: Too ripped.  Gotta go.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_095120_016841_A2C20BFC 
X-CRM114-Status: GOOD (  15.01  )
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


--0fBe0dDGaWuEA0re
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 03:42:19PM +0800, Haibo Chen wrote:
> Add driver support for NXP XSPI controller.
>=20
> XSPI is a flexible SPI host controller which supports up to
> 2 external devices (2 CS). It support Single/Dual/Quad/Octal
> mode data transfer.

This breaks the build:

/build/stage/linux/drivers/spi/spi-nxp-xspi.c: In function =E2=80=98nxp_xsp=
i_exec_op=E2=80=99:
/build/stage/linux/drivers/spi/spi-nxp-xspi.c:997:9: error: implicit declar=
ation
 of function =E2=80=98PM_RUNTIME_ACQUIRE_AUTOSUSPEND=E2=80=99 [-Wimplicit-f=
unction-declaration]
  997 |         PM_RUNTIME_ACQUIRE_AUTOSUSPEND(xspi->dev, pm);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/drivers/spi/spi-nxp-xspi.c:997:51: error: =E2=80=98pm=E2=
=80=99 undeclared (fi
rst use in this function); did you mean =E2=80=98tm=E2=80=99?
  997 |         PM_RUNTIME_ACQUIRE_AUTOSUSPEND(xspi->dev, pm);
      |                                                   ^~
      |                                                   tm
/build/stage/linux/drivers/spi/spi-nxp-xspi.c:997:51: note: each undeclared=
 iden
tifier is reported only once for each function it appears in
/build/stage/linux/drivers/spi/spi-nxp-xspi.c:998:15: error: implicit decla=
ration of function =E2=80=98PM_RUNTIME_ACQUIRE_ERR=E2=80=99 [-Wimplicit-fun=
ction-declaration]
  998 |         err =3D PM_RUNTIME_ACQUIRE_ERR(&pm);
      |               ^~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/drivers/spi/spi-nxp-xspi.c: In function =E2=80=98nxp_xsp=
i_probe=E2=80=99:
/build/stage/linux/drivers/spi/spi-nxp-xspi.c:1265:45: error: =E2=80=98pm=
=E2=80=99 undeclared (first use in this function); did you mean =E2=80=98tm=
=E2=80=99?
 1265 |         PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dev, pm);
      |                                             ^~
      |                                             tm

Please resubmit after the merge window unless there's already a
convenient tag for the new macro.

--0fBe0dDGaWuEA0re
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkl7I8ACgkQJNaLcl1U
h9C0tgf/YcrzNPwbMN1QjAnLXeUAf89jb5nkePTTivrSOOZF56vX6iKAOTLJNT0g
qgDJth6HXcsaP0ZBpRvixYQyGzQ3fTmQCAa3gef+0l4/hI6AtHj+5eOju2RyDZxS
mtp1DLuy7gCMoYwBrB+bokNcVKkeHsv5/5pby7D4E4KVIYJSSR17h9KsL0jcvfVC
fMW0/twVKvMSQS58xaWtTmGsMJH3qy6mU0Me1o3C3ms+BrGxVh4j8NpFtvBOBEH+
Q5TiKi50jbKahVyrzK6B4+UklPOFEILY9hWsgKEg5BsPSUFAYb83v5/h4/ZTe5oE
MUuv0w5Y9V9yv/7Qnd0Upo0tdrDtug==
=LBmg
-----END PGP SIGNATURE-----

--0fBe0dDGaWuEA0re--

