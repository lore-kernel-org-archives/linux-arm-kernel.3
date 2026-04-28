Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748B9FF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 18:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0cxKPHTRIaK/ePDfLMLoc6fCf6yDOu/nHtt6cdw9gxo=; b=gHrB7mlKZjYmUKZ2ApQ9ozTIhj
	G+bgcfT1vSRDN9U7JoFywmeREbwVxUs8Vb1VUZIiKVBW7Vn40xwoaitBxcNeG6v42Phj7R51xsedZ
	NgWwBdgoli/0HRPgDiP7sWsfm7iJ4bmtm1Gnu3oIgbg29UoCQodWI9dxX71q39fBPkvNYw62GuRlR
	cW1yLVsrCwmiWG3u0geGRVoSd/1117wxVnMpysdHgwIZ7hS7NJ1rCmWzZaSgDf6vzhu0n8xNX5KFs
	n3nWnV4cuNExj17A8MUvXwEexXQ77GPMK1OInDm5C09r3PrBi38AA/6gGnu+DyW+iEI58kd1MGhF8
	EtZRULUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnJ0-000000026IO-3pHr;
	Tue, 28 Apr 2026 18:37:10 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnIx-000000026Hy-2ZBa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 18:37:09 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-35842aa350fso22478573a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 11:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777401426; x=1778006226; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0cxKPHTRIaK/ePDfLMLoc6fCf6yDOu/nHtt6cdw9gxo=;
        b=S4mxFbM8ZZI/lYUk/huwOOzHdO5fu/YydxtfCIxitqQjmFQIwxo2IX/r6iG/O63opO
         YL+H3zRKgW+obraBmuKtubDhfKZITcQLfW1kjF0Q2vsDcNZIhiV4OVsCjPBf+nTCKY7o
         klRjd+ZHUVz8I79vJkYwudQo+QWCCisKjHdjBdfs0tYMlj6AAc75EOkMDX4RwRn8iGK1
         t9PKgAhLhho8gvH22fhEtMAV3Z/5ayqKfzJiwAetqkgxCcxt/2wblnkAVTK2IWWi7oKH
         V4HFHNotVx8SEIYofpXhvw65/97cil15IOZGDT+cNVuDafSw7PHStYdY29Jq328KmS6r
         VJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777401426; x=1778006226;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0cxKPHTRIaK/ePDfLMLoc6fCf6yDOu/nHtt6cdw9gxo=;
        b=WTsMdIwWyOMCLTb8ooBApFBwmx+BEGcpMwk4sBuveiVdYLk2GVvlQLYEeahki4j5kq
         3q9pPMiCs6tHTdhnh4wNPlD+MEFzegsg+x/TEdFfagRLQFedCxEj3DKWQeRchQtoP4D8
         5TXfihdzlS/SWmeiQhfk/qMTr+s4LSp4GGximltNlHe/cTkcwadFQgZYgN3xN/+HpM26
         6MN8yy0MuM6k+5U1scGTaAr1GPKsOldXK4srpSxsng9AejsBXbnhSzmpFQtqjfoJnbGB
         oyBEoBAFrrTJm7psRvA9oXxsEfGu/yHhGkcKlwNaw104hwcWelFmsxkO3LUF8tVtefPR
         IApw==
X-Forwarded-Encrypted: i=1; AFNElJ8J2apGfDtidgeLLUFVo2DjlhY2rgB7ftdm9mDyTFZKVkbeNXdx5A+erUDtee4DPkF23ixxLs7wpdct3atCmfG5@lists.infradead.org
X-Gm-Message-State: AOJu0YyK8jP8MeRrolUcrrkgHIZUdh0+5omEjlKf48+vXMl4QS/7QCM6
	tIeGJztbCPMlmnuzAgWT8X1RfpxgwVG6tFkFbidMoSuUp0jOfQeki61TgLeCkmF8zFmQzUIN/6x
	ZIP5Lop1PVGl+zsa/qE7syJKi/Q==
X-Received: from pjop3.prod.google.com ([2002:a17:90a:9303:b0:35d:94b3:bd6b])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1b10:b0:35f:b6d3:da7a with SMTP id 98e67ed59e1d1-364920a55f4mr4382325a91.15.1777401425558;
 Tue, 28 Apr 2026 11:37:05 -0700 (PDT)
Date: Tue, 28 Apr 2026 18:36:35 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260428183643.3796063-1-dylanbhatch@google.com>
Subject: [PATCH v5 0/8] unwind, arm64: add sframe unwinder for kernel
From: Dylan Hatch <dylanbhatch@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Jens Remus <jremus@linux.ibm.com>
Cc: Dylan Hatch <dylanbhatch@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Song Liu <song@kernel.org>, joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_113707_659613_2B5B6ACE 
X-CRM114-Status: GOOD (  20.10  )
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

Implement a generic kernel sframe-based [1] unwinder. The main goal is
to improve reliable stacktrace on arm64 by unwinding across exception
boundaries.

On x86, the ORC unwinder provides reliable stacktrace through similar
methodology, but arm64 lacks the necessary support from objtool to
create ORC unwind tables.

Currently, there's already a sframe unwinder proposed for userspace: [2].
To maintain common definitions and algorithms for sframe lookup, a
substantial portion of this patch series aims to refactor the sframe
lookup code to support both kernel and userspace sframe sections.

Currently, only GNU Binutils support sframe. This series relies on the
Sframe V3 format, which is supported in binutils 2.46.

These patches are based on Steven Rostedt's sframe/core branch [3],
which is and aggregation of existing work done for x86 sframe userspace
unwind, and contains [2]. This branch is, in turn, based on Linux
v7.0-rc3. This full series (applied to the sframe/core branch) is
available on github: [4].

Ref:
[1]: https://sourceware.org/binutils/docs/sframe-spec.html
[2]: https://lore.kernel.org/lkml/20260127150554.2760964-1-jremus@linux.ibm.com/
[3]: https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git/log/?h=sframe/core
[4]: https://github.com/dylanbhatch/linux/tree/sframe-v5

Changes since v4:
  - (Jens) Fix some minor nits.
  - Handle .init.text and .exit.text in function address validation.

Changes since v3:

  - (Jens) Clean up patch summaries.
  - (Jens) Rename SFRAME_LOOKUP -> UNWIND_SFRAME_LOOKUP to fit existing
    naming convention.
  - (Randy) Correct typo errors in new config options.
  - (Jens) Move unwind types to a new unwind_types.h to match their
    usage.
  - (Jens) Update KERNEL_[COPY|GET] to use label-based error handling
    like their userspace counterparts.
  - (Jens) Rename SFRAME_UNWINDER -> HAVE_UNWIND_KERNEL_SFRAME and
    ARCH_SUPPORTS_SFRAME_UNWINDER -> ARCH_SUPPORTS_UNWIND_KERNEL_SFRAME
    to match existing naming convention.
  - (Jens) Move HAVE_UNWIND_KERNEL_SFRAME config option to arch/Kconfig.
  - (Jens) Rename/move extern definitions of __[start|end]_sframe into
    include/asm-generic/sections.h.
  - (Jens) Fix up CFI annotations at kernel entry.
  - (Jens) Fix error path for unsorted FDE lookup.
  - (Jens) Zero-out module sframe_section before init.
  - (Jens) For SFRAME_VALIDATION, use an arch-specific function-address
    validation helper so that .rodata.text can be correctly handled on
    arm64 vmlinux.
  - (Jens) Fixup and better comment kernel stacktrace code.

Changes since v2:

The biggest change from v2 is the switch from adding a dedicated,
in-kernel sframe-lookup library, to refactoring/using the existing
library developed by Josh, Jens, and Steve. Consequently, this series
now depends on Sframe V3, though this upgrade would likely have been
necessary anyway. Below is a full accounting of the changes since v2.

  - (Josh) Add stricter reliability checks during unwind.
  - (Puranjay, Indu, Jens) Update to use a common sframe library with
    userpace unwind, thus resolving the need to support
    SFRAME_F_FDE_FUNC_START_PCREL, added in binutils 2.45.
  - (Jens) Add check for sframe V3, thus resolving the prior need for V2
    and SFRAME_F_FDE_FUNC_START_PCREL support.
  - (Will) Add ARCH_SUPPORTS_SFRAME_UNWINDER, remove SFRAME_UNWIND_TABLE
  - (Indu) add support for unsorted FDE tables, allowing for module
    sframe lookups.
  - (Mark) Prefer frame-pointer unwind when possible, for better
    performance.
  - Simplify compile-time logic, adding stubbs when necessary.
  - Add support for in-kernel SFRAME_VALIDATION.
  - Rebase onto core/sframe (with v7.0-rc3 base)

Dylan Hatch (7):
  sframe: Allow kernelspace sframe sections
  arm64, unwind: build kernel with sframe V3 info
  sframe: Provide PC lookup for vmlinux .sframe section
  sframe: Allow unsorted FDEs
  arm64/module, sframe: Add sframe support for modules
  sframe: Introduce in-kernel SFRAME_VALIDATION
  unwind: arm64: Use sframe to unwind interrupt frames

Weinan Liu (1):
  arm64: entry: add unwind info for various kernel entries

 MAINTAINERS                                   |   3 +-
 Makefile                                      |   8 +
 arch/Kconfig                                  |  27 +-
 arch/arm64/Kconfig                            |   1 +
 arch/arm64/include/asm/module.h               |   6 +
 arch/arm64/include/asm/sections.h             |   1 +
 arch/arm64/include/asm/stacktrace/common.h    |   6 +
 arch/arm64/include/asm/unwind_sframe.h        |  55 +++
 arch/arm64/kernel/entry.S                     |  23 +
 arch/arm64/kernel/module.c                    |   8 +
 arch/arm64/kernel/setup.c                     |   2 +
 arch/arm64/kernel/stacktrace.c                | 246 ++++++++++-
 arch/arm64/kernel/vdso/Makefile               |   2 +-
 arch/arm64/kernel/vmlinux.lds.S               |   2 +
 .../{unwind_user_sframe.h => unwind_sframe.h} |   6 +-
 arch/x86/include/asm/unwind_user.h            |  12 +-
 include/asm-generic/sections.h                |   4 +
 include/asm-generic/vmlinux.lds.h             |  15 +
 include/linux/sframe.h                        |  67 ++-
 include/linux/unwind_types.h                  |  46 ++
 include/linux/unwind_user_types.h             |  41 --
 kernel/unwind/Makefile                        |   2 +-
 kernel/unwind/sframe.c                        | 410 ++++++++++++++----
 kernel/unwind/user.c                          |  41 +-
 24 files changed, 827 insertions(+), 207 deletions(-)
 create mode 100644 arch/arm64/include/asm/unwind_sframe.h
 rename arch/x86/include/asm/{unwind_user_sframe.h => unwind_sframe.h} (50%)
 create mode 100644 include/linux/unwind_types.h

-- 
2.54.0.545.g6539524ca2-goog


