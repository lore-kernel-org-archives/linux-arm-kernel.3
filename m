Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13904C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lfu5acuSb6hmti2ORqa5C7Tlw/+6sL3sZeUeIa2oR8o=; b=NAeCD8nr9IQYL4Tfiper52yAjz
	kTuN/rPbareEau445bdvA3tUjbPyXINlnTJPZfDp0+TGU6XtOuKAgCuahieB5f3fwTQlJJfj6B3pf
	KMNKqSY4lOMDnZDrOM4ly7Q4vuF77IzGp3EgLKj9gR0K+YAPS3Me+cI+0DMKdlAFlBW2XLeP/ehlI
	i5Sso6ZQmAcdwAjqiuG6gjFbg+ZQ93hKRVrsSAadqhkjGD+lyEjPIYy3IT9temPr+JxYFtK2OMi4y
	7wet/572WTv4cJYnyF7xYgCWgVcLhxoezuT69myGBNjEWnfxJG9qAIMYhwXb5oTNjmhVIwjju8gPO
	MWz/LsDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PSE-00000001Oqj-27Ag;
	Fri, 04 Sep 2026 08:39:22 +0000
Received: from out-210.mta1.migadu.com ([95.215.58.210] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PSB-00000001Opq-2HX9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:39:21 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ez4hNx4DVEe8KBHqNb84IrBjM+F93g8WM7rAblDyLXo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788511157; v=1; x=1789115957;
 b=Nr515e14o6jo5iYmFOgF9Ul0KQGsN4/MwD7YQM1jBLzTR2DSJi0ZNDm5ljCFnnKSwVBqI6si
 +Be1fYxEijBB4EL+C7CLLSyQzOdDY6InG0+NdFBV2+rKqu9ALRwhpDSxoeiy5kF/ZfdHZS4bQCo
 vMVaSxh/Kxh/Jn8jdR7sDLNQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 9611daeab3faa4bb;
	Fri, 04 Sep 2026 08:39:17 +0000
X-Mizu-Trace-ID: 9611daeab3faa4bb
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384c4so3596e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 01:39:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwp6qEptkTehfhYcUXhgZjWrA2DfH6ZU27QBj4XVilCxKdxAlPns5AMIOfAYGf4KAja2h8j55kz1CH3hQQv4Vj8@lists.infradead.org
X-Gm-Message-State: AFuF++n4lgvfytyXNT8vZxXW2OKokk6EPXYLavww2Ql3poh9JUBHihJa
	J5ae0roIcFkNdgYXtEt2EckYkAu2FbAjC1dkf59k5YyDg7TLw9y1faRfOYgSLBasyXetYulyFAZ
	0Oa3nVTQqh792kZnPJ7kbPinAWnpXw+Pxm3+c3ngr
X-Received: by 2002:a05:6512:2352:b0:5b4:9dba:7401 with SMTP id
 2adb3069b0e04-5b6182512c1mr68725e87.11.1788511156074; Fri, 04 Sep 2026
 01:39:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260826-arm64-52bit-va-v1-0-14ec98211363@fujitsu.com> <20260826-arm64-52bit-va-v1-1-14ec98211363@fujitsu.com>
In-Reply-To: <20260826-arm64-52bit-va-v1-1-14ec98211363@fujitsu.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 4 Sep 2026 09:38:39 +0100
X-Gmail-Original-Message-ID: <CA+EHjTy6EH-d=O+dtRdWdTUkS0zkXeW=auxiK6N5Dc-yihrYRw@mail.gmail.com>
X-Gm-Features: AcwNN1Ue3UiJZXsq0JIrKBZUTapvpCHZ2jnrY0FG9kKB_BUUN5ArhPu7u2gQg_E
Message-ID: <CA+EHjTy6EH-d=O+dtRdWdTUkS0zkXeW=auxiK6N5Dc-yihrYRw@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: selftest: arm64: Support 5-level paging in stage
 1 translation table
To: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Takayuki Okamoto <tokamoto@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_013919_728224_12E7CC98 
X-CRM114-Status: GOOD (  22.27  )
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

Hi Itaru,

The usual subject prefix in the tree is "KVM: arm64: selftests:", for
this patch and the next one.

On Tue, 25 Aug 2026 at 22:18, Itaru Kitayama <itaru.kitayama@fujitsu.com> wrote:
>
> Add p4d_index() for when 5-level paging required, i.e., V52 guest mode
> IDs. With the index helper function, _virt_pg_map() handles 5-level

Only VM_MODE_P52V52_4K has five levels. The 16K and 64K V52 modes get
four and three, so this is for the 4K granule rather than for V52
modes as a class.

...

>  u64 *virt_get_pte_hva_at_level(struct kvm_vm *vm, gva_t gva, int level)
>  {
> +       int start_level = 4 - vm->mmu.pgtable_levels;
>         u64 *ptep;
>
> +       TEST_ASSERT(level >= start_level && level <= 3,
> +                   "Invalid translation level %d, valid range is %d-3",
> +                   level, start_level);
> +
>         if (!vm->mmu.pgd_created)
>                 goto unmapped_gva;
>
>         ptep = addr_gpa2hva(vm, vm->mmu.pgd) + pgd_index(vm, gva) * 8;
>         if (!ptep)
>                 goto unmapped_gva;
> -       if (level == 0)
> +       /*
> +        * Stage-1 translation starts at level -1 for a five-level page
> +        * table, and at levels 0, 1, or 2 for four-, three-, or two-level
> +        * page tables, respectively.
> +        */
> +       if (level == start_level)


This changes what level means for the existing three-level modes:
level 0 used to return the top-level entry and now trips the assert,
level 1 used to return the leaf and now returns the top level. No
caller in tree asks for either of those two levels, and the new
numbering matches the architecture.

...

> @@ -321,12 +356,14 @@ void aarch64_vcpu_setup(struct kvm_vcpu *vcpu, struct kvm_vcpu_init *init)
>         case VM_MODE_PXXVYY_4K:
>                 TEST_FAIL("AArch64 does not support 4K sized pages "
>                           "with ANY-bit physical address ranges");
> +       case VM_MODE_P52V52_64K:

These VM_MODE_ enumerators arrive in patch 2, so this patch does not
build on its own:

  lib/arm64/processor.c:359:7: error: use of undeclared identifier
'VM_MODE_P52V52_64K'; did you mean 'VM_MODE_P52V48_64K'?
  lib/arm64/processor.c:360:7: error: duplicate case value 'VM_MODE_P52V48_64K'

There are other build errors from the same cause. Could you move the
enum values and their vm_guest_mode_string()/vm_guest_mode_params[]
entries into this patch, or a new one altogether?

>         case VM_MODE_P52V48_64K:
>         case VM_MODE_P48V48_64K:
>         case VM_MODE_P40V48_64K:
>         case VM_MODE_P36V48_64K:
>                 tcr_el1 |= TCR_TG0_64K;
>                 break;
> +       case VM_MODE_P52V52_16K:
>         case VM_MODE_P52V48_16K:
>         case VM_MODE_P48V48_16K:
>         case VM_MODE_P40V48_16K:
> @@ -334,6 +371,7 @@ void aarch64_vcpu_setup(struct kvm_vcpu *vcpu, struct kvm_vcpu_init *init)
>         case VM_MODE_P36V47_16K:
>                 tcr_el1 |= TCR_TG0_16K;
>                 break;
> +       case VM_MODE_P52V52_4K:
>         case VM_MODE_P52V48_4K:
>         case VM_MODE_P48V48_4K:
>         case VM_MODE_P40V48_4K:
> @@ -348,6 +386,9 @@ void aarch64_vcpu_setup(struct kvm_vcpu *vcpu, struct kvm_vcpu_init *init)
>
>         /* Configure output size */
>         switch (vm->mode) {
> +       case VM_MODE_P52V52_4K:
> +       case VM_MODE_P52V52_16K:
> +       case VM_MODE_P52V52_64K:
>         case VM_MODE_P52V48_4K:
>         case VM_MODE_P52V48_16K:
>         case VM_MODE_P52V48_64K:
> @@ -578,6 +619,42 @@ static u32 max_ipa_for_page_size(u32 vm_ipa, u32 gran,
>                 return min(vm_ipa, 48U);
>  }
>
> +u32 aarch64_get_supported_va_size(void)

This repeats aarch64_get_supported_page_sizes() below it and builds a
second probe VM one line after the first. Could it take a u32 *va
out-param, so both ID registers come off the one vCPU?

VARange is the 52-bit VA indicator for the 64K granule only, so a bare
52 or 48 reads as granule-independent. The caller in patch 2 only uses
it for 64K, so nothing is wrong today.

Cheers,
/fuad


> +{
> +       struct kvm_vcpu_init preferred_init = {};
> +       int kvm_fd, vm_fd, vcpu_fd, err;
> +       u64 val;
> +       u32 va_range;
> +       struct kvm_one_reg reg = {
> +               .id     = KVM_ARM64_SYS_REG(SYS_ID_AA64MMFR2_EL1),
> +               .addr   = (u64)&val,
> +       };
> +
> +       kvm_fd = open_kvm_dev_path_or_exit();
> +       vm_fd = __kvm_ioctl(kvm_fd, KVM_CREATE_VM, NULL);
> +       TEST_ASSERT(vm_fd >= 0, KVM_IOCTL_ERROR(KVM_CREATE_VM, vm_fd));
> +
> +       vcpu_fd = ioctl(vm_fd, KVM_CREATE_VCPU, 0);
> +       TEST_ASSERT(vcpu_fd >= 0, KVM_IOCTL_ERROR(KVM_CREATE_VCPU, vcpu_fd));
> +
> +       err = ioctl(vm_fd, KVM_ARM_PREFERRED_TARGET, &preferred_init);
> +       TEST_ASSERT(err == 0, KVM_IOCTL_ERROR(KVM_ARM_PREFERRED_TARGET, err));
> +
> +       err = ioctl(vcpu_fd, KVM_ARM_VCPU_INIT, &preferred_init);
> +       TEST_ASSERT(err == 0, KVM_IOCTL_ERROR(KVM_ARM_VCPU_INIT, err));
> +
> +       err = ioctl(vcpu_fd, KVM_GET_ONE_REG, &reg);
> +       TEST_ASSERT(err == 0, KVM_IOCTL_ERROR(KVM_GET_ONE_REG, err));
> +
> +       va_range = FIELD_GET(ID_AA64MMFR2_EL1_VARange, val);
> +
> +       close(vcpu_fd);
> +       close(vm_fd);
> +       close(kvm_fd);
> +
> +       return va_range >= ID_AA64MMFR2_EL1_VARange_52 ? 52 : 48;
> +}
> +
>  void aarch64_get_supported_page_sizes(u32 ipa, u32 *ipa4k,
>                                       u32 *ipa16k, u32 *ipa64k)
>  {
>
> --
> 2.43.0
>

