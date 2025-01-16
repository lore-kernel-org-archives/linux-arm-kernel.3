Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4039BC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 18:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:To:From:References:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8lyvdil+OAHd9BneEih8vko6Ln4alGLZIq1J3kePtk=; b=u5G791KL6+Bz70y4HGtSIv1USZ
	GkAQnbWgec4m0BUnJR0NiQH+Am0JgP2mwQw6KGiYEh4/98LMPXkmOBTcKkg7Lz37U4B0dNa5LgMeO
	7UoaxeEvr84ZGvKlWVyX2ZcnCzAI9kbu0+ESXtEzeiOIXhOD2/YbTRJZ3bdJzGsjbAqaume6AGXPL
	vPaiR+q4uH8DBSwTNJPOIROmIYJgpIYRIDrtN8F9cDi5pYp5iLEUi6StUknGVT5808t6vhw4kMPFL
	Fc+lVJpxhSXgdRgye6qClwSzsH5p2I32OTXGnpmNGIQk4t+qerW0x8QEaxKQ5u+r1067aumZBF2Zu
	2aVRVBfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYUFU-0000000Fl9r-1ID9;
	Thu, 16 Jan 2025 18:05:44 +0000
Received: from smtp-69.smtpout.orange.fr ([80.12.242.69] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYUDO-0000000FklD-2QHi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 18:03:38 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id YUD3tq3Ijhk1BYUD6t9tt8; Thu, 16 Jan 2025 19:03:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1737050606;
	bh=C8lyvdil+OAHd9BneEih8vko6Ln4alGLZIq1J3kePtk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=FB4JL7P/BdyTXG7TvkfEKwzz7VWZNzs5aATrG78Z1bEvy2qDJ7Vmi8xiD9/A8YCXR
	 4G38/XoW3PILjyG2BfmODtiWAX0Rhoos+uaOIskD4FxQK8ktHOfUxoJIz+eDhYhM6S
	 Oanp0BLTzLNm4zJhPcbKXTs8MT5hO+2bM/m9D+9Sh2EBsnodjCTd1ILjcKlG4I0Kgg
	 KGyVCR5tHhR3y9I+5qu+wlbtkjYVxEUYX/6PpzVRnRsjjuT6hroFCFG3n6EjT4LFku
	 4AI3+i6MpBq8orXqR93xIJlGBiXsUtCTRfzaIkLt4qh3z6YD7IWK/E4R8NNfw/WYfv
	 9+EPrTWXo0rBQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 16 Jan 2025 19:03:26 +0100
X-ME-IP: 90.11.132.44
Message-ID: <3991ab78-d1a2-4cae-bea5-fb4dfa58aba3@wanadoo.fr>
Date: Thu, 16 Jan 2025 19:03:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] input: apple_z2: Add a driver for Apple Z2
 touchscreens
References: <20250115-z2-v4-0-d7361ab16ba0@gmail.com>
 <20250115-z2-v4-2-d7361ab16ba0@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: devnull+fnkl.kernel.gmail.com@kernel.org
Cc: alyssa@rosenzweig.io, asahi@lists.linux.dev, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
 fnkl.kernel@gmail.com, j@jannau.net, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, marcan@marcan.st, neal@gompa.dev,
 robh@kernel.org, rydberg@bitmath.org, sven@svenpeter.dev
In-Reply-To: <20250115-z2-v4-2-d7361ab16ba0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_100334_890442_8587CB32 
X-CRM114-Status: GOOD (  21.77  )
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

Le 15/01/2025 à 23:46, Sasha Finkelstein via B4 Relay a écrit :
> From: Sasha Finkelstein <fnkl.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Adds a driver for Apple touchscreens using the Z2 protocol.
> 
...

> +static int apple_z2_upload_firmware(struct apple_z2 *z2)
> +{
> +	const struct apple_z2_fw_hdr *fw_hdr;
> +	size_t fw_idx = sizeof(struct apple_z2_fw_hdr);
> +	int error;
> +	u32 load_cmd;
> +	u32 size;
> +	u32 address;
> +	char *data;
> +	bool init;
> +	size_t cal_size;
> +
> +	const struct firmware *fw __free(firmware) = NULL;
> +	error = request_firmware(&fw, z2->fw_name, &z2->spidev->dev);
> +	if (error) {
> +		dev_err(&z2->spidev->dev, "unable to load firmware");
> +		return error;
> +	}
> +
> +	fw_hdr = (const struct apple_z2_fw_hdr *)fw->data;
> +	if (le32_to_cpu(fw_hdr->magic) != APPLE_Z2_FW_MAGIC || le32_to_cpu(fw_hdr->version) != 1) {
> +		dev_err(&z2->spidev->dev, "invalid firmware header");
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * This will interrupt the upload half-way if the file is malformed
> +	 * As the device has no non-volatile storage to corrupt, and gets reset
> +	 * on boot anyway, this is fine.
> +	 */
> +	while (fw_idx < fw->size) {
> +		if (fw->size - fw_idx < 8) {
> +			dev_err(&z2->spidev->dev, "firmware malformed");
> +			return -EINVAL;
> +		}
> +
> +		load_cmd = le32_to_cpu(*(__le32 *)(fw->data + fw_idx));
> +		fw_idx += sizeof(u32);
> +		if (load_cmd == LOAD_COMMAND_INIT_PAYLOAD || load_cmd == LOAD_COMMAND_SEND_BLOB) {
> +			size = le32_to_cpu(*(__le32 *)(fw->data + fw_idx));
> +			fw_idx += sizeof(u32);
> +			if (fw->size - fw_idx < size) {
> +				dev_err(&z2->spidev->dev, "firmware malformed");
> +				return -EINVAL;
> +			}
> +			init = load_cmd == LOAD_COMMAND_INIT_PAYLOAD;
> +			error = apple_z2_send_firmware_blob(z2, fw->data + fw_idx,
> +							    size, init);
> +			if (error)
> +				return error;
> +			fw_idx += size;
> +		} else if (load_cmd == LOAD_COMMAND_SEND_CALIBRATION) {
> +			address = le32_to_cpu(*(u32 *)(fw->data + fw_idx));
> +			fw_idx += sizeof(u32);
> +			cal_size = device_property_count_u8(&z2->spidev->dev, CAL_PROP_NAME);
> +			if (cal_size != 0) {
> +				size = cal_size + sizeof(struct apple_z2_hbpp_blob_hdr) + 4;
> +				data = kzalloc(size, GFP_KERNEL);
> +				error = apple_z2_build_cal_blob(z2, address, cal_size, data);
> +				if (!error)
> +					error = apple_z2_send_firmware_blob(z2, data, size, 16);
> +				kfree(data);
> +				if (error)
> +					return error;
> +			}
> +		} else {
> +			dev_err(&z2->spidev->dev, "firmware malformed");

Missing \n.

> +			return -EINVAL;
> +		}
> +		if (fw_idx % 4 != 0)
> +			fw_idx += 4 - (fw_idx % 4);
> +	}
> +
> +
> +	z2->booted = true;
> +	apple_z2_read_packet(z2);
> +	return 0;
> +}

...

> +static int apple_z2_probe(struct spi_device *spi)
> +{
> +	struct device *dev = &spi->dev;
> +	struct apple_z2 *z2;
> +	int error;
> +
> +	z2 = devm_kzalloc(dev, sizeof(*z2), GFP_KERNEL);
> +	if (!z2)
> +		return -ENOMEM;
> +
> +	z2->tx_buf = devm_kzalloc(dev, sizeof(struct apple_z2_read_interrupt_cmd), GFP_KERNEL);
> +	z2->rx_buf = devm_kzalloc(dev, 4096, GFP_KERNEL);

This will allocate 8192 bytes because of the way the allocator works.
It needs around 40 bytes for the devm stuff + 4096 requested. So 
rounding rules will allocate 8192 bytes.

So either you could allocate "for free" much more space, or you could 
allocate (and document...)
	z2->rx_buf = devm_kzalloc(dev, 4096 - sizeof(struct devres), GFP_KERNEL);

or have an explicit devm_add_action_or_reset() that would require less 
memory, but would add some LoC.


See 
https://elixir.bootlin.com/linux/v6.13-rc3/source/drivers/base/devres.c#L97

> +	if (!z2->tx_buf || !z2->rx_buf)
> +		return -ENOMEM;
> +
> +	z2->spidev = spi;
> +	init_completion(&z2->boot_irq);
> +	spi_set_drvdata(spi, z2);
> +
> +	/* Reset the device on boot */
> +	z2->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(z2->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(z2->reset_gpio), "unable to get reset");
> +
> +	error = devm_request_threaded_irq(dev, z2->spidev->irq, NULL,
> +					apple_z2_irq, IRQF_ONESHOT | IRQF_NO_AUTOEN,
> +					"apple-z2-irq", spi);
> +	if (error)
> +		return dev_err_probe(dev, z2->spidev->irq, "unable to request irq");

Missing \n.

s/z2->spidev->irq/error/ ?

or maybe:
	return dev_err_probe(dev, error, "unable to request irq %d\n", 
z2->spidev->irq);

> +
> +	error = device_property_read_string(dev, "firmware-name", &z2->fw_name);
> +	if (error)
> +		return dev_err_probe(dev, error, "unable to get firmware name");

Missing \n.

> +
> +	z2->input_dev = devm_input_allocate_device(dev);
> +	if (!z2->input_dev)
> +		return -ENOMEM;
> +	z2->input_dev->name = (char *)spi_get_device_id(spi)->driver_data;
> +	z2->input_dev->phys = "apple_z2";
> +	z2->input_dev->id.bustype = BUS_SPI;
> +
> +	/* Allocate the axes before setting from DT */
> +	input_set_abs_params(z2->input_dev, ABS_MT_POSITION_X, 0, 0, 0, 0);
> +	input_set_abs_params(z2->input_dev, ABS_MT_POSITION_Y, 0, 0, 0, 0);
> +	touchscreen_parse_properties(z2->input_dev, true, &z2->props);
> +	input_abs_set_res(z2->input_dev, ABS_MT_POSITION_X, 100);
> +	input_abs_set_res(z2->input_dev, ABS_MT_POSITION_Y, 100);
> +	input_set_abs_params(z2->input_dev, ABS_MT_WIDTH_MAJOR, 0, 65535, 0, 0);
> +	input_set_abs_params(z2->input_dev, ABS_MT_WIDTH_MINOR, 0, 65535, 0, 0);
> +	input_set_abs_params(z2->input_dev, ABS_MT_TOUCH_MAJOR, 0, 65535, 0, 0);
> +	input_set_abs_params(z2->input_dev, ABS_MT_TOUCH_MINOR, 0, 65535, 0, 0);
> +	input_set_abs_params(z2->input_dev, ABS_MT_ORIENTATION, -32768, 32767, 0, 0);
> +
> +	input_set_drvdata(z2->input_dev, z2);

Is it needed? (there is no input_get_drvdata())

> +
> +	error = input_mt_init_slots(z2->input_dev, 256, INPUT_MT_DIRECT);
> +	if (error)
> +		return dev_err_probe(dev, error, "unable to initialize multitouch slots");

Missing \n.

> +
> +	error = input_register_device(z2->input_dev);
> +	if (error)
> +		return dev_err_probe(dev, error, "unable to register input device");

Missing \n.

> +
> +	/* Wait for device reset to finish */
> +	usleep_range(5000, 10000);
> +	error = apple_z2_boot(z2);
> +	if (error)
> +		return error;
> +	return 0;

Nitpick: These 4 lines could be just:
	return apple_z2_boot(z2);

> +}

...

> +static DEFINE_SIMPLE_DEV_PM_OPS(apple_z2_pm, apple_z2_suspend, apple_z2_resume);
> +
> +static const struct of_device_id apple_z2_of_match[] = {
> +	{ .compatible = "apple,j293-touchbar" },
> +	{ .compatible = "apple,j493-touchbar" },
> +	{},

Nitpick: Ending comma is not needed after a terminator.

> +};
> +MODULE_DEVICE_TABLE(of, apple_z2_of_match);
> +
> +static struct spi_device_id apple_z2_of_id[] = {
> +	{ .name = "j293-touchbar", .driver_data = (kernel_ulong_t)"MacBookPro17,1 Touch Bar" },
> +	{ .name = "j493-touchbar", .driver_data = (kernel_ulong_t)"Mac14,7 Touch Bar" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(spi, apple_z2_of_id);

...

CJ

