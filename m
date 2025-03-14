Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D393C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 12:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCDKKkmmEmBFVBRPnxzjptz4ApPAEAkcTpipePaX/0I=; b=iI6xETj32HwxNKqZGhK3xhkkxA
	h7AYhh1hDc0LqA7jIVX983H5pvl1npa1vcU44ivD0gfVbOpvtslgiYe2tgfMdNdLQY8alPQWqMj3O
	0VcTQ4uevLs4r9O/+R3uomK6sTA1Zi/u5FEleYMpSZSygUEQuY86FXRdCGwpLG89icaE7Is3Layxh
	Eip+yKt0gT1W8Eyycw+A2kMVErYdGLiijXzuhq8POCFzx2h8+Gvq/memwpklt7b5277QailyAfnHI
	0mtp5QcxvEbTNZdOjZn2FswhZ+vFe9/rRkj7WYQw9IhLnkfL8naO2Rd9mQYkXBgVWwb8+V0RkXiHY
	HcxvzSPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt4GL-0000000EBSh-044t;
	Fri, 14 Mar 2025 12:35:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt4Ee-0000000EBEx-3q2z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 12:33:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEA351424;
	Fri, 14 Mar 2025 05:34:03 -0700 (PDT)
Received: from [10.57.67.32] (unknown [10.57.67.32])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 859543F5A1;
	Fri, 14 Mar 2025 05:33:49 -0700 (PDT)
Message-ID: <3bba7adb-392b-4024-984f-b6f0f0f88629@arm.com>
Date: Fri, 14 Mar 2025 12:33:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm64: Add BBM Level 2 cpu feature
Content-Language: en-GB
To: Ryan Roberts <ryan.roberts@arm.com>, Marc Zyngier <maz@kernel.org>
Cc: =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>,
 yang@os.amperecomputing.com, corbet@lwn.net, catalin.marinas@arm.com,
 will@kernel.org, jean-philippe@linaro.org, robin.murphy@arm.com,
 joro@8bytes.org, akpm@linux-foundation.org, mark.rutland@arm.com,
 joey.gouly@arm.com, james.morse@arm.com, broonie@kernel.org,
 anshuman.khandual@arm.com, oliver.upton@linux.dev, ioworker0@gmail.com,
 baohua@kernel.org, david@redhat.com, jgg@ziepe.ca,
 shameerali.kolothum.thodi@huawei.com, nicolinc@nvidia.com,
 mshavit@google.com, jsnitsel@redhat.com, smostafa@google.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
References: <20250313104111.24196-2-miko.lenczewski@arm.com>
 <20250313104111.24196-3-miko.lenczewski@arm.com>
 <86ikocomvd.wl-maz@kernel.org> <f244c20e-e11c-477b-9487-cb6738c028ca@arm.com>
 <86h63wok11.wl-maz@kernel.org> <4998dd9b-106d-4ca7-be88-5330429dcfe8@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <4998dd9b-106d-4ca7-be88-5330429dcfe8@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_053357_042070_9AF5898F 
X-CRM114-Status: GOOD (  24.81  )
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

On 14/03/2025 09:18, Ryan Roberts wrote:
> On 13/03/2025 18:36, Marc Zyngier wrote:
>> On Thu, 13 Mar 2025 18:22:00 +0000,
>> Ryan Roberts <ryan.roberts@arm.com> wrote:
>>>
>>> On 13/03/2025 17:34, Marc Zyngier wrote:
>>>> On Thu, 13 Mar 2025 10:41:10 +0000,
>>>> Mikołaj Lenczewski <miko.lenczewski@arm.com> wrote:
>>>>>
>>>>> diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
>>>>> index c6b185b885f7..9728faa10390 100644
>>>>> --- a/arch/arm64/kernel/pi/idreg-override.c
>>>>> +++ b/arch/arm64/kernel/pi/idreg-override.c
>>>>> @@ -209,6 +209,7 @@ static const struct ftr_set_desc sw_features __prel64_initconst = {
>>>>>   		FIELD("nokaslr", ARM64_SW_FEATURE_OVERRIDE_NOKASLR, NULL),
>>>>>   		FIELD("hvhe", ARM64_SW_FEATURE_OVERRIDE_HVHE, hvhe_filter),
>>>>>   		FIELD("rodataoff", ARM64_SW_FEATURE_OVERRIDE_RODATA_OFF, NULL),
>>>>> +		FIELD("nobbml2", ARM64_SW_FEATURE_OVERRIDE_NOBBML2, NULL),
>>>>>   		{}
>>>>>   	},
>>>>>   };
>>>>> @@ -246,6 +247,7 @@ static const struct {
>>>>>   	{ "rodata=off",			"arm64_sw.rodataoff=1" },
>>>>>   	{ "arm64.nolva",		"id_aa64mmfr2.varange=0" },
>>>>>   	{ "arm64.no32bit_el0",		"id_aa64pfr0.el0=1" },
>>>>> +	{ "arm64.nobbml2",		"arm64_sw.nobbml2=1" },
>>>>
>>>> Why is that a SW feature? This looks very much like a HW feature to
>>>> me, and you should instead mask out ID_AA64MMFR2_EL1.BBM, and be done
>>>> with it. Something like:
>>>
>>> I think this implies that we would expect the BBM field to be advertising BBML2
>>> support normally and we would check for that as part of the cpufeature
>>> detection. That's how Miko was doing it in v2, but Yang pointed out that
>>> AmpereOne, which supports BBML2+NOABORT semantics, doesn't actually advertise
>>> BBML2 in its MMFR2. So we don't want to check that field, and instead rely
>>> solely on the MIDR allow-list + a command line override. It was me that
>>> suggested putting that in the SW feature register, and I think that still sounds
>>> like the right solution for this situation?
>>
>> I think this is mixing two different things:
>>
>> - preventing BBM-L2 from being visible to the kernel: this is what my
>>    suggestion is doing by nuking an architectural feature in the
>>    relevant register
>>
>> - random HW not correctly advertising what they are doing: this is an
>>    erratum workaround
>>
>> I'd rather we don't conflate the two things, and make them very
>> explicitly distinct.
> 
> It all sounds so obvious when you put it like that! :)
> 
> I'm guessing there is a layer where the workaround can be applied to the
> sanitised feature registers on a per-cpu basis and that won't affect this global
> override which will remain as an overlay on top? If so then that sounds perfect
> (you can probably tell I find the whole feature management framework rather
> inpeneterable). That workaround would be added as part of Yang's series anyway.

Unfortunately, there is no easy way to fix this via the normal erratum
workaround "capability". The sanitised feature registers are handled
separately (initialised via init_cpu_features() for boot CPU and
sanitised eachtime via update_cpu_features).

Also we do not "enable" any capability (i.e. calling cpu_enable())
until the very end, after the CPUs are all brought up (except for boot 
CPUs).

But it may be possible to "fix up" the BBML2 feature in
cpuinfo_store_*cpu(), without using the "enable" call back.

Something like:

diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index 285d7d538342..8c23adbe29f8 100644
--- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -479,7 +479,11 @@ static void __cpuinfo_store_cpu(struct 
cpuinfo_arm64 *info)
         info->reg_id_aa64mmfr0 = read_cpuid(ID_AA64MMFR0_EL1);
         info->reg_id_aa64mmfr1 = read_cpuid(ID_AA64MMFR1_EL1);
         info->reg_id_aa64mmfr2 = read_cpuid(ID_AA64MMFR2_EL1);

+	/*
+	 * The CPU cap is not detected system wide, but we are able to
+	 * check if this CPU is affected by the Erratum.
+	 */
+       if (this_cpu_has_cap(AMPERE_ONE_ERRATUM_BBML2))
+               // Fixup  info->reg_id_aa64_mmfr2 with BBML2.
+
         info->reg_id_aa64mmfr3 = read_cpuid(ID_AA64MMFR3_EL1);
         info->reg_id_aa64mmfr4 = read_cpuid(ID_AA64MMFR4_EL1);
         info->reg_id_aa64pfr0 = read_cpuid(ID_AA64PFR0_EL1);
         info->reg_id_aa64pfr1 = read_cpuid(ID_AA64PFR1_EL1);

Suzuki

> 
> So sounds like we are back to testing MMFR2.BBM in the matches function, with
> the addition of Maz's proposal above. Sorry for sending you round the houses, Miko.
> 
> Thanks,
> Ryan
> 
>>
>> Thanks,
>>
>> 	M.
>>
> 


