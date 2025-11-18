Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D62CEDD8C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 14:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tKcPsWAd0SsskrrZFIB++4roCws5Nk8piYZIenBy0Mk=; b=D6EF/x1ErBwXatqpQyOA9m00u9
	szdELgxjpRYNQX7i/vAHYSs41xabO5PhyfSoOwcDwfcWISpHWYdz1BHgs2qluHGodOG67VyYTEmMr
	8Q3qSsEz/YNPOa6BgDETxIfdzeR6fNLPibhIeHAUFlBtIF7KMb6pe05GmhUYUrXZBxPFQ3YfEyB+G
	W3sYOtrhXfgIKgEMox4M9dwohyRq/H1YIEDmBy1m8Az7kv0zu9OH9UBr3i48cbMoNqjJHlyREu0UH
	iW/5dTZoMyDAXGrzAOBXIhNANHQA9MxRK/oZN8YBtuuSibTat+XN/UBHzDzvfOH70omKbixyOS/Lv
	pRyG9HPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMK7-00000000X3L-3IjF;
	Tue, 18 Nov 2025 14:04:47 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMK4-00000000X2m-2syU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 14:04:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2ABC94E4175E;
	Tue, 18 Nov 2025 14:04:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ED672606FE;
	Tue, 18 Nov 2025 14:04:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF4BD10371DE4;
	Tue, 18 Nov 2025 15:04:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763474682; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=tKcPsWAd0SsskrrZFIB++4roCws5Nk8piYZIenBy0Mk=;
	b=PIXdcyV1VFSLgxJHObkoKhmVsgPg5s3qo2j8g3p/g6qWPaUh8J8FYjAiiiif9MNlGzwMzV
	lz7LMPctiPPKEyJF8i+bsVWLFgHPLTJpVk9zm48QGSCpblM4LXq7oLRY1lJWgjr1WSG5IR
	KbJdZLGjZHx5BAvIqhbH5PXFbqM6vf7oMjss+bst40XitdaIgFpW9EmMijAG3zioAxFtzq
	oD2TznjHXQipPAxscoBXhr9qLVIv8rnyCprcpx3ZE9guzHM9yhlkimIqzvPj8WGclIO36z
	dpJqNuI2SieW+w0gXI/YNe2HzISuiA83iAnMV1rK+rqE9q/RWuc9Lo25W8r2YQ==
Message-ID: <03d4583c-6063-46e9-b578-096d343beabc@bootlin.com>
Date: Tue, 18 Nov 2025 15:04:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: convert priv->sph* to boolean and
 rename
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Stanislav Fomichev <sdf@fomichev.me>
References: <E1vLIDN-0000000Evur-2NLU@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vLIDN-0000000Evur-2NLU@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_060444_871118_DC94A48C 
X-CRM114-Status: GOOD (  19.75  )
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



On 18/11/2025 10:41, Russell King (Oracle) wrote:
> priv->sph* only have 'true' and 'false' used with them, yet they are an
> int. Change their type to a bool, and rename to make their usage more
> clear.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  4 +--
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 26 +++++++++----------
>  .../stmicro/stmmac/stmmac_selftests.c         |  2 +-
>  .../net/ethernet/stmicro/stmmac/stmmac_xdp.c  |  2 +-
>  4 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index e9ed5086c049..012b0a477255 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -254,8 +254,8 @@ struct stmmac_priv {
>  	int hwts_tx_en;
>  	bool tx_path_in_lpi_mode;
>  	bool tso;
> -	int sph;
> -	int sph_cap;
> +	bool sph_active;
> +	bool sph_capable;
>  	u32 sarc_type;
>  	u32 rx_riwt[MTL_MAX_RX_QUEUES];
>  	int hwts_rx_en;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index d08ff8f5ff15..db68c89316ec 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1523,7 +1523,7 @@ static int stmmac_init_rx_buffers(struct stmmac_priv *priv,
>  		buf->page_offset = stmmac_rx_offset(priv);
>  	}
>  
> -	if (priv->sph && !buf->sec_page) {
> +	if (priv->sph_active && !buf->sec_page) {
>  		buf->sec_page = page_pool_alloc_pages(rx_q->page_pool, gfp);
>  		if (!buf->sec_page)
>  			return -ENOMEM;
> @@ -2109,7 +2109,7 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
>  	pp_params.offset = stmmac_rx_offset(priv);
>  	pp_params.max_len = dma_conf->dma_buf_sz;
>  
> -	if (priv->sph) {
> +	if (priv->sph_active) {
>  		pp_params.offset = 0;
>  		pp_params.max_len += stmmac_rx_offset(priv);
>  	}
> @@ -3603,7 +3603,7 @@ static int stmmac_hw_setup(struct net_device *dev)
>  	}
>  
>  	/* Enable Split Header */
> -	sph_en = (priv->hw->rx_csum > 0) && priv->sph;
> +	sph_en = (priv->hw->rx_csum > 0) && priv->sph_active;
>  	for (chan = 0; chan < rx_cnt; chan++)
>  		stmmac_enable_sph(priv, priv->ioaddr, sph_en, chan);
>  
> @@ -4895,7 +4895,7 @@ static inline void stmmac_rx_refill(struct stmmac_priv *priv, u32 queue)
>  				break;
>  		}
>  
> -		if (priv->sph && !buf->sec_page) {
> +		if (priv->sph_active && !buf->sec_page) {
>  			buf->sec_page = page_pool_alloc_pages(rx_q->page_pool, gfp);
>  			if (!buf->sec_page)
>  				break;
> @@ -4906,7 +4906,7 @@ static inline void stmmac_rx_refill(struct stmmac_priv *priv, u32 queue)
>  		buf->addr = page_pool_get_dma_addr(buf->page) + buf->page_offset;
>  
>  		stmmac_set_desc_addr(priv, p, buf->addr);
> -		if (priv->sph)
> +		if (priv->sph_active)
>  			stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, true);
>  		else
>  			stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, false);
> @@ -4941,12 +4941,12 @@ static unsigned int stmmac_rx_buf1_len(struct stmmac_priv *priv,
>  	int coe = priv->hw->rx_csum;
>  
>  	/* Not first descriptor, buffer is always zero */
> -	if (priv->sph && len)
> +	if (priv->sph_active && len)
>  		return 0;
>  
>  	/* First descriptor, get split header length */
>  	stmmac_get_rx_header_len(priv, p, &hlen);
> -	if (priv->sph && hlen) {
> +	if (priv->sph_active && hlen) {
>  		priv->xstats.rx_split_hdr_pkt_n++;
>  		return hlen;
>  	}
> @@ -4969,7 +4969,7 @@ static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,
>  	unsigned int plen = 0;
>  
>  	/* Not split header, buffer is not available */
> -	if (!priv->sph)
> +	if (!priv->sph_active)
>  		return 0;
>  
>  	/* Not last descriptor */
> @@ -6037,8 +6037,8 @@ static int stmmac_set_features(struct net_device *netdev,
>  	 */
>  	stmmac_rx_ipc(priv, priv->hw);
>  
> -	if (priv->sph_cap) {
> -		bool sph_en = (priv->hw->rx_csum > 0) && priv->sph;
> +	if (priv->sph_capable) {
> +		bool sph_en = (priv->hw->rx_csum > 0) && priv->sph_active;
>  		u32 chan;
>  
>  		for (chan = 0; chan < priv->plat->rx_queues_to_use; chan++)
> @@ -6987,7 +6987,7 @@ int stmmac_xdp_open(struct net_device *dev)
>  	}
>  
>  	/* Adjust Split header */
> -	sph_en = (priv->hw->rx_csum > 0) && priv->sph;
> +	sph_en = (priv->hw->rx_csum > 0) && priv->sph_active;
>  
>  	/* DMA RX Channel Configuration */
>  	for (chan = 0; chan < rx_cnt; chan++) {
> @@ -7736,8 +7736,8 @@ int stmmac_dvr_probe(struct device *device,
>  	if (priv->dma_cap.sphen &&
>  	    !(priv->plat->flags & STMMAC_FLAG_SPH_DISABLE)) {
>  		ndev->hw_features |= NETIF_F_GRO;
> -		priv->sph_cap = true;
> -		priv->sph = priv->sph_cap;
> +		priv->sph_capable = true;
> +		priv->sph_active = priv->sph_capable;
>  		dev_info(priv->device, "SPH feature enabled\n");
>  	}
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
> index a01bc394d1ac..e90a2c469b9a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
> @@ -1721,7 +1721,7 @@ static int stmmac_test_sph(struct stmmac_priv *priv)
>  	struct stmmac_packet_attrs attr = { };
>  	int ret;
>  
> -	if (!priv->sph)
> +	if (!priv->sph_active)
>  		return -EOPNOTSUPP;
>  
>  	/* Check for UDP first */
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
> index aa6f16d3df64..d7e4db7224b0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
> @@ -129,7 +129,7 @@ int stmmac_xdp_set_prog(struct stmmac_priv *priv, struct bpf_prog *prog,
>  		bpf_prog_put(old_prog);
>  
>  	/* Disable RX SPH for XDP operation */
> -	priv->sph = priv->sph_cap && !stmmac_xdp_is_enabled(priv);
> +	priv->sph_active = priv->sph_capable && !stmmac_xdp_is_enabled(priv);
>  
>  	if (if_running && need_update)
>  		stmmac_xdp_open(dev);


