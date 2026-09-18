Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2B6C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 12:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jZjMknHkx8BX5rBouTl+QaAXJkEXnMFJLCmzg+gkxM=; b=obUgd0uc8N8ZRxh6ma99P3YpEM
	YmiCta3VSAOMwqO8wuVITVj0LxUVzMzcXhNEqNyFOaRw6TndwMkEWvN8ZL9z4ZK5GS5vi3xIsmfhS
	m4Z9aBtfOfUglffQI8NAisSILHZNHHiuFuqXcTZuEqGKqgzGjcdq3QGAHERYHi4KTyXVf8iji/8kv
	pLmo7ImzDSFMsrWiFwShFeETwkKX8QKnY8dVk++IDr14C1FGdnBLgNxQeyDNd1ysm79DwnYlEXSwP
	5eDQbSFulMxDVG6s7QzM3dshWQm4VKaLMLEHXvTnC+p6wkt0q36sYdgL/i1c/7AqEG45k9ZE6tKHG
	hkKzSMDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YAg-0000000EQbn-0kO7;
	Fri, 18 Sep 2026 12:58:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YAe-0000000EQbQ-3riC;
	Fri, 18 Sep 2026 12:58:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DE6A96053C;
	Fri, 18 Sep 2026 12:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD981F000FF;
	Fri, 18 Sep 2026 12:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789736307;
	bh=+jZjMknHkx8BX5rBouTl+QaAXJkEXnMFJLCmzg+gkxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q8O4Mfr0Su2K5lTU44Xq3rNWrYkvq42k3ONRlPM4rj9vUnnVa6GbPi/LCJQl/V3kz
	 G5MjEpO6KYM6JrVteRD2Xs3uQ1Q6bU4bGyiaOWm+kY6l88yKFUNFn6kv5KHEBL/yvY
	 Yke5LJKkOiBBnnXAjwLtotYXygQ4PPx2hOAe3b2Nu1+uidlTjZMlhCintKK5gd6jeJ
	 o8gw+DUvOIJ2D5cKPtdawHT0LarR6NSuFknqFx5O2WAuo45pTxSXOo+TTKvLoiGFVU
	 troKaVmcL036hWbESJIMB2+2pk0HYI/a1HF/XsnjpPRouSPCZ2hvDLJBTPcffrm7hZ
	 Mudx0iBNw5A4Q==
Date: Fri, 18 Sep 2026 13:58:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Mizuno Miotsuki <founder@crepuse.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>
Subject: Re: [RFC PATCH 0/1] ASoC: codecs: rk3308: add support for codec
 revision B
Message-ID: <cb148119-a746-4b9d-8a3d-fc209ca6adf4@sirena.org.uk>
References: <20260918125711.94361-1-founder@crepuse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qvbS5Oge9x2b8SxP"
Content-Disposition: inline
In-Reply-To: <20260918125711.94361-1-founder@crepuse.com>
X-Cookie: Dental health is next to mental health.
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


--qvbS5Oge9x2b8SxP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 12:57:18PM +0000, Mizuno Miotsuki wrote:
> Hi,
>=20
> The current RK3308 internal codec driver detects codec revision B
> (chip ID 0x3308) but explicitly rejects it. The initial 2022 driver
> supported revision B with a monolithic power sequence; the later DAPM

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--qvbS5Oge9x2b8SxP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqtNW0ACgkQJNaLcl1U
h9CTNwf9GJmFyuc4fcVhx8SuWBebDybhaOwU0LFcm5L8TKMj2CNRjpPGf1e2+AOE
QF2Nm2Wv/SRiraKuRy1qAcp8dJZ1L9iq2oyXtmi6OrOgo3E3DFOhrSB4S3RH+vPb
j103vXQXYPbRyL6WU4Or0+mYZI3Gk5XjMjrhTMF4YM0B231P8sQ6HCNbU+N/pHjl
yzhUq00NSYmxJNCfuHicITvfTTzM3wK7K81HiiPLd/0O6nQEV4K800KAl6GaKuGE
WVk94TD69U5VHjztI8bF1Eufv6+JRFBvcYTRJZs4GuffVMpjJcHbQXzBOHxyHszS
sOZe0f0UAJDhNbkXtss9PJwYbJv1Ug==
=6+fK
-----END PGP SIGNATURE-----

--qvbS5Oge9x2b8SxP--

