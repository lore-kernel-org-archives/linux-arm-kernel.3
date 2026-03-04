Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762E4EF8FF3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 15:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqPIfe+mfsqFhoVG72QNFvYOtrojMOGGbstCn1l5Va0=; b=vbATX4c+J3fIANDUgSWPCRro2H
	QnQlvPvihiXlz4iO/hA0G6lh0Adz5njGtE6dQn3TR7o6V54t2d7vvfAWTfl4B+S+S50PU7pXGl8wV
	vrhXk5oTHFOn1Wmj3T/UQlMDvNxNdvy+KfflismZjViBovPYhF80X630ArZX16q/Vl2SaDlzbidof
	fFt9WxWwwkkj/TzmbQtyeFnwnoCRV6ENqU1RYFYSZaaQnC8PNdJjxwYOqB6XkOR4j+8tMVoaFlc41
	ZP0wmsdyty0EOW86cbdASg8n70AoSpaXdAYnsC+lizq5Qj51lkD0ZsgQ6nC0gRpbIQEIJutvnse43
	74hun9Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxnhg-0000000HV6A-1pow;
	Wed, 04 Mar 2026 15:00:00 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxnhe-0000000HV5h-1vli;
	Wed, 04 Mar 2026 14:59:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vqPIfe+mfsqFhoVG72QNFvYOtrojMOGGbstCn1l5Va0=; b=BexXbVtFTtWrabAERt3I7VaQUE
	1MDE/MWnlrPGimoVaeUcdFk3FB5zaA8BjNLAPHpAYn7v9Q4G0Kwcr5Jl3Q1XLsVswkXw0CyTTLaL/
	g/dxJutxfPtrr083s9hbQTqwycBJ/VpA4S0S99OWCob94R/W08s1BOKSyzpRiCrzXEWM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vxnhP-00A7ZE-C5; Wed, 04 Mar 2026 15:59:43 +0100
Date: Wed, 4 Mar 2026 15:59:43 +0100
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
Subject: Re: [PATCH net-next 2/2] net: phy: Introduce Airoha AN8801/R Gigabit
 Ethernet PHY driver
Message-ID: <3fbfabf7-b3af-405b-ade4-4f62db2c1c45@lunn.ch>
References: <20260304-add-airoha-an8801-support-v1-0-0ae4ee5a2f9d@collabora.com>
 <20260304-add-airoha-an8801-support-v1-2-0ae4ee5a2f9d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-add-airoha-an8801-support-v1-2-0ae4ee5a2f9d@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_065958_521881_DBFB6DD7 
X-CRM114-Status: GOOD (  22.68  )
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

> +static int an8801r_did_interrupt(struct phy_device *phydev)
> +{
> +	u32 irq_en, irq_status;
> +	int ret;
> +
> +	ret = air_buckpbus_reg_read(phydev, AN8801_BPBUS_REG_WAKE_IRQ_EN,
> +				    &irq_en);
> +	if (ret)
> +		return ret;
> +
> +	ret = air_buckpbus_reg_read(phydev, AN8801_BPBUS_REG_WAKE_IRQ_STS,
> +				    &irq_status);
> +	if (ret)
> +		return ret;
> +
> +	if (irq_status & AN8801_IRQ_WAKE_MAGICPKT)
> +		return 0;

With a name like an8801r_did_interrupt() you would expect the return
value to be some value of True, if there was an interrupt. I would
suggest either a different name, or return 1. Maybe also add a
kerneldoc header indicating the return values, since it is probably
not going to be standard.

> +static void an8801r_get_wol(struct phy_device *phydev,
> +			    struct ethtool_wolinfo *wol)
> +{
> +	u32 reg_val;
> +
> +	air_buckpbus_reg_read(phydev, AN8801_BPBUS_REG_WAKEUP_CTL1, &reg_val);
> +
> +	wol->supported = WAKE_MAGIC;

How does WoL work on this device. Only via interrupts? If so, maybe
you should only return WAKE_MAGIC as supported if there is a valid
interrupt?

> +static int an8801r_rgmii_delay_config(struct phy_device *phydev)
> +{
> +	switch (phydev->interface) {
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +		return an8801r_rgmii_txdelay(phydev, 4);
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +		return an8801r_rgmii_rxdelay(phydev, 0);
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +		return an8801r_rgmii_txdelay(phydev, 4);
> +		return an8801r_rgmii_rxdelay(phydev, 0);

The parameters look very odd here. 4 means 2ns, but 0 also means 0ns?
Can this API be improved?

Also, PHY_INTERFACE_MODE_RGMII_TXID means 2ns delay for TX, but it
also means 0ns delay for RX. The code appears to be missing this
second part.


> +	case PHY_INTERFACE_MODE_RGMII:

And here you should be disabling all delays. We have seen boards where
the strapping is wrong, the PHY boots in RGMII_ID, but RGMII is
required, and so the driver must fully implement
PHY_INTERFACE_MODE_RGMII disabling the delays.

> +static int an8801r_config_init(struct phy_device *phydev)
> +{
> +	u8 led_default_function[AN8801R_NUM_LEDS] = { 0 };
> +	int prev_page, ret;
> +
> +	ret = an8801r_of_init_leds(phydev, led_default_function);
> +	if (ret)
> +		return ret;
> +
> +	/* Disable Low Power Mode (LPM) */
> +	ret = phy_write_mmd(phydev, MDIO_MMD_VEND2, AN8801_REG_PHY_INTERNAL0,
> +			    FIELD_PREP(AN8801_PHY_INTFUNC_MASK, 0x1e));
> +	if (ret)
> +		return ret;
> +
> +	ret = phy_write_mmd(phydev, MDIO_MMD_VEND2, AN8801_REG_PHY_INTERNAL1,
> +			    FIELD_PREP(AN8801_PHY_INTFUNC_MASK, 0x2));
> +	if (ret)
> +		return ret;
> +
> +	/* Disable EEE by default */
> +	ret = phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);
> +	if (ret)
> +		return ret;

Why? If EEE is broken, this is not sufficient to stop a user
re-enabling it.

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

You configure the PHY to support downshift. If it has performed a
downshift, does it report the actual speed in the usual registers read
by genphy_read_status(), or is it necessary to read a vendor register?

> +static struct phy_driver airoha_driver[] = {
> +{
> +	PHY_ID_MATCH_MODEL(AN8801R_PHY_ID),
> +	.name			= "Airoha AN8801R",
> +	.features		= PHY_GBIT_FEATURES,

Should not be needed, if the PHY enumerates its capabilities
correctly.

    Andrew

---
pw-bot: cr

