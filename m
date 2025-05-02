Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711DEC3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 09:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4pbJ3W6acVlDXwhP+g5301nbrsGq3ivMaM+7WgKEfvs=; b=sn6VRVXZQoYCqHw3IM2W/h9dtl
	E69lTBFzr9gqT5PzSpCysQsVtlxoqRrwA9vmzzRI1bS3kiSnINDARlTsnpVYfA09/U27kOlyTlNwL
	jt5zWwx42KrjbOFDIBhPBYg8VrXMbtEgQRCyPJh+ulBKgHY/6X+ZrW+8TJQJCPnxrIf8Usoq/ENvF
	lN8Wuk6G0YMcWyEFt4KJXdwfX1oja8LZzU2d/dJpsbPFbjMarM8nNZ8APTIQrJ/WqNbBo7XxhPmKA
	K9RsUQt5xMG9MGhKX+tSBeJlPRT8qwwz10WHzpWwF5B9q0SthO1PNP/xMTuHj1yv6VUWGtkKvwHO7
	wPWFTMaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAn0E-00000001PKO-47hu;
	Fri, 02 May 2025 09:48:18 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAmyG-00000001Odl-2SMn;
	Fri, 02 May 2025 09:46:17 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2264aefc45dso29498225ad.0;
        Fri, 02 May 2025 02:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746179175; x=1746783975; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4pbJ3W6acVlDXwhP+g5301nbrsGq3ivMaM+7WgKEfvs=;
        b=eFlqiSBFTJpA7UW43SLZbyGIAaJw141dSCw3juEuzlz+yAEKr7bdZptpArpLvmpx3X
         yETjsREZwwdSGaWgMiFNkUTp8z2UqYgaNgGy5cXf3zXHRwmRHg9q4WuzXxrmiEIykFm7
         cZcXdleRMARDluZCeuKKjBqNDo1tcufCsXqeJOmiZwbiN7oeQ8UuaW2VJu4lNOt+9vxy
         /GJcJRgdvLHzCEdKIK0JVkyLAkoWH1HPwPC5+vRYigQlgcpetuejWo7E7X2GE5ETeBSP
         RGPFmOoc9z4RcFRySEfOJb8xoLOCqMHc6GL+x/FfKEgbn6JoJCIj/BI2vssBIOwYkGGG
         7WIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746179175; x=1746783975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4pbJ3W6acVlDXwhP+g5301nbrsGq3ivMaM+7WgKEfvs=;
        b=HQO5kA2GMX3BDDaJqqBG2QgfmYVCOwzmCPUZCC+l1AEMjul2iZVuIwiR5dZW+cvYdJ
         RKZskR530CsADise50Dn6dRbdq7cokTWudRm2IKQcorpq2caHb56dlpjhlnbDoFZxz4Y
         PBUeYaOR/S3BM2BzIOXQzDjKGZNgk/PG490w9XQw3hEgN9MZZB2GgWZxLnVu0RCzhqCx
         tStgHGM/G5TloTviKyBToI6h1dzxY1R3sZQp869MbcyqfVp9XxPUvU3xnb0V9WwtCqu4
         Hza+ODkonSI0Y1C9O4dc5KQcxAamdChKXDZ/Bdt1rN1TsTdLBGDsVg+2lXGv1oUMRgdX
         rU5A==
X-Forwarded-Encrypted: i=1; AJvYcCVGHNLojSZiZD2z45MO1Jovgf25TdeFjrmIPuCkGmvLhsglMCLnFK0l8rRwjCbWhUJn8h/KjmuHvNBZn0M7qVcK@lists.infradead.org, AJvYcCXVkHEVDTIT7k21zQGXQ6EF1if2OwAIRGqI2oIz/8yeK3TcMBymaDGzvujYwJdkuL7I7POB+u0ksCNCpfE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2kWgUQljHHB1hrCEzmoXFD+Z7CgrKjlZ3eiWF2ejGZxfuMwAQ
	Js8F/ryH3Vwd+L4szm8B2ArgorDIPh5i7tWKZJ+MLVmmStWNw8eO
X-Gm-Gg: ASbGnctIudCXRBFwuxF+1hb9qyQAJoaSPS/NHasnjwpiFV11j5K9y/cxZpKZT37zBCY
	TCsMvJ4t/oM4bFHvVxQsAvSEzODgBXROHVcwWtW3fT9iKrxU7bc3HR5LjU0nXWpH/dtRgceFV4z
	BI+j5ti8aMBgJ7lVrfwWoKvD9anaBpCEACG9XxNmlBnwTSLlm+0sk2GNoqu+em11ruSy31m/FhL
	IySmuG0YBgiMxITPLlzyoxA8lcomoYBXIRGwCHOoW61ytftTsWe3O9vRrJP4dlVd7oMRGT01lKv
	8qWvtGGxPru3cyXWYIFAVRvjOGjZoHwmtLfBGn/j2tOVyF7g/Zj64nTM8l6yYnrUniOwR/ZuWWk
	mlGqMyN54izfY6xQM9g==
X-Google-Smtp-Source: AGHT+IFCrNB3SEcUQSA4UULBWiPKSjzAq293G3JdHTwJkUqWADHaR7n7tHS0qoEezDF6fogaeNgeTg==
X-Received: by 2002:a17:903:2ec3:b0:224:f12:3734 with SMTP id d9443c01a7336-22e1030ba06mr31764015ad.30.1746179175181;
        Fri, 02 May 2025 02:46:15 -0700 (PDT)
Received: from mew.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151eb166sm3273565ad.96.2025.05.02.02.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 02:46:14 -0700 (PDT)
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
	tmgross@umich.edu,
	dakr@kernel.org
Subject: [PATCH v6 0/4] rust: Add bug/warn abstractions
Date: Fri,  2 May 2025 18:45:32 +0900
Message-ID: <20250502094537.231725-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_024616_624486_5C91E351 
X-CRM114-Status: GOOD (  19.74  )
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

No change for ARM and LoongArch; they still use the current approach;
just wrapping C's macro.

UML doesn't use the assembly BUG/WARN feature; just wrapping generic
BUG/WARN functions implemented in C works.

The last patch adds warn_on implementation on the top of the
abstraction. To make the patchset easier to review, the remaining
features such as bug() are not included in this patchset. These
features will be added after this patchset is merged.

This has been tested on x86, ARM64, and RISC-V (QEMU), with only a
compile test performed for LoongArch, ARM, and UML.

v6:
- improved SAFETY comments
v5: https://lore.kernel.org/lkml/20250409065802.136971-1-fujita.tomonori@gmail.com/
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
 arch/x86/include/asm/bug.h                    |  56 ++++----
 rust/Makefile                                 |   8 ++
 rust/helpers/bug.c                            |   5 +
 rust/kernel/.gitignore                        |   2 +
 rust/kernel/bug.rs                            | 125 ++++++++++++++++++
 rust/kernel/generated_arch_reachable_asm.rs.S |   7 +
 rust/kernel/generated_arch_warn_asm.rs.S      |   7 +
 rust/kernel/lib.rs                            |   1 +
 10 files changed, 234 insertions(+), 47 deletions(-)
 create mode 100644 rust/kernel/bug.rs
 create mode 100644 rust/kernel/generated_arch_reachable_asm.rs.S
 create mode 100644 rust/kernel/generated_arch_warn_asm.rs.S


base-commit: 9d7a0577c9db35c4cc52db90bc415ea248446472
-- 
2.43.0


