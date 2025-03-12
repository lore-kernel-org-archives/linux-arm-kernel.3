Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6E3C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 18:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3LuHCHpuveXkpSQUcYt/4aNBi7uFbOG/3oEGn8E8LXY=; b=Of00jrt9VEpMN5s5LmDVzzHjfs
	EKZzTlY6T7dQBSIikbxw3BoWKaNv+VqToWn4KYkviKsXVuhedrjjmguBBGNMuMGhOQ2ehTREaKOwj
	4fZ/EAmrnzvOJg7qrQvdUVcKUk+HOtPJ3QpRl4wyNeSfbuaaCIqHs4GJOo7Jinl4tmrU91nky7D/0
	AxVLRJfZ6SlqKD2jsl14KXqXu5C+kqb1+Bsy9o7L5t4W7C+khpDeyI7RsSsPOh62r0gC/23Ig4/3v
	6ag8yYDueeCEYvqdnUlkxbJPnHOqvAezEZ55BwgiBhfnatrxXbo4Dgj0jfHvefbvJmec72viamHQC
	1Bd4sZCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsQU4-00000009Dg3-3Hae;
	Wed, 12 Mar 2025 18:07:12 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsQS0-00000009DR6-2oww
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 18:05:06 +0000
Received: from [10.0.0.114] (c-67-182-156-199.hsd1.wa.comcast.net [67.182.156.199])
	by linux.microsoft.com (Postfix) with ESMTPSA id 1B63C210B155;
	Wed, 12 Mar 2025 11:05:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1B63C210B155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741802702;
	bh=3LuHCHpuveXkpSQUcYt/4aNBi7uFbOG/3oEGn8E8LXY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jYKT7aaV5gspSop8H5hJDvSoYzQZSeYlg64Ifr722u0Nb9Lg5Imcrfh9r7PIfD5lT
	 6Gx7WdXYzK5Qkk74C6o++r7isZrfq5nwtn1HQ8mbeg+mlVaPIh0Da7Nxn0zjSmQ6i1
	 ISWSMrdAV6mX4SniwmTsX/jUZuFL1ANTVkqQw/UY=
Message-ID: <8520ef42-6cb4-4e14-9700-de7ae8a99ae8@linux.microsoft.com>
Date: Wed, 12 Mar 2025 11:04:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] x86/mshyperv: Add support for extended Hyper-V
 features
To: Michael Kelley <mhklinux@outlook.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
Cc: "kys@microsoft.com" <kys@microsoft.com>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>,
 "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "joro@8bytes.org" <joro@8bytes.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, "arnd@arndb.de"
 <arnd@arndb.de>,
 "jinankjain@linux.microsoft.com" <jinankjain@linux.microsoft.com>,
 "muminulrussell@gmail.com" <muminulrussell@gmail.com>,
 "skinsburskii@linux.microsoft.com" <skinsburskii@linux.microsoft.com>,
 "mrathor@linux.microsoft.com" <mrathor@linux.microsoft.com>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
 "apais@linux.microsoft.com" <apais@linux.microsoft.com>,
 "Tianyu.Lan@microsoft.com" <Tianyu.Lan@microsoft.com>,
 "stanislav.kinsburskiy@gmail.com" <stanislav.kinsburskiy@gmail.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "prapal@linux.microsoft.com" <prapal@linux.microsoft.com>,
 "muislam@microsoft.com" <muislam@microsoft.com>,
 "anrayabh@linux.microsoft.com" <anrayabh@linux.microsoft.com>,
 "rafael@kernel.org" <rafael@kernel.org>, "lenb@kernel.org"
 <lenb@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-3-git-send-email-nunodasneves@linux.microsoft.com>
 <SN6PR02MB4157CBBC2D186E1944E6773AD4CA2@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <SN6PR02MB4157CBBC2D186E1944E6773AD4CA2@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_110504_764403_2FC4BE53 
X-CRM114-Status: GOOD (  19.58  )
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

On 3/6/2025 10:30 AM, Michael Kelley wrote:
> From: Nuno Das Neves <nunodasneves@linux.microsoft.com> Sent: Wednesday, February 26, 2025 3:08 PM
>>
>> From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
>>
>> Extend the "ms_hyperv_info" structure to include a new field,
>> "ext_features", for capturing extended Hyper-V features.
>> Update the "ms_hyperv_init_platform" function to retrieve these features
>> using the cpuid instruction and include them in the informational output.
>>
>> Signed-off-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
>> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
>> ---
>>  arch/x86/kernel/cpu/mshyperv.c | 6 ++++--
>>  include/asm-generic/mshyperv.h | 1 +
>>  2 files changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
>> index 4f01f424ea5b..2c29dfd6de19 100644
>> --- a/arch/x86/kernel/cpu/mshyperv.c
>> +++ b/arch/x86/kernel/cpu/mshyperv.c
>> @@ -434,13 +434,15 @@ static void __init ms_hyperv_init_platform(void)
>>  	 */
>>  	ms_hyperv.features = cpuid_eax(HYPERV_CPUID_FEATURES);
>>  	ms_hyperv.priv_high = cpuid_ebx(HYPERV_CPUID_FEATURES);
>> +	ms_hyperv.ext_features = cpuid_ecx(HYPERV_CPUID_FEATURES);
>>  	ms_hyperv.misc_features = cpuid_edx(HYPERV_CPUID_FEATURES);
>>  	ms_hyperv.hints    = cpuid_eax(HYPERV_CPUID_ENLIGHTMENT_INFO);
>>
>>  	hv_max_functions_eax = cpuid_eax(HYPERV_CPUID_VENDOR_AND_MAX_FUNCTIONS);
>>
>> -	pr_info("Hyper-V: privilege flags low 0x%x, high 0x%x, hints 0x%x, misc 0x%x\n",
>> -		ms_hyperv.features, ms_hyperv.priv_high, ms_hyperv.hints,
>> +	pr_info("Hyper-V: privilege flags low 0x%x, high 0x%x, ext 0x%x, hints 0x%x, misc 0x%x\n",
>> +		ms_hyperv.features, ms_hyperv.priv_high,
>> +		ms_hyperv.ext_features, ms_hyperv.hints,
>>  		ms_hyperv.misc_features);
>>
>>  	ms_hyperv.max_vp_index = cpuid_eax(HYPERV_CPUID_IMPLEMENT_LIMITS);
>> diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
>> index dc4729dba9ef..c020d5d0ec2a 100644
>> --- a/include/asm-generic/mshyperv.h
>> +++ b/include/asm-generic/mshyperv.h
>> @@ -36,6 +36,7 @@ enum hv_partition_type {
>>  struct ms_hyperv_info {
>>  	u32 features;
>>  	u32 priv_high;
>> +	u32 ext_features;
>>  	u32 misc_features;
>>  	u32 hints;
>>  	u32 nested_features;
>> --
>> 2.34.1
> 
> Are any of the extended features available on arm64? This code is obviously x86 specific,
> so ms_hyperv.ext_features will be zero on arm64. From what I can see, ext_features is
> referenced only in Patch 10 of this series, and in code that is under #ifdef CONFIG_X86_64,
> so that should be OK.

Just checked - yes ARM64 has features in ECX, but they are different to the x86_64 ones.
We can add the ARM64 ones when needed.

Thanks
Nuno

> 
> The pr_info() line will now be slightly different on x86 and arm64 since arm64 won't have
> the "ext" field, but I think that's OK too.
> 
> Reviewed-by: Michael Kelley <mhklinux@outlook.com>


