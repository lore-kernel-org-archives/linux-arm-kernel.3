Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3676D609C6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 10:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g9PJ9Gush9lm7lbb9dy1lav0vrsKv/73ERSUCMwZKDE=; b=Gkt7S4mxXCtwzcdUY1ejFnBW3I
	XK3jktm52ENyb1qCdx8SLpXEDkbE1DMCn/xsss+fYpdlJlc6oQZJ56ReL15EmlbeiHC6fNQRYNbgt
	Ik5rQHM3Z3Lj8AToDC1e5/FGyogHcrOAmJnsBbo8hpH4oelOJXBqgRqs2TZV0DQ1XfVxKRBMEagOE
	AVr/I4c6+0xw+HtSgrGrL10uE0hlTt+gy92LgImdXRP674w3rI1M3YxCHBoG5pUSI920HtUa9gJty
	br7DLgrFWZjgfSIKYO3PlvhQRB75YHWqqh1bZBY/ilRymnlZdkRjTmyrAGpsgLAoI2k2mmKMrwF5q
	oO03DP2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGEse-0000000Cltz-3VyB;
	Wed, 27 Nov 2024 10:02:44 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGErf-0000000ClXp-3YhK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 10:01:45 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-53da353eb2eso10183635e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 02:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732701701; x=1733306501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g9PJ9Gush9lm7lbb9dy1lav0vrsKv/73ERSUCMwZKDE=;
        b=NBQ+9qPzUCgqz1HJ1FX/gzI7ivznbxIyqWKDTnVSW4EeIW9zXMSI2P+/49510EXphe
         srx0Pr48tEx6vRMY1qHBTAMdWrjDOyNhcsjAh8xP95qcxvLnMxWQUohehvzpDSso1S/F
         K2wuBZEpYaf5clY7W5wvHgwv8+tA/Cuy1SNI6902hE6YdoClk23d2mrtob6FuMLHQgg+
         STE4vzw9T2E1Iw5Qfp8AhoqXGAxgElt3dv11xFVKOnddp0gfTgdKk6Ehiq84Z0ptHFDu
         aYoJr01AJsptznCGCtPoQLxgaoUbJmLyRF+7i0oDrzsqZNnoPmZPB1QwhCzuMUpgyCix
         /RIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732701701; x=1733306501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g9PJ9Gush9lm7lbb9dy1lav0vrsKv/73ERSUCMwZKDE=;
        b=rBgywSip9cIPNA6VJd71SRxUhI1KOccqc1cjqElEALiyGtiqRa5g4/DVNbiY5mu4dl
         Ju6IyRYdgNqySlDIk2VElMFC1BYHAOfdvx2M+74fkniRdF+udMilm54mRARqQwG9ZNIc
         THPYHzOw8RBbgiJJFnVIabGGyB8gSXQL+yG5/q4Wo7HqIi8mF7DvIOPyJT/W68MRRdj3
         pELao1f9uukHv0GKhVWnVvx15QOtz2NjIMvQuLTxlw33C0kECdiQ/XUKREcFcpGSArp1
         yx12zYDKyegmKT+pXrk5PgxotmVCemYrfwmCyCbBOXbKcjJd3cNdWuzgPEHpVaxZ8IpU
         +DaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgKZdWFSSpwBPlZ3rZRDvSzgL3EQSW/Vyn9G3DvRfbU90m4N/xWPdLmGONrFNkGOc7geB7mKZjUBb2ay3/Dg1D@lists.infradead.org
X-Gm-Message-State: AOJu0Ywawv60dGQZnoqjNq0ZiOTodtr8QhN6oQ1amWiwrinXGTpLJoho
	KlwAefxTBq2uAyc7Il6FC9DVwldGfmlHFKgLqQFzmJD80q0GU5r2CDmNoEcH33s=
X-Gm-Gg: ASbGncuwIhOcJ1ANR3qfgtyp72woe2qA+w3cMSoZGpqTzIuKyxSzaXolBFMXnzo3Yt9
	hsIbteEaDsC08JPKXyPFUKZTkcOcjvNyDOFDPMgLylpr7sefRS9B5ODZidsPjwAGJTUC8UHLIK5
	RFbwzINreNssBJxbkpF3u3xtzUyyS4VwLd62G5NhHIdK81FilsUFewpgcrUVk62q2svdy6KuuJR
	u5zgAZaxVovroEgYzASjcszjlG6QN2iJda0cvl40cGcu+zURQ==
X-Google-Smtp-Source: AGHT+IF2h6Ec+GYiEgi4O/av/bXoRXCF5EjeitDXO3KJ0icB0ZNqf2E5Uu6kmK0JggmmIEskxuF8ZA==
X-Received: by 2002:a05:6512:1283:b0:53d:d246:5aca with SMTP id 2adb3069b0e04-53df00d1080mr1987003e87.24.1732701701202;
        Wed, 27 Nov 2024 02:01:41 -0800 (PST)
Received: from pop-os.. ([145.224.90.200])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa547ffb152sm421887466b.62.2024.11.27.02.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 02:01:40 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: maz@kernel.org,
	kvmarm@lists.linux.dev,
	oliver.upton@linux.dev,
	suzuki.poulose@arm.com,
	coresight@lists.linaro.org
Cc: James Clark <james.clark@linaro.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	Fuad Tabba <tabba@google.com>,
	James Morse <james.morse@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/8] kvm/coresight: Support exclude guest and exclude host
Date: Wed, 27 Nov 2024 10:01:17 +0000
Message-Id: <20241127100130.1162639-1-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_020143_908587_B7795C5C 
X-CRM114-Status: GOOD (  31.52  )
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

FEAT_TRF is a Coresight feature that allows trace capture to be
completely filtered at different exception levels, unlike the existing
TRCVICTLR controls which may still emit target addresses of branches,
even if the following trace is filtered.

Without FEAT_TRF, it was possible to start a trace session on a host and
also collect trace from the guest as TRCVICTLR was never programmed to
exclude guests (and it could still emit target addresses even if it
was).

With FEAT_TRF, the current behavior of trace in guests exists depends on
whether nVHE or VHE are being used. Both of the examples below are from
the host's point of view, as Coresight isn't accessible from guests.
This patchset is only relevant to when FEAT_TRF exists, otherwise there
is no change.

Current behavior:

  nVHE/pKVM:

  Because the host and the guest are both using TRFCR_EL1, trace will be
  generated in guests depending on the same filter rules the host is
  using. For example if the host is tracing userspace only, then guest
  userspace trace will also be collected.

  (This is further limited by whether TRBE is used because an issue
  with TRBE means that it's completely disabled in nVHE guests, but it's
  possible to have other tracing components.)

  VHE:

  With VHE, the host filters will be in TRFCR_EL2, but the filters in
  TRFCR_EL1 will be active when the guest is running. Because we don't
  write to TRFCR_EL1, guest trace will be completely disabled.

New behavior:

The guest filtering rules from the Perf session are now honored for both
nVHE and VHE modes. This is done by either writing to TRFCR_EL12 at the
start of the Perf session and doing nothing else further, or caching the
guest value and writing it at guest switch for nVHE. In pKVM, trace is
now be disabled for both protected and unprotected guests.

There is also an optimization where the Coresight drivers pass their
enabled state to KVM. This means in the common case KVM doesn't have to
touch any sysregs when the feature isn't in use.

Applies to kvmarm/next (60ad25e14a) but includes two commits from Oliver
for a conflicting change to move TRBE and SPE flags to host data [7].

---

Changes since V7 [6]:
  * Drop SPE changes
  * Change the interface to be based on intent, i.e kvm_enable_trbe()
    rather than passing the raw register value
  * Drop change to re-use vcpu_flags mechanism in favour of [7]
  * Simplify by using the same switch function to and from guest

Changes since V6 [5]:
  * Implement a better "do nothing" case where both the SPE and Coresight
    drivers give the enabled state to KVM, allowing some register
    reads to be dropped.
  * Move the state and feature flags out of the vCPU into the per-CPU
    host_debug_state.
  * Simplify the switch logic by adding a new flag HOST_STATE_SWAP_TRFCR
    and only storing a single TRFCR value.
  * Rename vcpu flag macros to a more generic kvm_flag...

Changes since V5 [4]:
  * Sort new sysreg entries by encoding
  * Add a comment about sorting arch/arm64/tools/sysreg
  * Warn on preemptible() before calling smp_processor_id()
  * Pickup tags
  * Change TRFCR_EL2 from SysregFields to Sysreg because it was only
    used once

Changes since V4 [3]:
  * Remove all V3 changes that made it work in pKVM and just disable
    trace there instead
  * Restore PMU host/hyp state sharing back to how it was
    (kvm_pmu_update_vcpu_events())
  * Simplify some of the duplication in the comments and function docs
  * Add a WARN_ON_ONCE() if kvm_etm_set_guest_trfcr() is called when
    the trace filtering feature doesn't exist.
  * Split sysreg change into a tools update followed by the new register
    addition

Changes since V3:
  * Create a new shared area to store the host state instead of copying
    it before each VCPU run
  * Drop commit that moved SPE and trace registers from host_debug_state
    into the kvm sysregs array because the guest values were never used
  * Document kvm_etm_set_guest_trfcr()
  * Guard kvm_etm_set_guest_trfcr() with a feature check
  * Drop Mark B and Suzuki's review tags on the sysreg patch because it
    turned out that broke the Perf build and needed some unconventional
    changes to fix it (as in: to update the tools copy of the headers in
    the same commit as the kernel changes)

Changes since V2:

  * Add a new iflag to signify presence of FEAT_TRF and keep the
    existing TRBE iflag. This fixes the issue where TRBLIMITR_EL1 was
    being accessed even if TRBE didn't exist
  * Reword a commit message

Changes since V1:

  * Squashed all the arm64/tools/sysreg changes into the first commit
  * Add a new commit to move SPE and TRBE regs into the kvm sysreg array
  * Add a comment above the TRFCR global that it's per host CPU rather
    than vcpu

Changes since nVHE RFC [1]:

 * Re-write just in terms of the register value to be written for the
   host and the guest. This removes some logic from the hyp code and
   a value of kvm_vcpu_arch:trfcr_el1 = 0 no longer means "don't
   restore".
 * Remove all the conditional compilation and new files.
 * Change the kvm_etm_update_vcpu_events macro to a function.
 * Re-use DEBUG_STATE_SAVE_TRFCR so iflags don't need to be expanded
   anymore.
 * Expand the cover letter.

Changes since VHE v3 [2]:

 * Use the same interface as nVHE mode so TRFCR_EL12 is now written by
   kvm.

[1]: https://lore.kernel.org/kvmarm/20230804101317.460697-1-james.clark@arm.com/
[2]: https://lore.kernel.org/kvmarm/20230905102117.2011094-1-james.clark@arm.com/
[3]: https://lore.kernel.org/linux-arm-kernel/20240104162714.1062610-1-james.clark@arm.com/
[4]: https://lore.kernel.org/all/20240220100924.2761706-1-james.clark@arm.com/
[5]: https://lore.kernel.org/linux-arm-kernel/20240226113044.228403-1-james.clark@arm.com/
[6]: https://lore.kernel.org/kvmarm/20241112103717.589952-1-james.clark@linaro.org/T/#t
[7]: https://lore.kernel.org/kvmarm/20241115224924.2132364-4-oliver.upton@linux.dev/

James Clark (6):
  arm64/sysreg: Add a comment that the sysreg file should be sorted
  tools: arm64: Update sysreg.h header files
  arm64/sysreg/tools: Move TRFCR definitions to sysreg
  KVM: arm64: coresight: Give TRBE enabled state to KVM
  KVM: arm64: Support trace filtering for guests
  coresight: Pass guest TRFCR value to KVM

Oliver Upton (2):
  KVM: arm64: Get rid of __kvm_get_mdcr_el2() and related warts
  KVM: arm64: Track presence of SPE/TRBE in kvm_host_data instead of
    vCPU

 arch/arm64/include/asm/kvm_asm.h              |   5 +-
 arch/arm64/include/asm/kvm_host.h             |  39 +-
 arch/arm64/include/asm/sysreg.h               |  12 -
 arch/arm64/kvm/arm.c                          |   5 +-
 arch/arm64/kvm/debug.c                        |  92 ++--
 arch/arm64/kvm/hyp/nvhe/debug-sr.c            |  61 +--
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |   6 -
 arch/arm64/kvm/hyp/vhe/debug-sr.c             |   5 -
 arch/arm64/tools/sysreg                       |  38 ++
 .../coresight/coresight-etm4x-core.c          |  43 +-
 drivers/hwtracing/coresight/coresight-etm4x.h |   2 +-
 drivers/hwtracing/coresight/coresight-priv.h  |   3 +
 drivers/hwtracing/coresight/coresight-trbe.c  |   5 +
 tools/arch/arm64/include/asm/sysreg.h         | 410 +++++++++++++++++-
 tools/include/linux/kasan-tags.h              |  15 +
 15 files changed, 609 insertions(+), 132 deletions(-)
 create mode 100644 tools/include/linux/kasan-tags.h

-- 
2.34.1


