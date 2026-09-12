Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872C8C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 09:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jlDAifSOhcOWqoOnA1uxysXhHTyvwF8FnNiIJAQAd3Q=; b=A8F9lPsUOapS/VaYsa64294EaQ
	WSrANuFlpfrAJiaM3P5eIPObO6Arn0aK/GDd4obnoIpGGA3xzI9eINnMw28aohNWRtX7T4Pw5GygN
	ZKzPDfxE5Q1qJfgqVhw96Nag1u8jDXw7i2tc0ttJazAZJFh8D70qr8Xjm0LJkKWo4kKY7RLdyVjsC
	yeOqQEQ/5+T+7Sww4a5KA+xgBvtoT98o8lgcQUaK3wsjk6DSzR15bY++Qy2UJXPGPjeZKbY+NzynM
	pAk80tVWHjT0DqBQFoqE8f+WT52suGBFQf56a0txcoveaj/1fnDfXGeB5INqiLMdcEVAlm98NbXYn
	6HsDNFQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Jya-00000000jwv-47kr;
	Sat, 12 Sep 2026 09:24:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5JyZ-00000000jwp-4B3H
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 09:24:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E20B601F1;
	Sat, 12 Sep 2026 09:24:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F23D1F000FF;
	Sat, 12 Sep 2026 09:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789205087;
	bh=jlDAifSOhcOWqoOnA1uxysXhHTyvwF8FnNiIJAQAd3Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dbvUO2HunQLYViPkLwkbKS7RsK6z9nBOTHnsekm2y661Eq/t2NOGMorFD2b+Paqct
	 OMqjVgFy3I8EyIJ/wAp8F9IFecXMDjEv3JH1nxjKqxhdl3I3YaXmKYFhiDNg8nCjo4
	 46cOAx27sfB3PtQGBkeAOJ69ItoSrwjVgXFzj5bLdPUpsnXXYtezyk4gFoXIVVP1rH
	 VmchgJ3u3BJay22D3pzIq9lH8lvrGDCpI7ZzowEThm6DntqAG/bwqy4V06sS4ElLg9
	 5chGe/gkqYuPYkIh585XtXjcaVJuu27qcemIO7ciJQvSj3b3NC5c+GF5yGfNmZpibm
	 ZcgRYn99K/3bQ==
Message-ID: <17df0369-0a94-4763-b4c0-ce1f7c99d02d@kernel.org>
Date: Sat, 12 Sep 2026 11:24:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: bestcomm: make gen_bd init helpers static
To: Rosen Penev <rosenp@gmail.com>, dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:FREESCALE SOC DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:FREESCALE SOC DRIVERS" <linux-arm-kernel@lists.infradead.org>
References: <20260911215914.175851-1-rosenp@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260911215914.175851-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



Le 11/09/2026 à 23:59, Rosen Penev a écrit :
> bcom_gen_bd_rx_init() and bcom_gen_bd_tx_init() are only called from
> the PSC wrapper functions in gen_bd.c, so make them static, drop
> their now-unneeded exports, and remove the corresponding header
> declarations.  The reset and release variants stay exported because
> sound/soc/fsl/mpc5200_dma.c calls them from a separate module.

What do you mean by "variants" ? For me a variant is something that does 
the same but slightly differently.

Maybe add that last extern user was removed by commit 7d3ee229ea51 
("powerpc: Drop MPC5200 LocalPlus bus FIFO driver")

Christophe

> 
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   drivers/dma/bestcomm/gen_bd.c       | 6 ++----
>   include/linux/fsl/bestcomm/gen_bd.h | 8 --------
>   2 files changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/dma/bestcomm/gen_bd.c b/drivers/dma/bestcomm/gen_bd.c
> index 61b5746e1a97..b5093f7445cb 100644
> --- a/drivers/dma/bestcomm/gen_bd.c
> +++ b/drivers/dma/bestcomm/gen_bd.c
> @@ -81,7 +81,7 @@ struct bcom_gen_bd_priv {
>   /* Task support code                                                        */
>   /* ======================================================================== */
>   
> -struct bcom_task *
> +static struct bcom_task *
>   bcom_gen_bd_rx_init(int queue_len, phys_addr_t fifo,
>   			int initiator, int ipr, int maxbufsize)
>   {
> @@ -108,7 +108,6 @@ bcom_gen_bd_rx_init(int queue_len, phys_addr_t fifo,
>   
>   	return tsk;
>   }
> -EXPORT_SYMBOL_GPL(bcom_gen_bd_rx_init);
>   
>   int
>   bcom_gen_bd_rx_reset(struct bcom_task *tsk)
> @@ -166,7 +165,7 @@ bcom_gen_bd_rx_release(struct bcom_task *tsk)
>   EXPORT_SYMBOL_GPL(bcom_gen_bd_rx_release);
>   
>   
> -extern struct bcom_task *
> +static struct bcom_task *
>   bcom_gen_bd_tx_init(int queue_len, phys_addr_t fifo,
>   			int initiator, int ipr)
>   {
> @@ -192,7 +191,6 @@ bcom_gen_bd_tx_init(int queue_len, phys_addr_t fifo,
>   
>   	return tsk;
>   }
> -EXPORT_SYMBOL_GPL(bcom_gen_bd_tx_init);
>   
>   int
>   bcom_gen_bd_tx_reset(struct bcom_task *tsk)
> diff --git a/include/linux/fsl/bestcomm/gen_bd.h b/include/linux/fsl/bestcomm/gen_bd.h
> index aeb312a1cd00..7253d308d77a 100644
> --- a/include/linux/fsl/bestcomm/gen_bd.h
> +++ b/include/linux/fsl/bestcomm/gen_bd.h
> @@ -16,10 +16,6 @@ struct bcom_gen_bd {
>   };
>   
>   
> -extern struct bcom_task *
> -bcom_gen_bd_rx_init(int queue_len, phys_addr_t fifo,
> -			int initiator, int ipr, int maxbufsize);
> -
>   extern int
>   bcom_gen_bd_rx_reset(struct bcom_task *tsk);
>   
> @@ -27,10 +23,6 @@ extern void
>   bcom_gen_bd_rx_release(struct bcom_task *tsk);
>   
>   
> -extern struct bcom_task *
> -bcom_gen_bd_tx_init(int queue_len, phys_addr_t fifo,
> -			int initiator, int ipr);
> -
>   extern int
>   bcom_gen_bd_tx_reset(struct bcom_task *tsk);
>   


