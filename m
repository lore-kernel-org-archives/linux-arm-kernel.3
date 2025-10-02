Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D66CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 08:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nxkju7xvu3XlLPbYAPWyLP6gzesJ2Mwqh1YiwTVqcno=; b=4yU9vpsU0czM1UqyuJOnqu8esv
	CEdp5lJk/XlyF7Za1q6oFK3G6caCnqNe6J/Tr+morjGlBHZbGLqWZinlnBCR3+aA1Pxl0Tr8Q4OYL
	tjUK9z27fe82UOpBRjk93pubT5r80kYyd89SbE8GLpj8z70qrrLpZRNbX9MnRGsbw+hqEsfwA4ZTf
	rufMCVA+9I6hMatOPqJczyHvcABRqsCeMl1XCQdIu4cVk2ZJGTstwvi+RvGb8AWlDur1G/znOEfgB
	/nKwoaVl6pIi2AHgiJqHoUWtk7FfX0FDKCaG72e/zZdouNJSu5YPvTC+pnXSn5P1f0WodFUVoyXHm
	9B+g0RrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4ExU-0000000A2dW-3k0e;
	Thu, 02 Oct 2025 08:46:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4ExS-0000000A2bs-1zGl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 08:46:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2721C1692;
	Thu,  2 Oct 2025 01:46:27 -0700 (PDT)
Received: from [10.1.27.48] (unknown [10.1.27.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 584853F66E;
	Thu,  2 Oct 2025 01:46:31 -0700 (PDT)
Message-ID: <6d3953f3-14ce-4a58-a018-3636e77dbdf8@arm.com>
Date: Thu, 2 Oct 2025 09:46:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 06/43] arm64: RME: Define the user ABI
Content-Language: en-GB
To: Steven Price <steven.price@arm.com>, Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
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
 <47a7bc06-9d44-42f8-88df-f6db3bc997bc@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <47a7bc06-9d44-42f8-88df-f6db3bc997bc@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_014638_596445_C4ACCBA2 
X-CRM114-Status: GOOD (  21.71  )
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

On 01/10/2025 15:44, Steven Price wrote:
> On 01/10/2025 13:28, Marc Zyngier wrote:
>> On Wed, 20 Aug 2025 15:55:26 +0100,
>> Steven Price <steven.price@arm.com> wrote:
>>>
>>> There is one (multiplexed) CAP which can be used to create, populate and
>>> then activate the realm.
>>>
>>> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>>> ---
>>> Changes since v9:
>>>   * Improvements to documentation.
>>>   * Bump the magic number for KVM_CAP_ARM_RME to avoid conflicts.
>>> Changes since v8:
>>>   * Minor improvements to documentation following review.
>>>   * Bump the magic numbers to avoid conflicts.
>>> Changes since v7:
>>>   * Add documentation of new ioctls
>>>   * Bump the magic numbers to avoid conflicts
>>> Changes since v6:
>>>   * Rename some of the symbols to make their usage clearer and avoid
>>>     repetition.
>>> Changes from v5:
>>>   * Actually expose the new VCPU capability (KVM_ARM_VCPU_REC) by bumping
>>>     KVM_VCPU_MAX_FEATURES - note this also exposes KVM_ARM_VCPU_HAS_EL2!
>>> ---
>>>   Documentation/virt/kvm/api.rst    | 71 +++++++++++++++++++++++++++++++
>>>   arch/arm64/include/uapi/asm/kvm.h | 49 +++++++++++++++++++++
>>>   include/uapi/linux/kvm.h          | 10 +++++
>>>   3 files changed, 130 insertions(+)
>>>
>>> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
>>> index 6aa40ee05a4a..69c0a9eba6c5 100644
>>> --- a/Documentation/virt/kvm/api.rst
>>> +++ b/Documentation/virt/kvm/api.rst
>>> @@ -3549,6 +3549,11 @@ Possible features:
>>>   	  Depends on KVM_CAP_ARM_EL2_E2H0.
>>>   	  KVM_ARM_VCPU_HAS_EL2 must also be set.
>>>   
>>> +	- KVM_ARM_VCPU_REC: Allocate a REC (Realm Execution Context) for this
>>> +	  VCPU. This must be specified on all VCPUs created in a Realm VM.
>>> +	  Depends on KVM_CAP_ARM_RME.
>>> +	  Requires KVM_ARM_VCPU_FINALIZE(KVM_ARM_VCPU_REC).
>>> +
>>>   4.83 KVM_ARM_PREFERRED_TARGET
>>>   -----------------------------
>>>   
>>> @@ -5122,6 +5127,7 @@ Recognised values for feature:
>>>   
>>>     =====      ===========================================
>>>     arm64      KVM_ARM_VCPU_SVE (requires KVM_CAP_ARM_SVE)
>>> +  arm64      KVM_ARM_VCPU_REC (requires KVM_CAP_ARM_RME)
>>>     =====      ===========================================
>>>   
>>>   Finalizes the configuration of the specified vcpu feature.
>>> @@ -6476,6 +6482,30 @@ the capability to be present.
>>>   
>>>   `flags` must currently be zero.
>>>   
>>> +4.144 KVM_ARM_VCPU_RMM_PSCI_COMPLETE
>>> +------------------------------------
>>> +
>>> +:Capability: KVM_CAP_ARM_RME
>>> +:Architectures: arm64
>>> +:Type: vcpu ioctl
>>> +:Parameters: struct kvm_arm_rmm_psci_complete (in)
>>> +:Returns: 0 if successful, < 0 on error
>>> +
>>> +::
>>> +
>>> +  struct kvm_arm_rmm_psci_complete {
>>> +	__u64 target_mpidr;
>>> +	__u32 psci_status;
>>> +	__u32 padding[3];
>>> +  };
>>> +
>>> +Where PSCI functions are handled by user space, the RMM needs to be informed of
>>> +the target of the operation using `target_mpidr`, along with the status
>>> +(`psci_status`). The RMM v1.0 specification defines two functions that require
>>> +this call: PSCI_CPU_ON and PSCI_AFFINITY_INFO.
>>> +
>>> +If the kernel is handling PSCI then this is done automatically and the VMM
>>> +doesn't need to call this ioctl.
>>
>> Why should userspace involved in this? Why can't this be a
>> notification that the host delivers to the RMM when the vcpu is about
>> to run?
> 
> This is only when PSCI is being handled by user space. If the kernel
> (i.e KVM) is handling PSCI then indeed there's no user space involvement.
> 
> I'm not sure how we could avoid this when PSCI is being implemented in
> user space. Or am I missing something?

I think there is a bit of disconnect here.

The RMM doesn't track the RECs for a given vCPU. So, when it requires
the REC object for a given vCPU, the Host provides this via an 
RMI_PSCI_COMPLETE call. This is used for PSCI_CPU_ON and 
PSCI_AFFINITY_INFO today, where the RMM can do the book keeping
for the REC and emulate the PSCI. Now, the host does have a control
on whether to ACCEPT or REJECT a request (for CPU_ON).
The RMM requires the PSCI_COMPLETE call, before it can return the
PSCI_CPU_ON back to the caller and also before the target vCPU can
run. Thus, this cannot be delayed until the "new VCPU" is run.

Like Steven mentioned, this is only useful in the UABI if the VMM is
handling the PSCI. And this must be issued, before the target vCPU
can be scheduled.

Suzuki

