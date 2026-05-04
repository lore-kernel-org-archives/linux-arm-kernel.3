Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B40FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 07:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mzg81K07bQM0Q/eMMvNNEb5hFXjGRpGjXv94vUsWpDI=; b=4Mljoat7JrK0hyoUOfXbQFzyfG
	87DMfln9Dy/VdobZrjBR0t6LSD8P0zXSSKWsM9/S0Npv+GbyipWYiCnX1sb1Hvdj75qUREcun0FAo
	IVzgubl3sJFLcQqZtw4OPvtqCVhiBAncuueM0Z1HUtQASVuNe7SrDGkpfw7SPfI/NptXqhDpxMKM0
	jVyGE8XFsO3Hm1GcSE/ILmCB2Q8ZJdGlxxS38PnRB9o8zHqoyjm8Gr0Fo/ClM5YeJW8qoTYQkPVh2
	9CmnIHAFH5Z3gvVF7D83ZhCmSoqFD+5S0bijrFfUC2P9PotCyz/G0qhn+FGZyXng1hN8nCYoPlFsS
	HvrKdM3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJnc2-0000000CapM-3NXS;
	Mon, 04 May 2026 07:21:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJnc0-0000000CaoV-33iQ;
	Mon, 04 May 2026 07:21:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B1346600C3;
	Mon,  4 May 2026 07:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58871C2BCB8;
	Mon,  4 May 2026 07:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777879263;
	bh=oxZ5xE3hnOgV2qemIIXx4AHL9CvGZqqSqt4lMVdq0y8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=P10dqKw85reUAS1+Xv6AphOAZ00jnttdCHGWLwTwEXxrIagE996uCJt/e7Ji0M9Gt
	 OQHzuzJgj4cyJqSgq0LZL/XDvo9ISxzU50XqNx7eGZcvCrz0fxa0rDBDPLslIP/GRx
	 eL9CGoBDCj2G9mownmCyJD/pUrdqfH3Vm0h4wujnUN2JQkkdE69flxZ0znMoUQF1Cd
	 YfCEyQHt+pvjJtExrKl1Sixzd5wGRLrsKgxG5SQfVgXllwzi5wjrs3P+pByqs96HL/
	 yaw+yY1LEfb3GYpblavn1f9PqLH7rbA9Ts/TJZ/TfN9xcSefVd4vXlxonbpT3+7zQa
	 Uj5SJdioX08Fg==
Message-ID: <8f29d271-da7d-4456-9427-2fb66136747a@kernel.org>
Date: Mon, 4 May 2026 09:20:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v3] media: verisilicon: Create AV1 helper library
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 nicolas.dufresne@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
 heiko@sntech.de
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20260415073801.58369-1-benjamin.gaignard@collabora.com>
Content-Language: en-US, nl
In-Reply-To: <20260415073801.58369-1-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi Benjamin,

I have a few comments about this:

On 15/04/2026 09:38, Benjamin Gaignard wrote:
> Regroup all none hardware related AV1 functions into a helper library.
> The goal is to avoid code duplication for futur AV1 codecs.

futur -> future

> 
> Tested on rock 5b board Fluster score remains the same 204/241.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
> changes in version 3:
>  - Remove useless wrapper functions.
> 
>  drivers/media/platform/verisilicon/Makefile   |   7 +-
>  .../media/platform/verisilicon/hantro_av1.c   | 780 +++++++++++++++
>  .../media/platform/verisilicon/hantro_av1.h   |  62 ++
>  ...entropymode.c => hantro_av1_entropymode.c} |  18 +-
>  ...entropymode.h => hantro_av1_entropymode.h} |  18 +-
>  ...av1_filmgrain.c => hantro_av1_filmgrain.c} |  82 +-
>  .../verisilicon/hantro_av1_filmgrain.h        |  44 +
>  .../media/platform/verisilicon/hantro_hw.h    |   7 +-
>  .../verisilicon/rockchip_av1_filmgrain.h      |  36 -
>  .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 935 ++----------------
>  .../platform/verisilicon/rockchip_vpu_hw.c    |   7 +-
>  11 files changed, 1041 insertions(+), 955 deletions(-)
>  create mode 100644 drivers/media/platform/verisilicon/hantro_av1.c
>  create mode 100644 drivers/media/platform/verisilicon/hantro_av1.h
>  rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode.c => hantro_av1_entropymode.c} (99%)
>  rename drivers/media/platform/verisilicon/{rockchip_av1_entropymode.h => hantro_av1_entropymode.h} (95%)
>  rename drivers/media/platform/verisilicon/{rockchip_av1_filmgrain.c => hantro_av1_filmgrain.c} (92%)
>  create mode 100644 drivers/media/platform/verisilicon/hantro_av1_filmgrain.h
>  delete mode 100644 drivers/media/platform/verisilicon/rockchip_av1_filmgrain.h
> 

<snip>

> diff --git a/drivers/media/platform/verisilicon/hantro_av1.c b/drivers/media/platform/verisilicon/hantro_av1.c
> new file mode 100644
> index 000000000000..5a51ac877c9c
> --- /dev/null
> +++ b/drivers/media/platform/verisilicon/hantro_av1.c
> @@ -0,0 +1,780 @@

<snip>

> +
> +int hantro_av1_tile_log2(int target)
> +{
> +	int k;
> +
> +	/*
> +	 * returns the smallest value for k such that 1 << k is greater
> +	 * than or equal to target
> +	 */
> +	for (k = 0; (1 << k) < target; k++);

Checkpatch gives:

ERROR: trailing statements should be on next line
#637: FILE: drivers/media/platform/verisilicon/hantro_av1.c:568:
+       for (k = 0; (1 << k) < target; k++);

Just move the ';' to the next line.

> +
> +	return k;
> +}
> +

<snip>

> diff --git a/drivers/media/platform/verisilicon/hantro_av1_filmgrain.h b/drivers/media/platform/verisilicon/hantro_av1_filmgrain.h
> new file mode 100644
> index 000000000000..5593e84114d0
> --- /dev/null
> +++ b/drivers/media/platform/verisilicon/hantro_av1_filmgrain.h
> @@ -0,0 +1,44 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef _HANTRO_AV1_FILMGRAIN_H_
> +#define _HANTRO_AV1_FILMGRAIN_H_
> +
> +#include <linux/types.h>
> +
> +struct hantro_av1_film_grain {
> +	u8 scaling_lut_y[256];
> +	u8 scaling_lut_cb[256];
> +	u8 scaling_lut_cr[256];
> +	s16 cropped_luma_grain_block[4096];
> +	s16 cropped_chroma_grain_block[1024 * 2];
> +};

This struct is not used in hantro_av1_filmgrain.c/h.

Does this belong here?

> +
> +void hantro_av1_generate_luma_grain_block(s32 (*luma_grain_block)[73][82],
> +					  s32 bitdepth,
> +					  u8 num_y_points,
> +					  s32 grain_scale_shift,
> +					  s32 ar_coeff_lag,
> +					  s32 (*ar_coeffs_y)[24],
> +					  s32 ar_coeff_shift,
> +					  s32 grain_min,
> +					  s32 grain_max,
> +					  u16 random_seed);
> +
> +void hantro_av1_generate_chroma_grain_block(s32 (*luma_grain_block)[73][82],
> +					    s32 (*cb_grain_block)[38][44],
> +					    s32 (*cr_grain_block)[38][44],
> +					    s32 bitdepth,
> +					    u8 num_y_points,
> +					    u8 num_cb_points,
> +					    u8 num_cr_points,
> +					    s32 grain_scale_shift,
> +					    s32 ar_coeff_lag,
> +					    s32 (*ar_coeffs_cb)[25],
> +					    s32 (*ar_coeffs_cr)[25],
> +					    s32 ar_coeff_shift,
> +					    s32 grain_min,
> +					    s32 grain_max,
> +					    u8 chroma_scaling_from_luma,
> +					    u16 random_seed);
> +

I get a lot of checkpatch warnings of this type:

WARNING: function definition argument 's32' should also have an identifier name
#1205: FILE: drivers/media/platform/verisilicon/hantro_av1_filmgrain.h:16:
+void hantro_av1_generate_luma_grain_block(s32 (*luma_grain_block)[73][82],
Looking at how it is used in rockchip_vpu981_av1_dec_set_fgs() I think this
can be done a lot easier if you add a new struct here containing those
arrays. E.g.:

struct hantro_av1_coeffs_grain_block {
        s32 ar_coeffs_y[24];
        s32 ar_coeffs_cb[25];
        s32 ar_coeffs_cr[25];
        s32 luma_grain_block[73][82];
        s32 cb_grain_block[38][44];
        s32 cr_grain_block[38][44];
};

Then in rockchip_vpu981_av1_dec_set_fgs you can just kzalloc that struct
and pass it to these filmgrain functions.

Also consider using #defines for the array sizes.

If you decide not to use a struct, then you can at least change simply use
's32 luma_grain_block[73][82]' as arguments to these helper functions. There
is no need to complicate the function prototypes.

But I think creating a struct is a cleaner approach.

Regards,

	Hans

