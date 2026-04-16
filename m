Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF04F8A17B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 13:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sc3m+b0lLWMgaMleDRp2o2Rjl7TabIK2d50OhnN2sRs=; b=Pd1gIQDVTW4Gabt1FoZqf6IEJD
	Q8mYhsufLhnAtdaZaPSx4+1RjWNj8h+3YgDfmUS8pErAxc5kDY2JvDMua5xrI8McGuTt6Y3SYjWL3
	pCe8n8CXvqtSj0Z6D59ykTIVKNIRASuUhicnMuO1XRwm8+rDczCCxnYFycNAP+RYzucWuMoRhCa6h
	sCGRsSPNd8AU5Oq41o5agIEMt/XLtfm3d9Echw9YJ8SzB5jkH4c7ESLZkL9XA6bDaiUjf6mttPMla
	jB2WMRUyU448EwI4vL+Fz5DCxN2Mk7y3EXKcaoFO6aYkp6RKAgup1AB0/HpLiAzkmFugD+0p9gL+P
	ja+pOm9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDN4u-00000002Wle-2qA6;
	Thu, 16 Apr 2026 13:48:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDN4t-00000002WlH-1cFw;
	Thu, 16 Apr 2026 13:48:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C7026012B;
	Thu, 16 Apr 2026 13:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD6ACC2BCB3;
	Thu, 16 Apr 2026 13:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776347298;
	bh=uTJD2gM29MtP9GMelRFqj+IKtjoMn9+Dn//dWVAgy88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fm6vBwCgh/orJ+Veej0NxOgBPBdM3c4HilOYT/mTK3zbRqgF+VgPtMAckcXiE9En9
	 qzeqYh49dgiDhZ6p6vr5eIj7LlktJJHzed4z5ZpLPJN5hBjT+8DX7wGRgy8tpt3zKy
	 alM1wVycCERuFhcU0uGVLzBvxdhTX6LQNWxCVsSTjUFJVTgfKNVH1qJqdYeCowTF5u
	 WzAy9pQI+UeHqW9R0in129XTFMGU9A3Qu7V0GpuYT1EfgIdnKdMSg4PxAqdbcq7TW5
	 JY6QSpQGb96OYRUS4mqKYVKEiy7L38JtF6CMmA7E67dgEDKUdirh0CdAh+rsOwGzcO
	 JVm7phy6y5CuA==
Date: Thu, 16 Apr 2026 15:48:15 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Naushir Patuck <naush@raspberrypi.com>, Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com
Subject: Re: [PATCH v2 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <aeDmk-t5Lc1zpkg9@monoceros>
References: <cover.1775829499.git.andrea.porta@suse.com>
 <0d99317b9150310dfbd98de1cb2a890f0bffe7cd.1775829499.git.andrea.porta@suse.com>
 <adkrHkANCzxO8KUP@monoceros>
 <aeC6U7D6TfWm8JPx@apocalypse>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="53ygmt545ulvux3v"
Content-Disposition: inline
In-Reply-To: <aeC6U7D6TfWm8JPx@apocalypse>
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


--53ygmt545ulvux3v
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/3] pwm: rp1: Add RP1 PWM controller driver
MIME-Version: 1.0

Hello Andrea,

one thing I forgot to ask: Is there a public reference manual covering
the hardware. If yes, please add a link at the top of the driver.

On Thu, Apr 16, 2026 at 12:30:43PM +0200, Andrea della Porta wrote:
> On 19:31 Fri 10 Apr     , Uwe Kleine-K=F6nig wrote:
> > I assume there is a glitch if I update two channels and the old
> > configuration of the first channel ends while I'm in the middle of
> > configuring the second?
>=20
> The configuration registers are per-channel but the update flag is global.
> I don't have details of the hw insights, my best guess is that anything t=
hat
> you set in the registers before updating the flag will take effect, so th=
ere
> should be no glitches.

Would be great if you could test that. (Something along the lines of:
configure a very short period and wait a bit to be sure the short
configuration is active. Configure something with a long period and wait
shortly to be sure that the long period started, then change the duty,
toggle the update bit and modify a 2nd channel without toggling update
again. Then check the output of the 2nd channel after the first
channel's period ended.

> > > +	if (ticks > U32_MAX)
> > > +		ticks =3D U32_MAX;
> > > +	wfhw->period_ticks =3D ticks;
> >=20
> > What happens if wf->period_length_ns > 0 but ticks =3D=3D 0?
>=20
> I've added a check, returning 1 to signal teh round-up, and a minimum tic=
k of 1
> in this case.

Sounds good. Are you able to verify that there is no +1 missing in the
calculation, e.g. using 1 as register value really gives you a period of
1 tick and not 2?

> > > +	if (wf->duty_offset_ns + wf->duty_length_ns >=3D wf->period_length_=
ns) {
> >=20
> > The maybe surprising effect here is that in the two cases
> >=20
> > 	wf->duty_offset_ns =3D=3D wf->period_length_ns and wf->duty_length_ns =
=3D=3D 0
> >=20
> > and
> > =09
> > 	wf->duty_length_ns =3D=3D wf->period_length_ns and wf->duty_offset_ns =
=3D=3D 0
> >=20
> > you're configuring inverted polarity. I doesn't matter technically
> > because the result is the same, but for consumers still using pwm_state
> > this is irritating. That's why pwm-stm32 uses inverted polarity only if
> > also wf->duty_length_ns and wf->duty_offset_ns are non-zero.

Please align to the pwm-stm32 algorithm (as of
https://patch.msgid.link/c5e7767cee821b5f6e00f95bd14a5e13015646fb.177626410=
4.git.u.kleine-koenig@baylibre.com)
here to decide when to select inverted polarity.

> > > +	}
> > > +
> > > +	return 0;
> > > +
> > > +err_disable_clk:
> > > +	clk_disable_unprepare(rp1->clk);
> > > +
> > > +	return ret;
> > > +}
> >=20
> > On remove you miss to balance the call to clk_prepare_enable() (if no
> > failed call to clk_prepare_enable() in rp1_pwm_resume() happend).
>=20
> Since this driver now exports a syscon, it's only builtin (=3DY) so
> it cannot be unloaded.
> I've also avoided the .remove callback via .suppress_bind_attrs.

Oh no, please work cleanly here and make the driver unbindable. This
yields better code quality and also helps during development and
debugging.

Best regards
Uwe

--53ygmt545ulvux3v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmng6J0ACgkQj4D7WH0S
/k7hMggAn8rENjZtWE1kj1D/NlWx5jd1LB+UVOUTfUUHjZwhyEqvw7BXYQ42LooK
ONSs3zBv+kpBp8ZVk5oON1Qw7Cjp7WXon5ePWM4adZE96cqdp62lExHO873C/2f1
LJcEvluoxNyDLtSoDKvlhlnYfxi/Cww2aMEa+Mm2n/NWbkEQAnI8zW8WWifBr16/
xKaZDUHJKyxfAq2wrgqWwersaJTsx4OQ3slVTLraUQ9nG3bJmuhde3NcSRLzXlcg
1Be+aAYFggvG10IjVlmiqaRAVEa4jTMo42ep/xQH+Lqr1BYgVFwbYHvpFQ7kmPep
4VBRQjnRDS5So3LCp7p3VgT3IkAGGg==
=S8mZ
-----END PGP SIGNATURE-----

--53ygmt545ulvux3v--

