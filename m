Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47832C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 17:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6LzPtIIW390IfDZsFUle5+Dt63UP/YsqHxRNSLptijc=; b=hzTpplVCZWArlFy0mqVU+ylBQB
	JPnhEu7bWkf9HV4YsiS8UFu4NvuV09cx0rCxDkmvs6eYV0US6lZ0Fb3XR75jpeD2K/f5mBR6RAvWi
	ClGWuHqA2Rz+w21lRHavQtntwbhIazTP35VHfntXrmN+XoPKQc3FaeWdyKRWjbNKiygJSI1r2dZRn
	+GLcqwoC7OiqM0x8hYqMIe6qiIG8Wr/9kPYAA6vWRxhqf3+MAycLROqEI9UfzPfCZOSoxGtNntQjd
	oT3vuARmC51iKn41QAD3aDW9Hb9nGeBvSR29eqzHYDF1RSQDi2xkhTxOkgdliUydRiXOxdadTPZZZ
	0dhQy+Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuZGz-00000001IRV-1Ij3;
	Thu, 13 Aug 2026 17:31:21 +0000
Received: from mail-ot1-x362.google.com ([2607:f8b0:4864:20::362])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuZGx-00000001IQI-03kh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 17:31:20 +0000
Received: by mail-ot1-x362.google.com with SMTP id 46e09a7af769-7ee37dc91f5so136819a34.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 10:31:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786642277; x=1787247077;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6LzPtIIW390IfDZsFUle5+Dt63UP/YsqHxRNSLptijc=;
        b=Mfv5nP9w9DtjXmtijGVGrGVQNJqGIOzhQO5oCnR0859/vK9W/T0u1VfeqTe7ZaDPuB
         2fk0eMk1+Lb9y3GS6/dXdLPIqlwGWxl6xknfYHFSoQRK0FQrvan431RRkQWMNGjF33KQ
         A/fCk5KQEyqi3Yb489HIa45EgHvhiIYohpUqK0WutYfxJsTNz7tItpi8YTChCvMLFECM
         Ve+/3YgXcBD1OMSwBlVvcUwR8GzcZ4oaqdlO/jUKM6ELvH8OaxPuaTnRY+TRWqt9WLlf
         dsJSqJTRKeTchaij0qsKyyE0N/ZbhlAy0/JCC2SdcDhfjStLEvNdNj7Jm/2UtW3HZzpq
         r8nw==
X-Gm-Message-State: AOJu0YyHcOzsg9C/UOeyotneJLkXTva6V8t/bS7hzgWeT/hkDSGomfje
	TOmH4YwtY9RGz01JmijlSVm/YK2x1wvUGZvEdaUdDZUGtNaZ0HE2QG7hD7YzHhie/hII29Dduy/
	CvsNW6h3rvR+kdzL0xdcaXPq68CIf2XgnmMdGcc12je0e0Zy62PSjnJOpk/rVWF6/HhpKliJYrA
	LZ1gCjOMhcL1ZYWFhWyW5K0zQa/VAQ16+rD4oLEGJJXqTh5uEvae0nw/FfV5Bpe3rBv/tkmi6/4
	MyIvl9tkzmQtH96IhH3ewWDxHy7mnHEpbE=
X-Gm-Gg: AR+sD10Mrfo9HAXc4EK+SHXoLlFY81kiUQ7x9UsrcHlo40Pslg+L70xDDGnMsDnSC8l
	hmCS/3hZRwdTWgeRTRKWvEqdXbN3jXg7mLGcSINC/+Zd4Uk21WMus2IfMMDDCFzAKiZHGcT5TCg
	I9iFN3yI9g316yJuVoS0Tri/4cQBndWDbBY2rRU7VTfSGS7aMP+LTOVnze5XGY6O7ISyKf1FH6c
	fnbxGYuqw0IqFBkP5j8N6F5pIaFSzWnCaJ/xROyU/LeUFr0DZuqDEiYZZiAaSgMr/MIPpFroqw7
	u0eDpFefzPwT5YzcfeHTjBthW2oeYAILOM7wMBDLgQWCchNSjopQFSyKDEROZxYzsde4UkDV5t5
	NypjfPDKtFZi6Rh0PeIhLLpWmPNbWYuOMmla6hEJ/gmdFj4xs6lvxCMoBuRFnHqI51u+vXKqxRZ
	ZCaldpet/ZBaC9BQQwDHMIq761EREZiFABhc5AT1Yj
X-Received: by 2002:a05:6830:924:b0:7e9:e313:4fdb with SMTP id 46e09a7af769-7f3ca4dd59bmr6830395a34.2.1786642276604;
        Thu, 13 Aug 2026 10:31:16 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-7f3c9e2abf1sm381335a34.8.2026.08.13.10.31.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Aug 2026 10:31:16 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92efd2ca21aso21937585a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 10:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1786642275; x=1787247075; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LzPtIIW390IfDZsFUle5+Dt63UP/YsqHxRNSLptijc=;
        b=DaSLBU9elcxsfhsJxhbjjq3+5xIOLs889auojMd9lWBiVv/A8HdhJiuQXWG26BOxd3
         7Hi6Ln8GrkenlSWDmRfNqbikQXuc2JReljupDbzqKOcME4mP27/GA/Yge1kjO8QVIOMr
         LTsNaLq8Rg55ToPGmPVAhL8N31YGL07mV9drA=
X-Received: by 2002:a05:620a:3903:b0:92e:4470:f6a7 with SMTP id af79cd13be357-936bf8c6615mr787253585a.10.1786642275084;
        Thu, 13 Aug 2026 10:31:15 -0700 (PDT)
X-Received: by 2002:a05:620a:3903:b0:92e:4470:f6a7 with SMTP id af79cd13be357-936bf8c6615mr787243585a.10.1786642274455;
        Thu, 13 Aug 2026 10:31:14 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-936ce1e694fsm30634585a.28.2026.08.13.10.31.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 10:31:13 -0700 (PDT)
Message-ID: <700339f2-765f-4b2d-a80d-bd0a6822f91b@broadcom.com>
Date: Thu, 13 Aug 2026 10:31:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: perf: Add Raspberry Pi BCM2835 AXI PMU driver
To: Ian Rogers <irogers@google.com>, linux-perf-users@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, u.kleine-koenig@baylibre.com, will@kernel.org
References: <20260813064228.2799872-1-irogers@google.com>
 <cover.1691900000.git.irogers@google.com>
 <20260813073050.2823657-1-irogers@google.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20260813073050.2823657-1-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_103119_132388_6500D02E 
X-CRM114-Status: GOOD (  29.48  )
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

On 8/13/26 00:30, Ian Rogers wrote:
> This commit adds a new performance monitoring driver for the Raspberry Pi
> AXI bus (BCM2835/2711), exposing system-level and VideoCore PMU hardware to
> the Linux perf subsystem.
> 
> Note on out-of-tree macro compatibility:
> The inclusion of #if LINUX_VERSION_CODE < KERNEL_VERSION(6, 13, 0)
> surrounding hrtimer_setup is intentionally maintained alongside
> this patch to guarantee seamless out-of-tree compilation fallback
> compatibility for Raspberry Pi Long Term Support (LTS) kernel variants.

Upstream does not care about that, I appreciate the thought and mention, 
but that's a backporting job to ensure it works.

> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>   drivers/perf/rpi_axi_pmu.c | 2456 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 2456 insertions(+)
>   create mode 100644 drivers/perf/rpi_axi_pmu.c
> 
> diff --git a/drivers/perf/rpi_axi_pmu.c b/drivers/perf/rpi_axi_pmu.c
> new file mode 100644
> index 000000000000..d8efc8bb205f
> --- /dev/null
> +++ b/drivers/perf/rpi_axi_pmu.c
> @@ -0,0 +1,2456 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/**
> + * DOC: Raspberry Pi AXI Bus Performance Monitoring Unit (PMU) Driver
> + *
> + * This driver exposes the performance monitoring hardware on Raspberry Pi
> + * System-on-Chips to the Linux perf subsystem:
> + * - Raspberry Pi 1, 2, 3, 4, Compute Modules 1-4, Zero, Zero W (SoCs BCM2835/2836/2837/2711).
> + *
> + * Architecture Overview:
> + * ----------------------
> + * The Broadcom AXI performance hardware provides up to two independent monitors:
> + * 1. System Monitor (MON__SYSTEM = 0):
> + *    Monitors system-level AXI traffic (ARM CPU L2/UC, DMA, V3D, ISP, HVS, PCIe/RP1).
> + *    Directly memory-mapped via ARM physical IO memory space (MMIO).
> + *    Read latency: ~10-20 nanoseconds (fast, atomic-safe, non-blocking).
> + *
> + * 2. VPU Monitor (MON__VPU = 1):
> + *    Monitors VideoCore VPU buses (VPU0/1 Data/Instruction L2/UC, SDRAM, etc.).
> + *    Accessible through VideoCore firmware mailbox IPC (RPI_FIRMWARE_SET/GET_PERIPH_REG).
> + *    Read latency: ~10-100 microseconds (IPC over VPU mailbox).
> + *
> + * Synchronization & Concurrency Model:
> + * ------------------------------------
> + * - Spinlock (pmu->lock):
> + *   Protects active event array (events[]), event generation sequence counters (event_gen[]),
> + *   bus watcher allocation/refcounting, active_vpu_events counter, and MMIO register updates
> + *   (MON__SYSTEM) against SMP race conditions and ABA pointer recycling races.
> + *
> + * - Mutex (pmu->vpu_mutex):
> + *   Serializes VideoCore Mailbox IPC transactions (MON__VPU) in process context,
> + *   preventing concurrent mailbox buffer corruption across multiple CPUs.
> + *
> + * - Cached Async VPU Reads & Multiplexing (MON__VPU):
> + *   Polled periodically in process context by vpu_work when active_vpu_events > 0.
> + *   Uses PERF_HES_UPTODATE state flag to safely establish counter baselines during
> + *   event rotation / multiplexing. User read() syscalls return cached cumulative event counter
> + *   instantly without blocking.
> + */

The patch description needs to go into details as to why both the MMIO 
and firmware interfaces are supported. The firmware interface requires 
you to play games with sleeping/non-sleeping context, I would really 
want to avoid that and just support the MMIO path exclusively, is that 
practical? If that means ditching support for Pi 1&2, that would be 
reasonable IMHO.

> +
> +#include <linux/cpuhotplug.h>
> +#include <linux/cpumask.h>
> +#include <linux/hrtimer.h>
> +#include <linux/io.h>
> +#include <linux/version.h>
> +
> +#if LINUX_VERSION_CODE < KERNEL_VERSION(6, 13, 0)
> +static inline void rpi_hrtimer_setup(struct hrtimer *timer,
> +				     enum hrtimer_restart (*function)(struct hrtimer *),
> +				     clockid_t clock_id, enum hrtimer_mode mode)
> +{
> +	hrtimer_init(timer, clock_id, mode);
> +	timer->function = function;
> +}
> +#define hrtimer_setup rpi_hrtimer_setup
 > +#endif> +#include <linux/lockdep.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/perf_event.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>
> +#include <linux/sysfs.h>
> +#include <linux/vmalloc.h>
> +#include <linux/workqueue.h>
> +
> +#include <soc/bcm2835/raspberrypi-firmware.h>
> +
> +/* --- PLATFORM CONSTANTS & ENUMERATIONS --------------------------- */
> +
> +/**
> + * enum rpi_axi_chip - Supported Broadcom SoC generations
> + * @CHIP_BCM2835: BCM2835 / BCM2836 / BCM2837 / BCM2711 (RPi 1-4, CM 1-4, Zero/W)
> + */
> +enum rpi_axi_chip {
> +	CHIP_BCM2835 = 0,
> +};
> +
> +enum monitor {
> +	MON__SYSTEM = 0,
> +	MON__VPU,
> +	MON__MAX
> +};
> +
> +/* Number of hardware bus watcher units per monitor */
> +#define NUM_BUS_WATCHERS_PER_MONITOR 3
> +
> +/**
> + * enum bcm2835_system_bus - AXI buses monitored by System Monitor on BCM2835-BCM2711 (RPi 1-4)
> + * @BCM2835_SB__DMA_L2: DMA engine L2 cache interconnect bus

Why the double underscore in the naming convention?

[snip]

> +
> +/* Hardware register offsets & control bitwise constants */
> +#define GEN_CTRL			0x00
> +#define GEN_CTL_ENABLE_BIT		BIT(0)
> +#define GEN_CTL_RESET_BIT		BIT(1)
> +#define GEN_CTL_WATCH_BIT		BIT(2)
> +
> +#define BW_PITCH			0x40

Rather than pitch, maybe stride?

> +#define BW0_CTRL			0x40
> +#define BW1_CTRL			0x80
> +#define BW2_CTRL			0xc0
> +
> +#define BW_ATRANS_OFFSET		0x04

That's confusing, so you are offsetting from the base of BW0_CTRL, that 
needs a comment to explain that offset choice.

> +#define BW_ATWAIT_OFFSET		0x08
> +#define BW_AMAX_OFFSET			0x0c
> +#define BW_WTRANS_OFFSET		0x10
> +#define BW_WTWAIT_OFFSET		0x14
> +#define BW_WMAX_OFFSET			0x18
> +#define BW_RTRANS_OFFSET		0x1c
> +#define BW_RTWAIT_OFFSET		0x20
> +#define BW_RMAX_OFFSET			0x24
> +
> +#define BW_CTRL_RESET_BIT		BIT(31)
> +#define BW_CTRL_ENABLE_BIT		BIT(30)
> +#define BW_CTRL_ENABLE_ID_FILTER_BIT	BIT(29)
> +#define BW_CTRL_LIMIT_HALT_BIT		BIT(28)
> +
> +#define BW_CTRL_BUS_WATCH_SHIFT		0
> +#define BW_CTRL_BUS_WATCH_MASK		GENMASK(5, 0)
> +#define BW_CTRL_BUS_FILTER_SHIFT	8
> +#define BW_CTRL_BUS_FILTER_MASK		GENMASK(12, 8)
> +
> +/*
> + * RPI_AXI_PMU_TIMER_INTERVAL determines the background polling frequency
> + * for VideoCore VPU Mailbox IPC counters.
> + *
> + * A balance is required:
> + * - IPC Overhead: Polling overly fast (e.g., 10ms) generates excessive CPU
> + *   wakeups and VideoCore IPC interrupts on older CPUs (Pi 1/2).
> + * - Accuracy: Polling overly slow (e.g., 2000ms) causes short time-multiplexed
> + *   profiling sessions (under the interval) to mathematically strand residual
> + *   counts since the mailbox cannot be queried synchronously inside pmu->read().
> + *
> + * 100ms (10 Hz) provides reasonably accurate profiling without heavy overhead.
> + */
> +#define RPI_AXI_PMU_TIMER_INTERVAL ms_to_ktime(100)
> +
> +static enum cpuhp_state rpi_axi_pmu_cpuhp_state;
> +
> +/* --- PMU API & CONFIG DECODING ---------------------------------- */
> +
> +#define PMU_NAME "rpi_axi_pmu"
> +
> +/**
> + * config_to_filter() - Extracts AXI filter ID from perf event config
> + * @config: 64-bit config value from struct perf_event_attr
> + *
> + * Return: Filter ID value (bits 10-14).
> + */
> +static int config_to_filter(__u64 config)
> +{
> +	return (config >> 10) & 0x1F;

Can we have a definition for the shift and mask here?

> +}
> +
> +/**
> + * config_to_monitor() - Extracts Monitor ID from perf event config
> + * @config: 64-bit config value from struct perf_event_attr
> + *
> + * Return: Monitor enum (bit 9: 0 = System, 1 = VPU).
> + */
> +static enum monitor config_to_monitor(__u64 config)
> +{
> +	return (config >> 9) & 1;

Likewise.

> +}
> +
> +/**
> + * config_to_bus() - Extracts bus index from perf event config
> + * @config: 64-bit config value from struct perf_event_attr
> + *
> + * Return: Bus index (bits 4-8).
> + */
> +static int config_to_bus(__u64 config)
> +{
> +	return (config >> 4) & 0x1F;

Likewise

> +}
> +
> +/**
> + * config_to_counter() - Extracts metric counter type from perf event config
> + * @config: 64-bit config value from struct perf_event_attr
> + *
> + * Return: Counter enum (bits 0-3).
> + */
> +static enum counter config_to_counter(__u64 config)
> +{
> +	return config & 0xF;

And here as well.

[snip]

> +	for (int i = 0; i < MON__MAX; i++) {
> +		rpi_axi_hw_events__init(&pmu->monitor[i].hw_events);
> +
> +		if (pmu->monitor[i].use_mailbox_interface) {
> +			struct resource *resource = platform_get_resource(pdev, IORESOURCE_MEM, i);
> +
> +			if (!resource) {
> +				dev_err(dev, "Error reading mailbox resource %d\n", i);
> +				ret = -EINVAL;
> +				goto err_firmware_put;
> +			}
> +			pmu->monitor[i].mailbox = (u32)resource->start;
> +		} else {
> +			struct resource *resource = platform_get_resource(pdev, IORESOURCE_MEM, i);

Well you are fetching MMIO resources here, so you need a Device Tree 
description and you need to submit the Device Tree changes that describe 
these register ranges. Is it fair to assume only the RPi firmware path 
has been tested or did you also test with MMIO?

[snip]
> +
> +MODULE_LICENSE("GPL");
Missing MODULE_AUTHOR() and MODULE_DESCRIPTION().
-- 
Florian


