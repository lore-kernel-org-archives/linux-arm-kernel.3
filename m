Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FDFC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 11:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gPSMssSvsei07PxroFCthED2AzKm3q7L8MtcZbCIadA=; b=pfuYWJj9aPprEzWJb7Rmh8akQu
	dHA5EanJbn1qYXqeU2xw+sP60O3qa68vTruetCx43y9zeZjk/ifIWTCrlbL1gKEQ2ntQXr68OdhLl
	KAdRX16GHW45bCIN2AIVoZ9abEyg2CZULtJXNXIr0/BOp3g/OybuWQmlYXhjtpzpqCnwbqaCkaIp6
	9ZyjA0zhpJYJUC6+Tiy6tRs2ZgQHuIa37+IejOKckrhpwCEY9RRjevzwvnpt5lVhJ+MltD9eQExOU
	dNFRqpHjfPlZLSK2ivsB0keJWAskPowBFtC8x8/T3azL3fV6V51ARDnnbKf8SwQZAfquwkmA4G5mV
	ddHY9j8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiuIW-0000000Elq1-3Uyw;
	Fri, 14 Feb 2025 11:55:56 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiuH5-0000000ElGH-0Gd9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 11:54:28 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tiuGw-0007wn-Ob; Fri, 14 Feb 2025 12:54:18 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tiuGv-000uUu-2E;
	Fri, 14 Feb 2025 12:54:17 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tiuGv-0005mD-1x;
	Fri, 14 Feb 2025 12:54:17 +0100
Message-ID: <6dd9ed2750abe1f5174805673411ccb919ee5461.camel@pengutronix.de>
Subject: Re: [PATCH 1/4] [PATCH 1/4] reset: simple: Add syscon device
 compatible
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Wilson Ding <dingwei@marvell.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: andrew@lunn.ch, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, salee@marvell.com, gakula@marvell.com
Date: Fri, 14 Feb 2025 12:54:17 +0100
In-Reply-To: <20250214065833.530276-3-dingwei@marvell.com>
References: <20250214065833.530276-1-dingwei@marvell.com>
	 <20250214065833.530276-3-dingwei@marvell.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_035427_102149_364F7C9E 
X-CRM114-Status: GOOD (  21.24  )
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

On Do, 2025-02-13 at 22:58 -0800, Wilson Ding wrote:
> Introduce the new ops for updating reset line and getting status. Thus,
> the reset controller can be accessed through either direct I/O or regmap
> interfaces.

Please don't add a new layer of function pointer indirection, just add
a new struct reset_control_ops for the regmap variant.

> It enables the support of the syscon devices with the simple
> reset code. To adapt the DT binding of the syscon device, the number of
> reset lines must be specified in device data.

If the DT node had a reg property, number of reset lines could be
determined from its size, like for MMIO.

> Signed-off-by: Wilson Ding <dingwei@marvell.com>
> ---
>  drivers/reset/reset-simple.c       | 117 +++++++++++++++++++++++------
>  include/linux/reset/reset-simple.h |  11 +++
>  2 files changed, 107 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
> index 276067839830..e4e777d40a79 100644
> --- a/drivers/reset/reset-simple.c
> +++ b/drivers/reset/reset-simple.c
> @@ -15,8 +15,10 @@
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/io.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>  #include <linux/reset-controller.h>
>  #include <linux/reset/reset-simple.h>
>  #include <linux/spinlock.h>
> @@ -27,10 +29,9 @@ to_reset_simple_data(struct reset_controller_dev *rcde=
v)
>  	return container_of(rcdev, struct reset_simple_data, rcdev);
>  }
> =20
> -static int reset_simple_update(struct reset_controller_dev *rcdev,
> +static int reset_simple_update_mmio(struct reset_simple_data *data,
>  			       unsigned long id, bool assert)

No need to rename or change the function prototype.

>  {
> -	struct reset_simple_data *data =3D to_reset_simple_data(rcdev);
>  	int reg_width =3D sizeof(u32);
>  	int bank =3D id / (reg_width * BITS_PER_BYTE);
>  	int offset =3D id % (reg_width * BITS_PER_BYTE);
> @@ -51,16 +52,40 @@ static int reset_simple_update(struct reset_controlle=
r_dev *rcdev,
>  	return 0;
>  }
> =20
> +static int reset_simple_update_regmap(struct reset_simple_data *data,
> +				      unsigned long id, bool assert)

I'd call this reset_simple_regmap_update().

> +{
> +	int reg_width =3D sizeof(u32);
> +	int bank =3D id / (reg_width * BITS_PER_BYTE);
> +	int offset =3D id % (reg_width * BITS_PER_BYTE);
> +	u32 mask, val;
> +
> +	mask =3D BIT(offset);
> +
> +	if (assert ^ data->active_low)
> +		val =3D mask;
> +	else
> +		val =3D 0;
> +
> +	return regmap_write_bits(data->regmap,
> +				 data->reg_offset + (bank * reg_width),
> +				 mask, val);
> +}
> +
>  static int reset_simple_assert(struct reset_controller_dev *rcdev,
>  			       unsigned long id)
>  {
> -	return reset_simple_update(rcdev, id, true);
> +	struct reset_simple_data *data =3D to_reset_simple_data(rcdev);
> +
> +	return data->ops.update(data, id, true);
>  }
> =20
>  static int reset_simple_deassert(struct reset_controller_dev *rcdev,
>  				 unsigned long id)
>  {
> -	return reset_simple_update(rcdev, id, false);
> +	struct reset_simple_data *data =3D to_reset_simple_data(rcdev);
> +
> +	return data->ops.update(data, id, false);
>  }

No need for indirection. Better to just add separate
reset_simple_regmap_assert/deassert() functions.

>  static int reset_simple_reset(struct reset_controller_dev *rcdev,
> @@ -81,10 +106,9 @@ static int reset_simple_reset(struct reset_controller=
_dev *rcdev,
>  	return reset_simple_deassert(rcdev, id);
>  }
> =20
> -static int reset_simple_status(struct reset_controller_dev *rcdev,
> -			       unsigned long id)
> +static int reset_simple_status_mmio(struct reset_simple_data *data,
> +			     unsigned long id)
>  {
> -	struct reset_simple_data *data =3D to_reset_simple_data(rcdev);
>  	int reg_width =3D sizeof(u32);
>  	int bank =3D id / (reg_width * BITS_PER_BYTE);
>  	int offset =3D id % (reg_width * BITS_PER_BYTE);
> @@ -95,6 +119,31 @@ static int reset_simple_status(struct reset_controlle=
r_dev *rcdev,
>  	return !(reg & BIT(offset)) ^ !data->status_active_low;
>  }
> =20
> +static int reset_simple_status_regmap(struct reset_simple_data *data,
> +				    unsigned long id)
> +{
> +	int reg_width =3D sizeof(u32);
> +	int bank =3D id / (reg_width * BITS_PER_BYTE);
> +	int offset =3D id % (reg_width * BITS_PER_BYTE);
> +	u32 reg;
> +	int ret;
> +
> +	ret =3D regmap_read(data->regmap, data->reg_offset + (bank * reg_width)=
,
> +			  &reg);
> +	if (ret)
> +		return ret;
> +
> +	return !(reg & BIT(offset)) ^ !data->status_active_low;
> +}
> +
> +static int reset_simple_status(struct reset_controller_dev *rcdev,
> +			       unsigned long id)
> +{
> +	struct reset_simple_data *data =3D to_reset_simple_data(rcdev);
> +
> +	return data->ops.status(data, id);
> +}

Same as above, no need for indirection.
Just add separate reset_simple_regmap_assert/deassert() functions ...

> +
>  const struct reset_control_ops reset_simple_ops =3D {
>  	.assert		=3D reset_simple_assert,
>  	.deassert	=3D reset_simple_deassert,

... and add a const struct reset_control_ops reset_simple_regmap_ops.

regards
Philipp

