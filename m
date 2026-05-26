Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB83ECD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 12:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k6UJo4pZSxmwVwN6SJHCB6KePie4SHwN/GD0EnZdR7A=; b=WJBwZfUGehLaf4A0FuCIjxXUrD
	WzI9/GzJBdFJFTHG6AiF2lT9lvXxpJUWeYML3sw+cdFgbhG4fC8nRua/2769AI1t3tu78zYGRVLY0
	08Jl1fj3X+HE/NxK1mlK1IVxTd2bFQdaQaUaxstbpHQuLKxMk+lWNBhPY7b2dt5x5tPRZMqzhNuDN
	V2LmNGtiPP2yoJv0mvbGaM/KlN4DLi/ndb4tFvN/vMI6PajA1k9EKeU8uDMfijIDUl49rmpIsBpfX
	ADv+AkQMh8gPsm29DeRN0vn4xJbGIITH9IQbTshQY/wbvRXIpt8NzrJ9QfVYS8eU0p6kk//oYh/dz
	hWhswAlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRql4-00000001tkl-0uVO;
	Tue, 26 May 2026 12:19:42 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRql0-00000001tjl-0iTE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 12:19:40 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gPsH03RRnzYQtsm
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 20:18:36 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 1A71940573
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 20:19:31 +0800 (CST)
Received: from [10.174.179.37] (unknown [10.174.179.37])
	by APP4 (Coremail) with SMTP id gCh0CgAX31rQjxVq6kXSDg--.29133S3;
	Tue, 26 May 2026 20:19:30 +0800 (CST)
Message-ID: <262fdd41-81bf-fb65-c1b7-c9f15e893156@huaweicloud.com>
Date: Tue, 26 May 2026 20:19:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] arm64: kernel: Disable CNP on HiSilicon HIP09
Content-Language: en-US
To: Vladimir Murzin <vladimir.murzin@arm.com>,
 Zeng Heng <zengheng@huaweicloud.com>, corbet@lwn.net,
 kuninori.morimoto.gx@renesas.com, maz@kernel.org, oupton@kernel.org,
 catalin.marinas@arm.com, lucaswei@google.com, yeoreum.yun@arm.com,
 skhan@linuxfoundation.org, james.clark@linaro.org, broonie@kernel.org,
 mark.rutland@arm.com, lpieralisi@kernel.org, ryan.roberts@arm.com,
 will@kernel.org, tongtiangen@huawei.com, kevin.brodsky@arm.com,
 yangyicong@hisilicon.com, miko.lenczewski@arm.com
Cc: linux-doc@vger.kernel.org, wangkefeng.wang@huawei.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 sunnanyong@huawei.com
References: <20260526015720.206854-1-zengheng@huaweicloud.com>
 <3e7d5472-9c40-456c-876e-c2e71fa0e8fa@arm.com>
From: Zeng Heng <zengheng@huaweicloud.com>
In-Reply-To: <3e7d5472-9c40-456c-876e-c2e71fa0e8fa@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: gCh0CgAX31rQjxVq6kXSDg--.29133S3
X-Coremail-Antispam: 1UD129KBjvJXoW3GryrGr1ktFyxZFy5tw18Xwb_yoW7XF15pw
	4fJr4fJF1DWF13G34UXw1UXr45Ca1fGwn0gF1Utry0qr1avryUAF18Xw1xGFWjqrykWw48
	ur1j9FyjyF17ArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBY14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
	c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sRidbbtUUUUU==
X-CM-SenderInfo: p2hqwxhhqjqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_051938_660632_0BA58C94 
X-CRM114-Status: GOOD (  19.68  )
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

Hi Vladimir,

On 2026/5/26 20:10, Vladimir Murzin wrote:
> Hi,
> 
> On 5/26/26 02:57, Zeng Heng wrote:
>> From: Tong Tiangen <tongtiangen@huawei.com>
>>
>> HiSilicon HIP09 implements TLB entry matching behavior that deviates
>> from the ARM architecture specification when the CNP (Common not Private)
>> bit is set in TTBRx_ELx.
>>
>> When TTBRx.CNP=1, TLB entries may be incorrectly shared between CPU
>> cores, leading to TLB conflicts and stale mappings. This affects
>> coherency and can result in incorrect translations.
>>
>> Add the hardware erratum workaround (Hisilicon erratum 162100125) to
>> disable CNP on affected HIP09 cores.
>>
>> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
>> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
>> ---
>>   Documentation/arch/arm64/silicon-errata.rst |  2 ++
>>   arch/arm64/Kconfig                          | 15 +++++++++++++++
>>   arch/arm64/kernel/cpu_errata.c              |  7 +++++++
>>   arch/arm64/kernel/cpufeature.c              |  3 ++-
>>   arch/arm64/tools/cpucaps                    |  1 +
>>   5 files changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
>> index 211119ce7adc..cd50059edb85 100644
>> --- a/Documentation/arch/arm64/silicon-errata.rst
>> +++ b/Documentation/arch/arm64/silicon-errata.rst
>> @@ -284,6 +284,8 @@ stable kernels.
>>   +----------------+-----------------+-----------------+-----------------------------+
>>   | Hisilicon      | Hip09           | #162100801      | HISILICON_ERRATUM_162100801 |
>>   +----------------+-----------------+-----------------+-----------------------------+
>> +| Hisilicon      | Hip09           | #162100125      | HISILICON_ERRATUM_162100125 |
>> ++----------------+-----------------+-----------------+-----------------------------+
>>   +----------------+-----------------+-----------------+-----------------------------+
>>   | Qualcomm Tech. | Kryo/Falkor v1  | E1003           | QCOM_FALKOR_ERRATUM_1003    |
>>   +----------------+-----------------+-----------------+-----------------------------+
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index fe60738e5943..ed6207c75b54 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -1273,6 +1273,21 @@ config HISILICON_ERRATUM_162100801
>>   
>>   	  If unsure, say Y.
>>   
>> +config HISILICON_ERRATUM_162100125
>> +	bool "Hisilicon erratum 162100125"
>> +	default y
>> +	help
>> +	  On HiSilicon HIP09, TLB entry matching behavior when CNP
>> +	  (TTBRx.CNP=1) is enabled differs from the ARM architecture
>> +	  specification.
>> +
>> +	  TLB entries may be incorrectly shared between CPUs, potentially
>> +	  causing TLB conflicts and stale mappings.
>> +
>> +	  Disable CNP support for affected HiSilicon HIP09 cores.
>> +
>> +	  If unsure, say Y.
>> +
>>   config QCOM_FALKOR_ERRATUM_1003
>>   	bool "Falkor E1003: Incorrect translation due to ASID change"
>>   	default y
>> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
>> index 5377e4c2eba2..26d9677a20fc 100644
>> --- a/arch/arm64/kernel/cpu_errata.c
>> +++ b/arch/arm64/kernel/cpu_errata.c
>> @@ -968,6 +968,13 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
>>   		.matches = has_impdef_pmuv3,
>>   		.cpu_enable = cpu_enable_impdef_pmuv3_traps,
>>   	},
>> +#ifdef CONFIG_HISILICON_ERRATUM_162100125
>> +	{
>> +		.desc = "Hisilicon erratum 162100125",
>> +		.capability = ARM64_WORKAROUND_HISILICON_ERRATUM_162100125,
>> +		ERRATA_MIDR_ALL_VERSIONS(MIDR_HISI_HIP09),
>> +	},
>> +#endif
>>   	{
>>   	}
>>   };
>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>> index 6d53bb15cf7b..c4b0db77a58a 100644
>> --- a/arch/arm64/kernel/cpufeature.c
>> +++ b/arch/arm64/kernel/cpufeature.c
>> @@ -1785,7 +1785,8 @@ has_useable_cnp(const struct arm64_cpu_capabilities *entry, int scope)
>>   	if (is_kdump_kernel())
>>   		return false;
>>   
>> -	if (cpus_have_cap(ARM64_WORKAROUND_NVIDIA_CARMEL_CNP))
>> +	if (cpus_have_cap(ARM64_WORKAROUND_NVIDIA_CARMEL_CNP) ||
>> +	    cpus_have_cap(ARM64_WORKAROUND_HISILICON_ERRATUM_162100125))
>>   		return false;
> 
> Since we now have a second user for this workaround, would it
> make sense to:
> 1. factor out the existing ARM64_WORKAROUND_NVIDIA_CARMEL_CNP into a common capability,
>     for example ARM64_WORKAROUND_DISABLE_CNP
> 2. wire up erratum 162100125 to use the common ARM64_WORKAROUND_DISABLE_CNP capability?
> 
> Cheers
> Vladimir
> 

This makes sense to me. Thanks for the reminder.

Best regards,
Zeng Heng

>>   
>>   	return has_cpuid_feature(entry, scope);
>> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
>> index 811c2479e82d..b797d4893adc 100644
>> --- a/arch/arm64/tools/cpucaps
>> +++ b/arch/arm64/tools/cpucaps
>> @@ -128,3 +128,4 @@ WORKAROUND_REPEAT_TLBI
>>   WORKAROUND_SPECULATIVE_AT
>>   WORKAROUND_SPECULATIVE_SSBS
>>   WORKAROUND_SPECULATIVE_UNPRIV_LOAD
>> +WORKAROUND_HISILICON_ERRATUM_162100125
>> -- 2.43.0
>>
> 
> 
> 


