Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E69E77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 15:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:To:From:References:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pDg9j4Kgs8Eh6X0ImJM0JCCi0wdfL5kuTF+nMwtl4+A=; b=gJxNWv4nY9+C3U6RRj/MQIoWVz
	Gzi0AtHP3SaJ7rbyMop1xeKlDaFDU7YK3Tb9Xb4LRizb0vO/UCt+8P+Gghbs/J0Ly3EZaNUpcJgym
	duwDRhTncYFDLvhlmda/yEPuRZGEgF7KWzwpLZexsjaIpIM5QbaL6Dez2cunv2mMRuhU6mdf3X4i6
	6J6AJi4FQcSPPs2c+AaqlCAtakvU1Pe6rRsnFcOkkzT2zKDtRKyGk4Z8b85+cd6XcaA+Fba3JhF1P
	tk7QzPEjjEX9amaq+xjs1LP8a7h6KjvRJSsNGypLsQlMNvenQj0lBjl6/2vQhi8HNpSRi8bO0Bq2G
	vIDmeddQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKIye-00000005Ra2-0lHg;
	Sun, 08 Dec 2024 15:13:44 +0000
Received: from smtp-25.smtpout.orange.fr ([80.12.242.25] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKIud-00000005QWp-30f0;
	Sun, 08 Dec 2024 15:09:39 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id KIuTt5Z1GhfQMKIuTtU2lx; Sun, 08 Dec 2024 16:09:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733670570;
	bh=pDg9j4Kgs8Eh6X0ImJM0JCCi0wdfL5kuTF+nMwtl4+A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=Eg5KF7hbCX3H60W9Wj+/lz92hplkkTFtPhU035C3ifPmyjDdYtby33boSWgK2ehmU
	 i1TKka2qzTofga1fFeG2f7m3UrrRnk/rFrx7YMbmguPtUklUy7DxF0L6NAloyfVmEr
	 8DaiqPQkc8mDxtUAmz2BvboAoN056pWuQdxHWvfTkDNEg6ER/XO8ggKSpSjiiaVbk2
	 HOB2EPXTlnXQL3dfxkVXu9uLiGXlDUokjR3pkeTQ/vsV900einRnEknbJsIa6w5E3y
	 G2bEtB9S9WlYrwTCx+TZSuQpvtl654wHk2lqWtXGleHxEAjF8fxO8/kasnYWuF0DBy
	 oqlqHjA5P8+qw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sun, 08 Dec 2024 16:09:30 +0100
X-ME-IP: 90.11.132.44
Message-ID: <8e9cf879-b188-4bfe-8200-f6a6ae285cb5@wanadoo.fr>
Date: Sun, 8 Dec 2024 16:09:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next PATCH v10 5/9] mfd: an8855: Add support for Airoha
 AN8855 Switch MFD
References: <20241208002105.18074-1-ansuelsmth@gmail.com>
 <20241208002105.18074-6-ansuelsmth@gmail.com>
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
In-Reply-To: <20241208002105.18074-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_070937_110108_BC53BBAA 
X-CRM114-Status: GOOD (  19.81  )
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
> Add support for Airoha AN8855 Switch MFD that provide support for a DSA
> switch and a NVMEM provider. Also provide support for a virtual MDIO
> passthrough as the PHYs address for the switch are shared with the switch
> address
> 
> Signed-off-by: Christian Marangi <ansuelsmth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>   MAINTAINERS                           |   1 +
>   drivers/mfd/Kconfig                   |   9 +
>   drivers/mfd/Makefile                  |   1 +
>   drivers/mfd/airoha-an8855.c           | 279 ++++++++++++++++++++++++++
>   include/linux/mfd/airoha-an8855-mfd.h |  41 ++++
>   5 files changed, 331 insertions(+)
>   create mode 100644 drivers/mfd/airoha-an8855.c
>   create mode 100644 include/linux/mfd/airoha-an8855-mfd.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f3e3f6938824..7f4d7c48b6e1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -721,6 +721,7 @@ F:	Documentation/devicetree/bindings/mfd/airoha,an8855-mfd.yaml
>   F:	Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
>   F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
>   F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
> +F:	drivers/mfd/airoha-an8855.c
>   
>   AIROHA ETHERNET DRIVER
>   M:	Lorenzo Bianconi <lorenzo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index ae23b317a64e..a83db24336d9 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -53,6 +53,15 @@ config MFD_ALTERA_SYSMGR
>   	  using regmap_mmio accesses for ARM32 parts and SMC calls to
>   	  EL3 for ARM64 parts.
>   
> +config MFD_AIROHA_AN8855
> +	bool "Airoha AN8855 Switch MFD"
> +	depends on MDIO && OF
> +	select MFD_CORE
> +	help
> +	  Support for the Airoha AN8855 Switch MFD. This is a SoC Switch
> +	  that provide various peripherals. Currently it provides a

provides?

> +	  DSA switch and a NVMEM provider.
> +
>   config MFD_ACT8945A
>   	tristate "Active-semi ACT8945A"
>   	select MFD_CORE

...

> +static int an8855_mfd_probe(struct mdio_device *mdiodev)
> +{
> +	struct an8855_mfd_priv *priv;
> +	struct regmap *regmap;
> +
> +	priv = devm_kzalloc(&mdiodev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->bus = mdiodev->bus;
> +	priv->dev = &mdiodev->dev;
> +	priv->switch_addr = mdiodev->addr;
> +	/* no DMA for mdiobus, mute warning for DMA mask not set */
> +	priv->dev->dma_mask = &priv->dev->coherent_dma_mask;
> +
> +	regmap = devm_regmap_init(priv->dev, NULL, priv,
> +				  &an8855_regmap_config);
> +	if (IS_ERR(regmap)) {
> +		dev_err(priv->dev, "regmap initialization failed");

Nitpick: Missing ending \n.
Also, return dev_err_probe() could be used.

> +		return PTR_ERR(priv->dev);
> +	}
> +
> +	dev_set_drvdata(&mdiodev->dev, priv);

Is it needed?
There is no dev_get_drvdata() in this patch

> +
> +	return devm_mfd_add_devices(priv->dev, PLATFORM_DEVID_AUTO, an8855_mfd_devs,
> +				    ARRAY_SIZE(an8855_mfd_devs), NULL, 0,
> +				    NULL);
> +}

...

CJ

