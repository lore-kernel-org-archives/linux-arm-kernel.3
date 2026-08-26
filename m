Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AD6C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 18:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cmDnM9N/sExPW4FxItBgnf7fP+GVZqQ5yB6g4L/QzrE=; b=vUzyHEeMqRsmlXqiJgwQqdHLJU
	zFxjviVgSuwEY4Ce2pHjnxxdlyQeHdqh4qqDQPbaJriV+endbCDdUXv2K5/XrD16+yApygW43C9+U
	P6kiQd6DelNEeVwZjZhet7lXTE1QgWvbFRcHd3Y2QSVbhoO0Sr64gdBlR1Eux8dSkBl6VzhSao9N2
	//QS0hxk97H0wJFZhBQQV4SGsFsb1NWX5zCuJxLf0lpBXFwmZ7p7X3PehTnix2es0LQq2s9RCMrMr
	Hjm8t3GbE9BFWeXZ1WRmORFZFje9FriWygu457Z8JTixd/iWM2gUlCyBmFINQZbAa8Oo8HfUzGTVC
	74ZSn4Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzIRj-00000002tAR-1klL;
	Wed, 26 Aug 2026 18:33:59 +0000
Received: from mail-yw1-x1163.google.com ([2607:f8b0:4864:20::1163])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzIRg-00000002t9Z-3SO6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 18:33:58 +0000
Received: by mail-yw1-x1163.google.com with SMTP id 00721157ae682-85aa9c1308dso3723647b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 11:33:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787769234; x=1788374034;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cmDnM9N/sExPW4FxItBgnf7fP+GVZqQ5yB6g4L/QzrE=;
        b=MONcDwTxTMJ2Vp4V6vpuwTWdT0axtM0rUuOH2XPGZh5/ZQXEV+LSv4KDtj0xoPLYBP
         7ZWGO17IdSwoNk5gVN1st4JEvizq3utuXntiJLX2x7AOozVfcnwPG1t62/3XPedH+/n7
         puUzNe0Lb7Pz8leDMIU32A+aFAQwlIFOHG6BJmF7Ibyv8zpb93POnnX/1ghETbD2je8m
         IF7mZHsyARNO8beOUCe/Sqf9J8FojbiyM/YYfoamJcYeC306+Gq72mIJ41hC66rEvrsU
         322Vk/DxOjGlZhfQvZn1msh30G67PHWNU6iNx5StdimGnkHouC65wpRhSMtMVO/l2OIN
         gl9w==
X-Forwarded-Encrypted: i=1; AHgh+RopRNQtNXOAO5PWkLfsPjXK0ImaaNPKa7PEVXUgMlEKl0zrzlZsrISF10E539Ip6irkBCbMI7GdOUNtuBRpRar3@lists.infradead.org
X-Gm-Message-State: AFuF++nffz2aFTHXqorKygjFfInoqhOGmQfpnALN/YxV4VnpVwb50gn1
	1L0rlw5RVYXZWE8CYT0sCzEj8vJk4HB2YwnVh21nXXqDh5g6spnf527sZbMPJLrvkpGWDgphxgh
	yKods97Y6ljMISmFr8Zq2MXGkj8iBlwaBbbsjTpRZzkWAR0XlQtctWpkjYZKs2+W/dxAycdsbIR
	PWAqTzeVOYKxtFwR7xKh0SP/XsvZezIfWe5nArKO0qVDLqxlw9eW2MSZBut88ligGn4XNIEVXYL
	NwOplaQ0caT4DOsB4dLK+o5EQtp3nz48GY=
X-Gm-Gg: AR+sD11syjvgoheiQmMf7lbRgRbM0Rwse/2u8kkyS8fGtGy/jl8hYSlVbqiFnTZbtgn
	qPjAfVCp7zTKcEX3VARUiRjJG+NREHcBkygUwmTbMqGH3HQkmz2/Yu8a8ZKJuFS7aTIGMz++Iuc
	xDJ9yFJNx0ilvfjioz4/ZDSy1sb25xikRcUwp2EQ4mj2T182Gl4FocffZ3+DtSA4jYNJ42GQKUh
	NdEDdVJV/OGxyr0rc6N5VJiBabW5uhhQhadLu7U6M9epq7qH5JGQn/hDcfcf9GY3R9XYpiX/EMP
	pNp/KeOIzCGN3UkLuqzgRogKv9fqpwl0OO5V2Z5O+qugQgotHYDlbvn1vpm6a023dpGF4vh4wzG
	YAIFv+vkmPrR4AL8gnQcDPKjhvucv2ccOCJcZJNfJkhKNUh/t2vBgan4tY/NJqs9EBawTWHLBUW
	U2wFYCsAgbQXDr/EA5753bzP3vWShEGUsQMNLHva2N
X-Received: by 2002:a05:690c:6f07:b0:81f:a9e8:f7ef with SMTP id 00721157ae682-8573b837f49mr42825597b3.1.1787769234284;
        Wed, 26 Aug 2026 11:33:54 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-857b49ed45esm154227b3.22.2026.08.26.11.33.53
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Aug 2026 11:33:54 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-395543dc382so1745710a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 11:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1787769233; x=1788374033; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cmDnM9N/sExPW4FxItBgnf7fP+GVZqQ5yB6g4L/QzrE=;
        b=AKxfjqkcdSJgDOAs+HIF0y/jtaHbLWI67EtMexkAauf2qm9t2rmeTgh6dVuWBkLoad
         tiRD9ClzHb2NKpLLBUx1f/XyOf6e65mchxX5goDhuMgGksKxS1Uu2GD/xm10fZ+MOWw0
         b/q6KejYHnId5m4anY1b0tf3+FYPntJ+jSYFA=
X-Forwarded-Encrypted: i=1; AHgh+RpmzWruQS/QDXQV8BvgUSWXGR8P3cohvzSit3SsflmQhnTKr6RTeKldVXjA4luwVTI8aGLNRoB8BTw2nKN46Lo8@lists.infradead.org
X-Received: by 2002:a17:90b:3cc3:b0:393:194d:5366 with SMTP id 98e67ed59e1d1-3966d85de70mr19581753a91.10.1787769232847;
        Wed, 26 Aug 2026 11:33:52 -0700 (PDT)
X-Received: by 2002:a17:90b:3cc3:b0:393:194d:5366 with SMTP id 98e67ed59e1d1-3966d85de70mr19581640a91.10.1787769232285;
        Wed, 26 Aug 2026 11:33:52 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283fa89e8fsm15006063eec.8.2026.08.26.11.33.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 11:33:51 -0700 (PDT)
Message-ID: <635282ef-5c24-4820-abfa-7eaaea6e7f0e@broadcom.com>
Date: Wed, 26 Aug 2026 11:33:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] iommu: Add Broadcom BCM2712 IOMMU driver
To: Daniel Drake <dan@reactivated.net>, "Joerg Roedel (AMD)"
 <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, nick.hollinghurst@raspberrypi.com,
 james.quinlan@broadcom.com, Jason Gunthorpe <jgg@ziepe.ca>
References: <20260825-bcm2712-iommu-submit-v3-0-7f143e7289b6@reactivated.net>
 <20260825-bcm2712-iommu-submit-v3-4-7f143e7289b6@reactivated.net>
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
In-Reply-To: <20260825-bcm2712-iommu-submit-v3-4-7f143e7289b6@reactivated.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_113356_968796_E3796BCE 
X-CRM114-Status: GOOD (  36.22  )
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

On 8/25/26 13:56, Daniel Drake wrote:
> This IOMMU translates memory access requests for the VC6 display
> pipeline and various multimedia devices in the Broadcom BCM2712 SoC used
> on Raspberry Pi 5.
> 
> The driver uses the generic_pt framework to manage the 2-level page
> tables. It also provides support for the centralized L2 TLB (IOMMUC),
> which is shared across the SoC's IOMMU instances and must be flushed
> when modifying or unmapping page table entries.
> 
> Adapted from Raspberry Pi's downstream bcm2712-iommu driver
> (original author Nick Hollinghurst).
> 
> Signed-off-by: Daniel Drake <dan@reactivated.net>
> ---
>   drivers/iommu/Kconfig               |  15 +
>   drivers/iommu/Makefile              |   1 +
>   drivers/iommu/bcm2712-iommu-cache.c |  83 ++++++
>   drivers/iommu/bcm2712-iommu-cache.h |   9 +
>   drivers/iommu/bcm2712-iommu.c       | 556 ++++++++++++++++++++++++++++++++++++
>   5 files changed, 664 insertions(+)
> 
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index 6e07bd69467a..f2c8788158b0 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -386,6 +386,21 @@ config VSI_IOMMU
>   	  Say Y here if you want to use this IOMMU in front of these
>   	  hardware blocks.
>   
> +config BCM2712_IOMMU
> +	bool "BCM2712 IOMMU driver"
> +	depends on (ARCH_BCM && ARM64) || COMPILE_TEST
> +	select IOMMU_API
> +	select GENERIC_PT
> +	select IOMMU_PT
> +	select IOMMU_PT_BCM2712
> +	help
> +	  Support for IOMMU on BCM2712 SoC. This IOMMU can be used by the
> +	  display controller and various multimedia devices to perform
> +	  efficient memory management.
> +
> +	  Say Y here if you want to use this IOMMU in front of these
> +	  hardware blocks.
> +
>   config IOMMU_DEBUG_PAGEALLOC
>   	bool "Debug IOMMU mappings against page allocations"
>   	depends on DEBUG_PAGEALLOC && IOMMU_API && PAGE_EXTENSION
> diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
> index 2f05725eaab1..29a26d2a3af1 100644
> --- a/drivers/iommu/Makefile
> +++ b/drivers/iommu/Makefile
> @@ -37,4 +37,5 @@ obj-$(CONFIG_IOMMU_IOPF) += io-pgfault.o
>   obj-$(CONFIG_SPRD_IOMMU) += sprd-iommu.o
>   obj-$(CONFIG_APPLE_DART) += apple-dart.o
>   obj-$(CONFIG_VSI_IOMMU) += vsi-iommu.o
> +obj-$(CONFIG_BCM2712_IOMMU) += bcm2712-iommu.o bcm2712-iommu-cache.o
>   obj-$(CONFIG_IOMMU_DEBUG_PAGEALLOC) += iommu-debug-pagealloc.o
> diff --git a/drivers/iommu/bcm2712-iommu-cache.c b/drivers/iommu/bcm2712-iommu-cache.c
> new file mode 100644
> index 000000000000..040cfc4ccf9f
> --- /dev/null
> +++ b/drivers/iommu/bcm2712-iommu-cache.c
> @@ -0,0 +1,83 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * IOMMU driver for BCM2712 TLB cache
> + *
> + * Copyright (c) 2023 Raspberry Pi Ltd.
> + * Copyright (c) 2026 Daniel Drake
> + *
> + * The BCM2712 IOMMUC is a centralized TLB which accelerates address translation
> + * across the SoC's IOMMU devices. If an address mapping is not found in the
> + * IOMMU's local TLB cache, then this IOMMUC is consulted. The IOMMUC must be
> + * explicitly invalidated when modifying or unmapping IOMMU page tables.
> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/err.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>
> +#include <linux/iopoll.h>
> +
> +#include "bcm2712-iommu-cache.h"
> +
> +struct bcm2712_iommu_cache {
> +	struct device *dev;
> +	spinlock_t hw_lock;
> +	void __iomem *reg_base;
> +};
> +
> +#define MMUC_CONTROL_ENABLE   1
> +#define MMUC_CONTROL_FLUSH    2
> +#define MMUC_CONTROL_FLUSHING 4

Those should be BIT(0), BIT(1) and BIT(2) respectively.

> +
> +void bcm2712_iommu_cache_flush(struct bcm2712_iommu_cache *cache)
> +{
> +	u32 val;
> +	int ret;
> +
> +	scoped_guard(spinlock_irqsave, &cache->hw_lock) {
> +		writel(MMUC_CONTROL_ENABLE | MMUC_CONTROL_FLUSH,
> +		       cache->reg_base);
> +
> +		ret = readl_poll_timeout_atomic(cache->reg_base, val,
> +						!(val & MMUC_CONTROL_FLUSHING),
> +						0, 50);
> +	}
> +
> +	if (ret)
> +		dev_err_ratelimited(cache->dev, "cache flush timed out\n");
> +}
> +
> +static int bcm2712_iommu_cache_probe(struct platform_device *pdev)
> +{
> +	struct bcm2712_iommu_cache *cache;
> +
> +	cache = devm_kzalloc(&pdev->dev, sizeof(*cache), GFP_KERNEL);
> +	if (!cache)
> +		return -ENOMEM;
> +
> +	cache->dev = &pdev->dev;
> +	spin_lock_init(&cache->hw_lock);
> +
> +	cache->reg_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(cache->reg_base))
> +		return PTR_ERR(cache->reg_base);
> +
> +	platform_set_drvdata(pdev, cache);
> +	return 0;
> +}
> +
> +static const struct of_device_id bcm2712_iommu_cache_of_match[] = {
> +	{ .compatible = "brcm,bcm2712-iommuc" },
> +	{ /* sentinel */ },
> +};
> +
> +static struct platform_driver bcm2712_iommu_cache_driver = {
> +	.probe = bcm2712_iommu_cache_probe,
> +	.driver = {
> +		.name = "bcm2712-iommu-cache",
> +		.of_match_table = bcm2712_iommu_cache_of_match,
> +		.suppress_bind_attrs = true,
> +	},
> +};
> +builtin_platform_driver(bcm2712_iommu_cache_driver);
> diff --git a/drivers/iommu/bcm2712-iommu-cache.h b/drivers/iommu/bcm2712-iommu-cache.h
> new file mode 100644
> index 000000000000..d2f7851831cc
> --- /dev/null
> +++ b/drivers/iommu/bcm2712-iommu-cache.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef _BCM2712_IOMMU_CACHE_H
> +#define _BCM2712_IOMMU_CACHE_H
> +
> +struct bcm2712_iommu_cache;
> +
> +void bcm2712_iommu_cache_flush(struct bcm2712_iommu_cache *cache);
> +
> +#endif
> diff --git a/drivers/iommu/bcm2712-iommu.c b/drivers/iommu/bcm2712-iommu.c
> new file mode 100644
> index 000000000000..1bb456a83df5
> --- /dev/null
> +++ b/drivers/iommu/bcm2712-iommu.c
> @@ -0,0 +1,556 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * IOMMU driver for Broadcom BCM2712
> + *
> + * Copyright (c) 2023-2025 Raspberry Pi Ltd.
> + * Copyright (c) 2026 Daniel Drake
> + *
> + * Each BCM2712 IOMMU has multiple devices hardwired into it, whose
> + * DMA transactions all route through the IOMMU. There is no stream ID tagging
> + * or any other kind of segmentation to differentiate between requests from
> + * different devices. It is also not possible to toggle a specific device
> + * between iommu-mapped and bypass modes.
> + *
> + * The hardware supports the simultaneous configuration of a bypass window
> + * (where memory accesses operate in identity mode) and a translation aperture
> + * (supporting page mapping). While combining these two would allow for
> + * GART-like operation, this driver's paging domain implementation configures
> + * only the translation aperture (starting at IOVA 0) offering a degree of
> + * memory protection.
> + *
> + * The page table format is a two-level format handled by generic_pt/bcm2712.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/cleanup.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/err.h>
> +#include <linux/iommu.h>
> +#include <linux/iopoll.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>
> +#include <linux/sizes.h>
> +#include <linux/generic_pt/iommu.h>
> +
> +#include "bcm2712-iommu-cache.h"
> +#include "dma-iommu.h"
> +#include "iommu-pages.h"
> +
> +/* BCM2712 IOMMU is organized around 4Kbyte pages */
> +#define IOMMU_PAGE_SHIFT       12
> +#define IOMMU_PAGE_SIZE        (1ul << IOMMU_PAGE_SHIFT)
> +/* A PTE is 4 bytes */
> +#define PTE_SIZE_SHIFT         2
> +/* L1/L2 table sizing (IOMMU hardware pages): 1024 entries per page */
> +#define PTES_PER_IOPG_SHIFT    (IOMMU_PAGE_SHIFT - PTE_SIZE_SHIFT)
> +
> +#define MMMU_CTRL_OFFSET                       0x00
> +#define MMMU_CTRL_CAP_EXCEEDED                 BIT(27)
> +#define MMMU_CTRL_CAP_EXCEEDED_ABORT_EN        BIT(26)
> +#define MMMU_CTRL_CAP_EXCEEDED_INT_EN          BIT(25)
> +#define MMMU_CTRL_CAP_EXCEEDED_EXCEPTION_EN    BIT(24)
> +#define MMMU_CTRL_PT_INVALID                   BIT(20)
> +#define MMMU_CTRL_PT_INVALID_ABORT_EN          BIT(19)
> +#define MMMU_CTRL_PT_INVALID_INT_EN            BIT(18)
> +#define MMMU_CTRL_PT_INVALID_EXCEPTION_EN      BIT(17)
> +#define MMMU_CTRL_PT_INVALID_EN                BIT(16)
> +#define MMMU_CTRL_WRITE_VIOLATION              BIT(12)
> +#define MMMU_CTRL_WRITE_VIOLATION_ABORT_EN     BIT(11)
> +#define MMMU_CTRL_WRITE_VIOLATION_INT_EN       BIT(10)
> +#define MMMU_CTRL_WRITE_VIOLATION_EXCEPTION_EN BIT(9)
> +#define MMMU_CTRL_BYPASS                       BIT(8)
> +#define MMMU_CTRL_TLB_CLEARING                 BIT(7)
> +#define MMMU_CTRL_STATS_CLEAR                  BIT(3)
> +#define MMMU_CTRL_TLB_CLEAR                    BIT(2)
> +#define MMMU_CTRL_STATS_ENABLE                 BIT(1)
> +#define MMMU_CTRL_ENABLE                       BIT(0)
> +
> +#define MMMU_CTRL_OPERATING_FLAGS (\
> +	MMMU_CTRL_CAP_EXCEEDED_ABORT_EN    | \
> +	MMMU_CTRL_PT_INVALID_ABORT_EN      | \
> +	MMMU_CTRL_PT_INVALID_EN            | \
> +	MMMU_CTRL_WRITE_VIOLATION_ABORT_EN | \
> +	MMMU_CTRL_STATS_ENABLE             | \
> +	MMMU_CTRL_ENABLE)
> +
> +#define MMMU_PT_PA_BASE_OFFSET                 0x04
> +
> +#define MMMU_ADDR_CAP_OFFSET                   0x14
> +#define MMMU_ADDR_CAP_ENABLE                   BIT(31)
> +#define ADDR_CAP_SHIFT                         ilog2(SZ_256M)
> +
> +#define MMMU_SHOOT_DOWN_OFFSET                 0x18
> +#define MMMU_SHOOT_DOWN_SHOOTING               BIT(31)
> +#define MMMU_SHOOT_DOWN_SHOOT                  BIT(30)
> +
> +#define MMMU_BYPASS_START_OFFSET               0x1c
> +#define MMMU_BYPASS_START_ENABLE               BIT(31)
> +
> +#define MMMU_BYPASS_END_OFFSET                 0x20
> +#define MMMU_BYPASS_END_ENABLE                 BIT(31)
> +
> +#define MMMU_MISC_OFFSET                       0x24
> +#define MMMU_MISC_SINGLE_TABLE                 BIT(31)
> +
> +#define MMMU_ILLEGAL_ADR_OFFSET                0x30
> +#define MMMU_ILLEGAL_ADR_ENABLE                BIT(31)
> +
> +#define MMMU_DEBUG_INFO_OFFSET                 0x38
> +#define MMMU_DEBUG_INFO_VERSION_MASK           0x0000000Fu
> +#define MMMU_DEBUG_INFO_VA_WIDTH_MASK          0x000000F0u
> +#define MMMU_DEBUG_INFO_PA_WIDTH_MASK          0x00000F00u
> +#define MMMU_DEBUG_INFO_BIGPAGE_WIDTH_MASK     0x000FF000u
> +#define MMMU_DEBUG_INFO_SUPERPAGE_WIDTH_MASK   0x0FF00000u
> +#define MMMU_DEBUG_INFO_BYPASS_4M              BIT(28)
> +#define MMMU_DEBUG_INFO_BYPASS                 BIT(29)
> +
> +struct bcm2712_iommu {
> +	struct device *dev;
> +	struct iommu_device iommu;
> +	struct bcm2712_iommu_domain *domain;
> +	struct bcm2712_iommu_cache *cache;
> +	void __iomem *reg_base;
> +	spinlock_t hw_lock;
> +	size_t bigpage_size;
> +	size_t superpage_size;
> +};
> +
> +struct bcm2712_iommu_domain {
> +	union {
> +		struct iommu_domain base;
> +		struct pt_iommu_bcm2712 pt;
> +	};
> +	struct bcm2712_iommu *mmu;
> +	void *default_page;
> +};
> +
> +#define MMU_WR(off, val)  writel(val, mmu->reg_base + (off))
> +#define MMU_RD(off)       readl(mmu->reg_base + (off))

I would prefer using static inline wrappers here because it gets super 
easy to just instrument those with debug prints by adding a couple of 
lines, it also gives you type validation at the same time.

[snip]

> +static struct iommu_domain bcm2712_blocking_domain = {
> +	.type = IOMMU_DOMAIN_BLOCKED,
> +	.ops = &(const struct iommu_domain_ops) {
> +		.attach_dev = bcm2712_iommu_blocking_attach,
> +	},
> +};
> +
> +static int bcm2712_iommu_enable_and_clear_tlb(struct bcm2712_iommu *mmu)

Maybe add __must_hold() here to indicate when this is called?

The rest looks good to me, but I defer to Jim for the functional review.
-- 
Florian

