Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DFBCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 10:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bVbKNDk5yTJpTN7awDAaJhIqsj29Bd566UQGsQmVHXg=; b=BMsc/EqqLsb6Dc88H046nohvoQ
	+ut2K8ftaikBAjUDOgngrRGXxPHrSnFyeWjORPfU2qZmy1kKi2LOcfpZdsocoJQDSL7w81bCv/LuL
	xy/B50/Z0sYe9xhcqfFvAIV3s159+kpmjcdLbu59koJKEzzNa1N3nfXdwUL+6u6nXFZm8yKt2+4gf
	4Hm9UGkA/JODNE3Hq71vUAsxv1e/BhZkZeMzXyRmTpWUFEIV82yyveb5q2/8bvQ4Tng/bjuLoUi5/
	p1wdW3Fui9Cs8FVzIXamh3R4P6OdA8xBkjdElixvQ6SIGSos0/GvmFibaviB5cYqmfykHWeJ1WX9U
	/9NYqYdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnST-0000000Cw3C-0918;
	Mon, 20 Oct 2025 10:49:45 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnSP-0000000Cvxs-3M1z;
	Mon, 20 Oct 2025 10:49:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760957379;
	bh=/VcFb2G/ht3F+guTqL6YvdGc27u72T+KofLlYcljNpQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Av/j9O58crHA+r3Y1uu8hjcAwjsDNB9wawfJVPFWriYWirEt6j3kI/4s4DCps7iYH
	 uU+KCuo64e8ZaA5mNEBjt3ley8gGlOuEzNeVudBUXSPAMxGrUPGey6G8E5y2d+2PJ6
	 uUg/6ymcAR/EMHoZdxz8TWvRHnkIKjDp6Xzb+atSqJb9FF80/R/NCPgBN5b8kXrRsb
	 biYB4FJZiEkoieVLTILdouXArxtIvaBsQ6Uc6EhHVy+cSTeYowFFDjZetAAwQ7nmLK
	 t8b6Gx760BAgG4H64QmbKKJmSl3xBe6wzLisYbyPppGUmrGI1qge3ZzLoUztQDPdC8
	 dqLLJ66EXdrQQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B8EB417E108C;
	Mon, 20 Oct 2025 12:49:38 +0200 (CEST)
Message-ID: <3df15a75-cc5d-41ea-9a0e-6141b7d2ce39@collabora.com>
Date: Mon, 20 Oct 2025 12:49:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/13] drm/mediatek: Add support for mt8189 mmsys
 driver probe
To: Xiandong Wang <xiandong.wang@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, jh.hsu@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20251020074211.8942-1-xiandong.wang@mediatek.com>
 <20251020074211.8942-13-xiandong.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251020074211.8942-13-xiandong.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_034942_016076_E2C94F7A 
X-CRM114-Status: GOOD (  12.52  )
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

Il 20/10/25 09:40, Xiandong Wang ha scritto:
> mmsys probe for mt8189
> 
> Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_ddp_comp.c  |  2 ++
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c  | 40 ++++++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.h  |  2 ++
>   drivers/gpu/drm/mediatek/mtk_disp_rdma.c |  8 +++++
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c   | 39 +++++++++++++++++++++++
>   5 files changed, 91 insertions(+)
> 

..snip..

> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 4c19cffafd0f..9e6d949e5d17 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -187,11 +187,27 @@ static const unsigned int mt8188_mtk_ddp_main[] = {
>   	DDP_COMPONENT_DITHER0,
>   };
>   
> +static const unsigned int mt8189_mtk_ddp_main[] = {
> +	DDP_COMPONENT_OVL0,
> +	DDP_COMPONENT_RDMA0,
> +	DDP_COMPONENT_COMP0_OUT_CB4,
> +};
> +
> +static const unsigned int mt8189_mtk_ddp_ext[] = {
> +	DDP_COMPONENT_OVL1,
> +	DDP_COMPONENT_RDMA1,
> +	DDP_COMPONENT_COMP0_OUT_CB5,
> +};

NACK. Please use OF Graph only. Stop hardcoding paths in mediatek-drm.

Regards,
Angelo


