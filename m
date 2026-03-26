Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6614910A3D8E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 12:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PA9iwmtkzKj9Ikfo9/YTRI8DYBCeEBqDSq+sUCDMqak=; b=NSrvo+HZNwOqu8Rs0kV31/Y4xL
	AIJM+NAmXUNrECAKth6tCd3j2pmlPcZpFGkbPkXpdhMJjkr+LhmewmcDoxhcjpeTQwS8eM4D/NFz/
	EybRG2HmjKSH7DS6r2Go65XtmJA8MnYA1VHpzB4uKsFP43RmSHwFyK+dfHhjVNMsRShHzFmYqYmbX
	yfAhl8Lp6Ufj93E29/CRHIJJl4ffdDtwQF7It2i+XMASp7DW+S0HS/6Hi95C5xn3673izKnNCxET9
	1s8eVHbu0hu+qH9PhSnZAppjM63IDv4W0zBdaCxiL8rzyR6sq/mN+KmGthxLRQ2o7J+7582pHApmH
	rq/WyPYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5k80-00000005UHO-45QE;
	Thu, 26 Mar 2026 12:48:00 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5k7y-00000005UGz-0ExX;
	Thu, 26 Mar 2026 12:47:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=PA9iwmtkzKj9Ikfo9/YTRI8DYBCeEBqDSq+sUCDMqak=; b=uKUnAe1I0gtODvDexpiP1eYn+R
	9Z/SzkqaIY5/pjMge45XSOjwGrvWIIAwgzy/zMNk2vriES1mDVXqbm3fSUpJyy6pqgc30UF6xSJ8u
	CvyDA+oMLUiSnVP9yIGxIQcThbKuX31hY75UQmOFRPE9bZjmsQaS65k87U7N/sys580c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w5k7j-00DTiW-NH; Thu, 26 Mar 2026 13:47:43 +0100
Date: Thu, 26 Mar 2026 13:47:43 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, kevin-kw.huang@airoha.com,
	macpaul.lin@mediatek.com, matthias.bgg@gmail.com,
	kernel@collabora.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 4/4] net: phy: Introduce Airoha AN8801/R
 Gigabit Ethernet PHY driver
Message-ID: <3688a285-7f98-4afa-80ad-697094cd7b97@lunn.ch>
References: <20260326-add-airoha-an8801-support-v2-0-1a42d6b6050f@collabora.com>
 <20260326-add-airoha-an8801-support-v2-4-1a42d6b6050f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326-add-airoha-an8801-support-v2-4-1a42d6b6050f@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_054758_098548_F68195CB 
X-CRM114-Status: GOOD (  15.50  )
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

> +static int an8801r_led_blink_set(struct phy_device *phydev, u8 index,
> +				 unsigned long *delay_on,
> +				 unsigned long *delay_off)
> +{

...

> +	ret = phy_modify_mmd(phydev, MDIO_MMD_VEND2, LED_ON_CTRL(index),
> +			     LED_ON_EN, blink ? LED_ON_EN : 0);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

Just


	return phy_modify_mmd(phydev, MDIO_MMD_VEND2, LED_ON_CTRL(index),
			     LED_ON_EN, blink ? LED_ON_EN : 0);

> +		if (!led_trigger)
> +			continue;
> +
> +		ret = an8801r_led_hw_control_set(phydev, led_id, led_trigger);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}


Please take a look at all your functions. Can the last error check be
removed and just use return ret, etc.

> +static int an8801r_of_init_leds(struct phy_device *phydev, u8 *led_cfg)
> +{
> +	struct device *dev = &phydev->mdio.dev;
> +	struct device_node *np = dev->of_node;
> +	struct device_node *leds;
> +	u32 function_enum_idx;
> +	int ret;
> +
> +	if (!np)
> +		return 0;
> +
> +	/* If devicetree is present, leds configuration is required */
> +	leds = of_get_child_by_name(np, "leds");
> +	if (!leds)
> +		return 0;
> +
> +	for_each_available_child_of_node_scoped(leds, led) {
> +		u32 led_idx;
> +
> +		ret = of_property_read_u32(led, "reg", &led_idx);
> +		if (ret)
> +			goto out;
> +
> +		if (led_idx >= AN8801R_NUM_LEDS) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		ret = of_property_read_u32(led, "function-enumerator",
> +					   &function_enum_idx);
> +		if (ret)
> +			function_enum_idx = AN8801R_LED_FN_NONE;
> +

What is this doing? Is this documented in the binding?

> +		if (function_enum_idx >= AN8801R_LED_FN_MAX) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		led_cfg[led_idx] = function_enum_idx;
> +	}
> +out:
> +	of_node_put(leds);
> +	return ret;
> +}

> +static int an8801r_read_status(struct phy_device *phydev)
> +{
> +	int prev_speed, ret;
> +	u32 val;
> +
> +	prev_speed = phydev->speed;
> +
> +	ret = genphy_read_status(phydev);
> +	if (ret)
> +		return ret;
> +
> +	if (phydev->link && prev_speed != phydev->speed) {
> +		val = phydev->speed == SPEED_1000 ?
> +		      AN8801_BPBUS_LINK_MODE_1000 : 0;
> +
> +		return an8801_buckpbus_reg_rmw(phydev,
> +					       AN8801_BPBUS_REG_LINK_MODE,
> +					       AN8801_BPBUS_LINK_MODE_1000,
> +					       val);
> +	};

This is unusual. What is it doing? Please add a comment.

	Andrew

