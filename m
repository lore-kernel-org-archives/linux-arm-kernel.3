Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1D1E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 16:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NmpRqZ6nUcb/C3oMSWOH9XTRaX9HoMl7XcGFMi7Llak=; b=G7SukqON6mrHz0ufm6EKzHIbpw
	EY02WKew+i6Ti/o50psdEVTFKR0nBk0nQqUKOVY0n6FYPgnJwj9DgcXMZTJYjpb81ApOkEBdyQ1sO
	8zCOKPEXtF+WAcs8nOLzZXtoz+JcK2mNvJ/Tx/QSeBsJkU7z5rsyaHhYxCp6B/0gWIjXU2SmYu/dt
	/z8iF3uH4sjLV9ppL2bdClIeS2VSrzGsc9E5mg4eRL+ymhToXZbElZV9PuY5faSRkYhVOvApRZfB2
	m6YBpmrvRt73JQyt1oUdLU9oVu88/g8CSEFsSfgUDgyhLoK7E2mdZs8nvmqYFpq7JEwH0jkfOP9sk
	JoA7UlJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNaLl-0000000E9ko-11Ne;
	Tue, 17 Dec 2024 16:23:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNZmD-0000000E0of-44hf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 15:46:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7D056A41AB2;
	Tue, 17 Dec 2024 15:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F786C4CED3;
	Tue, 17 Dec 2024 15:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734450383;
	bh=ru/q+OLGAIOy3QN6Qk2nhuzxbhuGYxQydpgLzzKFXdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D4tBmVlf2a9CV2oWg8wZRHGKdVamvAT4WqSZfWlCDb+hK6/pA+pcZMe3hRlC0q6GG
	 D4DdkHQRibVHNIXDxlP4HkGR+Tmm7zZKibNYyT3Le0eSR+0zGJLJ6frkbzH6SlUIec
	 kmohquthw4MuVytZTMmvw3jaC/sJTKbRwROGG9SX5lCBSyXBsfoXkS6/u/oWYcFvo3
	 vXW2O5DRUG/3HdweNMCM1OYITNF5jjTVPGVnRApRz7jrmtv7JfsX6mcN4lOsWoryUN
	 yqmx5Gb9cqBNZR3Oa01fB7fx4+xQzuoiRT4e9Gahdol43ZCHcYSIBgcWcEl4Qk6VgI
	 j9NZZ7Ta+ZIpQ==
Date: Tue, 17 Dec 2024 16:46:21 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: alexandre.torgue@foss.st.com, linux-pwm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, olivier.moysan@foss.st.com
Subject: Re: [PATCH] pwm: stm32: fix complementary output in
 round_waveform_tohw
Message-ID: <dwwbefhhvjczcakd4nrrunzoq7mhzwrxxpm7gdtabgm6flk4cp@5w4usax4n67h>
References: <20241217150021.2030213-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qbozxwrmepqihx7u"
Content-Disposition: inline
In-Reply-To: <20241217150021.2030213-1-fabrice.gasnier@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_074626_101979_D3E97F61 
X-CRM114-Status: GOOD (  16.78  )
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


--qbozxwrmepqihx7u
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: stm32: fix complementary output in
 round_waveform_tohw
MIME-Version: 1.0

On Tue, Dec 17, 2024 at 04:00:21PM +0100, Fabrice Gasnier wrote:
> When the timer supports complementary output, the enable bit is
> overridden. It should be OR'ed. This makes all PWM channels for
> such timer not to work.
>=20
> Fixes: deaba9cff809 ("pwm: stm32: Implementation of the waveform callback=
s")
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> ---
>  drivers/pwm/pwm-stm32.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
> index b889e64522c3..17e591f61efb 100644
> --- a/drivers/pwm/pwm-stm32.c
> +++ b/drivers/pwm/pwm-stm32.c
> @@ -84,7 +84,7 @@ static int stm32_pwm_round_waveform_tohw(struct pwm_chi=
p *chip,
> =20
>  	wfhw->ccer =3D TIM_CCER_CCxE(ch + 1);
>  	if (priv->have_complementary_output)
> -		wfhw->ccer =3D TIM_CCER_CCxNE(ch + 1);
> +		wfhw->ccer |=3D TIM_CCER_CCxNE(ch + 1);

Oh, indeed. Thanks for the fix.

Applied to=20
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/fixes
and I will send it to Linus later this week.

Best regards
Uwe

--qbozxwrmepqihx7u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdhnMoACgkQj4D7WH0S
/k42SAgAukU0izAyfSfEHr+srRGWulhaFMrUOYDLRgBWAa5ELJaS/8gHKrhtj2om
rFl31JAs/8uiXYgP2w4Wlui1qJma5JH1qWpDjAsYxepnNRJMWENSjjiU/I8lKiiJ
Mk9cKUV4uZlrG/wWNso9OnNNQgeQgjysqkEvcbWdSTza65lZMKLMjy4ar2aLVCIQ
wP94l6Fe3WFDvoedqb2jMlGOIbbOYxV3zxeec91jo3AJMIAGXVwFngeU1sKNqSgR
ReR741ODSY7Alqjm6RpstItWz4nR0J+cdYwnAffA/J7UBQGlKZ+sfK/U8xrfS0YZ
v0QpIr5tXXha04SFh12DaiQ2aztudg==
=DF95
-----END PGP SIGNATURE-----

--qbozxwrmepqihx7u--

