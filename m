Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5289CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 13:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hB96Gs8hLMTWWdb83gK/pYz1+UsEAi8km31i/cat4RQ=; b=QWbM+cfy87TWemZO/geloyDKO4
	ZFB6IMNkyZ/uHkD5wW9TP7NzXOa86oahryOd8jKNaKjH+PT/Vo9tvI5gIoSgOZLgupX30r/PtCL4t
	GxuwQKjGsAOxTbpN4SlzH0x5WWFgKlKuQvqNa4SLhyi7Rrf7lYi3xmZBypcCZfTo229hUaE62HDda
	78NpLH/eGa95gYvlzUwHnJ9GelWf/cmpVanJsr/jBVJvl9NOkv6VC/cIl791E6fZqUHUzwzmKa2pA
	Z7aHtw695w7hLzI+J+8Hjx2A6i6r7lkUA5cUyoLWWoH71PBhNyIDUjXNakeJYzTIFEnOYZBW86TZ8
	SdTS7R/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDjDL-0000000Gavu-2jtS;
	Mon, 05 Oct 2026 13:58:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDjDK-0000000Gavm-1U0n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 13:58:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BEA614395D;
	Mon,  5 Oct 2026 13:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2FE91F000FF;
	Mon,  5 Oct 2026 13:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791208725;
	bh=hB96Gs8hLMTWWdb83gK/pYz1+UsEAi8km31i/cat4RQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lxcb1hadOyNcndGwI00W4Z2i9T1Fj36nxN1D2FABJulC5gVeSYv5Q9e2v7Du8iSo8
	 l9EdafQXzGFQb+2bUrP9KVZaLoOCsN3EgLkxVj1c87x5MSVAPl57SMTUU2P4+p3VHu
	 dW7zwbSIFQGEybrPwwAxc4rTFnnJed0v+0TOEGX/5ZFrzX6u/FnQw01BhKBweU9dvK
	 +D3bIIVYRcoPMn/kerQrg3ohui+YMleOC/fVXOCg5cZZ9yK+kQCyC0For2J9Km7QWi
	 49zRK2Pc3DelHioJT8W1saw4BDmTjJXwguBFIRXNl58T9Pk7EUgTrIfmKsWsFVXd3n
	 rzZ6qquDq2Z5g==
Date: Mon, 5 Oct 2026 15:58:42 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dmaengine: fix typos in comments
Message-ID: <asOtEhjOMXc9SVNP@parshuram>
References: <20260907063343.22255-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907063343.22255-1-hemanth.selam@gmail.com>
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

On 07-09-26, 12:03, Hemanth Selam wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  drivers/dma/bcm-sba-raid.c        | 8 ++++----
>  drivers/dma/ppc4xx/xor.h          | 2 +-
>  drivers/dma/xilinx/xilinx_dpdma.c | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/dma/bcm-sba-raid.c b/drivers/dma/bcm-sba-raid.c
> index 0de03611252e..485fcde390dd 100644
> --- a/drivers/dma/bcm-sba-raid.c
> +++ b/drivers/dma/bcm-sba-raid.c
> @@ -734,7 +734,7 @@ sba_prep_dma_memcpy(struct dma_chan *dchan, dma_addr_t dst, dma_addr_t src,
>  	struct sba_device *sba = to_sba_device(dchan);
>  	struct sba_request *first = NULL, *req;
>  
> -	/* Create chained requests where each request is upto hw_buf_size */
> +	/* Create chained requests where each request is up to hw_buf_size */

This is bogus, pls drop these... If there are real typos pls fix those
instead! This is not a language book, it is code, upto should be just
fine!

>  	while (len) {
>  		req_len = (len < sba->hw_buf_size) ? len : sba->hw_buf_size;
>  
> @@ -877,7 +877,7 @@ sba_prep_dma_xor(struct dma_chan *dchan, dma_addr_t dst, dma_addr_t *src,
>  	if (unlikely(src_cnt > sba->max_xor_srcs))
>  		return NULL;
>  
> -	/* Create chained requests where each request is upto hw_buf_size */
> +	/* Create chained requests where each request is up to hw_buf_size */
>  	while (len) {
>  		req_len = (len < sba->hw_buf_size) ? len : sba->hw_buf_size;
>  
> @@ -1356,7 +1356,7 @@ sba_prep_dma_pq(struct dma_chan *dchan, dma_addr_t *dst, dma_addr_t *src,
>  	if (!(flags & DMA_PREP_PQ_DISABLE_Q))
>  		dst_q = &dst[1];
>  
> -	/* Create chained requests where each request is upto hw_buf_size */
> +	/* Create chained requests where each request is up to hw_buf_size */
>  	while (len) {
>  		req_len = (len < sba->hw_buf_size) ? len : sba->hw_buf_size;
>  
> @@ -1626,7 +1626,7 @@ static int sba_probe(struct platform_device *pdev)
>  	sba->dev = &pdev->dev;
>  	platform_set_drvdata(pdev, sba);
>  
> -	/* Number of mailbox channels should be atleast 1 */
> +	/* Number of mailbox channels should be at least 1 */
>  	ret = of_count_phandle_with_args(pdev->dev.of_node,
>  					 "mboxes", "#mbox-cells");
>  	if (ret <= 0)
> diff --git a/drivers/dma/ppc4xx/xor.h b/drivers/dma/ppc4xx/xor.h
> index da1230df2817..0931e18cd0d3 100644
> --- a/drivers/dma/ppc4xx/xor.h
> +++ b/drivers/dma/ppc4xx/xor.h
> @@ -12,7 +12,7 @@
>  
>  #include <linux/types.h>
>  
> -/* Number of XOR engines available on the contoller */
> +/* Number of XOR engines available on the controller */
>  #define XOR_ENGINES_NUM		1
>  
>  /* Number of operands supported in the h/w */
> diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
> index d9a3542c4531..bcc188e70441 100644
> --- a/drivers/dma/xilinx/xilinx_dpdma.c
> +++ b/drivers/dma/xilinx/xilinx_dpdma.c
> @@ -1032,7 +1032,7 @@ static int xilinx_dpdma_chan_wait_no_ostand(struct xilinx_dpdma_chan *chan)
>  {
>  	int ret;
>  
> -	/* Wait for a no outstanding transaction interrupt upto 50msec */
> +	/* Wait for a no outstanding transaction interrupt up to 50msec */
>  	ret = wait_event_interruptible_timeout(chan->wait_to_stop,
>  					       !xilinx_dpdma_chan_ostand(chan),
>  					       msecs_to_jiffies(50));
> -- 
> 2.48.1

-- 
~Vinod

