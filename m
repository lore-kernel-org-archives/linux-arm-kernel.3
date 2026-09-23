Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D0CC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 19:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSfIuk4XJxU/lVN91KZIevNMexPXXajdEPSR27YPx14=; b=0PciuuEuKnzYj1Bbe6ThdkBJkL
	Fmwg6dqV0uIc8/9ML3RtCF+QB015qBXOa2kVvJ6QEOCjNR6vlwCGdw/TgMpc+9RFBTi62hP2aP6Fx
	62T3rzDzTEUkoArouNhq8OK/ZAOIztz6iCF12OnZgxDuQmIgBS9k34h0/p5f8+JI3iU03ds/vfUoQ
	RW5olKkA9k3HwtDAQnqNcZc9SsGbof4zfszrl2xWaVHL9g375ZaSrPfFyx/sgiHx1JeMpHH1gGGdT
	B+GmTza+9PF+Gbsu6J7Nvc+5FAu21lTMU94BcnwMhaoO3ItDYNEaswWHRNZyc10dhtNOzuMeP8lI/
	xcmmr9FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Sp0-00000009Lr5-2wqM;
	Wed, 23 Sep 2026 19:40:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Soz-00000009Lqj-2jcf
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 19:40:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GSfIuk4XJxU/lVN91KZIevNMexPXXajdEPSR27YPx14=; b=rBRawbohNmoyb8pxjdeG/hZ3WT
	wxMCKXE/5tXXVuyRcbEBBGIPdzjjZutF8aSr6ccd3vYLtcpR6fWOFze77xw6LRMD9AAGzROtMmVKc
	VUTYYL8RorxnBcP0HNKFO9lnEaB0rEmFl6Vb/S8HhFTkKXChqZr1L9rmdKSvV0+V+WnZOZGTy1V2D
	y64localgiZ/ABAn878JeTPy7WorZbFFDdaUOAXrWLXAc9WIsfwF5To5Co9xPQQKA1mDha5MnHTH7
	8BiXfEoDo06Ay0ZtDIkEhREtGWfFyM92ppaltecjZBQt9cTcmUO3XNjgmfGk4/6zIu3vDox2RBlqj
	pEY7R2ew==;
Received: from out-182.mta1.migadu.com ([95.215.58.182] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Sow-0000000FDRi-1stJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 19:40:00 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=8q5LOhzHXz3Yz0fy85hHf0cIzNFEPBBRVDjkf2/J8z0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790192396; v=1; x=1790797196;
 b=g5NzyyzEaffnpIpAmPD6MhfdrbEopfrSop3nNgQKpxnWFRcbITgYOGSzEiSzKe4H2yrR/Fmb
 jRdjaipg0GgypNl0PaU5EbeE3eS3J/S6DQ1wmRMXPz1gdrfaX7jJR1wUP9SiWSIsYg5FoWTDg5D
 0yK9lpXSIBDdBA2fiUwIMXpM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4b51889327b49bd5;
	Wed, 23 Sep 2026 19:39:56 +0000
X-Mizu-Trace-ID: 4b51889327b49bd5
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b5e5aaf7deso2156e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 12:39:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy2/I7UEDooYsylbGeVTJdezLM1pb5N4rWNmOk1qa52EYJO4AB9avmtsgytUyiKUMK6GB0bIUCsQ7ehgsDNH4Xh@lists.infradead.org
X-Gm-Message-State: AFuF++nY9pIYAPVABIIcIjvp/AjFoWC6qKOx8v7hTTRDtOHgwEeFo0M7
	qmJpwOnRhRGE5d7SG6iQq31GN4TUN63vRohLELpaOmIJu+BOJ87amqLZmtgZnb7o7Y0hKZSemQm
	RC57qfmO3LsVP7gaESU4EZl8odM4Hjo4Cb5nYbF0g
X-Received: by 2002:a05:6512:a8c:b0:5b8:d049:c45f with SMTP id
 2adb3069b0e04-5b8dda20690mr52878e87.14.1790192395743; Wed, 23 Sep 2026
 12:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260922130821.1666713-1-vdonnefort@google.com> <20260922130821.1666713-7-vdonnefort@google.com>
In-Reply-To: <20260922130821.1666713-7-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 23 Sep 2026 20:39:19 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzcpo+LB4WMa+wqVQv3L6KUcYsg-XJmr2y7G32O_uqJpw@mail.gmail.com>
X-Gm-Features: AclHuK8Z6SY4cBU4eJy41QhCQFrZb6shCMogQ4bHwKy9JKLhaeBBpmmDsIysMxw
Message-ID: <CA+EHjTzcpo+LB4WMa+wqVQv3L6KUcYsg-XJmr2y7G32O_uqJpw@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] KVM: arm64: Use kvm_s2_fault_vma_info in pkvm_mem_abort()
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_203958_803122_ECAB362B 
X-CRM114-Status: GOOD (  27.30  )
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

On Tue, 22 Sept 2026 at 14:08, 'Vincent Donnefort' via kernel-team
<kernel-team@android.com> wrote:
>
> To paraphrase Marc in commit 08f97454b7fa ("KVM: arm64: Fix protected
> mode handling of pages larger than 4kB"), pkvm_pgtable_stage2_map()
> assumes the address passed as a parameter is aligned to the size of the
> intended mapping, while HPFAR_EL2 gives the IPA minus the bottom 12
> bits, regardless of the system page size configuration.
>
> To fix this alignment, bring support for kvm_s2_fault_vma_info in
> pkvm_mem_abort() and use its members where possible. They do contain the
> page-alignment we need to fix the fault on system with pages larger than
> 4K.
>
> Also, add a check at the start of pkvm_pgtable_stage2_map(), it does not
> support !PAGE_ALIGNED arguments.
>
> Fixes: ea03466e806f ("KVM: arm64: Handle aborts from protected VMs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba < fuad.tabba@linux.dev>

Cheers,
/fuad


> ---
>  arch/arm64/kvm/mmu.c  | 24 +++++++++++++++---------
>  arch/arm64/kvm/pkvm.c |  3 +++
>  2 files changed, 18 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index ee0fcca838c1..167b769107ee 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1374,9 +1374,11 @@ static bool fault_supports_stage2_huge_mapping(const struct kvm_s2_fault_desc *s
>         if (map_size == PAGE_SIZE)
>                 return true;
>
> -       /* pKVM only supports PMD_SIZE huge-mappings */
> -       if (is_protected_kvm_enabled() && map_size != PMD_SIZE)
> -               return false;
> +       /* pKVM only supports PMD_SIZE huge-mappings for non-protected VMs */
> +       if (is_protected_kvm_enabled()) {
> +               if (vcpu_is_protected(s2fd->vcpu) || map_size != PMD_SIZE)
> +                       return false;
> +       }
>
>         size = memslot->npages * PAGE_SIZE;
>
> @@ -2167,12 +2169,12 @@ int kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
>  static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>  {
>         unsigned int flags = FOLL_HWPOISON | FOLL_LONGTERM | FOLL_WRITE;
> +       struct kvm_s2_fault_vma_info s2vi = {};
>         struct kvm_vcpu *vcpu = s2fd->vcpu;
>         struct kvm_pgtable *pgt = vcpu->arch.hw_mmu->pgt;
>         struct mm_struct *mm = current->mm;
>         struct kvm *kvm = vcpu->kvm;
>         void *hyp_memcache;
> -       struct page *page;
>         int ret;
>
>         hyp_memcache = get_mmu_memcache(vcpu);
> @@ -2180,12 +2182,16 @@ static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>         if (ret)
>                 return -ENOMEM;
>
> +       ret = kvm_s2_fault_get_vma_info(s2fd, &s2vi);
> +       if (ret)
> +               return ret;
> +
>         ret = account_locked_vm(mm, 1, true);
>         if (ret)
>                 return ret;
>
>         mmap_read_lock(mm);
> -       ret = pin_user_pages(s2fd->hva, 1, flags, &page);
> +       ret = pin_user_pages(s2fd->hva, 1, flags, &s2vi.page);
>         mmap_read_unlock(mm);
>
>         if (ret == -EHWPOISON) {
> @@ -2195,7 +2201,7 @@ static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>         } else if (ret != 1) {
>                 ret = -EFAULT;
>                 goto dec_account;
> -       } else if (!folio_test_swapbacked(page_folio(page))) {
> +       } else if (!folio_test_swapbacked(page_folio(s2vi.page))) {
>                 /*
>                  * We really can't deal with page-cache pages returned by GUP
>                  * because (a) we may trigger writeback of a page for which we
> @@ -2215,8 +2221,8 @@ static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>         }
>
>         write_lock(&kvm->mmu_lock);
> -       ret = pkvm_pgtable_stage2_map(pgt, s2fd->fault_ipa, PAGE_SIZE,
> -                                     page_to_phys(page), KVM_PGTABLE_PROT_RWX,
> +       ret = pkvm_pgtable_stage2_map(pgt, gfn_to_gpa(s2vi.gfn), PAGE_SIZE,
> +                                     page_to_phys(s2vi.page), KVM_PGTABLE_PROT_RWX,
>                                       hyp_memcache, 0);
>         write_unlock(&kvm->mmu_lock);
>         if (ret) {
> @@ -2227,7 +2233,7 @@ static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>
>         return 0;
>  unpin:
> -       unpin_user_pages(&page, 1);
> +       unpin_user_page(s2vi.page);
>  dec_account:
>         account_locked_vm(mm, 1, false);
>         return ret;
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 8e4c6e4bec12..c298a5b9b12a 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -414,6 +414,9 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
>         u64 end = addr + size;
>         int ret;
>
> +       if (WARN_ON_ONCE(!PAGE_ALIGNED(addr | size)))
> +               return -EINVAL;
> +
>         lockdep_assert_held_write(&kvm->mmu_lock);
>         mapping = pkvm_mapping_iter_first(&pgt->pkvm_mappings, addr, end - 1);
>
> --
> 2.55.0.1082.g2b9226bbc0-goog
>
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>

