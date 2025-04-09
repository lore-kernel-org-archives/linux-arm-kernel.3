Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FBEC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 07:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tuG1FMMyGEJx8Q/a143BVklY8otPVHsKGWCgeB32e5Q=; b=ZHMNezMOzjbPgkMOZoYhToK5ox
	Th8aazPRXY8nDbLCKzgQOkHBplxFx2G7+w1VLZMks+lAVC0Lt78D+0MJR6D0jfHjDtuM9FOFbmrCv
	dXD0fd9mcZaP8At0KgLGl1b+2YkClJ5jM55MVu7/j+KPOqrz0W2FQXgZjlj7KWm/7bLpt99tfnOr1
	MzG2qfdg7LCt1HWnVe+jBkW5XtsOzyeLcVFNwVuoZk2N3z9uu/EMSKz8lGcfoegWtNCE66GzX7SdE
	cYl/YyHGp7+ZwxH8GEglsaH5blmg2nECOhiJOWEtVvDr1YrCBEeXWv433plsQEQ2VQq/nAKxDXC/N
	7JSTLQ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2PQK-00000006LoI-2Lwa;
	Wed, 09 Apr 2025 07:00:37 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2POX-00000006LQD-0bRt;
	Wed, 09 Apr 2025 06:58:46 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-223fb0f619dso64648465ad.1;
        Tue, 08 Apr 2025 23:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744181924; x=1744786724; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tuG1FMMyGEJx8Q/a143BVklY8otPVHsKGWCgeB32e5Q=;
        b=LzaImnthYJwGDQ7o6aUVp9ZmRKvoPCcWFaryYn1ViPUCL8WgB4ljegZUdbltjdQiPM
         w4ku5Z5MdGWHXILxY2lebr15kRDPDeMjj9eRCTsXF70+2Yjg9cdDtvRlGs/r30oNjoRe
         xYSZ+jUFLSxpJZMuTdTh3lqea5MSLqw6F88WrwpXs6eteNI8s0HWv0xZjTnsz5/V2ze0
         K/SbAJzU6XNUQW1SQSlAOJU8wJ1t9TMYTXLzIktt1FxwnXVq6DdSwK2CANVcb1eDgidi
         UILZjbH/R+X1K3S+ZwAiIwkwB7HSNwU60+x8F07OkcdcC0dZycPf+zjIyO698OMtMfO1
         j2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744181924; x=1744786724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tuG1FMMyGEJx8Q/a143BVklY8otPVHsKGWCgeB32e5Q=;
        b=vNWhp4/1Lcel4frMWxep5BSdpspEM8sOllxSqj6AZ2DiW3XRAaofMbzAyAIGhgBy34
         unrJSLR2PkDF4EAf8309BvY39WrxNN+fJFQf6cCI/xqqLHiPmZYtrf9yMVxtb0bLKimi
         WUqs3QK7FJr7XNCVk3hMiyP9MDPlEd2LCtIVJ+Uk74Aep2BbHIgxMSIi4GhJt94HCvl5
         7SJ0UYQhS0BxOT6bfnXpRr+CzRRTthlzQh8luij7Q/Mi7Z/USJna/IaP52iV70fDc8LW
         Aj4bjOMXG7pBcgDCaSM+RLj3AA6GvSEmvnSoyQSUlmgw7DQBYYIRWkEXHdClrJyRxUH5
         /AVg==
X-Forwarded-Encrypted: i=1; AJvYcCV7gb01lVRkjflmSAQVosIflu42wuAk6U9L6JwoOuFKB09j8+Jx9PpsVwc/5NauGJg6fN3jZoQtqOEMBQk=@lists.infradead.org, AJvYcCXGCY4vqDcaGZvEsc4lTPIcNQUPLW9JHSuRz0kNZRv8V1fvMnsfP67++4zS28Fkc2BfHcat8l+VjkBAi/mxFM8C@lists.infradead.org
X-Gm-Message-State: AOJu0YznAhurMV5Uday5rMdu+EGnY/XKqUfAS/zReRTFhk3syc4xrM+T
	9yNjOfeNPY3j5HdsXoZ4DtiUaWLueC7mAGwT09ZDFqadYfGdZWxk
X-Gm-Gg: ASbGnctm09wVxqi4LVHD71LBocRPue3398XK3LK3ua6qh/Dyx2ilNA7ZAL7yNfm6KwC
	mTbiCKzNSIXxkh3AhzAqehjeaX2gIrsQpFaix1uwyGMrfY12LlX3x/TcZuRCTpNpB24yH9gQRDo
	qoj/9wvifG1PsuQfMm72us3sdPrSTVvleaffOPwKmZIiLIzt4pfSVUZJa6Ou7CuQxDv4ePW0bdJ
	FQhKcs2l+BS1g/akkrihcDTBAOmZtyh0Emk0d+RCH+bxBz7d9HmUfIaEE7t3pQUX1Z7UplmiurF
	2z7Q/2hxMu6kXWwVeLsfbUc/4xn6wBMl/DBYolCczhfOVf9f5bajphxzpuBJCDkuWz1R97ppRFN
	nNnbeZjZc9ieLbhAd+Q==
X-Google-Smtp-Source: AGHT+IG81noXBo50t3m2OCMXKg+0aYF1KMaorNM1Bcv25LP3aY0UkFvPSaDMXpFVTZFnE5FrkJ7rsg==
X-Received: by 2002:a17:902:ec8c:b0:215:89a0:416f with SMTP id d9443c01a7336-22ac29b86abmr21043375ad.30.1744181924161;
        Tue, 08 Apr 2025 23:58:44 -0700 (PDT)
Received: from mew.. (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb596sm4407815ad.220.2025.04.08.23.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:58:43 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: x86@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	peterz@infradead.org,
	hpa@zytor.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tangyouling@loongson.cn,
	hejinyang@loongson.cn,
	yangtiezhu@loongson.cn,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Subject: [PATCH v5 0/4] rust: Add bug/warn abstractions
Date: Wed,  9 Apr 2025 15:57:57 +0900
Message-ID: <20250409065802.136971-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_235845_180866_3E5A7C8F 
X-CRM114-Status: GOOD (  18.98  )
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

This patchset adds warn_on macro with the bug/warn abstraction that
utilizes the kernel's BUG/WARN feature via assembly.

Currently, Rust code simply wraps BUG() macro; however the approach
doesn't provide the proper debug information. For example, I added
bindings::BUG() to rnull's init method and got the following output:

# insmod /root/rnull_mod.ko
rnull_mod: Rust null_blk loaded
------------[ cut here ]------------
kernel BUG at rust/helpers/bug.c:7!
Oops: invalid opcode: 0000 [#1] SMP CPU: 0 UID: 0 PID: 31 Comm: insmod Not tainted 6.14.0-rc1+ #103
RIP: 0010:rust_helper_BUG+0x8/0x10
(snip)

The kernel's BUG/WARN feature (lib/bug.c) can only be used from
assembly. Rust code needs to directly execute the same assembly code
used on the C side. To avoid duplicating the assembly code, this
approach follows the same strategy as the static branch code: it
generates the assembly code for Rust using the C preprocessor at
compile time.

The 1st to 3th patches export the BUG/WARN assembly code for Rust on
x86, RISC-V, and ARM64 architecture, with no functional changes on the
C side. They have already been acked by the maintainers of their
respective architectures.

No change for arm32 and LoongArch; they still use the current
approach; just wrapping C's macro.

UML doesn't use the assembly BUG/WARN feature; just wrapping generic
BUG/WARN functions implemented in C works.

The last patch adds warn_on implementation on the top of the
abstraction. To make the patchset easier to review, the remaining
features such as bug() are not included in this patchset. These
features will be added after this patchset is merged.

This has been tested on x86, ARM64, and RISC-V (QEMU), with only a
compile test performed for LoongArch, arm32, and UML.

v5:
- fix indentation in the macro
- use $crate::ffi::c_char instead ::kernel::ffi::c_uchar
- add support for building on arm32
v4: https://lore.kernel.org/lkml/20250305110814.272792-1-fujita.tomonori@gmail.com/
- added Acked-by tag to the RISC-V and ARM64 asm change
- simplify the asm code
- use the cfgs on the macro rather in its expansion
- use a const fn for bugflag_taint over macro
- dropped LoongArch assembly change
- dropped warn_on_once; make the patch easier to review
v3: https://lore.kernel.org/lkml/20250213135759.190006-1-fujita.tomonori@gmail.com/
- rebased on rust-next
- use ANNOTATE_REACHABLE macro (replaced ASM_REACHABLE)
- added Acked-by tag to the x86 change
v2: https://lore.kernel.org/lkml/20241218062009.2402650-1-fujita.tomonori@gmail.com/
- remove target_arch cfg by using asm comment
- clean up the changes to loongarch asm
v1: https://lore.kernel.org/lkml/20241210001802.228725-1-fujita.tomonori@gmail.com/


FUJITA Tomonori (4):
  x86/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with
    Rust
  riscv/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with
    Rust
  arm64/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with
    Rust
  rust: Add warn_on macro

 arch/arm64/include/asm/asm-bug.h              |  33 ++++-
 arch/riscv/include/asm/bug.h                  |  37 +++---
 arch/x86/include/asm/bug.h                    |  56 ++++-----
 rust/Makefile                                 |   8 ++
 rust/helpers/bug.c                            |   5 +
 rust/kernel/.gitignore                        |   2 +
 rust/kernel/bug.rs                            | 114 ++++++++++++++++++
 rust/kernel/generated_arch_reachable_asm.rs.S |   7 ++
 rust/kernel/generated_arch_warn_asm.rs.S      |   7 ++
 rust/kernel/lib.rs                            |   1 +
 10 files changed, 223 insertions(+), 47 deletions(-)
 create mode 100644 rust/kernel/bug.rs
 create mode 100644 rust/kernel/generated_arch_reachable_asm.rs.S
 create mode 100644 rust/kernel/generated_arch_warn_asm.rs.S


base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
-- 
2.43.0


