Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946A3CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 12:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UXCce5dvT8hmP+S5p4SwkpHdlAZ8QSQCXnL5AW2rt78=; b=XzXbL982VA3vSkEcl94rAqU7Ih
	vUfsekv4/4oe8Suhas7NGbY9USeDcuJMwKWF4yTMNf+JsD5ySrgMZ8m7WgDy3ps81H054PWW+I+Vu
	DzEZwwQ07WuTbiFWxxciuhLtyQ+iCru0OvW3X+LQZQ1dMBbSG+V+MYwFpoy8iL/vKrh0sWB/WkZVB
	M7ZrgMTeWx5HVQyBO9F3Y2YBnNFlSKLxqpCTLSo+0BfrA4/gUKY4A7PdiXAx+3g7PwDvumDH+KVmB
	DyjG++YhJRze/3X84ftBDY8czHN1LUkXOPzfUZrJTQx1gn1GpmKqsuTBJwdEbahK9QH7cm9407AT2
	DsGChb9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLDZ-0000000HGdV-18pB;
	Fri, 07 Nov 2025 12:05:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLDX-0000000HGd9-1JEQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 12:05:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DB731515;
	Fri,  7 Nov 2025 04:05:13 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F20E3F66E;
	Fri,  7 Nov 2025 04:05:19 -0800 (PST)
Message-ID: <cb087e63-3dae-4d7d-ac8a-a8982e560be6@arm.com>
Date: Fri, 7 Nov 2025 12:05:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/7] arm64: Add support for FEAT_{LS64, LS64_V}
To: Zhou Wang <wangzhou1@hisilicon.com>, catalin.marinas@arm.com,
 will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
 yuzenghui@huawei.com, arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 yangyccccc@gmail.com, prime.zeng@hisilicon.com, xuwei5@huawei.com
References: <20251107072127.448953-1-wangzhou1@hisilicon.com>
 <20251107072127.448953-6-wangzhou1@hisilicon.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251107072127.448953-6-wangzhou1@hisilicon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_040523_452652_6F1BC32E 
X-CRM114-Status: GOOD (  33.55  )
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

On 07/11/2025 07:21, Zhou Wang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Armv8.7 introduces single-copy atomic 64-byte loads and stores
> instructions and its variants named under FEAT_{LS64, LS64_V}.
> These features are identified by ID_AA64ISAR1_EL1.LS64 and the
> use of such instructions in userspace (EL0) can be trapped. In
> order to support the use of corresponding instructions in userspace:
> - Make ID_AA64ISAR1_EL1.LS64 visbile to userspace
> - Add identifying and enabling in the cpufeature list
> - Expose these support of these features to userspace through HWCAP3
>    and cpuinfo
> 
> ld64b/st64b (FEAT_LS64) and st64bv (FEAT_LS64_V) is intended for
> special memory (device memory) so requires support by the CPU, system
> and target memory location (device that support these instructions).
> The HWCAP3_{LS64, LS64_V} implies the support of CPU and system (since
> no identification method from system, so SoC vendors should advertise
> support in the CPU if system also support them).
> 
> Otherwise for ld64b/st64b the atomicity may not be guaranteed or a
> DABT will be generated, so users (probably userspace driver developer)
> should make sure the target memory (device) also have the support.
> For st64bv 0xffffffffffffffff will be returned as status result for
> unsupported memory so user should check it.
> 
> Document the restrictions along with HWCAP3_{LS64, LS64_V}.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
> ---
>   Documentation/arch/arm64/booting.rst    | 12 ++++++
>   Documentation/arch/arm64/elf_hwcaps.rst | 14 +++++++
>   arch/arm64/include/asm/hwcap.h          |  2 +
>   arch/arm64/include/uapi/asm/hwcap.h     |  2 +
>   arch/arm64/kernel/cpufeature.c          | 51 +++++++++++++++++++++++++
>   arch/arm64/kernel/cpuinfo.c             |  2 +
>   arch/arm64/tools/cpucaps                |  2 +
>   7 files changed, 85 insertions(+)
> 
> diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
> index e4f953839f71..2c56d76ecafb 100644
> --- a/Documentation/arch/arm64/booting.rst
> +++ b/Documentation/arch/arm64/booting.rst
> @@ -556,6 +556,18 @@ Before jumping into the kernel, the following conditions must be met:
>   
>      - MDCR_EL3.TPM (bit 6) must be initialized to 0b0
>   
> +  For CPUs with support for 64-byte loads and stores without status (FEAT_LS64):
> +
> +  - If the kernel is entered at EL1 and EL2 is present:
> +
> +    - HCRX_EL2.EnALS (bit 1) must be initialised to 0b1.
> +
> +  For CPUs with support for 64-byte stores with status (FEAT_LS64_V):
> +
> +  - If the kernel is entered at EL1 and EL2 is present:
> +
> +    - HCRX_EL2.EnASR (bit 2) must be initialised to 0b1.
> +
>   The requirements described above for CPU mode, caches, MMUs, architected
>   timers, coherency and system registers apply to all CPUs.  All CPUs must
>   enter the kernel in the same exception level.  Where the values documented
> diff --git a/Documentation/arch/arm64/elf_hwcaps.rst b/Documentation/arch/arm64/elf_hwcaps.rst
> index a15df4956849..b86059bc288b 100644
> --- a/Documentation/arch/arm64/elf_hwcaps.rst
> +++ b/Documentation/arch/arm64/elf_hwcaps.rst
> @@ -444,6 +444,20 @@ HWCAP3_MTE_STORE_ONLY
>   HWCAP3_LSFE
>       Functionality implied by ID_AA64ISAR3_EL1.LSFE == 0b0001
>   
> +HWCAP3_LS64
> +    Functionality implied by ID_AA64ISAR1_EL1.LS64 == 0b0001. Note that
> +    the function of instruction ld64b/st64b requires support by CPU, system
> +    and target (device) memory location and HWCAP3_LS64 implies the support
> +    of CPU. User should only use ld64b/st64b on supported target (device)
> +    memory location, otherwise fallback to the non-atomic alternatives.
> +
> +HWCAP3_LS64_V
> +    Functionality implied by ID_AA64ISAR1_EL1.LS64 == 0b0010. Same to
> +    HWCAP3_LS64 that HWCAP3_LS64_V implies CPU's support of instruction
> +    st64bv but also requires the support from the system and target (device)
> +    memory location. st64bv supports return status result and 0xFFFFFFFFFFFFFFFF
> +    will be returned for unsupported memory location.
> +
>   
>   4. Unused AT_HWCAP bits
>   -----------------------
> diff --git a/arch/arm64/include/asm/hwcap.h b/arch/arm64/include/asm/hwcap.h
> index 6d567265467c..3c0804fb3435 100644
> --- a/arch/arm64/include/asm/hwcap.h
> +++ b/arch/arm64/include/asm/hwcap.h
> @@ -179,6 +179,8 @@
>   #define KERNEL_HWCAP_MTE_FAR		__khwcap3_feature(MTE_FAR)
>   #define KERNEL_HWCAP_MTE_STORE_ONLY	__khwcap3_feature(MTE_STORE_ONLY)
>   #define KERNEL_HWCAP_LSFE		__khwcap3_feature(LSFE)
> +#define KERNEL_HWCAP_LS64		__khwcap3_feature(LS64)
> +#define KERNEL_HWCAP_LS64_V		__khwcap3_feature(LS64_V)
>   
>   /*
>    * This yields a mask that user programs can use to figure out what
> diff --git a/arch/arm64/include/uapi/asm/hwcap.h b/arch/arm64/include/uapi/asm/hwcap.h
> index 575564ecdb0b..79bc77425b82 100644
> --- a/arch/arm64/include/uapi/asm/hwcap.h
> +++ b/arch/arm64/include/uapi/asm/hwcap.h
> @@ -146,5 +146,7 @@
>   #define HWCAP3_MTE_FAR		(1UL << 0)
>   #define HWCAP3_MTE_STORE_ONLY		(1UL << 1)
>   #define HWCAP3_LSFE		(1UL << 2)
> +#define HWCAP3_LS64		(1UL << 3)
> +#define HWCAP3_LS64_V		(1UL << 4)
>   
>   #endif /* _UAPI__ASM_HWCAP_H */
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 5ed401ff79e3..dcc5ba620a7e 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -239,6 +239,7 @@ static const struct arm64_ftr_bits ftr_id_aa64isar0[] = {
>   };
>   
>   static const struct arm64_ftr_bits ftr_id_aa64isar1[] = {
> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_EL1_LS64_SHIFT, 4, 0),
>   	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_EL1_XS_SHIFT, 4, 0),
>   	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_EL1_I8MM_SHIFT, 4, 0),
>   	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_EL1_DGH_SHIFT, 4, 0),
> @@ -2259,6 +2260,38 @@ static void cpu_enable_e0pd(struct arm64_cpu_capabilities const *cap)
>   }
>   #endif /* CONFIG_ARM64_E0PD */
>   
> +static bool has_ls64(const struct arm64_cpu_capabilities *entry, int __unused)
> +{
> +	u64 ls64;
> +
> +	ls64 = cpuid_feature_extract_field(__read_sysreg_by_encoding(entry->sys_reg),
> +					   entry->field_pos, entry->sign);

Why are we always reading from the "local" CPU ? Shouldn't this be based 
on the SCOPE ?

i.e., read from the sanitised feature state for SCOPE_SYSTEM (given that 
is the SCOPE for the capability)

and read from the local CPU for SCOPE_LOCAL (for checks in late CPUs).


> +
> +	if (ls64 == ID_AA64ISAR1_EL1_LS64_NI ||
> +	    ls64 > ID_AA64ISAR1_EL1_LS64_LS64_ACCDATA)

Given this is FTR_LOWER_SAFE, why do we skip anything that is HIGHER 
than a particular value ? You must be able to fall back to the 
has_cpuid_feature() check for both these CAPs.


> +		return false;
> +



---8>---

> +	if (entry->capability == ARM64_HAS_LS64 &&
> +	    ls64 >= ID_AA64ISAR1_EL1_LS64_LS64)
> +		return true;
> +
> +	if (entry->capability == ARM64_HAS_LS64_V &&
> +	    ls64 >= ID_AA64ISAR1_EL1_LS64_LS64_V)
> +		return true;
> +
> +	return false;

--<8---


minor nit: You could simplify this to:

	return (ls64 >= entry->min_field_value)


Suzuki

