Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234C0C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 12:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BmLsIcWQ3lfRMJfAu/8Cs3/RZqH2cl9Q4bEptL34rH8=; b=kcHWhPeYX2ejggmC8wLfhwPiID
	ymLcCgOST12AdHCFeSw+QjxjNDD3giOXe6SLPXe8ausPKGpOyWtL9BCrVttW4vsDyAY2NaXVIE9Gn
	Yge5a/jmxWCxKrXYelGJ+KE5TcmOPRu5XD/K6Xy2WsxjwLbEY+EpUp+Vfm7TaLlBCuhgLGdGgUNOE
	Pl2/aStoocS4eT/KL+nJUnENNSak4uwdqFwWpmqCYC19Zw8e5S/PkuAx1+fmeNlY3wQ8FxfPUYgo1
	DNGFlAJYgnzS0r0RDfsn56h3YeGZdZelY+nVAO3kllLCO4lGL6GVoFF/CjxilmU7yEziu2Ee2JcLt
	MGvJGu3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHMNU-0000000CuyY-0EUw;
	Tue, 20 May 2025 12:47:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHMLK-0000000CuVs-3MCn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 12:45:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BE211516;
	Tue, 20 May 2025 05:44:53 -0700 (PDT)
Received: from [10.1.36.74] (Suzukis-MBP.cambridge.arm.com [10.1.36.74])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7D77A3F5A1;
	Tue, 20 May 2025 05:45:03 -0700 (PDT)
Message-ID: <bfddad3d-b15b-4122-a460-47489af11f24@arm.com>
Date: Tue, 20 May 2025 13:45:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 33/43] arm64: RME: Hide KVM_CAP_READONLY_MEM for realm
 guests
Content-Language: en-GB
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
 <aneesh.kumar@kernel.org>
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-34-steven.price@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250416134208.383984-34-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_054514_877530_E92EA018 
X-CRM114-Status: GOOD (  17.39  )
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

On 16/04/2025 14:41, Steven Price wrote:
> For protected memory read only isn't supported by the RMM. While it may
> be possible to support read only for unprotected memory, this isn't
> supported at the present time.
> 
> Note that this does mean that ROM (or flash) data cannot be emulated
> correctly by the VMM as the stage 2 mappings are either always
> read/write or are trapped as MMIO (so don't support operations where the
> syndrome information doesn't allow emulation, e.g. load/store pair).
> 
> This restriction can be lifted in the future by allowing the stage 2

minor nit: s/allowing the/allowing the unprotected/

> mappings to be made read only.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

> ---
> Changes since v7:
>   * Updated commit message to spell out the impact on ROM/flash
>     emulation.
> ---
>   arch/arm64/kvm/arm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 8060e25afbd0..4780e3af1bb9 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -340,7 +340,6 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   	case KVM_CAP_ONE_REG:
>   	case KVM_CAP_ARM_PSCI:
>   	case KVM_CAP_ARM_PSCI_0_2:
> -	case KVM_CAP_READONLY_MEM:
>   	case KVM_CAP_MP_STATE:
>   	case KVM_CAP_IMMEDIATE_EXIT:
>   	case KVM_CAP_VCPU_EVENTS:
> @@ -355,6 +354,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   		r = 1;
>   		break;
>   	case KVM_CAP_COUNTER_OFFSET:
> +	case KVM_CAP_READONLY_MEM:
>   	case KVM_CAP_SET_GUEST_DEBUG:
>   		r = !kvm_is_realm(kvm);
>   		break;


