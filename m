Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D33C02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 08:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4lbgYmPk9XP59vTZ4YMM9tWk6u+nU78RJ7QSsRKInw=; b=sM/wjwq5gU/8XX1o0F1kflCfr5
	X/O567DN7KaX6pNr/1UiJJjywf75yyq/mHChsvk+pBcAlMZM2cacWr7zlUreG9M+eM2p4aFDHxE1j
	DY1pN2oGoGPwKil6DLBcUSr3hHonONgVm4iLvMLi0ZzagJwks1DSN/ajGsUMU9hNFtqDBkhYYz4Pr
	UrE43rJBTEg8hLL0hClm8vC7Wfvk4FwvLvrlhfpaj5mMgCqW/NpXzF9SwsltvvIzGgHBsY0CFrBAV
	S6vIJFlVmWXM4rpl0gRFQVRFcEGgNIBgLAHAAyGCE8ZyJPK1yFT1N5bu9XTx7fBJkHU1YQcWWcl/w
	GnPn7/bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKAD-00000008uCk-2MkX;
	Fri, 07 Feb 2025 08:56:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgK2l-00000008sT4-1vQj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 08:49:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AEA0E5C5767;
	Fri,  7 Feb 2025 08:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4607CC4CED1;
	Fri,  7 Feb 2025 08:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738918138;
	bh=wrxfkqUZXjG/NYNWJi4TM/I1dqfnQ+7iCKBkou4/NnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hxYBhcKwI21p86UL8L8YlttFcR/8JoHb60J23SjdHmiFej1XmR3pm/W/i9jLB4gCs
	 IRPIgXDoRM2bnXDGmb/J2hfcxKcO3F6s+9QR/wuHtXp0MltLcKnJqgbRKOa+HEul98
	 wPe4o3X7P0fsZluTgNBTot1zKlbBB2Bt5iFCd9QN+G/RmXbQdx/L0pA9WxWO4qU0YR
	 njMjp/yHVnTlW/pYmJW0zR2ct1ClZobOXPQY1tqpg6EfdQI/Udec814QLEIspHc6X3
	 vocC1hCpRwrEja5nsh0TwQh49lHOFEDXcpgXwUCXgAFdTXDtLpngA5mOKXKP8/+TaF
	 Ajdouxc3URaIw==
Date: Fri, 7 Feb 2025 08:48:52 +0000
From: Lee Jones <lee@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 4/7] mfd: bcm590xx: Add compatible for BCM59054
Message-ID: <20250207084852.GC7593@google.com>
References: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
 <20250131-bcm59054-v3-4-bbac52a84787@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250131-bcm59054-v3-4-bbac52a84787@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_004859_582000_1F8D32C3 
X-CRM114-Status: GOOD (  24.59  )
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

On Fri, 31 Jan 2025, Artur Weber wrote:

> The BCM59056 supported by the bcm590xx driver is similar to the
> BCM59054 MFD. Add a compatible for it in the driver, in preparation
> for extending support of this chip in the bcm590xx regulator driver.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> Changes in v3:
> - Fix compilation warning about device_type pointer cast type
> - Name the device types enum and use it as the type in the MFD struct
> ---
>  drivers/mfd/bcm590xx.c       | 6 +++++-
>  include/linux/mfd/bcm590xx.h | 7 +++++++
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/bcm590xx.c b/drivers/mfd/bcm590xx.c
> index 8b56786d85d0182acf91da203b5f943556c08422..23036157480e0116301bfa93932c92f5a80010ea 100644
> --- a/drivers/mfd/bcm590xx.c
> +++ b/drivers/mfd/bcm590xx.c
> @@ -50,6 +50,9 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
>  	bcm590xx->dev = &i2c_pri->dev;
>  	bcm590xx->i2c_pri = i2c_pri;
>  
> +	bcm590xx->device_type = \
> +			  (uintptr_t) of_device_get_match_data(bcm590xx->dev);

Why are you dividing pointers with each other?

>  	bcm590xx->regmap_pri = devm_regmap_init_i2c(i2c_pri,
>  						 &bcm590xx_regmap_config_pri);
>  	if (IS_ERR(bcm590xx->regmap_pri)) {
> @@ -91,7 +94,8 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
>  }
>  
>  static const struct of_device_id bcm590xx_of_match[] = {
> -	{ .compatible = "brcm,bcm59056" },
> +	{ .compatible = "brcm,bcm59054", .data = (void *)BCM59054_TYPE },
> +	{ .compatible = "brcm,bcm59056", .data = (void *)BCM59056_TYPE },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, bcm590xx_of_match);
> diff --git a/include/linux/mfd/bcm590xx.h b/include/linux/mfd/bcm590xx.h
> index 6b8791da6119b22514447bf1572238b71c8b0e97..b76fb57bf0dd17d51580e93db58ece4a4d6dc5e4 100644
> --- a/include/linux/mfd/bcm590xx.h
> +++ b/include/linux/mfd/bcm590xx.h
> @@ -13,12 +13,19 @@
>  #include <linux/i2c.h>
>  #include <linux/regmap.h>
>  
> +/* device types */
> +enum bcm590xx_device_type {
> +	BCM59054_TYPE,
> +	BCM59056_TYPE,
> +};
> +
>  /* max register address */
>  #define BCM590XX_MAX_REGISTER_PRI	0xe7
>  #define BCM590XX_MAX_REGISTER_SEC	0xf0
>  
>  struct bcm590xx {
>  	struct device *dev;
> +	enum bcm590xx_device_type device_type;
>  	struct i2c_client *i2c_pri;
>  	struct i2c_client *i2c_sec;
>  	struct regmap *regmap_pri;
> 
> -- 
> 2.48.1
> 

-- 
Lee Jones [李琼斯]

