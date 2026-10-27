Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB7E606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 13:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kcWdRf+m;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=apFEDtX9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VOv2hj4TqzHbEep3nPGzgUbHv1sJOMyDv++GUr8JGyk=; b=kcWdRf+mXZNRIP
	KQKUPsXSFyqpHGReiIpiYRhKjzkrJ6ARDrzDJKmIPsizYwRdMXV8+UDwhR/ycFnKJR5NbAEvu2Ng9
	+WEImod/xXOrXmfPIqQzibSBQYOUmf8KUXnn6YZXhN+2R8oSn3+mwtpBWjqdUmqX49kXd0B5hnIJr
	+7oQahcpqY3fMzANL611tWi2MaGGo2HfLeX8UNePwKD91YeMLm7K+SvS3eJeb97v6IJitO12LX0J0
	rXV/cImdYEfIR1yoAwZg2rmshEksgJFpQxFLggf1dvfgtQnFIOkCFPCfjhvpRiirFlJJ9cGxQaP+y
	H+k+W8nB8KrTrT3asyIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhRn-00000004uod-468m;
	Tue, 27 Oct 2026 13:42:39 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhRl-00000004umZ-1lwY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 13:42:38 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so10059405e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 06:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793108554; x=1793713354; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VOv2hj4TqzHbEep3nPGzgUbHv1sJOMyDv++GUr8JGyk=;
        b=apFEDtX9ZbS1OYE019fNXwUVLNiY8yoDP/T3cwhuZ+/vSu+kZK7/EabN+h8GMnt3BB
         1QQr+5ei7JW94DIuz4Svk46YagjM41rD+qqjoerWln8uLkdq5/LkXbPs4GlTdQ9hrL+h
         mvW/XHz6eyRl0+DyWUIVSERLQikehGEoC4zsx2hk3ecIKyf6wGrqqs6BqrotN9hNJLte
         6EtwvNwgBvAqPliOIgw8YRwO7BHZzNwuukugFWRmAzg5F6O7AalMksGMFZLAACsgYsVj
         8xpyuWGMdSbkZjKukpiJUyRphkjiJoLuX3yH0yXd4w1S3DPWjxA476uOeUa4KReFfip6
         f1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793108554; x=1793713354;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VOv2hj4TqzHbEep3nPGzgUbHv1sJOMyDv++GUr8JGyk=;
        b=QQeLkcQa/cR8ikFK58dJ294QaVoBK9wHI2tTUOb/Q+uK7Nq4gfRBZjiyzOLGuI1nV9
         k9ZHtq5qcn0P82v84IQKYKODSpYUwWLbf3Bwd5llqc7prQDerxVhfbFDFNv69Zf9QQly
         WQmHlPCHfTC9OzBbD31XcTOHrDdfVCrUAONevTJb3v7bD5QSFsc7SsTp7Ul8chYNdL94
         YjaEQ0RATvYxu8S/aWw0+MOXGe+kwJDKtyYmyJpgnJQPpMCo42gzLzWf7o500T+9CfB1
         G/uZKKctkHg/qcuNZhVHaHmXstgHCmYRSlOjVBmz1MLRS92S5SBLKk9ljnXlgBi0ehO2
         7LeQ==
X-Forwarded-Encrypted: i=1; AKwUvByCQGUIqMPs/vBSSwa1OX/wB4jNhJGxc/BYzThJ1MCAWxojREpwhgBPQzXnwUSDoW15QLm5yPiKQ3RfBJUZNEfF@lists.infradead.org
X-Gm-Message-State: AFq9FYJGOPxA8VTd5MUfYZCcY3W2Nl/a1s+sMCHjtHRghq/Mx0pWX/hE
	ytKb/ajDdBI6z2c4jZZ8pMFJ3BJIOVUV2UAQtX/AN2pKAOXbm17ILJUu
X-Gm-Gg: AYBFou22p+BEPBcAyd3cpsZRhlbI/AUA90d+z3V2/4RGyWd3Ry/o1mIJQGKAkGJ6pzF
	6oNHoLGUY+/sejFUv8yhg///XFEuWFB6mutK8ORpyHcjByTYL9AYmk4oGMhhBMPHCG/DUYa/GzS
	7lZPRbrzUocsWcInOJ2urclMmDNX6hr2uNTaKlKZ1SpspOU9c5SgyJ2GjnMiG4R+lHp4vbv9isU
	GTdTmno/dUP+GUUkiK79xj/Zd1jRbjhDOsHFCrnkFxTsRx83lmKt4YEJwmS1MlHruX83okBhrFU
	9pn2k9Hk99QYPcet7+jnc+PPtniJg025Fuwsvyodz7RUBghSYG+YMA0G9e/ZfDVV2/MEesgYYVW
	8nKXyVCnGh0AY5JPl/jzEVAA8n9nmy/XuJyUBNn6yPM/ZQ9b3wa2C1lSUtSD94t+lJM6fXZewC3
	dD6zyfPhhxtxBYh4FROl/6csgdQpbs+Lox8UF80/xNz3LC0Xn1yh/PP/wcllatJzeWu5eLLwA1M
	Ld96lZ5+lpqKqqFOKSOV1f6j3Rh2BoYpJLIA7S06vDMY4EKnoaxmmFRqqvS41LRkP16sfY4V86f
	5OXVgp34MPdoHh16
X-Received: by 2002:a05:600c:3c98:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4a7c1c845a2mr60104605e9.16.1793108554418;
        Tue, 27 Oct 2026 06:42:34 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm696126435e9.1.2026.10.27.06.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:42:34 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:42:33 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>, Claudiu
 Beznea <claudiu.beznea@tuxon.dev>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] pwm: atmel: Fix arithmetic overflows for long
 periods
Message-ID: <20261027134233.3f1e030a@pumpkin>
In-Reply-To: <20261027022755.52912-1-kmehltretter@gmail.com>
References: <20261016161221.16553-1-kmehltretter@gmail.com>
	<20261027022755.52912-1-kmehltretter@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_064237_498117_82BB7D8C 
X-CRM114-Status: GOOD (  35.90  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 27 Oct 2026 03:27:55 +0100
Karl Mehltretter <kmehltretter@gmail.com> wrote:

> atmel_pwm_calculate_cprd_and_pres() first multiplies the requested
> period by the clock rate in a u64 and only then divides by
> NSEC_PER_SEC. The product can overflow even when the quotient and the
> resulting hardware configuration are representable.
>=20
> For example, at 12 MHz a 1600 s period has 19.2 billion clock cycles
> and fits with prescaler 3, but the intermediate product exceeds U64_MAX.
> It wraps and the driver programs a period of about 62.8 s instead. This
> remains broken after changing fls() to fls64(). The duty-cycle
> calculation has the same overflow.
>=20
> Use mul_u64_u64_div_u64() for both conversions and use fls64() when
> deriving the prescaler. The multiply/divide result cannot overflow if
> the clock rate is at most NSEC_PER_SEC, so hold the clock rate exclusive
> and validate it at probe time.
>=20
> The reverse conversion in atmel_pwm_get_state() can overflow too: it
> multiplies CPRD or CDTY by NSEC_PER_SEC and then shifts the u64 by the
> prescaler. Convert the scaled clock ticks with the overflow-safe,
> round-up helper instead. Explicitly saturate values that cannot be
> represented by the u64 nanosecond API, rather than relying on the
> architecture-specific helper's quotient-overflow behaviour.

Personally I think mul_u64_u64_div_u64() should return ~0ull on both
overflow and divide by zero.
While a valid result, any code that expects it can pretty certainly
also get 'a bit more' so including ~0ull in the 'overflow' values
doesn't really do any harm.
But someone insisted on in faulting - even though there has been
a patch to x86-64 to recover from the fault.

>=20
> Fixes: a9d887dc1c60 ("pwm: Convert period and duty cycle to u64")
> Cc: stable@vger.kernel.org
> Reported-by: Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org>
> Link: https://lore.kernel.org/r/atnHHaOwTkI78_tc@monoceros
> Suggested-by: Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> Changes in v3:
> - Use mul_u64_u64_div_u64() for the period conversion as suggested by
>   Uwe, and for the analogous duty-cycle conversion.
> - Fix the corresponding overflow in the get_state() conversion and
>   explicitly saturate results that cannot be represented in nanoseconds.
> - Hold the clock rate exclusive and validate the rate bound required by
>   the arithmetic.
> - Rebase onto v7.3-rc7.
>=20
> Testing:
> - Built an ARM zImage with clang 22.1.8 and W=3D1.
> - Passed 14 host boundary tests, 53 oracle-checked SAM9X75 QEMU boots,
>   and all 20 PWM device-model qtests.
> - Passed 89/89 checks on a physical SAM9X75, including overflow cases.
>   A 69.175-second period measured 69.210 seconds between interrupts; no
>   kernel errors were found.
>=20
>  drivers/pwm/pwm-atmel.c | 46 +++++++++++++++++++++++++++++------------
>  1 file changed, 33 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-atmel.c b/drivers/pwm/pwm-atmel.c
> index 86918523d8..db7a14c66a 100644
> --- a/drivers/pwm/pwm-atmel.c
> +++ b/drivers/pwm/pwm-atmel.c
> @@ -23,6 +23,7 @@
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/io.h>
> +#include <linux/math64.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> @@ -183,19 +184,18 @@ static int atmel_pwm_calculate_cprd_and_pres(struct=
 pwm_chip *chip,
>  					     unsigned long *cprd, u32 *pres)
>  {
>  	struct atmel_pwm_chip *atmel_pwm =3D to_atmel_pwm_chip(chip);
> -	unsigned long long cycles =3D state->period;
> +	unsigned long long cycles;
>  	int shift;
> =20
>  	/* Calculate the period cycles and prescale value */
> -	cycles *=3D clkrate;
> -	do_div(cycles, NSEC_PER_SEC);
> +	cycles =3D mul_u64_u64_div_u64(state->period, clkrate, NSEC_PER_SEC);
> =20
>  	/*
>  	 * The register for the period length is cfg.period_bits bits wide.
>  	 * So for each bit the number of clock cycles is wider divide the input
>  	 * clock frequency by two using pres and shift cprd accordingly.
>  	 */
> -	shift =3D fls(cycles) - atmel_pwm->data->cfg.period_bits;
> +	shift =3D fls64(cycles) - atmel_pwm->data->cfg.period_bits;
> =20
>  	if (shift > PWM_MAX_PRES) {
>  		dev_err(pwmchip_parent(chip), "pres exceeds the maximum value\n");
> @@ -218,12 +218,23 @@ static void atmel_pwm_calculate_cdty(const struct p=
wm_state *state,
>  {
>  	unsigned long long cycles =3D state->duty_cycle;
> =20
> -	cycles *=3D clkrate;
> -	do_div(cycles, NSEC_PER_SEC);
> +	cycles =3D mul_u64_u64_div_u64(cycles, clkrate, NSEC_PER_SEC);
>  	cycles >>=3D pres;
> +
>  	*cdty =3D cprd - cycles;
>  }
> =20
> +static u64 atmel_pwm_ticks_to_ns(u64 ticks, unsigned long rate)
> +{
> +	u64 max_ticks;
> +
> +	max_ticks =3D mul_u64_u64_div_u64(U64_MAX, rate, NSEC_PER_SEC);
> +	if (ticks > max_ticks)
> +		return U64_MAX;

I'm not sure how often this is called, but it might be worth caching
max_ticks during the probe.
(and maybe even the clock rate itself - I doubt it can change.)

David

> +
> +	return mul_u64_u64_div_u64_roundup(ticks, NSEC_PER_SEC, rate);
> +}
> +
>  static void atmel_pwm_update_cdty(struct pwm_chip *chip, struct pwm_devi=
ce *pwm,
>  				  unsigned long cdty)
>  {
> @@ -352,24 +363,22 @@ static int atmel_pwm_get_state(struct pwm_chip *chi=
p, struct pwm_device *pwm,
>  	if (sr & (1 << pwm->hwpwm)) {
>  		unsigned long rate =3D clk_get_rate(atmel_pwm->clk);
>  		u32 cdty, cprd, pres;
> -		u64 tmp;
> +		u64 ticks;
> =20
>  		pres =3D cmr & PWM_CMR_CPRE_MSK;
> =20
>  		cprd =3D atmel_pwm_ch_readl(atmel_pwm, pwm->hwpwm,
>  					  atmel_pwm->data->regs.period);
> -		tmp =3D (u64)cprd * NSEC_PER_SEC;
> -		tmp <<=3D pres;
> -		state->period =3D DIV64_U64_ROUND_UP(tmp, rate);
> +		ticks =3D (u64)cprd << pres;
> +		state->period =3D atmel_pwm_ticks_to_ns(ticks, rate);
> =20
>  		/* Wait for an updated duty_cycle queued in hardware */
>  		atmel_pwm_wait_nonpending(atmel_pwm, pwm->hwpwm);
> =20
>  		cdty =3D atmel_pwm_ch_readl(atmel_pwm, pwm->hwpwm,
>  					  atmel_pwm->data->regs.duty);
> -		tmp =3D (u64)(cprd - cdty) * NSEC_PER_SEC;
> -		tmp <<=3D pres;
> -		state->duty_cycle =3D DIV64_U64_ROUND_UP(tmp, rate);
> +		ticks =3D (u64)(cprd - cdty) << pres;
> +		state->duty_cycle =3D atmel_pwm_ticks_to_ns(ticks, rate);
> =20
>  		state->enabled =3D true;
>  	} else {
> @@ -487,6 +496,7 @@ static int atmel_pwm_probe(struct platform_device *pd=
ev)
>  {
>  	struct atmel_pwm_chip *atmel_pwm;
>  	struct pwm_chip *chip;
> +	unsigned long rate;
>  	int ret;
> =20
>  	chip =3D devm_pwmchip_alloc(&pdev->dev, 4, sizeof(*atmel_pwm));
> @@ -507,6 +517,16 @@ static int atmel_pwm_probe(struct platform_device *p=
dev)
>  		return dev_err_probe(&pdev->dev, PTR_ERR(atmel_pwm->clk),
>  				     "failed to get prepared PWM clock\n");
> =20
> +	ret =3D devm_clk_rate_exclusive_get(&pdev->dev, atmel_pwm->clk);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to get exclusive PWM clock rate\n");
> +
> +	rate =3D clk_get_rate(atmel_pwm->clk);
> +	if (!rate || rate > NSEC_PER_SEC)
> +		return dev_err_probe(&pdev->dev, -EINVAL,
> +				     "invalid PWM clock rate %lu Hz\n", rate);
> +
>  	chip->ops =3D &atmel_pwm_ops;
> =20
>  	ret =3D atmel_pwm_enable_clk_if_on(chip, true);
>=20
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907


