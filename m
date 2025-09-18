Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60016CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 12:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cU5jzBhAyG2Pj83mnHnhj4Pb3WA/FJRug39dIf+C0i8=; b=u2fkamS0bkPHmxvBq9/iC1j/y/
	7IlNGOXGj2c7cPTUzbBGTMqIhvXRyff+IQm3bvOO5SDcPCsCGrWxCXU4Tf/CSBjUPcRDNjhnqfs+8
	hjCSXJpW2njVtuQtJR4nrKDfeNfW4W2/KXSV0Nk3OB4hoelXQubBtFv5Sj5dy0bzTwLnlH4+xuo7G
	1Txc2fPkl9gJR0JkT+u5j9V06JXniTwpiw8VKQZcFUCgglleEYmTPe2q3KfQnxoEe7ayVoIPwiDVc
	9nhvS6Heows4Cj3hiZcGVXcKio+8nXwmceIZxbeF/KrDndrvLJe7ervFoocPXgo53v1AKOPvXY1zC
	oglex+ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDrE-0000000HPwH-0Zoj;
	Thu, 18 Sep 2025 12:35:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDrB-0000000HPtt-0YjB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 12:35:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55F801A25;
	Thu, 18 Sep 2025 05:35:14 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 566643F673;
	Thu, 18 Sep 2025 05:35:21 -0700 (PDT)
Message-ID: <fdd95a19-f787-428b-b184-a5de19469c0b@arm.com>
Date: Thu, 18 Sep 2025 13:35:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: acpi: Enable ACPI CCEL support
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-coco@lists.linux.dev, catalin.marinas@arm.com, gshan@redhat.com,
 aneesh.kumar@kernel.org, sami.mujawar@arm.com, sudeep.holla@arm.com,
 steven.price@arm.com
References: <20250908223519.1759020-1-suzuki.poulose@arm.com>
 <20250908223519.1759020-4-suzuki.poulose@arm.com>
 <aMv7tbA3JGd7ZcbW@willie-the-truck>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <aMv7tbA3JGd7ZcbW@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_053525_293490_3E0B1A52 
X-CRM114-Status: GOOD (  25.58  )
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

Hi Will

On 18/09/2025 13:31, Will Deacon wrote:
> On Mon, Sep 08, 2025 at 11:35:19PM +0100, Suzuki K Poulose wrote:
>> Add support for ACPI CCEL by handling the EfiACPIMemoryNVS type memory.
>> As per UEFI specifications NVS memory is reserved for Firmware use even
>> after exiting boot services. Thus map the region as read-only.
>>
>> Cc: Sami Mujawar <sami.mujawar@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
>> Cc: Steven Price <steven.price@arm.com>
>> Cc: Sudeep Holla <sudeep.holla@arm.com>
>> Cc: Gavin Shan <gshan@redhat.com>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>> Changes since v1
>>   - Map NVS region as read-only, update comment to clarify that the region
>>     is reserved for firmware use.
>>
>> ---
>>   arch/arm64/kernel/acpi.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
>> index 4d529ff7ba51..93b70f48a51f 100644
>> --- a/arch/arm64/kernel/acpi.c
>> +++ b/arch/arm64/kernel/acpi.c
>> @@ -360,6 +360,17 @@ void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
>>   			prot = PAGE_KERNEL_RO;
>>   			break;
>>   
>> +		case EFI_ACPI_MEMORY_NVS:
>> +			/*
>> +			 * ACPI NVS marks an area reserved for use by the
>> +			 * firmware, even after exiting the boot service.
>> +			 * This may be used by the firmware for sharing dynamic
>> +			 * tables/data (e.g., ACPI CCEL) with the OS. Map it
>> +			 * as read-only.
>> +			 */
>> +			prot = PAGE_KERNEL_RO;
>> +			break;
>> +
> 
> Shouldn't this be merged with the other case handling read-only mappings?
> e.g. something like:
> 

I thought about it, but went against it, to keep the code separate. But
surely this is fine. I will resend the series with the proposed change.

Suzuki

> 		switch (region->type) {
> 		case EFI_LOADER_CODE:
> 		case EFI_LOADER_DATA:
> 		case EFI_BOOT_SERVICES_CODE:
> 		case EFI_BOOT_SERVICES_DATA:
> 		case EFI_CONVENTIONAL_MEMORY:
> 		case EFI_PERSISTENT_MEMORY:
> 			if (memblock_is_map_memory(phys) ||
> 			    !memblock_is_region_memory(phys, size)) {
> 				pr_warn(FW_BUG "requested region covers kernel memory @ %pa\n", &phys);
> 				return NULL;
> 			}
> 			/*
> 			 * Mapping kernel memory is permitted if the region in
> 			 * question is covered by a single memblock with the
> 			 * NOMAP attribute set: this enables the use of ACPI
> 			 * table overrides passed via initramfs, which are
> 			 * reserved in memory using arch_reserve_mem_area()
> 			 * below. As this particular use case only requires
> 			 * read access, fall through to the R/O mapping case.
> 			 */
> 			fallthrough;
> 
> 		case EFI_RUNTIME_SERVICES_CODE:
> 			/*
> 			 * This would be unusual, but not problematic per se,
> 			 * as long as we take care not to create a writable
> 			 * mapping for executable code.
> 			 */
> 			fallthrough;
> 
> 		case EFI_ACPI_MEMORY_NVS:
> 			/*
> 			 * ACPI NVS marks an area reserved for use by the
> 			 * firmware, even after exiting the boot service.
> 			 * This may be used by the firmware for sharing dynamic
> 			 * tables/data (e.g., ACPI CCEL) with the OS. Map it
> 			 * as read-only.
> 			 */
> 			prot = PAGE_KERNEL_RO;
> 			break;
> 
> 
> With that, I'm happy to pick up the series (let me know if you want me
> to make the change above locally to save you a resend).
> 
> Will


