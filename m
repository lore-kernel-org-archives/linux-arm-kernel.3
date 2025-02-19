Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B58C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 14:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdUWmSWcdR08rSfalNQicz8sjd5EjemzSvDZvZqf90E=; b=yK3peH5hBJ/zNJUtwAxfdlr83o
	36UyvETMXTPFV/cBcnsPprgnkXNenu3Y22yzqGyKXQGoLngVAfUxYw7B4OK7WFLpW2oL5Ly7NwOfZ
	L7T+1uWv26QO7XqFudPyOKMiDc5gnsKZjARzD+fBNQjPAyycdfmLoO2/UwqSHE27oxMBpa7ebSPpW
	2WGVFF9bVBCmtDAN6Gnd4I9GaSicCiGfiQKrHxi5u7zZ1QoOHL96dEAVoyE7jvdT7zr8UT2aqmYOf
	r7seEK7OfITHvplzES+uaOROtVJpPE/Hx7eofHJsw0eM9nORH9u4/Gh0xEHdAPHAdzgrlDcVDjs22
	Q5v25erw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkl9z-0000000DJOi-46bG;
	Wed, 19 Feb 2025 14:34:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkl5x-0000000DIQz-03Dh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 14:30:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C040312FC;
	Wed, 19 Feb 2025 06:30:53 -0800 (PST)
Received: from [10.57.84.90] (unknown [10.57.84.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 523213F59E;
	Wed, 19 Feb 2025 06:30:31 -0800 (PST)
Message-ID: <5aeb6f47-12be-40d5-be6f-847bb8ddc605@arm.com>
Date: Wed, 19 Feb 2025 14:30:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/11] arm64: Enable memory encrypt for Realms
To: "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, kvmarm@lists.linux.dev, kvm@vger.kernel.org
References: <20241017131434.40935-1-steven.price@arm.com>
 <20241017131434.40935-10-steven.price@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20241017131434.40935-10-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_063037_146462_F3B58270 
X-CRM114-Status: GOOD (  22.02  )
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

On 17/10/2024 14:14, Steven Price wrote:
> From: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> Use the memory encryption APIs to trigger a RSI call to request a
> transition between protected memory and shared memory (or vice versa)
> and updating the kernel's linear map of modified pages to flip the top
> bit of the IPA. This requires that block mappings are not used in the
> direct map for realm guests.
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Co-developed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
[...]
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 547a9e0b46c2..6ae6ae806454 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -5,10 +5,12 @@
>  #include <linux/kernel.h>
>  #include <linux/mm.h>
>  #include <linux/module.h>
> +#include <linux/mem_encrypt.h>
>  #include <linux/sched.h>
>  #include <linux/vmalloc.h>
>  
>  #include <asm/cacheflush.h>
> +#include <asm/pgtable-prot.h>
>  #include <asm/set_memory.h>
>  #include <asm/tlbflush.h>
>  #include <asm/kfence.h>
> @@ -23,14 +25,16 @@ bool rodata_full __ro_after_init = IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED
>  bool can_set_direct_map(void)
>  {
>  	/*
> -	 * rodata_full and DEBUG_PAGEALLOC require linear map to be
> -	 * mapped at page granularity, so that it is possible to
> +	 * rodata_full, DEBUG_PAGEALLOC and a Realm guest all require linear
> +	 * map to be mapped at page granularity, so that it is possible to
>  	 * protect/unprotect single pages.
>  	 *
>  	 * KFENCE pool requires page-granular mapping if initialized late.
> +	 *
> +	 * Realms need to make pages shared/protected at page granularity.
>  	 */
>  	return rodata_full || debug_pagealloc_enabled() ||
> -	       arm64_kfence_can_set_direct_map();
> +		arm64_kfence_can_set_direct_map() || is_realm_world();
>  }

Aneesh pointed out that this call to is_realm_world() is now too early 
since the decision to delay the RSI detection. The upshot is that a 
realm guest which doesn't have page granularity forced for other reasons 
will fail to share pages with the host.

At the moment I can think of a couple of options:

(1) Make rodata_full a requirement for realm guests. 
    CONFIG_RODATA_FULL_DEFAULT_ENABLED is already "default y" so this 
    isn't a big ask.

(2) Revisit the idea of detecting when running as a realm guest early. 
    This has the advantage of also "fixing" earlycon (no need to 
    manually specify the shared-alias of an unprotected UART).

I'm currently leaning towards (1) because it's the default anyway. But 
if we're going to need to fix earlycon (or indeed find other similar 
issues) then (2) would obviously make sense.

Any thoughts on the best option here.

Untested patch for (1) below. Although updating the docs would be
probably be a good idea too ;)

Thanks,
Steve

----8<---
diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
index ce4778141ec7..48a6ef0f401c 100644
--- a/arch/arm64/kernel/rsi.c
+++ b/arch/arm64/kernel/rsi.c
@@ -126,6 +126,10 @@ void __init arm64_rsi_init(void)
 		return;
 	if (!rsi_version_matches())
 		return;
+	if (!can_set_direct_map()) {
+		pr_err("rodata_full disabled, unable to run as a realm guest. Please enable CONFIG_RODATA_FULL_DEFAULT_ENABLED\n");
+		return;
+	}
 	if (WARN_ON(rsi_get_realm_config(&config)))
 		return;
 	prot_ns_shared = BIT(config.ipa_bits - 1);
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 39fd1f7ff02a..f8fd8a3816fb 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -25,16 +25,14 @@ bool rodata_full __ro_after_init = IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED
 bool can_set_direct_map(void)
 {
 	/*
-	 * rodata_full, DEBUG_PAGEALLOC and a Realm guest all require linear
-	 * map to be mapped at page granularity, so that it is possible to
+	 * rodata_full, DEBUG_PAGEALLOC require linear map to be
+	 * mapped at page granularity, so that it is possible to
 	 * protect/unprotect single pages.
 	 *
 	 * KFENCE pool requires page-granular mapping if initialized late.
-	 *
-	 * Realms need to make pages shared/protected at page granularity.
 	 */
 	return rodata_full || debug_pagealloc_enabled() ||
-		arm64_kfence_can_set_direct_map() || is_realm_world();
+		arm64_kfence_can_set_direct_map();
 }
 
 static int change_page_range(pte_t *ptep, unsigned long addr, void *data)


