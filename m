Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E814BE77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 15:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:To:From:References:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVlq2KdrmbfOW86CMGQBu5vttyCc5rsOJolnA5rzBIk=; b=bgOrkfOzqcWuCOYr1eaG5qZN3C
	HQfCzWfDctT0f4p80dJp0zBt/t1DjpDj9V6DaCAlwIkcPkyr0OmPEz5OwvO+ytJxVORQdN6FMTHYL
	rnA1zaZEGjrMLLqOLM83L6zL8O1BMVDbCMd02Kznj+B6rhub6ITt4/zdMd0KQ6mQ/b+vr8YcFz10b
	xALtkEEffvK1xl0V1svdGvSXj09EQSJs3ALQ2KNODhqTEZyV/TvC85tuT6ASd9AxLmm8ZNULmKk36
	1ybC8+d1KwosXz3ahHmRhqoG2BkOjGPgzHG33Jx3w/Wyg0kER4wKftPC177/hdCtDYOUN2WOEka+A
	EcII8Gbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKJCR-00000005TKH-1qSh;
	Sun, 08 Dec 2024 15:27:59 +0000
Received: from smtp-23.smtpout.orange.fr ([80.12.242.23] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKJBO-00000005TCR-2RTr;
	Sun, 08 Dec 2024 15:26:55 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id KJBGtwSuVqhuoKJBGtLLZl; Sun, 08 Dec 2024 16:26:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733671610;
	bh=VVlq2KdrmbfOW86CMGQBu5vttyCc5rsOJolnA5rzBIk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=Dn8KWRVsKQrdEj1cVfH9KGP3vdTtQX3bBcFfNlISnT2UtzDMpJ1PNPUBZRXixCQn+
	 uJ6bIcL1s3iHJMSrpeOceQnsSc/jUwI0lGEG19YMIF5uumgfP0l2uLDh9trY/JYrfR
	 FOim+Qk//jZBt/0TI2guKmq17F97VVeQNsq8Hmhc+YIaofT+qHTgaeIVV7j9p6aHfp
	 4ITSpVrTgHUi7reH71c04BqTswwzfULvqb2n2FNTeRym+haSa/1jlGSE74DMPDBElA
	 slfNd/JhiX2U34JgvwS8pBjx0zmVY3GDgoYpqRZ0Y9jmLgjPETZtysu6r61d9iBm4Y
	 Fms4mMJ1oqjjw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Sun, 08 Dec 2024 16:26:50 +0100
X-ME-IP: 90.11.132.44
Message-ID: <d205aae9-68d5-41f1-8739-779b2d9a6664@wanadoo.fr>
Date: Sun, 8 Dec 2024 16:26:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next PATCH v10 8/9] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
References: <20241208002105.18074-1-ansuelsmth@gmail.com>
 <20241208002105.18074-9-ansuelsmth@gmail.com>
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
In-Reply-To: <20241208002105.18074-9-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_072654_755899_099B5124 
X-CRM114-Status: GOOD (  12.67  )
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
> Add Airoha AN8855 5-Port Gigabit DSA switch. Switch can support
> 10M, 100M, 1Gb, 2.5G and 5G Ethernet Speed but 5G is currently error out
> as it's not currently supported as requires additional configuration for
> the PCS.
> 
> The switch is also a nvmem-provider as it does have EFUSE to calibrate
> the internal PHYs.
> 
> Signed-off-by: Christian Marangi <ansuelsmth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---

...

> +static int an8855_read_switch_id(struct an8855_priv *priv)
> +{
> +	u32 id;
> +	int ret;
> +
> +	ret = regmap_read(priv->regmap, AN8855_CREV, &id);
> +	if (ret)
> +		return ret;
> +
> +	if (id != AN8855_ID) {
> +		dev_err(priv->dev,
> +			"Switch id detected %x but expected %x",

missing \n

> +			id, AN8855_ID);
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}

...

> +static void an8855_switch_remove(struct platform_device *pdev)
> +{
> +	struct an8855_priv *priv = dev_get_drvdata(&pdev->dev);
> +
> +	if (!priv)
> +		return;

I don't think this can happen. So it could be removed?

> +
> +	dsa_unregister_switch(priv->ds);
> +}

...

CJ

