Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CA9C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 22:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AeNyhU0IbImTOM2sec3z2E+lKGcfLSldUoaa9IlHjM8=; b=Kufxue27fN9buqaB2MpFF0VPtx
	d3H8WMl8bBf8h/EgQucMwB1mTZ6dRfu4H667qppLWTNTiKktYpAM8MbEXfHlKx1rFbQBUOFkIQitx
	41ZS+1n5Yf5IpsA1gfi6WptuEKPjMk447hfqXLYyxwkJKk646oT3W/YBlEACFQlc6G2cSNmkQBl/9
	95yRgsS0rXYN8HgkfLxrPMo5cKReLv9KK+gjRcTmAuP6zBiRCDGW4hF4Qgi40RNpM6TjCC41g1chH
	eqKpOBsOY4GHLPYXob9dZPeLqVDpHGq0yV77l54RK0d5WZnBM5zAwbZSd0oeUGPrBChA617awpVFq
	wMgywQyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdjP-0000000AAZP-3E6k;
	Wed, 09 Jul 2025 22:57:39 +0000
Received: from aposti.net ([185.119.170.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZcJM-00000009uau-1JoP;
	Wed, 09 Jul 2025 21:26:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1752096392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=AeNyhU0IbImTOM2sec3z2E+lKGcfLSldUoaa9IlHjM8=;
	b=iVF8f94E7W50OAweMt+hTHDfgObOse4sZp8Eo5dQc8thX1hkibCzhxy/9KVJUZHhnhvRMH
	4eM0KB6bD8knnRyAYR8EVPHw3dxxkjb9768f3Nvq8ePRJgS9TJDf6pTcpd4E4aNpTbvJ0u
	DRWRu5b09tEtU9ZhjgXJKyC9Lf2wwfE=
Message-ID: <5a2c7d244d0467d7236dbce920319c6df519bad7.camel@crapouillou.net>
Subject: Re: [PATCH v2 07/12] pinctrl: ingenic: use
 pinmux_generic_add_pinfunction()
From: Paul Cercueil <paul@crapouillou.net>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij	
 <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, Konrad
 Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>,
 Lorenzo Bianconi	 <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger	 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 09 Jul 2025 23:25:30 +0200
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-7-b6135149c0d9@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
	 <20250709-pinctrl-gpio-pinfuncs-v2-7-b6135149c0d9@linaro.org>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_142640_864583_84E34E5B 
X-CRM114-Status: GOOD (  13.20  )
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

Hi Bartosz,

Le mercredi 09 juillet 2025 =C3=A0 16:39 +0200, Bartosz Golaszewski a
=C3=A9crit=C2=A0:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> Instead of passing individual fields of struct pinfunction to
> pinmux_generic_add_function(), use pinmux_generic_add_pinfunction()
> and
> pass the entire structure directly.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> =C2=A0drivers/pinctrl/pinctrl-ingenic.c | 5 ++---
> =C2=A01 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c
> b/drivers/pinctrl/pinctrl-ingenic.c
> index
> 3c660471ec6911ee494f45d2ffc13c4dc496fd2e..79119cf20efcf8cc701647d9ff9
> 79c2b71bf7589 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -4574,9 +4574,8 @@ static int __init ingenic_pinctrl_probe(struct
> platform_device *pdev)
> =C2=A0		const struct function_desc *function =3D &chip_info-
> >functions[i];
> =C2=A0		const struct pinfunction *func =3D &function->func;
> =C2=A0
> -		err =3D pinmux_generic_add_function(jzpc->pctl, func-
> >name,
> -						=C2=A0 func->groups,
> func->ngroups,
> -						=C2=A0 function->data);
> +		err =3D pinmux_generic_add_pinfunction(jzpc->pctl,
> func,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 function-
> >data);
> =C2=A0		if (err < 0) {
> =C2=A0			dev_err(dev, "Failed to register function
> %s\n", func->name);
> =C2=A0			return err;

