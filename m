Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A84D2F000
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 12:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MkWOp+xWNlBUhk3z+kjIQv6lyriaRFWSGHYRQWtJf40=; b=LmNd11KBF3rycRBNbvBLtcxlnN
	gTAuOVoR+w0nRQdJlq/adyUeQqK5IrsNHcSfz8ITK3GsrpW0ataQTcTcsSZH176DsC/0na3YgzZdM
	XobaH386EWwnKaFv1NR3rxzu0bGKOJtru2EK6KDCxyos15WPe3lqcl+ofNzlvYItcYfhxB2fAJix9
	117TKBdKiJM6utsEZ9E3p8Ri5KR1roft0UIOV4z+rhgHF8Wcl5JFKRsfXXOnig69fFlHej3EZ04dw
	bbGi+JrRKEHdor/ISntwX13ysgVbSpQ4a9slaIuqfCsF+GK5fBFLR5sqg0VmrHeWlcJ2zFaFUeKdk
	1/7/hloQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhrX-0000000ECbN-0wfm;
	Tue, 27 Jan 2026 12:08:03 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhr5-0000000ECHu-18If;
	Tue, 27 Jan 2026 12:07:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769515651;
	bh=JTD/7Yg90m3Li7TqsJFzrcj2fP7zcyHgyM48gbUTF/Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fIGJ2gq5hTPlD5Yy8m1c0/VRYozpUwbfzfZCYfmx0klSjez2uW5K+X19oulprqGkY
	 XzI1CdYFwB5TAYQkuLCOYmbEU7JlKgazjOBDLvrMLxMmnaNA+qDca1jA5ExUUb972E
	 /sf0XN07k7y9vP0dCx6e/fUUESFifjyvEcDGu1xQ4a2Mw+/iJGur0Ut0os2IlrX50c
	 bmRYKCM7JyGX4imq9AuUwaHbOkkyx8LEigahDrcJhNFo1UAjoLt5GIOxxuXdDmI1ol
	 CUVPzAryBoGf7tBS6yH3FYVTr954ih6DNorO9fqFh7H8vFtpkiS7DIabvoV8HHH7rn
	 8e9CoGEvZ1YIQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DA6CF17E1418;
	Tue, 27 Jan 2026 13:07:30 +0100 (CET)
Message-ID: <4a4d87dd-0b85-42dd-8398-7580989a16c7@collabora.com>
Date: Tue, 27 Jan 2026 13:07:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/10] media: mediatek: decoder: Add a new platform
 data member
To: Kyrie Wu <kyrie.wu@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Yilong Zhou <yilong.zhou@mediatek.com>
References: <20260127024248.18406-1-kyrie.wu@mediatek.com>
 <20260127024248.18406-3-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260127024248.18406-3-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_040735_488714_E6629AF2 
X-CRM114-Status: GOOD (  15.84  )
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

Il 27/01/26 03:42, Kyrie Wu ha scritto:
> Add a new platform data member to indicate each decoder IC
> to avoid the chip name definition keep growing.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
>   .../mediatek/vcodec/decoder/mtk_vcodec_dec.h  |  5 +
>   .../vcodec/decoder/mtk_vcodec_dec_drv.c       | 35 ++-----
>   .../vcodec/decoder/mtk_vcodec_dec_drv.h       | 15 +--
>   .../vcodec/decoder/mtk_vcodec_dec_hw.c        |  2 +-
>   .../vcodec/decoder/mtk_vcodec_dec_stateful.c  |  1 +
>   .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 92 ++++++++++++++-----
>   6 files changed, 86 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
> index 1af075fc0194..80cb46f1cded 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
> @@ -69,6 +69,11 @@ extern const struct v4l2_m2m_ops mtk_vdec_m2m_ops;
>   extern const struct media_device_ops mtk_vcodec_media_ops;
>   extern const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata;
>   extern const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata;
> +extern const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata;
> +extern const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pdata;
> +extern const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata;
> +extern const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata;
> +extern const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata;
>   extern const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata;
>   extern const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata;
>   
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> index 7ed40936a0e8..c7af48f684c5 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> @@ -333,24 +333,7 @@ static const struct v4l2_file_operations mtk_vcodec_fops = {
>   
>   static void mtk_vcodec_dec_get_chip_name(struct mtk_vcodec_dec_dev *vdec_dev)
>   {
> -	struct device *dev = &vdec_dev->plat_dev->dev;
> -
> -	if (of_device_is_compatible(dev->of_node, "mediatek,mt8173-vcodec-dec"))
> -		vdec_dev->chip_name = MTK_VDEC_MT8173;
> -	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8183-vcodec-dec"))
> -		vdec_dev->chip_name = MTK_VDEC_MT8183;
> -	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8192-vcodec-dec"))
> -		vdec_dev->chip_name = MTK_VDEC_MT8192;
> -	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8195-vcodec-dec"))
> -		vdec_dev->chip_name = MTK_VDEC_MT8195;
> -	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8186-vcodec-dec"))
> -		vdec_dev->chip_name = MTK_VDEC_MT8186;
> -	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8188-vcodec-dec"))
> -		vdec_dev->chip_name = MTK_VDEC_MT8188;
> -	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8196-vcodec-dec"))
> -		vdec_dev->chip_name = MTK_VDEC_MT8196;
> -	else
> -		vdec_dev->chip_name = MTK_VDEC_INVAL;
> +	vdec_dev->chip_name = vdec_dev->vdec_pdata->chip_name;

While at it, can you please rename `chip_name` to `chip_model`?

"name" makes me (if it's just me, nevermind) always think about a string, not about
an (unsigned) integer number.

In any case, you can already get my

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

...because that was just a nitpick, anyway.

Cheers,
Angelo

