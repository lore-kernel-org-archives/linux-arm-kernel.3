Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60ACCC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 16:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=76fJDa3yU2VhoQqB4RI7nd3g845aWQiGrXShEphjl0s=; b=WTPVF26C/EuH3Xu4GUurFyCqTe
	R1wUpGNHNshTIj5bKkeWZer+GqwXBaUD05IkjaKlnM/siMquScPAPbzlAiVez2whL0xTteEH1vyVW
	lgX0J8wUl7/AvasUMXURK7CYPqIiI87JcVddhaWZvbnp8ZUsHIX3NbiIgZ4I55IXUdCN2kVDXQcAH
	DhSk72BbwcRAlly/W9eeRjme7n/HUMDMjH1fvwnrbPPuBJ5vqyJvU0+2cJTbcM+y9JDJqdsOuft3z
	dRv04yVKHmSp/jkp1dRHHewMGrlZ5Okj5WCS2gOMZFIK127nmgBDIZIkR5lMDq4VKykydDNFoH9Ce
	Jy+izwLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwimu-0000000A8qY-1DFd;
	Wed, 19 Aug 2026 16:05:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwims-0000000A8qJ-3ym5;
	Wed, 19 Aug 2026 16:05:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E522860DBF;
	Wed, 19 Aug 2026 16:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DF051F00A3A;
	Wed, 19 Aug 2026 16:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787155509;
	bh=76fJDa3yU2VhoQqB4RI7nd3g845aWQiGrXShEphjl0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IqyxbUDdNGT8BeOulzKlmGuFD5psESBzgJ2T+hC6XzD++jB/JY7svtYyfGtg383ss
	 9rybPfEuMe+A4jWqZ1IPe9Wz21eqyD98FX+uHGBjjSxfqZA6SdcgGVtmRe8Zxn7HpD
	 Uri+cjfSS189+GDNnx9zIYVZearL9e1GNQy6xtl2gzCQ6IWUQlsic2CXjbF+UwwpRN
	 KJTMXFqyrfm17AHoEsxULTcRKvHTo9enXaSx0KjIb8YSKNGUIIElBF3soY7FyQQ6AQ
	 Bewvo5z9xY0+39H9Ru7SI/szZJBAJV1o8vfMJ8R/3P8HSYnG6wzynqpC3oup5+36mt
	 Cc8KTsTimL2SA==
Date: Wed, 19 Aug 2026 17:05:05 +0100
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: mediatek: mt8183: Fix APLL enable error
 handling
Message-ID: <8881e314-0825-4686-a296-97c03b1dd33d@sirena.org.uk>
References: <20260819101849.68010-1-phucduc.bui@gmail.com>
 <20260819101849.68010-2-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ufr91nyObYYC2H+r"
Content-Disposition: inline
In-Reply-To: <20260819101849.68010-2-phucduc.bui@gmail.com>
X-Cookie: Allow 6 to 8 weeks for delivery.
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


--ufr91nyObYYC2H+r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2026 at 05:18:47PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>=20
> Currently, the mt8183_apll*_enable() functions call mux_setting(afe, true)
> but do not check its return value to handle failures.
>=20
> In addition, the cleanup paths of mt8183_apll*_enable() do not call
> mux_setting(afe, false) when the enable operation fails, while the
> mt8183_apll*_disable() functions do.
>=20
> Add error handling for apll*_mux_setting() and call mux_setting(afe, fals=
e)
> in the cleanup paths when mt8183_apll*_enable() fails.

> -	apll1_mux_setting(afe, true);
> +	ret =3D apll1_mux_setting(afe, true);
> +	if (ret) {
> +		dev_err(afe->dev, "%s apll1_mux_setting fail %d\n",
> +			__func__, ret);
> +		goto ERR_APLL1_MUX_SETTING;
> +	}

apll1_mux_setting() logs errors, do we need to add another log?

--ufr91nyObYYC2H+r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqF1DAACgkQJNaLcl1U
h9DXtAf+MNuno9lo4ZsotXg9MOl9pnhUb2KfgvrIvkNu4j4j2CbqJoFi1hMugT8v
GqW9yNgjbPMzJ/Of5sgmWc9keOc4bcVDhewHaKFMa+bKOVmyJ54lcu5PPQ9EYUQk
vdoK9uKUB3eVKWZeOPC0DyyEEP+BOEUt/oqTBPMdlV2hE1hIoMf38j1rEeEBaqID
0kPr7CIi9H9Et3KmDcHVXX+VCTWR8OXpeR6ZHIDbRPnGlCe9kvYYIINkuRntT7kj
dpY6zArUsNBY6TC+XoUlwBln+WR1nTcdifXa1jfVF80RrwMn1EyqR5CHRo86/1oT
M+nJS19pFmGbOWnSVN59/ox9/+TIoA==
=YBEO
-----END PGP SIGNATURE-----

--ufr91nyObYYC2H+r--

