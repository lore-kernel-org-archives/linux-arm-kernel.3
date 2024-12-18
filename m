Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273FDE77183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 06:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwlBx0jrzaKTcJ0dbZncCuW6nwSfqkNTYDsslGfubt4=; b=MiX8yR9/mIedfxJNUWNWWNYWjI
	oIAlvmXunpietPp8CdZr4qWNUTINVAZB+0uahXRhB4Qh0hkvB4xajA0jA448eCmimbfxRDVkjceAY
	LIrEr28Wat4YaAYNukIhNWX5e1WGIHW8KLOOCceTo+f+YvBH1HS3+jvrWk+EBAK76AtBjKEHTWszS
	rI/lE242a2uDMRDSiuzr6x4D3Cnc5nB8T1YZRhitxKN4cnR13TPQ1Yqj8m+fE73sRlSJdwam10V1R
	D6NDTBl3XBsavTTcD8J9jBM2jncuuTkpBmRTyIv+Kua0wuQdBAA+moBTPd6CjXMx8CGn+5Ub30tKp
	AMUQOBvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNnXA-0000000Fivx-0mwZ;
	Wed, 18 Dec 2024 06:27:48 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNnR8-0000000FhHz-0CAg;
	Wed, 18 Dec 2024 06:21:35 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-725abf74334so5365112b3a.3;
        Tue, 17 Dec 2024 22:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734502893; x=1735107693; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwlBx0jrzaKTcJ0dbZncCuW6nwSfqkNTYDsslGfubt4=;
        b=LaLAjpaE+ejg6IxH+tXbVyBx/KxN51IhZ5fOkhESn80tFesFrevEfoynZd00W4RI/i
         VMK8ShvQXCQdp0b7ny2Bft89QdBLkyIH8NFgkhIl6DL/jagdD+bVIXCCR1spFKKHYiuF
         mlok/yu/LBO6kGuJobzkjeVHzNa/4L2P0Sb9uMSw7e/W8Zy5JIA9T3SJyeM01cAUUdNY
         6QcFL/FolFISM7oYM+u/bTvItw4TmJjqgvw8rIRHksEBblcCV0dJicbct/u6TqRvu2YR
         sZXBDVSvp2RAnmaMbp8MeqJQBA98VHguoNUqNRfU2E+/YcWZe1SinRbU0RRh7TAW9zWr
         flRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734502893; x=1735107693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwlBx0jrzaKTcJ0dbZncCuW6nwSfqkNTYDsslGfubt4=;
        b=EJFeaHofjxj4bOTOjTU376mKL/5KbG/y2nH875uSRVH4JKzlk9fcYa3LKddtescKVC
         6TiH5z+aa9Ut9rEHTs5WBWBIeveBd1o2+MX1NETYGhCk2X+LVrC+JZIjSZIIiU+V29e6
         uuZSZH7rteMozt/IbPbcZC4+W/nua5KBF2F/CZ1di2QLAa0VEkbMvq7ntBj1EtcEjY08
         ccRdQWX9rNcZWITm1WaKy9rhWV8tFyEbEOYXTqaZb9bMqG82lK5MlW2AR26aBYzdY3Kl
         x/iEx4thBI07SCHVtZooCJUIdXAHlPEWcxVGhWPbvGQkQq0G23nunSlfEMMDLWAJ1Goq
         ZSuA==
X-Forwarded-Encrypted: i=1; AJvYcCXJx5jzWf9bptS95UrsWmorT/aMPHnbgWzoGXV5k17uvTLIyW35W9UWp4khGoz81c83T4tYNODul0JAR+U=@lists.infradead.org, AJvYcCXQOnaAgdxcRj1/QV+Bn3Lzw7ZntZuTcMCRoSWtWCk4/5Jlpq2Dxu0F5FnyZrowmqNHzwM0KK0ev1e+9ONW2pos@lists.infradead.org
X-Gm-Message-State: AOJu0Yxlk+pM62IegYMMbJtD9VCqRYZm7Br9ne4Y1dZoYI9t69NQxiY9
	i8un8SsJOr396aPOos2F6aHoEUpV3UpVh5S5PqlyIU1ExPJl4uKj
X-Gm-Gg: ASbGncuyN/gBX6L1xuk5olRzYhcsXvefUKXyT9mEcdxfBvwEcjFTCHppyqFcWjl9tzY
	iY4qs6i5HMLYi6Os9T8c4vVX0sZ96WZqgjRjmJCwDj0gFEYeyMb0zP3b1rz4/KIIC+5L1yqfNGb
	3bFW9CDY2CT+lluNm7b/QylrFGX7T3UpuAGsXdBA7KarwfoqzMuQ/cPqYbtNdA0pweu2CZXFuVj
	cMJ+RYkvq8Wnk+Ec9ovxp6Ejv5fWuLyoz9L5bVhqSXTJ/dN72jNpa8RzmhgrE1N2+/DRlE3JBBF
	iAsj8GgHxSFIwpDRzQ==
X-Google-Smtp-Source: AGHT+IHQ4m+HWcjLQvuT9XztCDOhnw/Ackcq84+U+25p09X+uuYbWpONGNOHBq0tC1LQs8iHELt5MQ==
X-Received: by 2002:a05:6a00:44cb:b0:726:41e:b314 with SMTP id d2e1a72fcca58-72a8d2c3f2cmr2786241b3a.19.1734502893327;
        Tue, 17 Dec 2024 22:21:33 -0800 (PST)
Received: from snail23.. (p7659208-ipoefx.ipoe.ocn.ne.jp. [221.188.16.207])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad5bc5sm7987806b3a.69.2024.12.17.22.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 22:21:33 -0800 (PST)
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
Subject: [PATCH v2 5/5] rust: Add warn_on and warn_on_once
Date: Wed, 18 Dec 2024 15:20:09 +0900
Message-ID: <20241218062009.2402650-6-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218062009.2402650-1-fujita.tomonori@gmail.com>
References: <20241218062009.2402650-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_222134_090273_447F1D1F 
X-CRM114-Status: GOOD (  18.54  )
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

Add warn_on and warn_on_once macros. Wrapping the C's WARN_* and BUG_*
macros doesn't work so this uses the assembly code exported by the C
side via ARCH_WARN_ASM macro. Like the static branch code, this
generates the assembly code for rust dynamically by using the C
preprocessor.

file()! macro doesn't work for the Rust inline assembly in the same
way as __FILE__ for the C inline assembly. So the code to handle a
file name is different from the C assembly code (similar to the
arm64/loongarch assembly).

ASM_REACHABLE definition works in the same way to get objtool's
reachable asm code. The architectures which use objtool (x86 and
loongarch) needs it.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/Makefile                                 |   8 ++
 rust/kernel/.gitignore                        |   2 +
 rust/kernel/bug.rs                            | 100 ++++++++++++++++++
 rust/kernel/generated_arch_reachable_asm.rs.S |   7 ++
 rust/kernel/generated_arch_warn_asm.rs.S      |   7 ++
 rust/kernel/lib.rs                            |   1 +
 6 files changed, 125 insertions(+)
 create mode 100644 rust/kernel/bug.rs
 create mode 100644 rust/kernel/generated_arch_reachable_asm.rs.S
 create mode 100644 rust/kernel/generated_arch_warn_asm.rs.S

diff --git a/rust/Makefile b/rust/Makefile
index a40a3936126d..633b2c28605c 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -37,6 +37,9 @@ obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.o
 obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.o
 
 always-$(subst y,$(CONFIG_RUST),$(CONFIG_JUMP_LABEL)) += kernel/generated_arch_static_branch_asm.rs
+ifndef CONFIG_UML
+always-$(subst y,$(CONFIG_RUST),$(CONFIG_BUG)) += kernel/generated_arch_warn_asm.rs kernel/generated_arch_reachable_asm.rs
+endif
 
 # Avoids running `$(RUSTC)` for the sysroot when it may not be available.
 ifdef CONFIG_RUST
@@ -449,5 +452,10 @@ $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/build_error.o \
 ifdef CONFIG_JUMP_LABEL
 $(obj)/kernel.o: $(obj)/kernel/generated_arch_static_branch_asm.rs
 endif
+ifndef CONFIG_UML
+ifdef CONFIG_BUG
+$(obj)/kernel.o: $(obj)/kernel/generated_arch_warn_asm.rs $(obj)/kernel/generated_arch_reachable_asm.rs
+endif
+endif
 
 endif # CONFIG_RUST
diff --git a/rust/kernel/.gitignore b/rust/kernel/.gitignore
index 6ba39a178f30..f1d7f4225332 100644
--- a/rust/kernel/.gitignore
+++ b/rust/kernel/.gitignore
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
 /generated_arch_static_branch_asm.rs
+/generated_arch_warn_asm.rs
+/generated_arch_reachable_asm.rs
\ No newline at end of file
diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
new file mode 100644
index 000000000000..7ffd9cb1ad75
--- /dev/null
+++ b/rust/kernel/bug.rs
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// Copyright (C) 2024 FUJITA Tomonori
+
+//! Support for BUG_* and WARN_* functionality.
+//!
+//! C header: [`include/asm-generic/bug.h`](srctree/include/asm-generic/bug.h)
+
+#[macro_export]
+#[doc(hidden)]
+#[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
+macro_rules! warn_flags {
+    ($flags:expr) => {
+        const FLAGS: u32 = $crate::bindings::BUGFLAG_WARNING | $flags;
+        // SAFETY: Just an FFI call.
+        #[cfg(CONFIG_DEBUG_BUGVERBOSE)]
+        unsafe {
+            $crate::asm!(concat!(
+                "/* {size} */",
+                ".pushsection .rodata.str1.1, \"aMS\",@progbits, 1\n",
+                "111:\t .string ", "\"", file!(), "\"\n",
+                ".popsection\n",
+                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
+                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
+            line = const line!(),
+            flags = const FLAGS,
+            size = const ::core::mem::size_of::<$crate::bindings::bug_entry>(),
+            );
+        }
+        // SAFETY: Just an FFI call.
+        #[cfg(not(CONFIG_DEBUG_BUGVERBOSE))]
+        unsafe {
+            $crate::asm!(
+            concat!(
+                "/* {size} */",
+                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_warn_asm.rs")),
+                include!(concat!(env!("OBJTREE"), "/rust/kernel/generated_arch_reachable_asm.rs")));
+            flags = const FLAGS,
+            size = const ::core::mem::size_of::<$crate::bindings::bug_entry>(),
+            );
+        }
+    }
+}
+
+#[macro_export]
+#[doc(hidden)]
+#[cfg(all(CONFIG_BUG, CONFIG_UML))]
+macro_rules! warn_flags {
+    ($flags:expr) => {
+        // SAFETY: Just an FFI call.
+        unsafe {
+            $crate::bindings::warn_slowpath_fmt(
+                $crate::c_str!(::core::file!()).as_ptr() as *const ::core::ffi::c_char,
+                line!() as i32,
+                $flags as u32,
+                ::core::ptr::null() as *const ::core::ffi::c_char,
+            );
+        }
+    };
+}
+
+#[macro_export]
+#[doc(hidden)]
+#[cfg(not(CONFIG_BUG))]
+macro_rules! warn_flags {
+    ($flags:expr) => {};
+}
+
+#[doc(hidden)]
+#[macro_export]
+macro_rules! bugflag_taint {
+    ($taint:expr) => {
+        $taint << 8
+    };
+}
+
+/// Report a warning only once.
+#[macro_export]
+macro_rules! warn_on_once {
+    ($cond:expr) => {
+        if $cond {
+            $crate::warn_flags!(
+                $crate::bindings::BUGFLAG_ONCE
+                    | $crate::bugflag_taint!($crate::bindings::TAINT_WARN)
+            );
+        }
+        $cond
+    };
+}
+
+/// Report a warning.
+#[macro_export]
+macro_rules! warn_on {
+    ($cond:expr) => {
+        if $cond {
+            $crate::warn_flags!($crate::bugflag_taint!($crate::bindings::TAINT_WARN));
+        }
+        $cond
+    };
+}
diff --git a/rust/kernel/generated_arch_reachable_asm.rs.S b/rust/kernel/generated_arch_reachable_asm.rs.S
new file mode 100644
index 000000000000..4e65525e4464
--- /dev/null
+++ b/rust/kernel/generated_arch_reachable_asm.rs.S
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/objtool.h>
+
+// Cut here.
+
+::kernel::concat_literals!(ASM_REACHABLE)
diff --git a/rust/kernel/generated_arch_warn_asm.rs.S b/rust/kernel/generated_arch_warn_asm.rs.S
new file mode 100644
index 000000000000..8f239b431aa4
--- /dev/null
+++ b/rust/kernel/generated_arch_warn_asm.rs.S
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/bug.h>
+
+// Cut here.
+
+::kernel::concat_literals!(ARCH_WARN_ASM("111b", "{line}",  "{flags}", "{size}"))
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index e1065a7551a3..913f3a5b2a98 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -32,6 +32,7 @@
 pub mod alloc;
 #[cfg(CONFIG_BLOCK)]
 pub mod block;
+pub mod bug;
 mod build_assert;
 pub mod cred;
 pub mod device;
-- 
2.43.0


