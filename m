Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F5BD78310
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 12:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhEI4hQvZOSpAxkyBLCEZRcte3aI524egF5vCINPPv0=; b=KmpB4cWaLaj6Ie00y9N4Y17p5M
	teDs4Foo+JN++aagQXfgmQlEkfvoY+eleM8T4h5TnrPeIrrV8G26BmgQ63ktngK1fMiPHvtbpT16/
	Kwp0GvVxJA8endKFhIFxX9WA9pTjuKUYVRYqMDStcVuukXTu96td5RENtWISWVkqlQEfUO4BTvc4P
	KKA0Ab92nWcTtot+LFJXSUyKP4W/5mAxHc9xfOzMZ2PYvPqH38iQOY662U6lKSwn/s3taj5mJeaR6
	0tUEjuAQcPTB2TMFWqZGDo3ocoRdEEnNN72J6S+H56TMMSgrYTNxygYDsK/Ll2JYokpbNyPhyHX2V
	W5FlPPOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5Bi-000000060HZ-1JwQ;
	Mon, 02 Dec 2024 12:06:02 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5Ah-00000005zz2-23Jb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 12:05:01 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 46D7A1C00C4; Mon,  2 Dec 2024 13:04:58 +0100 (CET)
Date: Mon, 2 Dec 2024 13:04:57 +0100
From: Pavel Machek <pavel@denx.de>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>, will@kernel.org,
	shuah@kernel.org, mark.rutland@arm.com, thiago.bauermann@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 5.10 4/5] kselftest/arm64: Corrupt P0 in the
 irritator when testing SSVE
Message-ID: <Z02iaXudPt42mby+@duo.ucw.cz>
References: <20241124124210.3337020-1-sashal@kernel.org>
 <20241124124210.3337020-4-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5C6mcP4K8z2tNCMR"
Content-Disposition: inline
In-Reply-To: <20241124124210.3337020-4-sashal@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_040459_666957_4677CD95 
X-CRM114-Status: GOOD (  13.63  )
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


--5C6mcP4K8z2tNCMR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Mark Brown <broonie@kernel.org>
>=20
> [ Upstream commit 3e360ef0c0a1fb6ce9a302e40b8057c41ba8a9d2 ]
>=20
> When building for streaming SVE the irritator for SVE skips updates of bo=
th
> P0 and FFR. While FFR is skipped since it might not be present there is no
> reason to skip corrupting P0 so switch to an instruction valid in streami=
ng
> mode and move the ifdef.

This is mismerged. Original patch moves #ifdef. How did AUTOSEL came
up with this?

Best regards,
								Pavel

> +++ b/tools/testing/selftests/arm64/fp/sve-test.S
> @@ -459,7 +459,8 @@ function irritator_handler
>  	movi	v9.16b, #2
>  	movi	v31.8b, #3
>  	// And P0
> -	rdffr	p0.b
> +	ptrue	p0.d
> +#ifndef SSVE
>  	// And FFR
>  	wrffr	p15.b
> =20

--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--5C6mcP4K8z2tNCMR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZ02iaQAKCRAw5/Bqldv6
8mzMAJ412V6JjbuxcrchCjkJtPf4IIGCNACfW7cPJx2m3ROlazM0FJ728S145fE=
=cDPI
-----END PGP SIGNATURE-----

--5C6mcP4K8z2tNCMR--

