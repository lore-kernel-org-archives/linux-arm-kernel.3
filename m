Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6335CC021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 12:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y2PEL2N/56PiMPKZXLHG3wXuQptuCvb3ePYNxIF4n10=; b=UFYtisA7G4KBDI9RX2C37ow/l8
	ITF7zVBRdpu0lJKgzBtVIHFECdzIdgkPvsLGggyZwV1uCCWCcWAyzeHV8WZ7LRwCOCOYZ3rGgwqGS
	txPnaWynaGc1HXDq2dT7q3lc6hVDy+mh2lwGcmuEnEprQ2WY+4DhQFf9M4DMcfpkZtEdy/vP+SyoW
	pQ4IGuXvMbxVolxjXv1gW7ixkmGSxMzmnxv6Ck1yPoFzOJXMFkEBQwTpevUfw+FLhrU9oVqBi5EQV
	EEvKKS1UvxpD00cMpGQrIRAJB6a54Nt9HW99sfRNKBsqOV7RYe8t9Uvqj3+mzMkV7IUHb2HtSHqkh
	PuiEoD0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjUn-0000000Ckmw-3Op0;
	Wed, 19 Feb 2025 12:48:09 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjKt-0000000CiBd-1Ba0;
	Wed, 19 Feb 2025 12:37:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739968673;
	bh=yWQBctTmTYw2F6D0YrO+rF/Gn/2V69KKlL8m0tLUKc4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mV2BD9Hxs36pOHX9FkZKfw+gQIuDnAd4bvjf8XtdSJvkyBEam5NsrQaAQl8M6WZgC
	 JYbwtlfxCcVCkQu1WD/vt4IOre8mbxHr3t6jwauve4CZr8UM6SEXmzeu9YgAOdHmHO
	 BUAUTvFJgAaN0yO05kunUr334Z+pKxln4ayffgJcZFjdwZNFwWLevzZNOa96gI776B
	 1iDhSr8QZGx6k+IrJNi1kQmWmcrp/OHnbUxAhpj889/coeYv0tsuI6EnNH0JeoqAcZ
	 7Fw2wINiqcbO5APmPZao8MXM8aRy6T31tllsqCZ4rCcXdZmMgmhnVE0xla5gKwBIku
	 1325lknngshbA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7BB7C17E154A;
	Wed, 19 Feb 2025 13:37:52 +0100 (CET)
Message-ID: <c72a8643-4211-40e1-a64d-6bf3c69bcae1@collabora.com>
Date: Wed, 19 Feb 2025 13:37:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] drm/mediatek: Add TDSHP component support for MT8196
To: Jay Liu <jay.liu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250219092040.11227-1-jay.liu@mediatek.com>
 <20250219092040.11227-4-jay.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250219092040.11227-4-jay.liu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_043755_476961_82C171B3 
X-CRM114-Status: GOOD (  16.39  )
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

Il 19/02/25 10:20, Jay Liu ha scritto:
> Add TDSHP component support for MT8196.
> TDSHP is a hardware module designed to enhance the sharpness and
> clarity of displayed images by analyzing and improving edges and
> fine details in frames.
> 
> Signed-off-by: Jay Liu <jay.liu@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 58 +++++++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_ddp_comp.h |  1 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c  |  2 +
>   3 files changed, 61 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
> index d7e230bac53e..b87fde64ee49 100644
> --- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
> @@ -57,6 +57,16 @@
>   #define POSTMASK_RELAY_MODE				BIT(0)
>   #define DISP_REG_POSTMASK_SIZE			0x0030
>   
> +#define DISP_REG_TDSHP_EN			0x0000
> +#define DISP_TDSHP_TDS_EN			BIT(31)
> +#define DISP_REG_TDSHP_CTRL			0x0100
> +#define DISP_TDSHP_CTRL_EN			BIT(0)
> +#define DISP_TDSHP_PWR_SCL_EN			BIT(2)
> +#define DISP_REG_TDSHP_CFG			0x0110

#define TDSHP_RELAY_MODE	BIT(0)

> +#define DISP_REG_TDSHP_INPUT_SIZE		0x0120
> +#define DISP_REG_TDSHP_OUTPUT_OFFSET		0x0124
> +#define DISP_REG_TDSHP_OUTPUT_SIZE		0x0128
> +
>   #define DISP_REG_UFO_START			0x0000
>   #define UFO_BYPASS				BIT(2)
>   
> @@ -261,6 +271,44 @@ static void mtk_postmask_stop(struct device *dev)
>   	writel_relaxed(0x0, priv->regs + DISP_REG_POSTMASK_EN);
>   }
>   
> +static void mtk_disp_tdshp_config(struct device *dev, unsigned int w,
> +				  unsigned int h, unsigned int vrefresh,
> +				  unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> +{
> +	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> +	u32 tdshp_ctrl = (bpc == 8) ? DISP_TDSHP_PWR_SCL_EN | DISP_TDSHP_CTRL_EN : 0;
> +
> +	mtk_ddp_write(cmdq_pkt, tdshp_ctrl, &priv->cmdq_reg, priv->regs,
> +		      DISP_REG_TDSHP_CTRL);
> +
> +	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs,
> +		      DISP_REG_TDSHP_INPUT_SIZE);
> +	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs,
> +		      DISP_REG_TDSHP_OUTPUT_SIZE);
> +	mtk_ddp_write(cmdq_pkt, 0x0, &priv->cmdq_reg, priv->regs,
> +		      DISP_REG_TDSHP_OUTPUT_OFFSET);
> +
> +	mtk_ddp_write(cmdq_pkt, 0x1, &priv->cmdq_reg,

mtk_ddp_write(cmdq_pkt, TDSHP_RELAY_MODE, ... etc etc

> +		      priv->regs, DISP_REG_TDSHP_CFG);
> +
> +	mtk_ddp_write_mask(cmdq_pkt, DISP_TDSHP_TDS_EN, &priv->cmdq_reg, priv->regs,
> +			   DISP_REG_TDSHP_EN, DISP_TDSHP_TDS_EN);
> +}
> +
> +static void mtk_disp_tdshp_start(struct device *dev)
> +{
> +	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> +
> +	writel(DISP_TDSHP_CTRL_EN, priv->regs + DISP_REG_TDSHP_CTRL);
> +}
> +
> +static void mtk_disp_tdshp_stop(struct device *dev)
> +{
> +	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> +
> +	writel(0x0, priv->regs + DISP_REG_TDSHP_CTRL);

writel(0, priv->regs + DISP_REG_TDSHP_CTRL);

> +}
> +

After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



