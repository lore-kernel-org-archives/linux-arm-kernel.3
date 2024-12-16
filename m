Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35ACCE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 08:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NnC7XhxdizVxyYJ4vx+w1S/04N9C7uQEBf4DHTaeC/g=; b=pmVb8dWWo0OUkDLtEgfMXW2tNd
	3quaNbOeJACjNhtzjKczLcYNPf2XTT2T2GPfkyijoDGltPTGuyCHg3y/BFrorzikzBVrdLe3EUvo/
	jy1plZQk+xI4jpzfiQCchGw0pEUgzBzyoLnCrBzEELJyUtMkW0RFo1LToY0aGN/XsTF3qvxopzLb7
	6vIPTVHKSkYeJFdODa758ajEwTbfiNrnGOVAA68LCtepS9Aub05gQuZIguJyQkSIaCthFPo8rfOHZ
	WbguHe2mjSrrCtxcyx7e5/ltSHb0WwODpcq/2gej3krRcJZpYS7VYO6lOCoxW4fXdnFz8/4v9lU5G
	2ZQh222w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6Om-00000009Ns9-0Vq5;
	Mon, 16 Dec 2024 08:24:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6Nf-00000009NdT-2xmu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 08:23:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5F3CBA40D0B;
	Mon, 16 Dec 2024 08:21:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 885F9C4CED0;
	Mon, 16 Dec 2024 08:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734337385;
	bh=vOCQPuexICPOQSuilzYyp/1Ex7qhBODA8YKKaZigSgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e12vIT85AtBLi/+MH997JfBhodHyWT+2POvUj+hV7NhjX5rp47oVnm+TTojt52OxH
	 pDLesVc/gN+RyMtGqQmSryHKsT6vSlC0qsLoSPp6aUVLc3w6OBU5EhYPfdMqlalrU6
	 /Kf49hNAhfDrI74hj4VeYQzJjnbLHJXBrdTKHoOWVZzEECYbFbjimcvnoaKzqUDrMZ
	 YAi00a/CZzkrCyFSNXSTkjZP5LFloECGG+ZpeyHDAQnKqmGlAeGDdvN27/AVpcpjPL
	 39ExDgxY8OYlfVrDW+9tW6rzAHKXi1WyyIwPQ6mIPJ5b78nZNiBrDcZMFlopJF/s74
	 sYZTnhiVbrsXw==
Date: Mon, 16 Dec 2024 09:23:03 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Mingwei Zheng <zmw12306@gmail.com>
Cc: fabrice.gasnier@foss.st.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, thierry.reding@gmail.com, p.zabel@pengutronix.de, 
	linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: Re: [PATCH] pwm: stm32: Add check for clk_enable()
Message-ID: <24zcihiin4lkfhahxmn4nx4t7v5hlvxhlcjzeyrz2kizcqkaop@b5yq44j4vozj>
References: <20241215224752.220318-1-zmw12306@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nx6agqcxa3ihyuxg"
Content-Disposition: inline
In-Reply-To: <20241215224752.220318-1-zmw12306@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_002307_877282_75C26EE6 
X-CRM114-Status: GOOD (  20.39  )
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


--nx6agqcxa3ihyuxg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: stm32: Add check for clk_enable()
MIME-Version: 1.0

Hello,

On Sun, Dec 15, 2024 at 05:47:52PM -0500, Mingwei Zheng wrote:
> Add check for the return value of clk_enable() to catch the potential
> error.
>=20
> Fixes: 19f1016ea960 ("pwm: stm32: Fix enable count for clk in .probe()")
> Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> ---
>  drivers/pwm/pwm-stm32.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
> index b889e64522c3..b94d186e3c0c 100644
> --- a/drivers/pwm/pwm-stm32.c
> +++ b/drivers/pwm/pwm-stm32.c
> @@ -858,8 +858,11 @@ static int stm32_pwm_probe(struct platform_device *p=
dev)
>  	chip->ops =3D &stm32pwm_ops;
> =20
>  	/* Initialize clock refcount to number of enabled PWM channels. */
> -	for (i =3D 0; i < num_enabled; i++)
> -		clk_enable(priv->clk);
> +	for (i =3D 0; i < num_enabled; i++) {
> +		ret =3D clk_enable(priv->clk);
> +		if (ret)
> +			return ret;
> +	}

I wondered for some time if we could still improve more here. If the
(say) second clk_enable() or devm_pwmchip_add() fails, the clk_enable()
calls are leaked. However disabling the clk also might have downsides
(as it might stop a running PWM). OTOH the only expected failure point
is the first clk_enable() as the following are just software operations
and devm_pwmchip_add() only fails on memory pressure. So proper cleanup
doesn't really matter.

So I think the patch is fine as is and I will apply it.

Best regards
Uwe

--nx6agqcxa3ihyuxg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdf41wACgkQj4D7WH0S
/k7llwf/UiLvKJ4m+BX9uZ9YkHIcbQ5Y9akNESa58tdAXToIePTuElL94I9wcLtr
jyU3+IZmgT0FaQ6kfIlkt87oM/owomEUiXSmE9KCZdoNJVb8cx1rPHGocbE3xB6d
2YSpQyi1yoybKbSl/32eFuKREaZC1K2kd0PA1lu7S4rpMhfUVBF5fa1z+gfV9XYQ
0l8KoryMUslshBYLYK4Jt8fcWm62JTCC9kHmpmAhUQOYHP7kRu2HTwyBtLwqIL+1
rGTpleh6Y1MNAeWx9oCFhaL5Cb+T1JFJWbaQpX+hFaIGghLacIh41JhCzDwPiqjs
Sc298uJWaEPzq1vJv/Oo7qr94cDNZA==
=NnDg
-----END PGP SIGNATURE-----

--nx6agqcxa3ihyuxg--

