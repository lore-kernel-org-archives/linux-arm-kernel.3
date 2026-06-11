Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED9FCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 16:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5kqSBhQffJ4XjBQNmalicrZzmEAmD9JKGrOfj52XOgM=; b=hEsS7eixw9cYi+/mAzDiv7nVkI
	/JypgveZXvTEJNASdzlUcibztiGDA9KZDBVHQKN6FlXPIaiY/CzrWKREdKerVJ+KFG/C787cw7wwv
	3AqDLKxxxB9qAg+LYXze93J212We7KzJwQ5o02JQ1787+c9G/YnqIHosdleqsKk3xvDiDVkr7fmMT
	dxBuU1IWw6teSLeAkHXDNUBSvv2MI5aQJWeg53wUOgcA7waKQwMIhs0QAKwJqjFTqyoANyp84pwKr
	FIaEUH9EoenaMv/vARhC8EzKWZ84A+9EA2GR++4yAdhEkyxSjj74vXpd4WAfrAcF+LNNmI0Keg1Gb
	BC4opcJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhtk-00000009jRG-37cL;
	Thu, 11 Jun 2026 16:04:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXhth-00000009jQP-3KcK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 16:04:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F2241476;
	Thu, 11 Jun 2026 09:04:43 -0700 (PDT)
Received: from [192.168.1.148] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2EE83FBB1;
	Thu, 11 Jun 2026 09:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781193887; bh=6xYaxGkqvTZyvLlDsKba/9ML96k7MD4vHd7KxNuiUJ4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vpTSepwZXYsFn0TTMY0RWfCQZiVD41iOwclFwgAqlOYlcE4ASxS8WFUO/TshVDJmo
	 KaAjCZPU6SPZU74Ekp0pbGhvIGF+poAtUg1oEfiumvIoui0ZyAEU5fLdxUtakpP3y8
	 lsPDDwVznhYL63DoJyp8KtiIOSXvo5wE9ocXv0/U=
Message-ID: <b009e840-6b79-415c-a3da-705ea569af38@arm.com>
Date: Thu, 11 Jun 2026 17:04:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/6] firmware: smccc: Move RSI definitions to
 include/linux
Content-Language: en-GB
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Greg KH <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 Andre Przywara <andre.przywara@arm.com>
References: <20260611130429.295516-1-aneesh.kumar@kernel.org>
 <20260611130429.295516-4-aneesh.kumar@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260611130429.295516-4-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_090449_935517_4696DF52 
X-CRM114-Status: GOOD (  33.26  )
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

On 11/06/2026 14:04, Aneesh Kumar K.V (Arm) wrote:
> The RSI SMCCC function IDs describe a firmware ABI and are not arm64
> architecture specific definitions. Follow-up changes need to use them from
> non-arch code, including drivers/firmware/smccc and the Arm CCA guest
> driver.
> 
> Move the RSI SMCCC definitions from arch/arm64/include/asm/ to
> include/linux/ so they can be shared with the driver code. This also
> keeps the firmware interface outside architecture code, as requested [1].

Please could we also mention about moving the "wrappers" only used by
drivers accordingly ?

> 
> [1] https://lore.kernel.org/all/agsNO9cc7H-b0H8L@willie-the-truck
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>   arch/arm64/include/asm/rsi_cmds.h             | 74 +---------------
>   .../virt/coco/arm-cca-guest/arm-cca-guest.c   |  2 +
>   drivers/virt/coco/arm-cca-guest/rsi.h         | 84 +++++++++++++++++++
>   .../linux/arm-smccc-rsi.h                     |  6 +-
>   4 files changed, 90 insertions(+), 76 deletions(-)
>   create mode 100644 drivers/virt/coco/arm-cca-guest/rsi.h
>   rename arch/arm64/include/asm/rsi_smc.h => include/linux/arm-smccc-rsi.h (98%)
> 
> diff --git a/arch/arm64/include/asm/rsi_cmds.h b/arch/arm64/include/asm/rsi_cmds.h
> index 2c8763876dfb..633123a4e5d5 100644
> --- a/arch/arm64/include/asm/rsi_cmds.h
> +++ b/arch/arm64/include/asm/rsi_cmds.h
> @@ -8,10 +8,9 @@
>   
>   #include <linux/arm-smccc.h>
>   #include <linux/string.h>
> +#include <linux/arm-smccc-rsi.h>

super minor nit: Please keep them in the alphabetical order.

With that:

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Suzuki


>   #include <asm/memory.h>
>   
> -#include <asm/rsi_smc.h>
> -
>   #define RSI_GRANULE_SHIFT		12
>   #define RSI_GRANULE_SIZE		(_AC(1, UL) << RSI_GRANULE_SHIFT)
>   
> @@ -88,75 +87,4 @@ static inline long rsi_set_addr_range_state(phys_addr_t start,
>   	return res.a0;
>   }
>   
> -/**
> - * rsi_attestation_token_init - Initialise the operation to retrieve an
> - * attestation token.
> - *
> - * @challenge:	The challenge data to be used in the attestation token
> - *		generation.
> - * @size:	Size of the challenge data in bytes.
> - *
> - * Initialises the attestation token generation and returns an upper bound
> - * on the attestation token size that can be used to allocate an adequate
> - * buffer. The caller is expected to subsequently call
> - * rsi_attestation_token_continue() to retrieve the attestation token data on
> - * the same CPU.
> - *
> - * Returns:
> - *  On success, returns the upper limit of the attestation report size.
> - *  Otherwise, -EINVAL
> - */
> -static inline long
> -rsi_attestation_token_init(const u8 *challenge, unsigned long size)
> -{
> -	struct arm_smccc_1_2_regs regs = { 0 };
> -
> -	/* The challenge must be at least 32bytes and at most 64bytes */
> -	if (!challenge || size < 32 || size > 64)
> -		return -EINVAL;
> -
> -	regs.a0 = SMC_RSI_ATTESTATION_TOKEN_INIT;
> -	memcpy(&regs.a1, challenge, size);
> -	arm_smccc_1_2_smc(&regs, &regs);
> -
> -	if (regs.a0 == RSI_SUCCESS)
> -		return regs.a1;
> -
> -	return -EINVAL;
> -}
> -
> -/**
> - * rsi_attestation_token_continue - Continue the operation to retrieve an
> - * attestation token.
> - *
> - * @granule: {I}PA of the Granule to which the token will be written.
> - * @offset:  Offset within Granule to start of buffer in bytes.
> - * @size:    The size of the buffer.
> - * @len:     The number of bytes written to the buffer.
> - *
> - * Retrieves up to a RSI_GRANULE_SIZE worth of token data per call. The caller
> - * is expected to call rsi_attestation_token_init() before calling this
> - * function to retrieve the attestation token.
> - *
> - * Return:
> - * * %RSI_SUCCESS     - Attestation token retrieved successfully.
> - * * %RSI_INCOMPLETE  - Token generation is not complete.
> - * * %RSI_ERROR_INPUT - A parameter was not valid.
> - * * %RSI_ERROR_STATE - Attestation not in progress.
> - */
> -static inline unsigned long rsi_attestation_token_continue(phys_addr_t granule,
> -							   unsigned long offset,
> -							   unsigned long size,
> -							   unsigned long *len)
> -{
> -	struct arm_smccc_res res;
> -
> -	arm_smccc_1_1_invoke(SMC_RSI_ATTESTATION_TOKEN_CONTINUE,
> -			     granule, offset, size, 0, &res);
> -
> -	if (len)
> -		*len = res.a1;
> -	return res.a0;
> -}
> -
>   #endif /* __ASM_RSI_CMDS_H */
> diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> index 66d00b6ceb78..8b6854e7a188 100644
> --- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> +++ b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> @@ -14,6 +14,8 @@
>   
>   #include <asm/rsi.h>
>   
> +#include "rsi.h"
> +
>   /**
>    * struct arm_cca_token_info - a descriptor for the token buffer.
>    * @challenge:		Pointer to the challenge data
> diff --git a/drivers/virt/coco/arm-cca-guest/rsi.h b/drivers/virt/coco/arm-cca-guest/rsi.h
> new file mode 100644
> index 000000000000..f7303f4bce17
> --- /dev/null
> +++ b/drivers/virt/coco/arm-cca-guest/rsi.h
> @@ -0,0 +1,84 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2026 ARM Ltd.
> + */
> +
> +#ifndef _VIRT_COCO_RSI_H_
> +#define _VIRT_COCO_RSI_H_
> +
> +#include <linux/arm-smccc-rsi.h>
> +
> +/**
> + * rsi_attestation_token_init - Initialise the operation to retrieve an
> + * attestation token.
> + *
> + * @challenge:	The challenge data to be used in the attestation token
> + *		generation.
> + * @size:	Size of the challenge data in bytes.
> + *
> + * Initialises the attestation token generation and returns an upper bound
> + * on the attestation token size that can be used to allocate an adequate
> + * buffer. The caller is expected to subsequently call
> + * rsi_attestation_token_continue() to retrieve the attestation token data on
> + * the same CPU.
> + *
> + * Returns:
> + *  On success, returns the upper limit of the attestation report size.
> + *  Otherwise, -EINVAL
> + */
> +static inline long
> +rsi_attestation_token_init(const u8 *challenge, unsigned long size)
> +{
> +	struct arm_smccc_1_2_regs regs = { 0 };
> +
> +	/* The challenge must be at least 32bytes and at most 64bytes */
> +	if (!challenge || size < 32 || size > 64)
> +		return -EINVAL;
> +
> +	regs.a0 = SMC_RSI_ATTESTATION_TOKEN_INIT;
> +	memcpy(&regs.a1, challenge, size);
> +	arm_smccc_1_2_smc(&regs, &regs);
> +
> +	if (regs.a0 == RSI_SUCCESS)
> +		return regs.a1;
> +
> +	return -EINVAL;
> +}
> +
> +/**
> + * rsi_attestation_token_continue - Continue the operation to retrieve an
> + * attestation token.
> + *
> + * @granule: {I}PA of the Granule to which the token will be written.
> + * @offset:  Offset within Granule to start of buffer in bytes.
> + * @size:    The size of the buffer.
> + * @len:     The number of bytes written to the buffer.
> + *
> + * Retrieves up to a RSI_GRANULE_SIZE worth of token data per call. The caller
> + * is expected to call rsi_attestation_token_init() before calling this
> + * function to retrieve the attestation token.
> + *
> + * Return:
> + * * %RSI_SUCCESS     - Attestation token retrieved successfully.
> + * * %RSI_INCOMPLETE  - Token generation is not complete.
> + * * %RSI_ERROR_INPUT - A parameter was not valid.
> + * * %RSI_ERROR_STATE - Attestation not in progress.
> + */
> +static inline unsigned long rsi_attestation_token_continue(phys_addr_t granule,
> +							   unsigned long offset,
> +							   unsigned long size,
> +							   unsigned long *len)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_1_1_invoke(SMC_RSI_ATTESTATION_TOKEN_CONTINUE,
> +			     granule, offset, size, 0, &res);
> +
> +	if (len)
> +		*len = res.a1;
> +	return res.a0;
> +}
> +
> +
> +
> +#endif
> diff --git a/arch/arm64/include/asm/rsi_smc.h b/include/linux/arm-smccc-rsi.h
> similarity index 98%
> rename from arch/arm64/include/asm/rsi_smc.h
> rename to include/linux/arm-smccc-rsi.h
> index e19253f96c94..fddb77986f70 100644
> --- a/arch/arm64/include/asm/rsi_smc.h
> +++ b/include/linux/arm-smccc-rsi.h
> @@ -3,8 +3,8 @@
>    * Copyright (C) 2023 ARM Ltd.
>    */
>   
> -#ifndef __ASM_RSI_SMC_H_
> -#define __ASM_RSI_SMC_H_
> +#ifndef __LINUX_ARM_SMCCC_RSI_H_
> +#define __LINUX_ARM_SMCCC_RSI_H_
>   
>   #include <linux/arm-smccc.h>
>   
> @@ -190,4 +190,4 @@ struct realm_config {
>    */
>   #define SMC_RSI_HOST_CALL			SMC_RSI_FID(0x199)
>   
> -#endif /* __ASM_RSI_SMC_H_ */
> +#endif /* __LINUX_ARM_SMCCC_RSI_H_ */


