Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB67CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 07:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SBvdFAlAi23UDp3ojHH2j4S4dE5DaAIeZoZagXYkEwU=; b=nJAlh8lrtc29Nfl9lJ8NH486V0
	/GAOlLoq2PgoQc0MyWVWRCx5IXdIkBB5RVKgH8an6WHJ4X4tAu/5exV+bj6M5DCShLgoTcm2deLii
	4Rc0t6Qu9mqhit+EFFxAbJTSNToGzuhyTErjqUoJnZ3NvklWSoruUqO8WbPoJ8vfwIDRYbPpNLJ+d
	hbrsWaJawEJwps1kcMlKemQtQcDfAIXzcNpkXjCsKX3c0E5Z6aexmQqo5766nVl6UoHlMtJ8ll+Qc
	dgEHEN/q4TYKp+jgxYKFVuA5lf+dHnD+ISiRBKBFLB1iunqPUKuzItD+5sAQ76McX613oTgKlrUcK
	ZMZaqH4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9INr-00000003lBl-0Dus;
	Thu, 16 Oct 2025 07:26:47 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9INo-00000003lAo-3ge3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 07:26:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 753A21A1410;
	Thu, 16 Oct 2025 07:26:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4B5756062C;
	Thu, 16 Oct 2025 07:26:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E9147102F22ED;
	Thu, 16 Oct 2025 09:26:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760599602; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=SBvdFAlAi23UDp3ojHH2j4S4dE5DaAIeZoZagXYkEwU=;
	b=QlSiy2z8FRbylqOI5JK31H//tfXjG/m01GHMyopNZlnia8d5wYZsewwrDedc6gWliys3sD
	fPp9GCSSMoYnaNXpyLh4QGjRtXi+Xh5+wJt7lVcVzqwl8RWLVPl48qr1W33bQKcOhOVTZI
	MEqRyJLTHnIkLNsIeUHRYbPdmrK8GacEkBhl4nya5LTbR2fA0Gm7svxipgvANudElIDPK/
	D3n1zzDLOjzaxAjjHSfiUs7sbDthr9Bky7itfhnWsNmM7uVahnT1406L8rFXmZJy/hPFmo
	/EDz/QY7ov/lpSajdxtCVMSsM0tvCJs6G/Aez1kJyQN9vGqwd4C7t561HNTmCw==
Message-ID: <f78a625f-9138-41fe-827e-fe2e830a18b9@bootlin.com>
Date: Thu, 16 Oct 2025 09:26:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 5/5] net: stmmac: rename stmmac_phy_setup() to
 include phylink
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
 <E1v945d-0000000Ameh-3Bs7@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1v945d-0000000Ameh-3Bs7@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_002645_051739_859C83C8 
X-CRM114-Status: GOOD (  13.50  )
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


On 15/10/2025 18:11, Russell King (Oracle) wrote:
> stmmac_phy_setup() does not set up any PHY, but does setup phylink.
> Rename this function to stmmac_phylink_setup() to reflect more what
> it is doing.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 500cfd19e6b5..c9fa965c8566 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1185,7 +1185,7 @@ static int stmmac_init_phy(struct net_device *dev)
>  	return 0;
>  }
>  
> -static int stmmac_phy_setup(struct stmmac_priv *priv)
> +static int stmmac_phylink_setup(struct stmmac_priv *priv)
>  {
>  	struct stmmac_mdio_bus_data *mdio_bus_data;
>  	struct phylink_config *config;
> @@ -7642,7 +7642,7 @@ int stmmac_dvr_probe(struct device *device,
>  	if (ret)
>  		goto error_pcs_setup;
>  
> -	ret = stmmac_phy_setup(priv);
> +	ret = stmmac_phylink_setup(priv);
>  	if (ret) {
>  		netdev_err(ndev, "failed to setup phy (%d)\n", ret);
>  		goto error_phy_setup;


