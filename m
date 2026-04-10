Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67183F36B91
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 06:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4qkISuDwysf8gnanOIKk+NktJf+ZEKazmKqf7iPQOs0=; b=Pa6ljgCkIopOIfEfP5VJxjzf1f
	EZWKp97MVcfM9ils3q1C+ACEcfqoA63G+Xwq0hLlxmbZAzI7vu59e1eiNPlbSK+0m9mw93HQTswaM
	qd0XALz9/x1L5cEFkPtBX4yqBYlrPS5aloOLaLx2g6HYZLFIY8qoZ7DlrbWWc1YlCvvwigK7MEmHt
	KMpCo5Xf2b/Q7l9oIkcG8hHP8ps+09z28vRLoKfhVH6VszayKpi9uFbJFOg8fbbD1+tZVrcX9q3vl
	NhvUeH1MSYiQM0XKpmNGbtQsIefn2ySzC2mgMQhxnBe722jTcCuYUEYj0muk34DT7aK+xlk6uzi1/
	O64PkkRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB5LO-0000000BgUP-3XZ4;
	Fri, 10 Apr 2026 06:27:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB5LN-0000000BgTh-3mcd;
	Fri, 10 Apr 2026 06:27:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D3BC660125;
	Fri, 10 Apr 2026 06:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E00C19421;
	Fri, 10 Apr 2026 06:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775802472;
	bh=ajthKdkAGwRhclYQfXtnXrA/phsT3uVTk3g+JGYsSm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XhzjfMDTjlPhnTwAKDqk9FKNM1gM6b5BBfQ7DCXXiCtElWfbwPWTeYgG50Kgkac9i
	 TBDa7zpHv7cp7DbNDee2V3htlF8K8ihWxvTGCvFrAywF/6pCpEOALM21tzIAYsPxmK
	 cR3rkbIkCojZw0UpM8O4+S8BGlhX9Dxl5CZu9S1fOC+cHsMEmp/Wkr42xaSTA4nJAp
	 Yob2/HbJdnlSPyoDE46iVJ1GJkQtxOwxbIB5YxXPUodUEsMutaCCO8iG2WE9vnaZ9v
	 z2pJJbnPpkdpbkJIH15E8VsNfRTsN5qm2oXr2PrJ3M0qdy6sWvGIDZ1KeRzcNy2YUp
	 rhI1X8J3mRrug==
Date: Fri, 10 Apr 2026 08:27:49 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Naushir Patuck <naush@raspberrypi.com>, Stanimir Varbanov <svarbanov@suse.de>
Subject: Re: [PATCH 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <adiW1tBC8Imd14LD@monoceros>
References: <cover.1775223441.git.andrea.porta@suse.com>
 <28e29fbfc20c0b8a115d006233c2759d8f49e639.1775223441.git.andrea.porta@suse.com>
 <adLTwOTbkJ0VQXy6@monoceros>
 <adfQ6Tvst3Vd1Mxe@apocalypse>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d3hvim2dtzodhjoa"
Content-Disposition: inline
In-Reply-To: <adfQ6Tvst3Vd1Mxe@apocalypse>
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


--d3hvim2dtzodhjoa
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/3] pwm: rp1: Add RP1 PWM controller driver
MIME-Version: 1.0

Hello Andrea,

On Thu, Apr 09, 2026 at 06:16:41PM +0200, Andrea della Porta wrote:
> On 23:45 Sun 05 Apr     , Uwe Kleine-K=F6nig wrote:
> > On Fri, Apr 03, 2026 at 04:31:55PM +0200, Andrea della Porta wrote:
> > > +static void rp1_pwm_free(struct pwm_chip *chip, struct pwm_device *p=
wm)
> > > +{
> > > +	struct rp1_pwm *rp1 =3D pwmchip_get_drvdata(chip);
> > > +	u32 value;
> > > +
> > > +	value =3D readl(rp1->base + PWM_CHANNEL_CTRL(pwm->hwpwm));
> > > +	value &=3D ~PWM_MODE_MASK;
> > > +	writel(value, rp1->base + PWM_CHANNEL_CTRL(pwm->hwpwm));
> > > +
> > > +	rp1_pwm_apply_config(chip, pwm);
> >=20
> > What is the purpose of this call?
>=20
> To update the configuration on the next PWM strobe in order to avoid
> glitches. I'll add a short comment in the code.

=2Epwm_free() should not touch the hardware configuration. Changing the
pinmuxing (which I guess is the purpose of clearing PWM_MODE_MASK) is
somewhat a grey area. If that saves energy, that's okish. Otherwise
not interfering with the operation of the PWM (e.g. to keep a display on
during kexec or so) is preferred.

> > > +static int rp1_pwm_resume(struct device *dev)
> > > +{
> > > +	struct rp1_pwm *rp1 =3D dev_get_drvdata(dev);
> > > +
> > > +	return clk_prepare_enable(rp1->clk);
> >=20
> > Hmm, if this fails and then the driver is unbound, the clk operations
> > are not balanced.
>=20
> I'll add some flags to check if the clock is really enabled or not.

To be honest, I guess that is a problem of several drivers, not only in
drivers/pwm. If this complicates the driver, I guess addressing this
isn't very critical.

Best regards
Uwe

--d3hvim2dtzodhjoa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnYmGIACgkQj4D7WH0S
/k7LHgf8CBP5w2EOPv0j9R+cYIsf2xK9RKcf/rdt2YwbGnx/t1arB/oP/RgMtYA8
KL7Q/OVJllRUOoSg1qp4wRb9+uSfLKNei8dFj1J/k8dp4mHmUjp5kFyqsVDE1Irm
dPpj2wRi1bB+8gx19hVBb4X8N1Z27LB+VJ/kpecLh9nmfuaGZBKWEiTJPLFmhk3R
hRb+G1F/G1k2ZGtiJ8eXB54+DP3XCcILivcgZjpOgbKGwpxFqPC85/Kh6mitcz30
KUl+UhgKPXBkhWdd5O1PWjnrb9RKNnZHgK5JHxulXWoLBffXw7JMx7p+NJMtQS5i
PqUOfwXBUQPWAQm4y7fb3wEbQ4k5Iw==
=fOaG
-----END PGP SIGNATURE-----

--d3hvim2dtzodhjoa--

