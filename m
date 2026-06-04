Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E959ECD6E68
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 07:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0MSZZu4FCZaVylYhNYqwOIj8dwu7s4P1sh+7TqmddQ=; b=I+E2LM4IJVokcTxaSVkII6Gk7V
	aBtzPgosIMuC5d2kSroCAcm4jmnO38od37Q/HjZWlC/m4LjFnaMCG+sDAbPwBS1NLO4Lek7KEx6ir
	kAm4emK4HbwKcun59aqGVQnGTqNvwI9YdWheWj9zIGIV/DoVPWyJSMoybhpNfNTQ0JNY/ourvIEFG
	CZPiAJGXxWwpZTCmEw1e2kxcCvRO6JngV/bGIboKOE975f3/Q1UcaRioC62BTwIODZCDAl7onyESO
	R+F4BBKBNGQxU9wNPcYhxENKCZ0j+0x5sgrtDKr6flDsOW/YunKT2jxIgdSjKzmejo82xHH6VOSMF
	NhDfzCxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2RO-0000000GInz-27N7;
	Thu, 04 Jun 2026 07:24:34 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2RL-0000000GImd-1zNZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 07:24:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5FBE91A0570;
	Thu,  4 Jun 2026 07:24:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3252E5FEF7;
	Thu,  4 Jun 2026 07:24:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 096F7106A1739;
	Thu,  4 Jun 2026 09:24:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780557866; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=B0MSZZu4FCZaVylYhNYqwOIj8dwu7s4P1sh+7TqmddQ=;
	b=ncFrbHrcOfy69cmMaIY9qfsIVplRb5/ou9Jowm/GbTLnSdHg50SXOFp6Aq/zpEZbbOfNeZ
	mbpfAIVI3hp3MEu/Vf7dctSrOjmrrGz51YPSslUXq/fGLh5ErD6hJpa1XleookCo8VltGM
	DZclim8KevAzRUttwGqsNOAPbHRqInSAAtIUqHvA74Hn3Z9Liy2lLJw3p2Ygz8h92bHkSX
	aisZkcZxtzgI8ieyl/lo4nh3JVRZ6yaxkOnPwsexXw1/HwWmViXG94fzHEcx+33g2yuyp1
	YZ5TyUNAr4jcWv5IoxaNgQwu+jnp8kRMbyVdx9QgfJAz/gOIVpItmWWnQqt8WQ==
Message-ID: <c7e6f722-fc58-4b6d-bdc8-613a9c0ac929@bootlin.com>
Date: Thu, 4 Jun 2026 09:24:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: dwmac4: Report DCB feature
 capability
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, o.rempel@pengutronix.de
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260603173644.24371-1-ovidiu.panait.rb@renesas.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260603173644.24371-1-ovidiu.panait.rb@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_002431_673681_A780E22B 
X-CRM114-Status: GOOD (  12.49  )
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

On 6/3/26 19:36, Ovidiu Panait wrote:
> Bit 16 of the MAC HW Feature1 register reports the DCB (Data Centre
> Bridging) feature. Read it so that dma_cap.dcben and the debugfs
> report it accurately. Right now it is always reported as being disabled.
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

This matches with what I have in the iMX8MP ref manual :)

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thank you,

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac4.h     | 1 +
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
> index ffcd036d4c02..6382836828ba 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4.h
> @@ -198,6 +198,7 @@ enum power_event {
>  #define GMAC_HW_FEAT_AVSEL		BIT(20)
>  #define GMAC_HW_TSOEN			BIT(18)
>  #define GMAC_HW_FEAT_SPHEN		BIT(17)
> +#define GMAC_HW_FEAT_DCBEN		BIT(16)
>  #define GMAC_HW_ADDR64			GENMASK(15, 14)
>  #define GMAC_HW_TXFIFOSIZE		GENMASK(10, 6)
>  #define GMAC_HW_RXFIFOSIZE		GENMASK(4, 0)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> index 28728271fbc9..829a23bdad01 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c
> @@ -391,6 +391,7 @@ static int dwmac4_get_hw_feature(void __iomem *ioaddr,
>  	dma_cap->av = (hw_cap & GMAC_HW_FEAT_AVSEL) >> 20;
>  	dma_cap->tsoen = (hw_cap & GMAC_HW_TSOEN) >> 18;
>  	dma_cap->sphen = (hw_cap & GMAC_HW_FEAT_SPHEN) >> 17;
> +	dma_cap->dcben = (hw_cap & GMAC_HW_FEAT_DCBEN) >> 16;
>  
>  	dma_cap->addr64 = (hw_cap & GMAC_HW_ADDR64) >> 14;
>  	switch (dma_cap->addr64) {


