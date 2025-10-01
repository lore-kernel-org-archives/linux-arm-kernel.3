Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F14CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 14:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ln8XAbU1itg3vV82MZkX+MZntyRtlgikVpKUvTZ4g/M=; b=sRTiTrJzWFN17tVCcIvz7SpNQF
	33UTOSZWn3X3S8aUgA79/VH6u9D7j6ZvrX8N1ddc78D0eCIPgMZrQbocfpXSaZG8p4XW0z08RrkG4
	LCNXhi0JBRO0d4Z+JPPsTLrTQ67CFtQsU7DsW7I4jKPhL9YJOpWCTsR1f+rO/gd5gSd+pb+3NHQXR
	tnTWyZmsQeQoP1xgp/DtYd96/wjagLjEv+oFh1y57DCS66EvHCABV6cBc/vWTW0ZNOItuUdve1JFT
	8jWDsNOaFYvNrK6MVJlKYz/Kan2EzynADSzQSkBzsMJhiEN0ZsRZEwF8xQA+n+WzW487/NG/HjkDw
	EtHVKsfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3y4A-00000008ERg-0aUI;
	Wed, 01 Oct 2025 14:44:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3y47-00000008ERF-3Fr6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 14:44:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E54A16F2;
	Wed,  1 Oct 2025 07:44:13 -0700 (PDT)
Received: from [10.57.0.204] (unknown [10.57.0.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 20E6F3F66E;
	Wed,  1 Oct 2025 07:44:14 -0700 (PDT)
Message-ID: <47a7bc06-9d44-42f8-88df-f6db3bc997bc@arm.com>
Date: Wed, 1 Oct 2025 15:44:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 06/43] arm64: RME: Define the user ABI
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
References: <20250820145606.180644-1-steven.price@arm.com>
 <20250820145606.180644-7-steven.price@arm.com> <86jz1eztz4.wl-maz@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <86jz1eztz4.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_074423_911573_AF3ACD2C 
X-CRM114-Status: GOOD (  52.28  )
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

On 01/10/2025 13:28, Marc Zyngier wrote:
> On Wed, 20 Aug 2025 15:55:26 +0100,
> Steven Price <steven.price@arm.com> wrote:
>>
>> There is one (multiplexed) CAP which can be used to create, populate and
>> then activate the realm.
>>
>> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> ---
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
>>  Documentation/virt/kvm/api.rst    | 71 +++++++++++++++++++++++++++++++
>>  arch/arm64/include/uapi/asm/kvm.h | 49 +++++++++++++++++++++
>>  include/uapi/linux/kvm.h          | 10 +++++
>>  3 files changed, 130 insertions(+)
>>
>> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
>> index 6aa40ee05a4a..69c0a9eba6c5 100644
>> --- a/Documentation/virt/kvm/api.rst
>> +++ b/Documentation/virt/kvm/api.rst
>> @@ -3549,6 +3549,11 @@ Possible features:
>>  	  Depends on KVM_CAP_ARM_EL2_E2H0.
>>  	  KVM_ARM_VCPU_HAS_EL2 must also be set.
>>  
>> +	- KVM_ARM_VCPU_REC: Allocate a REC (Realm Execution Context) for this
>> +	  VCPU. This must be specified on all VCPUs created in a Realm VM.
>> +	  Depends on KVM_CAP_ARM_RME.
>> +	  Requires KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_REC).
>> +
>>  4.83 KVM_ARM_PREFERRED_TARGET
>>  -----------------------------
>>  
>> @@ -5122,6 +5127,7 @@ Recognised values for feature:
>>  
>>    =====      ===========================================
>>    arm64      KVM_ARM_VCPU_SVE (requires KVM_CAP_ARM_SVE)
>> +  arm64      KVM_ARM_VCPU_REC (requires KVM_CAP_ARM_RME)
>>    =====      ===========================================
>>  
>>  Finalizes the configuration of the specified vcpu feature.
>> @@ -6476,6 +6482,30 @@ the capability to be present.
>>  
>>  `flags` must currently be zero.
>>  
>> +4.144 KVM_ARM_VCPU_RMM_PSCI_COMPLETE
>> +------------------------------------
>> +
>> +:Capability: KVM_CAP_ARM_RME
>> +:Architectures: arm64
>> +:Type: vcpu ioctl
>> +:Parameters: struct kvm_arm_rmm_psci_complete (in)
>> +:Returns: 0 if successful, < 0 on error
>> +
>> +::
>> +
>> +  struct kvm_arm_rmm_psci_complete {
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
> Why should userspace involved in this? Why can't this be a
> notification that the host delivers to the RMM when the vcpu is about
> to run?

This is only when PSCI is being handled by user space. If the kernel
(i.e KVM) is handling PSCI then indeed there's no user space involvement.

I'm not sure how we could avoid this when PSCI is being implemented in
user space. Or am I missing something?

>>  
>>  .. _kvm_run:
>>  
>> @@ -8662,6 +8692,47 @@ This capability indicate to the userspace whether a PFNMAP memory region
>>  can be safely mapped as cacheable. This relies on the presence of
>>  force write back (FWB) feature support on the hardware.
>>  
>> +7.44 KVM_CAP_ARM_RME
>> +--------------------
>> +
>> +:Architectures: arm64
>> +:Target: VM
>> +:Parameters: args[0] provides an action, args[1] points to a structure in
>> +             memory for the action.
>> +:Returns: 0 on success, negative value on error
>> +
>> +Used to configure and set up the memory for a Realm. The available actions are:
>> +
>> +================================= =============================================
>> + KVM_CAP_ARM_RME_CONFIG_REALM     Takes struct arm_rme_config as args[1] and
>> +                                  configures realm parameters prior to it being
>> +                                  created.
>> +
>> +                                  Options are ARM_RME_CONFIG_RPV to set the
>> +                                  "Realm Personalization Value" and
>> +                                  ARM_RME_CONFIG_HASH_ALGO to set the hash
>> +                                  algorithm.
>> +
>> + KVM_CAP_ARM_RME_CREATE_REALM     Request the RMM to create the realm. The
>> +                                  realm's configuration parameters must be set
>> +                                  first.
>> +
>> + KVM_CAP_ARM_RME_INIT_RIPAS_REALM Takes struct arm_rme_init_ripas as args[1]
>> +                                  and sets the RIPAS (Realm IPA State) to
>> +                                  RIPAS_RAM of a specified area of the realm's
>> +                                  IPA.
>> +
>> + KVM_CAP_ARM_RME_POPULATE_REALM   Takes struct arm_rme_populate_realm as
>> +                                  args[1] and populates a region of protected
>> +                                  address space by copying the data from the
>> +                                  shared alias.
>> +
>> + KVM_CAP_ARM_RME_ACTIVATE_REALM   Request the RMM to activate the realm. No
>> +                                  changes can be made to the Realm's populated
>> +                                  memory, IPA state, configuration parameters
>> +                                  or vCPU additions after this step.
>> +================================= =============================================
>> +
> 
> These are not capabilities, they are actions that the VMM may perform
> on a VM. You don't configure a VM using capabilities. You use it to
> buy into some behaviours, but that's all.
> 
> And then there is the semantic of this stuff. Why do I need something
> like KVM_CAP_ARM_RME_CREATE_REALM when I can just pass this as part of
> the VM type? Why do I need a new way to describe memory region when we
> already have memslots for that exact purpose?
> 
> Overall, you are leaking the RMM interface into userspace, and that's
> an absolute show-stopper. We have an API, it is not pretty, but it
> exists. We don't need another one that will be just as broken. If the
> RMM needs some impedance matching, that's the kernel's job.

So I'll admit the (ab)use of capabilities to set up the realm is a bit
of a hack. I initially did it this way to maintain some compatibility
with a prototype implementation, but it's taken until v10 for anyone to
express displeasure with the approach! It would of course be possible to
implement these are separate ioctls.

However, it seems we need to pin down the semantics before I do that
refactoring.

KVM_CAP_ARM_RME_CREATE_REALM
============================

The desire is that you can configure the aspects of the realm piecemeal
and then later trigger the SMC to the RMM. This avoids the need for a
big structure (which will grow with new features) containing all the
configuration. It also allows KVM_CAP_ARM_RME_CONFIG_REALM to validate
each configuration and provide immediate failure when a configuration
option is invalid.

Would you prefer ditching KVM_CAP_ARM_RME_CONFIG_REALM and passing a
structure of all the configuration options to
KVM_CAP_ARM_RME_CREATE_REALM? It would make identifying what part of an
invalid configuration is problematic harder. And we'd probably therefore
need to add a new discovery mechanism to find e.g. which hash algorithms
are supported.

KVM_CAP_ARM_RME_INIT_RIPAS_REALM
================================

This is a property that doesn't exist for a normal guest and as such the
VMM is going to have to do something extra to describe which areas of
RAM are protected and which are shared. I guess with the recent
guest_memfd changes it might be possible to pull that from the
guest_memfd instance(s). But note that it's entirely valid (from the CCA
perspective) to have both protected and shared regions that are not
backed at guest start. So setting the RIPAS to RAM (i.e. making an area
of memory protected) is independent of the guest_memfd backing status.

KVM_CAP_ARM_RME_POPULATE_REALM
==============================

This ties in with the above. This is effectively doing a data-preserving
conversion of shared to protected. We need some form of this to set the
initial data for the guest (boot loader/kernel image etc).

In this patch set this API is a little broken as it requires double
backing (both a valid VMA in the VMM and allocation in the guest_memfd).
My expectation was to replace this with a version that simply does an
in-place data-preserving conversion in guest_memfd. The only drawback is
that this requires a double memcpy() - KVM would need to copy the data
to a temporary buffer, and then the RMM would copy it back (after
dealing with memory encryption setup).

The alternative would be to provide a separate input buffer for
POPULATE_REALM. That could e.g. be a mmap()ed file, but that moves CCA
further away from a standard interface.

KVM_CAP_ARM_RME_ACTIVATE_REALM
==============================

This is easiest to drop - we could just do this step when the VMM first
tries to start a VCPU. The main benefits are:

 * It makes error reporting more obvious (you can tell the difference
between the RMM failing the activate and something else preventing a
VCPU entry).

 * It makes the KVM code slightly clearer because the state transition
is triggered by an obvious action from the VMM, and there's less
potential for races.


I agree it's a shame that the VMM can't just use the standard KVM
interface for realm guest setup. But there are some fundamental
differences between a normal guest and a realm guest. So the VMM will
need to be enlightened. Feel free to comment on the above if you have
suggestions on how the above API can be improved.

Thanks,
Steve


