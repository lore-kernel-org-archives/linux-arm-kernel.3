Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB43CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 04:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ZU4LHrlti87r9K2UICT/rxzeexkGzJ2+VJKWzLaK8M=; b=my3jUM6+xLu2i3KfRJXK12ZZJw
	upWZy6RED3EX4qcvtJXu62xxYdAGX2Gho5l+vraOvs1d7i17bKIXQAalXI4npKCeVQeijSSfw8m6p
	CuJ93HjMyZnYaIZ0h51Y6PKASIBG8eaKi0yCCqxpnMB7bWzJ+EqHAb/GVq16u76Q5CzYMjBwMbVji
	pHZI2viPKGd7skAlvl81CcjsxZBvuALX+j9mMt3Lzg2COIC00bb0drr7J6gX1nsABnuBTorPNFLKp
	gWYXAA4e4StvP/qtoXmVyLJwrOBOHFGooqR1I/BPj7wPf7Ei4+s+XMwRTOrQ1xuD+KXn6q3GlZEE1
	3ck2J4iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzpLR-00000004j7K-2bES;
	Sat, 20 Sep 2025 04:37:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzpLQ-00000004j79-277E;
	Sat, 20 Sep 2025 04:37:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 97B0C6013A;
	Sat, 20 Sep 2025 04:37:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39687C4CEEB;
	Sat, 20 Sep 2025 04:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758343026;
	bh=XZcIJUwCAmn7bLiLcL6/z2NRHNOeBmZZikzGRXm2HZw=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=ku8k1gwv4/iu1UQeZn0Rt5uC9E7zQynusyjonfNbPSMWG6nLmZlKWTUL6fZ++ERXO
	 +nSsYbAt6SvR2VZa1++gw8sARcveq7SYJx8drmF93RdQaYZfBTQ4gfMP3FPLaLgzPY
	 7E2gf2xqlBnsj9HH1pni23CJiPXa/nJ+7jVHDJLfvKqeba5BHxyBdOGQC7qGDjENjs
	 SJ6bXqzEE4p1qmMuqi6rLYD4JOO/SV0wsGW8PS7kUgPxbCFVC82m0dcGH+x7RInNnf
	 cDfKxq7V6y6+H+jLcgFKVN1qab7uyLVXzSZYHD7Tmf+3YN5a0ybS2wd/TpQqWdyg5h
	 0dzdwdGTrYlhA==
Message-ID: <71462d3c-8865-47fe-949c-2dd154bd90dc@kernel.org>
Date: Sat, 20 Sep 2025 13:37:02 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vincent Mailhol <mailhol@kernel.org>
Subject: Re: [PATCH v6 2/9] phy: phy-can-transceiver: Introduce
 can_transceiver_priv
To: Peng Fan <peng.fan@nxp.com>
Cc: linux-can@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Marc Kleine-Budde <mkl@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Aswath Govindraju <a-govindraju@ti.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
 Haibo Chen <haibo.chen@nxp.com>
References: <20250909-can-v6-0-1cc30715224c@nxp.com>
 <20250909-can-v6-2-1cc30715224c@nxp.com>
Content-Language: en-US
Autocrypt: addr=mailhol@kernel.org; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 JFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbEBrZXJuZWwub3JnPsKZBBMWCgBBFiEE7Y9wBXTm
 fyDldOjiq1/riG27mcIFAmdfB/kCGwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcC
 F4AACgkQq1/riG27mcKBHgEAygbvORJOfMHGlq5lQhZkDnaUXbpZhxirxkAHwTypHr4A/joI
 2wLjgTCm5I2Z3zB8hqJu+OeFPXZFWGTuk0e2wT4JzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrb
 YZzu0JG5w8gxE6EtQe6LmxKMqP6EyR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDl
 dOjiq1/riG27mcIFAmceMvMCGwwFCQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8V
 zsZwr/S44HCzcz5+jkxnVVQ5LZ4BANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <20250909-can-v6-2-1cc30715224c@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

A couple nitpicks. I was hesitating to send this, but because it seems there
will be a v7 anyway, could be worth to integrate these as well.

On 09/09/2025 at 14:40, Peng Fan wrote:
> To prepare for dual-channel phy support, introduce can_transceiver_priv as
> a higher level encapsulation for phy and mux_state.
> 
> No functional changes.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/phy/phy-can-transceiver.c | 41 ++++++++++++++++++++++++++-------------
>  1 file changed, 27 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/phy/phy-can-transceiver.c b/drivers/phy/phy-can-transceiver.c
> index f59caff4b3d4c267feca4220bf1547b6fad08f95..6415c6af0e8414a6cc8d15958a17ee749a3f28e9 100644
> --- a/drivers/phy/phy-can-transceiver.c
> +++ b/drivers/phy/phy-can-transceiver.c
> @@ -23,6 +23,11 @@ struct can_transceiver_phy {
>  	struct phy *generic_phy;
>  	struct gpio_desc *standby_gpio;
>  	struct gpio_desc *enable_gpio;
> +	struct can_transceiver_priv *priv;
> +};
> +
> +struct can_transceiver_priv {
> +	struct can_transceiver_phy *can_transceiver_phy;
>  	struct mux_state *mux_state;
>  };
>  
> @@ -32,8 +37,8 @@ static int can_transceiver_phy_power_on(struct phy *phy)
>  	struct can_transceiver_phy *can_transceiver_phy = phy_get_drvdata(phy);
>  	int ret;
>  
> -	if (can_transceiver_phy->mux_state) {
> -		ret = mux_state_select(can_transceiver_phy->mux_state);
> +	if (can_transceiver_phy->priv->mux_state) {
> +		ret = mux_state_select(can_transceiver_phy->priv->mux_state);
>  		if (ret) {
>  			dev_err(&phy->dev, "Failed to select CAN mux: %d\n", ret);
>  			return ret;
> @@ -56,8 +61,8 @@ static int can_transceiver_phy_power_off(struct phy *phy)
>  		gpiod_set_value_cansleep(can_transceiver_phy->standby_gpio, 1);
>  	if (can_transceiver_phy->enable_gpio)
>  		gpiod_set_value_cansleep(can_transceiver_phy->enable_gpio, 0);
> -	if (can_transceiver_phy->mux_state)
> -		mux_state_deselect(can_transceiver_phy->mux_state);
> +	if (can_transceiver_phy->priv->mux_state)
> +		mux_state_deselect(can_transceiver_phy->priv->mux_state);
>  
>  	return 0;
>  }
> @@ -107,7 +112,7 @@ static int can_transceiver_phy_probe(struct platform_device *pdev)
>  {
>  	struct phy_provider *phy_provider;
>  	struct device *dev = &pdev->dev;
> -	struct can_transceiver_phy *can_transceiver_phy;

Considering the number on time you are accessing priv->can_transceiver_phy, I
think it is better to keep this local variable.

With this, the patch diff is also smaller.

> +	struct can_transceiver_priv *priv;
>  	const struct can_transceiver_data *drvdata;
>  	const struct of_device_id *match;
>  	struct phy *phy;
> @@ -117,18 +122,25 @@ static int can_transceiver_phy_probe(struct platform_device *pdev)
>  	u32 max_bitrate = 0;
>  	int err;
>  
> -	can_transceiver_phy = devm_kzalloc(dev, sizeof(struct can_transceiver_phy), GFP_KERNEL);
> -	if (!can_transceiver_phy)
> -		return -ENOMEM;
> -
>  	match = of_match_node(can_transceiver_phy_ids, pdev->dev.of_node);
>  	drvdata = match->data;
>  
> +	priv = devm_kzalloc(dev, sizeof(struct can_transceiver_priv), GFP_KERNEL);
                                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

  sizeof(*priv)

> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	priv->can_transceiver_phy = devm_kzalloc(dev, sizeof(struct can_transceiver_phy),

After adding back the can_transceiver_phy variable:

  sizeof(*can_transceiver_phy)

> +						 GFP_KERNEL);
> +	if (!priv->can_transceiver_phy)
> +		return -ENOMEM;
> +
>  	mux_state = devm_mux_state_get_optional(dev, NULL);
>  	if (IS_ERR(mux_state))
>  		return PTR_ERR(mux_state);
>  
> -	can_transceiver_phy->mux_state = mux_state;
> +	priv->mux_state = mux_state;
>  
>  	phy = devm_phy_create(dev, dev->of_node,
>  			      &can_transceiver_phy_ops);
> @@ -142,23 +154,24 @@ static int can_transceiver_phy_probe(struct platform_device *pdev)
>  		dev_warn(dev, "Invalid value for transceiver max bitrate. Ignoring bitrate limit\n");
>  	phy->attrs.max_link_rate = max_bitrate;
>  
> -	can_transceiver_phy->generic_phy = phy;
> +	priv->can_transceiver_phy->generic_phy = phy;
> +	priv->can_transceiver_phy->priv = priv;
>  
>  	if (drvdata->flags & CAN_TRANSCEIVER_STB_PRESENT) {
>  		standby_gpio = devm_gpiod_get_optional(dev, "standby", GPIOD_OUT_HIGH);
>  		if (IS_ERR(standby_gpio))
>  			return PTR_ERR(standby_gpio);
> -		can_transceiver_phy->standby_gpio = standby_gpio;
> +		priv->can_transceiver_phy->standby_gpio = standby_gpio;
>  	}
>  
>  	if (drvdata->flags & CAN_TRANSCEIVER_EN_PRESENT) {
>  		enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
>  		if (IS_ERR(enable_gpio))
>  			return PTR_ERR(enable_gpio);
> -		can_transceiver_phy->enable_gpio = enable_gpio;
> +		priv->can_transceiver_phy->enable_gpio = enable_gpio;
>  	}
>  
> -	phy_set_drvdata(can_transceiver_phy->generic_phy, can_transceiver_phy);
> +	phy_set_drvdata(priv->can_transceiver_phy->generic_phy, priv->can_transceiver_phy);
>  
>  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);


Yours sincerely,
Vincent Mailhol



