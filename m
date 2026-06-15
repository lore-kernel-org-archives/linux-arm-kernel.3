Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEE7CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 13:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dOWrt41fp9ZkdsfONhl/POwO170vOA3eDS7WRaAIv2Y=; b=rLha2AzKdFfiI/nqyX+0poPlDW
	Yx2Zj2OgonjveYkWsx+CTktksyCBbfV8C7bMhrPnxfhYKEkzM52DlMl+lisgAbBdcSdQqnknCemnM
	ixywwAy1RldfJGK8T5O8ako1BlVHa33UQFt5EMjcXbPYaS+yR5gDhVDl7T0gpcVQNpEbcrFq/USua
	34SAJSoB/VEiDhj/Ya23aa6ZyEeeS04PudpZ50VsVX2p7jymiU/fLIQmIubkWO7UPkydag+GFI2i0
	qtNL4bxeMjCWS0G5tHaUYHcybF7qGRQEcKA4Qwd3mrZEfG0EGfWnfIYheQjaOUeQJAn1iXLDkZZmu
	S78BJaww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7Rk-0000000EJJz-1FzB;
	Mon, 15 Jun 2026 13:33:48 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7Rh-0000000EJJQ-1TSW;
	Mon, 15 Jun 2026 13:33:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E272F1A37CE;
	Mon, 15 Jun 2026 13:33:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B16B360015;
	Mon, 15 Jun 2026 13:33:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 61CB9106C94F2;
	Mon, 15 Jun 2026 15:33:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781530421; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=dOWrt41fp9ZkdsfONhl/POwO170vOA3eDS7WRaAIv2Y=;
	b=cN8CNMsqV3vnmukdqV8G3Kzmq5G8amSuHqLO4tp10lfiI1kRuxOzzSVIOf7+6AuuwloL9i
	EG6SwhRzQHIXAoItTEt3q0xG5RNm3La0F1DIV0asn9qRlDZg4i6V45E0qd0ChV4jh3qjXT
	inGsCfhmYmkyv6LTBNRDy2xV4NQjVWHZntpev9zX9XStGsTgIhLlMTMf9yoUXdQCN9YRwv
	t/XfzKsI8HZSndynjUihh3WNXfQmnYPID0ISfu59px6MIQgnFV/lBYoPkbtdYnQ+r1vduy
	l+wlZo1hfEKbr7/6vnPBb9a5YhLqeYxBhb/ysDmThYVw9njwNSrwJliPypg9Kw==
Message-ID: <371a1df7-084c-4431-bd00-0045298e3212@bootlin.com>
Date: Mon, 15 Jun 2026 15:33:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 01/12] net: phylink: keep and use MAC
 supported_interfaces in phylink struct
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
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
 <20260615122950.22281-2-ansuelsmth@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260615122950.22281-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_063345_550734_247FC685 
X-CRM114-Status: GOOD (  17.06  )
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

On 6/15/26 14:29, Christian Marangi wrote:
> Add in phylink struct a copy of supported_interfaces from phylink_config
> and make use of that instead of relying on phylink_config value.
> 
> This in preparation for support of PCS handling internally to phylink
> where a PCS can be removed or added after the phylink is created and we
> need both a reference of the supported_interfaces value from
> phylink_config and an internal value that can be updated with the new
> PCS info.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/net/phy/phylink.c | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 087ac63f9193..4d59c0dd78db 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -60,6 +60,11 @@ struct phylink {
>  	/* The link configuration settings */
>  	struct phylink_link_state link_config;
>  
> +	/* What interface are supported by the current link.
> +	 * Can change on removal or addition of new PCS.
> +	 */
> +	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);

Can you clarify a bit what you mean here ? Is that the combination of the
interfaces the MAC supports AND the currently in-use PCS ?

Maxime


