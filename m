Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0832DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 09:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fRh8jnRpldrDPR3YdoJMUWLtX/eVd3iDwXXvPwUjl0=; b=O257HlibTluIqq8vIehMfgpKXD
	W13I+aqoJm8S9IB5LW012M/WN+8C5BoId6W0wY33p6j1OB4XVdFXnwSaqFfAtmTCkpC5Hw1JlBlR3
	aQHpllqbqfCWKqzI5nLStco4MI9JRx3nfi2uJsArWyTOcwUC4tm5cikbgzkj6Pdiwhsgg5u9j9J9w
	T7DVMVwayxeX5suo6RLdrS9inU0461rlH90Tu4pxxiG7Hhp2Nb2MxkyUs9XQFyjxHmRi/6aOfLlnS
	rg6l8eIh2AKYaWZezpFiIAynPoooMt8kAb0uncgHoP6PCRxlaICRVVGyuErfYPzVRpdFimyk9mBR3
	oUKZRTJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBcg-0000000Enqq-3Ugc;
	Fri, 10 Jan 2025 09:48:10 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWBbS-0000000EnWz-3Aeu;
	Fri, 10 Jan 2025 09:46:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736502413;
	bh=WczDZYe1varGaXmi3HXHJGCKXxAI3lrXNNWGq/sc7hg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PB8Mtsv1ZKyUnjGyTuys6lyOslVtXIhzjyqZHqUPVGfBt5qAod3NMZbtQrxQ01GUc
	 +HUYrbU+RGOMG/f5Gs5hxxJsZTVoPTsvuJeirEa44Vg5F/QgugbdXzFSf2VCm/ll+h
	 s3CeHAWSFaat7ycFXSVDHqDzOJJjoHaDuwNaj4is8paeRMxSaitV4q80tUia62whX+
	 pBqKmI+N7hgyx/KyF5EsZN9G348NXqNYATvvKy9dZpVHeM9IF0JUiPkfUoyb++UJ+6
	 8ukb/JLb5Ay4a4SxsVk4ln09Gsbzad3qKkRi4uWPBobhFvbdToLVSbjY3jW2DGSX7x
	 5c3tPpIP+g21Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 72D6417E0CD2;
	Fri, 10 Jan 2025 10:46:52 +0100 (CET)
Message-ID: <cc1dff25-2de2-40fe-bf3d-cc9e8f735eeb@collabora.com>
Date: Fri, 10 Jan 2025 10:46:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [V1,03/12] media: mediatek: jpeg: add jpeg compatible
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
 <20250109133513.20151-4-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250109133513.20151-4-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_014654_940657_FD063911 
X-CRM114-Status: GOOD (  14.74  )
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
> Add jpeg dec and enc compatible for mt8196
> 
> Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
> ---
>   drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c   | 8 ++++++++
>   drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c | 3 +++
>   drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c | 3 +++
>   3 files changed, 14 insertions(+)
> 
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 9517ebed0701..c3ccc525d9fd 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1996,6 +1996,14 @@ static const struct of_device_id mtk_jpeg_match[] = {
>   		.compatible = "mediatek,mt8188-jpgdec",
>   		.data = &mtk8188_jpegdec_drvdata,
>   	},
> +	{
> +		.compatible = "mediatek,mt8196-jpgenc",
> +		.data = &mtk8195_jpegenc_drvdata,
> +	},
> +	{
> +		.compatible = "mediatek,mt8196-jpgdec",
> +		.data = &mtk8195_jpegdec_drvdata,

You're adding this with MT8195 platform data, and then you're changing it to
MT8196 specific platform data.

Just put this commit at the end of the series, at this point.

Regards,
Angelo

> +	},
>   	{},
>   };
>   
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index ebded06ba92d..d868e46aaf37 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -45,6 +45,9 @@ static const struct of_device_id mtk_jpegdec_hw_ids[] = {
>   	{
>   		.compatible = "mediatek,mt8195-jpgdec-hw",
>   	},
> +	{
> +		.compatible = "mediatek,mt8196-jpgdec-hw",
> +	},
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, mtk_jpegdec_hw_ids);
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index 87fe1f324f23..ca06d4f435cd 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -52,6 +52,9 @@ static const struct of_device_id mtk_jpegenc_drv_ids[] = {
>   	{
>   		.compatible = "mediatek,mt8195-jpgenc-hw",
>   	},
> +	{
> +		.compatible = "mediatek,mt8196-jpgenc-hw",
> +	},
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, mtk_jpegenc_drv_ids);




