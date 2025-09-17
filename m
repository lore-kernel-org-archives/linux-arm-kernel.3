Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D97CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 07:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r2l6Hy0ZONAv8MDPenlJeXBa89fo2KmFcvkq3hK1Hw8=; b=OaYVlzUTQ+QAn6s5T58l6DDFje
	mlXtKfdVya5Kwz5dtSFiCZ6qEvOcEfz6hM2rnhAb+rHu6ccsoNmTQt/iA1waP/5AMiQ2Spph3s+hf
	iK59Mwf2fT68e18FI4LE1y1n6bhkyZxQCMSmEXaDYXC3rImv56c+S62DX9CW28Zg3EcIW/jZQMicc
	bqvi0/tUicP89JYQwTPixdcXWxLDWxLnMcx5fH2JvI1jTGqTyYH6lnjB9x107ILCxDbJPHXC3OYW7
	gcmXv82M+cfSGtYd7qWdvV/JV17aagWWBhOR4HMgVutt0xywhj6z/2CG0HjMJKQbfk2oAiOnOrffn
	s6ogX50Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymTw-0000000AS3z-28LE;
	Wed, 17 Sep 2025 07:21:36 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymTp-0000000ARyy-2Ogo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 07:21:30 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cRV7c6r5Bz9sxq;
	Wed, 17 Sep 2025 09:02:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bdYov1DU9pDS; Wed, 17 Sep 2025 09:02:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cRV7c53qMz9sxm;
	Wed, 17 Sep 2025 09:02:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 771578B766;
	Wed, 17 Sep 2025 09:02:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id vC-MlbVpWJHu; Wed, 17 Sep 2025 09:02:04 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 28FA88B763;
	Wed, 17 Sep 2025 09:02:03 +0200 (CEST)
Message-ID: <e7c1245c-49d6-4a5d-b8c0-0312b80c9c3f@csgroup.eu>
Date: Wed, 17 Sep 2025 09:02:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 12/18] net: phy: marvell: Support SFP through
 phy_port interface
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
 <20250909152617.119554-13-maxime.chevallier@bootlin.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250909152617.119554-13-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_002129_781693_E58AF346 
X-CRM114-Status: GOOD (  19.63  )
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
> Convert the Marvell driver (especially the 88e1512 driver) to use the
> phy_port interface to handle SFPs. This means registering a
> .attach_port() handler to detect when a serdes line interface is used
> (most likely, and SFP module).
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/net/phy/marvell.c | 94 ++++++++++++++-------------------------
>   1 file changed, 33 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
> index 623292948fa7..467cf94e2d7f 100644
> --- a/drivers/net/phy/marvell.c
> +++ b/drivers/net/phy/marvell.c
> @@ -29,10 +29,10 @@
>   #include <linux/ethtool.h>
>   #include <linux/ethtool_netlink.h>
>   #include <linux/phy.h>
> +#include <linux/phy_port.h>
>   #include <linux/marvell_phy.h>
>   #include <linux/bitfield.h>
>   #include <linux/of.h>
> -#include <linux/sfp.h>
>   
>   #include <linux/io.h>
>   #include <asm/irq.h>
> @@ -3561,42 +3561,38 @@ static int marvell_probe(struct phy_device *phydev)
>   	return marvell_hwmon_probe(phydev);
>   }
>   
> -static int m88e1510_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
> +static int m88e1510_port_configure_serdes(struct phy_port *port, bool enable,
> +					  phy_interface_t interface)
>   {
> -	DECLARE_PHY_INTERFACE_MASK(interfaces);
> -	struct phy_device *phydev = upstream;
> -	phy_interface_t interface;
> +	struct phy_device *phydev = port_phydev(port);
>   	struct device *dev;
>   	int oldpage;
>   	int ret = 0;
>   	u16 mode;
>   
> -	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported) = { 0, };
> -
>   	dev = &phydev->mdio.dev;
>   
> -	sfp_parse_support(phydev->sfp_bus, id, supported, interfaces);
> -	interface = sfp_select_interface(phydev->sfp_bus, supported);
> +	if (enable) {
> +		switch (interface) {
> +		case PHY_INTERFACE_MODE_1000BASEX:
> +			mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_1000X;
>   
> -	dev_info(dev, "%s SFP module inserted\n", phy_modes(interface));
> +			break;
> +		case PHY_INTERFACE_MODE_100BASEX:
> +			mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_100FX;
>   
> -	switch (interface) {
> -	case PHY_INTERFACE_MODE_1000BASEX:
> -		mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_1000X;
> +			break;
> +		case PHY_INTERFACE_MODE_SGMII:
> +			mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_SGMII;
>   
> -		break;
> -	case PHY_INTERFACE_MODE_100BASEX:
> -		mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_100FX;
> +			break;
> +		default:
> +			dev_err(dev, "Incompatible SFP module inserted\n");
>   
> -		break;
> -	case PHY_INTERFACE_MODE_SGMII:
> -		mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_SGMII;
> -
> -		break;
> -	default:
> -		dev_err(dev, "Incompatible SFP module inserted\n");
> -
> -		return -EINVAL;
> +			return -EINVAL;
> +		}
> +	} else {
> +		mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII;
>   	}
>   
>   	oldpage = phy_select_page(phydev, MII_MARVELL_MODE_PAGE);
> @@ -3613,49 +3609,24 @@ static int m88e1510_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
>   
>   error:
>   	return phy_restore_page(phydev, oldpage, ret);
> -}
> -
> -static void m88e1510_sfp_remove(void *upstream)
> -{
> -	struct phy_device *phydev = upstream;
> -	int oldpage;
> -	int ret = 0;
> -
> -	oldpage = phy_select_page(phydev, MII_MARVELL_MODE_PAGE);
> -	if (oldpage < 0)
> -		goto error;
> -
> -	ret = __phy_modify(phydev, MII_88E1510_GEN_CTRL_REG_1,
> -			   MII_88E1510_GEN_CTRL_REG_1_MODE_MASK,
> -			   MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII);
> -	if (ret < 0)
> -		goto error;
> -
> -	ret = __phy_set_bits(phydev, MII_88E1510_GEN_CTRL_REG_1,
> -			     MII_88E1510_GEN_CTRL_REG_1_RESET);
>   
> -error:
> -	phy_restore_page(phydev, oldpage, ret);
> +	return 0;
>   }
>   
> -static const struct sfp_upstream_ops m88e1510_sfp_ops = {
> -	.module_insert = m88e1510_sfp_insert,
> -	.module_remove = m88e1510_sfp_remove,
> -	.attach = phy_sfp_attach,
> -	.detach = phy_sfp_detach,
> -	.connect_phy = phy_sfp_connect_phy,
> -	.disconnect_phy = phy_sfp_disconnect_phy,
> +static const struct phy_port_ops m88e1510_serdes_port_ops = {
> +	.configure_mii = m88e1510_port_configure_serdes,
>   };
>   
> -static int m88e1510_probe(struct phy_device *phydev)
> +static int m88e1510_attach_mii_port(struct phy_device *phy_device,
> +				    struct phy_port *port)
>   {
> -	int err;
> +	port->ops = &m88e1510_serdes_port_ops;
>   
> -	err = marvell_probe(phydev);
> -	if (err)
> -		return err;
> +	__set_bit(PHY_INTERFACE_MODE_SGMII, port->interfaces);
> +	__set_bit(PHY_INTERFACE_MODE_1000BASEX, port->interfaces);
> +	__set_bit(PHY_INTERFACE_MODE_100BASEX, port->interfaces);
>   
> -	return phy_sfp_probe(phydev, &m88e1510_sfp_ops);
> +	return 0;
>   }
>   
>   static struct phy_driver marvell_drivers[] = {
> @@ -3915,7 +3886,7 @@ static struct phy_driver marvell_drivers[] = {
>   		.driver_data = DEF_MARVELL_HWMON_OPS(m88e1510_hwmon_ops),
>   		.features = PHY_GBIT_FIBRE_FEATURES,
>   		.flags = PHY_POLL_CABLE_TEST,
> -		.probe = m88e1510_probe,
> +		.probe = marvell_probe,
>   		.config_init = m88e1510_config_init,
>   		.config_aneg = m88e1510_config_aneg,
>   		.read_status = marvell_read_status,
> @@ -3941,6 +3912,7 @@ static struct phy_driver marvell_drivers[] = {
>   		.led_hw_is_supported = m88e1318_led_hw_is_supported,
>   		.led_hw_control_set = m88e1318_led_hw_control_set,
>   		.led_hw_control_get = m88e1318_led_hw_control_get,
> +		.attach_mii_port = m88e1510_attach_mii_port,
>   	},
>   	{
>   		.phy_id = MARVELL_PHY_ID_88E1540,


