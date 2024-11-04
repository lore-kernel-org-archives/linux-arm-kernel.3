Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABF5D132D7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 14:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tBFz0Xh8h8OXKDPYxDzsIhljgAc1tr+hzStvYF+4inc=; b=0rqFR18eRs5C+5n122mDnDSOT2
	wirzLdQ0L5UQCLIpeWw01V4wEgEO4kt1/7Tldy3UH0wqAb1cHTIVcRa2DmdbYIi0Z2u98SP3W0OWz
	Zc+XsJD6g/AmA5m/xJiHBHjKSzht+XXI4L9DtUs/FcS6VhqnCjK/7Fu30wX0Aprz/tLwBPcrEFRC3
	1Me0KcrE4ekbLm5xWntfOBvgxmRvIDZ43NfqLOyO1n1wiOY30n54fqjO7SSNOlt84CoALriy/HmFK
	co9indvoj2i9xW2fWA0C1ZrX4KgIsxugLxbt2JQlN1ojOiA5XK2IkskjT2++p5LxPeCXT+VohFEkr
	wnMH/Bxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yRP-0000000E7Yj-1KZu;
	Mon, 04 Nov 2024 14:52:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7y0u-0000000E2X0-0LeK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 14:26:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 51FB25C5619;
	Mon,  4 Nov 2024 14:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A29C4CECE;
	Mon,  4 Nov 2024 14:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730730302;
	bh=aCdsocZNwSc0LaEHFPOtq6uw+UtTQbPbYCLT6rdIiSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R89pu2SkbTOdSoRFVO+RZw5wfgA4U27LfJeYYH88bCe+nfxHdadx02d8l9jhs8zid
	 VrhbYNlRXhCr0Q59Q9+5nKXv8H2c1BwKOpmeMl+iNfLAGzPE0TH0kXY5h82VjvBbuK
	 PVu3y1owBEg93MLEfo812PRB9qr+j1BwMNkIt7ke+Cjars0M+tMypPYeLcBc7rBZx5
	 Y9cTGR7QhoXaXhGcUbDJuLJtxMEABrinBwwWZVTLBs+DBFxogiMaitSSm4sNHLb9w1
	 PzuV8Rd94Va0gkGfpz2mNKhvLiScchTKZeAOUiGVs1SOr45IOTZePGcQYR7v98RXrt
	 Oah2MOc+r3XXg==
Date: Mon, 4 Nov 2024 23:24:58 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: fabrice.gasnier@foss.st.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, Jonathan.Cameron@huawei.com,
	benjamin.gaignard@st.com, gregkh@linuxfoundation.org,
	linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@outlook.com>
Subject: Re: [PATCH] counter: stm32-timer-cnt: Add check for clk_enable()
Message-ID: <ZyjZOt4LXL6vVrEC@ishi>
References: <20241103182502.8384-1-jiashengjiangcool@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A18abvT+dU0C7JZH"
Content-Disposition: inline
In-Reply-To: <20241103182502.8384-1-jiashengjiangcool@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_062504_241167_B0EA5CCE 
X-CRM114-Status: GOOD (  20.16  )
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


--A18abvT+dU0C7JZH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 03, 2024 at 06:25:02PM +0000, Jiasheng Jiang wrote:
> From: Jiasheng Jiang <jiashengjiangcool@outlook.com>
>=20
> Add check for the return value of clk_enable() in order to catch the
> potential exception.
>=20
> Fixes: c5b8425514da ("counter: stm32-timer-cnt: add power management supp=
ort")
> Fixes: ad29937e206f ("counter: Add STM32 Timer quadrature encoder")
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@outlook.com>
> ---
>  drivers/counter/stm32-timer-cnt.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-ti=
mer-cnt.c
> index 186e73d6ccb4..0593c9b73992 100644
> --- a/drivers/counter/stm32-timer-cnt.c
> +++ b/drivers/counter/stm32-timer-cnt.c
> @@ -214,11 +214,15 @@ static int stm32_count_enable_write(struct counter_=
device *counter,
>  {
>  	struct stm32_timer_cnt *const priv =3D counter_priv(counter);
>  	u32 cr1;
> +	int ret;
> =20
>  	if (enable) {
>  		regmap_read(priv->regmap, TIM_CR1, &cr1);
> -		if (!(cr1 & TIM_CR1_CEN))
> -			clk_enable(priv->clk);
> +		if (!(cr1 & TIM_CR1_CEN)) {
> +			ret =3D clk_enable(priv->clk);
> +			if (ret)
> +				return ret;
> +		}
> =20
>  		regmap_update_bits(priv->regmap, TIM_CR1, TIM_CR1_CEN,
>  				   TIM_CR1_CEN);
> @@ -816,7 +820,9 @@ static int __maybe_unused stm32_timer_cnt_resume(stru=
ct device *dev)
>  		return ret;
> =20
>  	if (priv->enabled) {
> -		clk_enable(priv->clk);
> +		ret =3D clk_enable(priv->clk);
> +		if (ret)
> +			return ret;
> =20
>  		/* Restore registers that may have been lost */
>  		regmap_write(priv->regmap, TIM_SMCR, priv->bak.smcr);
> --=20
> 2.25.1

It's not necessarily clear that an error in the count_enable_write()
callback or cnt_resume() callback is due to a clk_enable() failure. You
should call dev_err before returning to indicate the reason for the
error code.

William Breathitt Gray

--A18abvT+dU0C7JZH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZyjZOgAKCRC1SFbKvhIj
K91QAQClpsDPi83ln4ZTMU9XMQcBPRklZisDe1L9SMCTzqjm3gEAq1L5KoqpNOaf
YPPuPhpOYxmyb3wS6y/mZ8IWf4PZ9QQ=
=zJcy
-----END PGP SIGNATURE-----

--A18abvT+dU0C7JZH--

