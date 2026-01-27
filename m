Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35EA2D2F006
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 12:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvaIeRHtw6Ob+hjd6B69kNTYFMkkOT4WAsWgnZXj4EY=; b=OGS1f7un7ZdrBR/JZGW6qouK2r
	HVTkYLug7TyBF85bZYAh34mtz58cGAGyt64sF53EGB07KgqMieVdwLd/IdVXBxfxqnOEhFCkxkPV7
	Vs1TrgGc+YMU8MYbLLvXcpfYWdNH9M7RKlloPzEV0ilK7wfExO4xP4EULhxSE6Yvk1Wm6WQLcV0gM
	59zdPm7FLEwDUgcn42kvWfyzVs4LS7TD4GRYDVpO516X2D5u7ouErVBVvtgn1eWj7werqqzmS970T
	VdZ7HPmOwLR2UqfZlN1ytdABESZ2fxejy7nF16lQPQ+LfA1FicODGtQRMgQcmkf9Afg9jr1rytVnq
	TgP86IKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhrG-0000000ECOJ-23KL;
	Tue, 27 Jan 2026 12:07:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhqz-0000000ECFm-3On3;
	Tue, 27 Jan 2026 12:07:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769515646;
	bh=BLXhitwnd07aNFjvXRncMmc27buRbiQMkveA+n5QO5U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ISIkEdZChC+RirxyDFLqhjI0OQDs91Y/qvz7rubSFkNUv1vvbjQIgkRQeCHP7DX7n
	 4s6nDhJlpigPwiwyWGFAvE7kKiZAGoX/jcXhmnUW/88fFVN4WQsvO9iVCuhp0xBXwa
	 slFAzmP1znQ7FKMAObhEQNS/XGCtQ/0AB8q41bbYwrJMElCOttKNVPi5OOkUoFkrpA
	 uHvTehsWaLYyy2856a3x7aVPuuS+5s0H8d+51rPR96wENH9BOJ8VyMNZr5oDZT9leV
	 GxJ/KtPx/SjuDSUbFeafjBgUy1uflmz8FlXW7jQl8ERpK4JuQ19vXO3C0/rwe6HA2N
	 h0xWnZMqWH8wg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 015E117E0E3D;
	Tue, 27 Jan 2026 13:07:25 +0100 (CET)
Message-ID: <4a6e111d-49ef-449d-af9d-b0bd4fb468a5@collabora.com>
Date: Tue, 27 Jan 2026 13:07:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/10] media: mediatek: vcodec: Add Decoder profile &
 level Initialization
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
 <20260127024248.18406-6-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260127024248.18406-6-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_040730_016355_C204F13A 
X-CRM114-Status: GOOD (  17.65  )
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
> This commit initializes codec profile & level for VDEC. It sets
> default values for H264, H265, and VP9 codecs across multiple
> chipset configurations.
> 

The previous patch "Refactor decoder profile and level handling" will break the
driver if this patch is not also applied at the same time.

The change looks good, but you should squash 05/10 in 04/10, and assign the params
that you're adding here along with the refactoring, so that you get one single
patch that, if applied, doesn't break anything as it doesn't depend on additional
(future, as this is number 5) patch.

Please squash

Cheers,
Angelo

> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
>   .../vcodec/decoder/mtk_vcodec_dec_stateful.c  | 12 +++
>   .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 84 +++++++++++++++++++
>   2 files changed, 96 insertions(+)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
> index 8ddb61670dc6..a47906b9d717 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
> @@ -619,4 +619,16 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata = {
>   	.is_subdev_supported = false,
>   	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
>   	.chip_name = 8173,
> +	.h264_params = {
> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_4_1,
> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +	},
> +	.h265_params = {
> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> +		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> +	},
> +	.vp9_params = {
> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +	},
>   };
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
> index a1f419202a24..b571c4ed3f79 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
> @@ -830,6 +830,18 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
>   	.is_subdev_supported = false,
>   	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
>   	.chip_name = 8183,
> +	.h264_params = {
> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +	},
> +	.h265_params = {
> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> +		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> +	},
> +	.vp9_params = {
> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +	},
>   };
>   
>   /* This platform data is used for one lat and one core architecture. */
> @@ -869,24 +881,72 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pdata = {
>   	MTK_STATELESS_DEC_DATA,
>   	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
>   	.chip_name = 8188,
> +	.h264_params = {
> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
> +	},
> +	.h265_params = {
> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1,
> +		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> +	},
> +	.vp9_params = {
> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +	},
>   };
>   
>   const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata = {
>   	MTK_STATELESS_DEC_DATA,
>   	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
>   	.chip_name = 8192,
> +	.h264_params = {
> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +	},
> +	.h265_params = {
> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> +		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> +	},
> +	.vp9_params = {
> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +	},
>   };
>   
>   const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata = {
>   	MTK_STATELESS_DEC_DATA,
>   	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
>   	.chip_name = 8195,
> +	.h264_params = {
> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
> +	},
> +	.h265_params = {
> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2,
> +		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> +	},
> +	.vp9_params = {
> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +	},
>   };
>   
>   const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata = {
>   	MTK_STATELESS_DEC_DATA,
>   	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
>   	.chip_name = 8196,
> +	.h264_params = {
> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
> +	},
> +	.h265_params = {
> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2,
> +		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> +	},
> +	.vp9_params = {
> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +	},
>   };
>   
>   const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata = {
> @@ -910,6 +970,18 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata = {
>   	MTK_STATELESS_DEC_DATA,
>   	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
>   	.chip_name = 8186,
> +	.h264_params = {
> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +	},
> +	.h265_params = {
> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> +		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> +	},
> +	.vp9_params = {
> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_1,
> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +	},
>   };
>   
>   const struct mtk_vcodec_dec_pdata mtk_vdec_8189_pdata = {
> @@ -928,4 +1000,16 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8189_pdata = {
>   	.is_subdev_supported = true,
>   	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
>   	.chip_name = 8189,
> +	.h264_params = {
> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
> +	},
> +	.h265_params = {
> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> +		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> +	},
> +	.vp9_params = {
> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +	},
>   };



