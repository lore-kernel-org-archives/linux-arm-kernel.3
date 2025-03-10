Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83F0C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 17:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LN1XhlPdMhhUKdLiwgvqjrH33le8Y4pxVH3hP74M9b0=; b=d4X4ftjCq5BeOAATuapW1frvZw
	p5NbLdKGUO06O749c3Aqn3FL3TXgbzlaCTIeHMBHDPkGyIBeU0+lituZWa5bPkf/zmBgXLg5DGAUY
	kbu9w+OM7Gv5DX7GxmWw38qw5Dc1JdmIuIKQsm5ACHiizimJR130lqbyMLmpsZ2f5RQwW9vwf+OeJ
	+7SXRMCEwMtpguas8tK/2QGTjhW4os1nBm32fdXYKhjo7B1X1aIUc9NbNdo2+/4dwbaKYc77C0geb
	doRhI/JlBVWrYu1bvUKMjdpaiwHLXPn/LPa38olooYSy1cj/zRRlHnj4YhfBZCG3y/JPvlIsU2BDW
	EQhyp6AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trgV9-00000003QmM-1IKV;
	Mon, 10 Mar 2025 17:01:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trgCu-00000003NJX-1kWE
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Mar 2025 16:42:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LN1XhlPdMhhUKdLiwgvqjrH33le8Y4pxVH3hP74M9b0=; b=DLLoQmV9fF0Uz84tnP75uaQd37
	oAQDsZE7lMTrCVncnN3UaR0Xtk5JkuK9XN/Sh1szwrRVh+Ec8n6NfXiayqT2O3QM+bW+2fZSITj3B
	tmcs9E0E8ep3sxrvFD5UNtM8F/OLxDxT/1BnWEx4tCUONqKrQj10AeddzjnK57e69ItzurNm2/NYW
	aM/06wtXaanJ/2Lo5ughbEazVMbyUJkgfqZQNq3uulHveKnAFdRyV35Y5Norm6cDulsDr2X+xvOYb
	ENoaJQF38nAslogSNMOzcuDULSwWlewj9/892QFoN4w3CrQqWaxzpksozbXW2uo+u4OYAuO/vWVVG
	WPTuuN8A==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trgCr-00000001wIR-0xNc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 16:42:23 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 917D62038F31;
	Mon, 10 Mar 2025 09:42:15 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 917D62038F31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741624935;
	bh=LN1XhlPdMhhUKdLiwgvqjrH33le8Y4pxVH3hP74M9b0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=adolExQzIdiGiIImUNH8PIT6jUYPIx/W+TATHEWLnINgGBwZ6f1UJ6VLPct8eOZG1
	 QWxNjZnyTJVqsNRH80CF3UdDcU3vx6TIUod2y01uAqFHvYQ2H224pVoGrzHDj5UdK0
	 NOQoc/qdsXI7/FognyHzoybGrl/nnp4HVU46HlNk=
Message-ID: <2342dda1-2976-4506-ab68-640739a1bd5b@linux.microsoft.com>
Date: Mon, 10 Mar 2025 09:42:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next v5 06/11] arm64, x86: hyperv: Report the VTL
 the system boots in
To: Wei Liu <wei.liu@kernel.org>
Cc: arnd@arndb.de, bhelgaas@google.com, bp@alien8.de,
 catalin.marinas@arm.com, conor+dt@kernel.org, dave.hansen@linux.intel.com,
 decui@microsoft.com, haiyangz@microsoft.com, hpa@zytor.com,
 joey.gouly@arm.com, krzk+dt@kernel.org, kw@linux.com, kys@microsoft.com,
 lenb@kernel.org, lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org,
 mark.rutland@arm.com, maz@kernel.org, mingo@redhat.com,
 oliver.upton@linux.dev, rafael@kernel.org, robh@kernel.org,
 ssengar@linux.microsoft.com, sudeep.holla@arm.com, suzuki.poulose@arm.com,
 tglx@linutronix.de, will@kernel.org, yuzenghui@huawei.com,
 devicetree@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, x86@kernel.org,
 apais@microsoft.com, benhill@microsoft.com, bperkins@microsoft.com,
 sunilmut@microsoft.com
References: <20250307220304.247725-1-romank@linux.microsoft.com>
 <20250307220304.247725-7-romank@linux.microsoft.com>
 <Z84yyAqkqJ2ZyAd-@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <Z84yyAqkqJ2ZyAd-@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_164221_651127_D423D330 
X-CRM114-Status: GOOD (  18.39  )
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



On 3/9/2025 5:31 PM, Wei Liu wrote:
> On Fri, Mar 07, 2025 at 02:02:58PM -0800, Roman Kisel wrote:
>> The hyperv guest code might run in various Virtual Trust Levels.
>>
>> Report the level when the kernel boots in the non-default (0)
>> one.
>>
>> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
>> ---
>>   arch/arm64/hyperv/mshyperv.c | 2 ++
>>   arch/x86/hyperv/hv_vtl.c     | 2 +-
>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
>> index a7db03f5413d..3bc16dbee758 100644
>> --- a/arch/arm64/hyperv/mshyperv.c
>> +++ b/arch/arm64/hyperv/mshyperv.c
>> @@ -108,6 +108,8 @@ static int __init hyperv_init(void)
>>   	if (ms_hyperv.priv_high & HV_ACCESS_PARTITION_ID)
>>   		hv_get_partition_id();
>>   	ms_hyperv.vtl = get_vtl();
>> +	if (ms_hyperv.vtl > 0) /* non default VTL */
> 
> "non-default".
> 

Thanks, will fix that!

>> +		pr_info("Linux runs in Hyper-V Virtual Trust Level %d\n", ms_hyperv.vtl);
>>   
>>   	ms_hyperv_late_init();
>>   
>> diff --git a/arch/x86/hyperv/hv_vtl.c b/arch/x86/hyperv/hv_vtl.c
>> index 4e1b1e3b5658..c21bee7e8ff3 100644
>> --- a/arch/x86/hyperv/hv_vtl.c
>> +++ b/arch/x86/hyperv/hv_vtl.c
>> @@ -24,7 +24,7 @@ static bool __init hv_vtl_msi_ext_dest_id(void)
>>   
>>   void __init hv_vtl_init_platform(void)
>>   {
>> -	pr_info("Linux runs in Hyper-V Virtual Trust Level\n");
>> +	pr_info("Linux runs in Hyper-V Virtual Trust Level %d\n", ms_hyperv.vtl);
> 
> Where isn't there a check for ms_hyperv.vtl > 0 here?
> 

On x86, there is

#ifdef CONFIG_HYPERV_VTL_MODE
void __init hv_vtl_init_platform(void);
int __init hv_vtl_early_init(void);
#else
static inline void __init hv_vtl_init_platform(void) {}
static inline int __init hv_vtl_early_init(void) { return 0; }
#endif

> Please be consistent across different architectures.
> 

In the earlier versions of the patch series, I had that piece
from the above mirrored in the arm64, and there was advice on
removing the function as it contained just one statement.
I'll revisit the approach, thanks for your help!

>>   
>>   	x86_platform.realmode_reserve = x86_init_noop;
>>   	x86_platform.realmode_init = x86_init_noop;
>> -- 
>> 2.43.0
>>
>>

-- 
Thank you,
Roman


