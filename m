Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCB1109B467
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 13:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pIBM5GvhPNTgAZAHERwf4gRbrHwq20qlED4oVIpA7+Y=; b=tWjc1JiCvZ2EhG6UFQ4n1wDM6n
	C20GDXdirb6yVl3tQbCSiQ9vrsRgnydzhSGM8Izp221XAcqB18n7+zRJwagmAxR+aABABRYfCNjHW
	SCGruqZzWTprij/Yrge87+yY2OBRWu453aeQlE4A1KvCY49iIs2ceRQY0zI37wPOHUsF6ex1emb7U
	9BZA2IoQaNfVQEDjxJ7D2TsIIeyfMZPbGvuKip3aW2D0/1Mg6RRyMDLwfXqCKDUn24J3FLa32PrUU
	M4DL74wIrcAoHEWFA1zlq2Oaq+YaCNIqp0UgaHp4OIVJR8GrWCOpOTJsiKJf+yl26RhyNt/t0zQmN
	tUiQh1sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Yq1-0000000CyxZ-1F1A;
	Tue, 31 Mar 2026 13:08:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Yq0-0000000Cyx4-2X1L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 13:08:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9BB2A60133;
	Tue, 31 Mar 2026 13:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26F71C19423;
	Tue, 31 Mar 2026 13:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774962535;
	bh=7G9vqJ4wgnpJpVy5WKsHllojY9IC+YZBWuAMWGOZ1wI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P1b8yC8JyR4L1I+FqhRjqgpHUVOJKsajNu8+ZCU+ga9haoQ8sMrU9y/vwlj+fNd/P
	 cuZKWYbwf1c0KooGYpeeKVsv6qryybEchw769h8nrtclQAsQlC8rJ2RsUgYQJ0yohO
	 0qpnw62jqBV1rKGmhdSLRIx3vrWNJbbQPCw1IpfCMtz8WAp6IxiaTja0s1PO8Vx0H5
	 4uskdqK1cExqK7W9lBTARlkVbJQujCLGjnfz29NZ1okFh/Y+1DtFkFpUAe6iUC42gI
	 vfC6WE8XhxJPAgRA/eHlAu4cfsALbSGxD77OAgHjf7J6M1gvcJCViRq3RZMlKjPFWd
	 mMs1U3SpSnW7Q==
Date: Tue, 31 Mar 2026 14:08:48 +0100
From: Lee Jones <lee@kernel.org>
To: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?iso-8859-1?Q?J=E9r=E9mie?= Dautheribes <jeremie.dautheribes@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 3/5] mfd: aaeon: Add SRG-IMX8P MCU driver
Message-ID: <20260331130848.GG3795166@google.com>
References: <20260324-dev-b4-aaeon-mcu-driver-v4-0-afb011df4794@bootlin.com>
 <20260324-dev-b4-aaeon-mcu-driver-v4-3-afb011df4794@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260324-dev-b4-aaeon-mcu-driver-v4-3-afb011df4794@bootlin.com>
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

On Tue, 24 Mar 2026, Thomas Perrot (Schneider Electric) wrote:

> Add Multi-Function Device (MFD) driver for the Aaeon SRG-IMX8P
> embedded controller. This driver provides the core I2C communication
> interface and registers child devices (GPIO and watchdog controllers).
> 
> The driver implements a custom regmap bus over I2C to match the MCU's
> fixed 3-byte command format [opcode, arg, value]. Register addresses
> are encoded as 16-bit values (opcode << 8 | arg) using the
> AAEON_MCU_REG() macro defined in the shared header. The regmap
> instance is shared with child drivers via dev_get_regmap(). Concurrent
> I2C accesses from child drivers are serialized by regmap's built-in
> locking.
> 
> Co-developed-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
> Signed-off-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
> Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
> ---
>  MAINTAINERS                   |   2 +
>  drivers/mfd/Kconfig           |  10 +++
>  drivers/mfd/Makefile          |   1 +
>  drivers/mfd/aaeon-mcu.c       | 155 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/aaeon-mcu.h |  20 ++++++
>  5 files changed, 188 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ea9d55f76f3509c7f6ba6d1bc86ca2e2e71aa954..f91b6a1826d04bef8a0f88221f6c8e8a3652cd77 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -191,6 +191,8 @@ M:	Thomas Perrot <thomas.perrot@bootlin.com>
>  R:	Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/mfd/aaeon,srg-imx8p-mcu.yaml
> +F:	drivers/mfd/aaeon-mcu.c
> +F:	include/linux/mfd/aaeon-mcu.h
>  
>  AAEON UPBOARD FPGA MFD DRIVER
>  M:	Thomas Richard <thomas.richard@bootlin.com>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index aace5766b38aa5e46e32a8a7b42eea238159fbcf..7a1ceedece899faad7a03a1fe7b1c91b72253c05 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1574,6 +1574,16 @@ config AB8500_CORE
>  	  the irq_chip parts for handling the Mixed Signal chip events.
>  	  This chip embeds various other multimedia functionalities as well.
>  
> +config MFD_AAEON_MCU
> +	tristate "Aaeon SRG-IMX8P MCU Driver"
> +	depends on I2C || COMPILE_TEST
> +	select MFD_CORE
> +	help
> +	  Select this option to enable support for the Aaeon SRG-IMX8P
> +	  onboard microcontroller (MCU). This driver provides the core
> +	  functionality to communicate with the MCU over I2C. The MCU
> +	  provides GPIO and watchdog functionality.
> +
>  config MFD_DB8500_PRCMU
>  	bool "ST-Ericsson DB8500 Power Reset Control Management Unit"
>  	depends on UX500_SOC_DB8500
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index e75e8045c28afae975ac61d282b3b85af5440119..34db5b033584368b7a269b1eef12528a74baf8f5 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_MFD_88PM860X)	+= 88pm860x.o
>  obj-$(CONFIG_MFD_88PM800)	+= 88pm800.o 88pm80x.o
>  obj-$(CONFIG_MFD_88PM805)	+= 88pm805.o 88pm80x.o
>  obj-$(CONFIG_MFD_88PM886_PMIC)	+= 88pm886.o
> +obj-$(CONFIG_MFD_AAEON_MCU)	+= aaeon-mcu.o
>  obj-$(CONFIG_MFD_ACT8945A)	+= act8945a.o
>  obj-$(CONFIG_MFD_SM501)		+= sm501.o
>  obj-$(CONFIG_ARCH_BCM2835)	+= bcm2835-pm.o
> diff --git a/drivers/mfd/aaeon-mcu.c b/drivers/mfd/aaeon-mcu.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..5a969890d201c027eb25c324b4d4d89b1f8c563e
> --- /dev/null
> +++ b/drivers/mfd/aaeon-mcu.c
> @@ -0,0 +1,155 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Aaeon MCU driver
> + *
> + * Copyright (C) 2025 Bootlin
> + * Author: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
> + * Author: Thomas Perrot <thomas.perrot@bootlin.com>
> + */

Consider updating the Copyright date - we're pretty deep into 2026 at this point.

> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/mfd/core.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +static const struct mfd_cell aaeon_mcu_devs[] = {
> +	{
> +		.name = "aaeon-mcu-wdt",
> +	},
> +	{
> +		.name = "aaeon-mcu-gpio",
> +	},
> +};

MFD_CELL_BASIC()

> +/*
> + * Custom regmap bus for the Aaeon MCU I2C protocol.
> + *
> + * The MCU uses a fixed 3-byte command format [opcode, arg, value] followed
> + * by a 1-byte response.  It requires a STOP condition between the command
> + * write and the response read, so two separate i2c_transfer() calls are
> + * issued.  The regmap lock serialises concurrent accesses from the GPIO
> + * and watchdog child drivers.
> + *
> + * Register addresses are encoded as a 16-bit big-endian value where the
> + * high byte is the opcode and the low byte is the argument, matching the
> + * wire layout produced by regmap for reg_bits=16.
> + */
> +
> +static int aaeon_mcu_regmap_write(void *context, const void *data, size_t count)
> +{
> +	struct i2c_client *client = context;
> +	/* data = [opcode, arg, value] as formatted by regmap */
> +	struct i2c_msg write_msg = {
> +		.addr  = client->addr,
> +		.flags = 0,
> +		.buf   = (u8 *)data,
> +		.len   = count,
> +	};
> +	u8 rsp;
> +	/* The MCU always sends a response byte after each command; discard it. */
> +	struct i2c_msg rsp_msg = {

Assuming 'rsp' means response, let's just write that out in full.

Readability wins over brevity every time.

> +		.addr  = client->addr,
> +		.flags = I2C_M_RD,
> +		.buf   = &rsp,
> +		.len   = 1,
> +	};
> +	int ret;

Since some I2C host controllers might use DMA, should we ensure that the
'rsp' buffer is allocated in DMA-safe memory rather than on the stack to
prevent potential cache-line corruption?

Also allocation of structs during in declaration statements is rough!

And adding that u8 in the middle is just rubbing it in.

> +	ret = i2c_transfer(client->adapter, &write_msg, 1);
> +	if (ret < 0)
> +		return ret;
> +	if (ret != 1)
> +		return -EIO;
> +
> +	ret = i2c_transfer(client->adapter, &rsp_msg, 1);
> +	if (ret < 0)
> +		return ret;
> +	if (ret != 1)
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static int aaeon_mcu_regmap_read(void *context, const void *reg_buf,
> +				 size_t reg_size, void *val_buf, size_t val_size)
> +{
> +	struct i2c_client *client = context;
> +	/*
> +	 * reg_buf holds the 2-byte big-endian register address [opcode, arg].
> +	 * Append a trailing 0x00 to form the full 3-byte MCU command.
> +	 */
> +	u8 cmd[3] = { ((u8 *)reg_buf)[0], ((u8 *)reg_buf)[1], 0x00 };
> +	struct i2c_msg write_msg = {
> +		.addr  = client->addr,
> +		.flags = 0,
> +		.buf   = cmd,
> +		.len   = sizeof(cmd),
> +	};
> +	struct i2c_msg read_msg = {
> +		.addr  = client->addr,
> +		.flags = I2C_M_RD,
> +		.buf   = val_buf,
> +		.len   = val_size,
> +	};
> +	int ret;
> +
> +	ret = i2c_transfer(client->adapter, &write_msg, 1);
> +	if (ret < 0)
> +		return ret;
> +	if (ret != 1)
> +		return -EIO;
> +
> +	ret = i2c_transfer(client->adapter, &read_msg, 1);
> +	if (ret < 0)
> +		return ret;
> +	if (ret != 1)
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static const struct regmap_bus aaeon_mcu_regmap_bus = {
> +	.write = aaeon_mcu_regmap_write,
> +	.read  = aaeon_mcu_regmap_read,
> +};
> +
> +static const struct regmap_config aaeon_mcu_regmap_config = {
> +	.reg_bits          = 16,
> +	.val_bits          = 8,
> +	.reg_format_endian = REGMAP_ENDIAN_BIG,
> +	.cache_type        = REGCACHE_NONE,

Are you sure?  Why none?

> +};
> +
> +static int aaeon_mcu_probe(struct i2c_client *client)
> +{
> +	struct regmap *regmap;
> +
> +	regmap = devm_regmap_init(&client->dev, &aaeon_mcu_regmap_bus,
> +				  client, &aaeon_mcu_regmap_config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);

dev_err_probe()

> +
> +	return devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
> +				    aaeon_mcu_devs, ARRAY_SIZE(aaeon_mcu_devs),
> +				    NULL, 0, NULL);

Why PLATFORM_DEVID_NONE over AUTO here?

> +}
> +
> +static const struct of_device_id aaeon_mcu_of_match[] = {
> +	{ .compatible = "aaeon,srg-imx8p-mcu" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, aaeon_mcu_of_match);
> +
> +static struct i2c_driver aaeon_mcu_driver = {
> +	.driver = {
> +		.name = "aaeon_mcu",
> +		.of_match_table = aaeon_mcu_of_match,
> +	},
> +	.probe = aaeon_mcu_probe,
> +};
> +module_i2c_driver(aaeon_mcu_driver);
> +
> +MODULE_DESCRIPTION("Aaeon MCU Driver");
> +MODULE_AUTHOR("Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/aaeon-mcu.h b/include/linux/mfd/aaeon-mcu.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..861003f6dfd20424c3785008bd2cf89aaa1715b9
> --- /dev/null
> +++ b/include/linux/mfd/aaeon-mcu.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Aaeon MCU driver definitions
> + *
> + * Copyright (C) 2025 Bootlin
> + * Author: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
> + * Author: Thomas Perrot <thomas.perrot@bootlin.com>
> + */

As above.

> +
> +#ifndef __LINUX_MFD_AAEON_MCU_H
> +#define __LINUX_MFD_AAEON_MCU_H
> +
> +/*
> + * MCU register address: the high byte is the command opcode, the low
> + * byte is the argument.  This matches the 3-byte wire format
> + * [opcode, arg, value] used by the MCU I2C protocol.
> + */
> +#define AAEON_MCU_REG(op, arg)	(((op) << 8) | (arg))

Where else is this used?

> +#endif /* __LINUX_MFD_AAEON_MCU_H */
> 
> -- 
> 2.53.0
> 

-- 
Lee Jones [李琼斯]

