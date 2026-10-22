Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A291606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 08:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SRtmV5ht;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B8x6yJxU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lYu0vxaasiD556MfAu5R9CUvlfrPZLDJu4XoI/LGb7U=; b=SRtmV5htYFL+PgCJkq22UlIisn
	hmnFVf47ZvBLXokzGpVmJcwKTPM8iOSqKV1UXGNzdqRcw/ptJrV+YpTlIR9zy5Fg7mwR5VB+lrN6E
	N22ey1YMQ8Zd56q4UBU0aejjb9vTW0cUjH2BF0jclnkLMkVMXoPo+1sPw/9T1Y0ihLBUNa5ROWPuj
	/1SwPXFN5heO9PQS0aYLe5tYqA0xEqJck+fHTgDdlZMvq6CZJvPXX9QziCmSstpS8I0P+ZSvnS67x
	tzPWp78jjPujFLyyx5AYz3FoCak45ZCJas2skKQ244wEiyj0caWceGzv5UZBPj4kndF/cmDhnf4qO
	XU2ZsiWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJoBI-0000000Dera-0W3z;
	Thu, 22 Oct 2026 08:29:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJoBF-0000000DerE-3QhI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 08:29:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 4673342D8C;
	Thu, 22 Oct 2026 08:29:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 9D2971F000C2;
	Thu, 22 Oct 2026 08:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792657785;
	bh=lYu0vxaasiD556MfAu5R9CUvlfrPZLDJu4XoI/LGb7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B8x6yJxUgG3bqv1qwvA+Elk6beiej5IQqxuu6cLea8Kwj1mr/5wfv06Ah6Sbe+oyd
	 zXFyfUUW0kwJU7qLEdx1FthXM6deLKsMYLoDabW5Ap+g3m/pwpnLmTxtiERWaM8K6l
	 agRqpWIWrDooC08lbEOfoq7JO6nZXfhF76hFzXn1Jzg/xVOr4Q36D6hRIy/BBCAFjG
	 FvFCZP8yMs3FRa3MyAhjmbt1k0AXE84bEimzMhpRPSZ8XvRu38Wr3jE1qjP1hsd6Pk
	 NNcqLlm2nWMpFqUu03bnfx2thjzLnP1xYsaCQ5NG5Z1pAhffGyq/RInr155CUPMLqJ
	 W1laGKxSZbBQA==
Date: Thu, 22 Oct 2026 10:29:42 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pwm: atmel: Fix prescaler for periods of 2^32 clock
 cycles or more
Message-ID: <atnHHaOwTkI78_tc@monoceros>
References: <20261016161221.16553-1-kmehltretter@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vqpjgoh36dtmnefm"
Content-Disposition: inline
In-Reply-To: <20261016161221.16553-1-kmehltretter@gmail.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--vqpjgoh36dtmnefm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] pwm: atmel: Fix prescaler for periods of 2^32 clock
 cycles or more
MIME-Version: 1.0

Hello Karl,

On Fri, Oct 16, 2026 at 06:12:21PM +0200, Karl Mehltretter wrote:
> atmel_pwm_calculate_cprd_and_pres() keeps the period in clock cycles in
> an unsigned long long but derives the prescaler from fls(cycles). fls()
> takes an unsigned int, so the upper 32 bits are ignored.
>=20
> On controllers that the driver configures with a 32-bit period register
> (SAM9X60, SAM9X7) a request of 2^32 clock cycles or more therefore gets
> prescaler 0 and a truncated CPRD. The request succeeds and sysfs
> reports the requested period.
>=20
> On a SAM9X75 (PWM clock 266.67 MHz) this affects periods from about
> 16.1 s on. Requesting 20 s with a 10 s duty cycle
>=20
>   # echo 2 > /sys/class/pwm/pwmchip0/export
>   # echo 20000000000 > /sys/class/pwm/pwmchip0/pwm2/period
>   # echo 10000000000 > /sys/class/pwm/pwmchip0/pwm2/duty_cycle
>   # echo 1 > /sys/class/pwm/pwmchip0/pwm2/enable
>=20
> programs CPRE=3D0, CPRD=3D0x3de4355c and CDTY=3D0x9ef21aae. The channel r=
uns
> with a period of 3.9 s, measured from the period end flag in PWM_ISR.
> With this duty cycle CDTY is above CPRD, so the output stays inactive
> and an LED on it stays dark.
>=20
> Use fls64() so that the prescaler is derived from the full 64-bit
> value. The driver then programs CPRE=3D1, CPRD=3D0x9ef21aae and
> CDTY=3D0x4f790d57. The measured period is 20.0 s and the LED is on for
> 10 s of every 20 s.
>=20
> Controllers configured with a 16-bit period register are unaffected
> for all representable periods. Some oversized requests of 2^32 clock
> cycles or more now fail with -EINVAL instead of being programmed with
> truncated values. Clamping such requests to the maximum possible
> configuration is a pre-existing issue best addressed when converting
> the driver to the waveform API.
>=20
> The truncation was not reachable when it was introduced. The period
> was an unsigned int in nanoseconds then, which limits it to about
> 4.29 s. Commit a9d887dc1c60 ("pwm: Convert period and duty cycle to
> u64") made longer periods possible.
>=20
> Fixes: a9d887dc1c60 ("pwm: Convert period and duty cycle to u64")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> Changes in v2:
> - Keep only the Fixes tag for the commit that exposed the bug (Uwe).
> - Clarify the pre-existing handling of oversized requests (Uwe).
> - Add Microchip's confirmation of the data sheet error.
> - Rebase onto v7.3-rc7.
> - No code changes from v1.
>=20
> v1: https://lore.kernel.org/r/20261003083036.21584-1-kmehltretter@gmail.c=
om/
>=20
> Notes:
>     Found while testing a Rust port of this driver on a SAM9X75 Curiosity
>     board. The port uses a 64-bit fls. Its registers differed from the C
>     driver for long periods.
>=20
>     Tested on that board with a v7.3-rc5-based kernel built with clang
>     22.1.8. PC20 was routed to PWM2 (peripheral function C) in a local
>     device tree. The blue LED is on that pin.
>=20
>     - Without the patch there are 23 period ends in 90 s, 3.88 s to 3.93 s
>       apart. The LED stays dark.
>     - With the patch the period ends are 19.98 s to 20.01 s apart. The LED
>       is on for 10 s of every 20 s.
>=20
>     The SAM9X60 and SAM9X7 data sheets describe the channel counter as
>     16 bit. That does not match the hardware.
>=20
>     - The 20.0 s result needs CPRD=3D0x9ef21aae. All 32 bits are used.
>     - Commit 0285827d546d ("pwm: atmel: Add support for controllers with
>       32 bit counters") says 32 bit.
>     - Microchip's Harmony PWM example for this board programs
>       CPRD=3D133333333.
>=20
>     Microchip support has confirmed that the data sheets are incorrect and
>     will be corrected.
>=20
>  drivers/pwm/pwm-atmel.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pwm/pwm-atmel.c b/drivers/pwm/pwm-atmel.c
> index 86918523d821..574020d90a3b 100644
> --- a/drivers/pwm/pwm-atmel.c
> +++ b/drivers/pwm/pwm-atmel.c
> @@ -195,7 +195,7 @@ static int atmel_pwm_calculate_cprd_and_pres(struct p=
wm_chip *chip,
>  	 * So for each bit the number of clock cycles is wider divide the input
>  	 * clock frequency by two using pres and shift cprd accordingly.
>  	 */
> -	shift =3D fls(cycles) - atmel_pwm->data->cfg.period_bits;
> +	shift =3D fls64(cycles) - atmel_pwm->data->cfg.period_bits;
> =20
>  	if (shift > PWM_MAX_PRES) {
>  		dev_err(pwmchip_parent(chip), "pres exceeds the maximum value\n");

just above this code snippet there is:

	unsigned long long cycles =3D state->period;

        /* Calculate the period cycles and prescale value */
        cycles *=3D clkrate;
        do_div(cycles, NSEC_PER_SEC);

there is another overflow happening here if state->period * clkrate
doesn't fit into an u64. A complete fix converts that to:

	cycles =3D mul_u64_u64_div_u64(state->period, clkrate, NSEC_PER_SEC);

which prevents an overflow if clkrate =E2=89=A4 NSEC_PER_SEC.
The latter can be asserted by checking that at probe time after calling
clk_rate_exclusive_get().

The options now are I apply your patch anyhow and the above can be
addressed later, or you rework your patch to a complete fix. What is
your preference?

Best regards
Uwe

--vqpjgoh36dtmnefm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrZyXQACgkQj4D7WH0S
/k4Z5gf+P23ZuNjCGy3QqwfAby1YXzFwIUQKlB3VaXDXBzPdSBx6mF3pApLnsOJP
XBf4v0U/6l4Q8Nu20efYTpdzRFRrfnZAXFsViQFiXUuYYrfGZ6HYll6BSR/BEwZR
kDLWldJXiXTfNVJ/pV0SWcHSJjvQQmko5P7djFCcc1HRWBJDHBelwWpYnwP4Pfvk
+yv/TM6OpPlt/XDa+nNzH/SZcckTKLZ5LBURgYVRG21WV9F5pB+yhfnEkpyqDPxy
XFmCEPF3iQ9E2T5QIeVDb+8FIvUwMKYt5iPxe7kudsT4bqni9l7eMWM/J4OIKWbs
WiLS/g7Ts3dqzSiOOexq60i4CRfAHw==
=3fwJ
-----END PGP SIGNATURE-----

--vqpjgoh36dtmnefm--

