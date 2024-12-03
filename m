Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CACE69EA6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 11:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TrK7uZHP64ILuJuDvtktXX5sjSsNufOK42wokACcQmw=; b=nP/s8E55UhgH9rtCLfBn2RhwNH
	oUKftxvWfQnCn8G9gY4a8DzD2D+TadZQ9QEleG8Zyp1rD6CzWXahZmiEAoPY/JM5ds9PPIiB/SU4p
	8ZZtNUVwttsQ+fzNbnD93IrFZBMQBesG3lHJa2i/kUT5YZqPvQEfcVTa8bfzY4Cz72lTRI9zale8N
	zETYAbfJVxZfaDr1xBPVgQ+xGw0mOqb4bpv7i9r9qkq63BpSwUfNAT4oL0ZCPTgmaXkXPc3uhxUqd
	pty+TQHzVgbFfp3I1SZofF/1n7AG8WilFRDBlbVJOW8IV9NXJIxdQF6Y7zvcrj69Larmv83K3KK1Y
	5lMt6c+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQmx-00000009D7N-3UUm;
	Tue, 03 Dec 2024 11:09:55 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQcC-00000009ASj-3HSH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 10:58:50 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id D29051F0004D
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Dec 2024 10:58:42 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 224A8A67025; Tue,  3 Dec 2024 10:58:40 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 7392EA6701F;
	Tue,  3 Dec 2024 10:58:39 +0000 (UTC)
Date: Tue, 3 Dec 2024 11:58:37 +0100
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
Message-ID: <Z07kXSstqc2eJ_Y9@collins>
References: <20241119140805.3345412-1-paulk@sys-base.io>
 <20241119-prudent-jasmine-lizard-195cef@houat>
 <ZzyoIABRArkGoZBn@collins>
 <20241119-vivacious-optimistic-squirrel-a2f3c5@houat>
 <ZzzdT0wr0u1ApVgV@collins>
 <20241120-wild-stimulating-prawn-ffefb7@houat>
 <Zz20dquzl5_2_3TQ@collins>
 <20241129-amazing-whale-of-proficiency-ee6fd2@houat>
 <Z0rqILFESdje9qUn@collins>
 <20241202-magnetic-curious-bear-1cc48e@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ztuv53CEuwU4pnus"
Content-Disposition: inline
In-Reply-To: <20241202-magnetic-curious-bear-1cc48e@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_025849_133494_654297C3 
X-CRM114-Status: GOOD (  49.02  )
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


--Ztuv53CEuwU4pnus
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Le Mon 02 Dec 24, 12:03, Maxime Ripard a =C3=A9crit :
> On Sat, Nov 30, 2024 at 11:34:08AM +0100, Paul Kocialkowski wrote:
> > Well I'm an electrical engineer and the first thing we were told about
> > buttons and connectors is to include hardware debouncing. The second th=
ing
> > is that it can be done in software (which again is done in a number of =
drivers)
> > by just disabling the interrupt for a while if it happens too often.
> >=20
> > So I'm quite affirmative that taking none of these into account is cons=
titutive
> > of a broken hardware design. No electrical engineer is told that they s=
houldn't
> > care about this because the SoC will filter interrupts for them.
>=20
> The SoC provides the hardware debouncing. There's no reason not to use
> it, or to choose something redundant. Some might, but it's also
> perfectly valid to just rely on the SoC there.
>=20
> > Of course it's fine to use this mechanism when it exists, but it's not a
> > reasonable expectation to just assume it will always be there. This is =
why
> > I think it's not a legitimate reason to make it a default.
>=20
> Nobody ever designed a board without considering the SoC features but
> rather by adhering to a dogma. The SoC features, components chosen and
> their price, etc. all play a role.

Okay that's fair enough. I guess what I had in mind was that it would be
unusual and unlikely. I don't think it disqualifies the fact that it would
be sensible to enable this behavior with the property and not the other way
round though.

> > > But let me rephrase if my main objection wasn't clear enough: you want
> > > to introduce an ABI breaking change. With the possibility of breaking
> > > devices that have worked fine so far. That's not ok.
> >=20
> > I believe it is highly questionable that this constitutes ABI breakage.
> > To me there was no defined behavior in the first place, since the debou=
ncing
> > configuration is inherited either from the reset value or the boot stag=
e.
> > There is also no formal indication of what the default is, anywhere.
>=20
> Depending on the interpretation, it either means that you change the
> default, or add a default, to a device-tree property. That constitutes
> an ABI breakage on its own right. And then we can introduce regressions
> for boards, which is another breakage.

It feels very questionable that adding a default over undefined behavior
constitutes an ABI breakage.

> > Changing the default configuration of hardware is commonplace. One might
> > for example introduce a reset to a driver to get a clean state because =
it
> > happened that some boot software would mess it up and it went unnoticed=
 for
> > a while. Would you also call that ABI breakage?
>=20
> No, because it doesn't require a change in the default state Linux
> expects when it boots, or changing anything in the device tree. It's a
> self-contained change, and thus there's no interface to break.

It could definitely result in changes in behavior though. One could imagine
the case of a sensor that was configured with 4x gain by the boot software,
which wasn't reset by the driver. Now when the driver is updated to include=
 a
reset the sensor will fall back to 1x gain, with a direct result on the val=
ues
that are read with default configuration.

This would however be perfectly fine since it wasn't specified anywhere tha=
t the
sensor should report values with 4x gain in its default state. It's a behav=
ior
change that has direct effect, but doesn't break any ABI at all.

> > I think there's a number of situations where it's much more sensible to=
 change
> > a default state to avoid very visible and practical issues. And it does=
 happen.
> >=20
> > Also my understanding of the "ABI breakage" rule in the kernel is that =
no
> > userspace program should stop working when it was implemented to (corre=
ctly)
> > follow some kernel-related ABI. It doesn't mean that we cannot change a=
ny
> > default state
>=20
> If applications rely on that default one way or another, it's absolutely
> what it means. The only criteria is whether this will create a
> regression for any application.

For any application *that uses the ABI correctly*. Any example of defaults =
that
are inherited from the boot phase clearly shows that it is not a reasonable
expectation to rely on them and doing so is not correct use of the ABI.
It is rather very clearly relying on undefined behavior.

Cheers,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--Ztuv53CEuwU4pnus
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmdO5F0ACgkQhP3B6o/u
lQyUwg/+Nml2dRtQHolbNr+qDMaG5j23m3wnyJzAs7oAVbOiozJpGTW9obXHhBnI
NODHxTaaXmzBce+aNqQUwGWX1W5kl9LQ1od/mOQ81k2tSwOj+DpB7sus+NXGCUCs
xszVBDQMLM2ejXsyQauTdjFUsnfq6Q91Qo0aLoWpKJI5y7vdds2Vri6eJCm2I2bW
An0ztEcJpMAPs2Bf2ubzBriStkFhPQ31qb4A5XdNKLjkwwJAAaNZ7EfvlcYDWKS0
D/2DAtIwDkmYt5wdxObQc+qP+eyv/mxdvHsybOGX2bWkjA28LiHlO+7eP65ruLbB
/9DRLMXH1fn4AqeodQGKRHVXml3EtI1kwLiRQ70IA8Ma7oFFc6KMuqwT9iS3s8sU
RK9Z85u8jUeF+8CA6o9rmJdhkjmj5wzz0ScdUMQf0lU5Agib8O1RoWdtcBIfAUjh
qNv+kbQtst87YRiy6jGX6orQjdpL8jNHzL87zNffxPXc/zZ6UTABERdExMpQira5
QtNV41U0bdT9dMfoIFoCeREGVUSziS2aXE6UZlxQIfl0I60FEBbu3uOILzpe0fLa
ErnVXnTTzmGXCK0v6alU/KxSJ96CSd8/86cLbVfuBBeUAyDztfWmsk1dTeaa2ulv
YN9witZEvaqwqV2t7LLtDYvUMtRXq6IWUI8KJMzu6y0ElGh1+Sc=
=bvwb
-----END PGP SIGNATURE-----

--Ztuv53CEuwU4pnus--

