Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4806C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 14:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhdEBysemK4Op5BI5LxI7dMVD7TFix3pgk70ZVv71ZE=; b=PRhW1DhRz7kcuyqTo3Bblu5g8I
	tfmkaQ935mHzKAu68ex0is816igfbtxAORMvn1LbpPNxSyn2ADj1OBUSGkCCGFsS344eiSqd300wU
	p4M99pes2cVHtiopdMqzuqk5XWlJ/SWC4olI+uW/ZaNexFxctkH0shNvzddSBkzbQAtSpvu7eoTCx
	ka4tPvsjRon5DnhWRK0w9tzsT9Mm1enuyG9AXdj3aSN9VDSl15l55Gy9eyQbtFKUmVqryrcXm1/ct
	3LIOgWE6WeyukHm8S6cuFb3GQ/vBTJzm/90r9u8HWj6Z1TxZViflx+sdD2jK6dlZrSQEFxCkx+HWM
	gV+h7M2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvGUd-0000000CKAg-1BRp;
	Thu, 20 Mar 2025 14:03:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvGSu-0000000CJl0-3lKy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 14:01:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFF5A113E;
	Thu, 20 Mar 2025 07:01:51 -0700 (PDT)
Received: from [10.57.84.158] (unknown [10.57.84.158])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7EAC3F63F;
	Thu, 20 Mar 2025 07:01:39 -0700 (PDT)
Message-ID: <2cbca34c-477c-4055-b388-a13bb6c22b4d@arm.com>
Date: Thu, 20 Mar 2025 14:01:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] arm64: Add BBM Level 2 cpu feature
Content-Language: en-GB
To: Ard Biesheuvel <ardb@kernel.org>,
 =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>
Cc: suzuki.poulose@arm.com, yang@os.amperecomputing.com, corbet@lwn.net,
 catalin.marinas@arm.com, will@kernel.org, jean-philippe@linaro.org,
 robin.murphy@arm.com, joro@8bytes.org, akpm@linux-foundation.org,
 mark.rutland@arm.com, joey.gouly@arm.com, maz@kernel.org,
 james.morse@arm.com, broonie@kernel.org, oliver.upton@linux.dev,
 baohua@kernel.org, david@redhat.com, ioworker0@gmail.com, jgg@ziepe.ca,
 nicolinc@nvidia.com, mshavit@google.com, jsnitsel@redhat.com,
 smostafa@google.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev
References: <20250319150533.37440-2-miko.lenczewski@arm.com>
 <20250319150533.37440-3-miko.lenczewski@arm.com>
 <CAMj1kXFOofRCiVHxxxBZMGQHRH-ghtqNxgd=uww9D4sr4vvjEQ@mail.gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <CAMj1kXFOofRCiVHxxxBZMGQHRH-ghtqNxgd=uww9D4sr4vvjEQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_070145_022420_BF15ED76 
X-CRM114-Status: GOOD (  26.16  )
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

On 20/03/2025 13:37, Ard Biesheuvel wrote:
> On Wed, 19 Mar 2025 at 16:06, Mikołaj Lenczewski
> <miko.lenczewski@arm.com> wrote:
>>
>> The Break-Before-Make cpu feature supports multiple levels (levels 0-2),
>> and this commit adds a dedicated BBML2 cpufeature to test against
>> support for, as well as a kernel commandline parameter to optionally
>> disable BBML2 altogether.
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
>>
>> Signed-off-by: Mikołaj Lenczewski <miko.lenczewski@arm.com>
>> ---
>>  .../admin-guide/kernel-parameters.txt         |  3 +
>>  arch/arm64/Kconfig                            | 11 +++
>>  arch/arm64/include/asm/cpucaps.h              |  2 +
>>  arch/arm64/include/asm/cpufeature.h           |  5 ++
>>  arch/arm64/kernel/cpufeature.c                | 68 +++++++++++++++++++
>>  arch/arm64/kernel/pi/idreg-override.c         |  2 +
>>  arch/arm64/tools/cpucaps                      |  1 +
>>  7 files changed, 92 insertions(+)
>>
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index fb8752b42ec8..3e4cc917a07e 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -453,6 +453,9 @@
>>         arm64.no32bit_el0 [ARM64] Unconditionally disable the execution of
>>                         32 bit applications.
>>
>> +       arm64.nobbml2   [ARM64] Unconditionally disable Break-Before-Make Level
>> +                       2 support
>> +
>>         arm64.nobti     [ARM64] Unconditionally disable Branch Target
>>                         Identification support
>>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 940343beb3d4..49deda2b22ae 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -2057,6 +2057,17 @@ config ARM64_TLB_RANGE
>>           The feature introduces new assembly instructions, and they were
>>           support when binutils >= 2.30.
>>
>> +config ARM64_BBML2_NOABORT
>> +       bool "Enable support for Break-Before-Make Level 2 detection and usage"
>> +       default y
>> +       help
>> +         FEAT_BBM provides detection of support levels for break-before-make
>> +         sequences. If BBM level 2 is supported, some TLB maintenance requirements
>> +         can be relaxed to improve performance. We additonally require the
>> +         property that the implementation cannot ever raise TLB Conflict Aborts.
>> +         Selecting N causes the kernel to fallback to BBM level 0 behaviour
>> +         even if the system supports BBM level 2.
>> +
>>  endmenu # "ARMv8.4 architectural features"
>>
>>  menu "ARMv8.5 architectural features"
>> diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
>> index 0b5ca6e0eb09..2d6db33d4e45 100644
>> --- a/arch/arm64/include/asm/cpucaps.h
>> +++ b/arch/arm64/include/asm/cpucaps.h
>> @@ -23,6 +23,8 @@ cpucap_is_possible(const unsigned int cap)
>>                 return IS_ENABLED(CONFIG_ARM64_PAN);
>>         case ARM64_HAS_EPAN:
>>                 return IS_ENABLED(CONFIG_ARM64_EPAN);
>> +       case ARM64_HAS_BBML2_NOABORT:
>> +               return IS_ENABLED(CONFIG_ARM64_BBML2_NOABORT);
>>         case ARM64_SVE:
>>                 return IS_ENABLED(CONFIG_ARM64_SVE);
>>         case ARM64_SME:
>> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
>> index e0e4478f5fb5..108ef3fbbc00 100644
>> --- a/arch/arm64/include/asm/cpufeature.h
>> +++ b/arch/arm64/include/asm/cpufeature.h
>> @@ -866,6 +866,11 @@ static __always_inline bool system_supports_mpam_hcr(void)
>>         return alternative_has_cap_unlikely(ARM64_MPAM_HCR);
>>  }
>>
>> +static inline bool system_supports_bbml2_noabort(void)
>> +{
>> +       return alternative_has_cap_unlikely(ARM64_HAS_BBML2_NOABORT);
>> +}
>> +
>>  int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);
>>  bool try_emulate_mrs(struct pt_regs *regs, u32 isn);
>>
>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>> index d561cf3b8ac7..1a4adcda267b 100644
>> --- a/arch/arm64/kernel/cpufeature.c
>> +++ b/arch/arm64/kernel/cpufeature.c
>> @@ -2176,6 +2176,67 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
>>         return arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_HVHE);
>>  }
>>
>> +static bool cpu_has_bbml2_noabort(unsigned int cpu_midr)
>> +{
> 
> We generally start these block comments with just /* on the first line
> 
>> +       /* We want to allow usage of bbml2 in as wide a range of kernel contexts
>> +        * as possible. This list is therefore an allow-list of known-good
>> +        * implementations that both support bbml2 and additionally, fulfill the
>> +        * extra constraint of never generating TLB conflict aborts when using
>> +        * the relaxed bbml2 semantics (such aborts make use of bbml2 in certain
>> +        * kernel contexts difficult to prove safe against recursive aborts).
>> +        *
>> +        * Note that implementations can only be considered "known-good" if their
>> +        * implementors attest to the fact that the implementation never raises
>> +        * TLBI conflict aborts for bbml2 mapping granularity changes.
>> +        */
>> +       static const struct midr_range supports_bbml2_noabort_list[] = {
>> +               MIDR_REV_RANGE(MIDR_CORTEX_X4, 0, 3, 0xf),
>> +               MIDR_REV_RANGE(MIDR_NEOVERSE_V3, 0, 2, 0xf),
>> +               {}
>> +       };
>> +
> 
> Why on earth is this needed? Is there nothing in the architecture that
> can inform us about this? That seems like a huge oversight to me ...

Currently the architecture can only tell us about the BBM support level.
Currently level 2 is the highest and that permits an implementation to raise a
conflict abort instead of handling it in HW.

Since this series only relies on BBML2 for user space memory, we believe we
could contain and handle any conflict abort safely (the first version of this
series handled the abort). But Yang Shi has a series on list that aims to use
BBML2 to enable dynamically splitting the linear map. It becomes much harder to
reason about the safety of any conflict abort in that case.

Will was keen to take this approach were we decide if the HW supports
"BBML2+NOABORT" semanitics based on the MIDR. Plans are in flight to fix the
arch so we can tidy this up long term, but Will didn't want to hold up Ampere.

Thanks,
Ryan



