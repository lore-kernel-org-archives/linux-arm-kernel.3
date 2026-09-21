Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD336C982F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WOQj9ttdzaZzx0r1oCUSx1dmfsNGOFunfKX1/bnwFeQ=; b=jiWo8MqybBehlGJY0iqGld43lc
	ii7U3Ih9lbGrk8e+eNmfQgU/DeAPXvEH0EfnUwyxldjOtaDXCYou7OmwxllE+WQ1tRFNwKhBdWgKy
	Ahc1AWj68Vhax1308YuLwItlDRh5LDmkiuVv1LgTLl7IsvDVUlgtVoOEv56evCNEB7NepeVpevTlD
	J6cXHhLty9O4gGsonEd+V9CP+Ue9tNEnmZm0WbXRBVDrQtlTGE39J+oE5Tm1obIZ3NuaEYmTWtBUe
	KvRV8k2W6ho3eaxhqTqgxHkFofBM2vIatKXkMn+PgznZXe2wXNAPF8jCQ45gU4r8XEPtXD/CQUve5
	gzfJ5y/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dcO-00000002AjL-0NA4;
	Mon, 21 Sep 2026 12:59:36 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dcA-00000002AXX-1lTW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 12:59:23 +0000
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id A66305C;
	Mon, 21 Sep 2026 14:59:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1789995559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WOQj9ttdzaZzx0r1oCUSx1dmfsNGOFunfKX1/bnwFeQ=;
	b=I13ZyFowPkfV1nO/CxlAhbk2W/TKgMuwaSrksdCGGz9aGfbjQFGI5upWdE568HKZQxsQGC
	No7IzxKS8Tagywoi6CCp6BJa3M1l7D3aEHlQT8DrMM/wY196y/NewA+Wvxp1QKl+BquxW8
	KT+KmrZkYPFz5++EHRJcHzKxB0JyWLcxjyud/Q+9QIZdAM6dE/MV0ve0xrXxu9P6VeRupW
	SOC8VZgImZL74xjFtkXEZunFkEzCkeiNFs2/sx/Vsqt+bmyhFH4REaLT6tHXzhwSBCkfS+
	TD4bLQDK7G7MsHq8Kej0f8Wb8nai/GR33m6lnnglm3Kp86fW5wweyvXlkP0/GA==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=d4abaddd56845fd60ab6e5bb59bbbca58e0e49270f751b02e46e69be1e0c;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 21 Sep 2026 14:59:17 +0200
Message-Id: <DLL0GV4PAJYJ.1JU0HPWE6K0LA@walle.cc>
Subject: Re: [PATCH v7 08/15] gpiolib: regmap: add write_data_after_dir
 quirk
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Jerome Brunet" <jbrunet@baylibre.com>, "Linus Walleij"
 <linusw@kernel.org>, "Bartosz Golaszewski" <brgl@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Jiri Slaby"
 <jirislaby@kernel.org>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Long Zhao"
 <zl020895@163.com>, "Lee Jones" <lee@kernel.org>, <mfd@lists.linux.dev>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-serial@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <michael@walle.cc>
To: <longzhao@ambarella.com>, "Arnd Bergmann" <arnd@arndb.de>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, <soc@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>
X-Mailer: aerc 0.20.0
References: <20260915-cv75-v5-v7-0-3297d3fbc9c0@ambarella.com>
 <20260915-cv75-v5-v7-8-3297d3fbc9c0@ambarella.com>
In-Reply-To: <20260915-cv75-v5-v7-8-3297d3fbc9c0@ambarella.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_055922_634857_BE04C32B 
X-CRM114-Status: GOOD (  30.86  )
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

--d4abaddd56845fd60ab6e5bb59bbbca58e0e49270f751b02e46e69be1e0c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Sep 15, 2026 at 1:15 PM CEST, Long Zhao via B4 Relay wrote:
> From: Long Zhao <longzhao@ambarella.com>
>
> Some controllers ignore data-register writes while a line is still an
> input. Optionally write the output value again after switching the
> direction, matching the existing PL061 behaviour.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> ---
>  drivers/gpio/gpio-regmap.c  | 20 ++++++++++++++++++--
>  include/linux/gpio/regmap.h |  8 ++++++++
>  2 files changed, 26 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> index 51b4d69b8740..dfcc1f1122ec 100644
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
> @@ -31,6 +31,7 @@ struct gpio_regmap {
>  	unsigned int reg_clr_base;
>  	unsigned int reg_dir_in_base;
>  	unsigned int reg_dir_out_base;
> +	bool write_data_after_dir;


Can we just have some quirk flags for these? First, this actually
describe what it is - a quirk - and in the future, we don't have to
copy all the flags individually in _register().

Also maybe QUIRK_SET_AFTER_DIR. The whole driver doesn't mention a
data register.

>  	unsigned long *fixed_direction_mask;
>  	unsigned long *fixed_direction_output;
> =20
> @@ -271,9 +272,22 @@ static int gpio_regmap_direction_output(struct gpio_=
chip *chip,
>  			return ret;
>  	}
> =20
> -	gpio_regmap_set(chip, offset, value);
> +	ret =3D gpio_regmap_set(chip, offset, value);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D gpio_regmap_set_direction(chip, offset, true);
> +	if (ret)
> +		return ret;
> =20
> -	return gpio_regmap_set_direction(chip, offset, true);
> +	/*
> +	 * gpio value is set again, because pl061 doesn't allow to set value of
> +	 * a gpio pin before configuring it in OUT mode.

Is this copied from the old code? Not sure, why pl061 have to be
referenced here.

-michael

> +	 */
> +	if (gpio->write_data_after_dir)
> +		return gpio_regmap_set(chip, offset, value);
> +
> +	return 0;
>  }
> =20
>  void *gpio_regmap_get_drvdata(struct gpio_regmap *gpio)
> @@ -376,6 +390,8 @@ struct gpio_regmap *gpio_regmap_register(const struct=
 gpio_regmap_config *config
>  			    config->fixed_direction_output, chip->ngpio);
>  	}
> =20
> +	gpio->write_data_after_dir =3D config->write_data_after_dir;
> +
>  	/* if not set, assume there is only one register */
>  	gpio->ngpio_per_reg =3D config->ngpio_per_reg;
>  	if (!gpio->ngpio_per_reg)
> diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
> index 06255756710d..d7ffc12b00a2 100644
> --- a/include/linux/gpio/regmap.h
> +++ b/include/linux/gpio/regmap.h
> @@ -48,6 +48,13 @@ struct regmap;
>   *			(Optional) Bitmap representing the fixed direction of
>   *			the GPIO lines. Useful when there are GPIO lines with a
>   *			fixed direction mixed together in the same register.
> + * @write_data_after_dir:
> + *			(Optional) Write the output value again after
> + *			switching a line to output in ->direction_output().
> + *			Needed for hardware which ignores data register
> + *			writes while the line is configured as an input.
> + *			This is a legacy quirk (e.g. ARM PL061); new hardware
> + *			must not use it. Direction changes will glitch.
>   * @drvdata:		(Optional) Pointer to driver specific data which is
>   *			not used by gpio-remap but is provided "as is" to the
>   *			driver callback(s).
> @@ -94,6 +101,7 @@ struct gpio_regmap_config {
>  	unsigned int reg_dir_out_base;
>  	int reg_stride;
>  	int ngpio_per_reg;
> +	bool write_data_after_dir;
>  	struct irq_domain *irq_domain;
>  	unsigned long *fixed_direction_mask;
>  	unsigned long *fixed_direction_output;


--d4abaddd56845fd60ab6e5bb59bbbca58e0e49270f751b02e46e69be1e0c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCarEqJhEcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+EaiAX9aiCN1PCW3AwWf/y/iLNMowy0oVDSCKjnf
nVi253Q2A0LA1C1slrFLvx/ZThbl548BfA1DxrPIRtOIHHeKS9m37w4dtUa8W7cp
Fk4Xf/wSCb9odGSdGEQgkywfnzPzVYXlhw==
=P/i5
-----END PGP SIGNATURE-----

--d4abaddd56845fd60ab6e5bb59bbbca58e0e49270f751b02e46e69be1e0c--

