Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5DDCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 16:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V0GuOlYRzJM4pDQWpmA6usQcahnlbuw1Vm/ChjlY/AI=; b=ddQL5HWDY96yR7wO8BdbvnI06r
	NGbd2qvhc/275Imj8a3Vki/nPfNxoC+jSvSCZQyMSuoKuRE6g048fvqY1t2/00LgRWOn9gNztx04L
	kwfS/LOLdLujlnvSimi6UvmShShgv4HVH4grUL93JG62rZFKYX8pnnZNSH4FjCmRlqjM8Uf4ip9ry
	MDnF6UKic5gPAfVZCNP9zlLMdtMfadzGfQ2ufcOW1k4H/B5M4Otap/YX6yPBcTGJjg8LmISEx90jr
	pC2mVXHGcUyo6scluVF1z55/WoBHs5kmrTIgBEeVoB/W1EdgnbPmK+Om9bd+1y6kRaC1N9AJ4YPHr
	ucO8dSNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc4OT-00000006fBS-0xY0;
	Tue, 23 Jun 2026 16:54:37 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc4OQ-00000006fA6-0FJs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 16:54:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D2D66C6B397;
	Tue, 23 Jun 2026 16:54:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3FB72601C2;
	Tue, 23 Jun 2026 16:54:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A4181106C8382;
	Tue, 23 Jun 2026 18:54:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782233671; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=V0GuOlYRzJM4pDQWpmA6usQcahnlbuw1Vm/ChjlY/AI=;
	b=aVAhQo1Dl8B067G6c6X1YlKSceYxNORBwII2/tFPIRcS3+FcEBJ9ix/7L1fpUQ3e74MNjA
	iWV4EKuSIDPyTGlSiuvg76b0/1onRG+MJFEDF0ZrHf2ePk28OJArBYcUMIZhmUuQRd/DD3
	wsq50D8mKAob+JsOdHGnJFiBQRfJ4A7yLmvl/pVbISU2has5sBS8ZvNra9M0vKwoKVF3Tq
	rWFrp+kRbHaYwKygVplxYTDreeAm3B7FAf+0Pi8SAjC65WqFVpXpMpeOU2SRqLAx+Kl+mu
	4yTMA9wtb1o5+lcslnUa9EvsU6oHd1l6P3M9u8trBHvenKcQkuYqGurScb7yRg==
Message-ID: <143145af-5846-4a7b-9953-33c51b1dbef3@bootlin.com>
Date: Tue, 23 Jun 2026 18:54:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 2/2] net: stmmac: dwmac-spacemit: Fix wrong irq
 definition
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
 <20260623074637.503864-3-inochiama@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260623074637.503864-3-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_095434_270474_A27FDFD2 
X-CRM114-Status: GOOD (  11.42  )
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

On 6/23/26 09:46, Inochi Amaoto wrote:
> The current irq definition of the wake irq and the lpi irq
> is wrong, replace them with the right number and name.
> 
> Fixes: 30f0ba420ed3 ("net: stmmac: Add glue layer for Spacemit K3 SoC")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> index 3bfb6d49be6c..322bdf167a4a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> @@ -22,8 +22,8 @@
>  #define CTRL_PHY_INTF_RMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 0)
>  #define CTRL_PHY_INTF_RGMII		FIELD_PREP(CTRL_PHY_INTF_MODE, 1)
>  #define CTRL_PHY_INTF_MII		FIELD_PREP(CTRL_PHY_INTF_MODE, 3)
> -#define CTRL_WAKE_IRQ_EN		BIT(9)
> -#define CTRL_PHY_IRQ_EN			BIT(12)
> +#define CTRL_LPI_IRQ_EN			BIT(9)
> +#define CTRL_WAKE_IRQ_EN		BIT(12)
>  
>  /* dline register bits */
>  #define RGMII_RX_DLINE_EN		BIT(0)


