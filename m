Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35F0E69E9F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 10:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bhVcEYzfRw8eAXsIDOKtTfeOpA28Wa0JxjqlOgFYMJ0=; b=w40d51Nzzo0Z+ydzEG8Zfw/Joe
	qtuicQL2TNcwlTugvsKIMkTzWVyCDAjThiCywwDcqJS72gkR/6KJFHDNCkvO73OUm7sNSZblVEDwX
	1TzZYvcr0n+EN6Q0c/hWhhFRBo7Jp8N7prYddqP+C+0DtmtOc4M7NTcZdY7Ztv413JvcFHpRWwDA0
	yjvlqe4GCsMl+zWJ2eBvGIb+jFjnHUPNL0CoFCFE5qgKURkY2xnlJtfZDummP0tM2FOqybkxOGsbb
	oijBEYLC6GUOSrt41rSpiDqtrlBsc20Mtlswcg/ic0gBOFTVuABpMpGZkeU5Y1iryCmH+unMLZDlS
	nC91MI4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQIm-000000095uE-0Vzb;
	Tue, 03 Dec 2024 10:38:44 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQHj-000000095Vi-3uAy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 10:37:41 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-5d0ccbbc4a7so1953083a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 02:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733222257; x=1733827057; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bhVcEYzfRw8eAXsIDOKtTfeOpA28Wa0JxjqlOgFYMJ0=;
        b=fk6UgRHTBwsxckkWcuwLLt4t5CnTEHRKsfGPyAWk9MS4melf4qywP88buCcm+P2CTw
         htuuP+F5aaMFC449suw+Yo3nRdtJCqrH39wFIPenIGLprAD2Ues7Gl6y0ECj3a8Z0WYf
         RnkuiENXWPiug5Z5lSv1BnJ4x5NHghcYQRrxe6+ypf/F321EfXGgNUAnEHLCHhSC1WzJ
         dsOPVlMX1qTIP21y1QhlsEpKnobCas0iFzzCkvH52d8wUzx7z3SeTv4xaqLajpiXK6G+
         qWkxeG+OKCSSKtoeWVFXOsZYpAbvsW2azMzrIAvn9EI5oRzax7T6QWMlTZcRm9yF1cBI
         aLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733222257; x=1733827057;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bhVcEYzfRw8eAXsIDOKtTfeOpA28Wa0JxjqlOgFYMJ0=;
        b=A9OGDhlS24QfJ7sQ4Ks5/SIS4/4RpUPGtxnQZXFg/bU0vsg692geF5B7uZS0nvHHjp
         nv8JLBL68E5CaK3cxDqaEnneJ3BPlvQGvok0Qud2SRpX9/voGAlaBOPawamYpnzntKgU
         qUL7TjuI9y2d3+b76uSuZI+o2IjdV1diTMS/CWq8LZbQk0+4QDYxGVtpCDdbGZOpgme1
         jSMZPllykI2zw9XDwoV40qsjMqfsAYo6HhoTJ8U8gQ2V+wsYaspOfrR5EQ+2arvMRvw3
         J06BUtf/hj+JIOXcqJIE53rtNJc/vJSrT2jY9yL8sSMnUmP2jPhZqpKBwMGOtUFXc0V/
         T8sw==
X-Forwarded-Encrypted: i=1; AJvYcCWMBGVXfjjYo1Q40zDYSOuWguDI8UeGtTg75iJSZfylFiTIiD01f0rjlIIcYrdZ7U/UzycbL61v3geTfdZ59r64@lists.infradead.org
X-Gm-Message-State: AOJu0YyvtARYQXn3TZeK/aTUbv4aSXkDOOfr59ALUJzuI2HPcsCkp2qu
	lJEQ37dK2L8qWldZODvjoBk5GM/PwXM25zxDPESkkF7PcQTn9xpY1IVsJj6WGDcpCdCiAtzIwfC
	HB+BL1g==
X-Google-Smtp-Source: AGHT+IHYV6enzbdprLHZMQD92QaUuZlgGwTGzCSSf0HmxvgO/jp3WQcTuWxTF7EcB+yhrb6mkrn1yXRToanq
X-Received: from edvi16.prod.google.com ([2002:aa7:dd10:0:b0:5d0:27b6:2cde])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:510e:b0:5d0:8606:9ba1
 with SMTP id 4fb4d7f45d1cf-5d10cb82718mr1488954a12.24.1733222257469; Tue, 03
 Dec 2024 02:37:37 -0800 (PST)
Date: Tue,  3 Dec 2024 10:37:17 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241203103735.2267589-1-qperret@google.com>
Subject: [PATCH v2 00/18] KVM: arm64: Non-protected guest stage-2 support for pKVM
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_023739_967645_8725258C 
X-CRM114-Status: GOOD (  16.38  )
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

Hi all,

This is the v2 of the series adding support for non-protected guests to
pKVM. Please refer to v1 for all the context:

  https://lore.kernel.org/kvmarm/20241104133204.85208-1-qperret@google.com/

The series is organized as follows:

 - Patches 01 to 04 move the host ownership state tracking from the
   host's stage-2 page-table to the hypervisor's vmemmap. This avoids
   fragmenting the host stage-2 for shared pages, which is only needed
   to store an annotation in the SW bits of the corresponding PTE. All
   pages mapped into non-protected guests are shared from pKVM's PoV,
   so the cost of stage-2 fragmentation will increase massively as we
   start tracking that at EL2. Note that these patches also help with
   the existing sharing for e.g. FF-A, so they could possibly be merged
   separately from the rest of the series.

 - Patches 05 to 07 implement a minor refactoring of the pgtable code to
   ease the integration of the pKVM MMU later on.

 - Patches 08 to 16 introduce all the infrastructure needed on the pKVM
   side for handling guest stage-2 page-tables at EL2.

 - Patches 17 and 18 plumb the newly introduced pKVM support into
   KVM/arm64.

Patches based on 6.13-rc1, tested on Pixel 6 and Qemu.

Changes in v2:
 - Rebased on 6.13-rc1 (small conflicts with 2362506f7cff ("KVM: arm64:
   Don't mark "struct page" accessed when making SPTE young") in
   particular)
 - Fixed kerneldoc breakage for __unmap_stage2_range()
 - Fixed pkvm_pgtable_test_clear_young() to use correct HVC
 - Folded guest_get_valid_pte() into __check_host_unshare_guest() for
   clarity

Thanks,
Quentin

Marc Zyngier (1):
  KVM: arm64: Introduce __pkvm_vcpu_{load,put}()

Quentin Perret (17):
  KVM: arm64: Change the layout of enum pkvm_page_state
  KVM: arm64: Move enum pkvm_page_state to memory.h
  KVM: arm64: Make hyp_page::order a u8
  KVM: arm64: Move host page ownership tracking to the hyp vmemmap
  KVM: arm64: Pass walk flags to kvm_pgtable_stage2_mkyoung
  KVM: arm64: Pass walk flags to kvm_pgtable_stage2_relax_perms
  KVM: arm64: Make kvm_pgtable_stage2_init() a static inline function
  KVM: arm64: Add {get,put}_pkvm_hyp_vm() helpers
  KVM: arm64: Introduce __pkvm_host_share_guest()
  KVM: arm64: Introduce __pkvm_host_unshare_guest()
  KVM: arm64: Introduce __pkvm_host_relax_guest_perms()
  KVM: arm64: Introduce __pkvm_host_wrprotect_guest()
  KVM: arm64: Introduce __pkvm_host_test_clear_young_guest()
  KVM: arm64: Introduce __pkvm_host_mkyoung_guest()
  KVM: arm64: Introduce __pkvm_tlb_flush_vmid()
  KVM: arm64: Introduce the EL1 pKVM MMU
  KVM: arm64: Plumb the pKVM MMU in KVM

 arch/arm64/include/asm/kvm_asm.h              |   9 +
 arch/arm64/include/asm/kvm_host.h             |   4 +
 arch/arm64/include/asm/kvm_pgtable.h          |  42 ++-
 arch/arm64/include/asm/kvm_pkvm.h             |  28 ++
 arch/arm64/kvm/arm.c                          |  23 +-
 arch/arm64/kvm/hyp/include/nvhe/gfp.h         |   6 +-
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  38 +--
 arch/arm64/kvm/hyp/include/nvhe/memory.h      |  43 ++-
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |  15 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 210 +++++++++++-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 312 ++++++++++++++++--
 arch/arm64/kvm/hyp/nvhe/page_alloc.c          |  14 +-
 arch/arm64/kvm/hyp/nvhe/pkvm.c                |  56 ++++
 arch/arm64/kvm/hyp/nvhe/setup.c               |   7 +-
 arch/arm64/kvm/hyp/pgtable.c                  |  13 +-
 arch/arm64/kvm/mmu.c                          | 109 ++++--
 arch/arm64/kvm/pkvm.c                         | 195 +++++++++++
 arch/arm64/kvm/vgic/vgic-v3.c                 |   6 +-
 18 files changed, 987 insertions(+), 143 deletions(-)

-- 
2.47.0.338.g60cca15819-goog


