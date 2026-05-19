Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D62CD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 08:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kSFThGuCuGJkcernOW97Ikx5o82bS8XwRL4VuiLdL4k=; b=Hjgm8ngUANZFQUv/j4xBEt1Y8J
	mq0/fWfwSIgw22N8E2fmdBzRYcWEs/VuJ91eoG+2PqGqR6bneF+W4nkkfY3p90/tsvFH1ux2tKbjd
	m30fOyLPXgH45Qml4fNP0stVenR8HT3OXYZSV9g2YUWaekUhJf51wPbl4zOvNdZ6n8gC5TQa9hsy5
	S9XyiVs17tyklSeo3cISNhUHXodgwpTIpwseqIKqJia0hNzdKuRnbmxQLwo/1ZU3ev2uK/AqWT5y7
	r/V6IdpAUXBJSAVk6sbJYJRiztU+at3VhDrDVRulNaBX7qLa0tQfmjRpxFfQHgwCobjfUFsO0ZeKw
	c5rVx6rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEHI-00000000OTa-3D16;
	Tue, 19 May 2026 06:50:08 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEHF-00000000OSW-1sBK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 06:50:08 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-82f6a5b4f88so5420097b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 23:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779173404; x=1779778204; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kSFThGuCuGJkcernOW97Ikx5o82bS8XwRL4VuiLdL4k=;
        b=KBS/haierLjOV72bFjlft9n2FqbHXSxh03o4k35OELpvzH7074wR83dretvcXGNHSg
         5zGjcd/9xleDke5aYrtpiq7YYtsczKRLFwFcKz6Qgbsgx4WV4fTyLfmDYiceGIlQEFkN
         2DjHVe3lNXIsvLSBfrzZLmzUwgOCl95VNpJu2A5k8Tq/tDW+KfxE6c721Cr+u+UVtpbq
         Dy8x3EuZ9PEnjzM8Wvia6LkXOWdkro65sLdNnPnQcD7itxcqyYUyimBMtgM22G3k6hyy
         /W7dWuq2sYSPmd3n8MoxetjN/Gn7tXJH14iW4LKYc8Vze300eZWKrvv5lGxOvsGu4guD
         bOMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779173404; x=1779778204;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kSFThGuCuGJkcernOW97Ikx5o82bS8XwRL4VuiLdL4k=;
        b=rI2FDwMJs9NFmcweMuQR243x3J4IulDY5YhFS6TaSZYxrbncW862+s+cpQ7rqQfqFL
         pTPvo+qQvQsp1qpbQh4baBxS8TZ6xAXN49QlupuU/R/q90TKDbDg7Zx73ujFwAEZbKH8
         fHpzCgfhKFBR1Xgeg1EJ9W7L2lGe1EAQN4Q6vJPt1j52LHAWNcBT6HE0tnWExM5riaLa
         elc8lGvE2RJM6XaP+9hkpkXLyQRTrc91PDnGUU3QNR7b+4gX5xv1ATBfOisswEoG+iHS
         WpJEmYEeS5mdy7zdKZzrOv0KgthP1/lQOzrsnQP+dc45SkbAVO3poa7CxvVFw7qTaX38
         qXkQ==
X-Forwarded-Encrypted: i=1; AFNElJ9tqWExkYuw/l6xndnT26zXSwdDAVHjoCqtaMXkSE08s7jBAj5cdOH+Q5GLJm0d3KTJN55jkFEuHowAziMhttWg@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk8xcDoiIzUy7dy2k4clm2CGYPTEzB8VYQFcX/1UhynQ7sHQA4
	hBDIl+WwBsM+p/bnb/FNBNZikfOEnyMLqEqhd2ijT0tOAmqypwHKBGYZLz7Ebffngugm82kISb5
	d3j4n5W2JV6z9AFitet8uvQFU3g==
X-Received: from pfam20.prod.google.com ([2002:aa7:8a14:0:b0:835:687a:d19d])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2d8a:b0:82f:9d21:d352 with SMTP id d2e1a72fcca58-83f33aebdaemr18079357b3a.9.1779173403694;
 Mon, 18 May 2026 23:50:03 -0700 (PDT)
Date: Tue, 19 May 2026 06:49:41 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260519064950.493949-1-dylanbhatch@google.com>
Subject: [PATCH v6 0/9] unwind, arm64: add sframe unwinder for kernel
From: Dylan Hatch <dylanbhatch@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jens Remus <jremus@linux.ibm.com>
Cc: Dylan Hatch <dylanbhatch@google.com>, Prasanna Kumar T S M <ptsm@linux.microsoft.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>, joe.lawrence@redhat.com, 
	linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Randy Dunlap <rdunlap@infradead.org>, Mostafa Saleh <smostafa@google.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_235005_494212_235DBFAB 
X-CRM114-Status: GOOD (  17.25  )
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
v7.1-rc2. This full series (applied to the sframe/core branch) is
available on github: [4].

Ref:
[1]: https://sourceware.org/binutils/docs/sframe-spec.html
[2]: https://lore.kernel.org/all/20260505121718.3572346-1-jremus@linux.ibm.com/
[3]: https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git/log/?h=sframe/core
[4]: https://github.com/dylanbhatch/linux/tree/sframe-v6

Changes since v5:
- Rebase on latest sframe/core branch [3] (based on v7.1-rc2).
- (Mark) Drop CFI annotations from el1*_64_* entry functions.
- (Mark) Add CFI annotations for leaf functions in lib/ and crypto/.
- (Jens) Sort module FDEs at load-time, drop linear search method.
- (Jens) Fix mistake in module SFrame validation where temp copy is not
  yet embedded within a struct module.
- (Jens) Initialize debug info for kernel .sframe sections.
- (Mark) Move kernel-specific unwind fields to struct kunwind_state.
- (Mark) Drop SP from unwind state.
- (Mark) Rename unwind_next_frame_sframe -> kunwind_next_regs_sframe,
  add checks to assert a correct KUNWIND_SOURCE_REGS_PC state.
- (Mark) Drop unused flexible FDE handling.
- (Mark) Check CFA alignment to 16 bytes instead of 8 bytes.
- (Mark) For non-KUNWIND_SOURCE_REGS_PC state, drop the fallback to
  SFrame unwind if FP unwind fails in kunwind_next().

Dylan Hatch (8):
  sframe: Allow kernelspace sframe sections
  arm64, unwind: build kernel with sframe V3 info
  arm64, crypto/lib: Annotate leaf functions with CFI info.
  sframe: Provide PC lookup for vmlinux .sframe section
  arm64/module, sframe: Add sframe support for modules
  sframe: Introduce in-kernel SFRAME_VALIDATION
  sframe: Initialize debug info for kernel sections
  unwind: arm64: Use sframe to unwind interrupt frames

Weinan Liu (1):
  arm64: entry: add unwind info for call_on_irq_stack()

 MAINTAINERS                                   |   4 +-
 Makefile                                      |   8 +
 arch/Kconfig                                  |  27 +-
 arch/arm64/Kconfig                            |   1 +
 arch/arm64/crypto/aes-ce-ccm-core.S           |  12 +-
 arch/arm64/crypto/aes-neonbs-core.S           |  40 +-
 arch/arm64/crypto/ghash-ce-core.S             |  20 +-
 arch/arm64/crypto/sm4-ce-ccm-core.S           |  16 +-
 arch/arm64/crypto/sm4-ce-cipher-core.S        |   4 +-
 arch/arm64/crypto/sm4-ce-core.S               |  44 +-
 arch/arm64/crypto/sm4-ce-gcm-core.S           |  16 +-
 arch/arm64/crypto/sm4-neon-core.S             |  12 +-
 arch/arm64/include/asm/linkage.h              |  30 ++
 arch/arm64/include/asm/module.h               |   6 +
 arch/arm64/include/asm/sections.h             |   1 +
 arch/arm64/include/asm/unwind_sframe.h        |  54 +++
 arch/arm64/kernel/entry.S                     |  14 +
 arch/arm64/kernel/module.c                    |   8 +
 arch/arm64/kernel/setup.c                     |   2 +
 arch/arm64/kernel/stacktrace.c                | 222 +++++++++-
 arch/arm64/kernel/vdso/Makefile               |   2 +-
 arch/arm64/kernel/vmlinux.lds.S               |   2 +
 arch/arm64/lib/clear_page.S                   |   4 +-
 arch/arm64/lib/clear_user.S                   |   4 +-
 arch/arm64/lib/copy_from_user.S               |   4 +-
 arch/arm64/lib/copy_page.S                    |   4 +-
 arch/arm64/lib/copy_to_user.S                 |   4 +-
 arch/arm64/lib/memchr.S                       |   4 +-
 arch/arm64/lib/memcmp.S                       |   4 +-
 arch/arm64/lib/memcpy.S                       |   8 +-
 arch/arm64/lib/memset.S                       |   8 +-
 arch/arm64/lib/mte.S                          |  28 +-
 arch/arm64/lib/strchr.S                       |   4 +-
 arch/arm64/lib/strcmp.S                       |   4 +-
 arch/arm64/lib/strlen.S                       |   4 +-
 arch/arm64/lib/strncmp.S                      |   4 +-
 arch/arm64/lib/strnlen.S                      |   4 +-
 arch/arm64/lib/tishift.S                      |  12 +-
 .../{unwind_user_sframe.h => unwind_sframe.h} |   6 +-
 arch/x86/include/asm/unwind_user.h            |  12 +-
 include/asm-generic/sections.h                |   4 +
 include/asm-generic/vmlinux.lds.h             |  15 +
 include/linux/sframe.h                        |  67 ++-
 include/linux/unwind_types.h                  |  46 ++
 include/linux/unwind_user_types.h             |  41 --
 kernel/unwind/Makefile                        |   2 +-
 kernel/unwind/sframe.c                        | 419 ++++++++++++++----
 kernel/unwind/sframe_debug.h                  |  13 +
 kernel/unwind/user.c                          |  45 +-
 49 files changed, 979 insertions(+), 340 deletions(-)
 create mode 100644 arch/arm64/include/asm/unwind_sframe.h
 rename arch/x86/include/asm/{unwind_user_sframe.h => unwind_sframe.h} (50%)
 create mode 100644 include/linux/unwind_types.h

-- 
2.54.0.563.g4f69b47b94-goog


