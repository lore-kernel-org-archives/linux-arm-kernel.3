Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530D5C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QfzFTayOvFIF5HGaklBMKxJvGcN1YhzJb5XK0BSIt0w=; b=mrrsNhz+J1DpwnICm7OeYIde8N
	2X7+ZSg5EqlrjBCu5MIHvNK8ipEaGtKJPMQVgTHUqawXGbNnplow/1N0hhbciqMHDSJ74s3BBnDJf
	GgFBQ951o3oa+3ogLKaJm3BVpWUzmOSy+9tBPQq6o51f9dJBXB3HdAltgd0sqIcj4AQi1rIFy7iXo
	7KoKaoJ3RIPNqRsXUFKix59OQ76bm4qycF2ej0DRu6WLTNslQhSW6pfSKBtMhqR9rmeBvimkfKCM6
	Iz1LihPamMkNKbGwpm8rVM9UjX0j3+xlm0xU3xtVMZjHYSxreii5q/WpYq2hyTtJAFWHa3o99u7tD
	oh9hoKPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rYI-00000001cjR-1f0m;
	Mon, 07 Apr 2025 18:50:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pR4-00000001ELC-0kNu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 16:34:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 616AC12FC;
	Mon,  7 Apr 2025 09:34:58 -0700 (PDT)
Received: from [10.57.17.31] (unknown [10.57.17.31])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 224E73F694;
	Mon,  7 Apr 2025 09:34:52 -0700 (PDT)
Message-ID: <d254a8ea-0f02-4826-9af3-4a288efcc90c@arm.com>
Date: Mon, 7 Apr 2025 17:34:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 34/45] kvm: rme: Hide KVM_CAP_READONLY_MEM for realm
 guests
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-35-steven.price@arm.com>
 <32a09a27-f131-44dd-8959-abb63b2089a8@redhat.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <32a09a27-f131-44dd-8959-abb63b2089a8@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_093458_307435_F2A25311 
X-CRM114-Status: GOOD (  18.94  )
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

On 04/03/2025 11:51, Gavin Shan wrote:
> On 2/14/25 2:14 AM, Steven Price wrote:
>> For protected memory read only isn't supported. While it may be possible
>> to support read only for unprotected memory, this isn't supported at the
>> present time.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>>   arch/arm64/kvm/arm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
> 
> It's worthy to explain why KVM_CAP_READONLY_MEM isn't supported and its
> negative impact. It's something to be done in the future if I'm correct.

I'll add to the commit message:

    Note that this does mean that e.g. ROM (or flash) data cannot be
    emulated correctly by the VMM.

> From QEMU's perspective, all ROM data, which is populated by it, can
> be written. It conflicts to the natural limit: all ROM data should be
> read-only.

Yes this is my understanding of the main impact. I'm not sure how useful
(shared) ROM/flash emulation is. It can certainly be added in the future
if needed. Protected read-only memory I don't believe is useful - the
only sane response I can see from a write fault in that case is killing
the guest.

Thanks,
Steve

> QEMU
> ====
> rom_add_blob
>   rom_set_mr
>     memory_region_set_readonly
>       memory_region_transaction_commit
>         kvm_region_commit
>           kvm_set_phys_mem
>             kvm_mem_flags                                    // flag
> KVM_MEM_READONLY is missed
>             kvm_set_user_memory_region
>               kvm_vm_ioctl(KVM_SET_USER_MEMORY_REGION2)
> 
> non-secure host
> ===============
> rec_exit_sync_dabt
>   kvm_handle_guest_abort
>     user_mem_abort
>       __kvm_faultin_pfn                       // writable == true
>         realm_map_ipa
>           WARN_ON(!(prot & KVM_PGTABLE_PROT_W)
> 
> non-secure host
> ===============
> kvm_realm_enable_cap(KVM_CAP_ARM_RME_POPULATE_REALM)
>   kvm_populate_realm
>     __kvm_faultin_pfn                      // writable == true
>       realm_create_protected_data_page
> 
>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>> index 1f3674e95f03..0f1d65f87e2b 100644
>> --- a/arch/arm64/kvm/arm.c
>> +++ b/arch/arm64/kvm/arm.c
>> @@ -348,7 +348,6 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm,
>> long ext)
>>       case KVM_CAP_ONE_REG:
>>       case KVM_CAP_ARM_PSCI:
>>       case KVM_CAP_ARM_PSCI_0_2:
>> -    case KVM_CAP_READONLY_MEM:
>>       case KVM_CAP_MP_STATE:
>>       case KVM_CAP_IMMEDIATE_EXIT:
>>       case KVM_CAP_VCPU_EVENTS:
>> @@ -362,6 +361,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm,
>> long ext)
>>       case KVM_CAP_COUNTER_OFFSET:
>>           r = 1;
>>           break;
>> +    case KVM_CAP_READONLY_MEM:
>>       case KVM_CAP_SET_GUEST_DEBUG:
>>           r = !kvm_is_realm(kvm);
>>           break;
> 
> Thanks,
> Gavin
> 


