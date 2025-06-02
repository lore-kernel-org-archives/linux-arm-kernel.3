Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDE0C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 19:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XDqE8mFNSY/ZirLnr+lInzWb5qO4cUyD2wakE3p29r0=; b=Fzt2JeO0WgWruqu/wJvyyFONCD
	ACvD6oZkFHMHnrusT3qaEvtVFbw5faCgWicUg9bnjw/OV6xhGvJ0/AgbaBiSZIzhZ1cnMIJXzy+vq
	Bgma2RoK8oEr2AFhSgKwbfcoSkl4e88PZoyCnIapeFVZ5UJa2PK56oHqcW8buxTFpHUaIAt1lja9L
	HWL4f9ewr2mKNpkdk7CQ1E2QuHmxWZ+rc0ogUYJyiPqNIkYVrMz8vKKOe60m8IMvk8SU260Bezv3S
	Qijvuc5vOiesBQuWz2w8Ia6boaf0or5RiY+/HOVCIPrkNcpYHSwArZ+MqzA0a6yFDtCc1qR+N7lqq
	i9Zxh+3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMAsR-00000008VEZ-1Ic8;
	Mon, 02 Jun 2025 19:31:19 +0000
Received: from mail-il1-x149.google.com ([2607:f8b0:4864:20::149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMAqB-00000008UA9-0gu9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 19:29:00 +0000
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-3ddb4a7b36dso11239895ab.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 12:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748892537; x=1749497337; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XDqE8mFNSY/ZirLnr+lInzWb5qO4cUyD2wakE3p29r0=;
        b=D8ipffBUmecFp6fz98SW69M5uBpJhnS/etBi/UcaxBUbd6HhVJMV285J+LORxOsPnS
         IAOGRfyC7GYilO7pAaWprk1Kvf2ypo1A3d+UYOtZr7VjM0Ew4apLVC+gz2+wqQW+M134
         T/O4dypFyIKJagX11JZsBQm5lfPX9JmvaZhG/h9/vmPQHLH+N1zyEIhnhoT37lbfKMGc
         w5EK1G/0dhNCWk4r+hwNcxL3yXJF12QPDa1hkK/ngZbSsQciPMjdXe4HXYRcUdCqyFXt
         pRUTNlHMN6SYi5wUDgKqxkAWBRyNKS5S/3QBQtweNWT18t75rnNsUGxw4raF3qDk4KiA
         5+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748892537; x=1749497337;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XDqE8mFNSY/ZirLnr+lInzWb5qO4cUyD2wakE3p29r0=;
        b=sHQAxuSRjZL0PkyHukahGtD/4C1W7fG4m1YK62X2oN/30bKnMpy8l5rZklVUFXOf/v
         MrsqBoZjCiY5LvcS7u8eXsMhmaD2i2pQDssFHW2oQFWxaWqBvoXIO0oH6f7XMffuptdN
         30t7OU+sA3UuX/ZWpk0GNAsGcTwWgjT0tYdYMt/a8SaSOGNfNFvtvug5vOeTWPrOMZIi
         7x7ID4DqFAO1Ye//PAdIH2wpKBOeK1D0EcCtXOVFbmWjfD61J8kALzaPVkpwMOBxUy/9
         EA0atnp64O11pKwKBxNceEDC0Nxnk+iC1AgxZA2HfDSRq9XPJQImPPT+F7KvsddbidRy
         3law==
X-Forwarded-Encrypted: i=1; AJvYcCUUjUq7cH09ec6woPqAv1BixCYx7LsviaTSIbpcS8XwIlRLw4OCNRdodV8Z+DuBLll2cb/zqoB9QgCi5Y5MDCVq@lists.infradead.org
X-Gm-Message-State: AOJu0Yy83ci+lP0+NHgfznNdWshu8jCoL0WkMAifDUEuxd97xdmBkjPs
	Kktf7m8n8SrlMVFpDk8HicdTUOR4Yd8yO+gcSZ5G522B+9glcSYJSjEAwr/A/kHowoT/Ax5kGOn
	V1X66ddK0+vxOpfb1ZXFe7dK3sg==
X-Google-Smtp-Source: AGHT+IFxeHQ76hpwbia1zMeQqWVTlfaiwmMC2Ena7lOl4cpvV3skj0sAcuon/x4Imo4A5kPFT2TaGxeLGLjA5Bo9DQ==
X-Received: from ilbby12.prod.google.com ([2002:a05:6e02:260c:b0:3dd:b4dc:eb43])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:194b:b0:3dc:787f:2bc8 with SMTP id e9e14a558f8ab-3dda3363f25mr100622585ab.12.1748892537342;
 Mon, 02 Jun 2025 12:28:57 -0700 (PDT)
Date: Mon,  2 Jun 2025 19:26:45 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250602192702.2125115-1-coltonlewis@google.com>
Subject: [PATCH 00/17] ARM64 PMU Partitioning
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_122859_213359_9D74C4C7 
X-CRM114-Status: GOOD (  25.87  )
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

Overview:

This series implements a new PMU scheme on ARM, a partitioned PMU
that exists alongside the existing emulated PMU and may be enabled by
the kernel command line kvm.reserved_host_counters or by the vcpu
ioctl KVM_ARM_PARTITION_PMU. This is a continuation of the RFC posted
earlier this year. [1]

The high level overview and reason for the name is that this
implementation takes advantage of recent CPU features to partition the
PMU counters into a host-reserved set and a guest-reserved set. Guests
are allowed untrapped hardware access to the most frequently used PMU
registers and features for the guest-reserved counters only.

This untrapped hardware access significantly reduces the overhead of
using performance monitoring capabilities such as the `perf` tool
inside a guest VM. Register accesses that aren't trapping to KVM mean
less time spent in the host kernel and more time on the workloads
guests care about. This optimization especially shines during high
`perf` sample rates or large numbers of events that require
multiplexing hardware counters.

Performance:

For example, the following tests were carried out on identical ARM
machines with 10 general purpose counters with identical guest images
run on QEMU, the only difference being my PMU implementation or the
existing one. Some arguments have been simplified here to clarify the
purpose of the test:

1) time perf record -e ${FIFTEEN_HW_EVENTS} -F 1000 -- \
   gzip -c tmpfs/random.64M.img >/dev/null

On emulated PMU this command took 4.143s real time with 0.159s system
time. On partitioned PMU this command took 3.139s real time with
0.110s system time, runtime reductions of 24.23% and 30.82%.

2) time perf stat -dd -- \
   automated_specint2017.sh

On emulated PMU this benchmark completed in 3789.16s real time with
224.45s system time and a final benchmark score of 4.28. On
partitioned PMU this benchmark completed in 3525.67s real time with
15.98s system time and a final benchmark score of 4.56. That is a
6.95% reduction in runtime, 92.88% reduction in system time, and
6.54% improvement in overall benchmark score.

Seeing these improvements on something as lightweight as perf stat is
remarkable and implies there would have been a much greater
improvement with perf record. I did not test that because I was not
confident it would even finish in a reasonable time on the emulated
PMU

Test 3 was slightly different, I ran the workload in a VM with a
single VCPU pinned to a physical CPU and analyzed from the host where
the physical CPU spent its time using mpstat.

3) perf record -e ${FIFTEEN_HW_EVENTS} -F 4000 -- \
   stress-ng --cpu 0 --timeout 30

Over a period of 30s the cpu running with the emulated PMU spent
34.96% of the time in the host kernel and 55.85% of the time in the
guest. The cpu running the partitioned PMU spent 0.97% of its time in
the host kernel and 91.06% of its time in the guest.

Taken together, these tests represent a remarkable performance
improvement for anything perf related using this new PMU
implementation.

Caveats:

Because the most consistent and performant thing to do was untrap
PMCR_EL0, the number of counters visible to the guest via PMCR_EL0.N
is always equal to the value KVM sets for MDCR_EL2.HPMN. Previously
allowed writes to PMCR_EL0.N via {GET,SET}_ONE_REG no longer affect
the guest.

These improvements come at a cost to 7-35 new registers that must be
swapped at every vcpu_load and vcpu_put if the feature is enabled. I
have been informed KVM would like to avoid paying this cost when
possible.

One solution is to make the trapping changes and context swapping lazy
such that the trapping changes and context swapping only take place
after the guest has actually accessed the PMU so guests that never
access the PMU never pay the cost.

This is not done here because it is not crucial to the primary
functionality and I thought review would be more productive as soon as
I had something complete enough for reviewers to easily play with.

However, this or any better ideas are on the table for inclusion in
future re-rolls.

[1] https://lore.kernel.org/kvmarm/20250213180317.3205285-1-coltonlewis@google.com/

Colton Lewis (16):
  arm64: cpufeature: Add cpucap for HPMN0
  arm64: Generate sign macro for sysreg Enums
  arm64: cpufeature: Add cpucap for PMICNTR
  KVM: arm64: Reorganize PMU functions
  KVM: arm64: Introduce method to partition the PMU
  perf: arm_pmuv3: Generalize counter bitmasks
  perf: arm_pmuv3: Keep out of guest counter partition
  KVM: arm64: Set up FGT for Partitioned PMU
  KVM: arm64: Writethrough trapped PMEVTYPER register
  KVM: arm64: Use physical PMSELR for PMXEVTYPER if partitioned
  KVM: arm64: Writethrough trapped PMOVS register
  KVM: arm64: Context switch Partitioned PMU guest registers
  perf: pmuv3: Handle IRQs for Partitioned PMU guest counters
  KVM: arm64: Inject recorded guest interrupts
  KVM: arm64: Add ioctl to partition the PMU when supported
  KVM: arm64: selftests: Add test case for partitioned PMU

Marc Zyngier (1):
  KVM: arm64: Cleanup PMU includes

 Documentation/virt/kvm/api.rst                |  16 +
 arch/arm/include/asm/arm_pmuv3.h              |  24 +
 arch/arm64/include/asm/arm_pmuv3.h            |  36 +-
 arch/arm64/include/asm/kvm_host.h             | 208 +++++-
 arch/arm64/include/asm/kvm_pmu.h              |  82 +++
 arch/arm64/kernel/cpufeature.c                |  15 +
 arch/arm64/kvm/Makefile                       |   2 +-
 arch/arm64/kvm/arm.c                          |  24 +-
 arch/arm64/kvm/debug.c                        |  13 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h       |  65 +-
 arch/arm64/kvm/pmu-emul.c                     | 629 +----------------
 arch/arm64/kvm/pmu-part.c                     | 358 ++++++++++
 arch/arm64/kvm/pmu.c                          | 630 ++++++++++++++++++
 arch/arm64/kvm/sys_regs.c                     |  54 +-
 arch/arm64/tools/cpucaps                      |   2 +
 arch/arm64/tools/gen-sysreg.awk               |   1 +
 arch/arm64/tools/sysreg                       |   6 +-
 drivers/perf/arm_pmuv3.c                      |  55 +-
 include/kvm/arm_pmu.h                         | 199 ------
 include/linux/perf/arm_pmu.h                  |  15 +-
 include/linux/perf/arm_pmuv3.h                |  14 +-
 include/uapi/linux/kvm.h                      |   4 +
 tools/include/uapi/linux/kvm.h                |   2 +
 .../selftests/kvm/arm64/vpmu_counter_access.c |  40 +-
 virt/kvm/kvm_main.c                           |   1 +
 25 files changed, 1616 insertions(+), 879 deletions(-)
 create mode 100644 arch/arm64/include/asm/kvm_pmu.h
 create mode 100644 arch/arm64/kvm/pmu-part.c
 delete mode 100644 include/kvm/arm_pmu.h


base-commit: 1b85d923ba8c9e6afaf19e26708411adde94fba8
--
2.49.0.1204.g71687c7c1d-goog

