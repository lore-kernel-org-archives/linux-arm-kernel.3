Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15D6C55175
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=//RZJaGyoeI1RxifgtDLFRHQpm92KEJu8DMKbfF6oOo=; b=3KcHCMvM8uRVxnjrWfe1kjd4Lf
	7MiIL5NzUF82SUah9jNZqQTuMAKrk2Ej99yOL99iacm04Z81wLpDGV8+1uto9k8LorjSIXELk+Pkb
	JEczupI1E5ZMxzpkiaQOAjHSgh6s2beyBpAExhAnADc5gtLnxIAq0hS7xMvohyAz0R0FoJNc6vzEq
	8t6XK65vV6w+VMwh9XMQvElK0pqGyqP6zy4foNTYgLS403bFAyHeRPh3gi1tTAQugUwETujSxAdPf
	4FdoGyeES8SonTuZuYHMLx6x3XKHsHMErhxXPt4IRJvzk2oDlKwFy9EJXlcChqbACZKZcEi/4u0Yq
	7+tEMaiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpdI-0000000GmmX-1dmg;
	Mon, 03 Aug 2026 10:10:56 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpdG-0000000Gmlf-1YAb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 10:10:55 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-495569acf8dso12865995e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 03:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785751851; x=1786356651; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=//RZJaGyoeI1RxifgtDLFRHQpm92KEJu8DMKbfF6oOo=;
        b=lUu7mdyOqIC19sGeRsUUHkAvjauCDkyM/kbaJsprpVUJKOZseQJHqRFvmYi/c2vycB
         T0W2eS8KmZY1WXkysjJ7lLcL7zExmuZk2eHARK966k866Da0N9AFcLAGNsvo7nn0PLAV
         /W8wUaBHpiX52olCdkdZmeuvT6JE87qQtkuDPNMBvd1o2HSabbMDz3qAuFGHYCOjo0+V
         domNn+PQpQUq4djTCuMCMZOdGvsGzzukm7PPPApHW8L+VjMbCkjEtLe1pYfm+itAYO1W
         Qbb/W0ULHPsMyIAJw9Anf+thJkRMpcSxE7ZZwErzMqr8h8Vpz4Ee37EUXbgrmffPsIaP
         lZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785751851; x=1786356651;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=//RZJaGyoeI1RxifgtDLFRHQpm92KEJu8DMKbfF6oOo=;
        b=NX+KoJznq+mKbwVCBHlIl/75VWkkvulKE6HFubsUNdRevRUEWKY2GCe56ZCdH/GOlZ
         KSf9uaIwjstgmsw2tkuxbMDL2TIHMD0XXdhVRCyhLvHC3VEcYVuX290DqIq75xCZ4QN3
         ifoZlInAXLvnJwWeXY9WSxrbKyj2/q2E+jvKucVWOiZRdssvUZIjChBkxNzypqS1ckKv
         k1529KKUJB0QIDMtWJEW3oJpw1KBIsQ5zLYb6tlxoLgEHXkC5wT6xl2Lo1qEQtn2w09T
         gxYPuzOc4pJ88K0T/vDyxmcKqBErvY3Hr1/8onX4mXkh86EqdmEAJIdiCEAUvRvZSSBq
         pPQg==
X-Forwarded-Encrypted: i=1; AHgh+RpPMkzXGrb5ZsgfGrKxEfhEuPyZghB9zEaMfLM9ta3QlYAMuSOixLR1OlA00CfvMKbn8jLm5F2PMG8UKRwrLEXt@lists.infradead.org
X-Gm-Message-State: AOJu0YxSzTknRwyT5ZXoqNgb2waFRhIJY94a/+gIpAXlu1kmJTtOUo4z
	Ja7zLeyGDUJTSpD8JTjRYjvU4M3hUXDysFw6NouhZpT3yQilk2QU5HQxblRwYFEzsdwz2juwrKT
	b2wTnA99MKgu5a7q5Xsnsdg==
X-Received: from wmrk14.prod.google.com ([2002:a05:600c:b4e:b0:493:b4d4:96bf])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b54:b0:495:4859:8f9b with SMTP id 5b1f17b1804b1-4980c674f25mr238962235e9.9.1785751851273;
 Mon, 03 Aug 2026 03:10:51 -0700 (PDT)
Date: Mon,  3 Aug 2026 11:08:44 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260803100904.3563942-1-vdonnefort@google.com>
Subject: [PATCH 00/20] Huge mapping support for protected VMs
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	keirf@google.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_031054_427151_87021F05 
X-CRM114-Status: GOOD (  12.79  )
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

Currently, pKVM handles stage-2 mappings and ownership tracking strictly
at the PAGE_SIZE level. This series extends pKVM to support PMD_SIZE
block mappings, thereby enabling Transparent Huge Pages (THP) for
protected guests. hugetlbfs is currently unsupported as it does not
appear as swapbacked.

Summary of changes:

1. Enable host stage-2 block-level annotations:

The host stage-2 being annotated with the GFN of the guest on the
host->guest donation transitions, we allow block-level annotations to
ensure the host stage-2 mapping size matches the guest stage-2.

2. Expand ownership transition HVCs:

Enable the ownership test to work with PMD_SIZE so we can test
transitions supporting more than PAGE_SIZE.

3. Implements the `PKVM_HYP_REQ_SPLIT` hypervisor request:

Allows the hypervisor to ask the host to split a mapping. This ensures
the guest s2, pkvm_mapping tree and host s2 are always using the same
mapping size.

4. Wires up THP support for pKVM guests.

Keir Fraser (1):
  KVM: arm64: Prefault host stage-2 entries on block split

Vincent Donnefort (19):
  KVM: arm64: Propagate host stage-2 annotated entries on block split
  KVM: arm64: Allow block-level stage-2 annotation
  KVM: arm64: Use block-level annotations when setting up the host
    stage-2
  KVM: arm64: Make pKVM ownership selftest an HVC
  KVM: arm64: Add a range to __pkvm_host_share/unshare_hyp()
  KVM: arm64: Add a range to __pkvm_host_donate_guest()
  KVM: arm64: Add a range to __pkvm_host_reclaim_page_guest()
  KVM: arm64: Add a range to __pkvm_guest_share_host()
  KVM: arm64: Add a range to __pkvm_guest_unshare_host()
  KVM: arm64: Add a range to pKVM ownership selftest
  KVM: arm64: Handle huge mappings in
    __pkvm_host_force_reclaim_page_guest()
  KVM: arm64: Handle huge mappings in __pkvm_vcpu_in_poison_fault()
  KVM: arm64: pkvm: Warn on guest stage-2 block collapse
  KVM: arm64: Add pkvm_hyp_req infrastructure
  KVM: arm64: Add __pkvm_host_split_guest HVC
  KVM: arm64: Extend pKVM page ownership selftests to cover guest block
    split
  KVM: arm64: Add PKVM_HYP_REQ_SPLIT
  KVM: arm64: Raise PKVM_HYP_REQ_SPLIT on guest to host sharing
  KVM: arm64: Stage-2 huge mappings for protected VMs

 arch/arm64/include/asm/kvm_asm.h              |  12 +-
 arch/arm64/include/asm/kvm_host.h             |  19 +
 arch/arm64/include/asm/kvm_pgtable.h          |   3 +-
 arch/arm64/include/asm/kvm_pkvm.h             |  21 +-
 arch/arm64/kvm/arm.c                          |   2 +
 arch/arm64/kvm/handle_exit.c                  |   3 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  25 +-
 arch/arm64/kvm/hyp/include/nvhe/memory.h      |   5 +
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |   6 +-
 arch/arm64/kvm/hyp/nvhe/ffa.c                 |  12 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  47 +-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 545 ++++++++++++------
 arch/arm64/kvm/hyp/nvhe/pkvm.c                |  59 +-
 arch/arm64/kvm/hyp/nvhe/setup.c               | 152 +++--
 arch/arm64/kvm/hyp/pgtable.c                  | 113 +++-
 arch/arm64/kvm/mmu.c                          |  72 ++-
 arch/arm64/kvm/pkvm.c                         | 247 +++++++-
 arch/arm64/kvm/trace_pkvm.h                   |  44 ++
 18 files changed, 1036 insertions(+), 351 deletions(-)
 create mode 100644 arch/arm64/kvm/trace_pkvm.h


base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
-- 
2.55.0.508.g3f0d502094-goog


