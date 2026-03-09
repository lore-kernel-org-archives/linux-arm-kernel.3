Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7DFF3C246
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 12:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0EeHDS9pwEYchJ5ftiuQwHQ2CFunSUH5KPHRIIlTEnM=; b=yJKrvQeqHQUvHn092UXmeBYMrP
	FHC5uSVWFUIL1EGetlMD8eC0hH/pi1OxPylAWdDDQRZS43/UiXWXj+zwYuli+W3TR1HCUFWWmq7uX
	d0Ff4/+l1QMeWpJ7dZ/KvTz6sWx7d3JAQvIUkjOGkKJz+d8VU5IZwrCp1cQwXfzHJpuwqQUfvuQ8M
	jDYh55D/t9OaYdac+0KWpyoRWvjFnpJ2DOHyt6EkEIAxG2p/0vFtZ3JXgjEP81hrGmDMVn9Wjh4Wr
	1kMuArJtVwkMpGRGu4+Cc7qaI51XDeF9V1oyaRdIPbTAS0EDu4RzzOfm+aSb0jlgYL8qHvbf4qRMa
	1OzIwYmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzaD6-00000007Lql-0bTX;
	Mon, 09 Mar 2026 12:59:48 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzaD1-00000007Lq8-3aey;
	Mon, 09 Mar 2026 12:59:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0EeHDS9pwEYchJ5ftiuQwHQ2CFunSUH5KPHRIIlTEnM=; b=mgeMygLnhvQeS3mPKdD3hx/qWQ
	sLcGXf87KPVRyEMdVOYEfgm5ViFqyvdyKonju3UlsZLND+E0oRyM0VVLKSBp4sGDvGNkCzKeGk0fL
	cUk0tACzvhN8DyTJxtZNf9jQptvcU0bvyna4LKlidDX/TFH3HO+/hE+40NeEjTtKsXrpg+7fXrsMD
	OpYwzwksoG8aFpLyJTukLRZtJyPO+eXaN9zKPIaZIavKMFJzr1Nx9cXwBg+qNuxUbNo9D5QsPbLz0
	j7QHNiL+6SAN4PAh++c39h7pNGZusxokk+/tOQc3SCvBar9cFMsnlajg2XCHk4OJ7hRvN70mLAp4P
	KoF7x77A==;
Received: from gwsc.sc.usp.br ([143.107.225.16] helo=[172.24.18.111])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1vzaCb-00C3Dx-SY; Mon, 09 Mar 2026 13:59:18 +0100
Message-ID: <f65f6e40-39f4-4744-bd92-46b38618c6f9@igalia.com>
Date: Mon, 9 Mar 2026 09:59:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] media: platform: Add Raspberry Pi HEVC decoder
 driver
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, John Cox
 <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>,
 review list <kernel-list@raspberrypi.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 John Cox <jc@kynesim.co.uk>, Stefan Wahren <wahrenst@gmx.net>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260304-media-rpi-hevc-dec-v6-0-93868ae6dff8@raspberrypi.com>
 <20260304-media-rpi-hevc-dec-v6-5-93868ae6dff8@raspberrypi.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <20260304-media-rpi-hevc-dec-v6-5-93868ae6dff8@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_055944_373481_7BCB4683 
X-CRM114-Status: GOOD (  27.55  )
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

Hi Dave,

On 3/4/26 11:05, Dave Stevenson wrote:
> From: John Cox <john.cox@raspberrypi.com>
> 
> The BCM2711 and BCM2712 SoCs used on Rapsberry Pi 4 and Raspberry

s/Rapsberry/Raspberry

> diff --git a/drivers/media/platform/raspberrypi/hevc_dec/Kconfig b/drivers/media/platform/raspberrypi/hevc_dec/Kconfig
> new file mode 100644
> index 000000000000..ae1fd079e5c9
> --- /dev/null
> +++ b/drivers/media/platform/raspberrypi/hevc_dec/Kconfig
> @@ -0,0 +1,17 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config VIDEO_RPI_HEVC_DEC
> +	tristate "Rasperry Pi HEVC decoder"

s/Rapsberry/Raspberry

> +	depends on VIDEO_DEV && VIDEO_DEV

VIDEO_DEV is listed twice.


[...]

> +
> +/*
> + * Stop the clock for this context
> + * clk_disable_unprepare does ref counting so this will not actually
> + * disable the clock if there are other running contexts
> + */
> +void hevc_d_hw_stop_clock(struct hevc_d_dev *dev)

I believe it would be more idiomatic if you use runtime PM to handle
this stop_clock()/start_clock() semantics.

> +{
> +	clk_disable_unprepare(dev->clock);

In the case that the clock is actually disabled (no other running
contexts), I believe the IRQs should be also disabled before disabling
the clock.

> +}
> +
> +/* Always starts the clock if it isn't already on this ctx */
> +int hevc_d_hw_start_clock(struct hevc_d_dev *dev)
> +{
> +	int rv;
> +
> +	rv = clk_set_min_rate(dev->clock, dev->max_clock_rate);
> +	if (rv) {
> +		dev_err(dev->dev, "Failed to set clock rate\n");
> +		return rv;
> +	}

After I land [1], you will be able to drop this call and just add
`maximize = true` to the HEVC clock.

[1] 
https://lore.kernel.org/dri-devel/20260218-v3d-power-management-v6-1-40683fd39865@igalia.com/

> +
> +	rv = clk_prepare_enable(dev->clock);
> +	if (rv) {
> +		dev_err(dev->dev, "Failed to enable clock\n");
> +		return rv;
> +	}

Considering that the clock was disabled, I believe you should re-enable
IRQs and reset any pending interrupts here, just like you do in
hw_setup().

> +	return 0;
> +}
> +

[...]

> diff --git a/drivers/media/platform/raspberrypi/hevc_dec/hevc_d_video.c b/drivers/media/platform/raspberrypi/hevc_dec/hevc_d_video.c
> new file mode 100644
> index 000000000000..d39a2e228595
> --- /dev/null
> +++ b/drivers/media/platform/raspberrypi/hevc_dec/hevc_d_video.c
> @@ -0,0 +1,634 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Raspberry Pi HEVC driver
> + *
> + * Copyright (C) 2026 Raspberry Pi Ltd
> + *
> + * Based on the Cedrus VPU driver, that is:
> + *
> + * Copyright (C) 2016 Florent Revest <florent.revest@free-electrons.com>
> + * Copyright (C) 2018 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> + * Copyright (C) 2018 Bootlin
> + */
> +
> +#include <media/videobuf2-dma-contig.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-mem2mem.h>
> +
> +#include "hevc_d.h"
> +#include "hevc_d_h265.h"
> +#include "hevc_d_hw.h"
> +#include "hevc_d_video.h"
> +
> +static inline struct hevc_d_ctx *hevc_d_file2ctx(struct file *file)
> +{
> +	return container_of(file->private_data, struct hevc_d_ctx, fh);
> +}
> +
> +/* constrain x to y,y*2 */
> +static inline unsigned int constrain2x(unsigned int x, unsigned int y)
> +{
> +	return (x < y) ?
> +			y :
> +			(x > y * 2) ? y : x;
> +}

constrain2x() doesn't seem to be used anywhere in the driver.

[...]

> +
> +void hevc_d_prepare_src_format(struct v4l2_pix_format_mplane *pix_fmt)
> +{
> +	size_t size;
> +	u32 w;
> +	u32 h;
> +
> +	w = pix_fmt->width;
> +	h = pix_fmt->height;
> +	if (!w || !h) {
> +		w = HEVC_D_DEFAULT_WIDTH;
> +		h = HEVC_D_DEFAULT_HEIGHT;
> +	}
> +	if (w > HEVC_D_MAX_WIDTH)
> +		w = HEVC_D_MAX_WIDTH;
> +	if (h > HEVC_D_MAX_HEIGHT)
> +		h = HEVC_D_MAX_HEIGHT;
> +
> +	if (!pix_fmt->plane_fmt[0].sizeimage ||
> +	    pix_fmt->plane_fmt[0].sizeimage > SZ_32M) {
> +		/* Unspecified or way too big - pick max for size */
> +		size = hevc_d_bit_buf_size(w, h, 2);
> +	}
> +	/* Set a minimum */
> +	size = max_t(u32, SZ_4K, pix_fmt->plane_fmt[0].sizeimage);

The size computed by hevc_d_bit_buf_size() inside the if-block is
immediately overwritten here unconditionally.

Should the else case be explicit? Something like:

     if (!pix_fmt->plane_fmt[0].sizeimage ||
         pix_fmt->plane_fmt[0].sizeimage > SZ_32M) {
         size = hevc_d_bit_buf_size(w, h, 2);
     } else {
         size = pix_fmt->plane_fmt[0].sizeimage;
     }
     size = max_t(u32, SZ_4K, size);

[...]

> +
> +static int hevc_d_start_streaming(struct vb2_queue *vq, unsigned int count)
> +{
> +	struct hevc_d_ctx *ctx = vb2_get_drv_priv(vq);
> +	struct hevc_d_dev *dev = ctx->dev;
> +	int ret = 0;
> +
> +	v4l2_m2m_update_start_streaming_state(ctx->fh.m2m_ctx, vq);
> +
> +	if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
> +		ret = hevc_d_hw_start_clock(dev);
> +		if (ret)
> +			goto fail_cleanup;
> +
> +		ret = hevc_d_h265_start(ctx);
> +		if (ret)
> +			goto fail_stop_clock;
> +	}
> +
> +	return 0;
> +
> +fail_stop_clock:
> +	hevc_d_hw_stop_clock(dev);
> +fail_cleanup:
> +	v4l2_err(&dev->v4l2_dev, "%s: qtype=%d: FAIL\n", __func__, vq->type);
> +	hevc_d_queue_cleanup(vq, VB2_BUF_STATE_QUEUED);
> +	return ret;
> +}
> +
> +static void hevc_d_stop_streaming(struct vb2_queue *vq)
> +{
> +	struct hevc_d_ctx *ctx = vb2_get_drv_priv(vq);
> +	struct hevc_d_dev *dev = ctx->dev;
> +
> +	if (V4L2_TYPE_IS_OUTPUT(vq->type)) {
> +		hevc_d_h265_stop(ctx);
> +		hevc_d_hw_stop_clock(dev);
> +	}
> +
> +	hevc_d_queue_cleanup(vq, VB2_BUF_STATE_ERROR);
> +
> +	vb2_wait_for_all_buffers(vq);
> +
> +	v4l2_m2m_update_stop_streaming_state(ctx->fh.m2m_ctx, vq);

The order here looks a bit odd to me. Shouldn't we stop the clock after
we stop the streaming state and wait for all buffers?

Best regards,
- Maíra

