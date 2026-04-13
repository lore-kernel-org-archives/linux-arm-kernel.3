Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02A1F34C42
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 11:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qm8V/twKLM4gkqrLB9IB9q9soSkDnUMKd0hqQSFkgQk=; b=P4eJ9zGhGhqlf0dcFtIHgYux2R
	16XYmmu8dXauMolVDHHrRl/jYQBrOSGUvX83rBEO3tEnwDkdwL6eKb/jYjLLksqepkNdBKYif7Ekc
	Sv2Syce3Q25XKxd2y6T3jMs4oNeLrltJ4idtiqLYevyWxhXVz+St3Ydjo3vXRXphqE8vJ06gmCYBM
	TqTfwZYAzyew67jlGIZKQPVozF1wEdRuaTbgn4L0r6NQTKEWy/QY/4GKHRa0Z9xMKzRFS8jYx20oC
	2cWh9uhmYv9kTzVWNlojRkS4UCwP3D/TnnS1ODpBwp7RJq/4gwcJSMJxcRbagZ76E5FfPbf0J3o8T
	hjqUnnFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCFkW-0000000Fb1D-1CdA;
	Mon, 13 Apr 2026 11:46:40 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCFkT-0000000Fazr-1dP0;
	Mon, 13 Apr 2026 11:46:38 +0000
Received: from [192.168.0.106] (unknown [49.205.253.198])
	by linux.microsoft.com (Postfix) with ESMTPSA id 12BA020B7129;
	Mon, 13 Apr 2026 04:46:28 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 12BA020B7129
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1776080795;
	bh=qm8V/twKLM4gkqrLB9IB9q9soSkDnUMKd0hqQSFkgQk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YS4+n34fD98853H9IlZL9WBkOUr1ooEyajEcffv3GQ8z8aUQLYsNQHXtKZit32T8y
	 n7KkNsvMCftgQnTPWtv2anAbhkKAwESWJ/mR8AI9xsxd2sRLEgiPG/y52lIkt7AkoR
	 HLL8v8R2VYabo5702NQ/BFKB1YIn95kQVETPJyNk=
Message-ID: <6e216181-9847-4abd-82a1-0ba51127af49@linux.microsoft.com>
Date: Mon, 13 Apr 2026 17:16:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] drivers: hv: Export vmbus_interrupt for mshv_vtl
 module
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
 <20260316121241.910764-6-namjain@linux.microsoft.com>
 <SN6PR02MB4157F1DAEF3BC14A67D59FB8D450A@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Naman Jain <namjain@linux.microsoft.com>
In-Reply-To: <SN6PR02MB4157F1DAEF3BC14A67D59FB8D450A@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_044637_551718_0F1301A4 
X-CRM114-Status: GOOD (  13.39  )
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



On 4/1/2026 10:26 PM, Michael Kelley wrote:
> From: Naman Jain <namjain@linux.microsoft.com> Sent: Monday, March 16, 2026 5:13 AM
>>
> 
> Nit:  For the patch Subject, capitalize "Drivers:" in the prefix.

Acked.

Thanks,
Naman

> 
>> vmbus_interrupt is used in mshv_vtl_main.c to set the SINT vector.
>> When CONFIG_MSHV_VTL=m and CONFIG_HYPERV_VMBUS=y (built-in), the module
>> cannot access vmbus_interrupt at load time since it is not exported.
>>
>> Export it using EXPORT_SYMBOL_FOR_MODULES consistent with the existing
>> pattern used for vmbus_isr.
>>
>> Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
>> ---
>>   drivers/hv/vmbus_drv.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
>> index f99d4f2d3862..de191799a8f6 100644
>> --- a/drivers/hv/vmbus_drv.c
>> +++ b/drivers/hv/vmbus_drv.c
>> @@ -57,6 +57,7 @@ static DEFINE_PER_CPU(long, vmbus_evt);
>>   /* Values parsed from ACPI DSDT */
>>   int vmbus_irq;
>>   int vmbus_interrupt;
>> +EXPORT_SYMBOL_FOR_MODULES(vmbus_interrupt, "mshv_vtl");
>>
>>   /*
>>    * If the Confidential VMBus is used, the data on the "wire" is not
>> --
>> 2.43.0
>>
> 
> Reviewed-by: Michael Kelley <mhklinux@outlook.com>


