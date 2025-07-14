Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7ED3C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 23:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I/fxMTUCeZF4CZ7kst6++ES1PJGZgoz5VeCqTS2km0k=; b=qPE/P7SNvlIpPem3Wo2LpLLohd
	blT7mC3/xfOpqJeq4Zrr1kD+KJd+AFKdUVyZjRefiBWkLD6al5yf41wHEqQcTJEqgnhedbVb185m5
	RQnAW1QxNaElj08vbJcigU+1yMKiNis1o6A71QQz2jF/v1nrFp/npIiYF5UXMn8cSVxLYBDcfwixu
	MSS+ot1n3Q+EMHYAZ+IkA1IUMpZJTuqxiWGXBj+xWEP1mn709J9PwKaX329+jV1l7aVYjRxUTdVLX
	on/LaND/G5foPCBzpV9iKH+qaYXx4DhI+lD2jyRx5kclbdeEge5Sz7HVgLeMX1jtuYXbVsCSlnjvN
	uNRL+pSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubSCN-00000003TZh-111v;
	Mon, 14 Jul 2025 23:03:03 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubS8x-00000003SPD-3EOB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 22:59:33 +0000
Received: by mail-oi1-x24a.google.com with SMTP id 5614622812f47-40cfdde66b8so1505213b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 15:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752533970; x=1753138770; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I/fxMTUCeZF4CZ7kst6++ES1PJGZgoz5VeCqTS2km0k=;
        b=jocEkDHmkQPUolq8pToxl0Q7Xt1ic7Ix7nkxsNUmCcTCJk1fZk272P1OADvFpIlPw/
         5a9R8FwcbRqzqnv7yhfoF60mWUY/lCVwq0IP32/bk0mnrD8QstWqk6e4VxKAEk7+fKfK
         wP4ukOj4CVsW/h1BJ9jfe2t+zcH1C2r5uwewiHVjk9+9UgCXsihR35tl5TmrUSzn5Kq7
         0EX1w1oP46rHwi/bueos7QnQ2wOyy/sbPZ+wRxFai/7k1FYuYPpV0B69UiJvFol6ntTd
         cXDhucA00wm3jyzwBhImHj1+Ro0b1m+Rxmi2GBPeBF0TzF6gJt6s+hI4b//KZ+R29dYn
         4EVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752533970; x=1753138770;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I/fxMTUCeZF4CZ7kst6++ES1PJGZgoz5VeCqTS2km0k=;
        b=qfiNEy8OSSp/FuwdwHoFn5mPEmS9+iq06cT6TWc47MHf3hKmDqZ9o952EpQ/0x6jvZ
         sEquE/35GVyzeRouHT7MOVafhHx7aP/IiLFp4REYQZ4KERfiUHGeUR+iCjYfs31cfLoc
         VWkPGGvc2BK6OVFVwZS5vcUtOodpUmXu//uL0U0yUWveZkbzy7Ff7OJWml8FJYT2WC34
         SweezReqTkFk5W0ApXcRooLjizIx6qRS+zuGqzi7OBqi7gaSKGwf7EgJS22ltyj5+d9n
         ah0yecIRLMAOw7ElQh4JoEo7TDFhqxjYU3Y+Dm6G9rSQI/PZiH97m+fbyysHGPU9qpbh
         hTbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVDQtSMTz96RTdnZjs6VuGA/wAM1wZhFeypF86PzK7DW9qR/0MA0pJ08ocI4PvbaKgjYd02g7vgHwYyR1xQ4Tm@lists.infradead.org
X-Gm-Message-State: AOJu0YxDEPt1UObsVkOMSd5znGpRnVFI7D4O4UVUkxKotQohtzEYMRvd
	jhX0ijRWU9Ls6KeYPxmcRqCvVcoEDOEOMfstcEj5tEVVSolfrU9/XVFfyh3qceB1+SnYJRTa5cB
	UO8Q3OiILfF7L5AGUOcjEQ7QUKw==
X-Google-Smtp-Source: AGHT+IGHw0Ly0MiuefKQ04+OUmZEq578qloRdUwfTY7soEVZIiwrXeZ5MJnigSkxKeUiTfmWeKo1UFrGGTsjsgNFBg==
X-Received: from oibkd10.prod.google.com ([2002:a05:6808:470a:b0:40b:1afb:91ee])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1812:b0:404:2960:9b4d with SMTP id 5614622812f47-41511618b0amr8813197b6e.25.1752533970287;
 Mon, 14 Jul 2025 15:59:30 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:58:54 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250714225917.1396543-1-coltonlewis@google.com>
Subject: [PATCH v4 00/23] ARM64 PMU Partitioning
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_155931_815333_ADB019BB 
X-CRM114-Status: GOOD (  14.54  )
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

This series creates a new PMU scheme on ARM, a partitioned PMU that
allows reserving a subset of counters for more direct guest access,
significantly reducing overhead. More details, including performance
benchmarks, can be read in the v1 cover letter linked below.

v4:

* Apply Mark Brown's non-UNDEF FGT control commit to the PMU FGT
  controls and calculate those controls with the others in
  kvm_calculate_traps()

* Introduce lazy context swaps for guests that only turns on for
  guests that have enabled partitioning and accessed PMU registers.

* Rename pmu-part.c to pmu-direct.c because future features might
  achieve direct PMU access without partitioning.

* Better explain certain commits, such as why the untrapped registers
  are safe to untrap.

* Reduce the PMU include cleanup down to only what is still necessary
  and explain why.

v3:
https://lore.kernel.org/kvm/20250626200459.1153955-1-coltonlewis@google.com/

v2:
https://lore.kernel.org/kvm/20250620221326.1261128-1-coltonlewis@google.com/

v1:
https://lore.kernel.org/kvm/20250602192702.2125115-1-coltonlewis@google.com/

Colton Lewis (21):
  arm64: cpufeature: Add cpucap for HPMN0
  KVM: arm64: Reorganize PMU functions
  perf: arm_pmuv3: Introduce method to partition the PMU
  perf: arm_pmuv3: Generalize counter bitmasks
  perf: arm_pmuv3: Keep out of guest counter partition
  KVM: arm64: Account for partitioning in kvm_pmu_get_max_counters()
  KVM: arm64: Set up FGT for Partitioned PMU
  KVM: arm64: Writethrough trapped PMEVTYPER register
  KVM: arm64: Use physical PMSELR for PMXEVTYPER if partitioned
  KVM: arm64: Writethrough trapped PMOVS register
  KVM: arm64: Write fast path PMU register handlers
  KVM: arm64: Setup MDCR_EL2 to handle a partitioned PMU
  KVM: arm64: Account for partitioning in PMCR_EL0 access
  KVM: arm64: Context swap Partitioned PMU guest registers
  KVM: arm64: Enforce PMU event filter at vcpu_load()
  KVM: arm64: Extract enum debug_owner to enum vcpu_register_owner
  KVM: arm64: Implement lazy PMU context swaps
  perf: arm_pmuv3: Handle IRQs for Partitioned PMU guest counters
  KVM: arm64: Inject recorded guest interrupts
  KVM: arm64: Add ioctl to partition the PMU when supported
  KVM: arm64: selftests: Add test case for partitioned PMU

Marc Zyngier (1):
  KVM: arm64: Reorganize PMU includes

Mark Brown (1):
  KVM: arm64: Introduce non-UNDEF FGT control

 Documentation/virt/kvm/api.rst                |  21 +
 arch/arm/include/asm/arm_pmuv3.h              |  38 +
 arch/arm64/include/asm/arm_pmuv3.h            |  61 +-
 arch/arm64/include/asm/kvm_host.h             |  34 +-
 arch/arm64/include/asm/kvm_pmu.h              | 123 +++
 arch/arm64/include/asm/kvm_types.h            |   7 +-
 arch/arm64/kernel/cpufeature.c                |   8 +
 arch/arm64/kvm/Makefile                       |   2 +-
 arch/arm64/kvm/arm.c                          |  22 +
 arch/arm64/kvm/debug.c                        |  33 +-
 arch/arm64/kvm/hyp/include/hyp/debug-sr.h     |   6 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h       | 181 ++++-
 arch/arm64/kvm/pmu-direct.c                   | 395 ++++++++++
 arch/arm64/kvm/pmu-emul.c                     | 674 +---------------
 arch/arm64/kvm/pmu.c                          | 725 ++++++++++++++++++
 arch/arm64/kvm/sys_regs.c                     | 137 +++-
 arch/arm64/tools/cpucaps                      |   1 +
 arch/arm64/tools/sysreg                       |   6 +-
 drivers/perf/arm_pmuv3.c                      | 128 +++-
 include/linux/perf/arm_pmu.h                  |   1 +
 include/linux/perf/arm_pmuv3.h                |  14 +-
 include/uapi/linux/kvm.h                      |   4 +
 tools/include/uapi/linux/kvm.h                |   2 +
 .../selftests/kvm/arm64/vpmu_counter_access.c |  62 +-
 24 files changed, 1910 insertions(+), 775 deletions(-)
 create mode 100644 arch/arm64/kvm/pmu-direct.c


base-commit: 79150772457f4d45e38b842d786240c36bb1f97f
--
2.50.0.727.gbf7dc18ff4-goog

