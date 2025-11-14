Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6C8CDE032
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 08:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99kk6ADwJQVpoUomIiVZyb9IQT8Tsaq87p7nc251R2M=; b=wBoZC/Pz8NWiv9e5tk1+LL2n0u
	k81R23Z0VHe2gBuuTdij5xB8psA1woFeIDKeAocktRYVkEZOBeVpORyK6J/zx6C3IDucG2oDXc7Kr
	P2GqbgU1wnyRfCwNvqYnP5ub5WWN50mwp5X9P8spNcNYQD76eUWFfbxNiBBx/4l9ApkdIQkFjtXrM
	Wmd9BJGG6KXAknkyjmAaeQX7xopgkbAKHSDzejoqi1jg4/H1pGIiM095pG/6tIGxdZ3RkMWA8Hujf
	pbxFOrjjsL8OgRCzUO/4IRWS0qCeVVNa5NCzkjmd8dFqDHFXH1HSdzm0teVoZtFBFy3KfWOLZ2stU
	dtfYmGmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpBG-0000000BoE8-2lmt;
	Fri, 14 Nov 2025 08:29:19 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpBE-0000000BoDU-0yNR;
	Fri, 14 Nov 2025 08:29:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6A2501A1A97;
	Fri, 14 Nov 2025 08:29:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 35E3B6060E;
	Fri, 14 Nov 2025 08:29:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 25B27102F2A6F;
	Fri, 14 Nov 2025 09:29:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763108953; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=99kk6ADwJQVpoUomIiVZyb9IQT8Tsaq87p7nc251R2M=;
	b=jpPHcEKCQrtR8y6CY6wYdKqj6q7qb2cEk3NzXb4OcB+qW5M7Hs4K6zaJlv4gkbIZqUGimS
	78MiyWgBTTB9PJCA0Z/jZU1pspwIU9GxSY4RBxdgktj/26PeYtHirVXVY2hZ/guFmOim3P
	c+51i59CrilfH97U+YbCY/KCfq7Z2AOO/K4qiQEI+3u9DsyaoJt9es1SO+gqaghtrOy7oA
	7446BZKro+Pmrs2Y+a+ZoKe1sHRTUgDHmNdlu0flsw6K6dv6GYq24sKP0VF1oLA6ljsnPa
	aH5FqRpcJG67fqQDgtUm8F27se7SAhVsHDpqLmivjfkts5ljP00V/XPh9/7O3A==
Message-ID: <a9e9b465-9e27-479e-8230-ab4a7f6be5b3@bootlin.com>
Date: Fri, 14 Nov 2025 09:29:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/4] net: stmmac: rk: use PHY_INTF_SEL_x
 constants
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Heiko Stuebner <heiko@sntech.de>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aRYZaKTIvfYoV3wE@shell.armlinux.org.uk>
 <E1vJbPB-0000000EBqV-27GS@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vJbPB-0000000EBqV-27GS@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_002916_408140_5411A808 
X-CRM114-Status: GOOD (  12.36  )
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



On 13/11/2025 18:46, Russell King (Oracle) wrote:
> The values used in the xxx_GMAC_PHY_INTF_SEL_xxx() macros are the
> phy_intf_sel values used for the dwmac core. Use these to define these
> constants.
> 
> No change to produced code on aarch64.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 46 +++++++++----------
>  1 file changed, 23 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index 4257cc1f66e9..49076ee00877 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -234,7 +234,7 @@ static void rk_gmac_integrated_fephy_powerdown(struct rk_priv_data *priv,
>  #define PX30_GRF_GMAC_CON1		0x0904
>  
>  /* PX30_GRF_GMAC_CON1 */
> -#define PX30_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(6, 4, 4)
> +#define PX30_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(6, 4, PHY_INTF_SEL_RMII)
>  #define PX30_GMAC_SPEED_10M		GRF_CLR_BIT(2)
>  #define PX30_GMAC_SPEED_100M		GRF_BIT(2)
>  
> @@ -290,8 +290,8 @@ static const struct rk_gmac_ops px30_ops = {
>  #define RK3128_GMAC_CLK_TX_DL_CFG(val) GRF_FIELD(6, 0, val)
>  
>  /* RK3128_GRF_MAC_CON1 */
> -#define RK3128_GMAC_PHY_INTF_SEL_RGMII GRF_FIELD(8, 6, 1)
> -#define RK3128_GMAC_PHY_INTF_SEL_RMII  GRF_FIELD(8, 6, 4)
> +#define RK3128_GMAC_PHY_INTF_SEL_RGMII GRF_FIELD(8, 6, PHY_INTF_SEL_RGMII)
> +#define RK3128_GMAC_PHY_INTF_SEL_RMII  GRF_FIELD(8, 6, PHY_INTF_SEL_RMII)
>  #define RK3128_GMAC_FLOW_CTRL          GRF_BIT(9)
>  #define RK3128_GMAC_FLOW_CTRL_CLR      GRF_CLR_BIT(9)
>  #define RK3128_GMAC_SPEED_10M          GRF_CLR_BIT(10)
> @@ -353,8 +353,8 @@ static const struct rk_gmac_ops rk3128_ops = {
>  #define RK3228_GMAC_CLK_TX_DL_CFG(val)	GRF_FIELD(6, 0, val)
>  
>  /* RK3228_GRF_MAC_CON1 */
> -#define RK3228_GMAC_PHY_INTF_SEL_RGMII	GRF_FIELD(6, 4, 1)
> -#define RK3228_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(6, 4, 4)
> +#define RK3228_GMAC_PHY_INTF_SEL_RGMII	GRF_FIELD(6, 4, PHY_INTF_SEL_RGMII)
> +#define RK3228_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(6, 4, PHY_INTF_SEL_RMII)
>  #define RK3228_GMAC_FLOW_CTRL		GRF_BIT(3)
>  #define RK3228_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(3)
>  #define RK3228_GMAC_SPEED_10M		GRF_CLR_BIT(2)
> @@ -432,8 +432,8 @@ static const struct rk_gmac_ops rk3228_ops = {
>  #define RK3288_GRF_SOC_CON3	0x0250
>  
>  /*RK3288_GRF_SOC_CON1*/
> -#define RK3288_GMAC_PHY_INTF_SEL_RGMII	GRF_FIELD(8, 6, 1)
> -#define RK3288_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(8, 6, 4)
> +#define RK3288_GMAC_PHY_INTF_SEL_RGMII	GRF_FIELD(8, 6, PHY_INTF_SEL_RGMII)
> +#define RK3288_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(8, 6, PHY_INTF_SEL_RMII)
>  #define RK3288_GMAC_FLOW_CTRL		GRF_BIT(9)
>  #define RK3288_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(9)
>  #define RK3288_GMAC_SPEED_10M		GRF_CLR_BIT(10)
> @@ -496,7 +496,7 @@ static const struct rk_gmac_ops rk3288_ops = {
>  #define RK3308_GRF_MAC_CON0		0x04a0
>  
>  /* RK3308_GRF_MAC_CON0 */
> -#define RK3308_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(4, 2, 4)
> +#define RK3308_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(4, 2, PHY_INTF_SEL_RMII)
>  #define RK3308_GMAC_FLOW_CTRL		GRF_BIT(3)
>  #define RK3308_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(3)
>  #define RK3308_GMAC_SPEED_10M		GRF_CLR_BIT(0)
> @@ -535,8 +535,8 @@ static const struct rk_gmac_ops rk3308_ops = {
>  #define RK3328_GMAC_CLK_TX_DL_CFG(val)	GRF_FIELD(6, 0, val)
>  
>  /* RK3328_GRF_MAC_CON1 */
> -#define RK3328_GMAC_PHY_INTF_SEL_RGMII	GRF_FIELD(6, 4, 1)
> -#define RK3328_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(6, 4, 4)
> +#define RK3328_GMAC_PHY_INTF_SEL_RGMII	GRF_FIELD(6, 4, PHY_INTF_SEL_RGMII)
> +#define RK3328_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(6, 4, PHY_INTF_SEL_RMII)
>  #define RK3328_GMAC_FLOW_CTRL		GRF_BIT(3)
>  #define RK3328_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(3)
>  #define RK3328_GMAC_SPEED_10M		GRF_CLR_BIT(2)
> @@ -622,8 +622,8 @@ static const struct rk_gmac_ops rk3328_ops = {
>  #define RK3366_GRF_SOC_CON7	0x041c
>  
>  /* RK3366_GRF_SOC_CON6 */
> -#define RK3366_GMAC_PHY_INTF_SEL_RGMII	GRF_FIELD(11, 9, 1)
> -#define RK3366_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(11, 9, 4)
> +#define RK3366_GMAC_PHY_INTF_SEL_RGMII	GRF_FIELD(11, 9, PHY_INTF_SEL_RGMII)
> +#define RK3366_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(11, 9, PHY_INTF_SEL_RMII)
>  #define RK3366_GMAC_FLOW_CTRL		GRF_BIT(8)
>  #define RK3366_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(8)
>  #define RK3366_GMAC_SPEED_10M		GRF_CLR_BIT(7)
> @@ -687,8 +687,8 @@ static const struct rk_gmac_ops rk3366_ops = {
>  #define RK3368_GRF_SOC_CON16	0x0440
>  
>  /* RK3368_GRF_SOC_CON15 */
> -#define RK3368_GMAC_PHY_INTF_SEL_RGMII	GRF_FIELD(11, 9, 1)
> -#define RK3368_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(11, 9, 4)
> +#define RK3368_GMAC_PHY_INTF_SEL_RGMII	GRF_FIELD(11, 9, PHY_INTF_SEL_RGMII)
> +#define RK3368_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(11, 9, PHY_INTF_SEL_RMII)
>  #define RK3368_GMAC_FLOW_CTRL		GRF_BIT(8)
>  #define RK3368_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(8)
>  #define RK3368_GMAC_SPEED_10M		GRF_CLR_BIT(7)
> @@ -752,8 +752,8 @@ static const struct rk_gmac_ops rk3368_ops = {
>  #define RK3399_GRF_SOC_CON6	0xc218
>  
>  /* RK3399_GRF_SOC_CON5 */
> -#define RK3399_GMAC_PHY_INTF_SEL_RGMII	GRF_FIELD(11, 9, 1)
> -#define RK3399_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(11, 9, 4)
> +#define RK3399_GMAC_PHY_INTF_SEL_RGMII	GRF_FIELD(11, 9, PHY_INTF_SEL_RGMII)
> +#define RK3399_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(11, 9, PHY_INTF_SEL_RMII)
>  #define RK3399_GMAC_FLOW_CTRL		GRF_BIT(8)
>  #define RK3399_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(8)
>  #define RK3399_GMAC_SPEED_10M		GRF_CLR_BIT(7)
> @@ -1015,8 +1015,8 @@ static const struct rk_gmac_ops rk3528_ops = {
>  #define RK3568_GRF_GMAC1_CON1		0x038c
>  
>  /* RK3568_GRF_GMAC0_CON1 && RK3568_GRF_GMAC1_CON1 */
> -#define RK3568_GMAC_PHY_INTF_SEL_RGMII	GRF_FIELD(6, 4, 1)
> -#define RK3568_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(6, 4, 4)
> +#define RK3568_GMAC_PHY_INTF_SEL_RGMII	GRF_FIELD(6, 4, PHY_INTF_SEL_RGMII)
> +#define RK3568_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(6, 4, PHY_INTF_SEL_RMII)
>  #define RK3568_GMAC_FLOW_CTRL			GRF_BIT(3)
>  #define RK3568_GMAC_FLOW_CTRL_CLR		GRF_CLR_BIT(3)
>  #define RK3568_GMAC_RXCLK_DLY_ENABLE		GRF_BIT(1)
> @@ -1209,9 +1209,9 @@ static const struct rk_gmac_ops rk3576_ops = {
>  #define RK3588_GRF_CLK_CON1			0X0070
>  
>  #define RK3588_GMAC_PHY_INTF_SEL_RGMII(id)	\
> -	(GRF_FIELD(5, 3, 1) << ((id) * 6))
> +	(GRF_FIELD(5, 3, PHY_INTF_SEL_RGMII) << ((id) * 6))
>  #define RK3588_GMAC_PHY_INTF_SEL_RMII(id)	\
> -	(GRF_FIELD(5, 3, 4) << ((id) * 6))
> +	(GRF_FIELD(5, 3, PHY_INTF_SEL_RMII) << ((id) * 6))
>  
>  #define RK3588_GMAC_CLK_RMII_MODE(id)		GRF_BIT(5 * (id))
>  #define RK3588_GMAC_CLK_RGMII_MODE(id)		GRF_CLR_BIT(5 * (id))
> @@ -1328,7 +1328,7 @@ static const struct rk_gmac_ops rk3588_ops = {
>  #define RV1108_GRF_GMAC_CON0		0X0900
>  
>  /* RV1108_GRF_GMAC_CON0 */
> -#define RV1108_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(6, 4, 4)
> +#define RV1108_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(6, 4, PHY_INTF_SEL_RMII)
>  #define RV1108_GMAC_FLOW_CTRL		GRF_BIT(3)
>  #define RV1108_GMAC_FLOW_CTRL_CLR	GRF_CLR_BIT(3)
>  #define RV1108_GMAC_SPEED_10M		GRF_CLR_BIT(2)
> @@ -1364,8 +1364,8 @@ static const struct rk_gmac_ops rv1108_ops = {
>  #define RV1126_GRF_GMAC_CON2		0X0078
>  
>  /* RV1126_GRF_GMAC_CON0 */
> -#define RV1126_GMAC_PHY_INTF_SEL_RGMII	GRF_FIELD(6, 4, 1)
> -#define RV1126_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(6, 4, 4)
> +#define RV1126_GMAC_PHY_INTF_SEL_RGMII	GRF_FIELD(6, 4, PHY_INTF_SEL_RGMII)
> +#define RV1126_GMAC_PHY_INTF_SEL_RMII	GRF_FIELD(6, 4, PHY_INTF_SEL_RMII)
>  #define RV1126_GMAC_FLOW_CTRL			GRF_BIT(7)
>  #define RV1126_GMAC_FLOW_CTRL_CLR		GRF_CLR_BIT(7)
>  #define RV1126_GMAC_M0_RXCLK_DLY_ENABLE		GRF_BIT(1)


