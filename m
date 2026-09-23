Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215D0C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 19:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1lfa4MuL9WCyQEI7VPH2zTkm8IOxJ9nbGVQJCVpitY=; b=KsGdgwIm9WktXMpThv5fJRXnyR
	PUF2ytGBytZfll62+8FmYS4wj4E1awZUZPdtUiEtaAShV41Ojif5xgPUIvx8rZWhkpXr25c40FeNt
	bj+Fkqckr4GW8Zql3GTNpBEDCN/b76AhxrN7RsJ/yCbw9V5eO58d6iUXu/xW8SdSzSsSiWomUdd3w
	DlaQ7Obnmavq+S5r9GqoPm59HH04iZTiKGD7UYlCFtZhuAVEgkDTtvGdkWP4gt1JMXxIr1JyK1LnE
	aP6pmQONSG9T3pMDG9zMDzoe5fikHZH+qVC9qZ0KKINxinHbcsyxb+h9f4smrfWphnYu9+iHJFJ2g
	aEqYayhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9SjI-00000009L7G-1VrB;
	Wed, 23 Sep 2026 19:34:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9SjF-00000009L6e-3X1T
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 19:34:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=P1lfa4MuL9WCyQEI7VPH2zTkm8IOxJ9nbGVQJCVpitY=; b=PiBgKl3NmFZOwqjB5O8DPYh2mA
	Lt7Oe3/e0TZTkFrhTGlwxjC75UIfTXWkFq5FGbB0mSEYU2uOGstnxDItpmEJnEv6rRhaQtzjEtpz+
	LvzW770Wczfb8RRFInUvBfWne2HcUpBpTxqq8ZNIRICHqfPQarrDz8wKXfkUUejg53nVe3wNjkgfO
	jHde0apnZVb6yYsT2vUiKVI47BKRg6SzGg6uaEc9ihjJicf7IREphiV3Vfhict4Gzy6lUcP/S1X/7
	dhtykixfpnkIIgw+wYKEYkG0hkx+Q1ajT8E/Q1pcD0Quq/Kc/F5oG5EgV8BPmBOUrlackO0gbDRaZ
	AsbRj31g==;
Received: from out-138.mta0.migadu.com ([2001:41d0:1004:224b::8a] helo=mta0.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9SjC-0000000FD7i-2yQd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 19:34:04 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=+aq11w9shYPq4zRWGEb/sLRXl3paxePhW5w8CIQV7Bk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790192040; v=1; x=1790796840;
 b=lyTxVigyZLct23biFLGrJw1WDZIArupk9fHuWvsbo1coc8FhCRte5TBI8zpunbkMa+C1VCsa
 8BiZyj2o2sHfXnKJKxmdRW67FomLWAB1Dt2moPapBiPj2L7iZDxT+I5xdeahTP4/Upo1vvypBDz
 FEty8UNCo7JUgUA1isU1u9qc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 941420f8cbba9b41;
	Wed, 23 Sep 2026 19:34:00 +0000
X-Mizu-Trace-ID: 941420f8cbba9b41
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b8c42da963so2254e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 12:33:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBye+8dTFUMulVri0fvwCw7sLS1liW1uvhf28McUjfQ23E48wV1Jo0DgVQGC95woRbqhX9ALrtEAoJlrrs3j/oXZ@lists.infradead.org
X-Gm-Message-State: AFuF++mnQxIsdw4aP/QU2VctAnWj7+uxNXTjLi2yBlLDA5NBLP1Ywd1Z
	3kEflwwEP5yqvqSGh6Vm8c4wr+UhhD4hqzjv5zCEovJTQPVsvEWpeLk3oY64Equsfs60FYjR6pP
	bJ5XJ2BcMYH3EgWoKzhu/WyaQZ9AmVq7FatK23Dg+
X-Received: by 2002:a05:6512:a91:b0:5b8:d04b:a1be with SMTP id
 2adb3069b0e04-5b8dd9f0c4dmr53371e87.2.1790192038462; Wed, 23 Sep 2026
 12:33:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260922130821.1666713-1-vdonnefort@google.com> <20260922130821.1666713-3-vdonnefort@google.com>
In-Reply-To: <20260922130821.1666713-3-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 23 Sep 2026 20:33:22 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyAwtJX-HxUwHMuFZ8nz8kiA2WC5rx5emAoNenw9NtMuQ@mail.gmail.com>
X-Gm-Features: AclHuK_0VJOxyCQDV004MitEiWHW22At2KrjZ62zt5jnhslznvDqQJ_apl4Vfkw
Message-ID: <CA+EHjTyAwtJX-HxUwHMuFZ8nz8kiA2WC5rx5emAoNenw9NtMuQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] KVM: arm64: Pass kvm_s2_fault_desc to fault_supports_stage2_huge_mapping()
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_203402_919671_3C74AB2D 
X-CRM114-Status: GOOD (  21.41  )
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
> Pass the fault descriptor to fault_supports_stage2_huge_mapping() instead
> of passing memslot and hva separately so it can access other s2fd
> members such as vcpu.
>
> No functional change intended.
>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba < fuad.tabba@linux.dev>

Cheers,
/fuad


> ---
>  arch/arm64/kvm/mmu.c | 39 +++++++++++++++++++--------------------
>  1 file changed, 19 insertions(+), 20 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 9ba86450fe4a..9dfaf4f277b5 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1353,12 +1353,21 @@ static void kvm_send_hwpoison_signal(unsigned long address, short lsb)
>         send_sig_mceerr(BUS_MCEERR_AR, (void __user *)address, lsb, current);
>  }
>
> -static bool fault_supports_stage2_huge_mapping(struct kvm_memory_slot *memslot,
> -                                              unsigned long hva,
> +struct kvm_s2_fault_desc {
> +       struct kvm_vcpu         *vcpu;
> +       phys_addr_t             fault_ipa;
> +       struct kvm_s2_trans     *nested;
> +       struct kvm_memory_slot  *memslot;
> +       unsigned long           hva;
> +};
> +
> +static bool fault_supports_stage2_huge_mapping(const struct kvm_s2_fault_desc *s2fd,
>                                                unsigned long map_size)
>  {
> -       gpa_t gpa_start;
> +       struct kvm_memory_slot *memslot = s2fd->memslot;
> +       unsigned long hva = s2fd->hva;
>         hva_t uaddr_start, uaddr_end;
> +       gpa_t gpa_start;
>         size_t size;
>
>         /* The memslot and the VMA are guaranteed to be aligned to PAGE_SIZE */
> @@ -1427,9 +1436,9 @@ static bool fault_supports_stage2_huge_mapping(struct kvm_memory_slot *memslot,
>   * Returns the size of the mapping.
>   */
>  static long
> -transparent_hugepage_adjust(struct kvm *kvm, struct kvm_memory_slot *memslot,
> -                           unsigned long hva, kvm_pfn_t *pfnp, gfn_t *gfnp)
> +transparent_hugepage_adjust(const struct kvm_s2_fault_desc *s2fd, kvm_pfn_t *pfnp, gfn_t *gfnp)
>  {
> +       struct kvm *kvm = s2fd->vcpu->kvm;
>         kvm_pfn_t pfn = *pfnp;
>         gfn_t gfn = *gfnp;
>
> @@ -1438,8 +1447,8 @@ transparent_hugepage_adjust(struct kvm *kvm, struct kvm_memory_slot *memslot,
>          * sure that the HVA and IPA are sufficiently aligned and that the
>          * block map is contained within the memslot.
>          */
> -       if (fault_supports_stage2_huge_mapping(memslot, hva, PMD_SIZE)) {
> -               int sz = get_user_mapping_size(kvm, hva);
> +       if (fault_supports_stage2_huge_mapping(s2fd, PMD_SIZE)) {
> +               int sz = get_user_mapping_size(kvm, s2fd->hva);
>
>                 if (sz < 0)
>                         return sz;
> @@ -1597,14 +1606,6 @@ static enum kvm_pgtable_prot adjust_nested_exec_perms(struct kvm *kvm,
>         return prot;
>  }
>
> -struct kvm_s2_fault_desc {
> -       struct kvm_vcpu         *vcpu;
> -       phys_addr_t             fault_ipa;
> -       struct kvm_s2_trans     *nested;
> -       struct kvm_memory_slot  *memslot;
> -       unsigned long           hva;
> -};
> -
>  static int gmem_abort(const struct kvm_s2_fault_desc *s2fd)
>  {
>         bool write_fault, exec_fault;
> @@ -1791,7 +1792,7 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
>         switch (vma_shift) {
>  #ifndef __PAGETABLE_PMD_FOLDED
>         case PUD_SHIFT:
> -               if (fault_supports_stage2_huge_mapping(s2fd->memslot, s2fd->hva, PUD_SIZE))
> +               if (fault_supports_stage2_huge_mapping(s2fd, PUD_SIZE))
>                         break;
>                 fallthrough;
>  #endif
> @@ -1799,7 +1800,7 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
>                 vma_shift = PMD_SHIFT;
>                 fallthrough;
>         case PMD_SHIFT:
> -               if (fault_supports_stage2_huge_mapping(s2fd->memslot, s2fd->hva, PMD_SIZE))
> +               if (fault_supports_stage2_huge_mapping(s2fd, PMD_SIZE))
>                         break;
>                 fallthrough;
>         case CONT_PTE_SHIFT:
> @@ -2049,9 +2050,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>                 if (perm_fault_granule > PAGE_SIZE) {
>                         mapping_size = perm_fault_granule;
>                 } else {
> -                       mapping_size = transparent_hugepage_adjust(kvm, s2fd->memslot,
> -                                                                  s2fd->hva, &pfn,
> -                                                                  &gfn);
> +                       mapping_size = transparent_hugepage_adjust(s2fd, &pfn, &gfn);
>                         if (mapping_size < 0) {
>                                 ret = mapping_size;
>                                 goto out_unlock;
> --
> 2.55.0.1082.g2b9226bbc0-goog
>
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>

