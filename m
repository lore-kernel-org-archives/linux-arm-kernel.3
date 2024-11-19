Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B817DD44176
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 15:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CECoxezUYafx0d26HXgDwD1dl9DFkiisNtmVFn2OYyI=; b=GKuYro7nH6bNi/cm94z8U7griH
	lmRSvmrlnYDrCVTWjRcCA+P5D9U4wUvCnKjSZqago9h5hY10GaDD1zkg3mFEmTwUIXPwYIHFjpp7h
	ANmVeoYzY7uAU1oics/f+Tk12rApzGpZe7WwQDOIVufJPdlFJWUSzmf9XxlaC6nuVNex/z4Y5+Erb
	8etsmaDscFf4N3VX9qExrpUeyjom9BxZjZMf7F366sS92QeGYmnGhvl1Ti4bO6uUhF4/NUxftxrUk
	GkA2btzcUNIe00JGmej0eYs7m+yP7ZK+AeuBp1KlCDUO+6wlgaxeUNUfVpTeBmENcOc6vddS7rC8i
	qlf490zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDQPL-0000000CuML-2RO5;
	Tue, 19 Nov 2024 15:44:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDQOO-0000000Cu9S-3Xwp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 15:43:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 58C4F5C5607;
	Tue, 19 Nov 2024 15:43:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90B58C4CECF;
	Tue, 19 Nov 2024 15:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732031032;
	bh=CECoxezUYafx0d26HXgDwD1dl9DFkiisNtmVFn2OYyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XnjbVoaawrVemEyB9fOP4Psg6A6NszoeHZLrAoptoUkIfNXmORulvI4A9US32oRjm
	 dYS9gco728411BliZWaAgswKvPhqvpook0Zapyz5pu2drbnxNI7f73bgSbccZph7cD
	 w11pN00D428g+SCnG4P0pNS8Q/hvPEkgd9RJHVhR3TW2MQafLvCndi1daU/YavsIZO
	 olXxj7OsYsr9bTaFpG0fzj7OuOmQSKwSIdLg4BPF1sYsHqBOjV9E5vq+RoWB2FrkjE
	 x4fn/aCHExEUOZojfxyRziZ/LVucAOhxmXYazUs7/2PL8wzVfFZf5yDtZgjj/0oQvO
	 f74O4+S4CHVvQ==
Date: Tue, 19 Nov 2024 16:43:49 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Paul Kocialkowski <contact@paulk.fr>
Subject: Re: [PATCH] pinctrl: sunxi: Use minimal debouncing period as default
Message-ID: <20241119-vivacious-optimistic-squirrel-a2f3c5@houat>
References: <20241119140805.3345412-1-paulk@sys-base.io>
 <20241119-prudent-jasmine-lizard-195cef@houat>
 <ZzyoIABRArkGoZBn@collins>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="l2xikqg7suvl7kdm"
Content-Disposition: inline
In-Reply-To: <ZzyoIABRArkGoZBn@collins>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_074352_969119_43467D35 
X-CRM114-Status: GOOD (  42.82  )
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


--l2xikqg7suvl7kdm
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pinctrl: sunxi: Use minimal debouncing period as default
MIME-Version: 1.0

On Tue, Nov 19, 2024 at 04:00:48PM +0100, Paul Kocialkowski wrote:
> Hi Maxime,
>=20
> Le Tue 19 Nov 24, 15:43, Maxime Ripard a =E9crit :
> > On Tue, Nov 19, 2024 at 03:08:05PM +0100, Paul Kocialkowski wrote:
> > > From: Paul Kocialkowski <contact@paulk.fr>
> > >=20
> > > The sunxi external interrupts (available from GPIO pins) come with a
> > > built-in debouncing mechanism that cannot be disabled. It can be
> > > configured to use either the low-frequency oscillator (32 KHz) or the
> > > high-frequency oscillator (24 MHz), with a pre-scaler.
> > >=20
> > > The pinctrl code supports an input-debounce device-tree property to s=
et
> > > a specific debouncing period and choose which clock source is most
> > > relevant. However the property is specified in microseconds, which is
> > > longer than the minimal period achievable from the high-frequency
> > > oscillator without a pre-scaler.
> >=20
> > That can be fixed by introducing a new property with a ns resolution.
>=20
> Sure but my point here is rather about what should be default behavior.
>=20
> The issue I had will remain unsolved by default even with a new property,
> since people will still need to patch their device-tree to apply it.
>=20
> > > When the property is missing, the reset configuration is kept, which
> > > selects the low-frequency oscillator without pre-scaling. This severe=
ly
> > > limits the possible interrupt periods that can be detected.
> > >=20
> > > Instead of keeping this default, use the minimal debouncing period fr=
om
> > > the high-frequency oscillator without a pre-scaler to allow the large=
st
> > > possible range of interrupt periods.
> > >=20
> > > This issue was encountered with a peripheral that generates active-low
> > > interrupts for 1 us. No interrupt was detected with the default setup,
> > > while it is now correctly detected with this change.
> >=20
> > I don't think it's wise. If the debouncing is kept as is, the worst case
> > scenario is the one you had: a device doesn't work, you change it,
> > everything works.
>=20
> I think this worst-case scenario is very bad and not what people will
> expect. In addition it is difficult to debug the issue without specific
> knowledge about the SoC.
>
> My use-case here was hooking up a sparkfun sensor board by the way,
> not some very advanced corner-case.

Are you really arguing that a single sparkfun sensor not working is a
worse outcome than the system not booting?

> > If we set it up as fast as it can however, then our risk becomes
> > thousands of spurious interrupts, which is much more detrimental to the
> > system.
>=20
> Keep in mind that this only concerns external GPIO-based interrupts,
> which have to be explicitely hooked to a device. If a device or circuit
> does generate such spurious interrupts, I think it makes sense that it
> would be reflected by default.

I mean... debouncing is here for a reason. Any hardware button will
generate plenty of interrupts when you press it precisely because it
bounces.

> Also the notion of spurious interrupt is pretty vague. Having lots of
> interrupts happening may be the desired behavior in many cases.

Which cases?

> In any case I don't think it makes sense for the platform code to impose
> what a reasonable period for interrupts is (especially with such a large
> period as default).

So you don't think it makes sense for the platform code to impose a
reasonable period, so you want to impose a (more, obviously) reasonable
period?

If anything, the status quo doesn't impose anything, it just rolls with
the hardware default. Yours would impose one though.

> Some drivers also have mechanisms to detect spurious interrupts based
> on their specific use case.
>=20
> > And that's without accounting the fact that devices might have relied on
> > that default for years
>=20
> They definitely shouldn't have. This feels much closer to a bug, and rely=
ing
> on a bug not being fixed is not a reasonable expectation.

No, it's not a bug, really. It might be inconvenient to you, and that's
fine, but it's definitely not a bug.

Maxime

--l2xikqg7suvl7kdm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZzyyNAAKCRAnX84Zoj2+
dmqPAYCz3OlaegQIjO8q5Z1cDBAWz7oPwfWFGo/q0gFfV22l/VsEDJ0mPduztKMZ
LA/MqcYBgNoS/NtqeAuvUfzbpwVfY3mU2cnb2T+WgMNeI6ZX1krA1GRWcKXbB75e
NaJriFIirA==
=C1nd
-----END PGP SIGNATURE-----

--l2xikqg7suvl7kdm--

