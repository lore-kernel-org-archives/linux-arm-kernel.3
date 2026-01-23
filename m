Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F460D77882
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 16:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o11k5R02f9CxE3eJ5qhGCQ2U/TVdS+Rm6QF6ACvqyYs=; b=KixDprJm2J2sGuGtttg/EK3o5i
	OnulEudDG0Mq8WgeqxVhnFceDl9HZ9w4A8Lg/AK+bJPoq2NhNME30YOz1suhhAUYmOAXErzy8L4Es
	K4OA9T3xFM2HhpEbE43Y2KTzqVTWfOccQRrQ/OJNrHTeiNEOKQ/8pAJ8PYf5ghLhB2zxlPu13SAx0
	vE1VQ2h5pN/006gYwVvOJMswg76TLf6vTfzdvWQ4D/USCH7A9BJ+2NEux7THLsi+iS4SW4P3IqKCi
	heaPiUEmyLacAaLGZfmp0fXkRskaKEupWbpIBrAUbRNwPWPwVT5vMBHjIQqp6E+CKQk/mnNIRWzt5
	4hlqVDZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKJf-00000009DdG-3lnO;
	Fri, 23 Jan 2026 16:47:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKJc-00000009Dcv-4BIW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 16:47:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA6801476;
	Fri, 23 Jan 2026 08:47:09 -0800 (PST)
Received: from [10.57.67.240] (unknown [10.57.67.240])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78F1C3F694;
	Fri, 23 Jan 2026 08:47:09 -0800 (PST)
Message-ID: <a837d104-5df6-40bc-b129-eaf39fdab482@arm.com>
Date: Fri, 23 Jan 2026 16:47:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 06/46] arm64: RMI: Define the user ABI
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>
References: <20251217101125.91098-1-steven.price@arm.com>
 <20251217101125.91098-7-steven.price@arm.com>
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251217101125.91098-7-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_084721_143108_F3B938E5 
X-CRM114-Status: GOOD (  29.25  )
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

Hi Steven

On 17/12/2025 10:10, Steven Price wrote:
> There is one CAP which identified the presence of CCA, and two ioctls.
> One ioctl is used to populate memory and the other is used when user
> space is providing the PSCI implementation to identify the target of the
> operation.
> 

Could we split these changes to the corresponding implementation patches
? That might give us a full picture of how these UAPIs fit in the bigger
picture.

> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v11:
>   * Completely reworked to be more implicit. Rather than having explicit
>     CAP operations to progress the realm construction these operations
>     are done when needed (on populating and on first vCPU run).
>   * Populate and PSCI complete are promoted to proper ioctls.
> Changes since v10:
>   * Rename symbols from RME to RMI.
> Changes since v9:
>   * Improvements to documentation.
>   * Bump the magic number for KVM_CAP_ARM_RME to avoid conflicts.
> Changes since v8:
>   * Minor improvements to documentation following review.
>   * Bump the magic numbers to avoid conflicts.
> Changes since v7:
>   * Add documentation of new ioctls
>   * Bump the magic numbers to avoid conflicts
> Changes since v6:
>   * Rename some of the symbols to make their usage clearer and avoid
>     repetition.
> Changes from v5:
>   * Actually expose the new VCPU capability (KVM_ARM_VCPU_REC) by bumping
>     KVM_VCPU_MAX_FEATURES - note this also exposes KVM_ARM_VCPU_HAS_EL2!
> ---
>   Documentation/virt/kvm/api.rst | 57 ++++++++++++++++++++++++++++++++++
>   include/uapi/linux/kvm.h       | 23 ++++++++++++++
>   2 files changed, 80 insertions(+)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 01a3abef8abb..2d5dc7e48954 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6517,6 +6517,54 @@ the capability to be present.
>   
>   `flags` must currently be zero.
>   
> +4.144 KVM_ARM_VCPU_RMI_PSCI_COMPLETE
> +------------------------------------
> +
> +:Capability: KVM_CAP_ARM_RMI
> +:Architectures: arm64
> +:Type: vcpu ioctl
> +:Parameters: struct kvm_arm_rmi_psci_complete (in)
> +:Returns: 0 if successful, < 0 on error
> +
> +::
> +
> +  struct kvm_arm_rmi_psci_complete {
> +	__u64 target_mpidr;
> +	__u32 psci_status;
> +	__u32 padding[3];
> +  };
> +
> +Where PSCI functions are handled by user space, the RMM needs to be informed of
> +the target of the operation using `target_mpidr`, along with the status
> +(`psci_status`). The RMM v1.0 specification defines two functions that require
> +this call: PSCI_CPU_ON and PSCI_AFFINITY_INFO.
> +
> +If the kernel is handling PSCI then this is done automatically and the VMM
> +doesn't need to call this ioctl.
> +
> +4.145 KVM_ARM_RMI_POPULATE
> +--------------------------
> +
> +:Capability: KVM_CAP_ARM_RMI
> +:Architectures: arm64
> +:Type: vm ioctl
> +:Parameters: struct kvm_arm_rmi_populate (in)
> +:Returns: number of bytes populated, < 0 on error
> +
> +::
> +
> +  struct kvm_arm_rmi_populate {
> +	__u64 base;
> +	__u64 size;
> +	__u64 source_uaddr;
> +	__u32 flags;
> +	__u32 reserved;
> +  };
> +
> +Populate a region of protected address space by copying the data from the user
> +space pointer provided. This is only valid before any VCPUs have been run.
> +The ioctl might not populate the entire region and user space may have to
> +repeatedly call it (with updated pointers) to populate the entire region.

It may be a good idea to spill out the restrictions on calling this,
right ? We expect that the source_uaddr is a separate memory area
from the "DRAM" (in shared mode) ?

Can this be called before/after converting the entire memory of the
Guest to Private ? I believe, it must be done after the "initial
change all of DRAM to private" ?

Suzuki

>   
>   .. _kvm_run:
>   
> @@ -8765,6 +8813,15 @@ helpful if user space wants to emulate instructions which are not
>   This capability can be enabled dynamically even if VCPUs were already
>   created and are running.
>   
> +7.47 KVM_CAP_ARM_RMI
> +--------------------
> +
> +:Architectures: arm64
> +:Target: VM
> +:Parameters: None
> +
> +This capability indicates that support for CCA realms is available.
> +
>   8. Other capabilities.
>   ======================
>   
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index dddb781b0507..8e66ba9c81db 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -974,6 +974,7 @@ struct kvm_enable_cap {
>   #define KVM_CAP_GUEST_MEMFD_FLAGS 244
>   #define KVM_CAP_ARM_SEA_TO_USER 245
>   #define KVM_CAP_S390_USER_OPEREXEC 246
> +#define KVM_CAP_ARM_RMI 247
>   
>   struct kvm_irq_routing_irqchip {
>   	__u32 irqchip;
> @@ -1628,4 +1629,26 @@ struct kvm_pre_fault_memory {
>   	__u64 padding[5];
>   };
>   
> +/* Available with KVM_CAP_ARM_RMI, only for VMs with KVM_VM_TYPE_ARM_REALM  */
> +struct kvm_arm_rmi_psci_complete {
> +	__u64 target_mpidr;
> +	__u32 psci_status;
> +	__u32 padding[3];
> +};
> +
> +#define KVM_ARM_VCPU_RMI_PSCI_COMPLETE	_IOW(KVMIO, 0xd6, struct kvm_arm_rmi_psci_complete)
> +
> +/* Available with KVM_CAP_ARM_RMI, only for VMs with KVM_VM_TYPE_ARM_REALM */
> +struct kvm_arm_rmi_populate {
> +	__u64 base;
> +	__u64 size;
> +	__u64 source_uaddr;
> +	__u32 flags;
> +	__u32 reserved;
> +};
> +
> +#define KVM_ARM_RMI_POPULATE_FLAGS_MEASURE	(1 << 0)
> +
> +#define KVM_ARM_RMI_POPULATE	_IOW(KVMIO, 0xd7, struct kvm_arm_rmi_populate)
> +
>   #endif /* __LINUX_KVM_H */


