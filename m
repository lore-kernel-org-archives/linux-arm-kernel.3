Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB5B10A1E77
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 11:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vgc9KvChhjRavgBjrlbscuXfO3SJeUlFlFdUNRpKwec=; b=qrGBNMiVrEyr4pLIDEbhftFne+
	nd3I6DflCxaOyjmVz+WVXJqm9bUTU4m0rZDsSZoC/2EVadkNd8lc2gnD/CGmYWtfBd1RKKqi/ZBIv
	p8rVrUT6bRZgzJUvXHelmjE0sLaQxvInBEuQV0xOCFy1PvBUKKg2lmd3ddAifyx4UOBWKfPQ2pWGv
	DrBvOHixMm4HrY6onBz/VoxtS+Lv3No0Z+8INe3uwMhy4uJktiAt0Xo+iTfXG8UfprirUvg1VnSjN
	LXir8Rn/U8tUaqzzdQEuXOF6PuJ2NuUatwoO7jyq9juHkTygLbEFmBwxdHNwbREyJK7UpD/QnWzIg
	yvhqxJ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5iZR-00000005K9N-19cD;
	Thu, 26 Mar 2026 11:08:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5iZO-00000005K8x-2Drh;
	Thu, 26 Mar 2026 11:08:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E75184391B;
	Thu, 26 Mar 2026 11:08:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91817C116C6;
	Thu, 26 Mar 2026 11:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774523289;
	bh=+FhWc0INodHNcusM5JjA9bz3CwoI7iZDfiT6TTB+4QA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lOgdNxLsTi8DtMDzePjgCDmLAHI5mhZkzKeH7gXHNmILLQJwgN+KjBX5ja3sWHVQ8
	 dOYWiUkC0dY/HRVSqfbB5jPWnjBYLt7uXcrCzmF0NMQ0Wb+8gk3c/UDUiiaUbcUdcx
	 44tT+tHR+AVhfL/BdHxujl5NxuTiD7XRocYQyUo6MZXeSY1QmeQSN9DVDMouytg2XN
	 PhqZ7oehi5pR/1/b1E3srSGvx0BFg8mBDE2Fq8Gc5NfwQl/b28iMzeuK2yZmililqC
	 gwV7jhPOgAMYiEx/csjr5zacH8CCPdZns5Uw5iDLfzt/HL+XvlDdojiQL7uzIN0hSf
	 /sZSgaNOMehzQ==
Date: Thu, 26 Mar 2026 11:08:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND 1/2] regulator: dt-bindings: mt6315: Add regulator
 supplies
Message-ID: <0d027c7e-f1a3-492f-880b-4b48d64bbd41@sirena.org.uk>
References: <20260324053030.4077453-1-wenst@chromium.org>
 <20260324053030.4077453-2-wenst@chromium.org>
 <20260325-uncovered-carp-of-inquire-8a7acf@quoll>
 <32638731-8f33-4203-9e68-1170cff99280@sirena.org.uk>
 <CAGXv+5Fo2GmvWQGogA-KTsFChE0-SOwWek6BQ+ZA3xaXup_z+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q/FgDHQaj/4ct7kW"
Content-Disposition: inline
In-Reply-To: <CAGXv+5Fo2GmvWQGogA-KTsFChE0-SOwWek6BQ+ZA3xaXup_z+A@mail.gmail.com>
X-Cookie: Here there be tygers.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_040810_618972_BF9DE7E0 
X-CRM114-Status: GOOD (  13.93  )
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


--q/FgDHQaj/4ct7kW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 12:14:32PM +0800, Chen-Yu Tsai wrote:
> On Thu, Mar 26, 2026 at 12:55=E2=80=AFAM Mark Brown <broonie@kernel.org> =
wrote:

> > The top level, so people can figure out where to describe supplies
> > without having to read the bindings so much - the supplies go into the
> > chip, even if they're distributed within it.

> OK. What about the more complicated mfd PMICs? We already added
> *-supplies for the regulator side of these PMICs in

>   - regulator/mediatek,mt6358-regulator.yaml
>   - regulator/mediatek,mt6363-regulator.yaml

> And my other series for the MT6359 also adds them in this manner.

Existing bindings are existing bindings, we can't really do anything
with them.

--q/FgDHQaj/4ct7kW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnFE5QACgkQJNaLcl1U
h9CL7ggAgKF6xfRBI6ZivfcXbd/SrQnByho2Y1xJl2cnd1Y0TCfoatIiZB7ZiYz5
qCv+EKML1pICmBQM+d2qEJfssXEOVqou60WZIaiK35y8/G7WuubtGGHeOTaj3ISC
tYBPuL0xZkBonsk54HqiLedLdPI6kqudc17Bpjky4ohW5OEc6tBceHpIQ5JjeT47
XWnIUn4lT2ceikRNsgj5AI7EaVYTSVh6o/cXPHuz1FbQMlEj9htuvaey7/NpH76f
9N00HqwUP9qAesmrjOjVDa7M8sj5aPNLfH1YVL/qH03lP2dAOiqhYlmebW/YItNQ
ZN0kBy1Lv2fAMLBLsMn4GlliVMsccQ==
=aoz7
-----END PGP SIGNATURE-----

--q/FgDHQaj/4ct7kW--

