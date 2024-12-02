Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6549D7831A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 13:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oq8cdROWwi46qvRnOg4xje8ETX94g0KCIdfHBgScQPk=; b=Vhz/vw3F/ze3ikT227Z5/xrRiM
	uKxe7LlbHBquoOkyHBKN1GhNuN0LNZREsaB00RGAm/oJgZsJHGol0XSyjuZQwYcFG5uoLJESD2CIp
	ZAP/85UFsgpczu1DU9B+JzfPATzIm8nN+eMP9z8T98ARQ3aOsATx/1CtesYSOxmjrC9vVuSVOCrl8
	5Xh0RZykaGIlfC0S+TZVxo4T6ZZ/lPR9z9qS/HK1OOmCYYguRQZLkvR1zy23IREOWzAallmsJQw5j
	cB3I3hPzltIlcFV0FQsHQ37BsstlzdQTEkteqmQRkz5O7XpShNaQ+vWodAKNuJIXhXhw6OOGzMxhD
	vWO4L69Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6Gn-00000006CMF-3tUT;
	Mon, 02 Dec 2024 13:15:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6Fp-00000006CDU-0opz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 13:14:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9E1595C57B6;
	Mon,  2 Dec 2024 13:13:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3474C4CED1;
	Mon,  2 Dec 2024 13:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733145260;
	bh=Oq8cdROWwi46qvRnOg4xje8ETX94g0KCIdfHBgScQPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=soDbz1pVpVht2Z9g1o6O8zg6zSGO5IAg6n/IWUaiT0bIGTzkkK3NCL0HGsMyXuLE+
	 oljc1vaDyR0ixerFQVrLSzFuNdSCXT84CuI1K8zAmGwOrBEKwDRleMCk5z+DrQGt9+
	 bPo4DYuMYLxWiSP8FqaBcSX3zKzIY4V+O8Mm61My7suTj3HsLKztJ4fr+LB2PmE0Zm
	 6eqkjDBFtaL0WcFQwRcFEoOzNlD9XI8i6/c75DEpSDzzpN+nD8+Zb8nw3WViLsF0mO
	 rJoZaZgi32eLEpa64ndkCtuVulvOmmxa7DV9g6d91WBTEocssnNJOzF9vepeft9uVt
	 lX+K1SNe+GxqQ==
Date: Mon, 2 Dec 2024 13:14:15 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?B?Q3Pza+FzLA==?= Bence <csokas.bence@prolan.hu>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mesih Kilinc <mesihkilinc@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v5 1/3] ASoC: sun4i-codec: Add DMA Max Burst field
Message-ID: <fe02df7f-16ae-4128-9af8-7de7f76734bc@sirena.org.uk>
References: <20241102125712.2647325-1-csokas.bence@prolan.hu>
 <20241102125712.2647325-2-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="E1U5ubuOCjUxwE98"
Content-Disposition: inline
In-Reply-To: <20241102125712.2647325-2-csokas.bence@prolan.hu>
X-Cookie: So much food
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_051421_279032_C7347537 
X-CRM114-Status: GOOD (  10.52  )
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


--E1U5ubuOCjUxwE98
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 02, 2024 at 01:57:10PM +0100, Cs=F3k=E1s, Bence wrote:
> From: Mesih Kilinc <mesihkilinc@gmail.com>
>=20
> Allwinner suniv F1C100s has similar DMA engine to sun4i but it has
> smaller max burst size compared to sun4i. Add a quirk field to
> differantitate between them.

This doesn't apply against current code, please check and resend.

--E1U5ubuOCjUxwE98
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdNsqYACgkQJNaLcl1U
h9Cragf7BHf9JlYlAH05EzWdN3AkXOHmdKfOoeDAALsWLpvI9myoKM9zORQsPvYO
R8amQktnMEplFBGcXUAchI2Qf+5Dms8biBBKcO7WcALqPZI5G+foEeeVmWqmrKll
I+UlBOazkSFpHfJzNg9dsC48lhOr4BroFXwI7xr0aMoZOOhZ+OiUOFhZv0F5E5/5
xiUIhofuAK4HoiGkOmkBU9pN9xDD9K3wHoLYnyNAxH+zuZYb28EC9zZo0jQfdIb7
ZtM9N8M/cdIut3eWlm7WTWXWvuI9G+Ce3nvRkKiRXgv/SNMlMeILt1E5kzBOEKFO
q2i7hYDBbqWCbSAnrX/bSb1+9yNLNA==
=DBp8
-----END PGP SIGNATURE-----

--E1U5ubuOCjUxwE98--

