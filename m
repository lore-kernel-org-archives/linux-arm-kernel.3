Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D880D5D674
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 17:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:To:References:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cdgcV6wo3982K6zQ+QcgyGnlNupSEkHhyOdc+H7ya3w=; b=C9uq/SiEHGp9bIRe38GDPN8KID
	Lusc3+tbWxTslF5cWysGRqtqjgk6c18d1PgfFdhswjM109DoOSSl27M3+kwqYnsSyI5Jaf+fVpxev
	Y7sOzN0k/I6FvDkQaYod3r/XrHHA6Jt91EdrioSU8d89Fra+cBL5L6dlO2zK0HWXielkJXCrEgfpQ
	huf2YRXPSmGVoR1hC1OYXwJp6M4uCBUj6W8WiSGwsI0nFIUGBQozZAsEGl+Gi8lB9ec3ue269XVOk
	e17qN3HhrLfGBzockQK3R6AMPX/8+GPc/2M47NwSu5nFQT77DfSKkAra9nZIefM2ERuxTyRfBEzcB
	xKaSHJiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t96jX-00000007sE7-0lzt;
	Thu, 07 Nov 2024 17:55:51 +0000
Received: from smtp-16.smtpout.orange.fr ([80.12.242.16] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t96hl-00000007ryD-3Q5d;
	Thu, 07 Nov 2024 17:54:04 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 96hdtNA5ljpcy96hdtxdSs; Thu, 07 Nov 2024 18:53:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1731002038;
	bh=cdgcV6wo3982K6zQ+QcgyGnlNupSEkHhyOdc+H7ya3w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To;
	b=OyqtHaea2fjLJu0H/uOFpRuDkMdy4/RBnhtlN+dvZY0oouNgU++MeW7A2UyeKd73T
	 KQTySv04bVQEoVMjE6VGH61YVW1zlLSdYfeq9wJFE82Jtjc23iNzrGWCTvQXcu8/o7
	 7YdowhKH0jxZWzj2I/jTomCm7+WUU0m7vzqE/HcYa5fx/2B1p7Yeoy4bIaJMnvqpjc
	 uo9EyePb9gFbaz8KAvpk+gR7h/GjNdO3bnWxvHPpiZwglSOBd9h6FbYhCy65CwZhdu
	 fJsrdoZP4sZgscMOz96BUjhPDgl9KL59akPQ3eGO5MYoRyDklOm1LkTNz+AJoNqGj/
	 lPorkANdFP9NQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 07 Nov 2024 18:53:58 +0100
X-ME-IP: 90.11.132.44
Message-ID: <4318897e-0f1a-42c7-8f20-065dc690a112@wanadoo.fr>
Date: Thu, 7 Nov 2024 18:53:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [net-next PATCH v3 2/3] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
References: <20241106122254.13228-1-ansuelsmth@gmail.com>
 <20241106122254.13228-3-ansuelsmth@gmail.com>
Content-Language: en-US, fr-FR
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno," <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@airoha.com
In-Reply-To: <20241106122254.13228-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_095402_395748_873853C3 
X-CRM114-Status: GOOD (  26.84  )
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

Le 06/11/2024 à 13:22, Christian Marangi a écrit :
> Add Airoha AN8855 5-Port Gigabit DSA switch.
> 
> The switch is also a nvmem-provider as it does have EFUSE to calibrate
> the internal PHYs.
> 
> Signed-off-by: Christian Marangi <ansuelsmth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---

Hi,

...

> +#include <linux/bitfield.h>
> +#include <linux/ethtool.h>
> +#include <linux/etherdevice.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/if_bridge.h>
> +#include <linux/iopoll.h>
> +#include <linux/mdio.h>
> +#include <linux/netdevice.h>
> +#include <linux/of_mdio.h>
> +#include <linux/of_net.h>
> +#include <linux/of_platform.h>
> +#include <linux/nvmem-provider.h>

Could be moved a few lines above to keep order.

> +#include <linux/phylink.h>
> +#include <linux/regmap.h>
> +#include <net/dsa.h>
...

> +static int an8855_port_fdb_dump(struct dsa_switch *ds, int port,
> +				dsa_fdb_dump_cb_t *cb, void *data)
> +{
> +	struct an8855_priv *priv = ds->priv;
> +	struct an8855_fdb _fdb = {  };

Should it but reseted in the do loop below, instead of only once here?

> +	int banks, count = 0;
> +	u32 rsp;
> +	int ret;
> +	int i;
> +
> +	mutex_lock(&priv->reg_mutex);
> +
> +	/* Load search port */
> +	ret = regmap_write(priv->regmap, AN8855_ATWD2,
> +			   FIELD_PREP(AN8855_ATWD2_PORT, port));
> +	if (ret)
> +		goto exit;
> +	ret = an8855_fdb_cmd(priv, AN8855_ATC_MAT(AND8855_FDB_MAT_MAC_PORT) |
> +			     AN8855_FDB_START, &rsp);
> +	if (ret < 0)
> +		goto exit;
> +
> +	do {
> +		/* From response get the number of banks to read, exit if 0 */
> +		banks = FIELD_GET(AN8855_ATC_HIT, rsp);
> +		if (!banks)
> +			break;
> +
> +		/* Each banks have 4 entry */
> +		for (i = 0; i < 4; i++) {
> +			count++;
> +
> +			/* Check if bank is present */
> +			if (!(banks & BIT(i)))
> +				continue;
> +
> +			/* Select bank entry index */
> +			ret = regmap_write(priv->regmap, AN8855_ATRDS,
> +					   FIELD_PREP(AN8855_ATRD_SEL, i));
> +			if (ret)
> +				break;
> +			/* wait 1ms for the bank entry to be filled */
> +			usleep_range(1000, 1500);
> +			an8855_fdb_read(priv, &_fdb);
> +
> +			if (!_fdb.live)
> +				continue;
> +			ret = cb(_fdb.mac, _fdb.vid, _fdb.noarp, data);
> +			if (ret < 0)
> +				break;
> +		}
> +
> +		/* Stop if reached max FDB number */
> +		if (count >= AN8855_NUM_FDB_RECORDS)
> +			break;
> +
> +		/* Read next bank */
> +		ret = an8855_fdb_cmd(priv, AN8855_ATC_MAT(AND8855_FDB_MAT_MAC_PORT) |
> +				     AN8855_FDB_NEXT, &rsp);
> +		if (ret < 0)
> +			break;
> +	} while (true);
> +
> +exit:
> +	mutex_unlock(&priv->reg_mutex);
> +	return ret;
> +}

...

> +	ret = regmap_set_bits(priv->regmap, AN8855_RG_RATE_ADAPT_CTRL_0,
> +			      AN8855_RG_RATE_ADAPT_RX_BYPASS |
> +			      AN8855_RG_RATE_ADAPT_TX_BYPASS |
> +			      AN8855_RG_RATE_ADAPT_RX_EN |
> +			      AN8855_RG_RATE_ADAPT_TX_EN);
> +	if (ret)
> +		return ret;
> +
> +	/* Disable AN if not in autoneg */
> +	ret = regmap_update_bits(priv->regmap, AN8855_SGMII_REG_AN0, BMCR_ANENABLE,
> +				 neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED ? BMCR_ANENABLE :
> +									      0);

Should 'ret' be tested here?

> +
> +	if (interface == PHY_INTERFACE_MODE_SGMII &&
> +	    neg_mode == PHYLINK_PCS_NEG_INBAND_DISABLED) {
> +		ret = regmap_set_bits(priv->regmap, AN8855_PHY_RX_FORCE_CTRL_0,
> +				      AN8855_RG_FORCE_TXC_SEL);
> +		if (ret)
> +			return ret;
> +	}

...

> +	priv->ds = devm_kzalloc(&mdiodev->dev, sizeof(*priv->ds), GFP_KERNEL);
> +	if (!priv->ds)
> +		return -ENOMEM;
> +
> +	priv->ds->dev = &mdiodev->dev;
> +	priv->ds->num_ports = AN8855_NUM_PORTS;
> +	priv->ds->priv = priv;
> +	priv->ds->ops = &an8855_switch_ops;
> +	mutex_init(&priv->reg_mutex);

devm_mutex_init() to slightly simplify the remove function?

> +	priv->ds->phylink_mac_ops = &an8855_phylink_mac_ops;
> +
> +	priv->pcs.ops = &an8855_pcs_ops;
> +	priv->pcs.neg_mode = true;
> +	priv->pcs.poll = true;
> +
> +	ret = an8855_sw_register_nvmem(priv);
> +	if (ret)
> +		return ret;
> +
> +	dev_set_drvdata(&mdiodev->dev, priv);
> +
> +	return dsa_register_switch(priv->ds);
> +}
> +
> +static void
> +an8855_sw_remove(struct mdio_device *mdiodev)
> +{
> +	struct an8855_priv *priv = dev_get_drvdata(&mdiodev->dev);
> +
> +	dsa_unregister_switch(priv->ds);
> +	mutex_destroy(&priv->reg_mutex);
> +}
> +
> +static const struct of_device_id an8855_of_match[] = {
> +	{ .compatible = "airoha,an8855" },
> +	{ /* sentinel */ },

Ending comma is usually not needed after a terminator.

> +};
> +
> +static struct mdio_driver an8855_mdio_driver = {
> +	.probe = an8855_sw_probe,
> +	.remove = an8855_sw_remove,
> +	.mdiodrv.driver = {
> +		.name = "an8855",
> +		.of_match_table = an8855_of_match,
> +	},
> +};

...

> +#define	  AN8855_VA0_VTAG_EN		BIT(10) /* Per VLAN Egress Tag Control */
> +#define	  AN8855_VA0_IVL_MAC		BIT(5) /* Independent VLAN Learning */
> +#define	  AN8855_VA0_VLAN_VALID		BIT(0) /* VLAN Entry Valid */
> +#define AN8855_VAWD1			0x10200608
> +#define	  AN8855_VA1_PORT_STAG		BIT(1)
> +
> +/* Same register map of VAWD0 */

Not sure to follow. AN8855_VAWD0 above is 0x10200604, not 0x10200618

> +#define AN8855_VARD0			0x10200618
> +
> +enum an8855_vlan_egress_attr {
> +	AN8855_VLAN_EGRESS_UNTAG = 0,
> +	AN8855_VLAN_EGRESS_TAG = 2,
> +	AN8855_VLAN_EGRESS_STACK = 3,
> +};
> +
> +/* Register for port STP state control */
> +#define AN8855_SSP_P(x)			(0x10208000 + ((x) * 0x200))
> +#define	 AN8855_FID_PST			GENMASK(1, 0)
> +
> +enum an8855_stp_state {
> +	AN8855_STP_DISABLED = 0,
> +	AN8855_STP_BLOCKING = 1,
> +	AN8855_STP_LISTENING = 1,

Just wondering if this 0, 1, *1*, 2, 3 was intentional?

> +	AN8855_STP_LEARNING = 2,
> +	AN8855_STP_FORWARDING = 3
> +};
> +
> +/* Register for port control */
> +#define AN8855_PCR_P(x)			(0x10208004 + ((x) * 0x200))
> +#define	  AN8855_EG_TAG			GENMASK(29, 28)
> +#define	  AN8855_PORT_PRI		GENMASK(26, 24)
> +#define	  AN8855_PORT_TX_MIR		BIT(20)
> +#define	  AN8855_PORT_RX_MIR		BIT(16)
> +#define	  AN8855_PORT_VLAN		GENMASK(1, 0)
> +
> +enum an8855_port_mode {
> +	/* Port Matrix Mode: Frames are forwarded by the PCR_MATRIX members. */
> +	AN8855_PORT_MATRIX_MODE = 0,
> +
> +	/* Fallback Mode: Forward received frames with ingress ports that do
> +	 * not belong to the VLAN member. Frames whose VID is not listed on
> +	 * the VLAN table are forwarded by the PCR_MATRIX members.
> +	 */
> +	AN8855_PORT_FALLBACK_MODE = 1,
> +
> +	/* Check Mode: Forward received frames whose ingress do not
> +	 * belong to the VLAN member. Discard frames if VID ismiddes on the
> +	 * VLAN table.
> +	 */
> +	AN8855_PORT_CHECK_MODE = 1,

Just wondering if this 0, 1, *1*, 3 was intentional?

> +
> +	/* Security Mode: Discard any frame due to ingress membership
> +	 * violation or VID missed on the VLAN table.
> +	 */
> +	AN8855_PORT_SECURITY_MODE = 3,
> +};
...

CJ

