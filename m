Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5149EE77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 15:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:To:From:References:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYHyziBzei7Ds+fIuSTf10OdyGFX8eHRQWgID6llsSE=; b=geQEUmSkTyt2C6KHFEDqIaPxcC
	q7MqTsxO3tNpYeLi7YKOV+9WfphRePNU3fH1+TV2l0Tmj4BIkt+amgnbqOTDepmq1hgNjENowAE+Q
	vU5v4BPNhzt0yp+S8lWzFPRC4TBUO4LXRnfZ+xp6d2BM5OrVmo67rQe8/7Ko5lxEWh/Q30orkUtyd
	BxYQbO18ImfAVr0pcY6H4dPqSYcbZ9fQilOuyQyMBZ6jc11NdNaWoG3AE1a5grQy7Xwm8aVj/Q17S
	FCvi8yfFfUXx9bIiPtMJdz5Ec80UkqlibRF2AdE7HAsNDMdgB8pdFcHdRCPpcKWdK9Udetlw31Z7+
	kqaYewgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKJ3T-00000005SHy-0l0m;
	Sun, 08 Dec 2024 15:18:43 +0000
Received: from smtp-16.smtpout.orange.fr ([80.12.242.16] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKJ2Q-00000005SCR-0hon;
	Sun, 08 Dec 2024 15:17:39 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id KJ2Gt4wpMshnBKJ2Htx9HX; Sun, 08 Dec 2024 16:17:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733671056;
	bh=sYHyziBzei7Ds+fIuSTf10OdyGFX8eHRQWgID6llsSE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=NVD5R1ZaHNxedq1m7chVBNhs7hbkpp7jxcCRsxj/UN9WAhS72VWroeG3C2EuX9RAJ
	 KGLNCyl18R3YkfyE5pftthLHGSm4jm2vyEJFAyy9kpk7v7ZMplXmt3kOQN5qrOwYvX
	 H/gjeIPrEN3+AWVs8WJ6AVXkDJ43sjGwBD/FQBfJX0Y5dZOHOMELT9CZjN4EtZMshQ
	 pL/wh0JKduCo01j9XPUktm8XSrOVoLdC4t37XsrhIGbWXcUJtipFU3QVhH8el3HFvn
	 KsOzpGHZjHS37PMRyMnHLy2x+sg3tK/OnblTpTzX9yxeKMWJRXqfK657p+E0ZRUj74
	 f4lPWNHmIUK3w==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sun, 08 Dec 2024 16:17:36 +0100
X-ME-IP: 90.11.132.44
Message-ID: <118552cc-e060-45fa-b93f-9187011f2c8c@wanadoo.fr>
Date: Sun, 8 Dec 2024 16:17:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next PATCH v10 7/9] nvmem: an8855: Add support for Airoha
 AN8855 Switch EFUSE
References: <20241208002105.18074-1-ansuelsmth@gmail.com>
 <20241208002105.18074-8-ansuelsmth@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno," <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@airoha.com
In-Reply-To: <20241208002105.18074-8-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_071738_481660_39A9D4F6 
X-CRM114-Status: GOOD (  20.00  )
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

Le 08/12/2024 à 01:20, Christian Marangi a écrit :
> Add support for Airoha AN8855 Switch EFUSE. These EFUSE might be used
> for calibration data for the internal switch PHYs.
> 
> Signed-off-by: Christian Marangi <ansuelsmth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>   MAINTAINERS                  |  1 +
>   drivers/nvmem/Kconfig        | 11 +++++++
>   drivers/nvmem/Makefile       |  2 ++
>   drivers/nvmem/an8855-efuse.c | 63 ++++++++++++++++++++++++++++++++++++
>   4 files changed, 77 insertions(+)
>   create mode 100644 drivers/nvmem/an8855-efuse.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 38c7b2362c92..a67d147276a1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -723,6 +723,7 @@ F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
>   F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
>   F:	drivers/mfd/airoha-an8855.c
>   F:	drivers/net/mdio/mdio-an8855.c
> +F:	drivers/nvmem/an8855-efuse.c
>   
>   AIROHA ETHERNET DRIVER
>   M:	Lorenzo Bianconi <lorenzo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index 8671b7c974b9..599014970c22 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -28,6 +28,17 @@ source "drivers/nvmem/layouts/Kconfig"
>   
>   # Devices
>   
> +config NVMEM_AN8855_EFUSE
> +	tristate "Airoha AN8855 eFuse support"
> +	depends on MFD_AIROHA_AN8855 || COMPILE_TEST
> +	help
> +	  Say y here to enable support for reading eFuses on Airoha AN8855
> +	  Switch. These are e.g. used to store factory programmed
> +	  calibration data required for the PHY.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called nvmem-apple-efuse.

nvmem-an8855-efuse?

> +
>   config NVMEM_APPLE_EFUSES
>   	tristate "Apple eFuse support"
>   	depends on ARCH_APPLE || COMPILE_TEST
> diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
> index 5b77bbb6488b..c732132c0e45 100644
> --- a/drivers/nvmem/Makefile
> +++ b/drivers/nvmem/Makefile
> @@ -10,6 +10,8 @@ nvmem_layouts-y			:= layouts.o
>   obj-y				+= layouts/
>   
>   # Devices
> +obj-$(CONFIG_NVMEM_AN8855_EFUSE)	+= nvmem-an8855-efuse.o
> +nvmem-an8855-efuse-y 			:= an8855-efuse.o
>   obj-$(CONFIG_NVMEM_APPLE_EFUSES)	+= nvmem-apple-efuses.o
>   nvmem-apple-efuses-y 			:= apple-efuses.o
>   obj-$(CONFIG_NVMEM_BCM_OCOTP)		+= nvmem-bcm-ocotp.o

...

> +static int an8855_efuse_probe(struct platform_device *pdev)
> +{
> +	struct nvmem_config an8855_nvmem_config = {
> +		.name = "an8855-efuse",
> +		.size = AN8855_EFUSE_CELL * sizeof(u32),
> +		.stride = sizeof(u32),
> +		.word_size = sizeof(u32),
> +		.reg_read = an8855_efuse_read,
> +	};
> +	struct device *dev = &pdev->dev;
> +	struct nvmem_device *nvmem;
> +
> +	/* Assign NVMEM priv to MFD regmap */
> +	an8855_nvmem_config.priv = dev_get_regmap(dev->parent, NULL);
> +	an8855_nvmem_config.dev = dev;
> +	nvmem = devm_nvmem_register(dev, &an8855_nvmem_config);
> +
> +	return PTR_ERR_OR_ZERO(nvmem);
> +}
> +
> +static const struct of_device_id an8855_efuse_of_match[] = {
> +	{ .compatible = "airoha,an8855-efuse", },
> +	{/* sentinel */},

No need for the ending comma.

> +};
> +MODULE_DEVICE_TABLE(of, an8855_efuse_of_match);

...

CJ



