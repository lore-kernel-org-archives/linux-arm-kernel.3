Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EB9CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 08:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e0tO+AXwvzwsR7hiiJIrE45BPYOVlZEsl/62oMi/RRQ=; b=FSqpFX+m2ubWJi/z+aSlHlFHyD
	1L/CiHg9NNthMH96BUQ21b7qnIAZGfTx4UPhG3ffzlpHcauJyN2Hi751ltTpwkPN6upv6KroGSNfn
	hDLpIWns275AmZ1qmxqBdr9MuH71Ls0jnVF2FlsPgfYE1gCRx3VoGPk+FSpKYPnzQ2f7CwP9PMotL
	rMjvPx4a63p6CBfh2eQtCQuVTa6ykb8efh6emFAqY1NJLB9GCer1Rg3G9pIuBSntaB0Fkvu8QpwE/
	J7ILBCuVqO/BCKJ4H4uGQZ2kmByJHNOX5lpk5nOeJaJKWhN9C7FITRT7beEtDEB+DcrYVsW+NSuy8
	AnZorabA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV3uu-0000000GRzK-3UHl;
	Thu, 04 Jun 2026 08:59:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV3ut-0000000GRz5-076H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 08:59:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 698EB40356;
	Thu,  4 Jun 2026 08:59:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA7571F00893;
	Thu,  4 Jun 2026 08:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780563546;
	bh=e0tO+AXwvzwsR7hiiJIrE45BPYOVlZEsl/62oMi/RRQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ICi+m2HIEnZNl1BehmK/+66vRKvHjYUFk4TJyUZbA+YfBqGaVSkUrtx/ZLMAiiOS9
	 D+AUbtvnCtzpBLZP93wmeJ5NMSs90OWjozSrl/6hMCQFn6bmXL1l9jXVKTJDvBZW/C
	 z4D43pW43uFItUBz++xzjw3Obqq+CWRPQAyIHfwJI+7s13e+aOFVzAKssmm+sR8nr4
	 F8v35knExCwFFQWmewEiJfvZGTeqJRK2QjRElDrcemlF7GmQe87n9kfm4VFZMA+ul3
	 RUcPrPNa29EXnF3sSR/c53jr9yJ7mzvtHlXakmcyMiY6b8LlIJyPBzMOk+6/l0hxpc
	 X9zDcb6HrQvoA==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Mostafa Saleh <smostafa@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, will@kernel.org,
	rppt@kernel.org, maz@kernel.org,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 3/3] arm64/coco: Add pKVM as a CC platform
In-Reply-To: <20260603110522.3331819-4-smostafa@google.com>
References: <20260603110522.3331819-1-smostafa@google.com>
 <20260603110522.3331819-4-smostafa@google.com>
Date: Thu, 04 Jun 2026 14:29:00 +0530
Message-ID: <yq5a1pemsmuj.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Mostafa Saleh <smostafa@google.com> writes:

> pKVM does support memory encryption, expose that to the rest of
> the kernel through cc_platform_has()
>
> At the moment, all devices inside the guest are emulated which
> requires its memory to be shared back to the host (decrypted), so
> set force_dma_unencrypted() to always return true.
>
> Although, typically pKVM guests rely on restricted-dma-pools to
> bounce traffic, with this change, it is possible to solely rely on
> the default SWIOTLB for that (assuming the appropriate size is set
> from the command line)
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
> This change is critical for the ongoing refactoring of the DMA-API[1]
> that will break protected guests under pKVM with this patch. That is
> due to this rework will make the state of the SWIOTLB and restricted
> dma pools depends on the value returned by cc_platform_has()
>
> [1] https://lore.kernel.org/all/20260522042815.370873-1-aneesh.kumar@kernel.org/
> ---
>  arch/arm64/include/asm/hypervisor.h           | 13 +++++++++++++
>  arch/arm64/include/asm/mem_encrypt.h          |  3 ++-
>  arch/arm64/kernel/rsi.c                       | 12 ------------
>  arch/arm64/mm/init.c                          | 15 ++++++++++++++-
>  drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c |  3 +++
>  5 files changed, 32 insertions(+), 14 deletions(-)
>
> diff --git a/arch/arm64/include/asm/hypervisor.h b/arch/arm64/include/asm/hypervisor.h
> index a12fd897c877..8889a0ba1ec5 100644
> --- a/arch/arm64/include/asm/hypervisor.h
> +++ b/arch/arm64/include/asm/hypervisor.h
> @@ -3,6 +3,9 @@
>  #define _ASM_ARM64_HYPERVISOR_H
>  
>  #include <asm/xen/hypervisor.h>
> +#include <linux/jump_label.h>
> +
> +DECLARE_STATIC_KEY_FALSE(pkvm_guest);
>  
>  void kvm_init_hyp_services(void);
>  bool kvm_arm_hyp_service_available(u32 func_id);
> @@ -10,8 +13,18 @@ void kvm_arm_target_impl_cpu_init(void);
>  
>  #ifdef CONFIG_ARM_PKVM_GUEST
>  void pkvm_init_hyp_services(void);
> +
> +static inline bool is_protected_kvm_guest(void)
> +{
> +	return static_branch_unlikely(&pkvm_guest);
> +}
>  #else
>  static inline void pkvm_init_hyp_services(void) { };
> +
> +static inline bool is_protected_kvm_guest(void)
> +{
> +	return false;
> +}
>  #endif
>  
>  static inline void kvm_arch_init_hyp_services(void)
>

...

> diff --git a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
> index d66291def0f4..26fe9c3f22e3 100644
> --- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
> +++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
> @@ -17,6 +17,7 @@
>  #include <asm/hypervisor.h>
>  
>  static size_t pkvm_granule;
> +DEFINE_STATIC_KEY_FALSE_RO(pkvm_guest);
>

Do we need EXPORT_SYMBOL on this? 

>  
>  static int arm_smccc_do_one_page(u32 func_id, phys_addr_t phys)
>  {
> @@ -120,4 +121,6 @@ void pkvm_init_hyp_services(void)
>  
>  	if (kvm_arm_hyp_service_available(ARM_SMCCC_KVM_FUNC_MMIO_GUARD))
>  		arm64_ioremap_prot_hook_register(&mmio_guard_ioremap_hook);
> +
> +	static_branch_enable(&pkvm_guest);
>  }
> -- 
> 2.54.0.1032.g2f8565e1d1-goog

-aneesh

