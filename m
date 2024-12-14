Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A12FE7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 15:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:To:From:References:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFahc2HzyCvXQnoK6BCINAM58qqaizbdQbpLVvV+TfI=; b=XywvAh9a5dDe/A8F2CNUghcXhE
	8NxlTVjlpceeG7EtZS86MRp+3ZkXeIBxIKzwQNJhFD5k9rtMR4oDAnoyynAqInieCwadPwh2YpbdE
	DP+1r/Vp3w4IbDXf1a9tee25p+Pf1sOXSY1OJ2SdXmUjGS+KSsJh6Lq6Watbz3PjKXAibO7pAIKqX
	++reEQyHIc1eaiRs86XZMy31YBbGIztprXpkgTFJAz/kbB0XdWCExPZPaBJiHagvEjTMoWmRfLL5N
	nVEk2NM8o7c2lo6mM0fkbo1gjwJnt6o+n6bif30mF6o3qwlJavNFKFbl654nUIiciseEaQL244wSo
	HeR3p8mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMUSs-00000006aaG-3ZpU;
	Sat, 14 Dec 2024 15:53:59 +0000
Received: from smtp-28.smtpout.orange.fr ([80.12.242.28] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMURj-00000006aTF-2Kkr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 15:52:50 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id MURZtVKNtJaUfMURatNGQD; Sat, 14 Dec 2024 16:52:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1734191561;
	bh=FFahc2HzyCvXQnoK6BCINAM58qqaizbdQbpLVvV+TfI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=pbnN5hbtPGBiUlDVfQxFoZlGPM2Xm9VGhYHo0xpuItIfovPjV/Y4NFbQ/UledN0nv
	 1621E1Knoz3U6X2kC9u5FaEDCbdQIjsq62uK4u5PWrDVtEXpsVPu+vXd1sAcEM8aix
	 T+HUPr/wIK62pRB/LgN/sRNueIE1d1ZgMhfMci7EiPqJrbI2RLCsmZvBaswn2DxPwA
	 nnwsjbntCdVHH+6XwloqzIBDsPIzQ7n6GEwATbWP52zxwrhoA8nMZoL4neL9pSTYkk
	 sn7Ib9eSjPVxe+aVtwDh3Y6dXsf/LScFIzqANi4EuVrpHSTh7SqUbcze16lHUeINeq
	 PEtRrKCXJcz9Q==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sat, 14 Dec 2024 16:52:41 +0100
X-ME-IP: 90.11.132.44
Message-ID: <3c067b26-cfe8-4939-afce-5c8753767715@wanadoo.fr>
Date: Sat, 14 Dec 2024 16:52:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: samsung: Add a driver for Samsung SPEEDY host
 controller
References: <20241212-speedy-v1-0-544ad7bcfb6a@gmail.com>
 <20241212-speedy-v1-2-544ad7bcfb6a@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Markuss Broks <markuss.broks@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Markuss Broks <markuss.broks@gmail.com>,
 Maksym Holovach <nergzd@nergzd723.xyz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20241212-speedy-v1-2-544ad7bcfb6a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_075248_193517_92935EA7 
X-CRM114-Status: GOOD (  17.63  )
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

Le 12/12/2024 à 22:09, Markuss Broks a écrit :
> Add a driver for Samsung SPEEDY serial bus host controller.
> SPEEDY is a proprietary 1 wire serial bus used by Samsung
> in various devices (usually mobile), like Samsung Galaxy
> phones. It is usually used for connecting PMIC or various
> other peripherals, like audio codecs or RF components.
> 
> This bus can address at most 1MiB (4 bit device address,
> 8 bit registers per device, 8 bit wide registers:
> 256*256*16 = 1MiB of address space.

...

> +static int _speedy_read(struct speedy_controller *speedy, u32 reg, u32 addr, u32 *val)
> +{
> +	int ret;
> +	u32 cmd, int_ctl, int_status;
> +
> +	mutex_lock(&speedy->io_lock);

All error handling paths fail to release the mutex.
guard(mutex) would help here.

> +
> +	ret = speedy_fifo_reset(speedy);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_set_bits(speedy->map, SPEEDY_FIFO_CTRL,
> +			      SPEEDY_RX_LENGTH(1) | SPEEDY_TX_LENGTH(1));
> +	if (ret)
> +		return ret;
> +
> +	cmd = SPEEDY_ACCESS_RANDOM | SPEEDY_DIRECTION_READ |
> +	      SPEEDY_DEVICE(reg) | SPEEDY_ADDRESS(addr);
> +
> +	int_ctl = SPEEDY_TRANSFER_DONE_EN | SPEEDY_FIFO_RX_ALMOST_FULL_EN |
> +		  SPEEDY_RX_FIFO_INT_TRAILER_EN | SPEEDY_RX_MODEBIT_ERR_EN |
> +		  SPEEDY_RX_GLITCH_ERR_EN | SPEEDY_RX_ENDBIT_ERR_EN |
> +		  SPEEDY_REMOTE_RESET_REQ_EN;
> +
> +	ret = speedy_int_clear(speedy);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(speedy->map, SPEEDY_INT_ENABLE, int_ctl);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(speedy->map, SPEEDY_CMD, cmd);
> +	if (ret)
> +		return ret;
> +
> +	/* Wait for xfer done */
> +	ret = regmap_read_poll_timeout(speedy->map, SPEEDY_INT_STATUS, int_status,
> +				       int_status & SPEEDY_TRANSFER_DONE, 5000, 50000);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_read(speedy->map, SPEEDY_RX_DATA, val);
> +	if (ret)
> +		return ret;
> +
> +	ret = speedy_int_clear(speedy);
> +
> +	mutex_unlock(&speedy->io_lock);
> +
> +	return ret;
> +}

...

> +static int _speedy_write(struct speedy_controller *speedy, u32 reg, u32 addr, u32 val)
> +{
> +	int ret;
> +	u32 cmd, int_ctl, int_status;
> +
> +	mutex_lock(&speedy->io_lock);
> +
> +	ret = speedy_fifo_reset(speedy);
> +	if (ret)
> +		return ret;

All error handling paths fail to release the mutex.
guard(mutex) would help here.

> +
> +	ret = regmap_set_bits(speedy->map, SPEEDY_FIFO_CTRL,
> +			      SPEEDY_RX_LENGTH(1) | SPEEDY_TX_LENGTH(1));
> +	if (ret)
> +		return ret;
> +
> +	cmd = SPEEDY_ACCESS_RANDOM | SPEEDY_DIRECTION_WRITE |
> +	      SPEEDY_DEVICE(reg) | SPEEDY_ADDRESS(addr);
> +
> +	int_ctl = (SPEEDY_TRANSFER_DONE_EN |
> +		   SPEEDY_FIFO_TX_ALMOST_EMPTY_EN |
> +		   SPEEDY_TX_LINE_BUSY_ERR_EN |
> +		   SPEEDY_TX_STOPBIT_ERR_EN |
> +		   SPEEDY_REMOTE_RESET_REQ_EN);
> +
> +	ret = speedy_int_clear(speedy);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(speedy->map, SPEEDY_INT_ENABLE, int_ctl);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(speedy->map, SPEEDY_CMD, cmd);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(speedy->map, SPEEDY_TX_DATA, val);
> +	if (ret)
> +		return ret;
> +
> +	/* Wait for xfer done */
> +	ret = regmap_read_poll_timeout(speedy->map, SPEEDY_INT_STATUS, int_status,
> +				       int_status & SPEEDY_TRANSFER_DONE, 5000, 50000);
> +	if (ret)
> +		return ret;
> +
> +	speedy_int_clear(speedy);
> +
> +	mutex_unlock(&speedy->io_lock);
> +
> +	return 0;
> +}

...

> +/**
> + * speedy_get_by_phandle() - internal get speedy device handle
> + * @np:	pointer to OF device node of device
> + *
> + * Return: 0 on success, -errno otherwise

On success, a handle is returned, not 0.

> + */
> +static const struct speedy_device *speedy_get_device(struct device_node *np)
> +{
...

> +out:
> +	of_node_put(speedy_np);
> +	return handle;
> +}

...

> +static int speedy_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct speedy_controller *speedy;
> +	void __iomem *mem;
> +	int ret;
> +
> +	speedy = devm_kzalloc(dev, sizeof(struct speedy_controller), GFP_KERNEL);
> +	if (!speedy)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, speedy);
> +	speedy->pdev = pdev;
> +
> +	mutex_init(&speedy->io_lock);
> +
> +	mem = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(mem))
> +		return dev_err_probe(dev, PTR_ERR(mem), "Failed to ioremap memory\n");
> +
> +	speedy->map = devm_regmap_init_mmio(dev, mem, &speedy_map_cfg);
> +	if (IS_ERR(speedy->map))
> +		return dev_err_probe(dev, PTR_ERR(speedy->map), "Failed to init the regmap\n");
> +
> +	/* Clear any interrupt status remaining */
> +	ret = speedy_int_clear(speedy);
> +	if (ret)
> +		return ret;
> +
> +	/* Reset the controller */
> +	ret = regmap_set_bits(speedy->map, SPEEDY_CTRL, SPEEDY_SW_RST);
> +	if (ret)
> +		return ret;
> +
> +	msleep(20);
> +
> +	/* Enable the hw */
> +	ret = regmap_set_bits(speedy->map, SPEEDY_CTRL, SPEEDY_ENABLE);
> +	if (ret)
> +		return ret;
> +
> +	msleep(20);
> +
> +	/* Probe child devices */
> +	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, dev);
> +	if (ret)
> +		dev_err(dev, "Failed to populate child devices: %d\n", ret);

Could be dev_err_probe() as well, at least for consistency.

> +
> +	return ret;
> +}

...

CJ

