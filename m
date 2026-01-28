Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21754D35698
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 09:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UhictCb8sRjeYvfEBeQy6sDAlQBoPgZY72iuGxy1yf0=; b=STqwIJ0Wzuhtg7vVgHSsyfg2Vk
	neD6tbkXfepWhtkxxvSseem4buw2tAD+sZ8gMoS1wa4bk1Z/0ZmEF1IbrZEeRkmUu7XUOYSdc5crS
	dj6Lo8ZB4poii4f10sYSwX3Llr7TQh2ZCZ5t9zFPp+D/4sZha4D9Dlmc22Dk9uCbE1dv0WBWs3HJ0
	t7ZpbsiNrKEpD2tu+XRI7RELn6/KqS7ssknq9aO2k/Npgh0minrLAL0qPVKsr3KEIJOx7lIVZVI9l
	stkXD5DsuZUU6z5mueDYpZGxdL4XVG7Vzd5JfbfS7dOWBpiPSDbmvdiiQbpA7Oy/RRMCmyXznBIc2
	fg9JtaPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2EZ-0000000FmGu-0CaM;
	Wed, 28 Jan 2026 09:53:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2EV-0000000FmGV-430m;
	Wed, 28 Jan 2026 09:53:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769593982;
	bh=vr1IpjsppjvWE/p2emkhB1rpnvnBV8VpHY5/IN7FEzs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MT4bhqjZXbv6XCbzGcAoPi4Gya9NPY16Q89TwSaa81gBDfiTwuN9LfosCOBMVxcit
	 LZ9CAuatyL4Lbl541UEsL4cJXn7oIqZrrUN8bjj0gjggHVRYlmgxvo1cLGjwU2zHgY
	 MlHB981uLUCXcSSVrhtgrnRvgXbjkTdfhpXYQS5VXXYZwGsZyZL+eLKzd4bCcurz79
	 6P23n+nZlT+YZoR5GfIcrVM7K2tAeeXjSonQF8iMsSNBfvD2uqC+Zu3rXiFJ+jY4DR
	 FcOuKmY5cJQSDRPixZ2VuRkhxOi59YscHAo4Z1qQZmriiS7zzve2jqs8SAP7X7J4Wx
	 gs4WXzwFyzEmg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1B96717E0E4C;
	Wed, 28 Jan 2026 10:53:02 +0100 (CET)
Message-ID: <8b1c78db-12fc-4f06-bf2b-49b47f24850a@collabora.com>
Date: Wed, 28 Jan 2026 10:53:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/10] media: mediatek: vcodec: Add Decoder profile &
 level Initialization
To: =?UTF-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
 =?UTF-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
 "nhebert@chromium.org" <nhebert@chromium.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 "nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
 =?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 =?UTF-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
 "robh@kernel.org" <robh@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
 =?UTF-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
 <Andrew-CT.Chen@mediatek.com>
Cc: "andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 =?UTF-8?B?WWlsb25nIFpob3UgKOWRqOaYk+m+mSk=?= <Yilong.Zhou@mediatek.com>
References: <20260127024248.18406-1-kyrie.wu@mediatek.com>
 <20260127024248.18406-6-kyrie.wu@mediatek.com>
 <4a6e111d-49ef-449d-af9d-b0bd4fb468a5@collabora.com>
 <54689bc16875b979147c021123c2546aacb7541e.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <54689bc16875b979147c021123c2546aacb7541e.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_015308_247338_0D6BBEC8 
X-CRM114-Status: GOOD (  21.75  )
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

Il 28/01/26 08:45, Kyrie Wu (吴晗) ha scritto:
> On Tue, 2026-01-27 at 13:07 +0100, AngeloGioacchino Del Regno wrote:
>> Il 27/01/26 03:42, Kyrie Wu ha scritto:
>>> This commit initializes codec profile & level for VDEC. It sets
>>> default values for H264, H265, and VP9 codecs across multiple
>>> chipset configurations.
>>>
>>
>> The previous patch "Refactor decoder profile and level handling" will
>> break the
>> driver if this patch is not also applied at the same time.
>>
>> The change looks good, but you should squash 05/10 in 04/10, and
>> assign the params
>> that you're adding here along with the refactoring, so that you get
>> one single
>> patch that, if applied, doesn't break anything as it doesn't depend
>> on additional
>> (future, as this is number 5) patch.
>>
>> Please squash
>>
>> Cheers,
>> Angelo
> 
> Dear Angelo,
> 
> The 04/10 and 05/10 were designed in one patch in v6,
> but Nicolas thought that refactor patch and configuration
> were two different changes, should separate them in this
> comments:
> https://patchwork.linuxtv.org/project/linux-media/patch/20251202074038.3173-5-kyrie.wu@mediatek.com/

Even though in this case I disagree with Nicolas, I'm the mediatek maintainer,
not a linux-media maintainer... so... let's go with whatever the media
maintainers think it's best.

> 
> In my mind, refactor profile and level setting and assign
> former ICs' parameters could merge into same patch. The
> configuration of MT8189 should split to another one, because
> it is a new setting.
> 
> Do you agree with my opinion? I look forward to your further reply.
> 

I agree with your opinion, but if linux-media maintainers want those two
patches separated as you just did, I will raise my hands, so...

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com

...because when the two patches are applied at the same time, there's no
breakage. But I want to still repeat my stance on this: single patches
should never depend on subsequent patches to avoid regressions (and I know
you agree as your previous version was compliant with that stance).

Cheers,
Angelo

> Thanks.
> 
> Regards,
> Kyrie.
> 
> 
>>
>>> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
>>> ---
>>>    .../vcodec/decoder/mtk_vcodec_dec_stateful.c  | 12 +++
>>>    .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 84
>>> +++++++++++++++++++
>>>    2 files changed, 96 insertions(+)
>>>
>>> diff --git
>>> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
>>> teful.c
>>> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
>>> teful.c
>>> index 8ddb61670dc6..a47906b9d717 100644
>>> ---
>>> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
>>> teful.c
>>> +++
>>> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
>>> teful.c
>>> @@ -619,4 +619,16 @@ const struct mtk_vcodec_dec_pdata
>>> mtk_vdec_8173_pdata = {
>>>    	.is_subdev_supported = false,
>>>    	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
>>>    	.chip_name = 8173,
>>> +	.h264_params = {
>>> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_4_1,
>>> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
>>> +	},
>>> +	.h265_params = {
>>> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
>>> +		.profile =
>>> V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
>>> +	},
>>> +	.vp9_params = {
>>> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
>>> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
>>> +	},
>>>    };
>>> diff --git
>>> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
>>> teless.c
>>> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
>>> teless.c
>>> index a1f419202a24..b571c4ed3f79 100644
>>> ---
>>> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
>>> teless.c
>>> +++
>>> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
>>> teless.c
>>> @@ -830,6 +830,18 @@ const struct mtk_vcodec_dec_pdata
>>> mtk_vdec_8183_pdata = {
>>>    	.is_subdev_supported = false,
>>>    	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
>>>    	.chip_name = 8183,
>>> +	.h264_params = {
>>> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
>>> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
>>> +	},
>>> +	.h265_params = {
>>> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
>>> +		.profile =
>>> V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
>>> +	},
>>> +	.vp9_params = {
>>> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
>>> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
>>> +	},
>>>    };
>>>    
>>>    /* This platform data is used for one lat and one core
>>> architecture. */
>>> @@ -869,24 +881,72 @@ const struct mtk_vcodec_dec_pdata
>>> mtk_vdec_8188_pdata = {
>>>    	MTK_STATELESS_DEC_DATA,
>>>    	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
>>>    	.chip_name = 8188,
>>> +	.h264_params = {
>>> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
>>> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
>>> +	},
>>> +	.h265_params = {
>>> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1,
>>> +		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
>>> +	},
>>> +	.vp9_params = {
>>> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
>>> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
>>> +	},
>>>    };
>>>    
>>>    const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata = {
>>>    	MTK_STATELESS_DEC_DATA,
>>>    	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
>>>    	.chip_name = 8192,
>>> +	.h264_params = {
>>> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
>>> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
>>> +	},
>>> +	.h265_params = {
>>> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
>>> +		.profile =
>>> V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
>>> +	},
>>> +	.vp9_params = {
>>> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
>>> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
>>> +	},
>>>    };
>>>    
>>>    const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata = {
>>>    	MTK_STATELESS_DEC_DATA,
>>>    	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
>>>    	.chip_name = 8195,
>>> +	.h264_params = {
>>> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
>>> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
>>> +	},
>>> +	.h265_params = {
>>> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2,
>>> +		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
>>> +	},
>>> +	.vp9_params = {
>>> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
>>> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
>>> +	},
>>>    };
>>>    
>>>    const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata = {
>>>    	MTK_STATELESS_DEC_DATA,
>>>    	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
>>>    	.chip_name = 8196,
>>> +	.h264_params = {
>>> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
>>> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
>>> +	},
>>> +	.h265_params = {
>>> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2,
>>> +		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
>>> +	},
>>> +	.vp9_params = {
>>> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
>>> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
>>> +	},
>>>    };
>>>    
>>>    const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata = {
>>> @@ -910,6 +970,18 @@ const struct mtk_vcodec_dec_pdata
>>> mtk_vdec_8186_pdata = {
>>>    	MTK_STATELESS_DEC_DATA,
>>>    	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
>>>    	.chip_name = 8186,
>>> +	.h264_params = {
>>> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
>>> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
>>> +	},
>>> +	.h265_params = {
>>> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
>>> +		.profile =
>>> V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
>>> +	},
>>> +	.vp9_params = {
>>> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_1,
>>> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
>>> +	},
>>>    };
>>>    
>>>    const struct mtk_vcodec_dec_pdata mtk_vdec_8189_pdata = {
>>> @@ -928,4 +1000,16 @@ const struct mtk_vcodec_dec_pdata
>>> mtk_vdec_8189_pdata = {
>>>    	.is_subdev_supported = true,
>>>    	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
>>>    	.chip_name = 8189,
>>> +	.h264_params = {
>>> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
>>> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
>>> +	},
>>> +	.h265_params = {
>>> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
>>> +		.profile =
>>> V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
>>> +	},
>>> +	.vp9_params = {
>>> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
>>> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
>>> +	},
>>>    };
>>
>>


