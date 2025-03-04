Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786A3C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 09:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NbnVY7+Zsu39EMT080TGvDgHKBs34s5s+lS6ya9Rggs=; b=zvsdDvdVZ1rxkQRfTxAsSl5LSb
	8HN2d1E2m3utda5t1lhJ1PROeDL+xREsnFBw9YpzlglnV7VvYD/7u1pyDq8Da2Fw69HYAUxD/qTQR
	yhlvYejlzhIhz5qvLbnAKu8LFyc6a7IyT+Y30YYTlgnQSryT3a5L4yus+GvkBLa5YRPEtNH8dWwmJ
	sgYsDORWJVKj9YZ9LVVilH470NTXLKEvHaYp4AtZ0QZ4w7Qk1JuLnOcYY5YtS/Fz4epYBVWinqtv1
	KypTTzOiLIYbNEGvjLDWGhxkZ6dewz+tX07NJ31S+HC2UAKva4SiQCPl5a2beA2kz8yo++FJUYUxe
	ESVknbKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOpv-00000003xlj-1h8c;
	Tue, 04 Mar 2025 09:45:15 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOmZ-00000003waI-10Q5;
	Tue, 04 Mar 2025 09:41:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741081305;
	bh=V4CnTDDJt6NGOGhGQPS8FC6bzc1LOyrks5JjjZ6wzOQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GKMDyYchTQRfBI32tSx1RcUARGgdtMy+exmv+qg0+7lEZCz8pU7SvRBil6cC8qK19
	 1d/019YaI/311Wosb2lYFvlb1AMHl8V91mpgHWWZX7I9ChFdOm3Q0NcpEru7wwjtZh
	 oZDxPWwQExqFox7dC0VQaFe0/yFNpwwYvuoGBEVjRZVUcuQ8vtg0FAKNhNj8IVCK8x
	 tIiAK1leEEM/Fs9gfiGUseX5HQti7AUDjjYggRL0EPiNahhOWxmXRnNbNOYzTn3nh4
	 i/KATrUmS4CbfT2dTHc5t9KzEBt4b6kO05iRCSjjGF61j5CwBSmIk5Bfs/XwWMwlDL
	 chmjovx/CDYeg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5612617E087F;
	Tue,  4 Mar 2025 10:41:44 +0100 (CET)
Message-ID: <c52b132b-fc08-4d1c-8276-1771f7457014@collabora.com>
Date: Tue, 4 Mar 2025 10:41:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] soc: mediatek: Add programming flow for
 unsupported subsys ID hardware
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Moudy Ho <moudy.ho@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
 <20250218054405.2017918-7-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250218054405.2017918-7-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_014147_426759_8E50CF62 
X-CRM114-Status: GOOD (  18.20  )
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

Il 18/02/25 06:41, Jason-JH Lin ha scritto:
> To support hardware without subsys IDs on new SoCs, add a programming
> flow that checks whether the subsys ID is valid. If the subsys ID is
> invalid, the flow will call 2 alternative CMDQ APIs:
> cmdq_pkt_assign() and cmdq_pkt_write_s_value() to achieve the same
> functionality.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-mmsys.c | 14 +++++++++++---
>   drivers/soc/mediatek/mtk-mutex.c | 11 +++++++++--
>   2 files changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index bb4639ca0b8c..ce949b863b05 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -167,9 +167,17 @@ static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask,
>   	u32 tmp;
>   
>   	if (mmsys->cmdq_base.size && cmdq_pkt) {
> -		ret = cmdq_pkt_write_mask(cmdq_pkt, mmsys->cmdq_base.subsys,
> -					  mmsys->cmdq_base.offset + offset, val,
> -					  mask);
> +		offset += mmsys->cmdq_base.offset;
> +		if (mmsys->cmdq_base.subsys != CMDQ_SUBSYS_INVALID) {

You're still anyway passing the subsys to cmdq_pkt_write_mask(), right?!
Why don't you just handle this in cmdq_pkt_write_mask() then? ;-)

I can see this pattern being repeated over and over in both drm/mediatek and MDP3
drivers, and it's not necessary to duplicate this many times when you can write it
just once.

Would've also been faster for you to implement... :-D

Cheers,
Angelo

> +			ret = cmdq_pkt_write_mask(cmdq_pkt, mmsys->cmdq_base.subsys,
> +						  offset, val, mask);
> +		} else {
> +			/* only MMIO access, no need to check mminfro_offset */
> +			ret = cmdq_pkt_assign(cmdq_pkt, CMDQ_THR_SPR_IDX0,
> +					      CMDQ_ADDR_HIGH(mmsys->cmdq_base.pa_base));
> +			ret |= cmdq_pkt_write_s_mask_value(cmdq_pkt, CMDQ_THR_SPR_IDX0,
> +							   CMDQ_ADDR_LOW(offset), val, mask);
> +		}
>   		if (ret)
>   			pr_debug("CMDQ unavailable: using CPU write\n");
>   		else
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index 5250c1d702eb..3788b16efbf4 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -963,6 +963,7 @@ int mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex, void *pkt)
>   	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
>   						 mutex[mutex->id]);
>   	struct cmdq_pkt *cmdq_pkt = (struct cmdq_pkt *)pkt;
> +	dma_addr_t en_addr = mtx->addr + DISP_REG_MUTEX_EN(mutex->id);
>   
>   	WARN_ON(&mtx->mutex[mutex->id] != mutex);
>   
> @@ -971,8 +972,14 @@ int mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex, void *pkt)
>   		return -ENODEV;
>   	}
>   
> -	cmdq_pkt_write(cmdq_pkt, mtx->cmdq_reg.subsys,
> -		       mtx->addr + DISP_REG_MUTEX_EN(mutex->id), 1);
> +	if (mtx->cmdq_reg.subsys != CMDQ_SUBSYS_INVALID) {
> +		cmdq_pkt_write(cmdq_pkt, mtx->cmdq_reg.subsys, en_addr, 1);
> +	} else {
> +		/* only MMIO access, no need to check mminfro_offset */
> +		cmdq_pkt_assign(cmdq_pkt, CMDQ_THR_SPR_IDX0, CMDQ_ADDR_HIGH(en_addr));
> +		cmdq_pkt_write_s_value(cmdq_pkt, CMDQ_THR_SPR_IDX0, CMDQ_ADDR_LOW(en_addr), 1);
> +	}
> +
>   	return 0;
>   }
>   EXPORT_SYMBOL_GPL(mtk_mutex_enable_by_cmdq);



