Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D30E7719D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 09:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EcG8Y7CfYsrczwSwwPBiWtDPUbThWbq7V8VI+s/0NZU=; b=OHLiZ/JJfVZkhngoR8IhHohpW2
	Lqp5q9V9asy0J8sjqzx73s3YRbbBzETltsbxO0jT7paLHr/Z4vOGMR8u4G2jHTT8CX6V2qEEfqUTq
	WRmAjFX8qV2XRYud/aJAgpq8x4VriD8VpPYV+SKiWw6hCyGxXp8wuVjQ8qWdVI2R7091/sDH28QDB
	qzHZLRmvYAGq4SMkdKWyzB0hJwOCW3zcRR16ayxi9YsNUhc0HRW7TdO/hl+tvXw2gyDKlxTb1Kb5m
	aZ93zV1c0a1+26b8GRVXdPf66P6dEYJq6Gqr2vXcMu+t9U+T1K2OAVfrca13srWfZPoTXVQbluw01
	IvGKdA1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBVk-0000000Em0b-1Bbb;
	Fri, 10 Jan 2025 09:41:00 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBUU-0000000ElhV-42CJ;
	Fri, 10 Jan 2025 09:39:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736501980;
	bh=mAGSSYgPDghIBQGBzXCxEaknVfzgfmOXuOBboqhcRAw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iNXFVmOI18fsXMXKHE5f5cxJPB6Cker365AsEnhJuV9zXoRL+nQIwpkGiqcjQMF79
	 PVii5OVXLcXwPmOB0Tl6tp8D8rWQSiOPzITKI0vtiHQWph1MCx/E1gAk0u5GRq6TC1
	 VAJr2acJYyJdyjIRHojbyp7bKnoLkccMLx9dlFJpF1vCBVnDOc2Rt2jQAFEcVCdjw7
	 3/OEySXJqDQsjwvKsa80L4tx7fLbIA2zCy8ET0yAVMiIH+ysZ069IyUOxQHPwqrEvY
	 bqPdKRpZJWhgQEHJms2AqfJLgMqq2JB6Swt/YGkhFjQ7UNx2bAOhxkYiozlsIzoLM8
	 4PPaBYQaW12+A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2BD4317E0AE5;
	Fri, 10 Jan 2025 10:39:39 +0100 (CET)
Message-ID: <73144187-7f7f-4f68-aa5a-5fc019e646ec@collabora.com>
Date: Fri, 10 Jan 2025 10:39:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [V1,04/12] media: mediatek: jpeg: add jpeg smmu sid setting
To: "kyrie.wu" <kyrie.wu@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bin Liu <bin.liu@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250109133513.20151-1-kyrie.wu@mediatek.com>
 <20250109133513.20151-5-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250109133513.20151-5-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_013943_981836_DB0B3474 
X-CRM114-Status: GOOD (  23.61  )
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

Il 09/01/25 14:35, kyrie.wu ha scritto:
> Add a configuration to set jpeg dec & enc smmu sid
> 
> Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
> ---
>   .../platform/mediatek/jpeg/mtk_jpeg_core.c    |  6 ++++
>   .../platform/mediatek/jpeg/mtk_jpeg_core.h    | 11 +++++++
>   .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 30 +++++++++++++++++--
>   .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.h  |  4 +++
>   .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 26 ++++++++++++++++
>   .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.h  |  4 +++
>   6 files changed, 78 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index c3ccc525d9fd..77b3bd6c4d3f 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1655,6 +1655,9 @@ static void mtk_jpegenc_worker(struct work_struct *work)
>   	jpeg_dst_buf->frame_num = ctx->total_frame_num;
>   	ctx->total_frame_num++;
>   	mtk_jpeg_enc_reset(comp_jpeg[hw_id]->reg_base);
> +#if IS_ENABLED(CONFIG_ARM_SMMU_V3)
> +	mtk_jpeg_enc_set_smmu_sid(hw_id);
> +#endif
>   	mtk_jpeg_set_enc_dst(ctx,
>   			     comp_jpeg[hw_id]->reg_base,
>   			     &dst_buf->vb2_buf);
> @@ -1771,6 +1774,9 @@ static void mtk_jpegdec_worker(struct work_struct *work)
>   	spin_lock_irqsave(&comp_jpeg[hw_id]->hw_lock, flags);
>   	ctx->total_frame_num++;
>   	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
> +#if IS_ENABLED(CONFIG_ARM_SMMU_V3)

You can avoid using preprocessor conditionals - and then, this doesn't look like an
ARM SMMUv3 configuration, but rather a JPEG dec/enc HW config, so in that case the
enclosing of this in the proposed config option would even be wrong.

Use platform data for that.

> +	mtk_jpeg_dec_set_smmu_sid(hw_id);
> +#endif
>   	mtk_jpeg_dec_set_config(comp_jpeg[hw_id]->reg_base,
>   				jpeg->variant->support_34bit,
>   				&jpeg_src_buf->dec_param,
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> index 8fddc133c46c..d3aba1e6cae8 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> @@ -36,6 +36,17 @@
>   
>   #define MTK_JPEG_ADDR_MASK GENMASK(1, 0)
>   
> +#if IS_ENABLED(CONFIG_ARM_SMMU_V3)
> +#define JPG_REG_CORE0_GUSER_ID                          0x380d0000
> +#define JPG_REG_CORE1_GUSER_ID                          0x388d0000

At least these two definitions shall go in the devicetree reg node.

> +#define JPG_REG_GUSER_ID_MASK                           0x7
> +#define JPG_REG_GUSER_ID_DEC_SID                        0x4
> +#define JPG_REG_GUSER_ID_ENC_SID                        0x5
> +#define JPG_REG_DEC_GUSER_ID_SHIFT                      8
> +#define JPG_REG_ENC_GUSER_ID_SHIFT                      4

If this is setting an IOMMU SID, then you can just use the "iommus" property
to pass a handle to the IOMMU that this device is using plus the streamid,
which you can retrieve and write to the guser_id_{dec,enc}_sid register.

There's no reason to hardcode that in this header, and actually hardcoding
will give you a number of issues (example: unpowered/unclocked access to the
IOMMU, and many others).

> +#define GUSER_ID_MAPRANGE                               4
> +#endif
> +
>   /**
>    * enum mtk_jpeg_ctx_state - states of the context state machine
>    * @MTK_JPEG_INIT:		current state is initialized
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index d868e46aaf37..fadfc4b5e366 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -274,6 +274,32 @@ void mtk_jpeg_dec_reset(void __iomem *base)
>   }
>   EXPORT_SYMBOL_GPL(mtk_jpeg_dec_reset);
>   
> +#if IS_ENABLED(CONFIG_ARM_SMMU_V3)
> +void mtk_jpeg_dec_set_smmu_sid(int hwid)
> +{
> +	void __iomem *dec_reg_base;
> +	u32 val, mask;
> +
> +	if (hwid)
> +		dec_reg_base = ioremap(JPG_REG_CORE1_GUSER_ID, GUSER_ID_MAPRANGE);
> +	else
> +		dec_reg_base = ioremap(JPG_REG_CORE0_GUSER_ID, GUSER_ID_MAPRANGE);
> +	if (!dec_reg_base) {
> +		dev_err(jpeg->dev, "Failed to map jpgdec JPG_REG_GUSER_ID\n");
> +		return;
> +	}
> +
> +	val = ioread32(dec_reg_base);
> +	mask = ~(JPG_REG_GUSER_ID_MASK << JPG_REG_DEC_GUSER_ID_SHIFT);
> +	val &= mask;
> +	val |= (JPG_REG_GUSER_ID_DEC_SID << JPG_REG_DEC_GUSER_ID_SHIFT);
> +
> +	iowrite32(val, dec_reg_base);
> +	iounmap(dec_reg_base);
> +}
> +EXPORT_SYMBOL_GPL(mtk_jpeg_dec_set_smmu_sid);
> +#endif
> +
>   static void mtk_jpeg_dec_set_brz_factor(void __iomem *base, u8 yscale_w,
>   				u8 yscale_h, u8 uvscale_w, u8 uvscale_h)
>   {
> @@ -552,7 +578,6 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
>   	struct vb2_v4l2_buffer *src_buf, *dst_buf;
>   	struct mtk_jpeg_src_buf *jpeg_src_buf;
>   	enum vb2_buffer_state buf_state;
> -	struct mtk_jpeg_ctx *ctx;
>   	u32 dec_irq_ret;
>   	u32 irq_status;
>   	int i;
> @@ -562,7 +587,6 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
>   
>   	cancel_delayed_work(&jpeg->job_timeout_work);
>   
> -	ctx = jpeg->hw_param.curr_ctx;
>   	src_buf = jpeg->hw_param.src_buffer;
>   	dst_buf = jpeg->hw_param.dst_buffer;
>   	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> @@ -585,7 +609,7 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
>   	buf_state = VB2_BUF_STATE_DONE;
>   	v4l2_m2m_buf_done(src_buf, buf_state);
>   	mtk_jpegdec_put_buf(jpeg);
> -	pm_runtime_put(ctx->jpeg->dev);
> +	pm_runtime_put(jpeg->dev);

You're doing more than what you're describing in the commit title and description.

If this change was intentional, please move it to a diffrent commit.

Regards,
Angelo


