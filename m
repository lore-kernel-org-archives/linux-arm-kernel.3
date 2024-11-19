Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D2CD44166
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 15:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ro4AT1dy3+fn9DWFhz4fu0FRRDOujrJK2DSxFWLtzgE=; b=tkCDaddUspjY0kMnxF6LyUQ6gK
	I1ybBiOCp4N6YmUVDWJ5wrh0IySGlzXwYjo4D+xrlULaNapx6R72FUGJ40vPkSEf0qi/LpvUPy05+
	hPoNavExYwvASb6Nqyg95fcQAaCKwq3hkRqiZRH4+EylUiQzn4nfphkGS/OXskjqAsvEUxXb/L6Ps
	PRSsFmXhct9CYmBStLx1m1Mx8xK1bDqcCxH2hL4KuQLcVCoJudTL3mbSlXR5WRQe19dbAuBtt9o1d
	DH6Z03BIseq/2fXAWm9cBtWhUjMtngtOwlZiIq1d4HFAlFhSxbBbA3g7RQ1oDkdoS2Gufo/YP/xpN
	EspdBvbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDPkB-0000000ClfW-1Q76;
	Tue, 19 Nov 2024 15:02:19 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDPir-0000000ClJc-3rLp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 15:00:59 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id D5B9F1F0004F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 15:00:53 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 7D996A47028; Tue, 19 Nov 2024 15:00:52 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 5D5C7A46FDB;
	Tue, 19 Nov 2024 15:00:51 +0000 (UTC)
Date: Tue, 19 Nov 2024 16:00:48 +0100
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
Message-ID: <ZzyoIABRArkGoZBn@collins>
References: <20241119140805.3345412-1-paulk@sys-base.io>
 <20241119-prudent-jasmine-lizard-195cef@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nRr05HQbsjo+d+pA"
Content-Disposition: inline
In-Reply-To: <20241119-prudent-jasmine-lizard-195cef@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_070058_286981_826CC509 
X-CRM114-Status: GOOD (  37.30  )
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


--nRr05HQbsjo+d+pA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

Le Tue 19 Nov 24, 15:43, Maxime Ripard a =C3=A9crit :
> On Tue, Nov 19, 2024 at 03:08:05PM +0100, Paul Kocialkowski wrote:
> > From: Paul Kocialkowski <contact@paulk.fr>
> >=20
> > The sunxi external interrupts (available from GPIO pins) come with a
> > built-in debouncing mechanism that cannot be disabled. It can be
> > configured to use either the low-frequency oscillator (32 KHz) or the
> > high-frequency oscillator (24 MHz), with a pre-scaler.
> >=20
> > The pinctrl code supports an input-debounce device-tree property to set
> > a specific debouncing period and choose which clock source is most
> > relevant. However the property is specified in microseconds, which is
> > longer than the minimal period achievable from the high-frequency
> > oscillator without a pre-scaler.
>=20
> That can be fixed by introducing a new property with a ns resolution.

Sure but my point here is rather about what should be default behavior.

The issue I had will remain unsolved by default even with a new property,
since people will still need to patch their device-tree to apply it.

> > When the property is missing, the reset configuration is kept, which
> > selects the low-frequency oscillator without pre-scaling. This severely
> > limits the possible interrupt periods that can be detected.
> >=20
> > Instead of keeping this default, use the minimal debouncing period from
> > the high-frequency oscillator without a pre-scaler to allow the largest
> > possible range of interrupt periods.
> >=20
> > This issue was encountered with a peripheral that generates active-low
> > interrupts for 1 us. No interrupt was detected with the default setup,
> > while it is now correctly detected with this change.
>=20
> I don't think it's wise. If the debouncing is kept as is, the worst case
> scenario is the one you had: a device doesn't work, you change it,
> everything works.

I think this worst-case scenario is very bad and not what people will
expect. In addition it is difficult to debug the issue without specific
knowledge about the SoC.

My use-case here was hooking up a sparkfun sensor board by the way,
not some very advanced corner-case.

> If we set it up as fast as it can however, then our risk becomes
> thousands of spurious interrupts, which is much more detrimental to the
> system.

Keep in mind that this only concerns external GPIO-based interrupts,
which have to be explicitely hooked to a device. If a device or circuit
does generate such spurious interrupts, I think it makes sense that it
would be reflected by default.

Also the notion of spurious interrupt is pretty vague. Having lots of
interrupts happening may be the desired behavior in many cases.

In any case I don't think it makes sense for the platform code to impose
what a reasonable period for interrupts is (especially with such a large
period as default). Some drivers also have mechanisms to detect spurious
interrupts based on their specific use case.

> And that's without accounting the fact that devices might have relied on
> that default for years

They definitely shouldn't have. This feels much closer to a bug, and relying
on a bug not being fixed is not a reasonable expectation.

Cheers,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Specialist in multimedia, graphics and embedded hardware support with Linux.

--nRr05HQbsjo+d+pA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmc8qCAACgkQhP3B6o/u
lQyNqA//fhpdAVQqvylMo3Gk1qRhGxC1NmnJ/zDVaQLE/LckTaAdUDZ/pjbZrZW2
QKEsyYqTPGMtFLPcVOSEcgQqSFN66NF8VlgD87+nve80O9cLhK+aaTqs82+Llnvu
4TITELiMmX42AIBSyG4mRJwl65hC00gKLO8FjL27yFUpeOTcH9xwBlBugQCYuFkO
Z9kx+j8VOvEyHpPbAHKm8nxxFXO+Xvx08kTgId2+geSFA+xFRq7P+m3Ae+ua3MoU
2CmrZpoE0A0rGZgWhP0N/l20EiiBn2OSZYPpDZhtItHhkRbN5vZDsp6VXjtTUAVO
QRoG1yj+Kpto2TDc1qq6ZhoDug4nQNhjo9JTHUoGsLckxmfAoqbWNYxEYEAEPcd8
6K5HliuDSPlWdRh189E8QwP/GYXBB0MBm0fJIXS52K1KH5m2nCMSu2i1BFBld6U0
yM2kPU2CTrty+GFdA/QTwbA4IdOxLJMpO7qT0SNlsBDEno8Ce1vOxUbtduMLtz8/
wnKVgdOF2VCnhh8BALSWB8tNcLgsktgmzLHqc4Q86QKaSQkxd2oMX0HlQyDBTnox
cdvAPrO4Mj62BNvlxrmFFzwl9wtnuy33qhylxrDo/ZVnfQBUCQGjp+L0+oXYRM5C
rM7L73RZeCVAS10PxqpsBx6pSlwng2TGJ8m/OEmMWdTYFeKF0fc=
=s7ew
-----END PGP SIGNATURE-----

--nRr05HQbsjo+d+pA--

