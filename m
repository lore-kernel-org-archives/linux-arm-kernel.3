Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028DCCA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 07:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KMj2V+pVuEQqOe96i2SJmhhgX3U7r9wklXDMI8IUDkQ=; b=1MZhj5/OnIT4Xl/0lbjhlbfs4j
	yTxapglb31DuRJP5cApLTD4pVDcv4W2mnuF2FVp1g9WwOxihhWY8vG5BhFXPhzEliefJYieqWfeHC
	RtQAmY5Yy90xDrV393ewnUZ5xvhe6uYYH/pXJdosX8P1T3xuHpblxzCY4vDyxZPoTwMxIG+vUGt1h
	KjKHHhDLYT6X9WrW8kNi4ZiqMWiMefqQuV6jticPBOgjpDJbv5seG0IEs2KSRJ3Q1cqdm0auNePnC
	xHrB20smaPt6Qi8PgxVA05iNczZYTfF6N/48CegZaouu4r/1O3EfRKfNVH4xJioqtSOG+Whly1WJ7
	9BC0Twvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymTV-0000000ARnz-496b;
	Wed, 17 Sep 2025 07:21:09 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymTT-0000000ARmT-1tjw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 07:21:08 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cRV7G2B3mz9sxn;
	Wed, 17 Sep 2025 09:01:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qhKxO5CHxhmP; Wed, 17 Sep 2025 09:01:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cRV7G0dLTz9sxm;
	Wed, 17 Sep 2025 09:01:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DD86A8B766;
	Wed, 17 Sep 2025 09:01:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id uunUJtSsEZNt; Wed, 17 Sep 2025 09:01:45 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8FD918B763;
	Wed, 17 Sep 2025 09:01:44 +0200 (CEST)
Message-ID: <09bdcede-a6e6-4fee-8cd1-d351ed64ca58@csgroup.eu>
Date: Wed, 17 Sep 2025 09:01:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 11/18] net: phy: marvell-88x2222: Support SFP
 through phy_port interface
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?UTF-8?Q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>,
 Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
 Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
References: <20250909152617.119554-1-maxime.chevallier@bootlin.com>
 <20250909152617.119554-12-maxime.chevallier@bootlin.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250909152617.119554-12-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_002107_655023_21A2C1A7 
X-CRM114-Status: GOOD (  19.56  )
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



Le 09/09/2025 à 17:26, Maxime Chevallier a écrit :
> The 88x2222 PHY from Marvell only supports serialised modes as its
> line-facing interfaces. Convert that driver to the generic phylib SFP
> handling.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/net/phy/marvell-88x2222.c | 95 +++++++++++++------------------
>   1 file changed, 38 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/net/phy/marvell-88x2222.c b/drivers/net/phy/marvell-88x2222.c
> index fad2f54c1eac..ba1bbb6c63d6 100644
> --- a/drivers/net/phy/marvell-88x2222.c
> +++ b/drivers/net/phy/marvell-88x2222.c
> @@ -13,7 +13,7 @@
>   #include <linux/mdio.h>
>   #include <linux/marvell_phy.h>
>   #include <linux/of.h>
> -#include <linux/sfp.h>
> +#include <linux/phy_port.h>
>   #include <linux/netdevice.h>
>   
>   /* Port PCS Configuration */
> @@ -473,90 +473,70 @@ static int mv2222_config_init(struct phy_device *phydev)
>   	return 0;
>   }
>   
> -static int mv2222_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
> +static int mv2222_configure_serdes(struct phy_port *port, bool enable,
> +				   phy_interface_t interface)
>   {
> -	DECLARE_PHY_INTERFACE_MASK(interfaces);
> -	struct phy_device *phydev = upstream;
> -	phy_interface_t sfp_interface;
> +	struct phy_device *phydev = port_phydev(port);
>   	struct mv2222_data *priv;
> -	struct device *dev;
> -	int ret;
> -
> -	__ETHTOOL_DECLARE_LINK_MODE_MASK(sfp_supported) = { 0, };
> +	int ret = 0;
>   
>   	priv = phydev->priv;
> -	dev = &phydev->mdio.dev;
> -
> -	sfp_parse_support(phydev->sfp_bus, id, sfp_supported, interfaces);
> -	phydev->port = sfp_parse_port(phydev->sfp_bus, id, sfp_supported);
> -	sfp_interface = sfp_select_interface(phydev->sfp_bus, sfp_supported);
> -
> -	dev_info(dev, "%s SFP module inserted\n", phy_modes(sfp_interface));
> +	priv->line_interface = interface;
>   
> -	if (sfp_interface != PHY_INTERFACE_MODE_10GBASER &&
> -	    sfp_interface != PHY_INTERFACE_MODE_1000BASEX &&
> -	    sfp_interface != PHY_INTERFACE_MODE_SGMII) {
> -		dev_err(dev, "Incompatible SFP module inserted\n");
> +	if (enable) {
> +		linkmode_and(priv->supported, phydev->supported, port->supported);
>   
> -		return -EINVAL;
> -	}
> -
> -	priv->line_interface = sfp_interface;
> -	linkmode_and(priv->supported, phydev->supported, sfp_supported);
> +		ret = mv2222_config_line(phydev);
> +		if (ret < 0)
> +			return ret;
>   
> -	ret = mv2222_config_line(phydev);
> -	if (ret < 0)
> -		return ret;
> +		if (mutex_trylock(&phydev->lock)) {
> +			ret = mv2222_config_aneg(phydev);
> +			mutex_unlock(&phydev->lock);
> +		}
>   
> -	if (mutex_trylock(&phydev->lock)) {
> -		ret = mv2222_config_aneg(phydev);
> -		mutex_unlock(&phydev->lock);
> +	} else {
> +		linkmode_zero(priv->supported);
>   	}
>   
>   	return ret;
>   }
>   
> -static void mv2222_sfp_remove(void *upstream)
> +static void mv2222_port_link_up(struct phy_port *port)
>   {
> -	struct phy_device *phydev = upstream;
> -	struct mv2222_data *priv;
> -
> -	priv = phydev->priv;
> -
> -	priv->line_interface = PHY_INTERFACE_MODE_NA;
> -	linkmode_zero(priv->supported);
> -	phydev->port = PORT_NONE;
> -}
> -
> -static void mv2222_sfp_link_up(void *upstream)
> -{
> -	struct phy_device *phydev = upstream;
> +	struct phy_device *phydev = port_phydev(port);
>   	struct mv2222_data *priv;
>   
>   	priv = phydev->priv;
>   	priv->sfp_link = true;
>   }
>   
> -static void mv2222_sfp_link_down(void *upstream)
> +static void mv2222_port_link_down(struct phy_port *port)
>   {
> -	struct phy_device *phydev = upstream;
> +	struct phy_device *phydev = port_phydev(port);
>   	struct mv2222_data *priv;
>   
>   	priv = phydev->priv;
>   	priv->sfp_link = false;
>   }
>   
> -static const struct sfp_upstream_ops sfp_phy_ops = {
> -	.module_insert = mv2222_sfp_insert,
> -	.module_remove = mv2222_sfp_remove,
> -	.link_up = mv2222_sfp_link_up,
> -	.link_down = mv2222_sfp_link_down,
> -	.attach = phy_sfp_attach,
> -	.detach = phy_sfp_detach,
> -	.connect_phy = phy_sfp_connect_phy,
> -	.disconnect_phy = phy_sfp_disconnect_phy,
> +static const struct phy_port_ops mv2222_port_ops = {
> +	.link_up = mv2222_port_link_up,
> +	.link_down = mv2222_port_link_down,
> +	.configure_mii = mv2222_configure_serdes,
>   };
>   
> +static int mv2222_attach_mii_port(struct phy_device *phydev, struct phy_port *port)
> +{
> +	port->ops = &mv2222_port_ops;
> +
> +	__set_bit(PHY_INTERFACE_MODE_10GBASER, port->interfaces);
> +	__set_bit(PHY_INTERFACE_MODE_1000BASEX, port->interfaces);
> +	__set_bit(PHY_INTERFACE_MODE_SGMII, port->interfaces);
> +
> +	return 0;
> +}
> +
>   static int mv2222_probe(struct phy_device *phydev)
>   {
>   	struct device *dev = &phydev->mdio.dev;
> @@ -592,7 +572,7 @@ static int mv2222_probe(struct phy_device *phydev)
>   	priv->line_interface = PHY_INTERFACE_MODE_NA;
>   	phydev->priv = priv;
>   
> -	return phy_sfp_probe(phydev, &sfp_phy_ops);
> +	return 0;
>   }
>   
>   static struct phy_driver mv2222_drivers[] = {
> @@ -609,6 +589,7 @@ static struct phy_driver mv2222_drivers[] = {
>   		.suspend = mv2222_suspend,
>   		.resume = mv2222_resume,
>   		.read_status = mv2222_read_status,
> +		.attach_mii_port = mv2222_attach_mii_port,
>   	},
>   };
>   module_phy_driver(mv2222_drivers);


