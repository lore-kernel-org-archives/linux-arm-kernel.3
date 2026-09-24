Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D77C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WUIXMGlF00n/an+XIpdJzwcraIyNlcy2fVXrbp/3+vI=; b=QSgNt1elezSnas/Hlj373zKIOo
	uU1ubzBKhy8XIlniaghgHjYavGcGoUlvCx0vI8zW7EFVeoVfNUnoLrO/D637l/qPVYrMzUBpibFRP
	tirlkHqFdUv2JPRbcZGDXiXbWLcXIyHH2TuhCxZPQEO9Mu9D4tOHhvHu0gpxoggH/O75fld4iGzIf
	HD2ycg6gBpQDXL2nopq7m8nMEZKvSscABNvX5FNoa71gEhtb37q9rwVkhk5VuIks7bKWW0PVLvsKn
	EHGYtrQlezSTLj4NrjQ4YmgCHl9yFssdYObKnqUvOrbn2XD+X7jd8ZF826vW5lO9miD8l0MPAcW7t
	RfLOdtJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mr7-0000000BgI3-2Lcs;
	Thu, 24 Sep 2026 17:03:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mqz-0000000BgGm-3zVk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:03:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 653B0601E4;
	Thu, 24 Sep 2026 17:03:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA6A1F000FF;
	Thu, 24 Sep 2026 17:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790269405;
	bh=WUIXMGlF00n/an+XIpdJzwcraIyNlcy2fVXrbp/3+vI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C8sPSa+pp//4QY0n2InsviILwO2ANC2TmhgCzyKFTFL88X1OA1rd8piCZ75I9NYuf
	 fEC4gZaibZp2Mu+2cnaTVOycqGqUN+E9Ir2xIWEGVyYNu6SlG/wx/nOI6//uR1xuM4
	 SzEUnwUkjRl2qhzU1qZe9tmBaUl+HYwW3ds7tqxVGzCfdWyeX7dlIOsyUE70XAxjMu
	 a1FMvSAzwEYZrtkuHzbC+3WNlKr6kjS85sdATWW8JqrBJCfxxFOzOz+bs56EPWukLg
	 Caw4bVrWp2lhFZChfGOJzssdpZ7QUgtYQEDQOIS3Fyfy1xEhSduphAsxvK/HcrHISG
	 ZL+oTMyBJa+Ig==
Date: Thu, 24 Sep 2026 18:03:18 +0100
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@oss.nxp.com
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz,
	tiwai@suse.com, linuxppc-dev@lists.ozlabs.org,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [RESEND PATCH v5 0/5] ASoC: fsl_asrc/fsl_easrc: expose
 per-pair/context DAIs and fix DMA race
Message-ID: <744ce325-9d2e-45c7-b7d6-15ec7558dc83@sirena.org.uk>
References: <20260922033428.1690822-1-shengjiu.wang@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="thyvYpNwRTH7ReUZ"
Content-Disposition: inline
In-Reply-To: <20260922033428.1690822-1-shengjiu.wang@oss.nxp.com>
X-Cookie: What's so funny?
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


--thyvYpNwRTH7ReUZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 22, 2026 at 11:34:23AM +0800, shengjiu.wang@oss.nxp.com wrote:

> Changes since v5:
> - rebase to latest master of linux-next

That's not a resend, a rebase is a new version.  This is all confusing
b4 badly, it's not picking up any of the reviews as being attached to
the v5 that already exist and doesn't even look at the new version since
it sees that it already has v5.  Can you please send a v6 with all the
reviews pulled in?

--thyvYpNwRTH7ReUZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq1V9UACgkQJNaLcl1U
h9BVcwf7BCet5mcdSMq0zC0cNsA9teLN9+P2zlswGHdgRRU40PVwEFizlbbS7wZl
DOt1x1P94upHDBxOIj1BQlE2NH0CCx1Ndmd+GoJ0iq+zvPD+6wWhehE1HJyf1odN
tHP8B7rCqkWXpKyWwPhWuQ7K6CjRo524433hqpLMfwEwIi4cRw2AIDPEJZEDxe4G
YVIw8Rs1M9mOcSeAW1AcEx6zW8ZRr9Fcsl1ZL4z5iOj7rBRVLjfy6AKbM+Xkekpf
3JcHWVENhCGh1J2m2PHfK3X4eKOJzRY/QJozB9KyoB75lQHUiYpC9msiJ+F4IN2J
2IKKSaDZ354mcPpf2uwWiGkUJN/bEw==
=1Dsv
-----END PGP SIGNATURE-----

--thyvYpNwRTH7ReUZ--

