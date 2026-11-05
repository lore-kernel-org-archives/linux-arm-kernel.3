Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E654C606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 09:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TkSQ1dOH;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0/vPB2c/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uPCau9lp+BpbylcdJNudW5r9b3sR9WDS743Y91v+hfg=; b=TkSQ1dOHmpSL8y
	EqYoEo1L/Y26hfCKa+9y+peqaV3qPPw2Dfsw6EcDdhG3QDEYav6JftsF0r+xGIlSb3DlTq/G1W/7e
	pkZ5W84Hp9kf9mzTGvlJO8X5wV2JWW0rqjB7r5NMcW73OKujPVIOD/je2rUZjuZ9eibbuvDlp7aI1
	h6ohMG6w2XxkD9faX/k1+tzNi/z7HkuxCkZ9Iu4CVF6jyLZj9HKMuAiXh8HT4ZYVkQZoYPbVaki3G
	SEH9DTYSD4IPF+b7+Rut/26cjuEcxDqYmJA+ZvT/06nUl/aFa2/GG/9RdZ7NeR03pAMdUWhn2kjsu
	qiV94VBcOh8RnP1fhKYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtfN-00000008HTV-2rVC;
	Thu, 05 Nov 2026 09:21:53 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtfK-00000008HSt-19kB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 09:21:52 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4577D1A07FF;
	Thu,  5 Nov 2026 09:21:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1029E5FF85;
	Thu,  5 Nov 2026 09:21:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 01BB110328E77;
	Thu,  5 Nov 2026 10:21:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793870503; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=uPCau9lp+BpbylcdJNudW5r9b3sR9WDS743Y91v+hfg=;
	b=0/vPB2c/1f9mEl0RkFlMBsx8PHjAfybM5XFJlrhhhrnGot3pGM1q+VjozisV0cV4kdd3aW
	4dDqCBw8HTqr+m23zLyP4kXnfcyvvuErXq+z0m/8HA3I4s9o56fBTdktLmsSGfOn4seGD4
	7THsZ5WIapjan2XNdhjMJNhLlIc9qF+dX5YkNxqW+irp2k8+4xyoFJCLC8NKe0SJia/Pps
	MIOQLv3Gvwa2BD4lg6aeKXiN5y1x10RqMDbRurEEEky8u9oStlzQ5ZewBHiuFKWcAygiA3
	O2uMiiSrb290vBmWBS681d3uwJMYqafNaN9NeVX4OUcv4UnmDbBeYQArdPCuBw==
Message-ID: <8f310c06-8f02-4870-b7e5-ab58184207bb@bootlin.com>
Date: Thu, 5 Nov 2026 10:21:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: set XDP metadata length on the page_pool
 RX path
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>,
 Song Yoong Siang <yoong.siang.song@intel.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 bpf@vger.kernel.org
References: <20261102-stmmac_meatada_pp_path-v1-1-d93cc4f9a864@oss.qualcomm.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261102-stmmac_meatada_pp_path-v1-1-d93cc4f9a864@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_012150_470566_A78F1379 
X-CRM114-Status: GOOD (  20.85  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 11/2/26 12:46, Lorenzo Bianconi wrote:
> stmmac_rx() initializes the XDP buffer with the metadata area valid, so
> an XDP program can reserve metadata with bpf_xdp_adjust_meta() and write
> it in [xdp->data_meta, xdp->data), for example to export the RX hardware
> timestamp obtained from the metadata kfunc. When such a frame is passed
> to the stack, the skb is built in place around the same page with
> napi_build_skb(), but skb_metadata_set() is never called.
> 
> napi_build_skb() clears skb_shared_info up to dataref, which includes
> meta_len, so skb_metadata_len() stays zero. The stack and TC BPF then see
> an empty metadata range even though the bytes are present in the skb
> headroom. The AF_XDP zero-copy path already records the length in
> stmmac_construct_skb_zc().
> 
> Record the metadata length after reserving the headroom and adding the
> frame data. No copy is needed because the skb is built over the buffer the
> XDP program wrote to. With the length recorded, the software VLAN
> stripping path can move the metadata together with the MAC header, as it
> already does for zero-copy frames.
> 
> Fixes: e3f9c3e34840 ("net: stmmac: add Rx HWTS metadata to XDP receive pkt")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

LGTM, matches the ZC path,

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index b038472b9817..f97f6dc08789 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6012,7 +6012,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  		}
>  
>  		if (!skb) {
> -			unsigned int head_pad_len;
> +			unsigned int metasize;
>  
>  			/* XDP program may expand or reduce tail */
>  			buf1_len = ctx.xdp.data_end - ctx.xdp.data;
> @@ -6029,10 +6029,14 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  			}
>  
>  			/* XDP program may adjust header */
> -			head_pad_len = ctx.xdp.data - ctx.xdp.data_hard_start;
> -			skb_reserve(skb, head_pad_len);
> +			skb_reserve(skb,
> +				    ctx.xdp.data - ctx.xdp.data_hard_start);
>  			skb_put(skb, buf1_len);
>  			skb_mark_for_recycle(skb);
> +
> +			metasize = ctx.xdp.data - ctx.xdp.data_meta;
> +			if (metasize)
> +				skb_metadata_set(skb, metasize);
>  			buf->page = NULL;
>  		} else if (buf1_len) {
>  			dma_sync_single_for_cpu(priv->device, buf->addr,
> 
> ---
> base-commit: 21f57ec673a1917547c808cfa81890485fffa03b
> change-id: 20261102-stmmac_meatada_pp_path-0c1b9299e2fb
> 
> Best regards,


