Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89520CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wTY8sQJCWnwG3DrsJmtDo0CSWigP/nBZswIgk4m/C2E=; b=JxeyIhYCRlf+U5bl+Ah7nc0hPK
	araRp4RHOr6JEBedPnbkiErVWE5s5zn4d3f966fQ0URpEtSFr5sX9j0RS2KAonY5NtRZ487OLtF3+
	g0HBXmGeMgBVpocj0MYe23GI9N/gZPISK4iDp8vXf8Z3rnwsx7Lr+XGNKV63gSzWItVlLcUnsoOXM
	W5ZK42r64YTQV2Iq7Bd7oICiX487E+e7t4quq5nTvBN1WjyMHBNSqIjZF2yFSGXsTwdST/+hVQOaR
	ABMIYTjuDQ4zvi9I5WE4grTW9bZrbhFndXs/3TUqLikL/+yS7VhztUglVy9Rejwp3spSsbOdJkTos
	KYj0ggmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfSG-000000018me-0dgl;
	Mon, 08 Sep 2025 17:15:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvcwZ-000000008ZY-1ybw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 14:34:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D2FA60145;
	Mon,  8 Sep 2025 14:34:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40984C4CEF7;
	Mon,  8 Sep 2025 14:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757342046;
	bh=jmLh3PuSVlUt+g2PX4Ay2Hb0ur+5MEG8C0HwO0GRTe4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HcFxI/a131+8oDxawx1vgEO2l2fI8fhcgz372G5G5qWIrT4kEPDpQAfrvhcTrL70T
	 A5LBVSpJyb1F3Uq8C9ZRjO9+azCb12DfJiwC30UYnSCsU7sTNabI3iQHeJKHqi6Yob
	 B6saoMyHoeKyFs7FMuemIGzuWC4BHJDKLMIdObhMWGPGEWEQbwvVGgDzw/RU6aZW95
	 iGAt2MZUDSGJodtPbk6NuvBX4oHCb7eKR9/P9o3tN0+EKnmqZxuRg6x8q+ycwkOamR
	 WDSIBjNrWUA1QvyPubTjP5yyadNE4flz9Mylz/G2Mf8Vh1wCqjRhkOmMowmXK4c2QA
	 iyyePEmruZgVQ==
Date: Mon, 8 Sep 2025 15:34:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andreas Kemnade <akemnade@kernel.org>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: mfd: sy7636a: Add missing gpio pins and
 supply
Message-ID: <c879f3e1-f64c-4cbd-97ec-646d06488d8e@sirena.org.uk>
References: <20250906-sy7636-rsrc-v1-0-e2886a9763a7@kernel.org>
 <20250906-sy7636-rsrc-v1-1-e2886a9763a7@kernel.org>
 <288f0cf1-1ee4-4eba-b059-641120bb93f3@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1dMKtcdKROWDAugT"
Content-Disposition: inline
In-Reply-To: <288f0cf1-1ee4-4eba-b059-641120bb93f3@kernel.org>
X-Cookie: Air is water with holes in it.
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


--1dMKtcdKROWDAugT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 06, 2025 at 02:01:25PM +0200, Krzysztof Kozlowski wrote:
> On 06/09/2025 11:09, Andreas Kemnade wrote:

> > +  en-gpios:

> enable-gpios, unless it is something else, but then please explain in
> the description.

> > +    description:
> > +      If EN pin is not hardwired, specify it here to have it set up.
> > +    maxItems: 1

It seems reasonable to name the property after the pin on the device?

--1dMKtcdKROWDAugT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmi+6VcACgkQJNaLcl1U
h9CLxwf7BQyHW20zqZG878E+egZPMLHOqAvNnwHpAnZh2j/C2o8dZP1Sutt2+VUa
ClPzdsXzKZarDW9CCEktgoCyIrLV8k8pAE8sQuldBmxD6Mu3daLTB0wQVr2RpcBt
K3p65WmmnAJERwUAxATQDdjJs+sRWWBgghOcdy6pIPIZmvdr5DUhyzBh5UfYFyCM
C/JUDDPJtrnCmmVAsYP6p68+4fNHyWdnjnf5MM4xIbE/03ZmPVtZuOGLpyE9BqY2
jM6WSKGu1NSf1BAd9+AjmGrjGLAwpNrerssP8ADjesrvhQkYR6ib71JScEjS0TaF
z2sqtPhxcCdpn70FwcGyveIf6mwZBg==
=ahy3
-----END PGP SIGNATURE-----

--1dMKtcdKROWDAugT--

