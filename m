Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD49D2D8E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 10:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCTwTWEX67ilNdlINoN1P7SjCbg/78kQnJXa+X+DnlQ=; b=OgF1jyVdv6AtU6lyCW7loyhc9D
	2qhzOfhMBIDmpySatS25yB/w98TPitySDjiNZAwe+eTPxjD1cZUmeLBcEduyVG8zJRBi7SilqbqeG
	dsUfuf7swkpTXuuCORqGH3dMomkaZ/SNnzv1lEAwm+yVWWCZa3lJEx8bahQWNfXLc01R2Bp26IUT4
	dQ5PPddSCB/BvEzJ84eZAaPlibi7io1vnlwV3a9S0qAsmFnKMccsZrShtTFEIy7rj6hTPxs1rWFjw
	uIb7dyQxG36I+Q0vcKmRQzT5eVWL9BLlS+xonD6xmwTMmgB1CcfSvAmT5uYqgy+8oFZNvMNfKi5DA
	2FAKQvHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfws-0000000E175-3Vq4;
	Tue, 27 Jan 2026 10:05:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfwp-0000000E16V-1GdM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 10:05:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9911441B0B;
	Tue, 27 Jan 2026 10:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 276AFC116C6;
	Tue, 27 Jan 2026 10:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769508322;
	bh=lnv5v2fg4/DdlahzuPZPpsYPybhX62DGJmyUbVctMYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aXAPdLbarZH2A7vHoDIUlTYJ9dtoBeJKz1kpsSU4fbEWe8dFYdGiSu00hOCNhNSR9
	 DH/p8hVkWspY5oiNWVt4RlYLuMTRQ+6Glt6wlP8erokLEUgouj2f7ibGy6xtVzobC5
	 A/VhAtJ3hdEqGDeo6kd2OFiUvLezxB2JqbPXsAzxn4NFg/9Ya9A5dQpbSJrRCD4HIL
	 PKqNvwMy8iGQ56nSwku1Ui2D39WEElwIHCvsaMOQxjZnCGTp5MzQxx5Rac0BHbp1eu
	 wh5HUOmrOAqTk/Q25S7T/eNi4b3BzVGldujrwnveP1+ibtzdlhO4UgVEiN1DKBcYMK
	 IABkh0HNYN/DA==
Date: Tue, 27 Jan 2026 11:05:20 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, arm@kernel.org, 
	soc@kernel.org, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [GIT PULL 1/4] dt-bindings: Changes for v6.20-rc1
Message-ID: <aXiNaDGyN2oiIR6O@orome>
References: <20260118080304.2646387-1-thierry.reding@gmail.com>
 <53d3a98f-3ad8-43c0-9094-39f229a5b698@kernel.org>
 <3b81369e-8cc7-4e9f-98ca-e6f528e1cab8@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7zmgzmlgkhcad7vw"
Content-Disposition: inline
In-Reply-To: <3b81369e-8cc7-4e9f-98ca-e6f528e1cab8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_020523_378416_3C7F1FC6 
X-CRM114-Status: GOOD (  15.80  )
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


--7zmgzmlgkhcad7vw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 1/4] dt-bindings: Changes for v6.20-rc1
MIME-Version: 1.0

On Fri, Jan 23, 2026 at 08:52:58AM +0100, Krzysztof Kozlowski wrote:
> On 23/01/2026 08:47, Krzysztof Kozlowski wrote:
> >=20
> >>
> >> Jon Hunter (4):
> >>       dt-bindings: tegra: pmc: Update aotag as an optional aperture
> >=20
> > ...
> >=20
> >>       ASoC: dt-bindings: realtek,rt5640: Document mclk
> >>       ASoC: dt-bindings: realtek,rt5640: Update jack-detect
> >>       ASoC: dt-bindings: realtek,rt5640: Document port node
> >=20
> > No, Mark always promptly picks up bindings patches, so I do not
> > understand why these are here. These should go via subsystem maintainer.
>=20
> Heh, and Mark actually did take them on 9th of Jan, so you just
> duplicated the patches by taking them one week later. Mark also sends TY
> letters so you were notified these are picked up.
>=20
> Also Rob was fixing the same in separate patchset and Mark also took
> these, but then Mark handles the conflicts since its all in his own tree.
>=20
> These should have never been picked up one week later after Mark to
> Tegra soc tree. Please drop.

Okay, I'll apologize a third time for this. Sorry for neglecting to
double-check the mailing list and relying solely on Patchwork. I promise
to do better next time.

Thierry

--7zmgzmlgkhcad7vw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAml4jeAACgkQ3SOs138+
s6FUQw//XuMr2GmVCEV7IsKoQMxS07o7BYY+4hO9faPqq+5/xlvflf5dRknmAA2O
BO5QMHylyB9TmQIz+2/ut/ulfTr0vUiAPuWxgax6raeYdFlqKAqGnnPD70MmY9tS
uq3E2p596jmkgHz60kwTY2JQjF3DN95mbcb3avnNrDK9d31YjIuVqP5m7mGuNS3y
kBlkn1Q71CS1F/UkUliwfdWj57fMnGWErH/mFjq0i9puB/Ky9zA0gffd/mfG4+7I
oalkKmvW8V/iNgUQ4JI7nZcBclNEpuqMoOFw2HUpoXdEB0C925GybJvPoe6yIbQE
rKhu4xns5iGWy8wrqojllhhvtjME85OWHcFXzxohNymaRsNOq7RdNa927uFXEcvD
OcjLtTE2GrssmY3VSB5NWMe823/2DjJuokczu7lEuBF8UhgpcwtlJTaW/j8dO+yI
r82kDgTofKMAV2pDrhzA3ibdREjieEHN83MjtVZxhGSkrYq8x1DNBgKtu6cRW5/k
pNgXXcyOhi2NMztjTi8SHiXbF8Aha8gOEkbSrr5eqOnwpaaxJvMBxKSmTuRcsXVK
KQJSNKc3OxkQFTIm5pq/cKntpvBuUDw/B7taXcyF8amWJ6sXOyrmnKY+8Qxqilpe
3ZjOwg0yjyuGnoqXmgLW4wjsf1XcA/sJcaFXZQX09bR3zghTNis=
=96RW
-----END PGP SIGNATURE-----

--7zmgzmlgkhcad7vw--

