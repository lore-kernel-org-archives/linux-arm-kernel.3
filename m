Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BC9CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 07:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NeEzGRFrBs4FS8L+Fqj+PJifjJoIjDRt5fO14R4K13k=; b=S4Bv5EfRmaYs46AG4qElCYdmlo
	7jq8QxzbU+Ukm+hTB52c3FStl8XF7Ir+6eLj+zHyEiKNZy/dQUdfoM/ahS+PG1/Es8WwgDZVjkh7W
	Czo+hy6GiN/nzkp8EYRpO4GfheHACFvPeGWW73qSlYpFrrQ6Iha4I3iEbziAmMnDYVcHipW56N/Ro
	05BYIOgf39tbUHqDqZ856t/g0NmA699MdXg3XXsMgs7cnU9ScFcIRx/lAt/+CXUjESXXuWfwC9nzf
	yJI59ox8dXzWbrJ1g7gN8x2Y3dYJSHWHGJKKRUfLu43RdveIrKxyZ5ai+QchHwcoo1btmcLmSNnsS
	gBJ04T/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymTw-0000000AS4V-3KpI;
	Wed, 17 Sep 2025 07:21:36 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymTt-0000000AS1F-2Iav
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 07:21:35 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cRV546dq9z9sxc;
	Wed, 17 Sep 2025 08:59:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z46yxuCUCYXC; Wed, 17 Sep 2025 08:59:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cRV544zDlz9sxb;
	Wed, 17 Sep 2025 08:59:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7C9518B766;
	Wed, 17 Sep 2025 08:59:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id u3lJUXBftTCg; Wed, 17 Sep 2025 08:59:52 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 36D288B763;
	Wed, 17 Sep 2025 08:59:51 +0200 (CEST)
Message-ID: <2b3f5f44-0629-4fc0-a70a-dc949a3edc0c@csgroup.eu>
Date: Wed, 17 Sep 2025 08:59:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 05/18] net: phy: dp83822: Add support for
 phy_port representation
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
 <20250909152617.119554-6-maxime.chevallier@bootlin.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250909152617.119554-6-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_002133_753246_F7D08F11 
X-CRM114-Status: GOOD (  23.42  )
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
> With the phy_port representation introduced, we can use .attach_port to
> populate the port information based on either the straps or the
> ti,fiber-mode property. This allows simplifying the probe function and
> allow users to override the strapping configuration.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/net/phy/dp83822.c | 72 +++++++++++++++++++++++++--------------
>   1 file changed, 46 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/net/phy/dp83822.c b/drivers/net/phy/dp83822.c
> index 33db21251f2e..c6e5b7244658 100644
> --- a/drivers/net/phy/dp83822.c
> +++ b/drivers/net/phy/dp83822.c
> @@ -11,6 +11,7 @@
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/phy.h>
> +#include <linux/phy_port.h>
>   #include <linux/netdevice.h>
>   #include <linux/bitfield.h>
>   
> @@ -811,17 +812,6 @@ static int dp83822_of_init(struct phy_device *phydev)
>   	int i, ret;
>   	u32 val;
>   
> -	/* Signal detection for the PHY is only enabled if the FX_EN and the
> -	 * SD_EN pins are strapped. Signal detection can only enabled if FX_EN
> -	 * is strapped otherwise signal detection is disabled for the PHY.
> -	 */
> -	if (dp83822->fx_enabled && dp83822->fx_sd_enable)
> -		dp83822->fx_signal_det_low = device_property_present(dev,
> -								     "ti,link-loss-low");
> -	if (!dp83822->fx_enabled)
> -		dp83822->fx_enabled = device_property_present(dev,
> -							      "ti,fiber-mode");
> -
>   	if (!device_property_read_string(dev, "ti,gpio2-clk-out", &of_val)) {
>   		if (strcmp(of_val, "mac-if") == 0) {
>   			dp83822->gpio2_clk_out = DP83822_CLK_SRC_MAC_IF;
> @@ -950,6 +940,49 @@ static int dp83822_read_straps(struct phy_device *phydev)
>   	return 0;
>   }
>   
> +static int dp83822_attach_mdi_port(struct phy_device *phydev,
> +				   struct phy_port *port)
> +{
> +	struct dp83822_private *dp83822 = phydev->priv;
> +	int ret;
> +
> +	if (port->mediums) {
> +		if (phy_port_is_fiber(port))
> +			dp83822->fx_enabled = true;
> +	} else {
> +		ret = dp83822_read_straps(phydev);
> +		if (ret)
> +			return ret;
> +
> +#if IS_ENABLED(CONFIG_OF_MDIO)
> +		if (dp83822->fx_enabled && dp83822->fx_sd_enable)
> +			dp83822->fx_signal_det_low =
> +				device_property_present(&phydev->mdio.dev,
> +							"ti,link-loss-low");
> +
> +		/* ti,fiber-mode is still used for backwards compatibility, but
> +		 * has been replaced with the mdi node definition, see
> +		 * ethernet-port.yaml
> +		 */
> +		if (!dp83822->fx_enabled)
> +			dp83822->fx_enabled =
> +				device_property_present(&phydev->mdio.dev,
> +							"ti,fiber-mode");
> +#endif /* CONFIG_OF_MDIO */
> +
> +		if (dp83822->fx_enabled) {
> +			port->lanes = 1;
> +			port->mediums = BIT(ETHTOOL_LINK_MEDIUM_BASEF);
> +		} else {
> +			/* This PHY can only to 100BaseTX max, so on 2 lanes */
> +			port->lanes = 2;
> +			port->mediums = BIT(ETHTOOL_LINK_MEDIUM_BASET);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   static int dp8382x_probe(struct phy_device *phydev)
>   {
>   	struct dp83822_private *dp83822;
> @@ -968,27 +1001,13 @@ static int dp8382x_probe(struct phy_device *phydev)
>   
>   static int dp83822_probe(struct phy_device *phydev)
>   {
> -	struct dp83822_private *dp83822;
>   	int ret;
>   
>   	ret = dp8382x_probe(phydev);
>   	if (ret)
>   		return ret;
>   
> -	dp83822 = phydev->priv;
> -
> -	ret = dp83822_read_straps(phydev);
> -	if (ret)
> -		return ret;
> -
> -	ret = dp83822_of_init(phydev);
> -	if (ret)
> -		return ret;
> -
> -	if (dp83822->fx_enabled)
> -		phydev->port = PORT_FIBRE;
> -
> -	return 0;
> +	return dp83822_of_init(phydev);
>   }
>   
>   static int dp83826_probe(struct phy_device *phydev)
> @@ -1172,6 +1191,7 @@ static int dp83822_led_hw_control_get(struct phy_device *phydev, u8 index,
>   		.led_hw_is_supported = dp83822_led_hw_is_supported,	\
>   		.led_hw_control_set = dp83822_led_hw_control_set,	\
>   		.led_hw_control_get = dp83822_led_hw_control_get,	\
> +		.attach_mdi_port = dp83822_attach_mdi_port		\
>   	}
>   
>   #define DP83825_PHY_DRIVER(_id, _name)				\


