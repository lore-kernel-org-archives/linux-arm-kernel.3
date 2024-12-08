Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCD7E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 15:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pdf86gR/dMKzkGH5bal5f/VQlcSO3nRfeOeV/tWrQ+8=; b=vHYP/WwDpaq6TsvBc1uCHwiXyQ
	qOmFzlVJMz6FYl7vVoRNQtuISasguUfOnpxA0byj2ugUogsveVeKCm6Bo0eaWEykswbCLS/5smQHN
	sHzqvCDokEWOg61hf20ZL3Nu2k+XybhE72zH5FI6YixDBN8VP2rF5OzhTOkMjKZgjUfqBgUR5PsHk
	YQLJqQ+sILMrpH7LoJWZejfED1W5gdqN4hje9jfU+Tcb2bauEAATyw9jGDBiNWnDHGqDd+7nh2UAi
	UsCoK2jNiLVG2PyI66TiyX0HIn4soO5DQNN2phXY9Vaj4OAj6BO/pDPFf4z+oT6QQ/UcG5/IRaneM
	s1hW6UMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKJ0f-00000005S40-1SB0;
	Sun, 08 Dec 2024 15:15:49 +0000
Received: from smtp-24.smtpout.orange.fr ([80.12.242.24] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKIyv-00000005Rcp-2dTs;
	Sun, 08 Dec 2024 15:14:02 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id KIyktPf7LKnkaKIyltSzZs; Sun, 08 Dec 2024 16:13:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733670838;
	bh=Pdf86gR/dMKzkGH5bal5f/VQlcSO3nRfeOeV/tWrQ+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=gO8NLcl6a4c7J73S19642SQgukw51ysvu4UFeYagLERMwA3v+/H7FNR1ucyg22b/O
	 892EhhwK1nkrqYNwJhWHEnbzX4oz3p6BvqqVU3FrisC8HYPAmGBpaMrQ6HtSNdIiYA
	 j7ncnZNgxSM46LYgXIc9uEoAHd5zyHrmUWnerYETEQoqdkZmIfl0Kx2c2cdBe9VJ9M
	 j3ASPrpmR3ch7IO04glAVsZCjNc5V8PP4BuP3rLHtYMjqsjUoeyfaJ9O0Sqp7u1l1a
	 QA7iQdH1oEq3JfI45mXOdlzcetKOMX9WFrx1J0ViJcjXa5mP3s0QN9rRBi4dyjO21i
	 wbie9Dv7Q4GvA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sun, 08 Dec 2024 16:13:58 +0100
X-ME-IP: 90.11.132.44
Message-ID: <42f11110-7071-43c8-a4fe-df99a60bc12d@wanadoo.fr>
Date: Sun, 8 Dec 2024 16:13:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next PATCH v10 6/9] net: mdio: Add Airoha AN8855 Switch MDIO
 Passtrough
To: Christian Marangi <ansuelsmth@gmail.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@airoha.com
References: <20241208002105.18074-1-ansuelsmth@gmail.com>
 <20241208002105.18074-7-ansuelsmth@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20241208002105.18074-7-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_071401_826732_ADC48C59 
X-CRM114-Status: GOOD (  20.27  )
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
> Add Airoha AN8855 Switch driver to register a MDIO passtrough as switch
> address is shared with the internal PHYs and require additional page
> handling.
> 
> This requires the upper Switch MFD to be probed and init to actually
> work.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>   MAINTAINERS                    |   1 +
>   drivers/net/mdio/Kconfig       |   9 +++
>   drivers/net/mdio/Makefile      |   1 +
>   drivers/net/mdio/mdio-an8855.c | 113 +++++++++++++++++++++++++++++++++
>   4 files changed, 124 insertions(+)
>   create mode 100644 drivers/net/mdio/mdio-an8855.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7f4d7c48b6e1..38c7b2362c92 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -722,6 +722,7 @@ F:	Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
>   F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
>   F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
>   F:	drivers/mfd/airoha-an8855.c
> +F:	drivers/net/mdio/mdio-an8855.c
>   
>   AIROHA ETHERNET DRIVER
>   M:	Lorenzo Bianconi <lorenzo@kernel.org>
> diff --git a/drivers/net/mdio/Kconfig b/drivers/net/mdio/Kconfig
> index 4a7a303be2f7..64fc5c3ef38b 100644
> --- a/drivers/net/mdio/Kconfig
> +++ b/drivers/net/mdio/Kconfig
> @@ -61,6 +61,15 @@ config MDIO_XGENE
>   	  This module provides a driver for the MDIO busses found in the
>   	  APM X-Gene SoC's.
>   
> +config MDIO_AN8855
> +	tristate "Airoha AN8855 Switch MDIO bus controller"
> +	depends on MFD_AIROHA_AN8855
> +	depends on OF_MDIO
> +	help
> +	  This module provides a driver for the Airoha AN8855 Switch
> +	  that require a MDIO passtrough as switch address is shared

requires?

> +	  with the internal PHYs and require additional page handling.

requires?

> +
>   config MDIO_ASPEED
>   	tristate "ASPEED MDIO bus controller"
>   	depends on ARCH_ASPEED || COMPILE_TEST

...

> +static int an8855_mdio_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct an8855_mfd_priv *priv;
> +	struct mii_bus *bus;
> +	int ret;
> +
> +	/* Get priv of MFD */
> +	priv = dev_get_drvdata(dev->parent);

Ok, forget the related comment made on patch 5/9.

> +
> +	bus = devm_mdiobus_alloc(dev);
> +	if (!bus)
> +		return -ENOMEM;
> +
> +	bus->priv = priv;
> +	bus->name = KBUILD_MODNAME "-mii";
> +	snprintf(bus->id, MII_BUS_ID_SIZE, KBUILD_MODNAME "-%d",
> +		 priv->switch_addr);
> +	bus->parent = dev;
> +	bus->read = an8855_phy_read;
> +	bus->write = an8855_phy_write;
> +
> +	ret = devm_of_mdiobus_register(dev, bus, dev->of_node);
> +	if (ret)
> +		dev_err(dev, "failed to register MDIO bus: %d", ret);

Nitpick: Missing ending \n.
dev_err_probe() could be used.

> +
> +	return ret;
> +}

...

CJ




