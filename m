Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92037CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 09:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okEvTqVOoo4zb9TlPAyO07XpcJtVzzqE0sAh7re5ZvU=; b=cLbblwgW58LLH/Bcx+mYnogD0W
	PXfXrpgfrU/SSBiiArDg5wve8AuQMQ2w+iRFxAeFJf0WD4oD5bSWqugddQ/rrERZ+R56bsru+klLg
	3cHKjphCjiqYfOu2HyI8DjhpeNY5aXCtXP+CnxP0c9RxxzvXmETTiiufvB3fha7GdGvyPJ8TYL8h8
	UtQs6Uyu9YtU/cSJn2Y12Bbb46ConcYvw0pfB/m0Wz9Uu5LQGiLpffh4IRtYRB8nS/0wBY9vAPY84
	O52mXg8aLKjAABY9qepga5raH/GDxlGw73XeItnt+Hik7svi+nVDmyBVo5eO3vP86O68/ucNDd9r0
	5uifI8mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyef-0000000ASPa-3yAd;
	Mon, 01 Jun 2026 09:09:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyed-0000000ASPN-35gf
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Jun 2026 09:09:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=okEvTqVOoo4zb9TlPAyO07XpcJtVzzqE0sAh7re5ZvU=; b=cX8U21k5znCwl0ixAPPtYAozU+
	KeUmY5MuyQTK00ajxtfFBsUO5ewiOw/M9fE2YkMNq8mB83VdaF3X13GKuCuo/clpSLL3uJ1tfB2WJ
	EkNBTZxXpJrhS6TQ2+e9EjE9oWqnv+ZYOEs3GI6/RzruXYejrda+lPH0SCcOI7dlUU2KsbzHH8t8n
	SEDAYkKyeK7h7aBca2FAoeEjxNtKV3UJU2u7iP+39dIR0b2PJG5QeUVbqDcFOgJsvk6xjtAouDExe
	5rc1QgDbmIN8EnhdHezrLNAZi20giihzi9EEQlh3QeyLnrvsuO2p0erdpwOG1VIwCR/WqNRZwvB2A
	cOlikvHw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyea-00000006BKI-0VXl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 09:09:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BAD91FCD;
	Mon,  1 Jun 2026 02:09:40 -0700 (PDT)
Received: from [10.57.72.38] (unknown [10.57.72.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2E7A3F905;
	Mon,  1 Jun 2026 02:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780304985; bh=bGko8OABDqOiipnO9PQ5X/iKfJawFh8TXGCB8OtqLAw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RCajWz98ja/sZRPh/oFEnbImqK0BLXhY4yaLyyqG6o/g20Dw10PNbgJ/DhYlNKHO4
	 /cWmo8yw3s0MQ9vLdnXamPWN0GFgWTk+eJJcWML3yUZw0kGYK1dmcvbijDNMdy68eS
	 cLNR0hchc1urmzp69S1aiYOGFLGvOI9QXzVW0pww=
Message-ID: <0958edfa-1f0d-43a3-9332-a9b4f88423fd@arm.com>
Date: Mon, 1 Jun 2026 10:09:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: kernel: Unify CNP disable workaround into
 ARM64_WORKAROUND_DISABLE_CNP
To: Zeng Heng <zengheng@huaweicloud.com>, xuwei5@huawei.com,
 wangyushan12@huawei.com, maz@kernel.org, skhan@linuxfoundation.org,
 miko.lenczewski@arm.com, lucaswei@google.com, broonie@kernel.org,
 thuth@redhat.com, ryan.roberts@arm.com, tongtiangen@huawei.com,
 oupton@kernel.org, kuninori.morimoto.gx@renesas.com, mark.rutland@arm.com,
 will@kernel.org, corbet@lwn.net, catalin.marinas@arm.com,
 kevin.brodsky@arm.com, lpieralisi@kernel.org, yangyicong@hisilicon.com,
 james.clark@linaro.org, yeoreum.yun@arm.com
Cc: linux-doc@vger.kernel.org, wangkefeng.wang@huawei.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260529063132.766491-1-zengheng@huaweicloud.com>
 <1e107eba-e28c-4fbf-80dc-808b8c3f4bb5@arm.com>
 <58ffd225-c9d0-b2f6-eefe-13c056746faa@huaweicloud.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <58ffd225-c9d0-b2f6-eefe-13c056746faa@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_100948_763406_39161D81 
X-CRM114-Status: GOOD (  22.68  )
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

Hi,

On 6/1/26 09:50, Zeng Heng wrote:
> Hi Vladimir,
> 
> On 2026/5/29 17:17, Vladimir Murzin wrote:
>> Hi,
>>
>> On 5/29/26 07:31, Zeng Heng wrote:
>>> From: Zeng Heng <zengheng4@huawei.com>
>>>
>>> HiSilicon HIP09 implements TLB entry matching behavior that deviates
>>> from the ARM architecture specification when the CnP (Common not Private)
>>> bit is set in TTBRx_ELx.
>>>
>>> When TTBRx.CNP=1, TLB entries may be incorrectly shared between CPU
>>> cores, leading to TLB conflicts and stale mappings. This breaks
>>> coherency and can result in incorrect translations.
>>>
>>> Add the hardware erratum workaround (Hisilicon erratum 162100125) to
>>> disable CNP on affected HIP09 cores.
>>>
>>> Merge the existing NVIDIA Carmel and the HiSilicon HIP09 CNP errata
>>> workarounds into a single generic capability ARM64_WORKAROUND_DISABLE_CNP.
>>>
>>> Both NVIDIA Carmel and HiSilicon HIP09 have hardware errata where
>>> CNP (Common Not Private) behavior differs from the ARM specification,
>>> causing incorrect TLB entry sharing between cores. The existing
>>> NVIDIA_CARMEL_CNP_ERRATUM and the newly added HISILICON_ERRATUM_162100125
>>> are now both handled by the unified ARM64_WORKAROUND_DISABLE_CNP.
>>>
>>> Co-developed-by: Tong Tiangen <tongtiangen@huawei.com>
>>> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
>>> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
>>> ---
>>> v1: https://lore.kernel.org/all/20260526015720.206854-1-zengheng@huaweicloud.com/
>>>
>>> Changes in v2:
>>>    - Unify CNP disable workaround into ARM64_WORKAROUND_DISABLE_CNP
>>> ---
>>>
>>>   Documentation/arch/arm64/silicon-errata.rst |  4 +++-
>>>   arch/arm64/Kconfig                          | 17 ++++++++++++-----
>>>   arch/arm64/include/asm/cpucaps.h            |  4 ++--
>>>   arch/arm64/kernel/cpu_errata.c              | 17 ++++++++++++-----
>>>   arch/arm64/kernel/cpufeature.c              |  2 +-
>>>   arch/arm64/tools/cpucaps                    |  2 +-
>>>   6 files changed, 31 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
>>> index 211119ce7adc..b4565e1a726d 100644
>>> --- a/Documentation/arch/arm64/silicon-errata.rst
>>> +++ b/Documentation/arch/arm64/silicon-errata.rst
>>> @@ -254,7 +254,7 @@ stable kernels.
>>>   | Marvell        | ARM-MMU-500     | #582743         | N/A                         |
>>>   +----------------+-----------------+-----------------+-----------------------------+
>>>   +----------------+-----------------+-----------------+-----------------------------+
>>> -| NVIDIA         | Carmel Core     | N/A             | NVIDIA_CARMEL_CNP_ERRATUM   |
>>> +| NVIDIA         | Carmel Core     | N/A             | ARM64_WORKAROUND_DISABLE_CNP|
>>>   +----------------+-----------------+-----------------+-----------------------------+
>>>   | NVIDIA         | T241 GICv3/4.x  | T241-FABRIC-4   | N/A                         |
>>>   +----------------+-----------------+-----------------+-----------------------------+
>>> @@ -284,6 +284,8 @@ stable kernels.
>>>   +----------------+-----------------+-----------------+-----------------------------+
>>>   | Hisilicon      | Hip09           | #162100801      | HISILICON_ERRATUM_162100801 |
>>>   +----------------+-----------------+-----------------+-----------------------------+
>>> +| Hisilicon      | Hip09           | #162100125      | ARM64_WORKAROUND_DISABLE_CNP|
>>> ++----------------+-----------------+-----------------+-----------------------------+
>>>   +----------------+-----------------+-----------------+-----------------------------+
>>>   | Qualcomm Tech. | Kryo/Falkor v1  | E1003           | QCOM_FALKOR_ERRATUM_1003    |
>>>   +----------------+-----------------+-----------------+-----------------------------+
>>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>>> index fe60738e5943..dc0bd32ea2d1 100644
>>> --- a/arch/arm64/Kconfig
>>> +++ b/arch/arm64/Kconfig
>>> @@ -1315,13 +1315,20 @@ config QCOM_FALKOR_ERRATUM_E1041
>>>
>>>         If unsure, say Y.
>>>
>>> -config NVIDIA_CARMEL_CNP_ERRATUM
>>> -    bool "NVIDIA Carmel CNP: CNP on Carmel semantically different than ARM cores"
>>> +config ARM64_WORKAROUND_DISABLE_CNP
>>> +    bool "Disable CNP on affected CPUs"
>>>       default y
>>>       help
>>> -      If CNP is enabled on Carmel cores, non-sharable TLBIs on a core will not
>>> -      invalidate shared TLB entries installed by a different core, as it would
>>> -      on standard ARM cores.
>>> +      This option disables the CNP (Common Not Private) feature on CPUs
>>> +      that have hardware errata affecting CNP behavior.
>>> +
>>> +      On NVIDIA Carmel cores, CNP behaves differently than on standard ARM
>>> +      cores: non-shareable TLBIs on a core may not invalidate shared TLB
>>> +      entries installed by a different core.
>>> +
>>> +      On Hisilicon HIP09 cores, TLB entries may be incorrectly shared
>>> +      between cores when TTBRx.CNP=1, leading to TLB conflicts and
>>> +      stale mappings.
>>>
>>>         If unsure, say Y.
>>>
>> I'm afraid we cannot swap one config with another. Instead, we need to follow
>> established pattern for sharing workaround, something like
>>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 378e50fef247..68eb2993cfd3 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -1315,9 +1315,13 @@ config QCOM_FALKOR_ERRATUM_E1041
>>              If unsure, say Y.
>>   +config ARM64_WORKAROUND_DISABLE_CNP
>> +       bool
>> +
>>   config NVIDIA_CARMEL_CNP_ERRATUM
>>          bool "NVIDIA Carmel CNP: CNP on Carmel semantically different than ARM cores"
>>          default y
>> +       select ARM64_WORKAROUND_DISABLE_CNP
>>          help
>>            If CNP is enabled on Carmel cores, non-sharable TLBIs on a core will not
>>            invalidate shared TLB entries installed by a different core, as it would
>>
>>
>> and related changes for generalisation of the workaround - that would to be patch 1/2.
>>
>> Then we can easily wire-up your errata with something like
>>
>> +config HISILICON_ERRATUM_162100125
>> +       bool "Hisilicon erratum 162100125"
>> +       default y
>> +       select ARM64_WORKAROUND_DISABLE_CNP
>> +       help
>> +         On HiSilicon HIP09, TLB entry matching behavior when CNP
>> +         (TTBRx.CNP=1) is enabled differs from the ARM architecture
>> +         specification.
>> +
>> +         TLB entries may be incorrectly shared between CPUs, potentially
>> +         causing TLB conflicts and stale mappings.
>> +
>> +         Disable CNP support for affected HiSilicon HIP09 cores.
>> +
>> +         If unsure, say Y.
>>
>> and related update in documentation and MIDR list - that would be patch 2/2
>>
>> Thanks
>> Vladimir
>>  
>>> diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
>>> index d0d3cdd5763c..25c61cda901c 100644
>>> --- a/arch/arm64/include/asm/cpucaps.h
>>> +++ b/arch/arm64/include/asm/cpucaps.h
>>> @@ -58,8 +58,8 @@ cpucap_is_possible(const unsigned int cap)
>>>           return IS_ENABLED(CONFIG_ARM64_ERRATUM_2658417);
>>>       case ARM64_WORKAROUND_CAVIUM_23154:
>>>           return IS_ENABLED(CONFIG_CAVIUM_ERRATUM_23154);
>>> -    case ARM64_WORKAROUND_NVIDIA_CARMEL_CNP:
>>> -        return IS_ENABLED(CONFIG_NVIDIA_CARMEL_CNP_ERRATUM);
>>> +    case ARM64_WORKAROUND_DISABLE_CNP:
>>> +        return IS_ENABLED(CONFIG_ARM64_WORKAROUND_DISABLE_CNP);
>>>       case ARM64_WORKAROUND_REPEAT_TLBI:
>>>           return IS_ENABLED(CONFIG_ARM64_WORKAROUND_REPEAT_TLBI);
>>>       case ARM64_WORKAROUND_SPECULATIVE_SSBS:
>>> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
>>> index 5377e4c2eba2..675cd059165c 100644
>>> --- a/arch/arm64/kernel/cpu_errata.c
>>> +++ b/arch/arm64/kernel/cpu_errata.c
>>> @@ -394,6 +394,14 @@ static const struct arm64_cpu_capabilities qcom_erratum_1003_list[] = {
>>>   };
>>>   #endif
>>>
>>> +#ifdef CONFIG_ARM64_WORKAROUND_DISABLE_CNP
>>> +static const struct midr_range cnp_erratum_cpus[] = {
>>> +    MIDR_ALL_VERSIONS(MIDR_NVIDIA_CARMEL),
>>> +    MIDR_ALL_VERSIONS(MIDR_HISI_HIP09),
>>> +    {},
>>> +};
>>> +#endif
>>> +
>>>   #ifdef CONFIG_ARM64_WORKAROUND_CLEAN_CACHE
>>>   static const struct midr_range workaround_clean_cache[] = {
>>>   #if    defined(CONFIG_ARM64_ERRATUM_826319) || \
>>> @@ -801,12 +809,11 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
>>>                     1, 0),
>>>       },
>>>   #endif
>>> -#ifdef CONFIG_NVIDIA_CARMEL_CNP_ERRATUM
>>> +#ifdef CONFIG_ARM64_WORKAROUND_DISABLE_CNP
>>>       {
>>> -        /* NVIDIA Carmel */
>>> -        .desc = "NVIDIA Carmel CNP erratum",
>>> -        .capability = ARM64_WORKAROUND_NVIDIA_CARMEL_CNP,
>>> -        ERRATA_MIDR_ALL_VERSIONS(MIDR_NVIDIA_CARMEL),
>>> +        .desc = "NVIDIA Carmel CNP erratum, or Hisilicon erratum 162100125",
>>> +        .capability = ARM64_WORKAROUND_DISABLE_CNP,
>>> +        ERRATA_MIDR_RANGE_LIST(cnp_erratum_cpus),
>>>       },
>>>   #endif
>>>   #ifdef CONFIG_ARM64_WORKAROUND_TRBE_OVERWRITE_FILL_MODE
>>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>>> index 6d53bb15cf7b..20c5f24f74a9 100644
>>> --- a/arch/arm64/kernel/cpufeature.c
>>> +++ b/arch/arm64/kernel/cpufeature.c
>>> @@ -1785,7 +1785,7 @@ has_useable_cnp(const struct arm64_cpu_capabilities *entry, int scope)
>>>       if (is_kdump_kernel())
>>>           return false;
>>>
>>> -    if (cpus_have_cap(ARM64_WORKAROUND_NVIDIA_CARMEL_CNP))
>>> +    if (cpus_have_cap(ARM64_WORKAROUND_DISABLE_CNP))
> 
> Here, ARM64_WORKAROUND_DISABLE_CNP comes from arch/arm64/tools/cpucaps,
> not from arch/arm64/Kconfig. Therefore, if we do not replace WORKAROUND_NVIDIA_CARMEL_CNP
> in arch/arm64/tools/cpucaps, we will have to continue adding a redundant
> WORKAROUND_DISABLE_CNP along with its corresponding redundant logic.
> 
> I prefer to keep CONFIG_ARM64_WORKAROUND_NVIDIA_CARMEL_CNP in arch/arm64/Kconfig
> and replace WORKAROUND_NVIDIA_CARMEL_CNP in arch/arm64/tools/cpucaps.
> 
> I would like to confirm whether the above aligns with your expectations.
> 

Yes indeed, keep config and generalise capability.

Thanks
Vladimir

> 
> Best regards,
> Zeng Heng
> 
> 
>>>           return false;
>>>
>>>       return has_cpuid_feature(entry, scope);
>>> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
>>> index 811c2479e82d..9b85a84f6fd4 100644
>>> --- a/arch/arm64/tools/cpucaps
>>> +++ b/arch/arm64/tools/cpucaps
>>> @@ -120,7 +120,7 @@ WORKAROUND_CAVIUM_TX2_219_PRFM
>>>   WORKAROUND_CAVIUM_TX2_219_TVM
>>>   WORKAROUND_CLEAN_CACHE
>>>   WORKAROUND_DEVICE_LOAD_ACQUIRE
>>> -WORKAROUND_NVIDIA_CARMEL_CNP
>>> +WORKAROUND_DISABLE_CNP
>>>   WORKAROUND_PMUV3_IMPDEF_TRAPS
>>>   WORKAROUND_QCOM_FALKOR_E1003
>>>   WORKAROUND_QCOM_ORYON_CNTVOFF
>>> -- 
>>> 2.43.0
>>>
> 


