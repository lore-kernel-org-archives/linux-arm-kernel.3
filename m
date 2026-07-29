Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DC9C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 08:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xEogLVz2Pxf/eMF1mT9hKyyJhYalrfWxY3ZeNkdqKtA=; b=u86M6dgl61MVr4+WEZJ/ikk0Hw
	ucL5Tvgr3MLeIojWc+k+PzsQ/XxrZN6Z5raQGhXezlBnv9Lk2+S+G1wV3+lKDSJeYEL2/BVWWjBXv
	EGhx1ch2Q1PlAZWE/f+2xembgShnyB121JBPCWl9JUViqDhmzcoM1bz+Fbnqp5ppPexCPHTh06Thy
	DEeRqWobL3mE97fGkkvQ70WxjiAhG47KxRM80lixr6c7CZ9FCeRS4aVhoBkzGt+6xzKB6Ew+NFzwi
	5h+ax/97fDPkTwXW4xIhZk+/qV7DztA2rOkC3ziXe3tp3l0a7XR/Dz8ghvf4GP7DmO6apmw5T0pJS
	8j2nZxWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozp7-00000007Frf-02gp;
	Wed, 29 Jul 2026 08:39:33 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozp4-00000007Fqx-0o7M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 08:39:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 600E01A12E0;
	Wed, 29 Jul 2026 08:39:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D2B26039A;
	Wed, 29 Jul 2026 08:39:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 552BE11C11F9A;
	Wed, 29 Jul 2026 10:39:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785314367; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=xEogLVz2Pxf/eMF1mT9hKyyJhYalrfWxY3ZeNkdqKtA=;
	b=TG73zpzjMGwlBGqQr7eou0y5j+JTAPvYfRWCv0jIqrDhirMl6CevXEP/jZ/jZUbDMA0FMo
	Xn+W/nhIhOdVDJgnAT9fvMf/m9zPm+S/lwjk1nyXwEJjz2V+0ViCG3qUrKAX532CEBM8CL
	x5dzsKJ0ySYCJrdRZRGZz+LvGSJCCs0dnf1p82PE77i1GgpssbGp/jy4Zjq0kBS/u0n+eN
	jGJacI+0zGDaKkxzgj06aQAEc5pi4LXfvfWwUv9U6KXv5ygW9PFaThjK0yReKsr+is+x6V
	bsJeosa79xsr3vMdtbMmOJ58nUbzr0nUJz73v+4kpTXLXYH0KNpbymEpA9Kglw==
Message-ID: <ca8bb107-4e64-4078-8747-cd256ecfc792@bootlin.com>
Date: Wed, 29 Jul 2026 10:39:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 2/2] net: phylink: allow PHYs to be attached
 in 802.3z inband mode
To: Zxyan Zhu <zxyan0222@gmail.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Serge Semin <fancer.lancer@gmail.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Hariprasad Kelam <hkelam@marvell.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260729074237.2624940-1-zxyan0222@gmail.com>
 <20260729074237.2624940-3-zxyan0222@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260729074237.2624940-3-zxyan0222@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_013930_387367_33A7C285 
X-CRM114-Status: GOOD (  20.29  )
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

Hi

On 7/29/26 09:42, Zxyan Zhu wrote:
> From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> 
> Now that we have proper decision making for inband mode support which
> makes it a "best efforts" feature based on the capabilities of the PHY
> and PCS, we can relax whether we expect and permit a PHY to be
> attached. This is especially true for the 2500BASE-X case which some
> PHYs use without inband on their host side interface for 2.5G speeds,
> but use inband for slower speeds switching to SGMII on their host side
> interface.
> 
> We already have such a case for some qcom-ethqos setups, although
> qcom-ethqos overrides phylink's inband settings by accessing the PCS
> directly at the moment. This should allow qcom-ethqos to transition to
> defaulting to inband when 2500BASE-X or SGMII is specified in its DTS.
> 
> Allow PHYs to be attached when inband mode has been specified, which
> will be necessary to allow inband mode to be used on qcom-ethqos.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/phy/phylink.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 59dfe35afa54..fd4e80eeeda7 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -1964,9 +1964,7 @@ EXPORT_SYMBOL_GPL(phylink_destroy);
>   */
>  bool phylink_expects_phy(struct phylink *pl)
>  {
> -	if (pl->cfg_link_an_mode == MLO_AN_FIXED ||
> -	    (pl->cfg_link_an_mode == MLO_AN_INBAND &&
> -	     phy_interface_mode_is_8023z(pl->link_interface)))
> +	if (pl->cfg_link_an_mode == MLO_AN_FIXED)
>  		return false;
>  	return true;
>  }
> @@ -2205,9 +2203,7 @@ static int phylink_attach_phy(struct phylink *pl, struct phy_device *phy,
>  {
>  	u32 flags = 0;
>  
> -	if (WARN_ON(pl->cfg_link_an_mode == MLO_AN_FIXED ||
> -		    (pl->cfg_link_an_mode == MLO_AN_INBAND &&
> -		     phy_interface_mode_is_8023z(interface) && !pl->sfp_bus)))
> +	if (WARN_ON(pl->cfg_link_an_mode == MLO_AN_FIXED))
>  		return -EINVAL;
>  
>  	if (pl->phydev)


