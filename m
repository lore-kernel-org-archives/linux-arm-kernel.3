Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31354C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 09:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yetknAueSEQa5IWYCXNWlQQ9a9BsRpLD7imRrh5Tv40=; b=3/HoYeVeoNqg4IOkdkP3DT3uob
	rnT7ZzOfkIBF1VHe9hg9JiVKfwdCkptWiyZ0dWp0LLyXCg0jiRzsn/pDC8t/8wD2tR+0atZkfgc+V
	9Xp7gRGd7m/i3bj1SSxE1J8+Zipds/J0ISMxV71vly6Lhlttz0Y+n+zU/UxN7lXQeXKQpp/12YcDK
	0LHJR7UmNtoukuzqFD5f8RhhDB4a3CTbedkQZWglqpuIa7rWbskSKwjXUb2leinIF4M1Jl4tQu/0H
	uqDCzWWYbVeSp5xcWV19NbSGVhAebg8wZphM7QvA63T7rq1LgYNdBu3Ahsl62Fw3kmhQb/SY5Eug9
	gBgRJ0aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCAb-0000000FxYc-1qVg;
	Fri, 24 Jul 2026 09:26:17 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCAX-0000000FxXt-135w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 09:26:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9E9704E40F1D;
	Fri, 24 Jul 2026 09:26:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 57A1B60395;
	Fri, 24 Jul 2026 09:26:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 770BD11C11D97;
	Fri, 24 Jul 2026 11:25:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784885166; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=yetknAueSEQa5IWYCXNWlQQ9a9BsRpLD7imRrh5Tv40=;
	b=iI9p4ykVkqk/LJ5fHfkcjwMlNolCWTPQiznmWtPm4WW6TZz43FcFeB8pwiHwmhF9oLWc8f
	KmQ/fibI/OKx/Ez0o7N20PKaIioHR4Huu2bRPNCC7PYsBZx1wi4YKx0FmT/OmShdPTzkdc
	vtEnqcKTIxlET9SBT5tz/ljyq3e60bKPy4hv/tXng6OK287KdLxo2v/a0Lk9fPH2xa3sVN
	LvGKrd9cZ8n8jjTvKrn7YjIPAx6FFb0VVu1gPS8fpK9Xu+NXDipZDUJ4mzRMbJjn0h3Tuj
	pon7yJjPmkJ9UOs/zP/fPlGjzEt0wt5ID+CG4SDswgbulY9r345TT3NZRHWtsQ==
Message-ID: <42606cde-cdef-420d-adf4-b28c353d564b@bootlin.com>
Date: Fri, 24 Jul 2026 11:25:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: phylink: add phylink_pcs_loopback() method
 for PCS loopback support
To: Zxyan Zhu <zxyan0222@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
References: <20260724085224.3321663-1-zxyan0222@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260724085224.3321663-1-zxyan0222@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_022613_576369_2EAD1F1C 
X-CRM114-Status: GOOD (  32.26  )
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

Hi,

+Björn

On 7/24/26 10:52, Zxyan Zhu wrote:
> Add a pcs_loopback callback to struct phylink_pcs_ops to allow PCS
> devices to expose loopback capability. This is useful for MAC drivers
> running selftests on interfaces that use in-band signalling and have
> no external PHY device.
> 
> The phylink_pcs_loopback() helper calls the PCS ops callback if
> available, and returns -EOPNOTSUPP for PCS devices that do not
> support loopback.
> 
> In stmmac, use phylink_pcs_loopback() in stmmac_test_phy_loopback()
> and stmmac_selftest_run() when no phydev is present but a PCS with
> loopback support exists. This enables PHY loopback selftests on
> interfaces without an external PHY.

There have been talks about making a userspace API for loopback :

https://lore.kernel.org/netdev/20260325145022.2607545-4-bjorn@kernel.org/

Even if your patch is a pure internal feature with no uAPI parts, I wonder
if this is the correct API to have.

Maybe the right move would be to ask phylink to configure the loopback,
and let it figure-out where to do so (in the PHY ? in the PCS ? Somewhere
else ?)

With Björn's work we may end-up with an phylink api that may look like:

phylink_set_loopback(struct phylink *pl, bool enable, enum loopback_location loc)

and for cases like this one where we don't care about where the loopback
is set, we may have an enum value 'LOOPBACK_LOC_ANY' ?

Besides that, I don't see and PCS that supports that loopback, I think
it would be nice to also have the PCS code for loopback as well...

Maxime
> 
> Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
> ---
>  .../stmicro/stmmac/stmmac_selftests.c         | 36 ++++++++++++++-----
>  drivers/net/phy/phylink.c                     | 19 ++++++++++
>  include/linux/phylink.h                       | 16 +++++++++
>  3 files changed, 63 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
> index 29e824bd90ca..e6ac51018a65 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
> @@ -377,20 +377,36 @@ static int stmmac_test_mac_loopback(struct stmmac_priv *priv)
>  static int stmmac_test_phy_loopback(struct stmmac_priv *priv)
>  {
>  	struct stmmac_packet_attrs attr = { };
> +	struct phylink_pcs *pcs;
>  	int ret;
>  
> -	if (!priv->dev->phydev)
> -		return -EOPNOTSUPP;
> +	if (priv->dev->phydev) {
> +		ret = phy_loopback(priv->dev->phydev, true, 0);
> +		if (ret)
> +			return ret;
>  
> -	ret = phy_loopback(priv->dev->phydev, true, 0);
> -	if (ret)
> +		attr.dst = priv->dev->dev_addr;
> +		ret = __stmmac_test_loopback(priv, &attr);
> +
> +		phy_loopback(priv->dev->phydev, false, 0);
>  		return ret;
> +	}
>  
> -	attr.dst = priv->dev->dev_addr;
> -	ret = __stmmac_test_loopback(priv, &attr);
> +	/* Use PCS loopback for interfaces without an external PHY. */
> +	pcs = priv->hw->phylink_pcs;
> +	if (pcs) {
> +		ret = phylink_pcs_loopback(pcs, true);
> +		if (ret)
> +			return ret;
>  
> -	phy_loopback(priv->dev->phydev, false, 0);
> -	return ret;
> +		attr.dst = priv->dev->dev_addr;
> +		ret = __stmmac_test_loopback(priv, &attr);
> +
> +		phylink_pcs_loopback(pcs, false);
> +		return ret;
> +	}
> +
> +	return -EOPNOTSUPP;
>  }
>  
>  static int stmmac_test_mmc(struct stmmac_priv *priv)
> @@ -1986,6 +2002,8 @@ void stmmac_selftest_run(struct net_device *dev,
>  			ret = -EOPNOTSUPP;
>  			if (dev->phydev)
>  				ret = phy_loopback(dev->phydev, true, 0);
> +			else if (priv->hw->phylink_pcs)
> +				ret = phylink_pcs_loopback(priv->hw->phylink_pcs, true);
>  			if (!ret)
>  				break;
>  			fallthrough;
> @@ -2019,6 +2037,8 @@ void stmmac_selftest_run(struct net_device *dev,
>  			ret = -EOPNOTSUPP;
>  			if (dev->phydev)
>  				ret = phy_loopback(dev->phydev, false, 0);
> +			else if (priv->hw->phylink_pcs)
> +				ret = phylink_pcs_loopback(priv->hw->phylink_pcs, false);
>  			if (!ret)
>  				break;
>  			fallthrough;
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 59dfe35afa54..a7f78c82913a 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -997,6 +997,25 @@ int phylink_pcs_pre_init(struct phylink *pl, struct phylink_pcs *pcs)
>  }
>  EXPORT_SYMBOL_GPL(phylink_pcs_pre_init);
>  
> +/**
> + * phylink_pcs_loopback() - Enable or disable loopback at the PCS
> + * @pcs: a pointer to a &struct phylink_pcs.
> + * @enable: true to enable loopback, false to disable
> + *
> + * Enable or disable loopback mode at the PCS level. This is used by MAC
> + * drivers for selftest purposes when no external PHY is present.
> + *
> + * Returns 0 on success, negative error code on failure.
> + */
> +int phylink_pcs_loopback(struct phylink_pcs *pcs, bool enable)
> +{
> +	if (pcs->ops->pcs_loopback)
> +		return pcs->ops->pcs_loopback(pcs, enable);
> +
> +	return -EOPNOTSUPP;
> +}
> +EXPORT_SYMBOL_GPL(phylink_pcs_loopback);
> +
>  static void phylink_mac_config(struct phylink *pl,
>  			       const struct phylink_link_state *state)
>  {
> diff --git a/include/linux/phylink.h b/include/linux/phylink.h
> index 2bc0db3d52ac..66c7016d4acd 100644
> --- a/include/linux/phylink.h
> +++ b/include/linux/phylink.h
> @@ -518,6 +518,7 @@ struct phylink_pcs {
>   *		    the MAC.
>   * @pcs_pre_init: configure PCS components necessary for MAC hardware
>   *                initialization e.g. RX clock for stmmac.
> + * @pcs_loopback: enable/disable loopback mode at the PCS.
>   */
>  struct phylink_pcs_ops {
>  	int (*pcs_validate)(struct phylink_pcs *pcs, unsigned long *supported,
> @@ -542,6 +543,7 @@ struct phylink_pcs_ops {
>  	void (*pcs_disable_eee)(struct phylink_pcs *pcs);
>  	void (*pcs_enable_eee)(struct phylink_pcs *pcs);
>  	int (*pcs_pre_init)(struct phylink_pcs *pcs);
> +	int (*pcs_loopback)(struct phylink_pcs *pcs, bool enable);
>  };
>  
>  #if 0 /* For kernel-doc purposes only. */
> @@ -717,8 +719,22 @@ void pcs_enable_eee(struct phylink_pcs *pcs);
>   */
>  int pcs_pre_init(struct phylink_pcs *pcs);
>  
> +/**
> + * pcs_loopback() - Enable or disable loopback at the PCS
> + * @pcs: a pointer to a &struct phylink_pcs.
> + * @enable: true to enable loopback, false to disable
> + *
> + * Enable or disable loopback mode at the PCS level. This is used by MAC
> + * drivers for selftest purposes when no external PHY is present.
> + *
> + * Returns 0 on success, or a negative error code on failure.
> + */
> +int pcs_loopback(struct phylink_pcs *pcs, bool enable);
> +
>  #endif
>  
> +int phylink_pcs_loopback(struct phylink_pcs *pcs, bool enable);
> +
>  struct phylink *phylink_create(struct phylink_config *,
>  			       const struct fwnode_handle *,
>  			       phy_interface_t,
> 
> base-commit: 1df10cef2d1e7f9f2fb7eddb67fc70d3abf101f9


