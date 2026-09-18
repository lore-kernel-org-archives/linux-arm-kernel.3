Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04178C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SUk0QaHaOHcefy3cF34cxRQ5NlHqBn6AdrcK4LTyzD0=; b=NuPB2IHcwWmLGJqt7Idv7ArZHh
	4HC59Z+ch8DP+VTL3icT1C7jEDoPt4uLBPBF0wMKxWS9eeNnsIO8m1Tvb//dC8RilZXh0Hcqnz+y7
	kJqSLBVzXkD4z0bnJMCIRAz9schSztx0CyKU/O430YOyUZV+qZs711gHCqSOnyvBji242b7mz41P7
	tmUBQclywUZRQatSNReCj5nIlM92Tx0xiCd9Fjbgu6X/HijCJOjd7yA+HAXURt/RD+3710ML/hJEz
	jj1WHt/gTxQ0+LKrxXfyXcNq0HPHK+KOMYIVtvvFetQS5AlTDUsxr8o1HYyzvjd6pJ8/xFqhJhnBG
	OS8aGprw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YJX-0000000ERXV-3cCx;
	Fri, 18 Sep 2026 13:07:39 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YJV-0000000ERX1-2tYd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:07:39 +0000
Message-ID: <bca0facb-8840-4691-aebc-e3063c6c3d14@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1789736850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SUk0QaHaOHcefy3cF34cxRQ5NlHqBn6AdrcK4LTyzD0=;
	b=YhQgO8y9BMFmml0KZlH0FT3AzNCrA9YHyuNWujznrpuMnz1ALgUCyFNCQ8kHqjn9e3LP1W
	C5qUW5G85qOui0zY9hOqpaMHc7EvyGHSn3yeHxWUIbU8xYCU7D/G7VTfm7soeMTiaukDR6
	qvQmbtZSe39IrGiLUQtLtTiEuaJwd+4=
Date: Fri, 18 Sep 2026 15:07:22 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 05/10] mailbox: apple: Add DockChannel FIFO controller
To: michael.reeves077@gmail.com, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 iommu@lists.linux.dev, linux-input@vger.kernel.org,
 Yureka Lilian <yureka@cyberchaos.dev>, Julian Braha <julianbraha@gmail.com>,
 Sasha Finkelstein <k@chaosmail.tech>
References: <20260918-apple-mtp-keyboard-final-v2-0-a5c685e50b60@gmail.com>
 <20260918-apple-mtp-keyboard-final-v2-5-a5c685e50b60@gmail.com>
Content-Language: en-US
From: Yureka Lilian <yureka@cyberchaos.dev>
In-Reply-To: <20260918-apple-mtp-keyboard-final-v2-5-a5c685e50b60@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_060737_971985_44F89A57 
X-CRM114-Status: GOOD (  22.36  )
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

On 9/18/26 13:06, Michael Reeves via B4 Relay wrote:
> From: Michael Reeves <michael.reeves077@gmail.com>
>
> DockChannel is a hardware FIFO used by Apple coprocessors for
> low-latency byte-stream communication with the AP.
>
> Add a mailbox controller that preallocates RX storage, tracks IRQ
> enable state in software, and reports TX completion from the TX-empty
> interrupt.
>
> Reject messages larger than the FIFO and return -EBUSY while the
> previous message is still pending. This keeps the provider usable for
> future small-message clients such as serial transports without a TX
> worker.
>
> Handle RX and TX interrupts in a thread so mailbox callbacks and locking
> run outside hard-IRQ context.
>
> Co-developed-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>   MAINTAINERS                               |   2 +
>   drivers/mailbox/Kconfig                   |  12 +
>   drivers/mailbox/Makefile                  |   2 +
>   drivers/mailbox/apple-dockchannel.c       | 371 ++++++++++++++++++++++++++++++
>   include/linux/mailbox/apple-dockchannel.h |  29 +++
>   5 files changed, 416 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7fe2ebb5e..e5be5934c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2677,6 +2677,7 @@ F:	drivers/input/touchscreen/apple_z2.c
>   F:	drivers/iommu/apple-dart.c
>   F:	drivers/iommu/io-pgtable-dart.c
>   F:	drivers/irqchip/irq-apple-aic.c
> +F:	drivers/mailbox/apple-dockchannel.c
>   F:	drivers/mfd/macsmc.c
>   F:	drivers/nvme/host/apple.c
>   F:	drivers/nvmem/apple-efuses.c
> @@ -2695,6 +2696,7 @@ F:	drivers/video/backlight/apple_dwi_bl.c
>   F:	drivers/watchdog/apple_wdt.c
>   F:	include/dt-bindings/interrupt-controller/apple-aic.h
>   F:	include/dt-bindings/pinctrl/apple.h
> +F:	include/linux/mailbox/apple-dockchannel.h
>   F:	include/linux/mfd/macsmc.h
>   F:	include/linux/soc/apple/*
>   F:	include/uapi/drm/asahi_drm.h
> [...]
> diff --git a/drivers/mailbox/apple-dockchannel.c b/drivers/mailbox/apple-dockchannel.c
> new file mode 100644
> index 000000000..d0a66e1b7
> --- /dev/null
> +++ b/drivers/mailbox/apple-dockchannel.c
> @@ -0,0 +1,371 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Apple DockChannel mailbox controller
> + *
> + * Copyright The Asahi Linux Contributors
> + *
> + * DockChannel is a byte FIFO used by Apple co-processors. This driver exposes a
> + * single FIFO pair as a Linux mailbox channel and moves payload bytes with PIO.
> + * There is no DMA involved, so relaxed MMIO accessors are sufficient for the
> + * FIFO accesses themselves.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/mailbox/apple-dockchannel.h>
> +#include <linux/mailbox_controller.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>
> +#include <linux/unaligned.h>
> +
> +#define APPLE_DOCKCHANNEL_FIFO_SIZE	0x800
> +
> +#define IRQ_MASK			0x0
> +#define IRQ_FLAG			0x4
> +
> +#define IRQ_TX				BIT(2)
> +#define IRQ_RX				BIT(3)

The dockchannel interface used for dockchannel-uart / DebugUSB uses 
different bits here, so these should probably be read from the device 
tree if the mailbox driver is supposed to be somewhat generic.

> [...]

