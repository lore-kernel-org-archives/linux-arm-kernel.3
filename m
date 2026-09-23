Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CDDC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 09:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JmHZrjDIqQ270zgQZgKUtV70qmH4frZxcGXUMiZzYGM=; b=tESu1hR2nuw0hphb3QQPJJdOTS
	VwtTrVUiVbsRg2iuWMydInVyciO0gDAL2NftIGKbL54PWS2IYbk63A0ykbWPAgWRnjqZEype17kP5
	Rum0hV40P9aWfdMbTvfBkPVtt+Ww3wcjEqHaKSwVpiN/X1vPhmBL4beAceFbwysL6DRZHK0U/uzge
	vz+s8TRSkNzHTOpMkOrW/BKmEcM+xfuuXjuBMFIcf6aAIcPCNRxOEpgvT1EMENBrrmpfy/aDhdEjb
	JyASdmNlzVU9kaciXnCys80QCFd6trGxmJKhRkMpSnBT7bEHp/zxIqtCWpPNPKkNuwyCm/1YHbwSR
	GJvOUczQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Jbu-00000007njH-0Yue;
	Wed, 23 Sep 2026 09:49:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Jbp-00000007nhp-1mCQ;
	Wed, 23 Sep 2026 09:49:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790156986;
	bh=0xs1aK+waLR/h64Dn98ERXS0Ct3KJtqXAJmX+rFh/oU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vtphx4aTmU8jfvrft1SoI/PuISbWncfFJzkoaPa9wuqpD75ekIkgSdGVA3qvHGyLa
	 +WfsOnrWMCK8tdgz4i181YAbKB5DNBgQVTJ5YulEYV6kEOArEmJmu9G6F1LfNSANAk
	 iHs3vUCAuHOGSrIluiMeQNI/vF94jWxXoExyWuFv5/0RWvj9k/8Qk90G+Etzub/XvS
	 A/aRXx2096Xx0fRZEmm+h8hw/TMhteAMIOhV07DQ0rUPUvLBKXY5cmSQ6FgK/a83PU
	 9VcD8eGD8J27pAQxHW21INZdaCyP83lQwawM6Resu3lZ2AYHZ1xZfDS5VBMOsY6K68
	 S05g9a1FnxW9g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A20EC17E0803;
	Wed, 23 Sep 2026 11:49:45 +0200 (CEST)
Message-ID: <b32d6f95-08fe-49f9-a142-11597afd4263@collabora.com>
Date: Wed, 23 Sep 2026 11:49:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 02/10] media: mediatek: decoder: Add a new platform
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
References: <20260923081246.268182-1-kyrie.wu@mediatek.com>
 <20260923081246.268182-3-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260923081246.268182-3-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_024950_017818_FE287A32 
X-CRM114-Status: GOOD (  18.48  )
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

On 9/23/26 10:12, Kyrie Wu wrote:
> Move the chip model information into the codec match data
> and remove the second compatible matching code.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>   .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  |   2 +-
>   .../mediatek/vcodec/decoder/mtk_vcodec_dec.h  |   5 +
>   .../vcodec/decoder/mtk_vcodec_dec_drv.c       |  40 ++-----
>   .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  17 +--
>   .../vcodec/decoder/mtk_vcodec_dec_hw.c        |   2 +-
>   .../vcodec/decoder/mtk_vcodec_dec_stateful.c  |   1 +
>   .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 104 +++++++++++++-----
>   7 files changed, 96 insertions(+), 75 deletions(-)
> 

..snip..

> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> index 53d1708b012b..153c617df78d 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> @@ -21,17 +21,6 @@
>   #define IS_VDEC_INNER_RACING(capability) ((capability) & MTK_VCODEC_INNER_RACING)
>   #define IS_VDEC_SUPPORT_EXT(capability) ((capability) & MTK_VDEC_IS_SUPPORT_EXT)
>   
> -enum mtk_vcodec_dec_chip_name {
> -	MTK_VDEC_INVAL = 0,
> -	MTK_VDEC_MT8173 = 8173,
> -	MTK_VDEC_MT8183 = 8183,
> -	MTK_VDEC_MT8186 = 8186,
> -	MTK_VDEC_MT8188 = 8188,
> -	MTK_VDEC_MT8192 = 8192,
> -	MTK_VDEC_MT8195 = 8195,
> -	MTK_VDEC_MT8196 = 8196,
> -};
> -
>   /*
>    * enum mtk_vdec_format_types - Structure used to get supported
>    *		  format types according to decoder capability
> @@ -108,6 +97,7 @@ struct vdec_pic_info {
>    *
>    * @is_subdev_supported: whether support parent-node architecture(subdev)
>    * @uses_stateless_api: whether the decoder uses the stateless API with requests
> + * @chip_model: platforms configuration values
>    */
>   struct mtk_vcodec_dec_pdata {
>   	void (*init_vdec_params)(struct mtk_vcodec_dec_ctx *ctx);
> @@ -129,6 +119,7 @@ struct mtk_vcodec_dec_pdata {
>   
>   	bool is_subdev_supported;
>   	bool uses_stateless_api;
> +	unsigned int chip_model;

I already gave my R-b but I just noticed:

Please use u16 here, 16 bits are way more than enough for this.

>   };
>   
>   /**
> @@ -277,7 +268,7 @@ struct mtk_vcodec_dec_ctx {
>    * @dec_racing_info_mutex: mutex lock used for inner racing mode
>    * @dbgfs: debug log related information
>    *
> - * @chip_name: used to distinguish platforms and select the correct codec configuration values
> + * @chip_model: used to distinguish platforms and select the correct codec configuration values
>    */
>   struct mtk_vcodec_dec_dev {
>   	struct v4l2_device v4l2_dev;
> @@ -321,7 +312,7 @@ struct mtk_vcodec_dec_dev {
>   	struct mutex dec_racing_info_mutex;
>   	struct mtk_vcodec_dbgfs dbgfs;
>   
> -	enum mtk_vcodec_dec_chip_name chip_name;
> +	unsigned int chip_model;

same here


Cheers,
Angelo

