Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE9EC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 13:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iMVkt8VvD9u0w9McePyp8QpG5OxxVEdJnPN4xngSa2I=; b=oYe60vJX7hGPe4TtsXq2uxKb3K
	CWhFvY6T0T7o3JO0+H95Yl5FdMgrpnOsJBgkWet6tcVSd879Oi5vKoOLWlYUNQ/dexBMSlQT9/Ywj
	7ko0pTERA3ZNQy91QD7eOqiQXmSfjKAYjOhYsxh5j7QXhhuoAKwjVVVbrBomWn19PCVA7nkGqkbCq
	cMrUCs1jIxUrwQPAyEQvwxWtT+BQid5Hp3v+Xw8rWMQXYG9QdB2zDk81+lkp5Y+OR/vnvIu9B+3j0
	5O09fhSXhElFsVBu/5jxQEeE85lzZRlJm9GephwnTZAWFiCiFfG4uwBBApYDX3JDuIKC/+6qW0657
	039jnpog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoPW-000000086mS-2xfX;
	Wed, 05 Mar 2025 13:03:42 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmdc-00000007oKc-3Oun;
	Wed, 05 Mar 2025 11:10:10 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2f9d3d0f55dso10728412a91.1;
        Wed, 05 Mar 2025 03:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741173008; x=1741777808; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iMVkt8VvD9u0w9McePyp8QpG5OxxVEdJnPN4xngSa2I=;
        b=UNA8wkxZMYX+7jQsRaSpx2Wa1HVbLqlcCxnE1yriLVy698TSvTrRGgRwOwSEvzbgPm
         HfTCEnDQT8i6o/ixNuHw7cHeCUjvitslOlridjycCk64g+cpfI6KHMwDJySh8FxHaEHA
         orDV8NZTN2IqdDdZoZhU9yUYDwuLZ6S3xAro6YR3noe8lZDehVEHrPUKDViYTmSOqWJZ
         31Y+MkJ8gvPV1yBJS8NsLfS1nkIZeibnbuwE1zt2anFYkO3w+B2DSnZZqXDKhx5I+Rt0
         DBzRMtjrH02WJYTHxsXEdjWwT5kxhNfCe7Of7SCNkZUtgr/R6EUvuK5blG9gq3nmclyb
         5/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741173008; x=1741777808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iMVkt8VvD9u0w9McePyp8QpG5OxxVEdJnPN4xngSa2I=;
        b=YoMaDsyyiYA7NxyaOtmDTAFjfge5Zjn/KSpYysIUgdeOdH5cOIHpK1IUd3tSq94yA7
         +/iXgWMUkQj7nrz4gnpcy15wgzlyw5rpoUTY8Nd+pe+1RiX8aTphmB4veznCkxPZbvmk
         NOOLkq8zkt+La5UT3ngRMBiRF5ZHwy6nAASmNcC1WDBSc3XGFq9jlkTNUsAV9Ujaziue
         r7xrABxcSffNcJJMUrEi81V5gyuAh290bVqYDtGe/utdZoyuQmtdi3Vj3wxhAS10ppKh
         MBvPX+YY+XDqzWccTD6oG0MY35gMlKVQQSTj9bZKcY+meOz9lnuqfA4Pt7bS+OHcbIQk
         X2HA==
X-Forwarded-Encrypted: i=1; AJvYcCVp6dFhr28U2zDK6+eX1RWmfu3bz72veBGTTYzTfaDQas3thYySmsj42ezGnqMk8TGY4Rc7jBYMovqnD6s=@lists.infradead.org, AJvYcCWQZLw6HGuYc3kK0gXnwvuHqcBGDIaBssatqI/CvMmUWnJcBzP3hvX9tWF66t8Y0YwEILp9MqoKzIQnkNaAs2FI@lists.infradead.org
X-Gm-Message-State: AOJu0YwphNSp9PZxlK1i3qNMu/7hH0n56QjB2nSRE8pJVGSz5e5U5Bug
	0uuVMgWOIPGZ/Yq+gUPQbAQfBcHzI5obGeywsVWexcetH0Q274BM
X-Gm-Gg: ASbGncsqwWFMJNI1uG3mGyMFhKA9JMRNWZgrRnKk90N3v/KFnLZsT0HLJaeHa/7V7pj
	86x4OM1URqchg5j16adUI31L4Yhc8QNv4LbdmR54cXJqFD0dKPKpyJnRpDNh/CWcUwvAh4vPJ18
	ngNXq67CVX4MggKZKrqEmqYUDxEzDwBawbYNZ1AVVIb250gZoCocrUrh/ID2nB7WJuHjEcdSi5q
	11Xju/G759mFRJ3hC1cPndkyt7f0xTQG+ZACayVtheQILBOo7uxj+BAZXMSeTlGqrOK1JlTEFUn
	3WOewFMH3dR5VAcz76x5DYtsS4RUQb0ulrOTrZum7xDPT6QFFrfyRvjdGSLGhlJipGq4W2GZrIq
	pg4B7/qP8LJm1LeVEY56u9Q==
X-Google-Smtp-Source: AGHT+IFluiMV7JrX1O1X/v1UbVS/X37LSME/ig8/X1xAoOdMRtTxpinwMPddXbT0s26nxPYJt9KENA==
X-Received: by 2002:a17:90a:d2c3:b0:2ff:502e:62d4 with SMTP id 98e67ed59e1d1-2ff502e645cmr1921672a91.32.1741173007728;
        Wed, 05 Mar 2025 03:10:07 -0800 (PST)
Received: from mew.. (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e7737a5sm1060925a91.13.2025.03.05.03.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 03:10:07 -0800 (PST)
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
Subject: [PATCH v4 0/4] rust: Add bug/warn abstractions
Date: Wed,  5 Mar 2025 20:08:10 +0900
Message-ID: <20250305110814.272792-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_031008_846569_6DB7276C 
X-CRM114-Status: GOOD (  17.21  )
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

The change for LoongArch assembly hasn't been acked yet so the v4
doesnt' include it. LoongArch still uses the current approach; just
wrapping C's macro.

UML doesn't use the assembly BUG/WARN feature; just wrapping generic
BUG/WARN functions implemented in C works.

The last patch adds warn_on implementation on the top of the
abstraction. To make the patchset easier to review, the remaining
features such as bug() are not included in this patchset. These
features will be added after this patchset is merged.

This has been tested on x86, ARM64, and RISC-V (QEMU), with only a
compile test performed for LoongArch and UML.

v4:
- added Acked-by tag to the RISC-V and ARM64 asm change
- simplify the asm code
- use the cfgs on the macro rather in its expansion
- use a const fn for bugflag_taint over macro
- dropped LoongArch assembly change
- dropped warn_on_once; make the patch easier to review
v3: https://lore.kernel.org/rust-for-linux/20250213135759.190006-1-fujita.tomonori@gmail.com/
- rebased on rust-next
- use ANNOTATE_REACHABLE macro (replaced ASM_REACHABLE)
- added Acked-by tag to the x86 change
v2: https://lore.kernel.org/linux-arm-kernel/20241218062009.2402650-1-fujita.tomonori@gmail.com/
- remove target_arch cfg by using asm comment
- clean up the changes to loongarch asm
v1: https://lore.kernel.org/linux-arm-kernel/20241210001802.228725-1-fujita.tomonori@gmail.com/


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
 rust/kernel/bug.rs                            | 113 ++++++++++++++++++
 rust/kernel/generated_arch_reachable_asm.rs.S |   7 ++
 rust/kernel/generated_arch_warn_asm.rs.S      |   7 ++
 rust/kernel/lib.rs                            |   1 +
 10 files changed, 222 insertions(+), 47 deletions(-)
 create mode 100644 rust/kernel/bug.rs
 create mode 100644 rust/kernel/generated_arch_reachable_asm.rs.S
 create mode 100644 rust/kernel/generated_arch_warn_asm.rs.S


base-commit: beeb78d46249cab8b2b8359a2ce8fa5376b5ad2d
-- 
2.43.0


