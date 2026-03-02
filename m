Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB2AEA4E21
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=he9EJQZSG3h3qjSFGc1Ib08ZpVjSgyYF6jMdM91sgwA=; b=wCey094+ARqXvntkVkvex3MeR6
	K71oToOCp8TdONVdHLYWYNOQyFnEkROefiTnqXCru5jSdqedNlx+8lCZRt9AZf/r5BUb+NPp53ldI
	itQ4q/d3fNNeFSjH5PvkXCZq4DUocATto/HLBm8Ndp+zHIM0KNllOIR57K3xSCwUh2TLnUrt+fxZE
	Z9CpayMB5Gt88WWoNcy1vE8uE4SVz6gPtXyqqdviMmkC8c0HqcedktTiUHFV7nM+KQ9Ge017t2SQB
	+SzKzlPkmhhnK7W2/j/HpGDTCsrC/5/vmU146BXZEzjIYEQRa2AgBTYHwBXhG6yZoEJVictUWzw+h
	Nl4EFAYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx57l-0000000DM03-3Nec;
	Mon, 02 Mar 2026 15:23:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx57j-0000000DLzE-2KSC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:23:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00BD11477;
	Mon,  2 Mar 2026 07:23:46 -0800 (PST)
Received: from [10.57.55.216] (unknown [10.57.55.216])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D6E7F3F73B;
	Mon,  2 Mar 2026 07:23:46 -0800 (PST)
Message-ID: <33053e22-6cc6-4d55-bc7f-01f873a15d28@arm.com>
Date: Mon, 2 Mar 2026 15:23:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 06/46] arm64: RMI: Define the user ABI
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>
References: <20251217101125.91098-1-steven.price@arm.com>
 <20251217101125.91098-7-steven.price@arm.com> <86tsuy8g0u.wl-maz@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <86tsuy8g0u.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_072355_676297_4BF6DD90 
X-CRM114-Status: GOOD (  33.23  )
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

Hi Marc,

On 02/03/2026 14:25, Marc Zyngier wrote:
> On Wed, 17 Dec 2025 10:10:43 +0000,
> Steven Price <steven.price@arm.com> wrote:
>>
>> There is one CAP which identified the presence of CCA, and two ioctls.
>> One ioctl is used to populate memory and the other is used when user
>> space is providing the PSCI implementation to identify the target of the
>> operation.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes since v11:
>>  * Completely reworked to be more implicit. Rather than having explicit
>>    CAP operations to progress the realm construction these operations
>>    are done when needed (on populating and on first vCPU run).
>>  * Populate and PSCI complete are promoted to proper ioctls.
>> Changes since v10:
>>  * Rename symbols from RME to RMI.
>> Changes since v9:
>>  * Improvements to documentation.
>>  * Bump the magic number for KVM_CAP_ARM_RME to avoid conflicts.
>> Changes since v8:
>>  * Minor improvements to documentation following review.
>>  * Bump the magic numbers to avoid conflicts.
>> Changes since v7:
>>  * Add documentation of new ioctls
>>  * Bump the magic numbers to avoid conflicts
>> Changes since v6:
>>  * Rename some of the symbols to make their usage clearer and avoid
>>    repetition.
>> Changes from v5:
>>  * Actually expose the new VCPU capability (KVM_ARM_VCPU_REC) by bumping
>>    KVM_VCPU_MAX_FEATURES - note this also exposes KVM_ARM_VCPU_HAS_EL2!
>> ---
>>  Documentation/virt/kvm/api.rst | 57 ++++++++++++++++++++++++++++++++++
>>  include/uapi/linux/kvm.h       | 23 ++++++++++++++
>>  2 files changed, 80 insertions(+)
>>
>> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
>> index 01a3abef8abb..2d5dc7e48954 100644
>> --- a/Documentation/virt/kvm/api.rst
>> +++ b/Documentation/virt/kvm/api.rst
>> @@ -6517,6 +6517,54 @@ the capability to be present.
>>  
>>  `flags` must currently be zero.
>>  
>> +4.144 KVM_ARM_VCPU_RMI_PSCI_COMPLETE
>> +------------------------------------
>> +
>> +:Capability: KVM_CAP_ARM_RMI
>> +:Architectures: arm64
>> +:Type: vcpu ioctl
>> +:Parameters: struct kvm_arm_rmi_psci_complete (in)
>> +:Returns: 0 if successful, < 0 on error
>> +
>> +::
>> +
>> +  struct kvm_arm_rmi_psci_complete {
>> +	__u64 target_mpidr;
>> +	__u32 psci_status;
>> +	__u32 padding[3];
>> +  };
>> +
>> +Where PSCI functions are handled by user space, the RMM needs to be informed of
>> +the target of the operation using `target_mpidr`, along with the status
>> +(`psci_status`). The RMM v1.0 specification defines two functions that require
>> +this call: PSCI_CPU_ON and PSCI_AFFINITY_INFO.
>> +
>> +If the kernel is handling PSCI then this is done automatically and the VMM
>> +doesn't need to call this ioctl.
> 
> Shouldn't we make handling of PSCI mandatory for VMMs that deal with
> CCA? I suspect it would simplify the implementation significantly.

What do you mean by making it "mandatory for VMMs"? If you mean PSCI is
always forwarded to user space then I don't think it's going to make
much difference. Patch 27 handles the PSCI changes (72 lines added), and
some of that is adding this uAPI for the VMM to handle it.

Removing the functionality to allow the VMM to handle it would obviously
simplify things a bit (we can drop this uAPI), but I think the desire is
to push this onto user space.

> What vcpu fd does this apply to? The vcpu calling the PSCI function?
> Or the target? This is pretty important for PSCI_ON. My guess is that
> this is setting the return value for the caller?

Yes the fd is the vcpu calling PSCI. As you say, this is for the return
value to be set correctly.

> Assuming this is indeed for the caller, why do we have a different
> flow from anything else that returns a result from a hypercall?

I'm not entirely sure what you are suggesting. Do you mean why are we
not just writing to the GPRS that would contain the result? The issue
here is that the RMM needs to know the PA of the target REC structure -
this isn't a return to the guest, but information for the RMM itself to
complete the PSCI call.

Ultimately even in the case where the VMM is handling PSCI, it's
actually a combination of the VMM and the RMM - with the RMM validating
the responses.

>> +
>> +4.145 KVM_ARM_RMI_POPULATE
>> +--------------------------
>> +
>> +:Capability: KVM_CAP_ARM_RMI
>> +:Architectures: arm64
>> +:Type: vm ioctl
>> +:Parameters: struct kvm_arm_rmi_populate (in)
>> +:Returns: number of bytes populated, < 0 on error
>> +
>> +::
>> +
>> +  struct kvm_arm_rmi_populate {
>> +	__u64 base;
>> +	__u64 size;
>> +	__u64 source_uaddr;
>> +	__u32 flags;
>> +	__u32 reserved;
>> +  };
>> +
>> +Populate a region of protected address space by copying the data from the user
>> +space pointer provided. This is only valid before any VCPUs have been run.
>> +The ioctl might not populate the entire region and user space may have to
>> +repeatedly call it (with updated pointers) to populate the entire region.
> 
> size as a __u64 is odd, as the return value from the ioctl is a signed
> int. This implies that you can't really report how many bytes you have
> copied.  Some form of consistency wouldn't hurt.

Good spot. In practice this works because >2GB in one operation is
highly unlikely to be processed in one go. But I guess I'll change this
to have an output size argument. I guess I could make the kernel update
all of base,size,source_uaddr which would simplify user space.

Thanks,
Steve


