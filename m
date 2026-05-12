Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654E0CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 10:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yp1fdytKhgczNXp8hx7NGLHKbUoAsfvVyxx20NBUGrc=; b=L/Wz6lIovZlZQ0KeJSL/Jujg1I
	cWR5WqfeDrWd/lFemAhCBNFMjXNMlzJF/nSvvOfWueDdwqsWZW/eJXSF6UQM0yjv2K4xvYEAt2PtT
	cjo8+TJalPfc44OEuMtVYe738dsrB+w2wp8+23Oq7xt2o9M29fnH9tIREtFcWi7DFytE8RsitbnUR
	4b1SiBSnIbgWR2aMwxy8+tWccqw5ajeZV7LbZNywAlNfzZ9ddPphTtbUl+4C323OWaIt6HuZtY85l
	alrSsxLTVOyHMWvbVucbVmEatooiASX9G8DL03um9BonrGai02zceGF3GwHdExlcKNkX2EK8mNod7
	3GjYmMlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMk1B-0000000GNeT-1AaA;
	Tue, 12 May 2026 10:07:13 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMk17-0000000GNbo-3Tlz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 10:07:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8C02DC5E174;
	Tue, 12 May 2026 10:07:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 921DA60646;
	Tue, 12 May 2026 10:07:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8A0C311AF9D8C;
	Tue, 12 May 2026 12:06:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778580422; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Yp1fdytKhgczNXp8hx7NGLHKbUoAsfvVyxx20NBUGrc=;
	b=nOBWifubxiotEk+Plput5uZwfcLCh9WQTFgEdjp0PpXf/bZA3v77pWiI5MeJX6UzOq6eRa
	f/gjC73zGnC2ir5gm/x56NavRnHJgZbxZmLEXDuGlte2N5nEJEsJapmVpOZNF0S3nkrw8M
	NXnFKHG6dMNvH2VpTnoYJcH+39bRt944qmfr4F6MowpgSamWoVuz9VoNYb5sd2M6JlplXG
	n7sIJU4KnKEJ3YSF8l9HiyQJamfdUM6dIELywu+jsDgoM7z4i7QTE/ag5fEZoyiA6DGP+E
	jisNwk6jMym4ht2U3nrxbN21DS1Ky4xT21vF8nbgwHicDztDDgA7JtwPVZ69Cg==
Message-ID: <e77b4028-c201-4dd4-9214-721bdf67e976@bootlin.com>
Date: Tue, 12 May 2026 12:06:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 5/6] net: phy: Introduce Airoha AN8801/R
 Gigabit Ethernet PHY driver
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>
Cc: kevin-kw.huang@airoha.com, macpaul.lin@mediatek.com,
 matthias.bgg@gmail.com, kernel@collabora.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260512-add-airoha-an8801-support-v3-0-1edb34e363ae@collabora.com>
 <20260512-add-airoha-an8801-support-v3-5-1edb34e363ae@collabora.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260512-add-airoha-an8801-support-v3-5-1edb34e363ae@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_030710_029578_33B4BCF7 
X-CRM114-Status: GOOD (  14.86  )
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

Hi :)

This looks good, I just have very minimal comments

On 5/12/26 06:33, Louis-Alexis Eyraud wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Introduce a driver for the Airoha AN8801R Series Gigabit Ethernet
> PHY; this currently supports setting up PHY LEDs, 10/100M, 1000M
> speeds, and Wake on LAN and PHY interrupts.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

[...]

> +static u32 an8801r_led_blink_ms_to_hw(unsigned long req_ms)
> +{
> +	u32 req_ns, regval;
> +
> +	if (req_ms > AN8801_MAX_PERIOD_MS)
> +		req_ms = AN8801_MAX_PERIOD_MS;
> +
> +	req_ns = req_ms * 1000000;

Use NSEC_PER_MSEC :)

> +
> +	/* Round to the nearest period unit... */
> +	regval = req_ns + (AN8801_PERIOD_UNIT / 2);
> +
> +	/* ...and now divide by the full period */
> +	regval >>= AN8801_PERIOD_SHIFT;
> +
> +	return regval;
> +}
> +

[...]

> +static int an8801r_led_hw_control_set(struct phy_device *phydev, u8 index,
> +				      unsigned long rules)
> +{
> +	u16 on = 0, blink = 0;
> +	int ret;
> +
> +	if (index >= AN8801R_NUM_LEDS)
> +		return -EINVAL;
> +
> +	ret = an8801r_led_trig_to_hw(rules, &on, &blink);
> +	if (ret)
> +		return ret;
> +
> +	ret = phy_modify_mmd(phydev, MDIO_MMD_VEND2, LED_ON_CTRL(index),
> +			     LED_ON_EVT_MASK, on);
> +	if (ret)
> +		return ret;
> +
> +	ret = phy_modify_mmd(phydev, MDIO_MMD_VEND2, LED_BLINK_CTRL(index),
> +			     LED_BLINK_EVT_MASK, blink);
> +
> +	if (ret)
> +		return ret;

Extra newline before the if()

> +
> +	return phy_modify_mmd(phydev, MDIO_MMD_VEND2, LED_ON_CTRL(index),
> +			      LED_ON_EN, on | blink ? LED_ON_EN : 0);
> +}
> +

[...]

> +static int an8801r_rgmii_rxdelay(struct phy_device *phydev, bool enable,
> +				 u16 delay_steps)
> +{
> +	u32 reg_val;
> +
> +	if (delay_steps > RGMII_DELAY_STEP_MASK)
> +		return -EINVAL;
> +
> +	if (enable) {
> +		reg_val = delay_steps & RGMII_DELAY_STEP_MASK;
> +
> +		 /* Set align bit to add extra offset for RX delay */
> +		reg_val |= RGMII_RXDELAY_ALIGN;
> +
> +		 /* Set force mode bit to enable RX delay insertion */
> +		reg_val |= RGMII_RXDELAY_FORCE_MODE;
> +	} else {
> +		reg_val = 0;
> +	}
> +
> +	return an8801_buckpbus_reg_write(phydev, AN8801_BPBUS_REG_RXDLY_STEP,
> +					 reg_val);
> +}
> +
> +static int an8801r_rgmii_txdelay(struct phy_device *phydev, bool enable,
> +				 u16 delay_steps)
> +{
> +	u32 reg_val;
> +
> +	if (delay_steps > RGMII_DELAY_STEP_MASK)
> +		return -EINVAL;
> +
> +	if (enable) {
> +		reg_val = delay_steps & RGMII_DELAY_STEP_MASK;

Is this bitwise and needed, as you have the check above ?

> +
> +		 /* Set force mode bit to enable TX delay insertion */
> +		reg_val |= RGMII_TXDELAY_FORCE_MODE;
> +	} else {
> +		reg_val = 0;
> +	}
> +
> +	return an8801_buckpbus_reg_write(phydev, AN8801_BPBUS_REG_TXDLY_STEP,
> +					 reg_val);
> +}
> +
> +static int an8801r_rgmii_delay_config(struct phy_device *phydev)
> +{
> +	bool enable_delay;
> +	u16 delay_step;
> +	int ret;
> +
> +	if (phydev->interface == PHY_INTERFACE_MODE_RGMII_ID ||
> +	    phydev->interface == PHY_INTERFACE_MODE_RGMII_TXID) {
> +		enable_delay = true;
> +		delay_step = AN8801_RGMII_TXDELAY_DEFAULT;
> +	} else {
> +		enable_delay = false;
> +		delay_step = RGMII_DELAY_NO_STEP;
> +	}
> +
> +	ret = an8801r_rgmii_txdelay(phydev, enable_delay, delay_step);
> +	if (ret)
> +		return ret;
> +
> +	if (phydev->interface == PHY_INTERFACE_MODE_RGMII_ID ||
> +	    phydev->interface == PHY_INTERFACE_MODE_RGMII_RXID) {
> +		enable_delay = true;
> +		delay_step = AN8801_RGMII_RXDELAY_DEFAULT;

Is it correct that AN8801_RGMII_RXDELAY_DEFAULT expands to 
RGMII_DELAY_NO_STEP ? feels strange, but it may simply be how the HW is 
made :)

Thanks,

Maxime

