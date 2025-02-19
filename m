Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59C9C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 15:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJTY4LdM7iVe9gFpe4Yp6CC57aIApuEU/t+8+CeG6nI=; b=Iev/BOQXLrvT3fJojKERFENojV
	l7geiBoc4EJDu72XOGbS1JSzOp274lpQCn1GUnWPyOw5NH5PoxVBWENVIgxAnE1nvTSBpZ6y/FJVP
	+6DjSQ+lwd6zDYlQARRRBScnU/h70yha5icifu6D0W85Z+riVJcajxZyfo6VylB0XaWKnA5gqaHfM
	4feNmJTQUQsjlh5KqndLq8b8Txow7OFGP+jJ+wpm98OEaSd+ikXp4f2RkylUw1u5rp34t/lFFMWB6
	ypctDOYqD1wlHPJD9JSb6+AsDdZ3lodMhWzG2N3Etl7pWEuUm1MDCTG4fgAH2EwD8nvd1e6S977ve
	sRgU0bwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkmGv-0000000DckP-1Y0c;
	Wed, 19 Feb 2025 15:46:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkmF3-0000000DcHJ-205L
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 19 Feb 2025 15:44:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=dJTY4LdM7iVe9gFpe4Yp6CC57aIApuEU/t+8+CeG6nI=; b=CtJMEAtGkd00yax8aeHtKAKphu
	8qbbCUo/v+quxcJmettmyISSfyH3XZVtnFtGDdX/0zwjQXqUxuncyYwhKZuB6IM/mJVXFpAV3u5j3
	Ro2aIenoiHoegHkCKy8OiqKaNTv1TxTYeAxAamhs2IvxfwjTeGF/LJ8uiToGfK9uDhiVIPZeWJ51R
	XGSTWUf+v6F8MtsISQNOWapGN6tSxL4hvJ2k+6L+6rVLp/zHA68D/sFVgcoT1sshLi+B2ycKlIk8J
	EZydvd63X/+VzKo9L7JIb3vcgk/IsJnr2UciRJdQ0kqkYJxps5Treix8rVZSIzqG62TcofGAXYM7G
	I0yqoZqQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkmF0-00000002G8W-0a86
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 15:44:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7BAD202C;
	Wed, 19 Feb 2025 07:44:18 -0800 (PST)
Received: from [10.57.84.233] (unknown [10.57.84.233])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 727A73F59E;
	Wed, 19 Feb 2025 07:43:57 -0800 (PST)
Message-ID: <cbc3f62b-8890-42ca-81ff-66f1e4ea1cf3@arm.com>
Date: Wed, 19 Feb 2025 15:43:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] arm64: Add BBM Level 2 cpu feature
Content-Language: en-GB
To: Robin Murphy <robin.murphy@arm.com>,
 =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>,
 yang@os.amperecomputing.com, catalin.marinas@arm.com, will@kernel.org,
 joey.gouly@arm.com, broonie@kernel.org, mark.rutland@arm.com,
 james.morse@arm.com, yangyicong@hisilicon.com, anshuman.khandual@arm.com,
 maz@kernel.org, liaochang1@huawei.com, akpm@linux-foundation.org,
 david@redhat.com, baohua@kernel.org, ioworker0@gmail.com,
 oliver.upton@linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250219143837.44277-3-miko.lenczewski@arm.com>
 <20250219143837.44277-5-miko.lenczewski@arm.com>
 <a6846db8-9efa-46f8-9939-7727c83d1601@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <a6846db8-9efa-46f8-9939-7727c83d1601@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_154402_535845_9FE06469 
X-CRM114-Status: GOOD (  26.90  )
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

On 19/02/2025 15:39, Robin Murphy wrote:
> Hi Miko,
> 
> On 2025-02-19 2:38 pm, Mikołaj Lenczewski wrote:
>> The Break-Before-Make cpu feature supports multiple levels (levels 0-2),
>> and this commit adds a dedicated BBML2 cpufeature to test against
>> support for.
>>
>> This is a system feature as we might have a big.LITTLE architecture
>> where some cores support BBML2 and some don't, but we want all cores to
>> be available and BBM to default to level 0 (as opposed to having cores
>> without BBML2 not coming online).
>>
>> To support BBML2 in as wide a range of contexts as we can, we want not
>> only the architectural guarantees that BBML2 makes, but additionally
>> want BBML2 to not create TLB conflict aborts. Not causing aborts avoids
>> us having to prove that no recursive faults can be induced in any path
>> that uses BBML2, allowing its use for arbitrary kernel mappings.
>> Support detection of such CPUs.
> 
> If this may be used for splitting/compacting userspace mappings, then similarly
> to 6e192214c6c8 ("iommu/arm-smmu-v3: Document SVA interaction with new pagetable
> features"), strictly we'll also want a check in arm_smmu_sva_supported() to make
> sure that the SMMU is OK with BBML2 behaviour too, and disallow SVA if not. Note
> that the corresponding SMMUv3.2-BBML2 feature is already strict about TLB
> conflict aborts, so is comparatively nice and straightforward.

Thanks for catching this, Robin, as I completely forgot to pass this onto Miko
yesterday after our conversation. I suggest we tack a commit on to the end of
this series to cover that?

I think that strictly this is not needed for Yang's series since that only uses
BBML2 for kernel mappings, and those pgtables would never be directly shared
with the SMMU.


> 
> Thanks,
> Robin.
> 
>> Signed-off-by: Mikołaj Lenczewski <miko.lenczewski@arm.com>
>> ---
>>   arch/arm64/Kconfig                  |  9 ++++++++
>>   arch/arm64/include/asm/cpufeature.h |  5 +++++
>>   arch/arm64/kernel/cpufeature.c      | 32 +++++++++++++++++++++++++++++
>>   arch/arm64/tools/cpucaps            |  1 +
>>   4 files changed, 47 insertions(+)
>>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 940343beb3d4..84be2c5976f0 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -2057,6 +2057,15 @@ config ARM64_TLB_RANGE
>>         The feature introduces new assembly instructions, and they were
>>         support when binutils >= 2.30.
>>   +config ARM64_ENABLE_BBML2
>> +    bool "Enable support for Break-Before-Make Level 2 detection and usage"
>> +    default y
>> +    help
>> +      FEAT_BBM provides detection of support levels for break-before-make
>> +      sequences. If BBM level 2 is supported, some TLB maintenance requirements
>> +      can be relaxed to improve performance. Selecting N causes the kernel to
>> +      fallback to BBM level 0 behaviour even if the system supports BBM level 2.
>> +
>>   endmenu # "ARMv8.4 architectural features"
>>     menu "ARMv8.5 architectural features"
>> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/
>> cpufeature.h
>> index e0e4478f5fb5..2da872035f2e 100644
>> --- a/arch/arm64/include/asm/cpufeature.h
>> +++ b/arch/arm64/include/asm/cpufeature.h
>> @@ -866,6 +866,11 @@ static __always_inline bool system_supports_mpam_hcr(void)
>>       return alternative_has_cap_unlikely(ARM64_MPAM_HCR);
>>   }
>>   +static inline bool system_supports_bbml2_noconflict(void)
>> +{
>> +    return alternative_has_cap_unlikely(ARM64_HAS_BBML2_NOCONFLICT);
>> +}
>> +
>>   int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);
>>   bool try_emulate_mrs(struct pt_regs *regs, u32 isn);
>>   diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>> index d561cf3b8ac7..8c337bd95ef7 100644
>> --- a/arch/arm64/kernel/cpufeature.c
>> +++ b/arch/arm64/kernel/cpufeature.c
>> @@ -2176,6 +2176,31 @@ static bool hvhe_possible(const struct
>> arm64_cpu_capabilities *entry,
>>       return arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_HVHE);
>>   }
>>   +static bool has_bbml2_noconflict(const struct arm64_cpu_capabilities *entry,
>> +                 int scope)
>> +{
>> +    if (!IS_ENABLED(CONFIG_ARM64_ENABLE_BBML2))
>> +        return false;
>> +
>> +    /* We want to allow usage of bbml2 in as wide a range of kernel contexts
>> +     * as possible. This list is therefore an allow-list of known-good
>> +     * implementations that both support bbml2 and additionally, fulfil the
>> +     * extra constraint of never generating TLB conflict aborts when using
>> +     * the relaxed bbml2 semantics (such aborts make use of bbml2 in certain
>> +     * kernel contexts difficult to prove safe against recursive aborts).
>> +     */
>> +    static const struct midr_range supports_bbml2_without_abort_list[] = {
>> +        MIDR_REV_RANGE(MIDR_CORTEX_X4, 0, 3, 0xf),
>> +        MIDR_REV_RANGE(MIDR_NEOVERSE_V3, 0, 2, 0xf),
>> +        {}
>> +    };
>> +
>> +    if (!is_midr_in_range_list(read_cpuid_id(),
>> supports_bbml2_without_abort_list))
>> +        return false;
>> +
>> +    return true;
>> +}
>> +
>>   #ifdef CONFIG_ARM64_PAN
>>   static void cpu_enable_pan(const struct arm64_cpu_capabilities *__unused)
>>   {
>> @@ -2926,6 +2951,13 @@ static const struct arm64_cpu_capabilities
>> arm64_features[] = {
>>           .matches = has_cpuid_feature,
>>           ARM64_CPUID_FIELDS(ID_AA64MMFR2_EL1, EVT, IMP)
>>       },
>> +    {
>> +        .desc = "BBM Level 2 without conflict abort",
>> +        .capability = ARM64_HAS_BBML2_NOCONFLICT,
>> +        .type = ARM64_CPUCAP_SYSTEM_FEATURE,
>> +        .matches = has_bbml2_noconflict,
>> +        ARM64_CPUID_FIELDS(ID_AA64MMFR2_EL1, BBM, 2)
>> +    },
>>       {
>>           .desc = "52-bit Virtual Addressing for KVM (LPA2)",
>>           .capability = ARM64_HAS_LPA2,
>> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
>> index 1e65f2fb45bd..8d67bb4448c5 100644
>> --- a/arch/arm64/tools/cpucaps
>> +++ b/arch/arm64/tools/cpucaps
>> @@ -26,6 +26,7 @@ HAS_ECV
>>   HAS_ECV_CNTPOFF
>>   HAS_EPAN
>>   HAS_EVT
>> +HAS_BBML2_NOCONFLICT
>>   HAS_FPMR
>>   HAS_FGT
>>   HAS_FPSIMD
> 


