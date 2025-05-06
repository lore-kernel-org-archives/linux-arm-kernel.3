Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C4FC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 20:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yk89LHTXO3jss8gNOPcfJRUOju19BFvggSyJM9Digqk=; b=Xv0Fewol89xtDKcUQQEHq3C4/T
	HRWEAWvJZ9g/F7m6p3Zbq9Gdmot5YWmHzV8xCwkKQkoASpI/apzLkU9U6wz5ukmQPAq2aePbqfdTu
	lJo1RbnzgwcjHg4UtA/nD22e1yXEw9b6cCUX+3pArX6XDxq9vXKXWX6h/qnXO6PSCvNWUFT0O0wNZ
	+kRfSPdG2fF2SGWSOBSml2HdBzASKgEhKsVH6Py0UuiuUOeAeq5aWCeCPDabUtsSlPPsOpibxYFne
	lw/38KGXRWjNTE1gkafmNvmfWzoSshDXVt4LBXRR0ZF8gnJN6/Fer7GY2xihbx4GjBf6r9Zu/UqxO
	wSKhbCsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCOky-0000000DMCE-3rRI;
	Tue, 06 May 2025 20:19:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLBe-0000000CgB0-2W6C;
	Tue, 06 May 2025 16:30:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 140D361165;
	Tue,  6 May 2025 16:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0129C4CEE4;
	Tue,  6 May 2025 16:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746549027;
	bh=yk89LHTXO3jss8gNOPcfJRUOju19BFvggSyJM9Digqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i3FdGlF9r/zuuI40wyqxOzGvxDbf+SqGdyaiMBUoxowwEunFPrve3bRz6pb6552t/
	 8FjCXrOBQ74tQ+RoKpFLwzTUyrMAVFx6Bvw/iQMYUltrNV9dY4T8/MMvkp42Mk5rXF
	 ZxQuIWb1pxu7GYi4ObbFdg8EqUhg8c0rMLM1VzWR+WLqdwUaxfz+wnWhFXDVxvylgt
	 WyY0dVl8Th4ieB14eCz59E/yzC1DzZlE4Tag+Hob7lUG2AKCv3PSkIWJcaG7xUVGAf
	 OO7tUayKKhf4yr5NL8ZObm3CfyeOaZjVVYk3XoJJDhIWamkHUUohSiJYi9q3+WOkyq
	 suD7hzhxBnK6A==
Date: Tue, 6 May 2025 17:30:22 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Amjad Ouled-Ameur <aouledameur@baylibre.com>,
	Bernhard =?iso-8859-1?Q?Rosenkr=E4nzer?= <bero@baylibre.com>,
	Fabien Parent <fparent@baylibre.com>, kernel@collabora.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: mfd: syscon: Add
 mediatek,mt8365-infracfg-nao
Message-ID: <20250506-safeguard-brisket-96da510a99d3@spud>
References: <20250502-mt8365-infracfg-nao-compatible-v1-0-e40394573f98@collabora.com>
 <20250502-mt8365-infracfg-nao-compatible-v1-1-e40394573f98@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PZUhCmeqes3xNKnX"
Content-Disposition: inline
In-Reply-To: <20250502-mt8365-infracfg-nao-compatible-v1-1-e40394573f98@collabora.com>
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


--PZUhCmeqes3xNKnX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 02, 2025 at 12:43:21PM -0400, N=EDcolas F. R. A. Prado wrote:
> The register space described by DT node of compatible
> mediatek,mt8365-infracfg-nao exposes a variety of unrelated registers,
> including registers for controlling bus protection on the MT8365 SoC,
> which is used by the power domain controller through a syscon.
>=20
> Add this compatible to the syscon binding.
>=20
> Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--PZUhCmeqes3xNKnX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBo5HgAKCRB4tDGHoIJi
0o6IAQDuQXjMuejZZPZgecYQRVBoKrB/iTH2vnh1+sSpGOzoXwEA159pOsyZy5CJ
3GifqtsxDfIlIV5zxXmOb+gRCw9eOg0=
=ziAH
-----END PGP SIGNATURE-----

--PZUhCmeqes3xNKnX--

