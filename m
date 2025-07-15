Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78019C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 14:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7wP+88+sxWthsLsSVtT94d3sxFF9HA34YDySC4+3YjM=; b=TxAjOlhBIjFkDrU330o0c7gW3h
	6/ef9jfTjuUjVQ8PWONo/FS+3zmq4BUJ/XID7c2AbrRtB8fmJiqrDFF7vIZnEZ9Al6tSr89Nrp7Ik
	TwTpOUX3Ju1IKPIodAc2sXbyjDQRqoyd+2siIFuOonWtqAm/a9nz3zIGHjA/jUrh7erhptaJmWzmB
	37ZZjE8iGRofuRof0Veckm7l4rdaqM257nox5kGBXUeWD12vf+zNbfmWKHekqnGO9r2jP261naa5k
	itLNKzPOnK4eH3xT217jNRaxGmq6O6GxMl8Z5Mmu65o2mt6r3ozn/gtEQ09edmc20sMXBHnR3AdLj
	3TlUUVcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubh0Y-00000005S3I-1cAY;
	Tue, 15 Jul 2025 14:51:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubfft-00000005CYe-3UzF;
	Tue, 15 Jul 2025 13:26:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752585984;
	bh=oBnBaCSoump3r4cmxRJ8JBgYq96nOv/9jO9G/aWKWd4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vs8wfvEcwsAZjh6BZBE0xPpCIvhDjpVsglg1U/95trO5CNT4MgQHkZyI27XzcIlFT
	 AdgKbzFh4n6QM/4dGLvfM5G37VqH+MkLncGLfJ3dELlTsbZnpwti0rChV4xUM6Q7nR
	 WJsKkYK/8RLXDWQCY93t3ZRUbLL3FoOJDzJLL24v+TJPXFYGMAMZOe1KccWBuhcYyt
	 lQM2E/uTDBLXvjAQQn3x/ZxjXKqgLLkEKv1mDP6zj8Wh3rXDCLFga66H47UhxraKJ0
	 qu4YBxw+VhbGoxyFCeNL1VJ456GdBRRvzru+n2GkpEPdkchFoUcQl2FgqWqG7u3bt9
	 ovP9jugFCxq7A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7000B17E097F;
	Tue, 15 Jul 2025 15:26:23 +0200 (CEST)
Message-ID: <ddcd26ad-1bf1-4d14-b341-3c0e1e56cbf3@collabora.com>
Date: Tue, 15 Jul 2025 15:26:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: mediatek: encoder: memset encoder structure data
To: Irui Wang <irui.wang@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, nicolas.dufresne@collabora.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>
References: <20250715081547.18076-1-irui.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250715081547.18076-1-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_062626_023515_1F375BBB 
X-CRM114-Status: GOOD (  15.68  )
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

Il 15/07/25 10:15, Irui Wang ha scritto:
> Utilized memset to set all bytes of encoder structure to zero,
> this prevents any undefined behavior due to uninitialized use.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>

This commit needs a Fixes tag, as you're fixing something important here.

Also, please clarify what is this undefined behavior that you've seen and
what problem are you trying to resolve by zeroing all those mem locations.

There's also more feedback, check below...

> ---
>   .../media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c  | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> index a01dc25a7699..ecac1aec7215 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.c
> @@ -886,6 +886,7 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
>   			return 0;
>   	}
>   
> +	memset(&param, 0, sizeof(param));

Have you considered doing, instead...

	struct venc_enc_param param = { 0 }; ?

>   	mtk_venc_set_param(ctx, &param);
>   	ret = venc_if_set_param(ctx, VENC_SET_PARAM_ENC, &param);
>   	if (ret) {
> @@ -1021,12 +1022,14 @@ static int mtk_venc_encode_header(void *priv)
>   	struct mtk_vcodec_mem bs_buf;
>   	struct venc_done_result enc_result;

  	struct venc_done_result enc_result = { 0 };

>   
> +	memset(&enc_result, 0, sizeof(enc_result));
>   	dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
>   	if (!dst_buf) {
>   		mtk_v4l2_venc_dbg(1, ctx, "No dst buffer");
>   		return -EINVAL;
>   	}
>   
> +	memset(&bs_buf, 0, sizeof(bs_buf));
>   	bs_buf.va = vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
>   	bs_buf.dma_addr = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
>   	bs_buf.size = (size_t)dst_buf->vb2_buf.planes[0].length;
> @@ -1143,6 +1146,7 @@ static void mtk_venc_worker(struct work_struct *work)
>   	struct venc_done_result enc_result;
>   	int ret, i;
>   
> +	memset(&enc_result, 0, sizeof(enc_result));

You should probably move this to before the first usage, instead.

>   	/* check dst_buf, dst_buf may be removed in device_run
>   	 * to stored encdoe header so we need check dst_buf and
>   	 * call job_finish here to prevent recursion
> @@ -1175,6 +1179,7 @@ static void mtk_venc_worker(struct work_struct *work)
>   		frm_buf.fb_addr[i].size =
>   				(size_t)src_buf->vb2_buf.planes[i].length;
>   	}
> +	memset(&bs_buf, 0, sizeof(bs_buf));

here it's fine to use memset, as there are multiple ways out before actually using
bs_buf.

Cheers,
Angelo

>   	bs_buf.va = vb2_plane_vaddr(&dst_buf->vb2_buf, 0);
>   	bs_buf.dma_addr = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
>   	bs_buf.size = (size_t)dst_buf->vb2_buf.planes[0].length;



