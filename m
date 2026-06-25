Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F48CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 14:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k3XImR5LuwT8/GVFa0sNRFYkN/CDPKz36sZeNivR0Ps=; b=KI5i5po0Oz/88tI2DYh1pHqHlP
	OMf3SY1+GYyDU9HqsbRVa34YzC97d/dMpJ/aHbfbeX5QWd6sPqZlUscDjJgjTI04EVbxNVJGDCSyk
	zpiRzATwWGY3XO7/xZDy+JSVRW06/bycct98fzfF9aGve8VIoTux2qBybGSPAyBvbMbEs82oJOszU
	8iWfY9EVgvdHU0quIhUl+RcEgtNZlocjWY7IL4jBJQnjbZUGapc9vLe0N7Xqj/nBfreNpT/6RlEuL
	RDdIj0N230WOkb1h5CRDqAHsfNdHNLS6hs2Lwo6ub7eogpC7uv9jJB1gbfX9EG9zFenDQedu+2Cdm
	GxI2AVYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wckpk-00000009J8c-3lZU;
	Thu, 25 Jun 2026 14:13:36 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wckph-00000009J7n-2NnM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 14:13:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 665A24E408E1;
	Thu, 25 Jun 2026 14:13:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2E7535FF03;
	Thu, 25 Jun 2026 14:13:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2B3FC104C9776;
	Thu, 25 Jun 2026 16:13:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782396808; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=k3XImR5LuwT8/GVFa0sNRFYkN/CDPKz36sZeNivR0Ps=;
	b=wHXbjJXutSwFzKdyBO+JadrL7vzZXU2Ju+iay6NC3mqD2OVKNOmpQcK+SqpaVzmb/kfhUw
	b9eJsyPs0swywCYolXBHA9sqiLCYmtT6uu9qlEbPcUoYONRWs4Qz3g9ycv/87AB2lXiaCY
	dVXvQeAZhwn9vqI4DnCISuk++CUKb6I/A1KPjM1BARbiKqito2vCTmjxITZn6c+TsasA/Y
	hgDUl7mLW9wPZQ94naWK5t7dGuiPvzFXNe/mc9zgn4DI6COoTOIcigvIHeeJPFhcpbK2qu
	LZ4JptlGAm20dUa3h0Eg3n2MoWAJ+oZYl9WKk/LHhvhj9PpkpYcIf2WUrIh4ow==
Message-ID: <a271385e-302d-45c7-a1df-aebd380b427b@bootlin.com>
Date: Thu, 25 Jun 2026 16:13:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next v8 03/12] net: phylink: add
 phylink_release_pcs() to externally release a PCS
To: Christian Marangi <ansuelsmth@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Saravana Kannan <saravanak@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 llvm@lists.linux.dev
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
 <20260618125752.1223-4-ansuelsmth@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260618125752.1223-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_071333_909691_86778D9A 
X-CRM114-Status: GOOD (  34.45  )
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

Hello Christian,

On 6/18/26 14:57, Christian Marangi wrote:
> Add phylink_release_pcs() to externally release a PCS from a phylink
> instance. This can be used to handle case when a single PCS needs to be
> removed and the phylink instance needs to be refreshed.
> 
> On calling phylink_release_pcs(), the PCS will be removed from the
> phylink internal PCS list and the phylink supported_interfaces value is
> reparsed with the remaining PCS interfaces.
> 
> Also a phylink resolve is triggered to handle the PCS removal.
> 
> The flag force_major_config is set to make phylink resolve reconfigure
> the interface (even if it didn't change).
> This is needed to handle the special case when the current PCS used
> by phylink is removed and a major_config is needed to propagae the
> configuration change. With this option enabled we also force mac_config
> even if the PHY link is not up for the in-band case.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/net/phy/phylink.c | 56 +++++++++++++++++++++++++++++++++++++++
>  include/linux/phylink.h   |  2 ++
>  2 files changed, 58 insertions(+)
> 
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index c38bcd43b8c8..064d6f5a06da 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -158,6 +158,8 @@ static const phy_interface_t phylink_sfp_interface_preference[] = {
>  static DECLARE_PHY_INTERFACE_MASK(phylink_sfp_interfaces);
>  
>  static void phylink_run_resolve(struct phylink *pl);
> +static void phylink_link_down(struct phylink *pl);
> +static void phylink_pcs_disable(struct phylink_pcs *pcs);
>  
>  /**
>   * phylink_set_port_modes() - set the port type modes in the ethtool mask
> @@ -918,6 +920,60 @@ static void phylink_resolve_an_pause(struct phylink_link_state *state)
>  	}
>  }
>  
> +/**
> + * phylink_release_pcs - Removes a PCS from the phylink PCS available list
> + * @pcs: a pointer to the phylink_pcs struct to be released
> + *
> + * This function release a PCS from the phylink PCS available list if
> + * actually in use. It also refreshes the supported interfaces of the
> + * phylink instance by copying the supported interfaces from the phylink
> + * conf and merging the supported interfaces of the remaining available PCS
> + * in the list and trigger a resolve.
> + */
> +void phylink_release_pcs(struct phylink_pcs *pcs)
> +{
> +	struct phylink *pl;
> +
> +	ASSERT_RTNL();
> +
> +	pl = pcs->phylink;
> +	if (!pl)
> +		return;
> +
> +	mutex_lock(&pl->state_mutex);
> +
> +	list_del(&pcs->list);
> +	pcs->phylink = NULL;
> +
> +	/*
> +	 * Check if we are removing the PCS currently
> +	 * in use by phylink. If this is the case, tear down
> +	 * the link, force phylink resolve to reconfigure the
> +	 * interface mode, disable the current PCS and set the
> +	 * phylink PCS to NULL.
> +	 */
> +	if (pl->pcs == pcs) {
> +		phylink_link_down(pl);
> +		phylink_pcs_disable(pl->pcs);
> +
> +		pl->force_major_config = true;
> +		pl->pcs = NULL;
> +	}
> +
> +	mutex_unlock(&pl->state_mutex);
> +
> +	/* Refresh supported interfaces */
> +	phy_interface_copy(pl->supported_interfaces,
> +			   pl->config->supported_interfaces);
> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> +		phy_interface_or(pl->supported_interfaces,
> +				 pl->supported_interfaces,
> +				 pcs->supported_interfaces);

I've given more thought to that 'supported_interfaces' thing. This
patchset redefines the meaning of

  pl->config->supported_interfaces

Currently, it's filled by the MAC driver and means "Every interface
we can support, including the ones provided by PCSs that we can use
with this MAC".

It now becomes "Every interface we support without needing a PCS", at
least the way I understand that.

It's not an error in your code, but I think this is worth documenting
somewhere as this changes one the things that's already fairly
error-prone in new drivers.

I don't know to what extent people use that, be we have a porting guide
that explains how to use phylink in a MAC driver, maybe an update in there
would be nice as well :

https://docs.kernel.org/networking/sfp-phylink.html#rough-guide-to-converting-a-network-driver-to-sfp-phylink

Maxime



