Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B71C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 06:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xpEYzsbGTSVFGj/lSmF+buaqJllHyC8FKf7eTRA+e8E=; b=QcWA0FTCMY4wDd2xOE4oKFYqtJ
	yHoESCbK95GLuDikrFtKf7Qb9qqNlidP1r5wGMRRcaTK0Y3dDziNpyABmMKesdMlVgOmH2T1Lp5gh
	Q0RdqzLmiSd0bguB/puH4FsRmaTUR7+3+tEoLVsELQwmhti/BGlqed8uJvlTjHB9Lncl6oI3NcqYB
	rERel9jDenTjjZHlL2UZOwNY7I+UtLc+P5ADSCKYu6NA7Mq92Z7hzkMjRTGHEKqjmoFjco106fguX
	AG9roW04K1fQps+1bWGCZi0w6MVAoJIfMuZOPAewgxmGQ4PvqUs41Vf1TRNiCSZu5nDlwp2eXgzNj
	+vMaQuBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woxlc-000000071Q7-11x4;
	Wed, 29 Jul 2026 06:27:48 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woxlY-000000071Ov-0Z11
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 06:27:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 598C71A12E9;
	Wed, 29 Jul 2026 06:27:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2573B6039A;
	Wed, 29 Jul 2026 06:27:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D88011C14996;
	Wed, 29 Jul 2026 08:27:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785306457; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=xpEYzsbGTSVFGj/lSmF+buaqJllHyC8FKf7eTRA+e8E=;
	b=oqXHB765Ps+YvI9XtjAJ5+863C31NdUdn1AF00G2ATvComzFQbjqUeAGeC74OGMqrNivzx
	TlqK/eXCE1pXAyW8ETprps+xRJYL3IGCTabCW1OfEdt9irDIN9xTv2X8Aj5D4JXaQpebKe
	EgC6QrCLN7hwxuVw/0L5lRiYGXc3LVLrWvQYmsi2pd5MsOFueMN6krUL9vb96938hpqxui
	T81LcF1CBeJGZNl45RQ1QKJZmf0tsFP8UXRKdZne0TrsabUuefX0pQ6ytPWa1rqlH2YXiS
	UyvACZyfhpqxPZSHIGnlz8n94tZPH6sCYnTuNeG/L6msWPfidMkVGeoRRq315Q==
Message-ID: <5cc2d491-2f57-4745-8dcd-3f63ba0cbf96@bootlin.com>
Date: Wed, 29 Jul 2026 08:27:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/3] net: stmmac: fpe: Add missing return in
 stmmac_fpe_init()
To: muhammad.nazim.amirul.nazle.asmade@altera.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260729015247.25774-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260729015247.25774-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260729015247.25774-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_232744_332631_D3CB759F 
X-CRM114-Status: GOOD (  15.28  )
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

On 7/29/26 03:52, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> When FPE is not supported by the driver, stmmac_fpe_init() prints a
> warning but falls through into the pmac_enabled initialization, which
> should only be reached on supported hardware. Add the missing return
> to prevent this.
> 
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks,

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
> index 2f880c5e35b0..3436e962a238 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
> @@ -174,8 +174,10 @@ void stmmac_fpe_init(struct stmmac_priv *priv)
>  			  &stmmac_mmsv_ops);
>  
>  	if ((!priv->fpe_cfg.reg || !priv->hw->mac->fpe_map_preemption_class) &&
> -	    priv->dma_cap.fpesel)
> +	    priv->dma_cap.fpesel) {
>  		dev_info(priv->device, "FPE is not supported by driver.\n");
> +		return;
> +	}
>  
>  	/* The preemptive MAC in DWMAC is always enabled, so initialize
>  	 * pmac_enabled to true to reflect the hardware state.


