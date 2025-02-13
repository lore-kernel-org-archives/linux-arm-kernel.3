Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8818C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 14:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+y6Ck4nUrrnZ5J/UDrnc3xAlfWqC0MtemaHjWH6P0w=; b=Umxl4PpzNhi2x+GnsTzetx/adE
	1XncpoODsUcSWPmkhSeGenLbFQ82CAEDg2HXWF+oEJYMziE+1PMV0FZjZJIhdtcfFWP7NpfB8hQlp
	3VR6DCP9UcSKxGUliriG1XgMnX7nsoSbATy8oPersIqEcptD0lfPPUlcDQaHztmi5KN+EP+Bw/OT4
	RvO3EMOXkBSGHJugfozMIvTa+A6lGm5WaCa2QCYp1a3OGqDe0FSfpRxCV5tI1eMrJEMMeVYdVnMdt
	BbJ1Zt1Hxo9lD6V4j5mFl2a3PtXcC9cllZ/3kiU8k7UWzUkBALow3IBZ4RLiO/bDyWUGlvA1rREJA
	gkYhwq9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaIF-0000000BKxn-18Zh;
	Thu, 13 Feb 2025 14:34:19 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZlx-0000000BErr-140b;
	Thu, 13 Feb 2025 14:00:58 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21f2339dcfdso13651585ad.1;
        Thu, 13 Feb 2025 06:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739455256; x=1740060056; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+y6Ck4nUrrnZ5J/UDrnc3xAlfWqC0MtemaHjWH6P0w=;
        b=F6hKg1hepcsolwrF//h52n0v6WhLO+4yckdloQ2c3qMJgel0a6eoZj36ZVtrDfeenc
         NsAEGj8hDfgBcT9Ze8WaDspzHQrlBhzY+QWzwhM0GzQLyX0YHZAuys//9auvR0JABSa9
         xpKf/hYwvnepfBtKJIvI3PDRuP82TCTjQbusaLnhfpMG5fjOigXmKkulY/tC8GcxF3fG
         okKPu+2OXLQXRLxxtDnKL0zQvtEJ2ILGdjdAmysxw3M2UAQcs0wkzZzWsGs668Gk0YwT
         S/kOlmrTAS/jx+PWPv/hRHAMPGFZ3a2MN766cvfyAvD6fBMCsCXhzVMsT8KIo2dfToaC
         Ngyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739455256; x=1740060056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+y6Ck4nUrrnZ5J/UDrnc3xAlfWqC0MtemaHjWH6P0w=;
        b=drSQ+hbiAnhOyXTKVWVsclAK+cqiXbU+HL62MeE0RW0zw50MFMIhUDu3iEB5+M2l10
         wqynW/voHpZ7IoNLtJ+N22RHEuO1yYlpbU3+9EpbMVtIQuX/kWx5KoS9mPWEpEjDgorL
         PB7nr6OhIN+jkL9B0A3lWQE5ud27if93/uD1ZKoa5EYLqjDhNbkRZiSfU2O3wy3IhTlq
         tpOy4i3VCY4ayux3WR6GynMQxtGtI6uWlBQiL58b29oEONxwU5GiZSQDFvylcbYStRUV
         cnXsU5+ct/xZU24IlTYOLrkEJ/7xNIumqLAWmRBf0DNRNgSjXyibfPkkloqnayolWvjD
         Odlg==
X-Forwarded-Encrypted: i=1; AJvYcCWbY+lr7dvqXx/pjvTE5t5XTSaf94virQWDUwgIo+ege2EXr+/Qj7xURT3yq69hF/iM8PXKpdvufX2O8so=@lists.infradead.org, AJvYcCWq9blNFASzFrD+6udLtCQUXiN/yw3HPHg+AB2YDbuqyIwnKcPgxqn7iQLJYiIpp0haWKaVmuu9Mv9bQaQJWo06@lists.infradead.org
X-Gm-Message-State: AOJu0YxPEHazqyKgEuX9ra5bm1dgMn0+Ohp9uHuM7UOW+xIqqeLS0XLl
	wcE9e+YqbBidtdZfiQZA6oFpzXUefZvHCIKQQFZToxsDyTfDHVBE
X-Gm-Gg: ASbGncsAZ/o5JNKFmGwZiLLkkQS6Vt18Effcf5V6gkwfybmgpYovVFAnQQEdm9FCY+V
	3HfKGm8yfjN10ChuXSGSfbAzSnFEjzX3OKR+8DGs41QU93XG+ZiKXlp8WfAX7nM4BmzkvT8qB+2
	RDPtaGe4RjlrYmCFywEoIHptCP2YaHqWE9KOoBO45SFp2hIb2qJuuCN03clxKWIvLjH1RKftMN1
	MQznvPCN/L+PDAnKn6OsDXr3MxovWHl8lTfWnUjjTxOuXvxJhJA4+fGKQpKpdNOI/J52okb03PF
	GqTMCe9Vc/+sDf8/vj5E6XRh7F68r6J6hNO+CUUG8b1/oj15t4JTeYBVfOmV55slFQc=
X-Google-Smtp-Source: AGHT+IH1Zqo9tPEvVGN2+sG3MuJAeMqjgEOo7xAq67fk4VjOAgBOooytYfL4WucnOp0CvNreEK3WqQ==
X-Received: by 2002:a17:903:94b:b0:220:cfb7:56eb with SMTP id d9443c01a7336-220d376f061mr46259805ad.26.1739455256258;
        Thu, 13 Feb 2025 06:00:56 -0800 (PST)
Received: from mew.. (p3882177-ipxg22501hodogaya.kanagawa.ocn.ne.jp. [180.15.148.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d55858d6sm12565225ad.223.2025.02.13.06.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:00:55 -0800 (PST)
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
Subject: [PATCH v3 2/5] riscv/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Thu, 13 Feb 2025 22:57:56 +0900
Message-ID: <20250213135759.190006-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250213135759.190006-1-fujita.tomonori@gmail.com>
References: <20250213135759.190006-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_060057_301104_7A50A024 
X-CRM114-Status: UNSURE (   8.97  )
X-CRM114-Notice: Please train this message.
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

Add new ARCH_WARN_ASM macro for BUG/WARN assembly code sharing with
Rust to avoid the duplication.

No functional changes.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 arch/riscv/include/asm/bug.h | 37 +++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index 1aaea81fb141..6ab13b56feb0 100644
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@ -31,40 +31,45 @@ typedef u32 bug_insn_t;
 
 #ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
 #define __BUG_ENTRY_ADDR	RISCV_INT " 1b - ."
-#define __BUG_ENTRY_FILE	RISCV_INT " %0 - ."
+#define __BUG_ENTRY_FILE(file)	RISCV_INT " " file " - ."
 #else
 #define __BUG_ENTRY_ADDR	RISCV_PTR " 1b"
-#define __BUG_ENTRY_FILE	RISCV_PTR " %0"
+#define __BUG_ENTRY_FILE(file)	RISCV_PTR " " file
 #endif
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
-#define __BUG_ENTRY			\
+#define __BUG_ENTRY(file, line, flags)	\
 	__BUG_ENTRY_ADDR "\n\t"		\
-	__BUG_ENTRY_FILE "\n\t"		\
-	RISCV_SHORT " %1\n\t"		\
-	RISCV_SHORT " %2"
+	__BUG_ENTRY_FILE(file) "\n\t"	\
+	RISCV_SHORT " " line "\n\t"	\
+	RISCV_SHORT " " flags
 #else
-#define __BUG_ENTRY			\
-	__BUG_ENTRY_ADDR "\n\t"		\
-	RISCV_SHORT " %2"
+#define __BUG_ENTRY(file, line, flags)		\
+	__BUG_ENTRY_ADDR "\n\t"			\
+	RISCV_SHORT " " flags
 #endif
 
 #ifdef CONFIG_GENERIC_BUG
-#define __BUG_FLAGS(flags)					\
-do {								\
-	__asm__ __volatile__ (					\
+
+#define ARCH_WARN_ASM(file, line, flags, size)			\
 		"1:\n\t"					\
 			"ebreak\n"				\
 			".pushsection __bug_table,\"aw\"\n\t"	\
 		"2:\n\t"					\
-			__BUG_ENTRY "\n\t"			\
-			".org 2b + %3\n\t"                      \
-			".popsection"				\
+		__BUG_ENTRY(file, line, flags) "\n\t"		\
+			".org 2b + " size "\n\t"                \
+			".popsection\n"				\
+
+#define __BUG_FLAGS(flags)					\
+do {								\
+	__asm__ __volatile__ (					\
+		ARCH_WARN_ASM("%0", "%1", "%2", "%3")		\
 		:						\
 		: "i" (__FILE__), "i" (__LINE__),		\
 		  "i" (flags),					\
 		  "i" (sizeof(struct bug_entry)));              \
 } while (0)
+
 #else /* CONFIG_GENERIC_BUG */
 #define __BUG_FLAGS(flags) do {					\
 	__asm__ __volatile__ ("ebreak\n");			\
@@ -78,6 +83,8 @@ do {								\
 
 #define __WARN_FLAGS(flags) __BUG_FLAGS(BUGFLAG_WARNING|(flags))
 
+#define ARCH_WARN_REACHABLE
+
 #define HAVE_ARCH_BUG
 
 #include <asm-generic/bug.h>
-- 
2.43.0


