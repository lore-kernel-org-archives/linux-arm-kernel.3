Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE890D5E145
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 08:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQnIHXes/PIu7xKcKP5gDiivubB8+96uE/39S6p9A+I=; b=XzX4n9WSzFlTM1o2rlQRxDeDPJ
	v8l4TzHeFt7gfsk8ALoZZq/41m8ENpIVvuj1HbMO2bKDSS0NItK+2fgVmqjtsKZ1QW9Swcz1PwuBZ
	MgHC2rNxyTFsFCeXQz1ccFxrcCQRsFUNUz1BT2qlxV0RS5flfD2t+Oe2lYXcfIbmKcfafAffnBnqW
	hhD3ydFUmAp90elVG1eE8oARnRYmbjHugOOtrZeCK94aZ5DUWreQWCuz6SUZQQTZwJ+y1sUUtdUoy
	uupP9ZEnCBUdBE9ZYvVg4ho1vm4ocRghaM4nnJe67Fr0595FgozQruUoPz37w/zFCEneYY0Uv3/G3
	4jcviA4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Kl5-00000009r4t-0toU;
	Fri, 08 Nov 2024 08:54:23 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KZ5-00000009ov3-2QSv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 08:42:01 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1t9KYc-0001FV-RX; Fri, 08 Nov 2024 09:41:30 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1t9KYc-002al1-1U;
	Fri, 08 Nov 2024 09:41:30 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1t9KYc-0004IE-16;
	Fri, 08 Nov 2024 09:41:30 +0100
Date: Fri, 8 Nov 2024 09:41:30 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Carlos Song <carlos.song@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] iio: temperature: Add support for P3T1085
Message-ID: <20241108084130.5y46ot7ajha2oxrj@pengutronix.de>
References: <20241107-p3t1085-v1-0-9a76cb85673f@nxp.com>
 <20241107-p3t1085-v1-2-9a76cb85673f@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241107-p3t1085-v1-2-9a76cb85673f@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_004159_963050_12FDDC7F 
X-CRM114-Status: GOOD (  38.18  )
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

Hi Frank,

thanks for the patch, please see my comments inline.

On 24-11-07, Frank Li wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> Add basic function support for P3T1085 temperature sensor.
> 
> P3T1085UK is a temperature-to-digital converter with a -40 °C to +125 °C
> range. The device can be communicated by a controller via the 2-wire serial
> I3C (up to 12.5 MHz) and I2C (up to 3.4 MHz) interface.
> 
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/iio/temperature/Kconfig            |  1 +
>  drivers/iio/temperature/Makefile           |  2 +
>  drivers/iio/temperature/p3t/Kconfig        | 29 +++++++++++
>  drivers/iio/temperature/p3t/Makefile       |  5 ++
>  drivers/iio/temperature/p3t/p3t1085.h      | 31 ++++++++++++
>  drivers/iio/temperature/p3t/p3t1085_core.c | 79 ++++++++++++++++++++++++++++++
>  drivers/iio/temperature/p3t/p3t1085_i2c.c  | 68 +++++++++++++++++++++++++
>  drivers/iio/temperature/p3t/p3t1085_i3c.c  | 59 ++++++++++++++++++++++
>  8 files changed, 274 insertions(+)
> 
> diff --git a/drivers/iio/temperature/Kconfig b/drivers/iio/temperature/Kconfig
> index 1244d8e17d504..7cdd49279aba2 100644
> --- a/drivers/iio/temperature/Kconfig
> +++ b/drivers/iio/temperature/Kconfig
> @@ -182,4 +182,5 @@ config MCP9600
>  	  This driver can also be built as a module. If so, the module
>  	  will be called mcp9600.
>  
> +source "drivers/iio/temperature/p3t/Kconfig"
>  endmenu
> diff --git a/drivers/iio/temperature/Makefile b/drivers/iio/temperature/Makefile
> index 07d6e65709f7f..d5e89c20d58b6 100644
> --- a/drivers/iio/temperature/Makefile
> +++ b/drivers/iio/temperature/Makefile
> @@ -19,3 +19,5 @@ obj-$(CONFIG_TMP007) += tmp007.o
>  obj-$(CONFIG_TMP117) += tmp117.o
>  obj-$(CONFIG_TSYS01) += tsys01.o
>  obj-$(CONFIG_TSYS02D) += tsys02d.o
> +
> +obj-y += p3t/
> diff --git a/drivers/iio/temperature/p3t/Kconfig b/drivers/iio/temperature/p3t/Kconfig
> new file mode 100644
> index 0000000000000..09e925024b66f
> --- /dev/null
> +++ b/drivers/iio/temperature/p3t/Kconfig
> @@ -0,0 +1,29 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config IIO_P3T1085
> +	tristate
> +	depends on (I2C || I3C)
> +
> +config IIO_P3T1085_I2C
> +	tristate "NXP P3T1085 temperature sensor I2C driver"
> +	depends on I2C
> +	select IIO_P3T1085
> +	select REGMAP_I2C
> +	help
> +	  Say yes here to build support for NXP P3T1085 I2C temperature
> +	  sensor.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called p3t1085_i2c
> +
> +config IIO_P3T1085_I3C
> +	tristate "NXP P3T1085 temperature sensor I3C driver"
> +	depends on I3C
> +	select IIO_P3T1085
> +	select REGMAP_I3C
> +	help
> +	  Say yes here to build support for NXP P3T1085 I3C temperature
> +	  sensor.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called p3t1085_i3c
> diff --git a/drivers/iio/temperature/p3t/Makefile b/drivers/iio/temperature/p3t/Makefile
> new file mode 100644
> index 0000000000000..21aaeb51e044d
> --- /dev/null
> +++ b/drivers/iio/temperature/p3t/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-$(CONFIG_IIO_P3T1085) += p3t1085_core.o
> +obj-$(CONFIG_IIO_P3T1085_I2C) += p3t1085_i2c.o
> +obj-$(CONFIG_IIO_P3T1085_I3C) += p3t1085_i3c.o
> diff --git a/drivers/iio/temperature/p3t/p3t1085.h b/drivers/iio/temperature/p3t/p3t1085.h
> new file mode 100644
> index 0000000000000..b018a04e4aee4
> --- /dev/null
> +++ b/drivers/iio/temperature/p3t/p3t1085.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * NXP P3T1085 Temperature Sensor Driver
> + *
> + * Copyright 2024 NXP
> + */
> +#ifndef P3T1085_H
> +#define P3T1085_H
> +
> +#include <linux/device.h>
> +#include <linux/iio/iio.h>
> +
> +#define P3T1085_REG_TEMP		0x0

This define can be moved into the core since the _i2c nor the _i3c is
uses it.

> +#define P3T1085_REG_CFGR		0x1
> +#define P3T1085_REG_HIGH_LIM		0x2
> +#define P3T1085_REG_LOW_LIM		0x3
> +
> +#define P3T1085_RESOLUTION_10UC		62500

All three defines are not used, please remove it.

> +
> +enum p3t1085_hw_id {
> +	P3T1085_ID,
> +};

Is this id really required? We should keep the driver simple for now and
extend it on demand.

> +struct p3t1085_data {
> +	struct device *dev;
> +	struct regmap *regmap;
> +};

This belongs to the core.c

> +int p3t1085_probe(struct device *dev, int irq, int hw_id, struct regmap *regmap);
					     ^		^
					    unsused params
> +
> +#endif /* P3T1085_H */
> diff --git a/drivers/iio/temperature/p3t/p3t1085_core.c b/drivers/iio/temperature/p3t/p3t1085_core.c
> new file mode 100644
> index 0000000000000..4b00e606a6d04
> --- /dev/null
> +++ b/drivers/iio/temperature/p3t/p3t1085_core.c
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * NXP P3T1085 Temperature Sensor Driver
> + *
> + * Copyright 2024 NXP
> + */
> +#include <linux/bitops.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/iio/iio.h>
> +#include <linux/iio/sysfs.h>
> +#include <linux/kernel.h>
> +#include <linux/limits.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +
> +#include "p3t1085.h"
> +
> +static int p3t1085_read_raw(struct iio_dev *indio_dev,
> +			    struct iio_chan_spec const *channel, int *val,
> +			    int *val2, long mask)
> +{
> +	struct p3t1085_data *data = iio_priv(indio_dev);
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		ret = regmap_read(data->regmap, P3T1085_REG_TEMP, val);
> +		if (ret < 0) {
> +			dev_err(data->dev, "failed to read temperature register\n");
> +			return ret;
> +		}
> +		*val = *val >> 4;
> +		return IIO_VAL_INT;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static const struct iio_chan_spec p3t1085_channels[] = {
> +	{
> +		.type = IIO_TEMP,
> +		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
> +	},
> +};
> +
> +static const struct iio_info p3t1085_info = {
> +	.read_raw = p3t1085_read_raw,
> +};
> +
> +int p3t1085_probe(struct device *dev, int irq, int hw_id, struct regmap *regmap)
					   ^           ^
As written abvoe, both params are unused so can you please drop them?

> +{
> +	struct p3t1085_data *data;
> +	struct iio_dev *iio_dev;
> +
> +	iio_dev = devm_iio_device_alloc(dev, sizeof(*data));
> +	if (!iio_dev)
> +		return -ENOMEM;
> +
> +	data = iio_priv(iio_dev);
> +	data->dev = dev;
> +	data->regmap = regmap;
> +
> +	iio_dev->name = "p3t1085";
> +	iio_dev->modes = INDIO_DIRECT_MODE;
> +	iio_dev->info = &p3t1085_info;
> +
> +	iio_dev->channels = p3t1085_channels;
> +	iio_dev->num_channels = ARRAY_SIZE(p3t1085_channels);
> +
> +	return devm_iio_device_register(dev, iio_dev);
> +}
> +EXPORT_SYMBOL_NS(p3t1085_probe, IIO_P3T1085);
> +
> +MODULE_AUTHOR("Xiaoning Wang <xiaoning.wang@nxp.com>");
> +MODULE_DESCRIPTION("NXP P3T1085 driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/iio/temperature/p3t/p3t1085_i2c.c b/drivers/iio/temperature/p3t/p3t1085_i2c.c
> new file mode 100644
> index 0000000000000..20e5f7a68dd9e
> --- /dev/null
> +++ b/drivers/iio/temperature/p3t/p3t1085_i2c.c
> @@ -0,0 +1,68 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * NXP P3T1085 Temperature Sensor Driver
> + *
> + * Copyright 2024 NXP
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +#include "p3t1085.h"
> +
> +static const struct regmap_config p3t1085_i2c_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 16,
> +};
> +
> +static int p3t1085_i2c_probe(struct i2c_client *client)
> +{
> +	const struct i2c_device_id *id;
> +	struct regmap *regmap;
> +	int ret;
> +
> +	id = i2c_client_get_device_id(client);
> +	if (!id)
> +		return -EINVAL;

At the moment only one devices is supported therefore I would like drop
passing the id to the p3t1085_probe function.

> +	regmap = devm_regmap_init_i2c(client, &p3t1085_i2c_regmap_config);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(regmap),
> +				     "Failed to register i2c regmap %ld\n", PTR_ERR(regmap));
> +
> +	ret = p3t1085_probe(&client->dev, client->irq, id->driver_data, regmap);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret, "Failed to probe\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id p3t1085_i2c_of_match[] = {
> +	{ .compatible = "nxp,p3t1085", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, p3t1085_i2c_of_match);
> +
> +static const struct i2c_device_id p3t1085_i2c_id_table[] = {
> +	{ "p3t1085", P3T1085_ID },
			^
		This can be dropped
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, p3t1085_i2c_id_table);
> +
> +static struct i2c_driver p3t1085_driver = {
> +	.driver = {
> +		.name = "p3t1085_i2c",
> +		.of_match_table = p3t1085_i2c_of_match,
> +	},
> +	.probe = p3t1085_i2c_probe,
> +	.id_table = p3t1085_i2c_id_table,
> +};
> +module_i2c_driver(p3t1085_driver);
> +
> +MODULE_AUTHOR("Xiaoning Wang <xiaoning.wang@nxp.com>");
> +MODULE_DESCRIPTION("NXP P3T1085 i2c driver");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(IIO_P3T1085);
> diff --git a/drivers/iio/temperature/p3t/p3t1085_i3c.c b/drivers/iio/temperature/p3t/p3t1085_i3c.c
> new file mode 100644
> index 0000000000000..0007d79aa0a6d
> --- /dev/null
> +++ b/drivers/iio/temperature/p3t/p3t1085_i3c.c
> @@ -0,0 +1,59 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * NXP P3T1085 Temperature Sensor Driver
> + *
> + * Copyright 2024 NXP
> + */
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/i3c/device.h>
> +#include <linux/i3c/master.h>
> +#include <linux/slab.h>
> +#include <linux/regmap.h>
> +
> +#include "p3t1085.h"
> +
> +static const struct i3c_device_id p3t1085_i3c_ids[] = {
> +	I3C_DEVICE(0x011B, 0x1529, (void *)P3T1085_ID),
						^
					here as well.
> +	{ /* sentinel */ },

Nit: Can you please align your "sentinel" style. Either with or without
the comment. Also the of_device_id is missing for the i3c case.

> +};
> +MODULE_DEVICE_TABLE(i3c, p3t1085_i3c_ids);
> +
> +static int p3t1085_i3c_probe(struct i3c_device *i3cdev)
> +{
> +	const struct regmap_config p3t1085_i3c_regmap_config = {
> +		.reg_bits = 8,
> +		.val_bits = 16,
> +	};

Please align the style with the i2c module.

> +	int ret;
> +
> +	const struct i3c_device_id *id = i3c_device_match_id(i3cdev,
> +							    p3t1085_i3c_ids);

Same here, we don't need to consider different ids yet.

> +	struct regmap *regmap;
> +
> +	regmap = devm_regmap_init_i3c(i3cdev, &p3t1085_i3c_regmap_config);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(&i3cdev->dev, PTR_ERR(regmap),
> +				     "Failed to register i3c regmap\n");
> +
> +	ret = p3t1085_probe(&i3cdev->dev, 0, (uintptr_t)id->data, regmap);
> +	if (ret)
> +		return dev_err_probe(&i3cdev->dev, ret, "Failed to probe\n");
> +
> +	return 0;
> +}
> +
> +static struct i3c_driver p3t1085_driver = {
> +	.driver = {
> +		.name = "p3t1085_i3c",
> +	},
> +	.probe = p3t1085_i3c_probe,
> +	.id_table = p3t1085_i3c_ids,
> +};
> +module_i3c_driver(p3t1085_driver);
> +
> +MODULE_AUTHOR("Xiaoning Wang <xiaoning.wang@nxp.com>");
> +MODULE_DESCRIPTION("NXP p3t1085 i3c driver");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS(IIO_P3T1085);
> 
> -- 
> 2.34.1
> 
> 
> 

