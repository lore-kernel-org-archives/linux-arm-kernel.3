Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5315FC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 13:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+AfK7MCkRVYWu8R51rsh6Q0jzO0vpYJ7OnABWuVAlLw=; b=DKQrhU0Mywpz8fDurVzWSBk3jx
	lZBAMLwp2VYakG7dS9EbGyYcRy3fJYXls87vm1HToCVLw2xjUU4vdc1ywAXQ7RQpl5lWtIxNBrvo1
	nfdTuycIptaEd9twEg0O9CT18GolFH9iT+yC27YvMDk7lETUiIb3WNO7lByvmeO2eu30BgfYR7wDe
	g8jjitwFe2pIVC2xBxROtSyJpyn6VxZepIN2G8Jc3cAC1JJDWeT3n/Ebrm2V5wqdrbYRTQ4x5tllk
	HG6wgEY4jr01M7MkP29Gl6y4Yd2Z4uxTgA1RdN++GTozcQGbgXncNrAZXuRgUKCyK0CIVRJeqMgYH
	MeLXdKdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFC5d-0000000FBvL-42SG;
	Wed, 14 May 2025 13:24:05 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB1b-0000000EzYK-49xb;
	Wed, 14 May 2025 12:15:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+AfK7MCkRVYWu8R51rsh6Q0jzO0vpYJ7OnABWuVAlLw=; b=dRHBEV2cEqxhfNzllZyhYafO0h
	/hTgKWQXQn7JZ09jG5zYsbQMXqlUDve784VuWkNKz1emP/PBXlLZ30KvDz7bWFgoM3/oPy+uBpVjE
	SjbfghHTiSnRM3iZf+nXifEOpdp47y3xmOahwnOA12NLahY7d+IzuTzHqoV1EehTa7VfFC6xJOxpg
	9f5/xe7kkVs4jCEDy3ktJ26eYruBhzENT2hJPxPLAIG0nqxdnaDXgxzlqyZWynPyO5bcnFhP39k9r
	urtICyboVUk0OcoE3KqPl0KUsfKFhxaNuRdyERMQwWYy2ew+yYBTxFtAfJWz5wvLdJlvWkLbODNqK
	y2ia513A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36192)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uFAzN-0007GH-1J;
	Wed, 14 May 2025 13:13:33 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uFAzG-0004FD-2Z;
	Wed, 14 May 2025 13:13:26 +0100
Date: Wed, 14 May 2025 13:13:26 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	balika011 <balika011@gmail.com>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH net-next v3 2/2] net: phy: mediatek: add driver for
 built-in 2.5G ethernet PHY on MT7988
Message-ID: <aCSI5k7uUgAlpSsy@shell.armlinux.org.uk>
References: <20250514105738.1438421-1-SkyLake.Huang@mediatek.com>
 <20250514105738.1438421-3-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514105738.1438421-3-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_051552_028559_DBCC3F0D 
X-CRM114-Status: GOOD (  19.09  )
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

Hi,

On Wed, May 14, 2025 at 06:57:38PM +0800, Sky Huang wrote:
> +#define MTK_2P5GPHY_ID_MT7988		(0x00339c11)
> +
> +#define MT7988_2P5GE_PMB_FW		"mediatek/mt7988/i2p5ge-phy-pmb.bin"
> +#define MT7988_2P5GE_PMB_FW_SIZE	(0x20000)
> +#define MT7988_2P5GE_PMB_FW_BASE	(0x0f100000)
> +#define MT7988_2P5GE_PMB_FW_LEN		(0x20000)
> +#define MTK_2P5GPHY_MCU_CSR_BASE	(0x0f0f0000)
> +#define MTK_2P5GPHY_MCU_CSR_LEN		(0x20)
> +#define MD32_EN_CFG			(0x18)

These parens are all unnecessary, as are ones below around a simple
number.

> +#define   MD32_EN			BIT(0)
> +
> +#define BASE100T_STATUS_EXTEND		(0x10)
> +#define BASE1000T_STATUS_EXTEND		(0x11)
> +#define EXTEND_CTRL_AND_STATUS		(0x16)
> +
> +#define PHY_AUX_CTRL_STATUS		(0x1d)
> +#define   PHY_AUX_DPX_MASK		GENMASK(5, 5)
> +#define   PHY_AUX_SPEED_MASK		GENMASK(4, 2)
> +
> +/* Registers on MDIO_MMD_VEND1 */
> +#define MTK_PHY_LPI_PCS_DSP_CTRL		(0x121)

...

> +static int mt798x_2p5ge_phy_load_fw(struct phy_device *phydev)
> +{
> +	void __iomem *mcu_csr_base, *pmb_addr;
> +	struct device *dev = &phydev->mdio.dev;

This will attract a comment about reverse christmas tree.

> +	const struct firmware *fw;
> +	int ret, i;
> +	u32 reg;

...

> +static int mt798x_2p5ge_phy_config_init(struct phy_device *phydev)
> +{
> +	struct pinctrl *pinctrl;
> +
> +	/* Check if PHY interface type is compatible */
> +	if (phydev->interface != PHY_INTERFACE_MODE_INTERNAL)
> +		return -ENODEV;
> +
> +	/* Setup LED */
> +	phy_set_bits_mmd(phydev, MDIO_MMD_VEND2, MTK_PHY_LED0_ON_CTRL,
> +			 MTK_PHY_LED_ON_POLARITY | MTK_PHY_LED_ON_LINK10 |
> +			 MTK_PHY_LED_ON_LINK100 | MTK_PHY_LED_ON_LINK1000 |
> +			 MTK_PHY_LED_ON_LINK2500);
> +	phy_set_bits_mmd(phydev, MDIO_MMD_VEND2, MTK_PHY_LED1_ON_CTRL,
> +			 MTK_PHY_LED_ON_FDX | MTK_PHY_LED_ON_HDX);
> +
> +	/* Switch pinctrl after setting polarity to avoid bogus blinking */
> +	pinctrl = devm_pinctrl_get_select(&phydev->mdio.dev, "i2p5gbe-led");
> +	if (IS_ERR(pinctrl))
> +		dev_err(&phydev->mdio.dev, "Fail to set LED pins!\n");

No, don't do this. config_init() can be called multiple times during
the lifetime of the driver bound to the device, and each time it is,
a new managed-dev structure will be allocated to release this action
each time, thus consuming more and more memory, or possibly failing
after the first depending on the pinctrl_get_select() behaviour.
Please find a different way.

...

> +static int mt798x_2p5ge_phy_config_aneg(struct phy_device *phydev)
> +{
> +	bool changed = false;
> +	u32 adv;
> +	int ret;
> +
> +	ret = genphy_c45_an_config_aneg(phydev);
> +	if (ret < 0)
> +		return ret;
> +	if (ret > 0)
> +		changed = true;
> +
> +	/* Clause 45 doesn't define 1000BaseT support. Use Clause 22 instead in
> +	 * our design.
> +	 */
> +	adv = linkmode_adv_to_mii_ctrl1000_t(phydev->advertising);
> +	ret = phy_modify_changed(phydev, MII_CTRL1000, ADVERTISE_1000FULL, adv);
> +	if (ret < 0)
> +		return ret;
> +	if (ret > 0)
> +		changed = true;
> +
> +	return __genphy_config_aneg(phydev, changed);

Do you want this (which will program EEE and the 10/100 advert) or do
you want genphy_check_and_restart_aneg() here? Note that
genphy_c45_an_config_aneg() will already have programmed both the EEE
and 10/100 adverts via the C45 registers.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

