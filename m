Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F359C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 08:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nKa8XSu47DLzEg4eeaPfmMAiuo/GOOsLCJU6TJ0k7LA=; b=TTzooFyb01rXqFS7lnFGZZIPHG
	2UojjAM9ilp+wWhWJb+buVoRTdkweaYqHuvt0xG5iIjR/g7cXbd/UOG26oWSU9KPcNiDbEOPHUHb1
	BOULixotseADwk/q/usymIpRGJu8CDhy2Yiz8MEzUDE2duaB79NQWIkeVoDDRU2dzdCzxiMojeB9D
	EU6iNrKh7nrrsJF6gv/NW+ywSotsLAo9e85/9gJo+h78RxKCMTJ6hHoTNIxqZO0B9d6XPZ5OowUgR
	kNagjMcmAYoRUTJdYwxIwkuclyw4Y/QRw6jXDTcHz30rNKGa7Sy5XLahZ37DAiYqauPRsFWJDMEUD
	ks+W6COA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGRH-00000002Cm6-09gt;
	Mon, 27 Jul 2026 08:11:55 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woGRD-00000002ClL-2sbR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 08:11:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 421ED4E40F92;
	Mon, 27 Jul 2026 08:11:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 06272601BE;
	Mon, 27 Jul 2026 08:11:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8111911C12243;
	Mon, 27 Jul 2026 10:11:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785139906; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=nKa8XSu47DLzEg4eeaPfmMAiuo/GOOsLCJU6TJ0k7LA=;
	b=LO4yI3cXRdAyaI3myrjwfXedgQocVB83IBPr9x6NF8O8Uv1R2/queGYeu4mPNXAyt9JhYU
	VSoDqzroqt3RNXUyWRfIBgZTXE8H6BH5F85hciTwxXW/Xrl9bbuOJylxX+j0wPAT5S1XkB
	lZxQYS+ukOtbZbg5tc7UEz6D4oJwUfvMuXKhci+Fyalx2nZPC72bHyu97FC+FLMycy5gjV
	fswosZT41fOCWfLSpr8pZP02YuXiWztXOHOGQOlijw7g7utaSAwY8YuFvecobGxKM7Whe4
	REt0EVwE4biL1TonCXC48n+paV2eW20FjfMKNjy4XZHJQdEDbmYdjOqLA+stQQ==
Message-ID: <70cf4cfa-c329-41a5-b335-561a565627d9@bootlin.com>
Date: Mon, 27 Jul 2026 10:11:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: fpe: Keep pmac always enabled
To: muhammad.nazim.amirul.nazle.asmade@altera.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260727051303.14925-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260727051303.14925-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_011152_026944_AD999B87 
X-CRM114-Status: GOOD (  20.83  )
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

On 7/27/26 07:13, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> The preemptive MAC in DWMAC is always enabled, meaning DWMAC is always
> ready to receive preemptive mPackets. Keep pmac_enabled true at init
> time and reject attempts to disable it via ethtool set_mm.
> 
> The FPE residual queue (fprq) controls which Rx queue receives residual
> preemptive mPackets from the pmac. Move its configuration from
> stmmac_fpe_configure_tx() to stmmac_fpe_configure_pmac() where it
> logically belongs.
> 
> Also add a missing return in stmmac_fpe_init() so that the pmac_enabled
> initialization is not reached on hardware where FPE is not supported by
> the driver.

Can you split this up into individual patches, one for the stmmac_set_mm() and
stmmac_fpe_init() to validate that we keep pmac on, one for the missing return,
and one for the pmac configuration in the right fonction ?

Also one comment bellow :> 
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> ---
>  .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |  7 ++++
>  .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 34 ++++++++++++-------
>  2 files changed, 29 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> index 92585d27ab88..8ebdd249e5c8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> @@ -1064,6 +1064,13 @@ static int stmmac_set_mm(struct net_device *ndev, struct ethtool_mm_cfg *cfg,
>  	if (err)
>  		return err;
>  
> +	if (!priv->dma_cap.fpesel)
> +		return -EOPNOTSUPP;
> +
> +	/* DWMAC always have preemptible MAC enabled */
> +	if (!cfg->pmac_enabled)
> +		return -EINVAL;
> +
>  	stmmac_fpe_set_add_frag_size(priv, frag_size);
>  	ethtool_mmsv_set_mm(&priv->fpe_cfg.mmsv, cfg);
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
> index c54c70224351..2bfa84ad04a6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
> @@ -47,20 +47,13 @@ static void stmmac_fpe_configure_tx(struct ethtool_mmsv *mmsv, bool tx_enable)
>  	struct stmmac_fpe_cfg *cfg = container_of(mmsv, struct stmmac_fpe_cfg, mmsv);
>  	struct stmmac_priv *priv = container_of(cfg, struct stmmac_priv, fpe_cfg);
>  	const struct stmmac_fpe_reg *reg = cfg->reg;
> -	u32 num_rxq = priv->plat->rx_queues_to_use;
>  	void __iomem *ioaddr = priv->ioaddr;
> -	u32 value;
>  
> -	if (tx_enable) {
> +	if (tx_enable)
>  		cfg->fpe_csr = STMMAC_MAC_FPE_CTRL_STS_EFPE;
> -		value = readl(ioaddr + reg->rxq_ctrl1_reg);
> -		value &= ~reg->fprq_mask;
> -		/* Keep this SHIFT, FIELD_PREP() expects a constant mask :-/ */
> -		value |= (num_rxq - 1) << __ffs(reg->fprq_mask);
> -		writel(value, ioaddr + reg->rxq_ctrl1_reg);
> -	} else {
> +	else
>  		cfg->fpe_csr = 0;
> -	}
> +
>  	writel(cfg->fpe_csr, ioaddr + reg->mac_fpe_reg);
>  }
>  
> @@ -68,10 +61,11 @@ static void stmmac_fpe_configure_pmac(struct ethtool_mmsv *mmsv, bool pmac_enabl
>  {
>  	struct stmmac_fpe_cfg *cfg = container_of(mmsv, struct stmmac_fpe_cfg, mmsv);
>  	struct stmmac_priv *priv = container_of(cfg, struct stmmac_priv, fpe_cfg);
> +	u32 num_rxq = priv->plat->rx_queues_to_use;
>  	const struct stmmac_fpe_reg *reg = cfg->reg;
>  	void __iomem *ioaddr = priv->ioaddr;
>  	unsigned long flags;
> -	u32 value;
> +	u32 value, value_2;
>  
>  	spin_lock_irqsave(&priv->hw->irq_ctrl_lock, flags);
>  	value = readl(ioaddr + reg->int_en_reg);
> @@ -83,6 +77,14 @@ static void stmmac_fpe_configure_pmac(struct ethtool_mmsv *mmsv, bool pmac_enabl
>  
>  			value |= reg->int_en_bit;
>  		}
> +		/* Frame Preemption Residue Queue is the Rx Queue to which
> +		 * residual preemptive mPackets must be forwarded from the pmac.
> +		 */
> +		value_2 = readl(ioaddr + reg->rxq_ctrl1_reg);
> +		value_2 &= ~reg->fprq_mask;
> +		/* Keep this SHIFT, FIELD_PREP() expects a constant mask :-/ */

you can use u32_replace_bits for non constant expr :

https://elixir.bootlin.com/linux/v7.2-rc4/source/include/linux/bitfield.h#L236

(it's autogenerated and not documented, hence very hard to find IMO)

Maxime

