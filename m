Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D85CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 14:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PuUs8kKkIEhwOvaXczjv+qMRMgXGRrj8wjtlYn3kysc=; b=xKu0yyWn4D8TCiYo8jWETU7Dnn
	y20iSjNrZAkONhV7Y0axwuhT1jBLi7wLoOTSZeQIPjYFumfUVhzdIkasjypUiyGyM/EVCD4g5jl7E
	e8xvwdPxzrt0bz1HJ/hy8ht8EqEnDO3zm2rILiI2wkwRF/AmwiStWxMn8qx+AcNv8LTTIrbEyDlrw
	H/+YRhYjx/4jD3mZD8Od4RtE5GtwZNt+oPa55zYyJsmhO+JPwAXSXVeV4MF9sF9e+At2JxH+Q48ha
	Jytq3Fv20H7ir8r4150wD3DGW03yE9BCvEBVsRdJUYdu9uYoG93Yo6+YtI0+itdSMxMAIm00kuTPN
	LkvzInOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMniO-0000000GwhS-4Aq8;
	Tue, 12 May 2026 14:04:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMniO-0000000Gwgj-0P6p;
	Tue, 12 May 2026 14:04:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 387AE62C1E;
	Tue, 12 May 2026 14:04:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B730C2BCB0;
	Tue, 12 May 2026 14:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778594642;
	bh=wZIDx7vXSGoTrkQ9Gai4XwKtCh48yAuiTnAYTQ2Zz9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bpdNMZTibadEBjbeQDSM9SwNXYlJWq/aP1DZ7nbJtV85oGI0nyDSxZXUeFJnOniHe
	 9Xf+bnpk+WrN8NtAZ0sqh3ejX948zKaly44LK/qNu595lycRemW82MSF/zk5jX88LD
	 o+DMvIKSsZk/T4oCsqkLzL40/sNQYWTzB7ekDR4uJVWUuNEwvtIfhpzJjAuDqLV43b
	 IlSgWBt+n7hBM0KVKiEK182XCyeTlWcEHqZIVS7DGf4a9Mzsexiu48/6Cq/X53V7BY
	 xQgKTtGSlYkDFEfAl09ifBuVUygFr6kS1rrEWATVAs/Va9XrWRdBYRHYoqeOUTknN8
	 AgCun9dDR48yg==
Date: Tue, 12 May 2026 19:33:51 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Chaitanya Kulkarni <kch@nvidia.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Koichiro Den <den@valinux.co.jp>, Niklas Cassel <cassel@kernel.org>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-nvme@lists.infradead.org, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH v4 4/9] dmaengine: dw-edma: Use new
 .device_prep_config_sg() callback
Message-ID: <bjroe5qbpggiolfqqexm5vy2edmhxp5qyrejxdklwlg5y53gfc@n3bz7i2jqja6>
References: <20260506-dma_prep_config-v4-0-85b3d22babff@nxp.com>
 <20260506-dma_prep_config-v4-4-85b3d22babff@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260506-dma_prep_config-v4-4-85b3d22babff@nxp.com>
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

On Wed, May 06, 2026 at 04:44:16PM -0400, Frank Li wrote:
> Use the new .device_prep_config_sg() callback to combine configuration and
> descriptor preparation.
> 
> No functional changes.
> 
> Tested-by: Niklas Cassel <cassel@kernel.org>
> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
> change in v4
> - drop context in callback.
> change in v3
> - add Damien Le Moal review tag
> ---
>  drivers/dma/dw-edma/dw-edma-core.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
> index c2feb3adc79fa94b016913443305b9fae9deef12..f7f58b0010e26b529ffb7382d5b166a703587c71 100644
> --- a/drivers/dma/dw-edma/dw-edma-core.c
> +++ b/drivers/dma/dw-edma/dw-edma-core.c
> @@ -577,10 +577,11 @@ dw_edma_device_transfer(struct dw_edma_transfer *xfer)
>  }
>  
>  static struct dma_async_tx_descriptor *
> -dw_edma_device_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
> -			     unsigned int len,
> -			     enum dma_transfer_direction direction,
> -			     unsigned long flags, void *context)
> +dw_edma_device_prep_config_sg(struct dma_chan *dchan, struct scatterlist *sgl,
> +			      unsigned int len,
> +			      enum dma_transfer_direction direction,
> +			      unsigned long flags,
> +			      struct dma_slave_config *config)
>  {
>  	struct dw_edma_transfer xfer;
>  
> @@ -591,6 +592,9 @@ dw_edma_device_prep_slave_sg(struct dma_chan *dchan, struct scatterlist *sgl,
>  	xfer.flags = flags;
>  	xfer.type = EDMA_XFER_SCATTER_GATHER;
>  
> +	if (config)
> +		dw_edma_device_config(dchan, config);
> +
>  	return dw_edma_device_transfer(&xfer);
>  }
>  
> @@ -970,7 +974,7 @@ static int dw_edma_channel_setup(struct dw_edma *dw, u32 wr_alloc, u32 rd_alloc)
>  	dma->device_terminate_all = dw_edma_device_terminate_all;
>  	dma->device_issue_pending = dw_edma_device_issue_pending;
>  	dma->device_tx_status = dw_edma_device_tx_status;
> -	dma->device_prep_slave_sg = dw_edma_device_prep_slave_sg;
> +	dma->device_prep_config_sg = dw_edma_device_prep_config_sg;
>  	dma->device_prep_dma_cyclic = dw_edma_device_prep_dma_cyclic;
>  	dma->device_prep_interleaved_dma = dw_edma_device_prep_interleaved_dma;
>  
> 
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

