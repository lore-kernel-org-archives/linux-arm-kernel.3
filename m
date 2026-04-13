Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CD0F34C42
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 11:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZmW9qHrrNAcfztbJPZlZq0MvOI4dcjMtr4X3leEAtg4=; b=LwF9nsa33obaoLijR0gb7r2D1y
	bhaj8KYiybN5R6K26oeronHMVr0+Slcqz94OvTpAZrmfIpyUc85ONZjdc2XJe5tcmlP1NDQBOZ2Y/
	rBOaU4yV2m8jkvGa78i1cMwQbt43tAAOkR8eNLafCrKsWwIR6E+IEK+IAJNuBnDOSTx4wxe3pWeHs
	iOlI/vO53GANlqw112AVXE1kBpeGMqP2XYrKLF8vxn8SsVe/bNhnLKrL7DKz6hCxybo7EDewti85w
	b0Xjf4bxhH4X2uhbUedjIq6WC9eMUT7hfEJiB0S1jwvnNuYJx5oxsxlXBqY4FN699urCkxow5f4o2
	PkQK7Nnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCFlg-0000000FbPS-3bTM;
	Mon, 13 Apr 2026 11:47:52 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCFlf-0000000FbOh-0qSp;
	Mon, 13 Apr 2026 11:47:52 +0000
Received: from [192.168.0.106] (unknown [49.205.253.198])
	by linux.microsoft.com (Postfix) with ESMTPSA id DCF5320B7001;
	Mon, 13 Apr 2026 04:47:43 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DCF5320B7001
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1776080870;
	bh=ZmW9qHrrNAcfztbJPZlZq0MvOI4dcjMtr4X3leEAtg4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JAJih579xlgOCRGq6eu03iWt/8vu3PufifW1GO5hqErVwiCZiNlmHCCQQ3GgGfmY6
	 2NxZAlZP7Pxak6tl8945JvIANDuERrATzkCBEQuvIEFspMafzZ00xQZVz7rxFimv7M
	 mVUXg9r8DX8Pf0yMHztGGzHXr0NzHy58Qh2sVvQk=
Message-ID: <b5125f61-173f-45d0-a6dc-d795ba0f8693@linux.microsoft.com>
Date: Mon, 13 Apr 2026 17:17:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] Drivers: hv: Make sint vector architecture neutral
 in MSHV_VTL
To: Michael Kelley <mhklinux@outlook.com>,
 "K . Y . Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Marc Zyngier <maz@kernel.org>, Timothy Hayes <timothy.hayes@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 mrigendrachaubey <mrigendra.chaubey@gmail.com>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <20260316121241.910764-1-namjain@linux.microsoft.com>
 <20260316121241.910764-7-namjain@linux.microsoft.com>
 <SN6PR02MB4157521DEF9EA2471B6F3359D450A@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Naman Jain <namjain@linux.microsoft.com>
In-Reply-To: <SN6PR02MB4157521DEF9EA2471B6F3359D450A@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_044751_277620_7035F0CF 
X-CRM114-Status: GOOD (  15.92  )
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



On 4/1/2026 10:27 PM, Michael Kelley wrote:
> From: Naman Jain <namjain@linux.microsoft.com> Sent: Monday, March 16, 2026 5:13 AM
>>
>> Generalize Synthetic interrupt source vector (sint) to use
>> vmbus_interrupt variable instead, which automatically takes care of
>> architectures where HYPERVISOR_CALLBACK_VECTOR is not present (arm64).
> 
> Sashiko AI raised an interesting question about the startup timing --
> whether the vmbus_platform_driver_probe() is guaranteed to have
> set vmbus_interrupt before the VTL functions below run and use it.
> What causes the mshv_vtl.ko module to be loaded, and hence run
> mshv_vtl_init()?

There is no race condition here. The init ordering guarantees that
vmbus_interrupt is always set before mshv_vtl_synic_enable_regs()
reads it.

The call chain for setting vmbus_interrupt:

   subsys_initcall(hv_acpi_init)                          [level 4]
     -> platform_driver_register(&vmbus_platform_driver) and so on.


The call chain for reading vmbus_interrupt:

   module_init(mshv_vtl_init)                             [level 6]
     -> hv_vtl_setup_synic()
       -> cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, ..., 
mshv_vtl_alloc_context, ...)
         -> mshv_vtl_alloc_context()
           -> mshv_vtl_synic_enable_regs()
             -> sint.vector = vmbus_interrupt

do_initcalls() processes sections in order 0 through 7, so 
hv_acpi_init() (level 4) is guaranteed to complete before 
mshv_vtl_init() (level 6) runs.



Regarding memory leak on cpu offline/online or module load/unload- it is 
beyond the scope of this series, I will fix it separately.

I may need some more time in addressing comments on rest of the patches. 
Please bear with me.

Regards,
Naman

> 
>>
>> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
>> Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
>> ---
>>   drivers/hv/mshv_vtl_main.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hv/mshv_vtl_main.c b/drivers/hv/mshv_vtl_main.c
>> index b607b6e7e121..91517b45d526 100644
>> --- a/drivers/hv/mshv_vtl_main.c
>> +++ b/drivers/hv/mshv_vtl_main.c
>> @@ -234,7 +234,7 @@ static void mshv_vtl_synic_enable_regs(unsigned int cpu)
>>   	union hv_synic_sint sint;
>>
>>   	sint.as_uint64 = 0;
>> -	sint.vector = HYPERVISOR_CALLBACK_VECTOR;
>> +	sint.vector = vmbus_interrupt;
>>   	sint.masked = false;
>>   	sint.auto_eoi = hv_recommend_using_aeoi();
>>
>> @@ -753,7 +753,7 @@ static void mshv_vtl_synic_mask_vmbus_sint(void *info)
>>   	const u8 *mask = info;
>>
>>   	sint.as_uint64 = 0;
>> -	sint.vector = HYPERVISOR_CALLBACK_VECTOR;
>> +	sint.vector = vmbus_interrupt;
>>   	sint.masked = (*mask != 0);
>>   	sint.auto_eoi = hv_recommend_using_aeoi();
>>
>> --
>> 2.43.0
>>
> 
> Assuming there's no timing problem vs. the VMBus driver,
> 
> Reviewed-by: Michael Kelley <mhklinux@outlook.com>


