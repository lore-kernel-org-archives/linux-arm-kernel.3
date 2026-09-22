Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8FCC982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 11:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nww21hmAxVPLN3dorLJ/i/EYFnRQ+x5crKYNTSJIgvk=; b=OmKIBkdF2+XSyHAoLrsVYOk3x0
	LTEek6PcYXy6K2QvMu8Bvi8Bsll2ipkI8i6GWxtcgTUe/3stJA/naogbzwFQHLukqDtvPx5h3S9bJ
	r2x3Wgwdz22dQWX805cRhQlSACoTjnR+z8HNEbCND/xLYnO+IkZjr20k+7nD3AkxK5+rSLADR88be
	sjBGair5zFxyvafEU0vWq8AHbcv2KvM+dqRfL0S0hMoC9j4E2Y4NKsGfNnkKTx/F/3FXoqL9tdD9w
	4HiY0x6oJougqyonXvB+B/WiCBAsHW9u6d/7Lza4ARMi/80aAT3eTwuBx3n0yTJEIzUVhM/FgRFpV
	mV/c86nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yqt-00000005C5X-20LL;
	Tue, 22 Sep 2026 11:39:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yqq-00000005C4i-43vh;
	Tue, 22 Sep 2026 11:39:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077192;
	bh=I+P7ifGDVyf6f2n5jCSjq23+QEv/c5084lNzdK+YCqI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=ESr7paz04/j4sPbBqfg8VWS/fAlgQI5L2fdhADsLjlTdvJBu5FRyURwZh/6yCT29+
	 F2ohzfUBnRM+b8H9pdQaIk657lekrS1ycw79tCvg4QjDHxNEBGAWfnQKKmqxjksL8v
	 LaGX/xnyrar3JCDHkc31WUEzN1l0gHej0aDTL3WvMhQXftc3dhpVE0vbfHeq8K87Lr
	 jrLVcPiqdR3Oe1Q3A23Ii4FvwBSwDVtqMNX7DeC+TFOzbvLCEATIIIvSDGg+lQxTHc
	 rPm6QkyU7s+0mMXH5HpIpOAlqFkIaNhIBsa+588Q/B/L+jbKc/dsyo2I2vBNB/rjb5
	 siXgA9X9yFiKw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3983B17E03B6;
	Tue, 22 Sep 2026 13:39:52 +0200 (CEST)
Message-ID: <32d02591-406b-4460-9a87-ec1f883f3b2c@collabora.com>
Date: Tue, 22 Sep 2026 13:39:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 12/12] media: mediatek: jpeg: add jpeg smmu sid
 setting
To: Kyrie Wu <kyrie.wu@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bin Liu <bin.liu@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
 Hans Verkuil <hverkuil@kernel.org>, irui wang <irui.wang@mediatek.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260922091530.241762-1-kyrie.wu@mediatek.com>
 <20260922091530.241762-13-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260922091530.241762-13-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_043957_172101_4D724835 
X-CRM114-Status: GOOD (  18.79  )
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

On 9/22/26 11:15, Kyrie Wu wrote:
> Add a configuration to set jpeg dec & enc smmu sid
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>   .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 29 +++++++++++++++++++
>   .../platform/mediatek/jpeg/mtk_jpeg_core.h    | 15 ++++++++++
>   .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 23 +++++++++++++++
>   .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 23 +++++++++++++++
>   4 files changed, 90 insertions(+)
> 

..snip..

> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index 07452249b..3058fdf4f 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -613,6 +613,25 @@ static int mtk_jpegdec_hw_init_irq(struct mtk_jpegdec_comp_dev *dev)
>   	return 0;
>   }
>   
> +static int mtk_jpegdec_smmu_init(struct mtk_jpegdec_comp_dev *dev)
> +{
> +	struct mtk_jpeg_dev *master_dev = dev->master_dev;
> +
> +	if (!master_dev->variant->support_smmu)
> +		return 0;
> +
> +	dev->smmu_regmap =
> +		syscon_regmap_lookup_by_phandle(dev->plat_dev->dev.of_node,
> +						"mediatek,smmu-config");

Where is this property being introduced? I don't see any binding change for this.

Besides, is smmu-config in the multimedia smmu iospace?
That'd be wrong and wouldn't really work.

Cheers,
Angelo

> +	if (IS_ERR(dev->smmu_regmap)) {
> +		return dev_err_probe(dev->dev, PTR_ERR(dev->smmu_regmap),
> +				     "mmap smmu_base failed(%pe)\n",
> +				     dev->smmu_regmap);
> +	}
> +
> +	return 0;
> +}
> +
>   static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
>   {
>   	struct mtk_jpegdec_clk *jpegdec_clk;
> @@ -665,6 +684,10 @@ static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
>   	master_dev->reg_decbase[i] = dev->reg_base;
>   	dev->master_dev = master_dev;
>   
> +	ret = mtk_jpegdec_smmu_init(dev);
> +	if (ret)
> +		return ret;
> +
>   	platform_set_drvdata(pdev, dev);
>   	pm_runtime_enable(&pdev->dev);
>   
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index c7954af0e..506a49d1a 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -338,6 +338,25 @@ static int mtk_jpegenc_hw_init_irq(struct mtk_jpegenc_comp_dev *dev)
>   	return 0;
>   }
>   
> +static int mtk_jpegenc_smmu_init(struct mtk_jpegenc_comp_dev *dev)
> +{
> +	struct mtk_jpeg_dev *master_dev = dev->master_dev;
> +
> +	if (!master_dev->variant->support_smmu)
> +		return 0;
> +
> +	dev->smmu_regmap =
> +		syscon_regmap_lookup_by_phandle(dev->plat_dev->dev.of_node,
> +						"mediatek,smmu-config");
> +	if (IS_ERR(dev->smmu_regmap)) {
> +		return dev_err_probe(dev->dev, PTR_ERR(dev->smmu_regmap),
> +				     "mmap smmu_base failed(%pe)\n",
> +				     dev->smmu_regmap);
> +	}
> +
> +	return 0;
> +}
> +
>   static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
>   {
>   	struct mtk_jpegenc_clk *jpegenc_clk;
> @@ -388,6 +407,10 @@ static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
>   	master_dev->reg_encbase[i] = dev->reg_base;
>   	dev->master_dev = master_dev;
>   
> +	ret = mtk_jpegenc_smmu_init(dev);
> +	if (ret)
> +		return ret;
> +
>   	platform_set_drvdata(pdev, dev);
>   	pm_runtime_enable(&pdev->dev);
>   

