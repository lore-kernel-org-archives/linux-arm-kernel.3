Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CBECCD18A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 11:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cNFWukMbVNFMh30EFzOmXy7bR4xlE6p3FtLWIXEA8II=; b=Qtx41chxWD6XnrEABRZnCZtUtL
	CAdflWvobBf31quF8gUOU4eAd2L0stY2socrJ/HoWN/OjENDJcPpa0qEOkwH/+3XGcdmE3jnX4Cj9
	qBRJ0hguny7oaJB/BstWVtMtMDmRxK7JutA7nviaRsWONAtBqYbHBge/WitCe7E76aMUX7k+ynSt7
	SyCrx/vV5N9mEIKYUgYNGLBYpvov5Ve2Nrl/icTKPFye1/caR8fahJPPOI6HMeYVS2UPEcuBWZgJS
	9SVqL0bSDxVdLYM9r92lLiXR0LkmRDeX4hP1StRLkURaUE+UGMGaQSV2Ty7bIZolaU+XNERsWUYFU
	q3DCl6YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ons-00000005yDy-1q93;
	Thu, 09 Oct 2025 11:27:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6onp-00000005y9m-3J56;
	Thu, 09 Oct 2025 11:27:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cNFWukMbVNFMh30EFzOmXy7bR4xlE6p3FtLWIXEA8II=; b=RFrBTomp3h3dy3NO5GcchoXLri
	aXIyn9fdcc2rJmb/la8hXseUPnS8cNk+OjcFS634J8dGI55jE6vROSOQfewhTu+fbpEGplBff5STO
	KzGOGPIPBO8t9tFfVW3309hh86QrtK0bCB+Q6uONJSD8H5JFGTBCGzO3iqmBgrwu2l+izxUrfQbER
	1g1McszZtt2hA1RC5bR0enl3mGUTxCKzoSFgGSK3gBI2rZjaQVceg2ljs4eDxJyAUBW+zpHi+g8CL
	WjxqzMQaIIADtpIVgXvvHaBL8L+GODQA23bZFmD0mr42tBCM/GtGJOI/ywOzYLHgIiGbvyiefUdRM
	4peBudCQ==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6onm-00000001PbH-1XB1;
	Thu, 09 Oct 2025 11:27:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760009235;
	bh=LqNf9G4TezAI4eWSqZ+IBL1wUm/GBm38nClar9fLGMI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UOulTCCa5xTOoJe4nnEF2b4RBs7Nf/b4svaVgS2s59ae/s7XULTyVOK3ZMmVpvgWp
	 xUR+8qPeVCvVwY5F+r1dT052JN5qc5HSUb8MQ4gRcEVUdzo+1sUytnqro7r/BRPw4O
	 X3uS8fbv1hVtrCNu/+f6dgxxupnO1v6kv/9h39UERnzkxvRYkTNWlmBI32cP75Pk6Z
	 4AiLa/Xpba/mS41qaqaKJh/HiTCd3CimZZgJEFvmWRsVwnaqY+JUXFc2V824B28W6C
	 CAQKWpv4+8Zi2xUYeai/KTptkDqLWF8roFUdSlaHYfiRGo3zquwWW1obdomK+nV0Qp
	 ULung9zzWHvGg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A503317E0A30;
	Thu,  9 Oct 2025 13:27:14 +0200 (CEST)
Message-ID: <bac4b2f1-3049-41ce-9ba8-3ac8f9ba4996@collabora.com>
Date: Thu, 9 Oct 2025 13:27:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/20] mailbox: mtk-cmdq: Add mminfra_offset
 configuration for DRAM transaction
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Chen-yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
 <20250827114006.3310175-8-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250827114006.3310175-8-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_122718_772632_61950B51 
X-CRM114-Status: GOOD (  28.72  )
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

Il 27/08/25 13:37, Jason-JH Lin ha scritto:
> The GCE in MT8196 is placed in MMINFRA and requires all addresses
> in GCE instructions for DRAM transactions to be IOVA.
> 
> Due to MMIO, if the GCE needs to access a hardware register at
> 0x1000_0000, but the SMMU is also mapping a DRAM block at 0x1000_0000,
> the MMINFRA will not know whether to write to the hardware register or
> the DRAM.
> To solve this, MMINFRA treats addresses greater than 2G as data paths
> and those less than 2G as config paths because the DRAM start address
> is currently at 2G (0x8000_0000). On the data path, MMINFRA remaps
> DRAM addresses by subtracting 2G, allowing SMMU to map DRAM addresses
> less than 2G.
> For example, if the DRAM start address 0x8000_0000 is mapped to
> IOVA=0x0, when GCE accesses IOVA=0x0, it must add a 2G offset to
> the address in the GCE instruction. MMINFRA will then see it as a
> data path (IOVA >= 2G) and subtract 2G, allowing GCE to access IOVA=0x0.
> 
> Since the MMINFRA remap subtracting 2G is done in hardware and cannot
> be configured by software, the address of DRAM in GCE instruction must
> always add 2G to ensure proper access. After that, the shift functions
> do more than just shift addresses, so the APIs were renamed to
> cmdq_convert_gce_addr() and cmdq_revert_gce_addr().
> 
> This 2G adjustment is referred to as mminfra_offset in the CMDQ driver.
> CMDQ helper can get the mminfra_offset from the cmdq_mbox_priv of
> cmdq_pkt and add the mminfra_offset to the DRAM address in GCE
> instructions.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/mailbox/mtk-cmdq-mailbox.c       | 22 ++++++++++++----------
>   include/linux/mailbox/mtk-cmdq-mailbox.h |  1 +
>   2 files changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index a9e8895d14df..373effbcfa40 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -94,20 +94,21 @@ struct cmdq {
>   struct gce_plat {
>   	u32 thread_nr;
>   	u8 shift;
> +	dma_addr_t mminfra_offset;
>   	bool control_by_sw;
>   	bool sw_ddr_en;
>   	bool gce_vm;
>   	u32 gce_num;
>   };
>   
> -static inline u32 cmdq_reg_shift_addr(dma_addr_t addr, const struct gce_plat *pdata)
> +static inline u32 cmdq_convert_gce_addr(dma_addr_t addr, const struct gce_plat *pdata)

You are adding those functions in a previous commit - please, just give them a good
and right name from the beginning and don't change it anymore in any later commit.

The code, anyway, looks okay.

Cheers,
Angelo

>   {
> -	return (addr >> pdata->shift);
> +	return ((addr + pdata->mminfra_offset) >> pdata->shift);
>   }
>   
> -static inline dma_addr_t cmdq_reg_revert_addr(u32 addr, const struct gce_plat *pdata)
> +static inline dma_addr_t cmdq_revert_gce_addr(u32 addr, const struct gce_plat *pdata)
>   {
> -	return ((dma_addr_t)addr << pdata->shift);
> +	return (((dma_addr_t)addr << pdata->shift) - pdata->mminfra_offset);
>   }
>   
>   void cmdq_get_mbox_priv(struct mbox_chan *chan, struct cmdq_mbox_priv *priv)
> @@ -115,6 +116,7 @@ void cmdq_get_mbox_priv(struct mbox_chan *chan, struct cmdq_mbox_priv *priv)
>   	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
>   
>   	priv->shift_pa = cmdq->pdata->shift;
> +	priv->mminfra_offset = cmdq->pdata->mminfra_offset;
>   }
>   EXPORT_SYMBOL(cmdq_get_mbox_priv);
>   
> @@ -254,7 +256,7 @@ static void cmdq_task_insert_into_thread(struct cmdq_task *task)
>   	struct cmdq_task *prev_task = list_last_entry(
>   			&thread->task_busy_list, typeof(*task), list_entry);
>   	u64 *prev_task_base = prev_task->pkt->va_base;
> -	u32 shift_addr = cmdq_reg_shift_addr(task->pa_base, task->cmdq->pdata);
> +	u32 shift_addr = cmdq_convert_gce_addr(task->pa_base, task->cmdq->pdata);
>   
>   	/* let previous task jump to this task */
>   	dma_sync_single_for_cpu(dev, prev_task->pa_base,
> @@ -326,7 +328,7 @@ static void cmdq_thread_irq_handler(struct cmdq *cmdq,
>   		return;
>   
>   	shift_addr = readl(thread->base + CMDQ_THR_CURR_ADDR);
> -	curr_pa = cmdq_reg_revert_addr(shift_addr, cmdq->pdata);
> +	curr_pa = cmdq_revert_gce_addr(shift_addr, cmdq->pdata);
>   
>   	list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
>   				 list_entry) {
> @@ -477,9 +479,9 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
>   		 */
>   		WARN_ON(cmdq_thread_reset(cmdq, thread) < 0);
>   
> -		shift_addr = cmdq_reg_shift_addr(task->pa_base, cmdq->pdata);
> +		shift_addr = cmdq_convert_gce_addr(task->pa_base, cmdq->pdata);
>   		writel(shift_addr, thread->base + CMDQ_THR_CURR_ADDR);
> -		shift_addr = cmdq_reg_shift_addr(task->pa_base + pkt->cmd_buf_size, cmdq->pdata);
> +		shift_addr = cmdq_convert_gce_addr(task->pa_base + pkt->cmd_buf_size, cmdq->pdata);
>   		writel(shift_addr, thread->base + CMDQ_THR_END_ADDR);
>   
>   		writel(thread->priority, thread->base + CMDQ_THR_PRIORITY);
> @@ -488,9 +490,9 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
>   	} else {
>   		WARN_ON(cmdq_thread_suspend(cmdq, thread) < 0);
>   		shift_addr = readl(thread->base + CMDQ_THR_CURR_ADDR);
> -		curr_pa = cmdq_reg_revert_addr(shift_addr, cmdq->pdata);
> +		curr_pa = cmdq_revert_gce_addr(shift_addr, cmdq->pdata);
>   		shift_addr = readl(thread->base + CMDQ_THR_END_ADDR);
> -		end_pa = cmdq_reg_revert_addr(shift_addr, cmdq->pdata);
> +		end_pa = cmdq_revert_gce_addr(shift_addr, cmdq->pdata);
>   		/* check boundary */
>   		if (curr_pa == end_pa - CMDQ_INST_SIZE ||
>   		    curr_pa == end_pa) {
> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> index 73b70be4a8a7..07c1bfbdb8c4 100644
> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> @@ -72,6 +72,7 @@ struct cmdq_cb_data {
>   
>   struct cmdq_mbox_priv {
>   	u8 shift_pa;
> +	dma_addr_t mminfra_offset;
>   };
>   
>   struct cmdq_pkt {



