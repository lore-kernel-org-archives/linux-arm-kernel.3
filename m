Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF99C4450D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 12:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blJQMqqu4tFSTWEqphnNTUonZrAUAH4mGc9+Tb33mXU=; b=tcaN1V4J7Jq4U6RTktD39rSWAh
	Bl+frFdiVCfXqGdp60ecK3zbSNbA63Adh3JJL+sEtJEzT1f48dPzBHwB4HX4A2F7qhY+ryzecd8iT
	+Sj51VqKDSk6UPZ5a0KtrXmhmP46PODjwOlASWXAyr6K4R9F3Ri3fhNhw2TirJkjqzGgW9Nkp3RAI
	K+RtNttno9Frg+e91PvxeJ+pvL3XV7bg5uf0RJxJzFVptMnMDilE8AbFTFQFbMuaSZNunVPYtVLQL
	7APDEYk+A5Q9Xizr6EBvjRH/DQ7qepzOO9c1hDTgm0BYZrjcg02sBy+P9M2BbcK0JvhXFkRqVGy9Y
	lQ4d1zHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viWyH-00000005NzF-2OzJ;
	Wed, 21 Jan 2026 12:06:01 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viWyE-00000005NyP-1cVs;
	Wed, 21 Jan 2026 12:06:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=blJQMqqu4tFSTWEqphnNTUonZrAUAH4mGc9+Tb33mXU=; b=wsvJyjsNN/dYonRihTeNndKH9F
	E/iD+wYJydFtrHcrFyiRcrd82HQJfY+uODv6NnB2BTgelcP1smsdmQPShauQm7SXsKaCpX/FfoV3S
	7sqmuUhd6HRcy87hF/jnI6pg1PS3AGMRcBqqKxpHBNhMNbTLCOTDbFQJHoX3RgML7qcucH1qZQ5ei
	CDtnaon+ZuhgbQLeUC7D4DpRYPdEuiZdpbRBQ/3sFcVTkFVZ9/M3QFXxRRdVtcuo6qgKMIe2oGn8j
	2PDijyfLXOMMxxAc7Oznp3pQT/h4V7d51svvzCsk3l+MaQ4eElB1307EBV5wIS9Iexn+ER22dIbYX
	TY/2SJ5w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35426)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1viWxq-000000007Of-16nY;
	Wed, 21 Jan 2026 12:05:34 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1viWxm-000000008Qh-3nJy;
	Wed, 21 Jan 2026 12:05:30 +0000
Date: Wed, 21 Jan 2026 12:05:30 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yao Zi <ziyao@disroot.org>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v2 3/3] net: stmmac: Add glue layer for Spacemit
 K3 SoC
Message-ID: <aXDBCsfaNrgfGjNK@shell.armlinux.org.uk>
References: <20260121071315.940130-1-inochiama@gmail.com>
 <20260121071315.940130-4-inochiama@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121071315.940130-4-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_040558_421553_90F34F73 
X-CRM114-Status: GOOD (  14.90  )
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

On Wed, Jan 21, 2026 at 03:13:11PM +0800, Inochi Amaoto wrote:
> +	mask = RGMII_RX_DLINE_STEP | RGMII_TX_DLINE_CODE | RGMII_TX_DLINE_EN |
> +	       RGMII_TX_DLINE_STEP | RGMII_RX_DLINE_CODE | RGMII_RX_DLINE_EN;
> +	val = FIELD_PREP(RGMII_TX_DLINE_STEP, tx_config) |
> +	      FIELD_PREP(RGMII_TX_DLINE_CODE, tx_code) | RGMII_TX_DLINE_EN |
> +	      FIELD_PREP(RGMII_RX_DLINE_STEP, rx_config) |
> +	      FIELD_PREP(RGMII_RX_DLINE_CODE, rx_code) | RGMII_RX_DLINE_EN;

So your reply where you basically stated that all the RGMII.*DLINE.*
constants here should be the same was nonsense. How can we trust your
replies?

> +static int spacemit_dwmac_fix_delay(struct plat_stmmacenet_data *plat_dat,
> +				    struct regmap *apmu,
> +				    unsigned int dline_offset,
> +				    unsigned int tx_delay, unsigned int rx_delay)
> +{
> +	bool mac_rxid = rx_delay != 0;
> +	bool mac_txid = tx_delay != 0;
> +	unsigned int rx_config = 0;
> +	unsigned int tx_config = 0;
> +	int rx_code;
> +	int tx_code;
> +
> +	plat_dat->phy_interface = phy_fix_phy_mode_for_mac_delays(plat_dat->phy_interface,
> +								  mac_txid,
> +								  mac_rxid);

Maybe Andrew can confirm, but this function was to fix up existing
broken DT, and shouldn't be used by brand new drivers.

> +	plat_dat->clk_tx_i = devm_clk_get_enabled(&pdev->dev, "tx");
> +	if (IS_ERR(plat_dat->clk_tx_i))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(plat_dat->clk_tx_i),
> +				     "failed to get tx clock\n");

As stated on the previous series, please don't abuse clk_tx_i for
soemthing that isn't the dwmac's clk_tx_i signal.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

