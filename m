Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E1CD26D7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 17:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GIN4N34t8kyR31EL8UUDcPaXoe7yJkql91a6O7uSIiA=; b=I8t1H5lx0pr6elLgZJBMIeZTUv
	PCc0nP0czJr8EsvG5zoK/tMdzyEyMBfL8oEjPlAPhjxEARg3hhDEiJfpA2jz61KL+xgXnGYcEd1ti
	/a5V9Gm0jj8b/LIHwQ7EONQ4U0jJKd3NRfnuYKt/nU5Gub3gHjCanEagmaoGLj4m7NbpaZbQrm7Hs
	raVVdPJzaqiejX8VMnuTM01mkGnP9DG19Owg337A1/y1jvRjXwwU/ChayOAfTQ47b0EfHkSA/NVeu
	vum5/ln5q487/P9g2FaRODduap7lBW3sCBdJffLeOsDb3ZNGGJVbvyXW+0FFIqG6afjRHk40vLanX
	EFQOBbvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG4P-00000002lTD-31rZ;
	Fri, 09 Jan 2026 17:14:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG4O-00000002lT5-0Jqp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 17:14:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B13360150;
	Fri,  9 Jan 2026 17:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27DE6C4CEF1;
	Fri,  9 Jan 2026 17:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767978878;
	bh=2Tm0fMd5t0M2k+iJezPcvnpMr6g9radqhrx1rJMUG5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IW5eBFxM2WzqXDQHhWUVigQfGskKUAU/DRDQiFbFbX/N7F6u9DuhcQWOnPVJVXfLC
	 0mZkXZ6CysStt8rTACr0vu64CMePHRQxC4Qc0FWay8XVwjw3n4p41tBVmnJ7KjjHkU
	 hCiU2O2tg/vsI0/KOaGvNi0spLPf4SEyhZpEwEIk1+Htw2ikZ9XDCFFTfNsdc0LsnG
	 +bDZ5aMVGmb6iSpSSbpeOWzSP1IYlF25iobf+WO8WY2EPoUfr7BG4qXJrLKaAZAXAZ
	 o3CIZKbWKxSSb+WSO9xS4R9ydcOvEZry8JSn6xlBdwu2D3ZJ00WTjMNYhsCvkJ970P
	 tRzVxOa34NXrg==
Date: Fri, 9 Jan 2026 17:14:31 +0000
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 5/8] mfd: aaeon: Add SRG-IMX8PL MCU driver
Message-ID: <20260109171431.GE1808297@google.com>
References: <20251212-dev-b4-aaeon-mcu-driver-v1-0-6bd65bc8ef12@bootlin.com>
 <20251212-dev-b4-aaeon-mcu-driver-v1-5-6bd65bc8ef12@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251212-dev-b4-aaeon-mcu-driver-v1-5-6bd65bc8ef12@bootlin.com>
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

On Fri, 12 Dec 2025, Thomas Perrot (Schneider Electric) wrote:

> Add Multi-Function Device (MFD) driver for the Aaeon SRG-IMX8PL

Drop all mentions of MFD.  It's not a real thing - we made it up.

> embedded controller. This driver provides the core I2C communication
> interface and registers child devices (GPIO and watchdog controllers).
> 
> The MCU firmware version is queried during probe and logged for
> diagnostic purposes. All I2C transactions are serialized using a mutex
> to ensure proper communication with the microcontroller.
> 
> Co-developed-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
> Signed-off-by: Jérémie Dautheribes (Schneider Electric) <jeremie.dautheribes@bootlin.com>
> Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
> ---
>  drivers/mfd/Kconfig           |  10 ++++
>  drivers/mfd/aaeon-mcu.c       | 133 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/aaeon-mcu.h |  30 ++++++++++
>  3 files changed, 173 insertions(+)
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index aace5766b38aa5e46e32a8a7b42eea238159fbcf..9195115c7bcd619439cb9ff71d70e46629291867 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1574,6 +1574,16 @@ config AB8500_CORE
>  	  the irq_chip parts for handling the Mixed Signal chip events.
>  	  This chip embeds various other multimedia functionalities as well.
>  
> +config MFD_AAEON_MCU
> +	tristate "Aaeon SRG-IMX8PL MCU Driver"
> +	depends on I2C
> +	select MFD_CORE
> +	help
> +	  Select this option to enable support for the Aaeon SRG-IMX8PL
> +	  onboard microcontroller (MCU). This driver provides the core
> +	  functionality to communicate with the MCU over I2C. The MCU
> +	  provides various sub-devices including GPIO and watchdog controllers.

Is that an exhaustive list of sub-devices?

>  config MFD_DB8500_PRCMU
>  	bool "ST-Ericsson DB8500 Power Reset Control Management Unit"
>  	depends on UX500_SOC_DB8500
> diff --git a/drivers/mfd/aaeon-mcu.c b/drivers/mfd/aaeon-mcu.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..472d44d5e8627f46806015599542753a5bda4526
> --- /dev/null
> +++ b/drivers/mfd/aaeon-mcu.c
> @@ -0,0 +1,133 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Aaeon MCU MFD driver

Not MFD - describe the actual device.

> + *
> + * Copyright (C) 2025 Bootlin

Has it been agreed that you would hold the copyright to this?

> + * Author: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
> + * Author: Thomas Perrot <thomas.perrot@bootlin.com>
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/aaeon-mcu.h>

Alphabetical.

> +#define AAEON_MCU_GET_FW_VERSION 0x76

Is that what the register is called in the datasheet?

The GET part is odd.

> +static struct mfd_cell aaeon_mcu_devs[] = {
> +	{
> +		.name = "aaeon-mcu-wdt",
> +		.of_compatible = "aaeon,srg-imx8pl-wdt",
> +	},
> +	{
> +		.name = "aaeon-mcu-gpio",
> +		.of_compatible = "aaeon,srg-imx8pl-gpio",
> +	},
> +};
> +
> +static int aaeon_mcu_print_fw_version(struct i2c_client *client)
> +{
> +	u8 cmd[3], version[2];
> +	int ret;
> +
> +	/* Major version number */
> +	cmd[0] = AAEON_MCU_GET_FW_VERSION;
> +	cmd[1] = 0x00;
> +	cmd[2] = 0x00;
> +
> +	ret = aaeon_mcu_i2c_xfer(client, cmd, 3, &version[0], 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Minor version number */
> +	cmd[0] = AAEON_MCU_GET_FW_VERSION;
> +	cmd[1] = 0x01;
> +	/* cmd[2] = 0x00; */
> +
> +	ret = aaeon_mcu_i2c_xfer(client, cmd, 3, &version[1], 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	dev_info(&client->dev, "firmware version: v%d.%d\n",
> +		 version[0], version[1]);

What do you expect a user to do with this information?

Let's cut the debug cruft - you can add it again locally if you need to debug.

> +
> +	return 0;
> +}

Besides providing a questionable print, you don't seem to be doing
anything with this information - is it needed at all?

> +static int aaeon_mcu_probe(struct i2c_client *client)
> +{
> +	struct aaeon_mcu_dev *mcu;
> +	int ret;
> +
> +	mcu = devm_kzalloc(&client->dev, sizeof(*mcu), GFP_KERNEL);
> +	if (!mcu)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, mcu);

> +	mcu->dev = &client->dev;
> +	mcu->i2c_client = client;

How do you expect to be able to 'get' this data back if you do not have
the 'dev' or the 'client'?

> +	mutex_init(&mcu->i2c_lock);
> +
> +	ret = aaeon_mcu_print_fw_version(client);
> +	if (ret) {
> +		dev_err(&client->dev, "unable to read firmware version\n");
> +		return ret;
> +	}
> +
> +	return devm_mfd_add_devices(mcu->dev, PLATFORM_DEVID_NONE, aaeon_mcu_devs,
> +				    ARRAY_SIZE(aaeon_mcu_devs), NULL, 0, NULL);
> +}
> +
> +int aaeon_mcu_i2c_xfer(struct i2c_client *client,
> +		       const u8 *cmd, int cmd_len,
> +		       u8 *rsp, int rsp_len)
> +{
> +	struct aaeon_mcu_dev *mcu = i2c_get_clientdata(client);
> +	int ret;
> +
> +	mutex_lock(&mcu->i2c_lock);
> +
> +	ret = i2c_master_send(client, cmd, cmd_len);
> +	if (ret < 0)
> +		goto unlock;
> +
> +	ret = i2c_master_recv(client, rsp, rsp_len);
> +	if (ret < 0)
> +		goto unlock;

Isn't this all very generic?

I wonder how many similar functions there are in the kernel.

Worth making this global?

> +	if (ret != rsp_len) {
> +		dev_err(&client->dev,
> +			"i2c recv count error (expected: %d, actual: %d)\n",
> +			rsp_len, ret);
> +		ret = -EIO;
> +		goto unlock;
> +	}
> +
> +	ret = 0;
> +
> +unlock:
> +	mutex_unlock(&mcu->i2c_lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(aaeon_mcu_i2c_xfer);

This should be much further up.  At least above probe - perhaps higher.

> +static const struct of_device_id aaeon_mcu_of_match[] = {
> +	{ .compatible = "aaeon,srg-imx8pl-mcu" },
> +	{},
> +};
> +

Remove this line.

> +MODULE_DEVICE_TABLE(of, aaeon_mcu_of_match);
> +
> +static struct i2c_driver aaeon_mcu_driver = {
> +	.driver = {
> +		.name = "aaeon_mcu",
> +		.of_match_table = aaeon_mcu_of_match,
> +	},
> +	.probe = aaeon_mcu_probe,
> +};
> +

And this one.

> +module_i2c_driver(aaeon_mcu_driver);
> +
> +MODULE_DESCRIPTION("Aaeon MCU MFD Driver");

Not MFD.

> +MODULE_AUTHOR("Jérémie Dautheribes");

Email?

> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/aaeon-mcu.h b/include/linux/mfd/aaeon-mcu.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..89632cb46bc6c9518755dc43afb87faa94acb6f5
> --- /dev/null
> +++ b/include/linux/mfd/aaeon-mcu.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Aaeon MCU driver definitions
> + *
> + * Copyright (C) 2025 Bootlin
> + * Author: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
> + * Author: Thomas Perrot <thomas.perrot@bootlin.com>
> + */
> +
> +#ifndef __LINUX_MFD_AAEON_MCU_H
> +#define __LINUX_MFD_AAEON_MCU_H
> +
> +/**
> + * struct aaeon_mcu_dev - Internal representation of the Aaeon MCU
> + * @dev: Pointer to kernel device structure
> + * @i2c_client: Pointer to the Aaeon MCU I2C client
> + * @i2c_lock: Mutex to serialize I2C bus access
> + */
> +
> +struct aaeon_mcu_dev {
> +	struct device *dev;
> +	struct i2c_client *i2c_client;
> +	struct mutex i2c_lock;
> +};
> +
> +int aaeon_mcu_i2c_xfer(struct i2c_client *client,
> +		       const u8 *cmd, int cmd_len,
> +		       u8 *rsp, int rsp_len);
> +
> +#endif /*  __LINUX_MFD_AAEON_MCU_H */
> 
> -- 
> 2.52.0
> 

-- 
Lee Jones [李琼斯]

