Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D402F46C66
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 18:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tw0/fXAq4NvxlO+cgBvvlksUtU/q9839xS4Koaoen6E=; b=2fFGIkZRSfH0RigRCScJo4uDam
	llvCb6hxhJ8GSquy/SYflQdgIXTPdjYe6kLUH5PhkppuTQkRnQF1trcu1PTxbEcu4WNjG6C9T5OK/
	BOZaBuqFxUWjXiThL+A8RFMEKTMeGqow6QivdPLzkjpXHoKe1t4xB8N1BGEbGW7bxQaWNU3NSuVOU
	u7+bhJvTLpZ3mBflRgcWNhtRFFaXVIDojOcbPtzaom6+dEJAwmpWv9w5wbmvNvnPC77VhAJzlqVbV
	OtNMnvMI6Glis28dVzgte2Eu/fJNC/f6JWGSx+TBdMSCip4BvJe6ebYHFtf444KNUcX6W494+deD/
	zUlH588A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9p1b-00000005PKo-34i1;
	Mon, 06 Apr 2026 18:50:15 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9p1Y-00000005PKR-3aro
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 18:50:14 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-82ce50e6e28so2955567b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 11:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775501411; x=1776106211; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Tw0/fXAq4NvxlO+cgBvvlksUtU/q9839xS4Koaoen6E=;
        b=BG51ejLBMJ4Z7/9bgJ7ah7TuO9RiTY42f+A+W3l0mRvbpeZ5MGCXfVk13AExsATiSD
         HM/lhoovTEwYnHvQGCDi1GwAHb5A+X7LBgyavNx70I3uF4Hz3oS5qiusNr26lQ6YEQTI
         XI/D716MOMLUypvNwYZFu5o7OmLD0I+648gPhTeKOACFRpwpQZdKNshyFTBanoZpEg0C
         xHPdOPatIW8d9rzVP3eFVxu5GUNRCkmqYpiZ+3q5m8xvZLlyUtABdiSAJucCSbdmPXGy
         ihE2qvJYCzenDmLRTqxML9u1ue6QLMJRVyzBrY2A3mwYskTQWHB8w/iUBDr2qRWoJ0LB
         djVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775501411; x=1776106211;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tw0/fXAq4NvxlO+cgBvvlksUtU/q9839xS4Koaoen6E=;
        b=MZORR/HlYrU6qB4AB9FdwHWBSvVdOriY1Mef82FouZsJ3VbA1zcPqrj5vpf6mrO5BB
         SVK5PGx5uajJqp44nitUJwVP2I0seS9ZLp/Dc8Rm/7mfCSmMFid/nL2k7YjvMjCQG8oY
         iOmKEqdzb4F/Ge4dgjz5AkwOSIPdez1Hk0EkdC1fMIrzWjogDBiA5OcoLWiBZXBWo+jT
         bUtYi9jrsvX77ZKhb1hy/ykqwSNdVFmIjJAwl0xqTy1uuFPFzh0TFPluqO+stMouqO9o
         4hrgs/P5AvWHmIB+fBVzQAC3apObiKxXBUhNZxad2JodReMul1hlZeHTPtTrASUBOwNC
         jzJw==
X-Forwarded-Encrypted: i=1; AJvYcCWVU9ucUDM++3VO4XvLhDqncS49+knIupejVJ+R9X3cEgANNMCikL2CBlmHVsPovZDHujSQ+ABoStaEmSNLxxnC@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7INzFM0Bl6P2z/oC0aM6gjeTu3HXmR5PYKS6pNFLaKFFAgGEW
	T7qL0rfD2fIlFOwRApyXbZC4WZvTB0vTPh9L+O7+vewPclY2I0Ozj/moFKNFwHpKHVF5g9BvIr3
	LjMVJygbkuphbZJGdkPZXLHVOCQ==
X-Received: from pfbeq2.prod.google.com ([2002:a05:6a00:37c2:b0:82c:63f8:59db])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1950:b0:82a:1337:493c with SMTP id d2e1a72fcca58-82d0da4cd94mr13275110b3a.14.1775501411087;
 Mon, 06 Apr 2026 11:50:11 -0700 (PDT)
Date: Mon,  6 Apr 2026 18:49:52 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260406185000.1378082-1-dylanbhatch@google.com>
Subject: [PATCH v3 0/8] unwind, arm64: add sframe unwinder for kernel
From: Dylan Hatch <dylanbhatch@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <indu.bhagat@oracle.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>
Cc: Dylan Hatch <dylanbhatch@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Song Liu <song@kernel.org>, joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	Jens Remus <jremus@linux.ibm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_115012_914606_0880A374 
X-CRM114-Status: GOOD (  16.40  )
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
[4]: https://github.com/dylanbhatch/linux/tree/sframe-v3-with-v3

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
  sframe: Allow kernelspace sframe sections.
  arm64, unwind: build kernel with sframe V3 info
  sframe: Provide PC lookup for vmlinux .sframe section.
  sframe: Allow unsorted FDEs.
  arm64/module, sframe: Add sframe support for modules.
  sframe: Introduce in-kernel SFRAME_VALIDATION.
  unwind: arm64: Use sframe to unwind interrupt frames.

Weinan Liu (1):
  arm64: entry: add unwind info for various kernel entries

 MAINTAINERS                                   |   3 +-
 Makefile                                      |   8 +
 arch/Kconfig                                  |  13 +-
 arch/arm64/Kconfig                            |   1 +
 arch/arm64/Kconfig.debug                      |  13 +
 arch/arm64/include/asm/module.h               |   6 +
 arch/arm64/include/asm/stacktrace/common.h    |   6 +
 arch/arm64/include/asm/unwind_sframe.h        |  12 +
 arch/arm64/kernel/entry.S                     |  10 +
 arch/arm64/kernel/module.c                    |   8 +
 arch/arm64/kernel/setup.c                     |   2 +
 arch/arm64/kernel/stacktrace.c                | 242 ++++++++++-
 arch/arm64/kernel/vdso/Makefile               |   2 +-
 .../{unwind_user_sframe.h => unwind_sframe.h} |   6 +-
 arch/x86/include/asm/unwind_user.h            |  12 +-
 include/asm-generic/vmlinux.lds.h             |  15 +
 include/linux/sframe.h                        | 105 ++++-
 include/linux/unwind_user_types.h             |  41 --
 kernel/unwind/Makefile                        |   2 +-
 kernel/unwind/sframe.c                        | 408 ++++++++++++++----
 kernel/unwind/user.c                          |  40 +-
 21 files changed, 749 insertions(+), 206 deletions(-)
 create mode 100644 arch/arm64/include/asm/unwind_sframe.h
 rename arch/x86/include/asm/{unwind_user_sframe.h => unwind_sframe.h} (50%)

-- 
2.53.0.1213.gd9a14994de-goog


