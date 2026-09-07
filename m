Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9F9C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 17:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x5Wo6+nafu2gFwEiQ2wRMEtUES99VjBaBkvIlgaAU+A=; b=uJCtuJRXIXCDyfSKaT2nuxdhK2
	tU2fHWijlFVM8304Uu9yymKczEoaOBzstjj0sFdO939r3AHm4mksOz4CzuY07QTbYMZ3Wj9Y/qwUH
	tVnWrk4LQelcmXPsZclLPMV1V+AOlF2aU6sJ+jtFMQ55RVwOkVtlzM0/IM4OD07f2YRf3e57KLqA1
	3GgrvIIXp7kgAe06qWxNE3sjOyqUGApV3lZU6cw7/leL9Aj91VLJebSEX63t2RGY4PrU5GLTtaQlk
	sgpqC8Rkut0DXeHQRA5E0HDzFb3SgI2FgJcJPQPnAvAwrQvp57HwjBeqsaJMvsKl9O1E8lYthh3ih
	2YCb7aFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cng-00000007R65-3tIi;
	Mon, 07 Sep 2026 17:06:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cnd-00000007R5N-4Avu;
	Mon, 07 Sep 2026 17:06:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B3BE4082D;
	Mon,  7 Sep 2026 17:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51B961F00A3A;
	Mon,  7 Sep 2026 17:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788800789;
	bh=x5Wo6+nafu2gFwEiQ2wRMEtUES99VjBaBkvIlgaAU+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z4VNrE9Jn+0IP9Kp6Kr1RWQOJbohWASG7T4SalvXtYLGZz/ThMsuSmZDkxCeCTDns
	 MqqSQLVXN2aaBlBxTokuOVzZ95vlTl0UdBi9C0mE6NsEjC92TrjUICzedcHapHi9Q0
	 IXcDDtUn75CKKLdkSVK9UhZ4ea0BTjtPbqfRxqJiQ9KAulFM6qk5g05niEHdeLdv2a
	 Iom9BgtF6cQ1FRis1qgAVTJFHCeUm2yxTyWyikSqSZbNUxYDpvK58E3WVZleTi2CFT
	 Up6CVbbPnAB+I1EQms62BFG5xDVmriE7011YdoFQc8sVV9G3qQXzWi7DvrV8UETvM4
	 YZY7s13yaDyeA==
Date: Mon, 7 Sep 2026 18:06:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	venkata.valluru@oss.qualcomm.com,
	Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v2 2/2] regulator: rpi-panel-v2: Add required vcc-supply
 support
Message-ID: <20260907-ensnare-wanted-e86eeaf770b0@spud>
References: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
 <20260907-rpi_reg-v2-2-0c59aa60d31f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+YZIrFJKHMKrE7Bh"
Content-Disposition: inline
In-Reply-To: <20260907-rpi_reg-v2-2-0c59aa60d31f@oss.qualcomm.com>
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

--+YZIrFJKHMKrE7Bh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 07, 2026 at 11:16:08AM +0530, Shashank Maurya wrote:
> The Raspberry Pi 7" touchscreen panel V2 MCU requires an external power
> rail to be enabled before any I2C register access is attempted. Use
> devm_regulator_get() to obtain the vcc supply and enable it at the
> start of probe.
>=20
> Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> ---
>  drivers/regulator/rpi-panel-v2-regulator.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/drivers/regulator/rpi-panel-v2-regulator.c b/drivers/regulat=
or/rpi-panel-v2-regulator.c
> index 30b78aa75ee3..e54d675962e7 100644
> --- a/drivers/regulator/rpi-panel-v2-regulator.c
> +++ b/drivers/regulator/rpi-panel-v2-regulator.c
> @@ -11,6 +11,7 @@
>  #include <linux/module.h>
>  #include <linux/pwm.h>
>  #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> =20
>  /* I2C registers of the microcontroller. */
>  #define REG_ID		0x01
> @@ -66,10 +67,21 @@ static int rpi_panel_v2_i2c_probe(struct i2c_client *=
i2c)
>  		.parent		=3D &i2c->dev,
>  		.reg_set_base	=3D REG_POWERON,
>  	};
> +	struct regulator *vcc;
>  	struct regmap *regmap;
>  	struct pwm_chip *pc;
>  	int ret;
> =20
> +	vcc =3D devm_regulator_get(&i2c->dev, "vcc");
> +	if (IS_ERR(vcc))
> +		return dev_err_probe(&i2c->dev, PTR_ERR(vcc),
> +				     "Failed to get vcc supply\n");
> +
> +	ret =3D regulator_enable(vcc);
> +	if (ret)
> +		return dev_err_probe(&i2c->dev, ret,
> +				     "Failed to enable vcc supply\n");

This needs to be optional, because without it you'll break existing
devicetrees. Unless you can explain how all existing users are
nonfunctional (e.g. nothing ever enabled the supply, which seems
doubtful given this surely worked when it was added) this must remain
optional.

> +
>  	pc =3D devm_pwmchip_alloc(&i2c->dev, 1, 0);
>  	if (IS_ERR(pc))
>  		return PTR_ERR(pc);
>=20
> --=20
> 2.34.1
>=20

--+YZIrFJKHMKrE7Bh
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCap7vEAAKCRB4tDGHoIJi
0kslAQCRSNBPfFTOdOPa6RoPXdEO5NK95OlBE6pLnHapjVTsVQD+K6YXHc+BsFa0
BcF0yXOQpfUgKdiblUf12moIT4kd4g8=
=h7KC
-----END PGP SIGNATURE-----

--+YZIrFJKHMKrE7Bh--

