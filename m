Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189BBD3F073
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 14:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qzQW4x9GvHfNuuUCAGvznnJeLzhvnRmnz1hEJUjOKEo=; b=cu2+d3JVYRgWuu/kjnCZ6uqsnc
	JHqgEazqIOfZVJVHL4XndTtMbLNhq6qWCMEtPxMFEbc3EhbTNzpWqjxvjWea64vCOAXWM3kWC1o6Z
	FzpvQPNiGvFryLcgcM3IWZxPUH2QMM2+Ps/mvVbpYb54SqbjL2y63kLImr86j5KQxzaknL5J4PjVZ
	HufdGiNjJEYKNQ3obW8/vY4CGtWYACSvI0LOmRUjgXSeJtv/77VFO6DCN1fMzMobQtDdcQd9pQ1/A
	8lr4AeTf1dOE1d8yAq2R7NjMMYL656KVzbOG72YCOWPaQs67e2dfCng2KTRSbgau5K+j+fk3tDD+B
	/AD6ql4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6jx-0000000GCDE-0Mcx;
	Wed, 28 Jan 2026 14:41:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6ju-0000000GCCd-3Up8;
	Wed, 28 Jan 2026 14:41:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769611307;
	bh=wAlJzcsh4bYcVJgHM5D12nidM5/BBv4ehJTvbKYkBXY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VskxW8cQHOvCgDxJWR5jQb0a7ljthDHhE46HFb7V4NWE6bTMUh6bjUOb1KcTt6PTd
	 OfzE5i91d4FrRg9WNrAl2lnzH9E9r6bdVxrIQsPIqM9h6+YcP6bTiWsJW/wrrYDmwJ
	 Y3G67ScEvLw1gUGY95KVXXTy6eGqvjyNOzMyl7jOsm/KtPiw5WOrKOe3sHSYDRZfOZ
	 VXl1i208d5j8uSPWvNq/Eg+BDvw7de3GtWhcKmlvkrQOSpO5auDnncpnfhwIyS4Ubd
	 C4imqDlgX1frq8W75CH7TG6jk0608gPt3GzB8SDRa7GFxiD1BvTHLYB9DXSwj0CxpK
	 wwCq2kwH3nodg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A919017E0699;
	Wed, 28 Jan 2026 15:41:46 +0100 (CET)
Message-ID: <92cabfc7-b35c-4ed8-9654-c4ef52bcbe03@collabora.com>
Date: Wed, 28 Jan 2026 15:41:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/10] media: mediatek: vcodec: Add Decoder profile &
 level Initialization
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 =?UTF-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
 =?UTF-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
 "nhebert@chromium.org" <nhebert@chromium.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
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
 <8b1c78db-12fc-4f06-bf2b-49b47f24850a@collabora.com>
 <d00d4dc685d76273ea99c9b90897602617c53abb.camel@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <d00d4dc685d76273ea99c9b90897602617c53abb.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_064151_026948_6B3268CF 
X-CRM114-Status: GOOD (  22.61  )
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

Il 28/01/26 14:39, Nicolas Dufresne ha scritto:
> Hi,
> 
> Le mercredi 28 janvier 2026 à 10:53 +0100, AngeloGioacchino Del Regno a écrit :
>> Il 28/01/26 08:45, Kyrie Wu (吴晗) ha scritto:
>>> On Tue, 2026-01-27 at 13:07 +0100, AngeloGioacchino Del Regno wrote:
>>>> Il 27/01/26 03:42, Kyrie Wu ha scritto:
>>>>> This commit initializes codec profile & level for VDEC. It sets
>>>>> default values for H264, H265, and VP9 codecs across multiple
>>>>> chipset configurations.
>>>>>
>>>>
>>>> The previous patch "Refactor decoder profile and level handling" will
>>>> break the
>>>> driver if this patch is not also applied at the same time.
>>>>
>>>> The change looks good, but you should squash 05/10 in 04/10, and
>>>> assign the params
>>>> that you're adding here along with the refactoring, so that you get
>>>> one single
>>>> patch that, if applied, doesn't break anything as it doesn't depend
>>>> on additional
>>>> (future, as this is number 5) patch.
>>>>
>>>> Please squash
>>>>
>>>> Cheers,
>>>> Angelo
>>>
>>> Dear Angelo,
>>>
>>> The 04/10 and 05/10 were designed in one patch in v6,
>>> but Nicolas thought that refactor patch and configuration
>>> were two different changes, should separate them in this
>>> comments:
>>> https://patchwork.linuxtv.org/project/linux-media/patch/20251202074038.3173-5-kyrie.wu@mediatek.com/
>>
>> Even though in this case I disagree with Nicolas, I'm the mediatek maintainer,
>> not a linux-media maintainer... so... let's go with whatever the media
>> maintainers think it's best.
> 
> No need to disagree, I was not very clear in my reply indeed. What I want to see
> is the added MT8189 configuration in isolation. So when I said two patches, the
> first one should reorganize the code for existing platform, without breaking it,
> and the second should add MT8189 support. I will have a read at these two patch
> to understand what is being done wrong, and can provide further feedback later.
> 
> The commit description in v6 was only saying that it was adding a configuration
> for MT8189.
> 

Re-reading what I wrote - my words could be misunderstood as well, so - just in
case anyone did: sorry, that wasn't meant as any form of attack and was purely
about sharing an opinion in a friendlier way than what appears from my previous
words. Eh, writing emails fast .... :-P

Btw.

Happy to see that we're on the same page.

Cheers,
Angelo

> Nicolas
> 
>>
>>>
>>> In my mind, refactor profile and level setting and assign
>>> former ICs' parameters could merge into same patch. The
>>> configuration of MT8189 should split to another one, because
>>> it is a new setting.
>>>
>>> Do you agree with my opinion? I look forward to your further reply.
>>>
>>
>> I agree with your opinion, but if linux-media maintainers want those two
>> patches separated as you just did, I will raise my hands, so...
>>
>> Reviewed-by: AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@collabora.com
>>
>> ...because when the two patches are applied at the same time, there's no
>> breakage. But I want to still repeat my stance on this: single patches
>> should never depend on subsequent patches to avoid regressions (and I know
>> you agree as your previous version was compliant with that stance).
>>
>> Cheers,
>> Angelo
>>
>>> Thanks.
>>>
>>> Regards,
>>> Kyrie.
>>>
>>>
>>>>
>>>>> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
>>>>> ---
>>>>>     .../vcodec/decoder/mtk_vcodec_dec_stateful.c  | 12 +++
>>>>>     .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 84
>>>>> +++++++++++++++++++
>>>>>     2 files changed, 96 insertions(+)
>>>>>
>>>>> diff --git
>>>>> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
>>>>> teful.c
>>>>> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
>>>>> teful.c
>>>>> index 8ddb61670dc6..a47906b9d717 100644
>>>>> ---
>>>>> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
>>>>> teful.c
>>>>> +++
>>>>> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
>>>>> teful.c
>>>>> @@ -619,4 +619,16 @@ const struct mtk_vcodec_dec_pdata
>>>>> mtk_vdec_8173_pdata = {
>>>>>     	.is_subdev_supported = false,
>>>>>     	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
>>>>>     	.chip_name = 8173,
>>>>> +	.h264_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_4_1,
>>>>> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
>>>>> +	},
>>>>> +	.h265_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
>>>>> +		.profile =
>>>>> V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
>>>>> +	},
>>>>> +	.vp9_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
>>>>> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
>>>>> +	},
>>>>>     };
>>>>> diff --git
>>>>> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
>>>>> teless.c
>>>>> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
>>>>> teless.c
>>>>> index a1f419202a24..b571c4ed3f79 100644
>>>>> ---
>>>>> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
>>>>> teless.c
>>>>> +++
>>>>> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta
>>>>> teless.c
>>>>> @@ -830,6 +830,18 @@ const struct mtk_vcodec_dec_pdata
>>>>> mtk_vdec_8183_pdata = {
>>>>>     	.is_subdev_supported = false,
>>>>>     	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
>>>>>     	.chip_name = 8183,
>>>>> +	.h264_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
>>>>> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
>>>>> +	},
>>>>> +	.h265_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
>>>>> +		.profile =
>>>>> V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
>>>>> +	},
>>>>> +	.vp9_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
>>>>> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
>>>>> +	},
>>>>>     };
>>>>>     
>>>>>     /* This platform data is used for one lat and one core
>>>>> architecture. */
>>>>> @@ -869,24 +881,72 @@ const struct mtk_vcodec_dec_pdata
>>>>> mtk_vdec_8188_pdata = {
>>>>>     	MTK_STATELESS_DEC_DATA,
>>>>>     	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
>>>>>     	.chip_name = 8188,
>>>>> +	.h264_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
>>>>> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
>>>>> +	},
>>>>> +	.h265_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1,
>>>>> +		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
>>>>> +	},
>>>>> +	.vp9_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
>>>>> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
>>>>> +	},
>>>>>     };
>>>>>     
>>>>>     const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata = {
>>>>>     	MTK_STATELESS_DEC_DATA,
>>>>>     	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
>>>>>     	.chip_name = 8192,
>>>>> +	.h264_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
>>>>> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
>>>>> +	},
>>>>> +	.h265_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
>>>>> +		.profile =
>>>>> V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
>>>>> +	},
>>>>> +	.vp9_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
>>>>> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
>>>>> +	},
>>>>>     };
>>>>>     
>>>>>     const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata = {
>>>>>     	MTK_STATELESS_DEC_DATA,
>>>>>     	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
>>>>>     	.chip_name = 8195,
>>>>> +	.h264_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
>>>>> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
>>>>> +	},
>>>>> +	.h265_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2,
>>>>> +		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
>>>>> +	},
>>>>> +	.vp9_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
>>>>> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
>>>>> +	},
>>>>>     };
>>>>>     
>>>>>     const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata = {
>>>>>     	MTK_STATELESS_DEC_DATA,
>>>>>     	.hw_arch = MTK_VDEC_LAT_SINGLE_CORE,
>>>>>     	.chip_name = 8196,
>>>>> +	.h264_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
>>>>> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
>>>>> +	},
>>>>> +	.h265_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2,
>>>>> +		.profile = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
>>>>> +	},
>>>>> +	.vp9_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
>>>>> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
>>>>> +	},
>>>>>     };
>>>>>     
>>>>>     const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata = {
>>>>> @@ -910,6 +970,18 @@ const struct mtk_vcodec_dec_pdata
>>>>> mtk_vdec_8186_pdata = {
>>>>>     	MTK_STATELESS_DEC_DATA,
>>>>>     	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
>>>>>     	.chip_name = 8186,
>>>>> +	.h264_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
>>>>> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
>>>>> +	},
>>>>> +	.h265_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
>>>>> +		.profile =
>>>>> V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
>>>>> +	},
>>>>> +	.vp9_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_4_1,
>>>>> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_1,
>>>>> +	},
>>>>>     };
>>>>>     
>>>>>     const struct mtk_vcodec_dec_pdata mtk_vdec_8189_pdata = {
>>>>> @@ -928,4 +1000,16 @@ const struct mtk_vcodec_dec_pdata
>>>>> mtk_vdec_8189_pdata = {
>>>>>     	.is_subdev_supported = true,
>>>>>     	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
>>>>>     	.chip_name = 8189,
>>>>> +	.h264_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
>>>>> +		.profile = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
>>>>> +	},
>>>>> +	.h265_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
>>>>> +		.profile =
>>>>> V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
>>>>> +	},
>>>>> +	.vp9_params = {
>>>>> +		.level = V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
>>>>> +		.profile = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
>>>>> +	},
>>>>>     };
>>>>
>>>>



