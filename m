Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096C7C021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 15:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gzj0SwPRaTNirTrm9WLzsRKYWUJkOtFVhEJhOoLZ8NU=; b=e28+1covC4DXt8slBU8hfF1knY
	uCiGyeoXcKB2d1hnh8JJ5eG3MidrBI3HhvT7I3OS0t2XDHWzXGv4WQ4RLhLQ/2MCgBo+L5Yn9U2PN
	oJNk1O/gYQf7mBv0ATBr+0rp9zCoVxhdBppES9FQmOKIehqTfVa64aZw3g7pLMNHhWvuGMB7ZssUP
	EnoE2TRVq+NQHUgD+Ejg/hcpe7YGZwhVNf9ulmYitQdnEndotn+HwWficwJkRHJMgjPFx48cEBNV+
	Yn2oMlxl9TCdFlp9ZjH2ual4O9AUL9Pv5TgaoM0SEA9M3bXsI56f9x4pCdEtJWhVyKm7iJLLG+2YD
	ZLqmvHJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkmKi-0000000Ddre-0dIB;
	Wed, 19 Feb 2025 15:49:56 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkmIx-0000000DdND-2H0B;
	Wed, 19 Feb 2025 15:48:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Gzj0SwPRaTNirTrm9WLzsRKYWUJkOtFVhEJhOoLZ8NU=; b=wYl0ItI6OysoRYTR2q06G8db9m
	xrqJ+Qb/eBCyNzxAC5xNTOThx6DwY+l1zz0mkvDE1nW0Ef4+USboaTSwCkHkY62Awu71DRmFK/1lN
	ZevniaXm6WXfyNWd/Nkl6CoJLI5K/f0jqwUbV2h58AxxTTDnM7bXkibhpQg+41z6r/js=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tkmIh-00Ffmc-UA; Wed, 19 Feb 2025 16:47:51 +0100
Date: Wed, 19 Feb 2025 16:47:51 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH net-next v2 3/3] net: phy: mediatek: add driver for
 built-in 2.5G ethernet PHY on MT7988
Message-ID: <724eff11-c6d1-40e1-a99f-205f5426a07d@lunn.ch>
References: <20250219083910.2255981-1-SkyLake.Huang@mediatek.com>
 <20250219083910.2255981-4-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219083910.2255981-4-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_074807_578330_87DC3491 
X-CRM114-Status: GOOD (  23.88  )
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

> +config MEDIATEK_2P5GE_PHY
> +	tristate "MediaTek 2.5Gb Ethernet PHYs"
> +	depends on (ARM64 && ARCH_MEDIATEK) || COMPILE_TEST
> +	select MTK_NET_PHYLIB
> +	help
> +	  Supports MediaTek SoC built-in 2.5Gb Ethernet PHYs.
> +
> +	  This will load necessary firmware and add appropriate time delay.
> +	  Accelerate this procedure through internal pbus instead of MDIO
> +	  bus. Certain link-up issues will also be fixed here.

Please keep the file sorted, this should be the first entry.

> diff --git a/drivers/net/phy/mediatek/Makefile b/drivers/net/phy/mediatek/Makefile
> index 814879d0abe5..c6db8abd2c9c 100644
> --- a/drivers/net/phy/mediatek/Makefile
> +++ b/drivers/net/phy/mediatek/Makefile
> @@ -2,3 +2,4 @@
>  obj-$(CONFIG_MTK_NET_PHYLIB)		+= mtk-phy-lib.o
>  obj-$(CONFIG_MEDIATEK_GE_PHY)		+= mtk-ge.o
>  obj-$(CONFIG_MEDIATEK_GE_SOC_PHY)	+= mtk-ge-soc.o
> +obj-$(CONFIG_MEDIATEK_2P5GE_PHY)	+= mtk-2p5ge.o

I suppose you could say this file is sorted in reverse order so is
correct?

> diff --git a/drivers/net/phy/mediatek/mtk-2p5ge.c b/drivers/net/phy/mediatek/mtk-2p5ge.c
> new file mode 100644
> index 000000000000..adb03df331ab
> --- /dev/null
> +++ b/drivers/net/phy/mediatek/mtk-2p5ge.c
> @@ -0,0 +1,346 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +#include <linux/bitfield.h>
> +#include <linux/firmware.h>
> +#include <linux/module.h>
> +#include <linux/nvmem-consumer.h>

Is this header needed?

> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/phy.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>

And these two? Please only use those that are needed.

> +static int mt798x_2p5ge_phy_load_fw(struct phy_device *phydev)
> +{
> +
> +	writew(reg & ~MD32_EN, mcu_csr_base + MD32_EN_CFG);
> +	writew(reg | MD32_EN, mcu_csr_base + MD32_EN_CFG);
> +	phy_set_bits(phydev, MII_BMCR, BMCR_RESET);
> +	/* We need a delay here to stabilize initialization of MCU */
> +	usleep_range(7000, 8000);

Does the reset bit clear when the MCU is ready? That is what 802.3
defines. phy_poll_reset() might do what you need.

> +	dev_info(dev, "Firmware loading/trigger ok.\n");

dev_dbg(), if at all. You have already spammed the log with the
firmware version, so this adds nothing useful.

> +		phydev->duplex = DUPLEX_FULL;
> +		/* FIXME:
> +		 * The current firmware always enables rate adaptation mode.
> +		 */
> +		phydev->rate_matching = RATE_MATCH_PAUSE;

Can we tell current firmware for future firmware? Is this actually
fixable?

> +	}
> +
> +	return 0;
> +}
> +



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

What do you mean by "original hardware"? 

You use PHY_ID_MATCH_MODEL(MTK_2P5GPHY_ID_MT7988), so do you mean
revision 0 is broken, but revision 1 fixed it?


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

The LEDs work without firmware?

    Andrew

---
pw-bot: cr

