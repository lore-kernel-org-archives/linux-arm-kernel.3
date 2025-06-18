Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2107C73C66
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 18:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+0yvrozKxsQt0xHdXQ19wdpfj3yqatMRUu5y81Nb1iA=; b=e0s+5N3/+KqXsyMkqb5abB9CA8
	w3eTcc34YlnFO+Ax63j8KLxNMzn+cvX6bU7XBwIeBnFelX7Fo0FQxR6WO2PTP58UE2/dkF7DeogZb
	Bb6+DtwhHYC0CHF/6CbPboXhkTqsg5wTzNSsOZdEGJ9ixGXJKGb/6xvnHFaeQrMhaADCawX8ID9gz
	KUqMCf+argWMDMOqX9z0fHF+eafPiGa1sz6WQ/HqM541CNfNeq0cg/fIhTwszZ/RKO61aHmM2GXoA
	o6x1E0nmZPNIa9Mdgzw59OZs4e3us4uKJudUCFFgKfYgnn4mv+BqvNIjvKR8Z+KjpoV0IakrZUPxE
	I4xGs7AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRx6h-0000000B0jw-2dQ2;
	Wed, 18 Jun 2025 18:01:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRuJQ-0000000AXBz-2apM
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Jun 2025 15:02:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+0yvrozKxsQt0xHdXQ19wdpfj3yqatMRUu5y81Nb1iA=; b=e1vosGJdg6jI+lRrnhqg5oGE9f
	4GbHOIJef7ab5yBPcFn4ecOA+bZraCDIDI9zuwHiQ66TedEB80fKA/Qi1PByIcy6SpwHyYuv7+nY5
	I77DVeaSsWehPOSq4ozkGaf3SZNREJjkN3tLaLALVt4ae5+RKpfNEuDuAEASLW7Rp93QcgYYaqX4R
	ReNSmXvv23ULecamyZJ4S5X9gb6L8k7fVzLXarxKGq8j+Y/gC5qsOOeps38MjnDuxdBvCwKqg40/x
	7gEpf3L60motA+wGCKFcWIWH2kLzTivxpKKDNzaeNzHI++3gxRlD7/MoM5oF0/EmtipZfqQp5DxIM
	3SHxbt4Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRuJM-0000000481j-3l9D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 15:02:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D60014BF;
	Wed, 18 Jun 2025 08:02:25 -0700 (PDT)
Received: from [10.57.28.112] (unknown [10.57.28.112])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBC2F3F58B;
	Wed, 18 Jun 2025 08:02:43 -0700 (PDT)
Message-ID: <bc8a73d2-ba85-4431-a8e9-3692cc1e402a@arm.com>
Date: Wed, 18 Jun 2025 16:02:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: realm: ioremap: Allow mapping memory as
 encrypted
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, catalin.marinas@arm.com, sami.mujawar@arm.com,
 aneesh.kumar@kernel.org, linux-kernel@vger.kernel.org, sudeep.holla@arm.com
References: <20250613111153.1548928-1-suzuki.poulose@arm.com>
 <20250613111153.1548928-2-suzuki.poulose@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250613111153.1548928-2-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_160249_339353_31ECDEB8 
X-CRM114-Status: GOOD (  25.00  )
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

On 13/06/2025 12:11, Suzuki K Poulose wrote:
> For ioremap(), so far we only checked if it was a device (RIPAS_DEV) to choose
> an encrypted vs decrypted mapping. However, we may have firmware reserved memory
> regions exposed to the OS (e.g., EFI Coco Secret Securityfs, ACPI CCEL).
> We need to make sure that anything that is RIPAS_RAM (i.e., Guest
> protected memory with RMM guarantees) are also mapped as encrypted.
> 
> Rephrasing the above, anything that is not RIPAS_EMPTY is guaranteed to be
> protected by the RMM. Thus we choose encrypted mapping for anything that is not
> RIPAS_EMPTY. While at it, rename the helper function
> 
>   __arm64_is_protected_mmio => arm64_rsi_is_protected
> 
> to clearly indicate that this not an arm64 generic helper, but something to do
> with Realms.
> 
> Cc: Sami Mujawar <sami.mujawar@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> Cc: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  arch/arm64/include/asm/io.h  |  2 +-
>  arch/arm64/include/asm/rsi.h |  2 +-
>  arch/arm64/kernel/rsi.c      | 26 ++++++++++++++++++++++----
>  3 files changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
> index 9b96840fb979..82276282a3c7 100644
> --- a/arch/arm64/include/asm/io.h
> +++ b/arch/arm64/include/asm/io.h
> @@ -311,7 +311,7 @@ extern bool arch_memremap_can_ram_remap(resource_size_t offset, size_t size,
>  static inline bool arm64_is_protected_mmio(phys_addr_t phys_addr, size_t size)
>  {
>  	if (unlikely(is_realm_world()))
> -		return __arm64_is_protected_mmio(phys_addr, size);
> +		return arm64_rsi_is_protected(phys_addr, size);
>  	return false;
>  }
>  
> diff --git a/arch/arm64/include/asm/rsi.h b/arch/arm64/include/asm/rsi.h
> index b42aeac05340..88b50d660e85 100644
> --- a/arch/arm64/include/asm/rsi.h
> +++ b/arch/arm64/include/asm/rsi.h
> @@ -16,7 +16,7 @@ DECLARE_STATIC_KEY_FALSE(rsi_present);
>  
>  void __init arm64_rsi_init(void);
>  
> -bool __arm64_is_protected_mmio(phys_addr_t base, size_t size);
> +bool arm64_rsi_is_protected(phys_addr_t base, size_t size);
>  
>  static inline bool is_realm_world(void)
>  {
> diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
> index ce4778141ec7..c64a06f58c0b 100644
> --- a/arch/arm64/kernel/rsi.c
> +++ b/arch/arm64/kernel/rsi.c
> @@ -84,7 +84,25 @@ static void __init arm64_rsi_setup_memory(void)
>  	}
>  }
>  
> -bool __arm64_is_protected_mmio(phys_addr_t base, size_t size)
> +/*
> + * Check if a given PA range is Trusted (e.g., Protected memory, a Trusted Device
> + * mapping, or an MMIO emulated in the Realm world).
> + *
> + * We can rely on the RIPAS value of the region to detect if a given region is
> + * protected.
> + *
> + *  RIPAS_DEV - A trusted device memory or a trusted emulated MMIO (in the Realm
> + *		world
> + *  RIPAS_RAM - Memory (RAM), protected by the RMM guarantees. (e.g., Firmware
> + *		reserved regions for data sharing).
> + *
> + *  RIPAS_DESTROYED is a special case of one of the above, where the host did
> + *  something without our permission and as such we can't do anything about it.
> + *
> + * The only case where something is emulated by the untrusted hypervisor or is
> + * backed by shared memory is indicated by RSI_RIPAS_EMPTY.
> + */
> +bool arm64_rsi_is_protected(phys_addr_t base, size_t size)
>  {
>  	enum ripas ripas;
>  	phys_addr_t end, top;
> @@ -101,18 +119,18 @@ bool __arm64_is_protected_mmio(phys_addr_t base, size_t size)
>  			break;
>  		if (WARN_ON(top <= base))
>  			break;
> -		if (ripas != RSI_RIPAS_DEV)
> +		if (ripas == RSI_RIPAS_EMPTY)
>  			break;
>  		base = top;
>  	}
>  
>  	return base >= end;
>  }
> -EXPORT_SYMBOL(__arm64_is_protected_mmio);
> +EXPORT_SYMBOL(arm64_rsi_is_protected);
>  
>  static int realm_ioremap_hook(phys_addr_t phys, size_t size, pgprot_t *prot)
>  {
> -	if (__arm64_is_protected_mmio(phys, size))
> +	if (arm64_rsi_is_protected(phys, size))
>  		*prot = pgprot_encrypted(*prot);
>  	else
>  		*prot = pgprot_decrypted(*prot);


