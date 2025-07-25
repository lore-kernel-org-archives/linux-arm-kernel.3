Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2922C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 11:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJdCaj309WnyPmnHqpla024Pl4ob/ND5anL3+OLN8Rw=; b=MqdtdWMbGUVvUiNg698G21Ghh2
	3w6C/Bp+M1b5WbfhXPebeibHgadfPamxYsdt3cA2r2boetjTWyAorCKI/TLXAZCvx9JbQyU/3L8ky
	wT4yO8t/eaFe9qlYKHLsKaINUt8FJ6zsEMQrcnU/eHv18qjTUrcstNiJuzFecHU5lRQjyEdl7J+hG
	+hwvXPcF+2QLUQZVrnrH13XfNS1DOtfNsmzlmMb78s1RqaDtuDEmIs0u0GPv4SjaC2DhtWkxhN3KJ
	cSDQ9aIeRRHHoZK+SaxzmapmLfj4mqvwAk6l3MI+a3Lijr+05USNTNYOinDv+x7C45q9wN1lO8eZA
	kZ4ICAIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGmq-00000009jqZ-40SP;
	Fri, 25 Jul 2025 11:40:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGIV-00000009fvx-2jx6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 11:09:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F389C1756;
	Fri, 25 Jul 2025 04:08:59 -0700 (PDT)
Received: from [10.57.31.179] (unknown [10.57.31.179])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2E0053F66E;
	Fri, 25 Jul 2025 04:09:05 -0700 (PDT)
Message-ID: <9765ba29-91e1-42bd-bb46-14fdce7284fe@arm.com>
Date: Fri, 25 Jul 2025 12:09:04 +0100
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
 <bf56dab4-8a11-4e91-b330-2a8126c94acc@arm.com>
 <aHZsgzNYwfCljX-G@willie-the-truck>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <aHZsgzNYwfCljX-G@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_040907_741573_47261850 
X-CRM114-Status: GOOD (  19.76  )
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

On 15/07/2025 15:58, Will Deacon wrote:
> On Tue, Jul 15, 2025 at 03:38:41PM +0100, Suzuki K Poulose wrote:
>> On 15/07/2025 14:56, Will Deacon wrote:
>>> On Fri, Jun 13, 2025 at 12:11:53PM +0100, Suzuki K Poulose wrote:
>>>> ACPI CCEL memory area is reported as Non-Volatile storage area. Map it as
>>>> PAGE_KERNEL.
>>>
>>> It would be helpful to have a citation for that. I've tried digging it
>>> out of the ACPI spec, but that pointed me to the Intel TDX site and I
>>> got lost in whitepapers :/
>>>
>>
>> https://uefi.org/specs/ACPI/6.5/05_ACPI_Software_Programming_Model.html#cc-event-log-acpi-table
> 
> Thanks, but I still can't spot where it specifies the memory attributes.
> I think we should be able to refer to that as justification for ignoring
> the attributes specified by EFI.

Here is the description for the Efi memory types.

https://uefi.org/specs/UEFI/2.10/07_Services_Boot_Services.html#memory-type-usage-before-exitbootservices

 From that I gather that OS must map the area as read only.

> 
>>>> Cc: Sami Mujawar <sami.mujawar@arm.com>
>>>> Cc: Will Deacon <will@kernel.org>
>>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>>> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
>>>> Cc: Steven Price <steven.price@arm.com>
>>>> Cc: Sudeep Holla <sudeep.holla@arm.com>
>>>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>>> ---
>>>>    arch/arm64/kernel/acpi.c | 5 +++++
>>>>    1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
>>>> index b9a66fc146c9..f52439d411a0 100644
>>>> --- a/arch/arm64/kernel/acpi.c
>>>> +++ b/arch/arm64/kernel/acpi.c
>>>> @@ -356,6 +356,11 @@ void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
>>>>    			prot = PAGE_KERNEL_RO;
>>>>    			break;
>>>> +		case EFI_ACPI_MEMORY_NVS:
>>>> +			/* Non-volatile storage, required for CCEL */
>>>> +			prot = PAGE_KERNEL;
>>>
>>> By "storage" you just mean memory, right?
>>
>> Yep, it is just memory. I will drop the "NV storage" and simply mention,
>> CCEL.
> 
> Thanks. Also, why don't we check against memblock_is_map_memory() for
> this, like we do for all the other types apart from
> EFI_RUNTIME_SERVICES_CODE?

As per the spec, the NVS type must be reserved and we do that in the
kernel. For the other types, you mentioned, they are usable by
general OS and in Linux we only reserve them, if they are have
WB attribute (See is_usable_memory()). Thus we do extra checks to
make sure, if it is in use and mark them as RO.

So, NVS is by default reserved and doesn't have to do extra checks.

That said, I will fix the prot to PAGE_KERNEL_RO to make sure
the OS doesn't write to it.

Thanks
Suzuki

> 
> Will


