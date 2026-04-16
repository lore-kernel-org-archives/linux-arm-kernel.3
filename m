Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18143F433CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 00:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nKA5dmo91yCLapXpWOigMm3bpFe+GNmIfRh+PO4vxzk=; b=H38L4JrQV+3O3pKJijzm4wFzm9
	+pu1pwJSdGDVudoJSn3oJxIHyTmemJpSC5P3jFLW+MWY1FBrKVJrwT0sxNQF9YrJU9fIsKEQq5GiR
	twrtdpJnXevrrNNZa85Gdm3lMKknK5IMqZrZjVvpZyIxs7tgRw089k/anIpzpYhuOtQYamMpJTx+i
	QQClUMtnCCAYyf31r6fK2ZGZiFkNFqZFDzexuAw46V5bO40fAy5UuAgnsxlZH2BeJPpNW+QCHboiz
	3EV3JouIpbMNFthrd6ymFNjLJTK4OsiK2M28MU474H3qeQVpq2bf8O759L084NqRcXPwpfvnpy8Qi
	+ah7PCOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDAa7-00000001oZf-1raK;
	Thu, 16 Apr 2026 00:27:43 +0000
Received: from mail-m128168.netease.com ([103.209.128.168])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDAa4-00000001oZH-1NpH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 00:27:42 +0000
Received: from [172.16.12.17] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3ae6eaf4f;
	Thu, 16 Apr 2026 08:27:29 +0800 (GMT+08:00)
Message-ID: <5243585c-2fcf-dc68-54e9-cd8afc74fb5d@rock-chips.com>
Date: Thu, 16 Apr 2026 08:27:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Cc: shawn.lin@rock-chips.com, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] mmc: dw_mmc: implement option for configuring DMA
 threshold
To: Kaustabh Chakraborty <kauschluss@disroot.org>,
 Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
References: <20260415-dwmmc-dma-thr-v3-0-31014d36b6ee@disroot.org>
 <20260415-dwmmc-dma-thr-v3-1-31014d36b6ee@disroot.org>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260415-dwmmc-dma-thr-v3-1-31014d36b6ee@disroot.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d93af8e1e09cckunmbbec6de61a99b1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk1DGlZKGRgeShgaTBgfQ0NWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=QLVWHamEtWPXbOyxhHmQ1CXl+jZhKt7agdGVtiD3HhXO7faGFVEG8aNlFWSU+wKYkw3bwvLTyBCJKwBwOTisumx3PDWl3M+xF2p7rG1YWHSE8MDYPWI7uzHrlVvXHVfX1pzRJ19JFUlqEU/f1XLcmv+2iaI4nBHV5pXdZi0X8XE=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=nKA5dmo91yCLapXpWOigMm3bpFe+GNmIfRh+PO4vxzk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_172740_954745_A252706C 
X-CRM114-Status: GOOD (  21.94  )
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


在 2026/04/15 星期三 23:02, Kaustabh Chakraborty 写道:
> Some controllers, such as certain Exynos SDIO ones, are unable to
> perform DMA transfers of small amount of bytes properly. Following the
> device tree schema, implement the property to define the DMA transfer
> threshold (from a hard coded value of 16 bytes) so that lesser number of
> bytes can be transferred safely skipping DMA in such controllers. The
> value of 16 bytes stays as the default for controllers which do not
> define it. This value can be overridden by implementation-specific init
> sequences.

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>   drivers/mmc/host/dw_mmc.c | 4 ++--
>   drivers/mmc/host/dw_mmc.h | 2 ++
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
> index 20193ee7b73eb..3b4157f34d11f 100644
> --- a/drivers/mmc/host/dw_mmc.c
> +++ b/drivers/mmc/host/dw_mmc.c
> @@ -40,7 +40,6 @@
>   				 SDMMC_INT_RESP_ERR | SDMMC_INT_HLE)
>   #define DW_MCI_ERROR_FLAGS	(DW_MCI_DATA_ERROR_FLAGS | \
>   				 DW_MCI_CMD_ERROR_FLAGS)
> -#define DW_MCI_DMA_THRESHOLD	16
>   
>   #define DW_MCI_FREQ_MAX	200000000	/* unit: HZ */
>   #define DW_MCI_FREQ_MIN	100000		/* unit: HZ */
> @@ -821,7 +820,7 @@ static int dw_mci_pre_dma_transfer(struct dw_mci *host,
>   	 * non-word-aligned buffers or lengths. Also, we don't bother
>   	 * with all the DMA setup overhead for short transfers.
>   	 */
> -	if (data->blocks * data->blksz < DW_MCI_DMA_THRESHOLD)
> +	if (data->blocks * data->blksz < host->dma_threshold)
>   		return -EINVAL;
>   
>   	if (data->blksz & 3)
> @@ -3185,6 +3184,7 @@ struct dw_mci *dw_mci_alloc_host(struct device *dev)
>   	host = mmc_priv(mmc);
>   	host->mmc = mmc;
>   	host->dev = dev;
> +	host->dma_threshold = 16;
>   
>   	return host;
>   }
> diff --git a/drivers/mmc/host/dw_mmc.h b/drivers/mmc/host/dw_mmc.h
> index 42e58be74ce09..f29d40158dc59 100644
> --- a/drivers/mmc/host/dw_mmc.h
> +++ b/drivers/mmc/host/dw_mmc.h
> @@ -107,6 +107,7 @@ struct dw_mci_dma_slave {
>    * @ciu_clk: Pointer to card interface unit clock instance.
>    * @fifo_depth: depth of FIFO.
>    * @data_addr_override: override fifo reg offset with this value.
> + * @dma_threshold: data threshold value in bytes to carry out a DMA transfer.
>    * @wm_aligned: force fifo watermark equal with data length in PIO mode.
>    *	Set as true if alignment is needed.
>    * @data_shift: log2 of FIFO item size.
> @@ -163,6 +164,7 @@ struct dw_mci {
>   	void __iomem		*regs;
>   	void __iomem		*fifo_reg;
>   	u32			data_addr_override;
> +	u32			dma_threshold;
>   	bool			wm_aligned;
>   
>   	struct scatterlist	*sg;
> 

