Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F16C624C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 13:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wArFzoZJHCD5tyP0z0kAyoMYSQAbmXhqmGz8w8dfwM=; b=Epw5pahvVSwMhppqe28NANzjUK
	R7t9COioP6egg5JlvH2d+xGmjH0IDhaFS4fUKC6sh+jEtQA4DWTTb6NqR5HVQ3ZBqNs8nYF9kBe+W
	fnnolFvUMLHM9ZctV+pWoffWm09Q9DVs5tetuw6ESXPtbNCNioyXqiA+ON0+tYc1nP+9z1iIDb6cm
	ZXRyzn5wD84yZuvK4qIp5YKr8a0HMAXfBHQmqkj6obs7fWgaOgf6mSutL1pueOW9fD89JQbESfehc
	66AKXl8kNzfU/V5YlDQtXOYBkKHRLXGvO2q+Ds8/KdaTpnThyKy3afh6AaOR8XrWQKi6GsnSEcmYi
	Yj61GTAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12KF-00000009VDA-1p6D;
	Mon, 31 Aug 2026 13:45:27 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12KC-00000009VBr-2Rto
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 13:45:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788183924; x=1819719924;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=iJE3knD8GZpNzW3zg5su/vA3JNJNn8xjodGntYeADPc=;
  b=BuQqieOZZxrOSxBwNwkhSYrGnrDoH1KXjzfVA/WBPMxG22qJ7K7FJy+d
   YAtU6YHH4gPw5xKaDM8vugAyHRLQ3x7aOXkGXLm0uTqXRKVYijevuo+bZ
   2UFiZ+mRXgcmz7MJ7bltrX988Mk1ObIVkY24lLqa3/yWcEK/Nen791Gj3
   ssN/QwMY0WKoZcKVK52bzkomJUn6jBDRps2EDPbtg97AaT17fgwFvcx7+
   CW43F5DvnRQRbwTxK3GepRkFhSOfJbt16eFDkHy5uR1x+q7Q4bnpLEQos
   RcJx+40/bhdE9ZgInWWDuXrp5f6XcIpYIfW4chDy+LwyKV5Z/g/x0nvHO
   w==;
X-CSE-ConnectionGUID: 17w+9wwCQ32sOufTT/o5CA==
X-CSE-MsgGUID: haAEeT8hSfyKQRTXAoYBUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="114129499"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="114129499"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 06:45:22 -0700
X-CSE-ConnectionGUID: 8jytYmUyR0S7PAi1zuNgxw==
X-CSE-MsgGUID: YDMavWC2Tn2LTkRLkvF7YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="293632864"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.21])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 06:45:17 -0700
Date: Mon, 31 Aug 2026 16:45:15 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-spi@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	=?iso-8859-1?Q?Am=E9lie?= Delaunay <amelie.delaunay@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 1/9] dmaengine: Support bus widths of 32 bytes and
 above
Message-ID: <apWFa4BFoAL2AhG3@ashevche-desk.local>
References: <20260831-dmaengine-support-wider-dma-masks-v3-0-507d97496f2d@analog.com>
 <20260831-dmaengine-support-wider-dma-masks-v3-1-507d97496f2d@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260831-dmaengine-support-wider-dma-masks-v3-1-507d97496f2d@analog.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_064524_679296_8650DED1 
X-CRM114-Status: GOOD (  29.86  )
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

On Mon, Aug 31, 2026 at 12:46:38PM +0100, Nuno Sá wrote:
> The src_addr_widths and dst_addr_widths capability masks encode each
> supported width as a bit whose position equals the corresponding
> enum dma_slave_buswidth value (e.g. DMA_SLAVE_BUSWIDTH_4_BYTES sets bit
> 4). As these masks are plain u32, widths of 32 bytes and above
> (DMA_SLAVE_BUSWIDTH_32/64/128_BYTES map to bits 32, 64 and 128) cannot
> be represented at all.
> 
> Introduce bitmap-based bus width capabilities that span the full enum
> range, through a new dma_buswidth_mask_t type modeled after
> dma_cap_mask_t. To allow DMA controller drivers to be converted
> incrementally, the legacy dma_device u32 fields are kept alongside the
> new masks and the core folds a legacy-only driver's u32 into the mask
> when the device is registered, so consumers only ever have to look at
> the mask.
> 
> The new interface lives in two new headers under a new
> include/linux/dma/engine/ directory instead of growing
> linux/dmaengine.h, which is included nearly everywhere:
> 
>  - dma/engine/types.h holds enum dma_slave_buswidth and the new
>    dma_buswidth_mask_t type. Like dma_cap_mask_t, the type only needs
>    DECLARE_BITMAP();
> 
>  - dma/engine/widthmask.h holds the accessors which are based on the new
>    dma_buswidth_mask_t type. This gives us freedom to change the core
>    without affecting consumers as they only see (and should only use) the
>    new type.
> 
> Note the fold only has to happen in one direction on the producer side:
> nothing outside a controller driver reads the legacy dma_device fields,
> so a converted driver's mask is not mirrored back into them. The legacy
> dma_slave_caps fields are different, as consumers not converted yet
> still read them: dma_get_slave_caps() derives them from the mask when a
> device_caps() callback adjusted it. Both go away with the legacy fields.

...

>  F:	drivers/dma/
>  F:	include/dt-bindings/dma/
>  F:	include/linux/dma/
> +F:	include/linux/dma/engine/
>  F:	include/linux/dmaengine.h
>  F:	include/linux/of_dma.h

Unneeded, previous entry includes recursively.

...

> +/*
> + * Basic types shared by the DMA engine interfaces.
> + */
> +#ifndef LINUX_DMA_ENGINE_TYPES_H
> +#define LINUX_DMA_ENGINE_TYPES_H
> +
> +#include <linux/bitops.h>

Not yet? Perhaps next changes will use it, then they can add it.

> +#include <linux/types.h>
> +
> +/**
> + * enum dma_slave_buswidth - defines bus width of the DMA slave
> + * device, source or target buses

I would describe the _UNDEFINED case, it might require some clarification on
what behaviour is to expect with this one.

> + */

> +enum dma_slave_buswidth {
> +	DMA_SLAVE_BUSWIDTH_UNDEFINED = 0,
> +	DMA_SLAVE_BUSWIDTH_1_BYTE = 1,
> +	DMA_SLAVE_BUSWIDTH_2_BYTES = 2,
> +	DMA_SLAVE_BUSWIDTH_3_BYTES = 3,
> +	DMA_SLAVE_BUSWIDTH_4_BYTES = 4,
> +	DMA_SLAVE_BUSWIDTH_8_BYTES = 8,
> +	DMA_SLAVE_BUSWIDTH_16_BYTES = 16,
> +	DMA_SLAVE_BUSWIDTH_32_BYTES = 32,
> +	DMA_SLAVE_BUSWIDTH_64_BYTES = 64,
> +	DMA_SLAVE_BUSWIDTH_128_BYTES = 128,
> +	DMA_SLAVE_BUSWIDTH_MAX
> +};

> +/**
> + * typedef dma_buswidth_mask_t - bus width capabilities bitmap modeled after
> + * dma_cap_mask_t.
> + *
> + * Each supported bus width is represented by the bit whose position equals the
> + * corresponding enum dma_slave_buswidth value, e.g. a device supporting a bus
> + * width of 4 bytes has bit 4 set.
> + */
> +typedef struct {
> +	DECLARE_BITMAP(bits, DMA_SLAVE_BUSWIDTH_MAX);
> +} dma_buswidth_mask_t;
> +
> +#endif /* LINUX_DMA_ENGINE_TYPES_H */

...

> +/*
> + * Bus width capabilities of DMA engine devices and channels.
> + */
> +#ifndef LINUX_DMA_ENGINE_WIDTHMASK_H
> +#define LINUX_DMA_ENGINE_WIDTHMASK_H
> +
> +#include <linux/bitmap.h>
> +#include <linux/dma/engine/types.h>

+ errno.h

> +#include <linux/types.h>

I would group subsystem ones.

#include <linux/bitmap.h>
#include <linux/errno.h>
#include <linux/types.h>

#include <linux/dma/engine/types.h>

...

> +static inline enum dma_slave_buswidth
> +__dma_bus_width_min(const dma_buswidth_mask_t *mask)
> +{
> +	enum dma_slave_buswidth width = find_first_bit(mask->bits,
> +						       DMA_SLAVE_BUSWIDTH_MAX);
> +

For easier maintenance better to split the assignment.

	enum dma_slave_buswidth width;

	width = find_first_bit(mask->bits, DMA_SLAVE_BUSWIDTH_MAX);

> +	if (width == DMA_SLAVE_BUSWIDTH_MAX)
> +		return DMA_SLAVE_BUSWIDTH_UNDEFINED;
> +
> +	return width;
> +}

...

>  #ifndef LINUX_DMAENGINE_H
>  #define LINUX_DMAENGINE_H
>  
> +#include <linux/bitops.h>
>  #include <linux/device.h>

> +#include <linux/dma/engine/types.h>

Same, group them after generic linux/*.h.

>  #include <linux/err.h>
>  #include <linux/uio.h>
>  #include <linux/bug.h>

...

It's possible to split this patch to two:
- move the existing type into a new types.h header
- add support for the new API

-- 
With Best Regards,
Andy Shevchenko



