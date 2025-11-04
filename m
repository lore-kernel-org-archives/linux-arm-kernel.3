Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1566CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 08:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2k3S0JM3GjzlqSiHtx7uGU4oJqackuOaOdMcXWCQD4=; b=N0tWWmuBbt7kKTVWbHeDNYNxaK
	5Ctwb4+uH95k/Tf+v09l8Q/o/ve+/gUAzqBQWADe9Zie6M+wC5UUp3j3/b99qkb0SjXKAON3/TwBG
	fbKANFMECMsi7W0HiWx4Vyt3IqZkBMJ+qzTLHCkipjf/mHI6MEKv0lV+tSFx8nC8BSQteQZ7KUBZU
	IZCu9J/t6RdSGNS1pC4leGKDCEDeSAL0bZHXa/wJfWA5xT5dROK2sUQigHASi/uLcKvDfthnOUcGm
	uEFit/p9xE3BSS8B6ZdDZgApOJyLH3VA5kIcy/eDXJmOIZ2CByVo1Rk994cicD4B5gD9qTAezNp2B
	DQWJDa9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCV5-0000000BR5h-41Yq;
	Tue, 04 Nov 2025 08:34:47 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCV3-0000000BR4I-0GeN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 08:34:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 33E361A184C;
	Tue,  4 Nov 2025 08:34:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 046FE606EF;
	Tue,  4 Nov 2025 08:34:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 94FB810B50919;
	Tue,  4 Nov 2025 09:34:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762245281; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=R2k3S0JM3GjzlqSiHtx7uGU4oJqackuOaOdMcXWCQD4=;
	b=DCd+FqUxRxIK4KCVyBl2bY1jDIpBnI7OcnY2/p/8CRdl0Idsdm5miT0nvhZL9+PvxW/5g4
	uhT2R3FGkTAnueao/HshktnCuxoAsYmnJz/QIr9rsKpKRWHbD/9lwGb3brlyQyb7aNQJSt
	6YMA05A4UmvBNktmLqQJKBPdxwrZrGQRtExXpstbIvUBv96Huj5Myjkdm3+opAabia8Uf7
	q6GlH55zcK9qoVuUD50tEindxjboWWp7lMVIRDUeZrHEX3xj2vL8O0eLvOCV/rqiffM6KU
	jPOeZdZ6P2OK58ZUes2loyO+XbaQ4HDYIsO8PfB7/dVQd0zJE+R1XEGXcKBQJw==
Message-ID: <db01f926-d5bb-4317-beac-e6dcc0025a80@bootlin.com>
Date: Tue, 4 Nov 2025 09:34:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 04/11] net: stmmac: add stmmac_get_phy_intf_sel()
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>, Jan Petrous <jan.petrous@oss.nxp.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
 <E1vFt4c-0000000Choe-3SII@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vFt4c-0000000Choe-3SII@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_003445_242392_2105CB0F 
X-CRM114-Status: GOOD (  14.71  )
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

Hi Russell,

On 03/11/2025 12:50, Russell King (Oracle) wrote:
> Provide a function to translate the PHY interface mode to the
> phy_intf_sel pin configuration for dwmac1000 and dwmac4 cores that
> support multiple interfaces. We currently handle MII, GMII, RGMII,
> SGMII, RMII and REVMII, but not TBI, RTBI nor SMII as drivers do not
> appear to use these three and the driver doesn't currently support
> these.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

First, thanks for this work !

[...]

> +int stmmac_get_phy_intf_sel(phy_interface_t interface)
> +{
> +	int phy_intf_sel = -EINVAL;
> +
> +	if (interface == PHY_INTERFACE_MODE_MII ||
> +	    interface == PHY_INTERFACE_MODE_GMII)
> +		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
> +	else if (phy_interface_mode_is_rgmii(interface))
> +		phy_intf_sel = PHY_INTF_SEL_RGMII;
> +	else if (interface == PHY_INTERFACE_MODE_SGMII)
> +		phy_intf_sel = PHY_INTF_SEL_SGMII;
> +	else if (interface == PHY_INTERFACE_MODE_RMII)
> +		phy_intf_sel = PHY_INTF_SEL_RMII;
> +	else if (interface == PHY_INTERFACE_MODE_REVMII)
> +		phy_intf_sel = PHY_INTF_SEL_REVMII;
> +
> +	return phy_intf_sel;
> +}
> +EXPORT_SYMBOL_GPL(stmmac_get_phy_intf_sel);

Nothng wrong with your code, this is out of curiosity.

I'm wondering how we are going to support cases like socfpga (and
probably some other) where the PHY_INTF_SEL_xxx doesn't directly
translate to the phy_interface, i.e.  when you have a PCS or other
IP that serialises the MAC interface ?

for socfpga for example, we need to set the PHY_INTF_SEL to GMII_MII
when we want to use SGMII / 1000BaseX, but we do set it to RGMII when
we need to output RGMII.

Do you have a plan in mind for that ? (maybe a .get_phy_intf_sel() ops ?)

Maxime

