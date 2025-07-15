Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB28C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 16:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uy0z700i8F874zkdqhtFVTpZ8rBnjKH1fLzPQuP5ZU=; b=bPZ/sc9WiAqqtyoj2uKJ4ZE/7s
	Q7UUV3wU3H1zgeJ3l7aB4IsQG0ggVsQ93Fs91LsOluInPYjc3aIg63w1+QITrytjdsu1ioQPeK3ry
	4IvXbBEzAFagg12TFYWWn0wfgXcMdNn+TmQExBG4gc4LSGDLyrMhOtmW+059BtrQpONXE6AHSiegW
	1uiGG5wwf5fT+0OnM0HXSLB2OmFRtqsL35HCnYRA0eKgH6isbvEAqayPVCPkM41UktZAs3P8GKuey
	zmOUs9t2bVlJF3mzf3UON+P1oMeBiZ/6wDJL8T8uV/uK1j5BF3h7GGw2oadVo7uLgEt9EfjVu+//l
	XwSoMDaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubiNg-00000005j1r-0aOc;
	Tue, 15 Jul 2025 16:19:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubgnt-00000005PJd-45A0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 14:38:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B38112FC;
	Tue, 15 Jul 2025 07:38:34 -0700 (PDT)
Received: from [10.57.0.241] (unknown [10.57.0.241])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D52943F694;
	Tue, 15 Jul 2025 07:38:41 -0700 (PDT)
Message-ID: <bf56dab4-8a11-4e91-b330-2a8126c94acc@arm.com>
Date: Tue, 15 Jul 2025 15:38:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: acpi: Enable ACPI CCEL support
Content-Language: en-GB
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 sami.mujawar@arm.com, aneesh.kumar@kernel.org, steven.price@arm.com,
 linux-kernel@vger.kernel.org, sudeep.holla@arm.com
References: <20250613111153.1548928-1-suzuki.poulose@arm.com>
 <20250613111153.1548928-4-suzuki.poulose@arm.com>
 <aHZeCKNyDeZEsuCt@willie-the-truck>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <aHZeCKNyDeZEsuCt@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_073846_051547_84B3890D 
X-CRM114-Status: GOOD (  14.23  )
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

On 15/07/2025 14:56, Will Deacon wrote:
> On Fri, Jun 13, 2025 at 12:11:53PM +0100, Suzuki K Poulose wrote:
>> ACPI CCEL memory area is reported as Non-Volatile storage area. Map it as
>> PAGE_KERNEL.
> 
> It would be helpful to have a citation for that. I've tried digging it
> out of the ACPI spec, but that pointed me to the Intel TDX site and I
> got lost in whitepapers :/
> 

https://uefi.org/specs/ACPI/6.5/05_ACPI_Software_Programming_Model.html#cc-event-log-acpi-table

>> Cc: Sami Mujawar <sami.mujawar@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
>> Cc: Steven Price <steven.price@arm.com>
>> Cc: Sudeep Holla <sudeep.holla@arm.com>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>>   arch/arm64/kernel/acpi.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
>> index b9a66fc146c9..f52439d411a0 100644
>> --- a/arch/arm64/kernel/acpi.c
>> +++ b/arch/arm64/kernel/acpi.c
>> @@ -356,6 +356,11 @@ void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
>>   			prot = PAGE_KERNEL_RO;
>>   			break;
>>   
>> +		case EFI_ACPI_MEMORY_NVS:
>> +			/* Non-volatile storage, required for CCEL */
>> +			prot = PAGE_KERNEL;
> 
> By "storage" you just mean memory, right?

Yep, it is just memory. I will drop the "NV storage" and simply mention, 
CCEL.

Thanks!

Suzuki


> 
> Will


