Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5DD4CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 08:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ou/gTfBTt7Wprt1RCKinoE0CRdPLoTJcbQgIfWcSKs=; b=drNXrs3KyG7gBcM+QN+mNT6ZwX
	G4+/RgxVoahUbVg2/WJUY8SPcHXqptlPQ7mtDDYPatLNvlYWkIjyKEwpnbBaw2ZevsovWBuhWcaj0
	3ObA0HWDoNFhG9LyxEtZxA/c4rNd+R8XRnN6IfxjCwpeaszqk5js/79JTsa/SLKmSyT5ZmkgswSnE
	SlygXZPtL+wYcl4cMfNrRlcw6JU88ptRycyJ+rS9dCx4z8qdzw4TM5QCp+SDjXVzvVLtd2wraw5Ae
	Wew6krFiq/vfwDzC7LvAQlaF41GzVT9+7ZH3b8tTHbFhWq7932gcoIiOnpZWfBje2EaG0gKfxqVee
	xi3ECV2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCeE-0000000BSBg-3Em5;
	Tue, 04 Nov 2025 08:44:14 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCeC-0000000BSBH-2a1t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 08:44:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 52BD34E414EF;
	Tue,  4 Nov 2025 08:44:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 255AC606EF;
	Tue,  4 Nov 2025 08:44:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D10FD10B508D9;
	Tue,  4 Nov 2025 09:44:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762245848; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=0ou/gTfBTt7Wprt1RCKinoE0CRdPLoTJcbQgIfWcSKs=;
	b=jlF7lq3Iz+l+2JGMUu5dkgxs3HIUO5VzVJkidrjRxf99R05cpBkyiXt34TR+gjDc3Y9p/l
	/EFDclvJ4y+F/wqF3TBN912tjXIjmQUqfOlz43QsDOYDwUs/HhDYUZ4G0jMGicdJROUj/Z
	hxVkLjkrDxOwNepO1EuxbB++3q4kuC0JC/GYgp9MYw+lGNqk0YJN5rIzMMYvTG97JZmnAy
	FPD+kdAVa1r7xVf6TUtTYgPwl8wdgRXjdUa0vDYsHaHLp64/bHPPqbA+YkPIZXvOA+zLDX
	Yqiill3FxkQbWEf48OleR5Z+9qEj9M2Jna6akwP/5NldP7lQzdDDuY2yFviKog==
Message-ID: <e2d250f1-64d6-44e6-b894-510465787bd8@bootlin.com>
Date: Tue, 4 Nov 2025 09:44:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 03/11] net: stmmac: add phy_intf_sel and ACTPHYIF
 definitions
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
 <E1vFt4X-0000000ChoY-30p9@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vFt4X-0000000ChoY-30p9@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_004412_793900_20F1F15D 
X-CRM114-Status: GOOD (  13.56  )
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



On 03/11/2025 12:50, Russell King (Oracle) wrote:
> Add definitions for the active PHY interface found in DMA hardware
> feature register 0, and also used to configure the core in multi-
> interface designs via phy_intf_sel.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/common.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
> index 27083af54568..7395bbb94aea 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/common.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> @@ -313,6 +313,16 @@ struct stmmac_safety_stats {
>  #define DMA_HW_FEAT_ACTPHYIF	0x70000000	/* Active/selected PHY iface */
>  #define DEFAULT_DMA_PBL		8
>  
> +/* phy_intf_sel_i and ACTPHYIF encodings */
> +#define PHY_INTF_SEL_GMII_MII	0
> +#define PHY_INTF_SEL_RGMII	1
> +#define PHY_INTF_SEL_SGMII	2
> +#define PHY_INTF_SEL_TBI	3
> +#define PHY_INTF_SEL_RMII	4
> +#define PHY_INTF_SEL_RTBI	5
> +#define PHY_INTF_SEL_SMII	6
> +#define PHY_INTF_SEL_REVMII	7
> +
>  /* MSI defines */
>  #define STMMAC_MSI_VEC_MAX	32
>  
This matches the docs I have :)

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

