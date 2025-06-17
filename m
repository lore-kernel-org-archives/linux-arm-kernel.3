Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F9FC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 15:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Pr6ll5voZhLjn+Xwm/o8sJ2c2ByYGiOdquP16WwGvo=; b=PTbqSUkYTpj78oYpZ01xcqFV3k
	EKf4Gm/8gHz45eq11nfd9WUIKpOQuWJBmRh15H3rpCmwYg24aCupiGY/sAJsU428GVdwh74vmaNKk
	X1vYkRg5L1sC4HN3XNsLlau3XKjIS+3FBwPUI3Q50Gcq+WuSJAkw+5YVzSKjin1m9eo5r4nFtqd2U
	2V3phYppdjb8532Pkwi6iZkXfIxEW+N0wfeYmrMSM/v6/mKmuLFNlYuBgUdfXC1pbM2jVNSlxugjk
	IQDqo6rvpB4Ku+qoI5YDcBzwLP/0KI4eUo8s+Cyu1LeSjImzlxT0hY2khG+y927IW/5R3EFHk3Ky7
	rbnGLRMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXwI-00000007hmg-2Xmf;
	Tue, 17 Jun 2025 15:09:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRX43-00000007VLr-0bIb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 14:13:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 890745C67CA;
	Tue, 17 Jun 2025 14:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C8F4C4CEE3;
	Tue, 17 Jun 2025 14:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750169605;
	bh=vKnygp1/WzyFb3kw0C5XvcSsBQYMHQDcupKgqgQkAAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aRI6NNKEtHJJGdCo+cm9nDFKQIi5q6pmsJonTJi/DYzHxthlpMn8Isnyd7nO7oSNH
	 bLFu9bQEenp+c/Wx7g5NhEeNqfytG7mKV3MWSUMJgQKGLlcnXcrjdwcPNWn8bADYHf
	 egA9S+Bq3QlLP+PkcOAolsL7MqiFzOH54RjEacrG7l9WJEmtWjyn2NSHi3bsc+JZYh
	 VwSZV+BehRZI6Q6fxPUeWNu6+BIB4P+7d/fewX3n4gRsrgWYTjILE9FvVdKM5K0rP7
	 yFEJaAxurQ3OaQMtTn+7qeBbQ+jbPB9UoZYelVxlDbep1UAfwjraykLiPExIp//RXx
	 2wySecRNsImpA==
Date: Tue, 17 Jun 2025 16:13:23 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	linux-arm-kernel@lists.infradead.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: rpi-panel-v2: Convert to new PWM waveform ops
Message-ID: <pb5gr65kbkokb7ybx3smqaa6vve4rkpg6qks2hdibwgrwmdzfu@6s5msb3k2p6y>
References: <20250617005059.614993-1-marek.vasut+renesas@mailbox.org>
 <jgafc7te2zotqwvetudo6c4o4nit6zi3yp4ecg4gka53hrypk5@7ypb5asrc2ct>
 <b464bc12-e921-4d98-9462-ec9d13ccb5ce@mailbox.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5y2dy2ra4mpn6e7a"
Content-Disposition: inline
In-Reply-To: <b464bc12-e921-4d98-9462-ec9d13ccb5ce@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_071327_264946_1AEC04F4 
X-CRM114-Status: GOOD (  23.41  )
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


--5y2dy2ra4mpn6e7a
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] regulator: rpi-panel-v2: Convert to new PWM waveform ops
MIME-Version: 1.0

Hello Marek,

On Tue, Jun 17, 2025 at 11:38:50AM +0200, Marek Vasut wrote:
> On 6/17/25 10:14 AM, Uwe Kleine-K=F6nig wrote:
>=20
> Hi,
>=20
> [...]
>=20
> > /* The actual value isn't known, so this is made up. */
> > #define RPI_PANEL_V2_FIXED_PERIOD_NS 100000
> >=20
> >=20
> > static int rpi_panel_v2_pwm_round_waveform_tohw(...)
> > {
> > 	...
> >=20
> > 	if (wf->duty_length_ns > RPI_PANEL_V2_FIXED_PERIOD_NS)
> > 		*wfhw =3D 100;
> > 	else
> > 		*wfhw =3D mul_u64_u64_div_u64(wf->duty_length_ns * 100, RPI_PANEL_V2_=
FIXED_PERIOD_NS);
> >=20
> > 	return 0;
> > }
>=20
> This fixed period specified in driver has one problem -- what if the peri=
od
> is also specified in DT by the consumer, e.g. pwm-backlight pwms property,
> and it does not match RPI_PANEL_V2_FIXED_PERIOD_NS ?

If it's off by only a little amount you will hardly notice. If it's
further off that's less optimal. I don't think this is a problem. If the
device tree is wrong, the machine doesn't work optimally. That's quite
expected.

> This is easy to solve for this tohw function, but what about the fromhw
> which assigns period_ns ?

If you only write waveforms to the hardware (probably using
pwm_apply_might_sleep()), the fromhw callback isn't involved (apart from
debugging). And all fromhw callbacks are supposed to assign
period_length_ns. I suspect we don't have the same understanding of the
PWM abstraction.

> > > +static int rpi_panel_v2_pwm_write_waveform(struct pwm_chip *chip,
> > > +					   struct pwm_device *pwm,
> > > +					   const void *_wfhw)
> > > +{
> > > +	struct regmap *regmap =3D pwmchip_get_drvdata(chip);
> > > +	const u8 *wfhw =3D _wfhw;
> > > -	duty =3D pwm_get_relative_duty_cycle(state, PWM_BL_MASK);
> > > -	return regmap_write(regmap, REG_PWM, duty | PWM_BL_ENABLE);
> > > +	return regmap_write(regmap, REG_PWM, *wfhw | (*wfhw ? PWM_BL_ENABLE=
 : 0));
> >=20
> > How does the PWM behave without PWM_BL_ENABLE set?
> The display stays dark.

So you cannot distinguish writing `0` (or any other value) and
`PWM_BL_ENABLE | 0` I guess?

I ask because for some hardware's it makes a difference, the output
might e.g go High-Z on disable.

Best regards
Uwe

--5y2dy2ra4mpn6e7a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhReAAACgkQj4D7WH0S
/k4ofAf8DlMzidViLV6S86hDrE1Q/7wbG82YZOcIYzhJPeJT4JPtU0ya7uA2/uMA
0bnUtEzH4i8bOd3HWXYvEcFgTLoOduz2RCsiam4/BVwJIHdtsrzpiB419awnL4SB
75dkcesGC1cgMNTRKW3j1s6c3GdKYxSTUrHVeuUaPECI77wi0GV1e6BRP6bH6LX0
wGvEv1IEicMiHtmj8TleVjGQkwnRxsKbV6pYYhVkB2yKZncQaN9xO0Qt/GafqSj1
gnPi1sTDP51tiztcN0suNKgYwB7GaBG8wnvdM/zN9JLiMRSU370vn3enfJtrYb0Q
aTfbBry4wgY9wE4y/eEC30e6Xa80zg==
=65+J
-----END PGP SIGNATURE-----

--5y2dy2ra4mpn6e7a--

