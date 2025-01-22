Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CABBC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 18:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+sJ40zBAhXNyM5+7H2SDONfRCEukX+la4Ys4RjzEr0=; b=MJoIU4rhUhCZ46qVJTX6rJ+7kj
	I2v3NU+EJAmO2EU1RJK8zk9SLwXO7JbZKeXxAVRW86SkGfY2WBPqsfl7Zaj8+diYa/EMJD2jJZv+G
	brQ5Fq1ERGGVKMDLkRtDXkXO+dljrAO9AeWkSb2LBRCml9PUlpIJenQV2D7h6scaQ2cRSpgqNB8tv
	kkTOIBn2nKZGjSvPgridzrPjfEOhy1Mkk+bokxA8qTJZG37bXOxaMP3jBKQOHd94k5S3Q98zwP2JY
	Wi3Qqc3vdN3bKEcTQEbOC2MdlZNhaUgrZLVpnzrYk3bTGHF5JbSfphuav0K12GZeQrWQDFAFP4+Qe
	yGAJhvJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tafSf-0000000Az41-0Y3W;
	Wed, 22 Jan 2025 18:28:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tafRN-0000000AyrI-1D2C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 18:27:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 091BD5C58B0;
	Wed, 22 Jan 2025 18:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E74CC4CED2;
	Wed, 22 Jan 2025 18:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737570420;
	bh=Q+sJ40zBAhXNyM5+7H2SDONfRCEukX+la4Ys4RjzEr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pX5DCPAwGd8XJlAcwCjZS7/TvZBiKO4OOj1cNFM+YP0iDnM9bgSH/FQE2nyR1c8qV
	 SoVFFzxNrRnJO+nIFJ7TzyDz8Fr9af7kwKiRgeqXB4OZBnkQ6U/WHr1Qd0jNi6Tb9t
	 efU68epX+//wQU/fqR32UVkdWBedD+Bngzhx9Xrrq4uy9ZBTJiB0vAk9/6P2fpmngV
	 oivqHn/8hLl8jy/vBhsyh1iTlVSRl1JQnSGxfgicHC6qLxjaS77tpNMKU4YHXgNePR
	 FIz46E+v7VxSSpaVcG0SVagOR+gMf8hDNUY8a6yc2F08J1C4fn98y9d2Z7w8863ev4
	 AvZUTNe+oP2qA==
Date: Wed, 22 Jan 2025 18:26:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pankaj Gupta <pankaj.gupta@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [EXT] Re: [PATCH v12 2/5] dt-bindings: arm: fsl: add imx-se-fw
 binding doc
Message-ID: <20250122-feed-empathic-4954564d95ba@spud>
References: <20250120-imx-se-if-v12-0-c5ec9754570c@nxp.com>
 <20250120-imx-se-if-v12-2-c5ec9754570c@nxp.com>
 <6110fd00-c050-4bcf-8971-674bc8c0bfc7@kernel.org>
 <AM9PR04MB86049239156AC82F0AA4BCCA95E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
 <000e44f1-839e-4f43-9bb1-ae53d6826ff7@kernel.org>
 <11880309-5021-4038-a4eb-a3a80da71550@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AmcLC6ZH7ugu6oqW"
Content-Disposition: inline
In-Reply-To: <11880309-5021-4038-a4eb-a3a80da71550@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_102701_415389_AD5D5009 
X-CRM114-Status: GOOD (  14.57  )
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


--AmcLC6ZH7ugu6oqW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 11:35:50AM +0100, Krzysztof Kozlowski wrote:
> On 20/01/2025 16:01, Krzysztof Kozlowski wrote:
> > On 20/01/2025 14:07, Pankaj Gupta wrote:
> >>> Driver configures multiple misc-device on the MU, for multiple
> >>> user-space applications, to be able to communicate over single MU.
> >>>
> >>> It exists on some i.MX processors. e.g. i.MX8ULP, i.MX93 etc.
> >>>
> >>> Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
> >>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> >>> Reviewed-by: Conor Dooley <conor@kernel.org>
> >>
> >>> Where Conor's review tag was actually given?
> >> On v6.
> >=20
> > I already looked there. No trace for tag. Please point to the message.
>=20
>=20
> Still no answer from you, except that evading answer, so let's be clear:
> don't create fake tags.
>=20
> Clean your patchset from all fake tags and keep only the ones which were
> real.

Ye, I don't see that R-b given either. My guess is that somehow "go for
it :+1: was interpreted as one, but it certainly was not meant to be
one. Converting that to a tag is definitely not okay. Seems it appeared
in v9 after Rob prompted about /his/ missing review from v8. I never use
my k.org email in tags, so that is an immediate red flag. I think I never
re-opened this thread after seeing that Rob had approved it back in v8,
so I never noticed. Only by chance that I opened in now.

Thanks for spotting it :)

--AmcLC6ZH7ugu6oqW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ5E4bgAKCRB4tDGHoIJi
0v8/AQDUg11QxpssLFmCOzFjPrBV3rDvFSXKMi4tkZxmbAb1rgEA6rnCv9zbtejU
growuDDxx9odvXR3iA6s6XV+J3V9VAA=
=CXkd
-----END PGP SIGNATURE-----

--AmcLC6ZH7ugu6oqW--

