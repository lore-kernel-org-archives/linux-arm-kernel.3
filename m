Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AC3D44171
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 10:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dd428CXBDTjHrrnAJZKziNKjueoKbD3ItkypPONoNGk=; b=w4/O33LsL77Gd1vtZWCptujAS/
	yxx4iQ4V4cCaumn3ijoSFHnA5pU1uXnMCgC2sZOWT/z2d7UGYGx3CIXFiaXJNoIXrilqEnAI8T18E
	Wmr5VFYsiwaR4QvGk6iT1eU7LLYFS6A1ZWRFMfYSmvYq21EIA4jj/frK8OHgwVSAEFHJPn6lubUmg
	KeJCkEsO3nIuxGO4DJ39e3lwUEmUbr9rjkORjq4c9E2HbPduORlxCFl61lTxOjQ2ffne7GZhyFsPs
	LPX2kjGmVM00D0OpRln1mqgPuun14vdhozOIXHsriXZju0dBqKS/BEEilagCwheFF87YFLzogKOVQ
	VBKJ6M1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDhbs-0000000F0wG-2mNU;
	Wed, 20 Nov 2024 10:06:56 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDhaw-0000000F0rd-1C38
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 10:06:00 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 0493F1F0004F
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 10:05:51 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 72FC7A472AF; Wed, 20 Nov 2024 10:05:50 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 18C00A472AD;
	Wed, 20 Nov 2024 10:05:49 +0000 (UTC)
Date: Wed, 20 Nov 2024 11:05:42 +0100
From: Paul Kocialkowski <paulk@sys-base.io>
To: Maxime Ripard <mripard@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Paul Kocialkowski <contact@paulk.fr>
Subject: Re: [PATCH] pinctrl: sunxi: Use minimal debouncing period as default
Message-ID: <Zz20dquzl5_2_3TQ@collins>
References: <20241119140805.3345412-1-paulk@sys-base.io>
 <20241119-prudent-jasmine-lizard-195cef@houat>
 <ZzyoIABRArkGoZBn@collins>
 <20241119-vivacious-optimistic-squirrel-a2f3c5@houat>
 <ZzzdT0wr0u1ApVgV@collins>
 <20241120-wild-stimulating-prawn-ffefb7@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6ghTuBK8ae4AVwyp"
Content-Disposition: inline
In-Reply-To: <20241120-wild-stimulating-prawn-ffefb7@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_020558_649133_5E40160F 
X-CRM114-Status: GOOD (  30.29  )
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


--6ghTuBK8ae4AVwyp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le Wed 20 Nov 24, 09:01, Maxime Ripard a =C3=A9crit :
> On Tue, Nov 19, 2024 at 07:47:43PM +0100, Paul Kocialkowski wrote:
> > > > In any case I don't think it makes sense for the platform code to i=
mpose
> > > > what a reasonable period for interrupts is (especially with such a =
large
> > > > period as default).
> > >=20
> > > So you don't think it makes sense for the platform code to impose a
> > > reasonable period, so you want to impose a (more, obviously) reasonab=
le
> > > period?
> >=20
> > Yes absolutely. Anything that brings us closer to "you get what is real=
ly
> > happening with the hardware". The sunxi controller doesn't allow disabl=
ing
> > debouncing entirely, so the next best thing is to have it with the smal=
lest
> > period.
>=20
> That's an opinion, not a fact.

Yes and I'm trying to explain why I believe this is the most sensible opini=
on
here. I'm not saying everyone *has to* agree with me.

> > > If anything, the status quo doesn't impose anything, it just rolls wi=
th
> > > the hardware default. Yours would impose one though.
> >=20
> > The result is that it puts a strong limitation and breaks many use case=
s by
> > default. I don't think we have to accept whatever register default was =
chosen
> > by hardware engineers as the most sensible default choice and pretend t=
hat this
> > is not a policy decision.
>=20
> You're making it much worse than it is. It doesn't "break many use
> cases" it broke one, by default, with a supported way to unbreak it, in
> 12 years.

I think this is exaggerated. Like I mentioned previously there are *many*
situations that are not covered by the default. The fact that I'm the first
person to bring it up in 12 years doesn't change that.

Sofar the downside you brought up boils down to: badly-designed hardware may
have relied on this mechanism to avoid interrupt storms that could prevent
the system from booting.

If that happens people can always increase the debouncing time with the
property as they need.

My point here is that the property should be used to accommodate for
broken hardware and that the default should work for most use cases,
including things as simple as an off-the-shelf sensor board.

That's all.

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Specialist in multimedia, graphics and embedded hardware support with Linux.

--6ghTuBK8ae4AVwyp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmc9tHYACgkQhP3B6o/u
lQwTwQ//b5/fEXs5MceVNZECSEGGRsRCPeXKBJxJTKSzzU0G/5fYb7pOYwBALMUU
hNwu6/naY9STcTWXw7JcnwiLucbB+cUfdMM2E+9wIZjGX1SqDVi2AETX+tfDXSqz
/zenXv9tc0lNJdaF+eTp+zW4tNANIQIqtcUe8jn5EojzjBJNNBBulY5PeCqQxSpM
c+UZZDC2NGfy3wKkXw2uIbxBref4/qINz/QCkREUX9pX9nVJAPVl2an0lDgeHGu0
8VvQCMyVyaqjWcqhD8FvNoVCmP2r48Mg9suyyLiNyl94icWXCsLnqDgT380VeMuW
or/3YRfFNmyxc0UmKybEjiVyDv4EZNPnbgoTLzuNHeYs3k+jAQVxjH8SzEuKf/+Z
WO1ujWuv9nF/w7Q+sUiChNu+fqsVF7V+Zk0SyHsznUczy6OdND4dsIA8k+lv6Nhj
sOHl83QakOsLyFbQaSYfagfqVchkhChrLmYwpR++Je3zGBKJvP+1piLSq8LiBDQT
f6t6KScCJAqw7JN8dFbKuo51EUX5iW5niBe7Dwx5+CjumXQUFZHjRxqEiVUzGJ1e
d/iOHVO0eFV/HWrWOORE2GnhOcx2UPyudpfPQJoMoa+b2o0v4znCv3icaDwN0NaD
Kkr365Oez56+9DGeZiy5jTGd5PUEZCJrGaJdPjPMZ4JJL4/y/dg=
=PmWt
-----END PGP SIGNATURE-----

--6ghTuBK8ae4AVwyp--

