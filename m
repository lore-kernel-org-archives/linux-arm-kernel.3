Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C50AC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 09:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JnEgnr/6JZeDIDIYu6EwyyCyYSu+v0dPKsBJBL3UujU=; b=OcXStHVcDMcU4NS+SsMyEX7vu+
	yZQDgngWuc6dNMvMWQSmd7Yoqegi+vXCA85NfRUrfNuCDwufUaoMIcOvCQs0l6jNk86eI15GWa5az
	DpHtECjRTGRAvg+wjGJikVO9fuJ1kNgkAc8bjqCBl1A3MqifjKNgawaQpthY4gEj2RwK1PIDrsV+U
	myOzowmCIIUQgaWOFmIc2WLdleP+1XKI0lS12mPsOhUdRxN5TTMQN6cG4t5+quycGyO9XunbruK8x
	zVwxUd4mvZbQMDuW2W2DzJ8wFtIJv42y+tMH03C4ElhmpcGqI/BX/2psUpj+3h6D4GVyHacwNOHY4
	njkyT/Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOoN-00000003x4Y-1rgW;
	Tue, 04 Mar 2025 09:43:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOiJ-00000003vLb-001o;
	Tue, 04 Mar 2025 09:37:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741081041;
	bh=O+9rlfF/uzRCAS1prhuz8xBGKDW0RRz/qKexdWg2yVs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SYsFw1XTKGn8nlc9yGX98hysdmfTLwmrKPyhJ5f/AOf3GEnpmEgtgOcuym/Lbywf2
	 drGLXcgVkOWwW6a+o9VD1HK0PYaFKCSg5Uc9waeVycLHxL4djvQEMUGX5RT9qLE8j7
	 VezMteK7KIQ03Chmgc+PQR3YGIb1yYrEFwWrf3utdxXvu1f2wT7E4pvetrKgsI6F8s
	 pwgP4ERTLHmrKj6LersjzLz6NzjBjcPBBVBJprDynLV7kxbgbs70u76JMVE0RAS551
	 Z8TBl46NuCVESgDiKXzaaD4c4/NwOvdSL3HuqlNsyfoFIJ7OrI/DzV3Lb5Z07D+cT0
	 ADsdzhXOHYaHQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 61DDC17E0630;
	Tue,  4 Mar 2025 10:37:20 +0100 (CET)
Message-ID: <c1395546-9cfe-4da9-b87a-e5cc392910f6@collabora.com>
Date: Tue, 4 Mar 2025 10:37:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] soc: mediatek: mtk-cmdq: Add mminfra_offset
 compatibility for DRAM address
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
 <20250218054405.2017918-6-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250218054405.2017918-6-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_013723_186375_69162B71 
X-CRM114-Status: GOOD (  19.47  )
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
> Since GCE has been moved to mminfra in MT8196, all transactions from
> mminfra to DRAM will have their addresses adjusted by subtracting a
> mminfra offset.
> This information should be handled inside the CMDQ driver, allowing
> CMDQ users to call CMDQ APIs as usual.
> 
> Therefore, CMDQ driver needs to use the mbox API to get the
> mminfra_offset value of the SoC, and then add it to the DRAM address
> when generating instructions to ensure GCE accesses the correct DRAM
> address.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c | 35 ++++++++++++++++++++++++--
>   1 file changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index aa9853100d78..f2853a74af01 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -314,10 +314,22 @@ EXPORT_SYMBOL(cmdq_pkt_write_s_mask_value);
>   
>   int cmdq_pkt_mem_move(struct cmdq_pkt *pkt, dma_addr_t src_addr, dma_addr_t dst_addr)
>   {
> +	struct cmdq_client *cl = (struct cmdq_client *)pkt->cl;
>   	const u16 high_addr_reg_idx  = CMDQ_THR_SPR_IDX0;
>   	const u16 value_reg_idx = CMDQ_THR_SPR_IDX1;
>   	int ret;
>   
> +	if (!cl) {
> +		pr_err("%s %d: pkt->cl is NULL!\n", __func__, __LINE__);
> +		return -EINVAL;
> +	}
> +
> +	if (cmdq_addr_need_offset(cl->chan, src_addr))
> +		src_addr += cmdq_get_offset_pa(cl->chan);

If the offset is just DRAM IOSTART, you could manage that differently in the cmdq
helper as well as the cmdq mailbox... :-)

> +
> +	if (cmdq_addr_need_offset(cl->chan, dst_addr))
> +		dst_addr += cmdq_get_offset_pa(cl->chan);
> +
Cheers,
Angelo

