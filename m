Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FE9CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 13:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGx4VZ3979iJjEA8L0U/O9XSVgamKI66TMaZhZjDMVs=; b=P2P7aY8ik+lb8n/dtBEnDp0Er+
	euVNoriVT0MhS55eYo3RPd5xyypHWE9i/OQODmqS6PuzoXEBgfJrgvqd+z2YdHODpjBECwzh/t8rr
	j79VokES0jyer9t14lPkLsoCXZuXSwRQlPiGOOLcTox2T0+lxI3QcMIpQgbVsX3jVBjv+o8RETX5q
	gYJ5j7WCfwM6CDS8S+XgRXHcN7l7Nj7h3hKxLUvZtAZxZDUQBb3oBsN77Ni939KkrkMtBmJQ/WzdC
	ixytkk7q/e7BgP4oq9DLmJzjAjzu9AfhRJbZO/sdGZT5evx6Zr6yhiRAWRBXEcMHFfKUxQ3aDH9v6
	+fxTsb5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXnZ-0000000GyVG-3ICZ;
	Thu, 14 Aug 2025 13:15:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUy1-0000000GXbA-3A35
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 10:13:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43B7A1691;
	Thu, 14 Aug 2025 03:13:43 -0700 (PDT)
Received: from [10.1.32.48] (e122027.cambridge.arm.com [10.1.32.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A06E3F738;
	Thu, 14 Aug 2025 03:13:49 -0700 (PDT)
Message-ID: <8e58b01b-772d-4ca7-a681-34f10baa07e6@arm.com>
Date: Thu, 14 Aug 2025 11:13:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clocksource/drivers/arm_arch_timer: Add standalone
 MMIO driver
To: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>
References: <20250807160243.1970533-1-maz@kernel.org>
 <20250807160243.1970533-3-maz@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250807160243.1970533-3-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_031353_872421_2A3B70A0 
X-CRM114-Status: GOOD (  14.57  )
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

On 07/08/2025 17:02, Marc Zyngier wrote:
> Add a new driver for the MMIO side of the ARM architected timer.
> Most of it has been lifted from the existing arch timer code,
> massaged, and finally rewritten.
> 
> It supports both DT and ACPI as firmware descriptions.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  MAINTAINERS                               |   1 +
>  drivers/clocksource/arm_arch_timer_mmio.c | 420 ++++++++++++++++++++++
>  2 files changed, 421 insertions(+)
>  create mode 100644 drivers/clocksource/arm_arch_timer_mmio.c
> 
[...]
> +static void arch_timer_mmio_setup(struct arch_timer *at, int irq)
> +{
> +	at->evt = (struct clock_event_device) {
> +		.features		   = (CLOCK_EVT_FEAT_ONESHOT |
> +					      CLOCK_EVT_FEAT_DYNIRQ),
> +		.name			   = "arch_mem_timer",
> +		.rating			   = 400,
> +		.cpumask		   = cpu_possible_mask,
> +		.irq 			   = irq,
> +		.set_next_event		   = arch_timer_mmio_set_next_event,
> +		.set_state_oneshot_stopped = arch_timer_mmio_shutdown,
> +		.set_state_shutdown	   = arch_timer_mmio_shutdown,
> +	};
> +
> +	at->evt.set_state_shutdown(&at->evt);
> +
> +	clockevents_config_and_register(&at->evt, at->rate, 0xf, CLOCKSOURCE_MASK(56));

This doesn't work on 32 bit - clockevents_config_and_register()'s final
argument is an unsigned long, and a 56 bit mask doesn't fit. This
triggers a compiler warning:

 drivers/clocksource/arm_arch_timer_mmio.c: In function
'arch_timer_mmio_setup':
 ./include/linux/bits.h:47:9: error: conversion from 'long long unsigned
int' to 'long unsigned int' changes value from '72057594037927935' to
'4294967295' [-Werror=overflow]
    47 |         ((t)(GENMASK_INPUT_CHECK(h, l) +                        \
       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    48 |              (type_max(t) << (l) &                              \
       |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    49 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
       |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ./include/linux/bits.h:52:33: note: in expansion of macro 'GENMASK_TYPE'
    52 | #define GENMASK_ULL(h, l)       GENMASK_TYPE(unsigned long
long, h, l)
       |                                 ^~~~~~~~~~~~
 ./include/linux/clocksource.h:153:32: note: in expansion of macro
'GENMASK_ULL'
   153 | #define CLOCKSOURCE_MASK(bits) GENMASK_ULL((bits) - 1, 0)
       |                                ^~~~~~~~~~~
 drivers/clocksource/arm_arch_timer_mmio.c:255:66: note: in expansion of
macro 'CLOCKSOURCE_MASK'
   255 |         clockevents_config_and_register(&at->evt, at->rate,
0xf, CLOCKSOURCE_MASK(56));
       |
 ^~~~~~~~~~~~~~~~

Possible this should really be min(CLOCKSOURCE_MASK(56), ULONG_MAX)? But
I'm not familiar enough with this code. Most likely it's dead code on a
32 bit platform.

Thanks,
Steve


