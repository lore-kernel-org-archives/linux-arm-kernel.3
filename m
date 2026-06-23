Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A90DCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 16:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z14O1Oxv2MwpgYnEYsps2OBdWGQ1E7SU6CsxbrKj0vc=; b=KhhIUpFKUt5Ut9GVkaBkxO3OL6
	kvbULv2fMeZcnVmZ94INNX5cGaMSR1Xk6YISUZv/ou6ZZyN0pBSyM8VONRUvOJrMGwqiCJ2xKf+jB
	at23ZDTypI+AY2o4txLP3tuWpdH1UsK+8q/RhwrDotDVj35jPA8EzwiHTywZlVmLXF29jg2BXOo5A
	LhEXbtB/SPCgf1BNpm3NilSI3w2b0/jVPaSVNh6GNhVyJtRYd6yilUF4ewnnaqCNP6/FxLoxamdOJ
	iljV8CJ4B8GyNKlTxrV60QIaq9L32/I2oD5xul8CQTxwGe2de43YqM6EEkRhbc7fJKdEVf3H5UXad
	ZPUtGZvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc4Nt-00000006f3q-47PX;
	Tue, 23 Jun 2026 16:54:01 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc4Nr-00000006f3G-1jsj;
	Tue, 23 Jun 2026 16:54:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 31747C6B397;
	Tue, 23 Jun 2026 16:54:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6AF8A601C2;
	Tue, 23 Jun 2026 16:53:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BEDE3106C8382;
	Tue, 23 Jun 2026 18:53:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782233635; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=z14O1Oxv2MwpgYnEYsps2OBdWGQ1E7SU6CsxbrKj0vc=;
	b=XYQ+4qmbXXeldrcn9HdaF60+1YlbI4oqajGsTyoZ3GOmFLAk8mbo9eEIGW387IITgwp/hh
	sqIzohPg5uC0vvhiKcYRo8zkzFRQsYknDD2eT7TO+scjLzEFnPc8LPi/gNX20DcCygj/2L
	DkZW5Jz6kME6LbEAxUP9N2MtjWGNdnSLCfDgqr9VZAl1LxqjihK2+PgWtmsctPyufJta+Z
	QaT31nsU1MLJNsHy7rVPnN4FCwhnegT/9XFBInRwmknfuZicE6kKrdYCYFuDLg9kfMDUkX
	j3K43D2pE51iCCQbjxEOjIFe9DKSg7BNrxq57syQNtK0zTAmUq9APdcO9jHM9Q==
Message-ID: <12bb1713-d620-4db4-b240-fbc911be5ea3@bootlin.com>
Date: Tue, 23 Jun 2026 18:53:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 1/2] net: stmmac: dwmac-spacemit: Fix wrong phy
 interface definition
To: Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Yixun Lan
 <dlan@kernel.org>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20260623074637.503864-1-inochiama@gmail.com>
 <20260623074637.503864-2-inochiama@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260623074637.503864-2-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_095359_628828_B477E6D2 
X-CRM114-Status: GOOD (  16.12  )
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

Hello,

On 6/23/26 09:46, Inochi Amaoto wrote:
> The current MII interface register definition from the vendor is wrong,
> use the right number for the macro. Also, correct the interface mask
> in spacemit_set_phy_intf_sel() so it can update the register with the
> right number
> 
> Fixes: 30f0ba420ed3 ("net: stmmac: Add glue layer for Spacemit K3 SoC")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> index 223754cc5c79..3bfb6d49be6c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> @@ -18,8 +18,10 @@
>  #include "stmmac_platform.h"
>  
>  /* ctrl register bits */
> -#define CTRL_PHY_INTF_RGMII		BIT(3)
> -#define CTRL_PHY_INTF_MII		BIT(4)
> +#define CTRL_PHY_INTF_MODE		GENMASK(4, 3)
> +#define CTRL_PHY_INTF_RMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 0)
> +#define CTRL_PHY_INTF_RGMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 1)
> +#define CTRL_PHY_INTF_MII		FIELD_PREP(CTRL_PHY_INTF_MODE, 3)
>  #define CTRL_WAKE_IRQ_EN		BIT(9)
>  #define CTRL_PHY_IRQ_EN			BIT(12)
>  
> @@ -118,7 +120,7 @@ static void spacemit_get_interfaces(struct stmmac_priv *priv, void *bsp_priv,
>  
>  static int spacemit_set_phy_intf_sel(void *bsp_priv, u8 phy_intf_sel)
>  {
> -	unsigned int mask = CTRL_PHY_INTF_MII | CTRL_PHY_INTF_RGMII;
> +	unsigned int mask = CTRL_PHY_INTF_MODE;
>  	struct spacmit_dwmac *dwmac = bsp_priv;
>  	unsigned int val = 0;
>  
> @@ -128,6 +130,7 @@ static int spacemit_set_phy_intf_sel(void *bsp_priv, u8 phy_intf_sel)
>  		break;
>  
>  	case PHY_INTF_SEL_RMII:
> +		val = CTRL_PHY_INTF_RMII;

This isn't strictly-speaking necessary as this is 0 and val is already 0, maybe
compilers can figure it out and this leaves us with more self-documenting code ?

So I'm ok with that personally,

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


>  		break;
>  
>  	case PHY_INTF_SEL_RGMII:


