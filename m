Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827D1E94617
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 22:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=30Nas80AMvo6RyW+BR+2WwHJbWJfG1zda4JX9g84//U=; b=43OvCdlkmTd301XB2QWjl/jqig
	4IovpuzNqGWhpT932YMdenPKKJi8WHr7+TEetaEBmLNEkDOjtekrEdxpn/tw4kPNbWZE14TRoJhbI
	Q1O0l+9aD+o46+FuiXlhZnJfFWcbUVFW340iFE9R3pbqqrjhOFDm3Q53haj5kfbqAyVLfss5rxFzE
	zP7WAvevzNbCGsJoTmBJJ+sa+/IgywGDsEBgKe9sbLljynZosWvniBrs/ek/Td22gA8L9L+s1M10/
	RpQcyp4cRky5NlKrnGxNHCos1P+Yc13fbCOJsc66KN+PzCm/m8X29605vj4rBn5msPbi8GAXF0+uv
	69oQMI9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZw0-0000000G7J2-09og;
	Mon, 09 Feb 2026 22:40:48 +0000
Received: from mail-oo1-xc49.google.com ([2607:f8b0:4864:20::c49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZvx-0000000G7II-2H1C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 22:40:46 +0000
Received: by mail-oo1-xc49.google.com with SMTP id 006d021491bc7-66ad005c9dfso1579837eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 14:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770676844; x=1771281644; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=30Nas80AMvo6RyW+BR+2WwHJbWJfG1zda4JX9g84//U=;
        b=bKloAJH6kQgKOmpcF9X74QFY1gIRK5/97M7alPJJE9YSnXxjt6nBTQMNQOufxgKz78
         PLWchd50K0sUytqVHjsJC/eJaEUqydIIFlNHo3x7EcWUtEE5J1IG4veX85SduRLV8Q8z
         TEGK+1hfNj2JIFa3rELZaJ41wH23iPnZ7vJzR8xCxCcH+PUSrBO+PnRdEofZGqpUEZn2
         FadKgBE5kXIHPFnqW8wVrK9n/mLDsiTHQE0WY1jkPwC2zMojk/DBV7+uL15NXnyPCZlk
         aWWCqUjMaZwWM9Ywac2DH0Lze0H0008CiTNJCg4d1KGVNTs/cEvtu9tjhBA+uBItxVEc
         1vYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770676844; x=1771281644;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=30Nas80AMvo6RyW+BR+2WwHJbWJfG1zda4JX9g84//U=;
        b=gOoJiUfUTIv23sJ9Ivz28Tu7+FxunmsOGVP041eeA3fqRnQVcttTR5iaMIFZqPqXWz
         Eye6dJC1LoMg8Oz0p76cqqB/3ZznRdu6L6VExcx9wJokJIypQE/7QGwwr3Ak7EO6fr0v
         VzvwK4W7LsSs+F7CrT1OK2xdfXiil0J3IIlh9r08hG5+xBHmDK0xOQrXEYzq0ramgzBi
         EwZSgsM66/YfywAJ9IdbpQcRRotImZz1d9FvPtyKhHfhIDSpxNQga/fVhTjd244jgZxx
         ft6DQrDe3pqX+XGzoVsk3J4asBr2+OVDv9VdEufEed+gr/OsYdMWR52oGZt4Lk1TEv2t
         iUFg==
X-Forwarded-Encrypted: i=1; AJvYcCWp+jSPxZITwGlJq/aMVHofAEP4FeZcpyk76RO/ZX65ybFjrSiWrt3kUF6xc54gMeKAFB59PQJBE1U9LM80g49e@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4ondMAKHqdNb/b/WikkIuqfOLQW+MMtY5hkee22t3yUi5dloR
	6rtVy0BDF35E154kxfMfBqwdJdB5pVQUnsEgUOEQuJH7oBZ9CPmDnSVS72R8JiwNFYOrWMDIOeM
	nhopY38LGGz2y6gRhOLA9O18EuQ==
X-Received: from ileg3.prod.google.com ([2002:a05:6e02:1a23:b0:467:9e40:e391])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:220b:b0:664:86ce:df46 with SMTP id 006d021491bc7-66d0c472fd0mr6437177eaf.57.1770676843797;
 Mon, 09 Feb 2026 14:40:43 -0800 (PST)
Date: Mon,  9 Feb 2026 22:13:55 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260209221414.2169465-1-coltonlewis@google.com>
Subject: [PATCH v6 00/19] ARM64 PMU Partitioning
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_144045_617000_C276E120 
X-CRM114-Status: GOOD (  20.59  )
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

An overview of what this series accomplishes was presented at KVM
Forum 2025. Slides [1] and video [2] are linked below.

IMPORTANT: This iteration does not yet implement the dynamic counter
reservation approach suggested by Will Deacon in January [3]. I am
working on it, but wanted to send this version first to keep momentum
going and ensure I've addressed all issues besides that.

v6:
* Rebase onto v6.19-rc7

* Drop the reorganization patches I had previously included from Sean
  and Anish and rework without them.

* Inline FGT programming for easier readability

* Change register access path to drop simultaneous writing of the
  virtual and physical registers and write only where the canonical
  state should reside. The PMU register fast path behaves like a
  simple accessor now, relying on generic helpers when needed.

* Related to the previous, drop several patches modifying sys_regs.c
  and incorporate PMOVS and PMEVTYPER into the fast path instead.

* Move the register fast path call to kvm_hyp_handle_sysreg_vhe since
  this feature depends on VHE mode

* Remove the heavyweight access checks from the fast path that had the
  potential to inject an undefined exception. For what checks are
  necessary, just return false and let the normal path handle
  injecting exceptions

* Remove the legacy support for writeable PMCR.N. VMMs must use the
  vCPU attribute to change the number of counters.

* Simplify kvm_pmu_hpmn by relying on kvm_vcpu_on_unsupported_cpu and
  moving HPMN validation of nr_pmu_counters to the ioctl boundary when
  it is set.

* Disable preemption during context swap

* Simplify iteration of counters to context swap by iterating a bitmask

* Clear PMOVS flags during load to avoid the possibility of generating
  a spurious interrupt when writing PMINTEN or PMCNTEN

* Make kvm_pmu_apply_event_filter() hyp safe

* Cleanly separate interrupt handling so the host driver clears the
  overflow flags for the host counters only and KVM handles clearing
  the guest counter flags.

* Ensure the guest PMU state is on hardware before checking hardware
  for the purposes of determining if an overflow should be injected
  into the guest.

* Naming and commit message improvements

* Change uAPI to vCPU device attribute selected when other PMU
  attributes are selected.

* Remove some checks for exceptions when accessing invalid counter
  indices with the Partitioned PMU. Hardware does not guarantee them
  so the Partitioned PMU can't either.

v5:
https://lore.kernel.org/kvmarm/20251209205121.1871534-1-coltonlewis@google.com/

v4:
https://lore.kernel.org/kvmarm/20250714225917.1396543-1-coltonlewis@google.com/

v3:
https://lore.kernel.org/kvm/20250626200459.1153955-1-coltonlewis@google.com/

v2:
https://lore.kernel.org/kvm/20250620221326.1261128-1-coltonlewis@google.com/

v1:
https://lore.kernel.org/kvm/20250602192702.2125115-1-coltonlewis@google.com/

[1] https://gitlab.com/qemu-project/kvm-forum/-/raw/main/_attachments/2025/Optimizing__itvHkhc.pdf
[2] https://www.youtube.com/watch?v=YRzZ8jMIA6M&list=PLW3ep1uCIRfxwmllXTOA2txfDWN6vUOHp&index=9
[3] https://lore.kernel.org/kvmarm/aWjlfl85vSd6sMwT@willie-the-truck/

Colton Lewis (18):
  arm64: cpufeature: Add cpucap for HPMN0
  KVM: arm64: Reorganize PMU functions
  perf: arm_pmuv3: Introduce method to partition the PMU
  perf: arm_pmuv3: Generalize counter bitmasks
  perf: arm_pmuv3: Keep out of guest counter partition
  KVM: arm64: Set up FGT for Partitioned PMU
  KVM: arm64: Define access helpers for PMUSERENR and PMSELR
  KVM: arm64: Write fast path PMU register handlers
  KVM: arm64: Setup MDCR_EL2 to handle a partitioned PMU
  KVM: arm64: Context swap Partitioned PMU guest registers
  KVM: arm64: Enforce PMU event filter at vcpu_load()
  KVM: arm64: Implement lazy PMU context swaps
  perf: arm_pmuv3: Handle IRQs for Partitioned PMU guest counters
  KVM: arm64: Detect overflows for the Partitioned PMU
  KVM: arm64: Add vCPU device attr to partition the PMU
  KVM: selftests: Add find_bit to KVM library
  KVM: arm64: selftests: Add test case for partitioned PMU
  KVM: arm64: selftests: Relax testing for exceptions when partitioned

Marc Zyngier (1):
  KVM: arm64: Reorganize PMU includes

 arch/arm/include/asm/arm_pmuv3.h              |  28 +
 arch/arm64/include/asm/arm_pmuv3.h            |  12 +-
 arch/arm64/include/asm/kvm_host.h             |  17 +-
 arch/arm64/include/asm/kvm_types.h            |   6 +-
 arch/arm64/include/uapi/asm/kvm.h             |   2 +
 arch/arm64/kernel/cpufeature.c                |   8 +
 arch/arm64/kvm/Makefile                       |   2 +-
 arch/arm64/kvm/arm.c                          |   2 +
 arch/arm64/kvm/config.c                       |  41 +-
 arch/arm64/kvm/debug.c                        |  31 +-
 arch/arm64/kvm/hyp/vhe/switch.c               | 240 ++++++
 arch/arm64/kvm/pmu-direct.c                   | 439 +++++++++++
 arch/arm64/kvm/pmu-emul.c                     | 674 +---------------
 arch/arm64/kvm/pmu.c                          | 717 ++++++++++++++++++
 arch/arm64/kvm/sys_regs.c                     |   9 +-
 arch/arm64/tools/cpucaps                      |   1 +
 arch/arm64/tools/sysreg                       |   6 +-
 drivers/perf/arm_pmuv3.c                      | 149 +++-
 include/kvm/arm_pmu.h                         | 126 +++
 include/linux/perf/arm_pmu.h                  |   1 +
 include/linux/perf/arm_pmuv3.h                |  14 +-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/arm64/vpmu_counter_access.c | 112 ++-
 tools/testing/selftests/kvm/lib/find_bit.c    |   1 +
 24 files changed, 1889 insertions(+), 750 deletions(-)
 create mode 100644 arch/arm64/kvm/pmu-direct.c
 create mode 100644 tools/testing/selftests/kvm/lib/find_bit.c


base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
--
2.53.0.rc2.204.g2597b5adb4-goog

