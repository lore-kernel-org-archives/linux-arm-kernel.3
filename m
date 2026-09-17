Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C34C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 22:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAHJa1o17312CYNFiD4zfuhqKr9lbf9t3naSNm1O3t0=; b=BwAKPQHIH4rGAUgakCOawL/3/I
	atmUBdMuRcfh/ER4A0lfVJI1eT0tOqYSuS/cy6GWYorIgFUPgZtmN0LSfniefUUEkHIHgVvDCEuyD
	r+EFbNf0yS92Xgx/zNZnHpE/BXtYh7XqT89hwwv3uUj/3rLuqin8AEF540htQauuTKXdVVVHXlKm/
	G1UEfoI7BnZdWwjK5ZYKWLBc/V+Zym2FzzZCQf4LQf9q/5ddZpecaifXPCdVINaWRQDjkNXW+zvMn
	hanxAtCRsy4VSuuf5IQdqmJWWOAm6EP4mKk+onPyem28guewor1M457bhIHqrYGcAqQ8UvzndJyQZ
	TJJS3H2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7KVj-0000000CdjZ-2XaV;
	Thu, 17 Sep 2026 22:23:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7KVi-0000000CdjQ-3KCP;
	Thu, 17 Sep 2026 22:23:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 38E0240435;
	Thu, 17 Sep 2026 22:23:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF6AC1F000FF;
	Thu, 17 Sep 2026 22:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789683798;
	bh=OAHJa1o17312CYNFiD4zfuhqKr9lbf9t3naSNm1O3t0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XlyyiYMlXm1DOvsqF2YQKjQL1SAZCKR8onNHWACRb49iwLZ9ZY8bJwbE0TdtC3VLA
	 uX0bBeIjSzR2VgQviYNFbAg62zND8jCpps5Deu00rOM0g5RezqBDnR3ONR/XbPXZiy
	 nweATYb/lQdJ3eMmAg36C2bND5G/vLEsea4CvXuLIAz8q8ruRjgtIuFyi4wR4/emVm
	 AGCkd8hO6LKj1Ov4M/NNa+IV0JfWN/xS4sH3Ah/dDR6CPybHnEOubENOE95T1QhEx3
	 nhgQCSZvvVLWO2G/jhk/CyX/XWY/eOuvO2FK5nKK4BPe5l1t0PiuuFwQ1wFBvfEW7b
	 fK4OSpt/+C2Lw==
Date: Thu, 17 Sep 2026 23:23:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Frieder Schrempf <frieder@fris.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH 1/3] dt-bindings: spi: Clarify what rx-sample-delay-ns
 describes
Message-ID: <c0c4645b-a51c-409f-82a3-a6e6bbd7962b@sirena.org.uk>
References: <20260917-spi-sample-delay-cleanup-v1-0-0e4eddbfb1ce@kontron.de>
 <20260917-spi-sample-delay-cleanup-v1-1-0e4eddbfb1ce@kontron.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L0y9QomAYqKB4qGL"
Content-Disposition: inline
In-Reply-To: <20260917-spi-sample-delay-cleanup-v1-1-0e4eddbfb1ce@kontron.de>
X-Cookie: Whip it, whip it good!
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


--L0y9QomAYqKB4qGL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 05:37:35PM +0200, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>=20
> The property is documented as an offset from the controller's default
> sampling time. That says what the value does, but not what it is meant to

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--L0y9QomAYqKB4qGL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqsaFAACgkQJNaLcl1U
h9DFQAf/YiZIXR/nWBD844AeGm4hNeuzDP06VgDHz/DZQv5Mt9rgoj/KVDgdXr5Q
XED0luFopb2JIiZ3kGlptpsJE/0b97GXeo6pSEXR9Q+wK5G2PpxIFxdrEq6GK7UM
bDTbtFaUA3TZ2esXyIeVl8rkr99aGsTy18baJr7U9PoX9YiPLm28BHnMSs09m+B0
oto/aP502j9+RT9V1CGLRAZ2akHfbWYmybSPSUS3tIJ/v7KlSO0QPLKQuc2KYBmZ
WM5nfYy5VLqGvJ9fYmIWUAwzb75oYs+bttATEU2qdtzU0huqntr9MBC752AqOBWH
jF1ANLwoRK3TuxJqPQ/He64Z0oOgNg==
=iAiR
-----END PGP SIGNATURE-----

--L0y9QomAYqKB4qGL--

