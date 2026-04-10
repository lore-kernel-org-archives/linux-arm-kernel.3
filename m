Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCAFEA3C5C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 10:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2af8NxYuYpfnsJc9jM5WK6oq0T2GDCiKu1F+wdwYdiI=; b=lngDRob7V7W1TPNAFMSasiiE70
	T3YdbnsJwnmOqq9Z5VWxXFcLnvpN3vDfQVi8jj6n+/na2lj9zMllJgk52900hiJ3SSGKpmrYn9I3y
	UqeUM8wXxlLxlL6JUvonCO+nS8y4lKsbqV4YuWw6HI9k5W6UIzPn4Q6baLFaKAmMaoEqrxJFnzs69
	Gx83wcsJmXA/zjR+tTKrM3ouXLy+jgohf+tWV+oMG36iEkRGip4XFNw4vBv9WbMoPkujG53euiM9n
	LConhIkCIFlQyDxGKgRl94WhfKQ+1HUTsKmQj6/PS6FtEoH8e9DeZM0It8zJ+HAbY8ypafUee9ZM7
	REHSo3Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9OS-0000000C2Gg-1X9Z;
	Fri, 10 Apr 2026 10:47:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9OQ-0000000C2GX-45OB;
	Fri, 10 Apr 2026 10:47:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F3FF96014B;
	Fri, 10 Apr 2026 10:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C2F9C19421;
	Fri, 10 Apr 2026 10:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775818037;
	bh=VxQEfGXpxpMHA8FzWWQyJjc+5K8xS5fjOzKEGbCASu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mULBR3uWs4EOlT9tU3UKzKzjlb0rgY30yj/W+Pb9GMiI2OzR44gW59dYOqxFMhxfq
	 pRLpXMjibVodQOgLplqcSYKSPKZ0F5V0WZCn+IZb7Ayl3ACQMBhKgIbpkBen000KmN
	 1oz2kPtkXSDFfrGFH9JI6cs1WkHV8UWWVDnmiKOD1s9CcTA4uWeW+RlvgB2aKHL6dX
	 7hYV2IbiYrypSk2ZeYt3YVcBoraq8HWw2n6s+E/1GYnUQ+5T1QLQMdnlJaqa6c2LY1
	 a9VrwbA70xXwPriIQvPcI/D6gXULqwLUGHlD7N0FsBBCxo/oe9WQwNUW3XafCfpSh+
	 CI+dsTbVkl3JQ==
Date: Fri, 10 Apr 2026 12:47:14 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Naushir Patuck <naush@raspberrypi.com>, Stanimir Varbanov <svarbanov@suse.de>
Subject: Re: [PATCH 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <adjU6KqtDEweVRes@monoceros>
References: <cover.1775223441.git.andrea.porta@suse.com>
 <28e29fbfc20c0b8a115d006233c2759d8f49e639.1775223441.git.andrea.porta@suse.com>
 <adLTwOTbkJ0VQXy6@monoceros>
 <adfQ6Tvst3Vd1Mxe@apocalypse>
 <adiW1tBC8Imd14LD@monoceros>
 <adjQl37-6a--_y3Y@apocalypse>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="76qgdc7mk3nwvbgo"
Content-Disposition: inline
In-Reply-To: <adjQl37-6a--_y3Y@apocalypse>
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


--76qgdc7mk3nwvbgo
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/3] pwm: rp1: Add RP1 PWM controller driver
MIME-Version: 1.0

Hello Andrea,

On Fri, Apr 10, 2026 at 12:27:35PM +0200, Andrea della Porta wrote:
> On 08:27 Fri 10 Apr     , Uwe Kleine-K=F6nig wrote:
> > On Thu, Apr 09, 2026 at 06:16:41PM +0200, Andrea della Porta wrote:
> > > On 23:45 Sun 05 Apr     , Uwe Kleine-K=F6nig wrote:
> > > > On Fri, Apr 03, 2026 at 04:31:55PM +0200, Andrea della Porta wrote:
> > > > > +static void rp1_pwm_free(struct pwm_chip *chip, struct pwm_devic=
e *pwm)
> > > > > +{
> > > > > +	struct rp1_pwm *rp1 =3D pwmchip_get_drvdata(chip);
> > > > > +	u32 value;
> > > > > +
> > > > > +	value =3D readl(rp1->base + PWM_CHANNEL_CTRL(pwm->hwpwm));
> > > > > +	value &=3D ~PWM_MODE_MASK;
> > > > > +	writel(value, rp1->base + PWM_CHANNEL_CTRL(pwm->hwpwm));
> > > > > +
> > > > > +	rp1_pwm_apply_config(chip, pwm);
> > > >=20
> > > > What is the purpose of this call?
> > >=20
> > > To update the configuration on the next PWM strobe in order to avoid
> > > glitches. I'll add a short comment in the code.
> >=20
> > .pwm_free() should not touch the hardware configuration. Changing the
> > pinmuxing (which I guess is the purpose of clearing PWM_MODE_MASK) is
> > somewhat a grey area. If that saves energy, that's okish. Otherwise
> > not interfering with the operation of the PWM (e.g. to keep a display on
> > during kexec or so) is preferred.
>=20
> Sorry I should've been more clear on this. The pinmux/conf is not changed
> at all by this mask, only the PWM output mode is. The controller can outp=
ut
> several type of waveforms and clearing PWM_MODE_MASK is just setting the
> controller to output a 0, which is the reset default i.e. the same value
> as just before exporting the channel.
> I guess this is the expected behaviour in case of a fan, it should stop
> spinning in case you unexport the pwm channel, but I see it could be
> different with displays.
> Honestly I don't have a strong opinion about that, please just let me
> know if I should drop that pwm_free entirely.

Yes, in this case drop the function completely. It's the responsibility
of the consumer to stop the PWM before releasing it.

> > > > > +static int rp1_pwm_resume(struct device *dev)
> > > > > +{
> > > > > +	struct rp1_pwm *rp1 =3D dev_get_drvdata(dev);
> > > > > +
> > > > > +	return clk_prepare_enable(rp1->clk);
> > > >=20
> > > > Hmm, if this fails and then the driver is unbound, the clk operatio=
ns
> > > > are not balanced.
> > >=20
> > > I'll add some flags to check if the clock is really enabled or not.
> >=20
> > To be honest, I guess that is a problem of several drivers, not only in
> > drivers/pwm. If this complicates the driver, I guess addressing this
> > isn't very critical.
>=20
> I'll come up with something, we can always drop this check if deemed
> too 'noisy'.=20

Great, thanks
Uwe

--76qgdc7mk3nwvbgo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnY1TAACgkQj4D7WH0S
/k5KOAf+OQyTYcP/Ul35R81Bb5k+Ezz9DcY8HnJ6dIcCdsGfLlj5xfexCMkbGtki
MWd1M0fgQCifDkkFHr/CaH6F8l0JUAtqbVdECz8RBUkknrsjrTawj91kp27Va4IC
FQKRhMbpkOVJLYoU5yKeokBUZmqF/zOrmWhWxHpCKFoQq18yv+cODDR+XbHTNGRz
8MC7YV7Fqhi1+qp1edRe5nmanvWhdi08sM5Eo9jimEphB1xlqvz8pQlPtFCoFUkp
2n/t8rSLWRxCMmK/8q6QJ7DdJLQwIt9nw/fBHtoZ0ztNmCFVgC8uK6845uq0EnV0
O1H3wAu8bpystWDLHqU9/oSMeQ9Nog==
=J4+0
-----END PGP SIGNATURE-----

--76qgdc7mk3nwvbgo--

