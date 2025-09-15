Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D40CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 16:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9zaeVwYawxq02Oha9lhHu2oE+DcMY7EL24LeWwGG3Jc=; b=rMOJBOR5wNHuz8w1EbXhjmSXj6
	eA3ayrzJfmkixOKA8qlRkLzDDgrvw0tggMuBmpcyqPCxfh+Cuia4IkX0QbN+ycbBXC+DFkASGocug
	48qcTOs9a+1xnmGnTiRZF0SW6x8oQPYth3CQOUb4/GflMnitpqKgupSZHy9fI3N44ODFQwZch4XhQ
	n7we3F4EdA09PCSc+iDUM1g56jKW9Yd637Fvk/zIPwRzRh+Cow3vqFZWg2+7I+vIbubzKPEcI9PQ0
	W3W5pwmiuEex7NzBVxMnlLFJRKz26O1lvO31lNIJm5lBlqfaj7zkQNa+ij2w5RQhRLCTGifzbVocx
	fLBHv6Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyBfI-000000052en-17WJ;
	Mon, 15 Sep 2025 16:02:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyBfG-000000052e6-0Jrs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 16:02:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37A3A1BF7;
	Mon, 15 Sep 2025 09:02:41 -0700 (PDT)
Received: from [10.57.5.5] (unknown [10.57.5.5])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 514163F673;
	Mon, 15 Sep 2025 09:02:47 -0700 (PDT)
Message-ID: <273fbd29-0f73-4431-b685-14680040c86c@arm.com>
Date: Mon, 15 Sep 2025 17:02:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: Update stale comment for sanitise_mte_tags()
To: Alexandru Elisei <alexandru.elisei@arm.com>, maz@kernel.org,
 oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev
Cc: Peter Collingbourne <pcc@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>
References: <20250915155234.196288-1-alexandru.elisei@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250915155234.196288-1-alexandru.elisei@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_090250_156821_2A29B61E 
X-CRM114-Status: GOOD (  20.84  )
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

On 15/09/2025 16:52, Alexandru Elisei wrote:
> Commit c911f0d46879 ("KVM: arm64: permit all VM_MTE_ALLOWED mappings
> with MTE enabled") allowed VM_SHARED VMAs in a VM with MTE enabled, so
> remove the comment to the contrary.
> 
> Commit d77e59a8fccd ("arm64: mte: Lock a page for MTE tag initialisation")
> removed the race that can lead to tags being zeroed more than once when
> multiple threads attempt initialisation at the same time, so remove the
> comment about mmap_lock too. Note that sanitise_mte_tags() was never called
> with the mmap_lock held from user_mem_abort() and the race was prevented by
> kvm->mmu_lock.
> 
> However, the function still requires to have the kvm->mmu_lock held to
> ensure that the memory remains mapped in the userspace process while the
> tags are zeroed. Document this in a comment.
> 
> CC: Peter Collingbourne <pcc@google.com>
> CC: Catalin Marinas <catalin.marinas@arm.com>
> CC: Steven Price <steven.price@arm.com>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks,
Steve

> ---
>  arch/arm64/kvm/mmu.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 86f3d80daf37..33f4c923be70 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1459,11 +1459,8 @@ static int get_vma_page_shift(struct vm_area_struct *vma, unsigned long hva)
>   * able to see the page's tags and therefore they must be initialised first. If
>   * PG_mte_tagged is set, tags have already been initialised.
>   *
> - * The race in the test/set of the PG_mte_tagged flag is handled by:
> - * - preventing VM_SHARED mappings in a memslot with MTE preventing two VMs
> - *   racing to santise the same page
> - * - mmap_lock protects between a VM faulting a page in and the VMM performing
> - *   an mprotect() to add VM_MTE
> + * Must be called with kvm->mmu_lock held to ensure the memory remains mapped
> + * while the tags are zeroed.
>   */
>  static void sanitise_mte_tags(struct kvm *kvm, kvm_pfn_t pfn,
>  			      unsigned long size)
> 
> base-commit: f83ec76bf285bea5727f478a68b894f5543ca76e


