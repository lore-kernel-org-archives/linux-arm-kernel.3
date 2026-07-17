Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7478CC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 13:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcKvn5xWvX7Tr6o2MEzx2nnPtuk3QJuyXuR/1daQF0o=; b=WcExDexyhcgMCFpOm2s6Z3gq+2
	3XSZb7eBUiMPVjM9eJ5DoqlI+vVa6NTRZ8Fb4T1LY9HWnZNAZrlmLADq1piSLG4+yffr+ZstARokE
	FIKKds+YrKAq5njFcHY5Y4olmwtbyPvvUVJ+wQ0rDRNc7gnEjN7gc1vVSXBpvzWUUk12GUsFtYbm6
	9uEHlU9Ew7O+V1vrYNvn8MhXPudukkDiFECYyD9MH+PvF9HJ7kJF/ogmmEOuDhO8evcoTnqH34+Ag
	X04eJP8iVxyYz71ouaeehb4+7pca9MDXRrdQhLcDQpcKCKbtszV5qh/OGO8TmZdPA0VxJMphB5lCD
	oepc6KcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkiwj-00000002R6i-3mqt;
	Fri, 17 Jul 2026 13:49:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkiwi-00000002R6S-0r5W;
	Fri, 17 Jul 2026 13:49:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 082A660A5E;
	Fri, 17 Jul 2026 13:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 30B701F000E9;
	Fri, 17 Jul 2026 13:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784296182;
	bh=DcKvn5xWvX7Tr6o2MEzx2nnPtuk3QJuyXuR/1daQF0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bS+u6ktSdRzWUanGEc0V5cWmp6CbSnnJYUP7RynZcNWeWsDwEdf3CXtkhPE0D/Ohw
	 w8+Jtl2vezLlDPYM+dWjAvVh2t29XjkWaxu49NoZe1e+GWEcIQy25ItHK2p7Cu2kAE
	 LJIfgHW8IVixF1j33i0yvRkRPqQODccgtnTUTyb9ej0ZuUUOuwM7vih/Bfj/wDfvMu
	 Vu9eJ/4hCInKHzxKuAx50vq0eC0Cp/KWhpe1UOz/Gxvq8jfvY/suYkEGyyvacmCirm
	 mCJBR1L6DzPm1iswUgYINM05WE+5OG81pWgDR9niqWipTeiTq1wneATBBdWBP1wjuQ
	 wmPoS4nIQExAQ==
Date: Fri, 17 Jul 2026 15:49:40 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Naushir Patuck <naush@raspberrypi.com>, Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com, 
	Sean Young <sean@mess.org>, Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH v6 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <alowzfIvKGFkZI1q@monoceros>
References: <cover.1783097764.git.andrea.porta@suse.com>
 <5171610d8bebdd10eea44bff5236502d765b5918.1783097764.git.andrea.porta@suse.com>
 <alibzwe9Mjf3GxJo@monoceros>
 <aln1D3E5QZULZ2U1@apocalypse>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jjjqwa23viq7hrdc"
Content-Disposition: inline
In-Reply-To: <aln1D3E5QZULZ2U1@apocalypse>
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


--jjjqwa23viq7hrdc
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 2/3] pwm: rp1: Add RP1 PWM controller driver
MIME-Version: 1.0

Hello Andrea,

On Fri, Jul 17, 2026 at 11:25:35AM +0200, Andrea della Porta wrote:
> On 11:18 Thu 16 Jul     , Uwe Kleine-K=F6nig wrote:
> > On Fri, Jul 03, 2026 at 07:05:25PM +0200, Andrea della Porta wrote:
> > > +static int rp1_pwm_round_waveform_tohw(struct pwm_chip *chip,
> > > +				       struct pwm_device *pwm,
> > > +				       const struct pwm_waveform *wf,
> > > +				       void *_wfhw)
> > > +{
> > > +	struct rp1_pwm *rp1 =3D pwmchip_get_drvdata(chip);
> > > +	u64 period_ticks, duty_ticks, offset_ticks;
> > > +	struct rp1_pwm_waveform *wfhw =3D _wfhw;
> > > +	u64 clk_rate =3D rp1->clk_rate;
> > > +	int ret =3D 0;
> > > +
> > > +	if (!wf->period_length_ns) {
> > > +		wfhw->enabled =3D false;
> > > +		wfhw->inverted_polarity =3D (pwm_get_polarity(pwm) =3D=3D PWM_POLA=
RITY_INVERSED);
> >=20
> > pwm_get_polarity(pwm) looks wrong here for several reasons. 1st the
> > polarity is defined in *wf and should not depend on the current state,
> > 2nd for a disabled hardware the polarity doesn't matter anyhow, and 3rd
> > you should not call pwm API functions from the lowlevel driver (which
> > might interfere with subsystem locking).
>=20
> Ok, but in this case what the output of the disabled channel should be?
> If it was inverted before the disable, would it make sense to let the out=
put
> be high? Or are we allowed to hard code a polarity value on disable?

Given that not all hardwares can drive the output of a disabled PWM to a
fixed level, a consumer that relies on a fixed inactive level output
must not disable the PWM. So it doesn't matter what you do on
wf->period_length_ns =3D=3D 0, the only objective is to save power.

> > > +	if (!wfhw->inverted_polarity) {
> > > +		wf->duty_length_ns =3D DIV_ROUND_UP_ULL((u64)wfhw->duty_ticks * NS=
EC_PER_SEC,
> > > +						      (u32)clk_rate);
> > > +	} else {
> > > +		if (wfhw->duty_ticks > (u64)wfhw->period_ticks + 1) {
> > > +			/* 100% duty cycle case */
> > > +			ticks =3D 0;
> > > +		} else {
> > > +			ticks =3D (u64)wfhw->period_ticks + 1 - wfhw->duty_ticks;
> > > +		}
> > > +		wf->duty_length_ns =3D DIV_ROUND_UP_ULL(ticks * NSEC_PER_SEC, clk_=
rate);
> > > +		wf->duty_offset_ns =3D wf->period_length_ns - wf->duty_length_ns;
> >=20
> > The duty_offset_ns calculation is wrong.
> >=20
> > Consider clk_rate =3D 3000000, period_ticks =3D 8, inverted_polarity =
=3D true and
> > duty_ticks =3D 4.
> >=20
> > Then you have:
> >=20
> > 	.period_length_ns =3D 2666.6666666666666 ns ~> 2667
> > 	.duty_length_ns =3D 1333.3333333333333 ns -> 1334
> > 	.duty_offset_ns =3D 1333.3333333333333 ns -> 1334
> >=20
> > but .period_length_ns - .duty_length_ns is 1333.
> >=20
> > To get this right, you have to calculate
> >=20
> > 	wf->duty_offset_ns =3D DIV_ROUND_UP_ULL((u64)(wfhw->period_ticks + 1 -=
 ticks) * NSEC_PER_SEC, clk_rate);
>=20
> So it will end up as 'duty_length_ns + duty_offset_ns >
> period_length_ns', which is timing violation. Is it allowed (or even
> required) in the PWM subsystem?

Not all hardwares support that, but logically it makes sense. The active
phase of the output just crosses the period border. With duty_length_ns
+ duty_offset_ns < period_length_ns (and duty_offset > 0) it's the
inactive phase that crosses the period border, and there is no reason
why the active phase should be more special than the inactive one.

Best regards
Uwe

--jjjqwa23viq7hrdc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpaMvEACgkQj4D7WH0S
/k5Qrwf9EZx/Oe2WWXWSFUVsH8QkJDmP3mG5iNkR/MQ0szDAAbCoKKKjO82HN/L2
5fGLEoeIblzXzA+UjdFGz8Agg08zLTrbEc2/SclkG0O6nUVpJ1OtMjRSqKcAk7bn
Zi1CwmtHROqTTPcULCzHFO+8O0a0YwxQUpKysR1R0fTI0/WC0Yj/R72K2wH5qQAI
AwzU4MUjk6DCl5jljRaRlfGn78mB9NXmkyFDD26ZLraglEhTi8ZZUv3ZkM9OXI3j
i6N+xJ6hQCpp2LyVZPmylZ+rQ8VljWF2UJeZLBUEzHwXbTzfqnpz0aiujMDJGWX0
VDBHJxe2pBQ4yt6dlW3sND+xCf3GdQ==
=oeK6
-----END PGP SIGNATURE-----

--jjjqwa23viq7hrdc--

