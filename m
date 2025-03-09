Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5FDC28B25
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 00:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szqCjg4d8QsrF+kYbNSWgnbNPQ3W+ripzXsLT+GOp7c=; b=cbY3e6LGHd4RIvs02j/uKRLZH0
	LEGroagmr5K/Y4/oaCxUdrvaq/lanmx5BDneAf7/yrK6V63+MR3se7l4s73gW049gRUkYEBMSTDSJ
	A12w8WpHoaGKYcEVUfchs7AIjWFYu2+Iily5zwKpGmDjfUzmk6jVkqRu8e/uP/amVBKBo8pG/qVIN
	4keXZLTwl3FwaKCNfq9rB5QLtXFl7brSq72JSQ7+38eqUMrg6qxKDJLsT0jiA96JaYKPmTbeqI+IG
	JKcbmYLlu7cZYAaAeN5usgRQNWaz2/35S/mFgENlTrm/NJWKPhWVRdh8GpufJo7aXs/v7uWyIoleI
	Qz3Wt36A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tr4Uz-0000000HMNp-1r3Y;
	Sun, 09 Mar 2025 00:26:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tr4TL-0000000HMJD-3AB3;
	Sun, 09 Mar 2025 00:24:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 514DE5C4336;
	Sun,  9 Mar 2025 00:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35A5C4CEE0;
	Sun,  9 Mar 2025 00:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741479889;
	bh=szqCjg4d8QsrF+kYbNSWgnbNPQ3W+ripzXsLT+GOp7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Be4m0mGThOYM6JcXqk8+uCCQv6Ltc1Zpke8d5hMkVHlxB0l6HdKQxVCG3IpCuqbky
	 adQIKvBUBLCy/Pa17Ab8DG8QoudztNygRbTGYjoqpEQh8liSD0ml0x7rV5M6XfSOH4
	 8XY7TSIOXqi3N8Xn7PzN349nXzXJFf1i+ewclW1N88Bn9cbrRYHdyXZlE2U3FcycIy
	 r8PyRPZjyicCKZIS9w2ZhsE0jXfr3zmzMHxILXUtLyUsRWgfCff5nilcKeC3qiWO/o
	 3HRHrZ7vZU5HFDEttyxmSuLbSkEeGamw9/lhLB+Wweam0CWtFKxkXITEeRMOFGwKTI
	 UQO0pbMTpRjhg==
Date: Sun, 9 Mar 2025 01:24:46 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Jonas Karlman <jonas@kwiboo.se>, Yao Zi <ziyao@disroot.org>, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pwm: rockchip: Add rockchip,rk3528-pwm
Message-ID: <dit7oqsrs2g5rxor6aakprqw22yyovvcel5tnd2cteydtpt7zg@ndf4cmiamoit>
References: <20250307120004.959980-1-amadeus@jmu.edu.cn>
 <20250307120004.959980-2-amadeus@jmu.edu.cn>
 <pnlkcc2rl7fegltovgtvp4xdxhonw72rclvhn7qmvb7xyuullm@xf5x6lcigji3>
 <5942715.DvuYhMxLoT@phil>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z34uotnwfhj7flql"
Content-Disposition: inline
In-Reply-To: <5942715.DvuYhMxLoT@phil>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_162451_841146_519CC5AA 
X-CRM114-Status: GOOD (  19.36  )
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


--z34uotnwfhj7flql
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] dt-bindings: pwm: rockchip: Add rockchip,rk3528-pwm
MIME-Version: 1.0

Hey Heiko,

On Sat, Mar 08, 2025 at 05:25:09PM +0100, Heiko Stuebner wrote:
> Am Freitag, 7. M=E4rz 2025, 18:07:47 MEZ schrieb Uwe Kleine-K=F6nig:
> > On Fri, Mar 07, 2025 at 08:00:03PM +0800, Chukun Pan wrote:
> > > Document pwm compatible for rk3528 which is fallback compatible
> > > of rk3328-pwm group.
> > >=20
> > > Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> >=20
> > to prevent binding warnings it's probably sensible to let both patches
> > go in via the same tree at the same time. Feel free to take the binding
> > patch via rockchip/arm-soc.
> >=20
> > Acked-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>
>=20
> You already have the rk3562 binding in your for-next branch [0], which
> could create merge-conflicts later on.

Oh indeed.

> This patch already contains it, so should fit neatly onto your branch.
>=20
> And binding warnings only come from linux-next, so won't trigger as the
> pwm will feed the binding there too :-)
>=20
> So I guess it might be better to take the binding through the pwm tree
> and me then picking up the dts patch.

Fine for me, so I applied the first patch to

https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next

=2E

Best regards
Uwe

--z34uotnwfhj7flql
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfM37oACgkQj4D7WH0S
/k75Swf7Bf2agH4VhhrJhceAjdIf6UQBP4yoTIlhuCQDNgORf85O2aCq9ThJxGAc
CY2k7Hkupfg6o2VHtsaIpRv9hBxyvKUIejmE1bS575NuAUAsyTya32Wsjyjyxho0
0Hee8EhcDdcsZ9cZW6pYnoJkPlFrPTT39WRG3VRW8m3nS4Qb77HKbu/6YRjZoKVQ
Hw/yk0FI2YP9rvIpT6qf5e1TdWKzB25Mqt9A0n2C9ureAOso8ufB+P1vHX5lb4I4
bI6Iemr0pvmAwC3qAzDJ/oKldaOKlD5pUFofTyPy3YWXpTKknHL9XnNEPOBQ5P9S
RLq9fYax8rVmmepGRTC6XluJOCDk+w==
=iOg2
-----END PGP SIGNATURE-----

--z34uotnwfhj7flql--

