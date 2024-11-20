Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81717D6E2CE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 08:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YcmvsqJy4lqAiAYIlhOSKHvpYFak6R4CiBmUT+zJfh4=; b=CYOzxiG1O61CMp81ioMOVGV6yZ
	osBZRRzppeDONK99ZKjIDZ/T/SIWmkwZBWODt3+wF9Y4ZXH4dT3k+7J+jd2D6nppyT+vN/bohmmgb
	ZUPPj6epp9z0QVr4h7MLxSg1Pz6xYeU/F/H3yLGhUNUDOIrIPNasntF5275M+9m1vUO9Mdb8FUB9+
	6S49pbg9W92lzimogcesG2yZTp3FsTbHxQsmJss4M47l6XSlZcBH4PBrqFICf5LeH850rUpSHMuuG
	HKHbxhp3acaM4/lJEv6rej9LXJh35DehUvjl1lQoKm9/Djxls8qH9sLm7hO/MBXld48TTEVtpDS2n
	4WKgkgWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDffr-0000000Eh3G-2hXM;
	Wed, 20 Nov 2024 08:02:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDfev-0000000Egz0-2k7j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 08:01:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8FCC25C5AF0;
	Wed, 20 Nov 2024 08:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BABDCC4CECD;
	Wed, 20 Nov 2024 08:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732089716;
	bh=YcmvsqJy4lqAiAYIlhOSKHvpYFak6R4CiBmUT+zJfh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nUlDZMBcMQ365PhtQG0i0AUFWBmkOsJIKw8Uqs0oK7PH3p0eBy/81StVUr5WJaDbs
	 Y7ur7u6VtUqnv9iUqObzZXoiW49lFKQodsWxdtiKF8UTe+szrxb1M88oh5kC41EIAn
	 UqmcbOOkug1xsSj7Cnw5njX7nHmMMHWxZTicgia6nVDbN0J7JDRNTmN9QPIR/G5p9C
	 BzZofxvUimfRxYxU1PFhvJ3WziavFwRlrNJNC+fjkGwo+FhPzNGP6LmZ+9nfyoXQOG
	 MPEPGjp4BvvvApFtQ7ZCiOzBEwG3XiHBqmyGL1znGFgh55+4V479S0OG7bbemTytRf
	 EcgJyiuJ6fH6A==
Date: Wed, 20 Nov 2024 09:01:53 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Paul Kocialkowski <contact@paulk.fr>
Subject: Re: [PATCH] pinctrl: sunxi: Use minimal debouncing period as default
Message-ID: <20241120-wild-stimulating-prawn-ffefb7@houat>
References: <20241119140805.3345412-1-paulk@sys-base.io>
 <20241119-prudent-jasmine-lizard-195cef@houat>
 <ZzyoIABRArkGoZBn@collins>
 <20241119-vivacious-optimistic-squirrel-a2f3c5@houat>
 <ZzzdT0wr0u1ApVgV@collins>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="khkrvqq44ignfwqp"
Content-Disposition: inline
In-Reply-To: <ZzzdT0wr0u1ApVgV@collins>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_000157_736621_18F25F3C 
X-CRM114-Status: GOOD (  19.88  )
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


--khkrvqq44ignfwqp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pinctrl: sunxi: Use minimal debouncing period as default
MIME-Version: 1.0

On Tue, Nov 19, 2024 at 07:47:43PM +0100, Paul Kocialkowski wrote:
> > > In any case I don't think it makes sense for the platform code to imp=
ose
> > > what a reasonable period for interrupts is (especially with such a la=
rge
> > > period as default).
> >=20
> > So you don't think it makes sense for the platform code to impose a
> > reasonable period, so you want to impose a (more, obviously) reasonable
> > period?
>=20
> Yes absolutely. Anything that brings us closer to "you get what is really
> happening with the hardware". The sunxi controller doesn't allow disabling
> debouncing entirely, so the next best thing is to have it with the smalle=
st
> period.

That's an opinion, not a fact.

> > If anything, the status quo doesn't impose anything, it just rolls with
> > the hardware default. Yours would impose one though.
>=20
> The result is that it puts a strong limitation and breaks many use cases =
by
> default. I don't think we have to accept whatever register default was ch=
osen
> by hardware engineers as the most sensible default choice and pretend tha=
t this
> is not a policy decision.

You're making it much worse than it is. It doesn't "break many use
cases" it broke one, by default, with a supported way to unbreak it, in
12 years.

Maxime

--khkrvqq44ignfwqp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZz2XcAAKCRAnX84Zoj2+
dmOZAYCCwKdo2KomekdZdkk+Kd79+7gZmQ8SrPSQzSWbl2+IJ85851VQZ0/OISxV
k9BcONYBfif3yXkFohd7QveN2ljpb7hJ4Zqr7VjiC6i0H3Q4mGH+uU2q6nA0YHAg
QUpfeaJlSQ==
=G1Sx
-----END PGP SIGNATURE-----

--khkrvqq44ignfwqp--

