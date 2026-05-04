Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE39CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 10:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ewhSgoCQAGsr7Am4XT28uEUAN1mPU6tlJcgs4GJgFA=; b=B9Zp9e69rOb1Mh0MtU8yKxWQ3o
	/3HYapTBLdfiYDYVeTiI9k2zYkSTmI9DHK2aHJgfAs+ltpyV2OcjQnJaEOHDZ2o/ZtagDRWq8sh8Q
	cwISyRZL3t3el05Eb00GDlYpLIctVMxGMzVMFXN6xlnTcEVzV16stvmMLM48a5h8OcHwIV+nGxZgs
	VdKKlieP8RZldL47rqIdNlCLstTnRQ4TEDdeM1fTPvKhVsGlIr37uHBDHuHwIwK8mTY5iq9d9StLf
	nr4UOpjGarwGTnLj/TbzON7E9UMudS4X0UJ95+4SBsPFjykVhHdcfdl5M2NSm4E3MaTOXwLZIM/2M
	bvtXmRUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqV0-0000000CvPN-28hb;
	Mon, 04 May 2026 10:26:02 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqUx-0000000CvOi-28Ox;
	Mon, 04 May 2026 10:26:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777890355;
	bh=fjaSYhZE4oRr9d4UaGHL4ThyVOGWeqOjO28JE4crRLo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m+ahxMvQWuVt3kHngI21TEZjivfCGliowz1eIGVTxtsJJvR/gc7NVYlM35vbMI8Bx
	 i+7JQuNoOnD78k61oLohXy7UIqvuTvbRxbW1QHKORRwOmNf/XJyLP4azeZ6ObLXWFo
	 ekujQFqDnhQwKhUSxOTlI/FuS0mcpLr+ySOYAQPCX8Let6t4Qkmnc5c55bM1q3zs+y
	 qhxtZwdqqapMWvnSFSkZcZKAOLCZLZtBOHGnOiBbgEzTdVh6IaixVqoTlz6637GWzj
	 cz64JExVd2/4RMr13BWiHXo+AbAA9nWfEUA3JnVYdzmF/DAWxahrAULEeuy2DF/W9s
	 GXw81I9KOEP4w==
Received: from [100.64.1.43] (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CD2E217E12EB;
	Mon,  4 May 2026 12:25:54 +0200 (CEST)
Message-ID: <da591ba8-9563-4e89-88c2-bf18d41d1bee@collabora.com>
Date: Mon, 4 May 2026 12:25:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: verisilicon: Create AV1 helper library
To: Hans Verkuil <hverkuil+cisco@kernel.org>, nicolas.dufresne@collabora.com,
 p.zabel@pengutronix.de, mchehab@kernel.org, heiko@sntech.de
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20260415073801.58369-1-benjamin.gaignard@collabora.com>
 <8f29d271-da7d-4456-9427-2fb66136747a@kernel.org>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <8f29d271-da7d-4456-9427-2fb66136747a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_032559_720047_160B7620 
X-CRM114-Status: GOOD (  30.17  )
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


Le 04/05/2026 à 09:20, Hans Verkuil a écrit :
> Hi Benjamin,
>
> I have a few comments about this:
>
> On 15/04/2026 09:38, Benjamin Gaignard wrote:
>> Regroup all none hardware related AV1 functions into a helper library.
>> The goal is to avoid code duplication for futur AV1 codecs.
> futur -> future
>
>> Tested on rock 5b board Fluster score remains the same 204/241.
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>> ---
>> changes in version 3:
>>   - Remove useless wrapper functions.
>>
>>   drivers/media/platform/verisilicon/Makefile   |   7 +-
>>   .../media/platform/verisilicon/hantro_av1.c   | 780 +++++++++++++++
>>   .../media/platform/verisilicon/hantro_av1.h   |  62 ++
>>   ...entropymode.c => hantro_av1_entropymode.c} |  18 +-
>>   ...entropymode.h => hantro_av1_entropymode.h} |  18 +-
>>   ...av1_filmgrain.c => hantro_av1_filmgrain.c} |  82 +-
>>   .../verisilicon/hantro_av1_filmgrain.h        |  44 +
>>   .../media/platform/verisilicon/hantro_hw.h    |   7 +-
>>   .../verisilicon/rockchip_av1_filmgrain.h      |  36 -
>>   .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 935 ++----------------
>>   .../platform/verisilicon/rockchip_vpu_hw.c    |   7 +-
>>   11 files changed, 1041 insertions(+), 955 deletions(-)
>>   create mode 100644 drivers/media/platform/verisilicon/hantro_av1.c
>>   create mode 100644 drivers/media/platform/verisilicon/hantro_av1.h
>>   rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode.c => hantro_av1_entropymode.c} (99%)
>>   rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode.h => hantro_av1_entropymode.h} (95%)
>>   rename drivers/media/platform/verisilicon/{rockchip_av1_filmgrain.c => hantro_av1_filmgrain.c} (92%)
>>   create mode 100644 drivers/media/platform/verisilicon/hantro_av1_filmgrain.h
>>   delete mode 100644 drivers/media/platform/verisilicon/rockchip_av1_filmgrain.h
>>
> <snip>
>
>> diff --git a/drivers/media/platform/verisilicon/hantro_av1.c b/drivers/media/platform/verisilicon/hantro_av1.c
>> new file mode 100644
>> index 000000000000..5a51ac877c9c
>> --- /dev/null
>> +++ b/drivers/media/platform/verisilicon/hantro_av1.c
>> @@ -0,0 +1,780 @@
> <snip>
>
>> +
>> +int hantro_av1_tile_log2(int target)
>> +{
>> +	int k;
>> +
>> +	/*
>> +	 * returns the smallest value for k such that 1 << k is greater
>> +	 * than or equal to target
>> +	 */
>> +	for (k = 0; (1 << k) < target; k++);
> Checkpatch gives:
>
> ERROR: trailing statements should be on next line
> #637: FILE: drivers/media/platform/verisilicon/hantro_av1.c:568:
> +       for (k = 0; (1 << k) < target; k++);
>
> Just move the ';' to the next line.

OK I will do that.

>
>> +
>> +	return k;
>> +}
>> +
> <snip>
>
>> diff --git a/drivers/media/platform/verisilicon/hantro_av1_filmgrain.h b/drivers/media/platform/verisilicon/hantro_av1_filmgrain.h
>> new file mode 100644
>> index 000000000000..5593e84114d0
>> --- /dev/null
>> +++ b/drivers/media/platform/verisilicon/hantro_av1_filmgrain.h
>> @@ -0,0 +1,44 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#ifndef _HANTRO_AV1_FILMGRAIN_H_
>> +#define _HANTRO_AV1_FILMGRAIN_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct hantro_av1_film_grain {
>> +	u8 scaling_lut_y[256];
>> +	u8 scaling_lut_cb[256];
>> +	u8 scaling_lut_cr[256];
>> +	s16 cropped_luma_grain_block[4096];
>> +	s16 cropped_chroma_grain_block[1024 * 2];
>> +};
> This struct is not used in hantro_av1_filmgrain.c/h.
>
> Does this belong here?

The same structure can used for future Verisilicon hardware block so I would prefer to
keep it here.

>
>> +
>> +void hantro_av1_generate_luma_grain_block(s32 (*luma_grain_block)[73][82],
>> +					  s32 bitdepth,
>> +					  u8 num_y_points,
>> +					  s32 grain_scale_shift,
>> +					  s32 ar_coeff_lag,
>> +					  s32 (*ar_coeffs_y)[24],
>> +					  s32 ar_coeff_shift,
>> +					  s32 grain_min,
>> +					  s32 grain_max,
>> +					  u16 random_seed);
>> +
>> +void hantro_av1_generate_chroma_grain_block(s32 (*luma_grain_block)[73][82],
>> +					    s32 (*cb_grain_block)[38][44],
>> +					    s32 (*cr_grain_block)[38][44],
>> +					    s32 bitdepth,
>> +					    u8 num_y_points,
>> +					    u8 num_cb_points,
>> +					    u8 num_cr_points,
>> +					    s32 grain_scale_shift,
>> +					    s32 ar_coeff_lag,
>> +					    s32 (*ar_coeffs_cb)[25],
>> +					    s32 (*ar_coeffs_cr)[25],
>> +					    s32 ar_coeff_shift,
>> +					    s32 grain_min,
>> +					    s32 grain_max,
>> +					    u8 chroma_scaling_from_luma,
>> +					    u16 random_seed);
>> +
> I get a lot of checkpatch warnings of this type:
>
> WARNING: function definition argument 's32' should also have an identifier name
> #1205: FILE: drivers/media/platform/verisilicon/hantro_av1_filmgrain.h:16:
> +void hantro_av1_generate_luma_grain_block(s32 (*luma_grain_block)[73][82],
> Looking at how it is used in rockchip_vpu981_av1_dec_set_fgs() I think this
> can be done a lot easier if you add a new struct here containing those
> arrays. E.g.:
>
> struct hantro_av1_coeffs_grain_block {
>          s32 ar_coeffs_y[24];
>          s32 ar_coeffs_cb[25];
>          s32 ar_coeffs_cr[25];
>          s32 luma_grain_block[73][82];
>          s32 cb_grain_block[38][44];
>          s32 cr_grain_block[38][44];
> };
>
> Then in rockchip_vpu981_av1_dec_set_fgs you can just kzalloc that struct
> and pass it to these filmgrain functions.

I will do that.

>
> Also consider using #defines for the array sizes.

Chapter "7.18.3.3. Generate grain process" of AV1 spec doesn't define/name
these values so keep them like this make the code more easy to review with
the spec.

https://aomediacodec.github.io/av1-spec/#generate-grain-process

That said I'm always for naming values so good suggestion are welcome.

Thanks,
Benjamin

>
> If you decide not to use a struct, then you can at least change simply use
> 's32 luma_grain_block[73][82]' as arguments to these helper functions. There
> is no need to complicate the function prototypes.
>
> But I think creating a struct is a cleaner approach.
>
> Regards,
>
> 	Hans
>

