Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E26DC02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 02:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fNMlPGfKgauQMxW1H8g2hRo2EEu+h6BfxxkyPM7mc1U=; b=Lbmq/pIBb9tl4FY2bthPnnhu/A
	oM3yKQ0IjtM7kXfVocwo53QNGhLrWIwtKWnS+ftArPqKsxu50njculL26/p28SsON3fkf1NHYPX1P
	vcjgY5KSzNHmKmRZIlxlIPxmyhNZCXchgnXVu0MITNKbXVWtkvQGGMOqOkJ5WMvu0nwheB65xZ2oF
	1W3/Ee0a/YuXNjvSOzrO5oe9uQr3xoWddDkpkYPPzzF6pihC9oUxD2sbYPpMmpWcXA9OFypRww7Rg
	OzbHxfCjHwREUJoqkbbaYicRz+g3SaAZjPtlYTcr1mdl5TCrpACrG/JDc978UYvRMED9TrHSkgdue
	d1X2ajuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYFAz-0000000Danf-2URN;
	Thu, 16 Jan 2025 02:00:05 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYF9i-0000000DaXt-0Txg;
	Thu, 16 Jan 2025 01:58:47 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1tYF9Q-000000005g8-1tmN;
	Thu, 16 Jan 2025 01:58:28 +0000
Date: Thu, 16 Jan 2025 01:58:23 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH net-next 3/3] net: phy: mediatek: add driver for built-in
 2.5G ethernet PHY on MT7988
Message-ID: <Z4hnv2lzy8Ntd_Hp@makrotopia.org>
References: <20250116012159.3816135-1-SkyLake.Huang@mediatek.com>
 <20250116012159.3816135-4-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116012159.3816135-4-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_175846_158253_6016F2EE 
X-CRM114-Status: GOOD (  22.26  )
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

Hi Sky,

On Thu, Jan 16, 2025 at 09:21:58AM +0800, Sky Huang wrote:
> From: Sky Huang <skylake.huang@mediatek.com>
> 
> Add support for internal 2.5Gphy on MT7988. This driver will load
> necessary firmware and add appropriate time delay to make sure
> that firmware works stably. Also, certain control registers will
> be set to fix link-up issues.
> 
> Signed-off-by: Sky Huang <skylake.huang@mediatek.com>
> ---
>  MAINTAINERS                          |   1 +
>  drivers/net/phy/mediatek/Kconfig     |  11 +
>  drivers/net/phy/mediatek/Makefile    |   1 +
>  drivers/net/phy/mediatek/mtk-2p5ge.c | 343 +++++++++++++++++++++++++++
>  4 files changed, 356 insertions(+)
>  create mode 100644 drivers/net/phy/mediatek/mtk-2p5ge.c
> 
> [...]
> +static int mt798x_2p5ge_phy_probe(struct phy_device *phydev)
> +{
> +	struct mtk_i2p5ge_phy_priv *priv;
> +
> +	priv = devm_kzalloc(&phydev->mdio.dev,
> +			    sizeof(struct mtk_i2p5ge_phy_priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	switch (phydev->drv->phy_id) {
> +	case MTK_2P5GPHY_ID_MT7988:
> +		/* The original hardware only sets MDIO_DEVS_PMAPMD */
> +		phydev->c45_ids.mmds_present |= MDIO_DEVS_PCS |
> +						MDIO_DEVS_AN |
> +						MDIO_DEVS_VEND1 |
> +						MDIO_DEVS_VEND2;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	priv->fw_loaded = false;
> +	phydev->priv = priv;
> +
> +	mtk_phy_leds_state_init(phydev);

Calling mtk_phy_leds_state_init() can't work without also defining
led_hw_control_get() for that driver.

This is what mtk_phy_leds_state_init() does:
        for (i = 0; i < 2; ++i)
                phydev->drv->led_hw_control_get(phydev, i, NULL);

The driver lacking led_hw_control_get() method (see below) will make
this a call to a NULL function pointer.

Imho it's fine to add the driver without support for the LEDs for now
and add LED support later on. But in that case you also shouldn't call
mtk_phy_leds_state_init().

> +
> +	return 0;
> +}
> +
> +static struct phy_driver mtk_2p5gephy_driver[] = {
> +	{
> +		PHY_ID_MATCH_MODEL(MTK_2P5GPHY_ID_MT7988),
> +		.name = "MediaTek MT7988 2.5GbE PHY",
> +		.probe = mt798x_2p5ge_phy_probe,
> +		.config_init = mt798x_2p5ge_phy_config_init,
> +		.config_aneg = mt798x_2p5ge_phy_config_aneg,
> +		.get_features = mt798x_2p5ge_phy_get_features,
> +		.read_status = mt798x_2p5ge_phy_read_status,
> +		.get_rate_matching = mt798x_2p5ge_phy_get_rate_matching,
> +		.suspend = genphy_suspend,
> +		.resume = genphy_resume,
> +		.read_page = mtk_phy_read_page,
> +		.write_page = mtk_phy_write_page,
> +	},
> +};
> +
> +module_phy_driver(mtk_2p5gephy_driver);
> +
> +static struct mdio_device_id __maybe_unused mtk_2p5ge_phy_tbl[] = {
> +	{ PHY_ID_MATCH_VENDOR(0x00339c00) },
> +	{ }
> +};
> +
> +MODULE_DESCRIPTION("MediaTek 2.5Gb Ethernet PHY driver");
> +MODULE_AUTHOR("SkyLake Huang <SkyLake.Huang@mediatek.com>");
> +MODULE_LICENSE("GPL");
> +
> +MODULE_DEVICE_TABLE(mdio, mtk_2p5ge_phy_tbl);
> +MODULE_FIRMWARE(MT7988_2P5GE_PMB_FW);
> -- 
> 2.45.2
> 

