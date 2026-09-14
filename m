Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590B6C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 08:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7a2/ibp36NrABheYol3LAYhLxpjLT2pX3v2Uyuz4AvE=; b=V7T/XeAm6mR8To8grD8+b4sQRC
	qJB7E6dRIanfj9NvWa1BembYsMtTLVZEO9jGV5lzZkpgwJkbBnXrUS560WiHKMYbZHKcH+NFN4860
	0vuZgcMQRcKf/fTmKcfS3HklVGN7cRskZ6dXbrxvoXSfllvR/fMS5GMoKAMrwZRIEEf7A4xHuIf2N
	5pr3BO2mxsiIkcXrcJVF+HTbQOTkYiWWdWoGq7uuEZY5u7BEeD+ldiwu+8L/KKh0B8OTfQOZ668zf
	hfDoGUQlg2B/4c3V4tSXPBbInsGoj0orTfnWy87Auzme3XuGZvgHC8wQSRAWc0xU+hOj+4Df1dTv1
	LI8Z/BUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62Ie-00000002oMe-1zC3;
	Mon, 14 Sep 2026 08:44:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62Ic-00000002oMU-1gYA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 08:44:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 8C5684382C;
	Mon, 14 Sep 2026 08:44:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id E1D461F000FF;
	Mon, 14 Sep 2026 08:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789375465;
	bh=7a2/ibp36NrABheYol3LAYhLxpjLT2pX3v2Uyuz4AvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Rwj4HuiQtNd14esUdf/Qvv6aPhmoQbFJ5UaoSQmWStFL9SLmR5fdBryWldc9drqLk
	 QWiGN58TXw15pyRwxaEGxoF0rNFbGJFPP+mKkEF2ae6xNGG63XxBSNE1oaFHToO/NB
	 EMPwopGEl4KU/hS9vipQRcDFedNZt2V393FN3qitUdunL1/nStuR6a3U/+wuADZiDx
	 v76HU2pRpti6w+2kCHhenVVhmkLgcCqjQ7uUOVKwy2bAJrhWetPeva8LOoqW5x3JK/
	 1w8Kgq2Q2CsIamelzJNL4BcA5QC1s6uiGbHhhS6vSyNAVy88/0/ouOcgcUQs3mQR9o
	 ITFRaQkcWAYRg==
Date: Mon, 14 Sep 2026 10:44:22 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cwweng@nuvoton.com
Subject: Re: [PATCH v5 2/2] pwm: Add Nuvoton MA35D1 PWM controller support
Message-ID: <aqexDgkF7Nqp-fML@monoceros>
References: <20260721062308.536947-1-cwweng.linux@gmail.com>
 <20260721062308.536947-3-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gj7lpiutmh7njnbh"
Content-Disposition: inline
In-Reply-To: <20260721062308.536947-3-cwweng.linux@gmail.com>
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


--gj7lpiutmh7njnbh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v5 2/2] pwm: Add Nuvoton MA35D1 PWM controller support
MIME-Version: 1.0

Hello,

On Tue, Jul 21, 2026 at 02:23:08PM +0800, Chi-Wen Weng wrote:
> +static int nuvoton_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> +			     const struct pwm_state *state)
> +{
> +	struct nuvoton_pwm *nvtpwm = nuvoton_pwm_from_chip(chip);
> +	unsigned int ch = pwm->hwpwm;
> +	u64 duty_cycles, period_cycles;
> +	u64 divisor;
> +	u32 cmpdat, period, prescale;
> +	int ret;
> +
> +	if (!state->enabled) {
> +		nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_PWM_POEN,
> +				MA35D1_PWM_POEN_EN(ch), 0);

Does this mean the output pin goes High-Z on disable?

> +		nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_PWM_CNTEN,
> +				MA35D1_PWM_CNTEN_EN(ch), 0);
> +
> +		return 0;
> +	}
> +
> +	prescale = nuvoton_pwm_get_prescale(nvtpwm, ch);
> +	divisor = (u64)NSEC_PER_SEC * (prescale + 1);
> +
> +	period_cycles = mul_u64_u64_div_u64(nvtpwm->clkrate,
> +					    state->period, divisor);
> +	if (!period_cycles)
> +		return -EINVAL;
> +
> +	if (period_cycles > MA35D1_PWM_MAX_CYCLES)
> +		period_cycles = MA35D1_PWM_MAX_CYCLES;
> +
> +	duty_cycles = mul_u64_u64_div_u64(nvtpwm->clkrate,
> +					  state->duty_cycle, divisor);
> +	if (duty_cycles > period_cycles)
> +		duty_cycles = period_cycles;
> +
> +	ret = nuvoton_pwm_config_channel(nvtpwm, ch);
> +	if (ret)
> +		return ret;
> +
> +	if (state->polarity == PWM_POLARITY_NORMAL)
> +		nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_PWM_POLCTL,
> +				MA35D1_PWM_POLCTL_INV(ch), 0);
> +	else
> +		nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_PWM_POLCTL,
> +				MA35D1_PWM_POLCTL_INV(ch),
> +				MA35D1_PWM_POLCTL_INV(ch));
> +
> +	/*
> +	 * In up-counting mode the counter counts from 0 to PERIOD inclusive.
> +	 * With zero point high and compare-up point low actions:
> +	 * - CMPDAT = 0 produces 0% duty.
> +	 * - CMPDAT > PERIOD produces 100% duty.
> +	 *
> +	 * period_cycles is limited to 0xffff, so PERIOD is at most 0xfffe
> +	 * and a 100% duty cycle can be represented by CMPDAT = 0xffff.
> +	 */
> +	period = period_cycles - 1;
> +	cmpdat = duty_cycles;
> +
> +	nuvoton_pwm_writel(nvtpwm, MA35D1_REG_PWM_PERIOD(ch), period);
> +	nuvoton_pwm_writel(nvtpwm, MA35D1_REG_PWM_CMPDAT(ch), cmpdat);

This is racy, right? (i.e. if a period end happens between these two
writes, we see (probably) one period with the new period length and the
old duty_cycle.

The result of the two questions should be a comment describing the
behaviour, otherwise the code looks fine on a quick glance.

Best regards
Uwe

--gj7lpiutmh7njnbh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqns+QACgkQj4D7WH0S
/k5FSwf+Nk29Si7VT23M1ciM84MTOv3o0aAx6Syxa/FAYB/wGsbfOQfdrahzYO6y
/0gU4Zjql0+4nu6sNrz9e9AJWqSljze9z/j1zdZQ1qAqlKH0Vfph85hrqW2CnJrA
CwZiYCffuIHrITmJXG7ACtd2jTcdY8/YeUJQ3MuQlT4O67As/9VF+6RW+DUW4iFA
L9vWx4Y7hhWGz4+TozTipkFBAX3ResmC/fPpPr15T1NxLYiFZrZS0Mh8bHbj//7Y
5GmgHeuNqdiWWod/DN9iCDh9X1r8pu4ZewvCF+kDPYsQtZEgNZgi9I3QgadzaD1L
rihEHMMi/YGrk/xiXD4TragJYmBS6A==
=B1Dh
-----END PGP SIGNATURE-----

--gj7lpiutmh7njnbh--

