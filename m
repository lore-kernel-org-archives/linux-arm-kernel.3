Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65BDC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 09:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qp8W9ben9rFX3CxZ0d32TQyshtC6obDRIzvh0yrVOfk=; b=4hFxfSjiMB5t6J4H75RqwQ4jPb
	62z/m+gN2HOVau2THYA4/VxA2N/e+BdB6WewqYVRbc81SnMF7bV2lFI0y/nle1+KzdIITb9Uiz0Yi
	uNT+OmkyVDpGcMMZyl0eJxWGFjxsygky8dXSbhU+Xk3oVSYR7t5PcPkPJoMVQSch7e+U2LKFdOd/o
	/qCuPL4Fi8smTXPbIRp5XCFjVJfuT3hXr2ck+RPjtdgyiLhDKFgxqQqlb+ZwtzgL406FF8bieMWhH
	yaJc+lHVQbCpnRC5XqZ/gKMNsIV95WcKYaJObXpsakWRWXJRTGdfA6iTb/DIpsBHeheD6cxsFuO0o
	nB92PbnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAn47-00000001QMJ-2knc;
	Fri, 02 May 2025 09:52:19 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAmyv-00000001Orn-26nH;
	Fri, 02 May 2025 09:47:00 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2295d78b45cso25130275ad.0;
        Fri, 02 May 2025 02:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746179217; x=1746784017; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qp8W9ben9rFX3CxZ0d32TQyshtC6obDRIzvh0yrVOfk=;
        b=RoPUVqyLEJDu2LBoW204CC8vjcf7JmJ0zwQX6fRMQpwbbZM+f5xEq9l8wg8Mih3/pG
         KWlHfNvPZje8m1m6joqnOt/zFVan5WYYBWqlQDzpKHlRkdSotvduy/dFwbFGJZTC83kT
         wcgRvkD8iRpEQ+aLH72EQiLlbjl+iv7PpSHwPAZGYfymLVwrK34F57oMedPr2ZaH8ElW
         H95PNljgTkffyY2FLL/003c86BreXjOYIoVGVu/k4pzJWJKs3P0HPKq4SrcoNYliwCh+
         KREkFgZGtfhMbqU+bd/x7ym45QfKpKVjzKOmOSqvVIbDe6Wo3NLIW/JgYv/QvxYQxvWu
         fhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746179217; x=1746784017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qp8W9ben9rFX3CxZ0d32TQyshtC6obDRIzvh0yrVOfk=;
        b=IXJ+1xWd4hZT6mD3ysCiBaNIXI2uMGHR8dbH83PnzZjATzQLbaP3SwTwt4gIlM4eMe
         4S75gRBuI1or30Hcp4g2Dvjrj1VlvWOyzJlOGAkBtTR38yATLBBDuiXhYX0nlcb0SMnW
         bH6ZvKnqfQzqQD8jsPh22aaJ0mcTTc9+x+TZspvKYU90sN9gpRtGg8XfUTp74XELw7pn
         lV0zJmDtKvuBlRywk1ROrliJfBS6qpc+tZosqDf7xLni6rivUqjw7LVfv6/0JNcD3LcU
         W/41a9heHLwXNvViwTFifo1tiOjEP1dBxnmVRyjFS3M+4zvI+tdf0rm3+PqOHqcOzadT
         KAYA==
X-Forwarded-Encrypted: i=1; AJvYcCWC8NuhuCa5LhY6CceHlEszVQ1XQ19Aw3zHQKUPqyBS8bYO9QsTMoyZRV/4sTXGyHqnMaEAyMPZ1CwumUsFm464@lists.infradead.org, AJvYcCXHSuJzWYj9yZrAmWrP8koXdAOWDdCd8+0/TxBiOpmsjDtjpG9FgcOA1uEesw3Qxc7ZEQiG0LGpcvtPEU8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw7kptlJLsYqb9fey9joJ1HAmTqtuFW2BaPdL056bUs/aVUPIt
	X79SLtb6qxLIpxcsFixPKZ32L74CFn2BhWFGqSpxa1fFC1d4yVUa
X-Gm-Gg: ASbGncuMgwSbo3IJy5ZolNaDTz7r8o3HA+ghOYvKrm8Puntb+6XyiP1dRgbtS2r148F
	ByXCXEfhnnVYpwSXvlgSbyXTBMeZVtyOpSvV7f6ZIZaTyxGBNtiudJny/K2nKC3gHiMDZ4IrJxw
	X92vIZyiZa3W+Abrj6adNsOow0My8VQbNtrvFueubDWb6VsrvRPWZvu9qeS3X4b6vZoRBg9ldZa
	+mzJSql1eOLIcYl7w8gjiqGxGYT5ARkPhSglvkEUEncHwfpLBV8kvYaPcO0BoaloNWFapbIwp7F
	A0Teu9GC4/5V1wiPWcDm6N18fOwTWCbwMlC2042ckUIYvV1jt+bOjsLC0QS4Cmn0vx+8TGUmhpN
	d41/CbYbK5g9gp6j2eg==
X-Google-Smtp-Source: AGHT+IEhuS4VGYIBGVglTshr93vZldL1f6oYsKTf904LeEzffsUEpPtdIRnpOF3hALskrUWmu2hnrQ==
X-Received: by 2002:a17:902:cec8:b0:223:fabd:4f76 with SMTP id d9443c01a7336-22e102f707dmr33312405ad.30.1746179216668;
        Fri, 02 May 2025 02:46:56 -0700 (PDT)
Received: from mew.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151eb166sm3273565ad.96.2025.05.02.02.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 02:46:56 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	x86@kernel.org,
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
Subject: [PATCH v6 2/4] riscv/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Fri,  2 May 2025 18:45:34 +0900
Message-ID: <20250502094537.231725-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502094537.231725-1-fujita.tomonori@gmail.com>
References: <20250502094537.231725-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_024657_577034_1D568E02 
X-CRM114-Status: UNSURE (   9.63  )
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

Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com>
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


