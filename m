Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A103C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 18:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93D2qQVC/l5SgzdbvRL1HJFhFlr5BIFz0mpe9T2J2J4=; b=hiGbH1Dh/s/VLW3PyWkV4pV32g
	ye8IW+H9f/n9FHdQqpX+dgTPaaK5re+8uxMy+QT6dYyMIOhldnMWz0MNfchF8Ctt+Cv7NChnZCRtH
	lO3CoF7Chnuo9ox+y8PkqzQ43zfp6IREBdufEt9fvBQIsgZ7y5NZyRLTIoNsibPf3xXiovom3sexv
	2b6vGFh8mowNP7IFouvWvAG5kmMT00WqfdK+jsIipdtn3BmfPqTUdNg3H7LU/ZJ13D2K0/YlZxeYa
	S5T7dm+KZt72O7jo4hDhtDQlrpnIt36hRWbNp9StKVB9MewWUTBClDfE/AtoLxBmVrCIuGL66K+DS
	JhDFHnPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCNIe-0000000D9Fn-3w6n;
	Tue, 06 May 2025 18:45:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJfR-0000000COl1-1WV7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 14:53:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8887D339;
	Tue,  6 May 2025 07:52:56 -0700 (PDT)
Received: from [10.1.29.178] (XHFQ2J9959.cambridge.arm.com [10.1.29.178])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E80603F58B;
	Tue,  6 May 2025 07:53:00 -0700 (PDT)
Message-ID: <78fec33d-fe66-4352-be11-900f456c9af3@arm.com>
Date: Tue, 6 May 2025 15:52:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v6 1/3] arm64: Add BBM Level 2 cpu feature
Content-Language: en-GB
To: Will Deacon <will@kernel.org>,
 =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>
Cc: suzuki.poulose@arm.com, yang@os.amperecomputing.com, corbet@lwn.net,
 catalin.marinas@arm.com, jean-philippe@linaro.org, robin.murphy@arm.com,
 joro@8bytes.org, akpm@linux-foundation.org, paulmck@kernel.org,
 mark.rutland@arm.com, joey.gouly@arm.com, maz@kernel.org,
 james.morse@arm.com, broonie@kernel.org, oliver.upton@linux.dev,
 baohua@kernel.org, david@redhat.com, ioworker0@gmail.com, jgg@ziepe.ca,
 nicolinc@nvidia.com, mshavit@google.com, jsnitsel@redhat.com,
 smostafa@google.com, kevin.tian@intel.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev
References: <20250428153514.55772-2-miko.lenczewski@arm.com>
 <20250428153514.55772-4-miko.lenczewski@arm.com>
 <20250506142508.GB1197@willie-the-truck>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250506142508.GB1197@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_075309_496069_5A7E889A 
X-CRM114-Status: GOOD (  35.08  )
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

On 06/05/2025 15:25, Will Deacon wrote:
> On Mon, Apr 28, 2025 at 03:35:14PM +0000, Mikołaj Lenczewski wrote:
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
>> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>  .../admin-guide/kernel-parameters.txt         |  3 +
>>  arch/arm64/Kconfig                            | 19 +++++
>>  arch/arm64/include/asm/cpucaps.h              |  2 +
>>  arch/arm64/include/asm/cpufeature.h           |  5 ++
>>  arch/arm64/kernel/cpufeature.c                | 71 +++++++++++++++++++
>>  arch/arm64/kernel/pi/idreg-override.c         |  2 +
>>  arch/arm64/tools/cpucaps                      |  1 +
>>  7 files changed, 103 insertions(+)
>>
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index d9fd26b95b34..2749c67a4f07 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -449,6 +449,9 @@
>>  	arm64.no32bit_el0 [ARM64] Unconditionally disable the execution of
>>  			32 bit applications.
>>  
>> +	arm64.nobbml2	[ARM64] Unconditionally disable Break-Before-Make Level
>> +			2 support
> 
> Hmm, I'm not sure we really want this. It opens up the door for folks to
> pass 'id_aa64mmfr2.bbm=2' without updating the allow-list which feels
> like it's going to make crashes harder to reason about.
> 
> Is there a compelling reason to add this right now?

I don't think there is a *compelling* reason. This came about from Suzuki's
feedback at [1]. He was keen to have a mechanism to disable BBML2 in case issues
were found.

But simpler is usually better; I'd be ok with removing.

[1] https://lore.kernel.org/all/0ac0f1f5-e4a0-46ae-8ea0-2eba7e21a7e1@arm.com/

> 
>>  	arm64.nobti	[ARM64] Unconditionally disable Branch Target
>>  			Identification support
>>  
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index a182295e6f08..613b4925ca06 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -2070,6 +2070,25 @@ config ARM64_TLB_RANGE
>>  	  The feature introduces new assembly instructions, and they were
>>  	  support when binutils >= 2.30.
>>  
>> +config ARM64_BBML2_NOABORT
>> +	bool "Enable support for Break-Before-Make Level 2 detection and usage"
>> +	default y
> 
> I don't think we need a new Kconfig option for this. It's a
> kernel-internal detail and I'd prefer not to fragment the testing base.

Fair enough. This originated based on a similar argument to above. Let's just
remove then.

> 
>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>> index 9c4d6d552b25..7a85a1bdc6e9 100644
>> --- a/arch/arm64/kernel/cpufeature.c
>> +++ b/arch/arm64/kernel/cpufeature.c
>> @@ -2200,6 +2200,70 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
>>  	return arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_HVHE);
>>  }
>>  
>> +static bool cpu_has_bbml2_noabort(unsigned int cpu_midr)
>> +{
>> +	/*
>> +	 * We want to allow usage of bbml2 in as wide a range of kernel contexts
>> +	 * as possible. This list is therefore an allow-list of known-good
>> +	 * implementations that both support bbml2 and additionally, fulfill the
>> +	 * extra constraint of never generating TLB conflict aborts when using
>> +	 * the relaxed bbml2 semantics (such aborts make use of bbml2 in certain
>> +	 * kernel contexts difficult to prove safe against recursive aborts).
>> +	 *
>> +	 * Note that implementations can only be considered "known-good" if their
>> +	 * implementors attest to the fact that the implementation never raises
>> +	 * TLBI conflict aborts for bbml2 mapping granularity changes.
>> +	 */
>> +	static const struct midr_range supports_bbml2_noabort_list[] = {
>> +		MIDR_REV_RANGE(MIDR_CORTEX_X4, 0, 3, 0xf),
>> +		MIDR_REV_RANGE(MIDR_NEOVERSE_V3, 0, 2, 0xf),
>> +		{}
>> +	};
>> +
>> +	return is_midr_in_range_list(cpu_midr, supports_bbml2_noabort_list);
> 
> This doesn't compile against latest mainline as is_midr_in_range_list()
> no longer takes the midr.

Will ask Miko to fix.

> 
>> +static bool has_bbml2_noabort(const struct arm64_cpu_capabilities *caps, int scope)
>> +{
>> +	if (!IS_ENABLED(CONFIG_ARM64_BBML2_NOABORT))
>> +		return false;
>> +
>> +	if (scope & SCOPE_SYSTEM) {
>> +		int cpu;
>> +
>> +		/*
>> +		 * We are a boot CPU, and must verify that all enumerated boot
>> +		 * CPUs have MIDR values within our allowlist. Otherwise, we do
>> +		 * not allow the BBML2 feature to avoid potential faults when
>> +		 * the insufficient CPUs access memory regions using BBML2
>> +		 * semantics.
>> +		 */
>> +		for_each_online_cpu(cpu) {
>> +			if (!cpu_has_bbml2_noabort(cpu_read_midr(cpu)))
>> +				return false;
>> +		}
> 
> This penalises large homogeneous systems and it feels unnecessary given
> that we have the ability to check this per-CPU. Can you use
> ARM64_CPUCAP_BOOT_CPU_FEATURE instead of ARM64_CPUCAP_SYSTEM_FEATURE
> to solve this?

We are trying to solve for the case where the boot CPU has BBML2 but a secondary
CPU doesn't. (e.g. hetrogeneous system where boot CPU is big and secondary is
little and does not advertise the feature. I can't remember if we proved there
are real systems with this config - I have vague recollection that we did but my
memory is poor...).

My understanding is that for ARM64_CPUCAP_BOOT_CPU_FEATURE, "If the boot CPU
has enabled this feature already, then every late CPU must have it". So that
would exclude any secondary CPUs without BBML2 from coming online?

Suzuki guided us towards this solution.

How do you see this working with ARM64_CPUCAP_BOOT_CPU_FEATURE? Or do you just
think that all systems will always be homogeneous with respect to FEAT_BBM?

Thanks,
Ryan

> 
> Will


