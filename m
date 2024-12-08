Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97118E77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 15:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jkP4yA0W2YYcfH7OhgCU7OQTCVOg6mRF/p3ZKoISHKo=; b=QYtn0ZFMuNguV0UwilOVcWmD2S
	FDQBnnaLVa6uU0LVpVHBo9QuYgvZ6Hgx82XVGgYph/X8L8Ap6qtdgQGHLHnREZCuo2d4YAXsfsDJc
	cBNQAuHuJQwU+sYc66SimBHnLWH/gG/KFBWGv27M9AOB+qj8mKgrAs7W2i2+uZul8mr+64cUJS9ee
	hVB5cimmyQrs0yR7Bk7Fn8vu0/bj1dLKvp2gGIjXYBkgnSCa/s++1XvRV1n8nldHpZKCFpKrLeUS9
	wiR3ADr1VdVJFFvU0qDYD44YaaTsd9E3wvYh4gqou9+vjEs73N7h3mNBfzG+RrGqwZy9YWAsNWrVF
	WLmdyE1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKJNL-00000005U8n-3GJM;
	Sun, 08 Dec 2024 15:39:15 +0000
Received: from smtp-19.smtpout.orange.fr ([80.12.242.19] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKJMJ-00000005U09-1NfV;
	Sun, 08 Dec 2024 15:38:12 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id KJMAt37SE3iIjKJMAttwqx; Sun, 08 Dec 2024 16:38:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733672289;
	bh=jkP4yA0W2YYcfH7OhgCU7OQTCVOg6mRF/p3ZKoISHKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=gCsCg3wXWXtrA8/cwqt3m8V00Ppe79nUtznNwNqBibPZN+OA03rl2CIpkOL2+p7/g
	 Exg7Vb3ssawiNNMHd4CpQnezTdm4nCv4xw9GDzCtjSZ2THh0uu8wH2AskDJgYHawtC
	 OuCDMxvntOj2Qu1EC9nhkg3VQmo3sPM1hKUwJsgTPUGr7IrcimCygl4xHYJ92mjFb0
	 u4xW6bsIs26P+XAxvHbrBONNllOYKxb5LqddozMoVkoxv9NBiFda6amJDWSNRdSj02
	 Bflcrsiu4JXQzU7bWMDwX54lu0bQfIoyTPNRcfdVEWUorRriBCaIIptIGdltb/X6J6
	 eF7JiXnijx3Bw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sun, 08 Dec 2024 16:38:09 +0100
X-ME-IP: 90.11.132.44
Message-ID: <f8d990ef-203e-479a-838e-13780e758ab8@wanadoo.fr>
Date: Sun, 8 Dec 2024 16:38:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next PATCH v10 5/9] mfd: an8855: Add support for Airoha
 AN8855 Switch MFD
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
References: <20241208002105.18074-1-ansuelsmth@gmail.com>
 <20241208002105.18074-6-ansuelsmth@gmail.com>
 <8e9cf879-b188-4bfe-8200-f6a6ae285cb5@wanadoo.fr>
 <6755b761.050a0220.223761.2b14@mx.google.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <6755b761.050a0220.223761.2b14@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_073811_637249_56C4FCF1 
X-CRM114-Status: GOOD (  17.32  )
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

Le 08/12/2024 à 16:12, Christian Marangi a écrit :
> On Sun, Dec 08, 2024 at 04:09:25PM +0100, Christophe JAILLET wrote:
>> Le 08/12/2024 à 01:20, Christian Marangi a écrit :
>>> Add support for Airoha AN8855 Switch MFD that provide support for a DSA
>>> switch and a NVMEM provider. Also provide support for a virtual MDIO
>>> passthrough as the PHYs address for the switch are shared with the switch
>>> address
>>>
>>> Signed-off-by: Christian Marangi <ansuelsmth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> ---
>>>    MAINTAINERS                           |   1 +
>>>    drivers/mfd/Kconfig                   |   9 +
>>>    drivers/mfd/Makefile                  |   1 +
>>>    drivers/mfd/airoha-an8855.c           | 279 ++++++++++++++++++++++++++
>>>    include/linux/mfd/airoha-an8855-mfd.h |  41 ++++
>>>    5 files changed, 331 insertions(+)
>>>    create mode 100644 drivers/mfd/airoha-an8855.c
>>>    create mode 100644 include/linux/mfd/airoha-an8855-mfd.h
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index f3e3f6938824..7f4d7c48b6e1 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -721,6 +721,7 @@ F:	Documentation/devicetree/bindings/mfd/airoha,an8855-mfd.yaml
>>>    F:	Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
>>>    F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
>>>    F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
>>> +F:	drivers/mfd/airoha-an8855.c
>>>    AIROHA ETHERNET DRIVER
>>>    M:	Lorenzo Bianconi <lorenzo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>>> index ae23b317a64e..a83db24336d9 100644
>>> --- a/drivers/mfd/Kconfig
>>> +++ b/drivers/mfd/Kconfig
>>> @@ -53,6 +53,15 @@ config MFD_ALTERA_SYSMGR
>>>    	  using regmap_mmio accesses for ARM32 parts and SMC calls to
>>>    	  EL3 for ARM64 parts.
>>> +config MFD_AIROHA_AN8855
>>> +	bool "Airoha AN8855 Switch MFD"
>>> +	depends on MDIO && OF
>>> +	select MFD_CORE
>>> +	help
>>> +	  Support for the Airoha AN8855 Switch MFD. This is a SoC Switch
>>> +	  that provide various peripherals. Currently it provides a
>>
>> provides?
>>
>>> +	  DSA switch and a NVMEM provider.
>>> +
>>>    config MFD_ACT8945A
>>>    	tristate "Active-semi ACT8945A"
>>>    	select MFD_CORE
>>
>> ...
>>
>>> +static int an8855_mfd_probe(struct mdio_device *mdiodev)
>>> +{
>>> +	struct an8855_mfd_priv *priv;
>>> +	struct regmap *regmap;
>>> +
>>> +	priv = devm_kzalloc(&mdiodev->dev, sizeof(*priv), GFP_KERNEL);
>>> +	if (!priv)
>>> +		return -ENOMEM;
>>> +
>>> +	priv->bus = mdiodev->bus;
>>> +	priv->dev = &mdiodev->dev;
>>> +	priv->switch_addr = mdiodev->addr;
>>> +	/* no DMA for mdiobus, mute warning for DMA mask not set */
>>> +	priv->dev->dma_mask = &priv->dev->coherent_dma_mask;
>>> +
>>> +	regmap = devm_regmap_init(priv->dev, NULL, priv,
>>> +				  &an8855_regmap_config);
>>> +	if (IS_ERR(regmap)) {
>>> +		dev_err(priv->dev, "regmap initialization failed");
>>
>> Nitpick: Missing ending \n.
>> Also, return dev_err_probe() could be used.
>>
> 
> Can regmap PROBE_DEFER? Or it's just common practice?

It is a common practice to easily log the error code in a human readable 
format, even when PROBE_DEFER can't happen.

It sometimes also saves 1 or 2 LoC because it may save the { } and the 
line with return.

Leaving it as-is is obviously also just fine ;-).

CJ

> 
>>> +		return PTR_ERR(priv->dev);
>>> +	}
>>> +
>>> +	dev_set_drvdata(&mdiodev->dev, priv);
>>
>> Is it needed?
>> There is no dev_get_drvdata() in this patch
>>
> 
> Yes it is, MFD child makes use of dev_get_drv_data(dev->parent) to
> access the bug and current_page.
> 
>>> +
>>> +	return devm_mfd_add_devices(priv->dev, PLATFORM_DEVID_AUTO, an8855_mfd_devs,
>>> +				    ARRAY_SIZE(an8855_mfd_devs), NULL, 0,
>>> +				    NULL);
>>> +}
>>
>> ...
>>
>> CJ
> 


