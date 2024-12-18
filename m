Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B7BE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 06:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bV4HRBWZxkX47QY6JDDMA6tt+8zgh76SAzdokkmEw1Y=; b=MJBYVvGEyeKvPUpapMKOtIQC2g
	E8qg8X69w9YKB8N7VZVwWFdUOcSuGq3aB8GlHF0/Cvp78zOLGvJjzIq/k3dPf+rFjoltaMESekTnx
	nZ5GKq+91flKTSsd4WQO+/n53ettHD5bjbZ+L/VLEWvFA44zXkQ7rOJ+zv5QKlw6ApME+G1xK7ecH
	FqVBGosXOB8NUp5E/DTj16M4MOJ/7n05Kx1CBFxeRcvAQjq7ewkb1U4rDiSqUEuA6ZU2NTYy3zAOQ
	34rwJlivYnQBXuRiJeCKrs5CJBUbTIxnCaWxF8QOIeKkEs3zfT/O21iKEb8AJ2r9L2/cn357hjDxj
	Lg1Us9Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNnW5-0000000FiYq-3upp;
	Wed, 18 Dec 2024 06:26:41 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNnR2-0000000FhGN-0key;
	Wed, 18 Dec 2024 06:21:29 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7265c18d79bso6513485b3a.3;
        Tue, 17 Dec 2024 22:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734502887; x=1735107687; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bV4HRBWZxkX47QY6JDDMA6tt+8zgh76SAzdokkmEw1Y=;
        b=L25PHI3yAhEnD1pla33E3d0VGKEjcblAjmSbJYZIS7j7AuxVk9MI9HA7QqL4oRZJsf
         eYF/FoWTOvd4vrQNWNhAjcEkryDIay2QFqXJMZ5NvTkyqfg7cwVMu6clPGzYTjidJcqV
         onEWzl8xlkw6vWm5UFCMsxkfs990pqwWAc6t9Kgtj620TicQJhCTLeclpX9M7PDrxl58
         W2U7V0VvEm+bgMMHhcZ7dPJLOm+WrdpNeSel8kPpNkIcBKHZzeHlXJ9WyNi5hWIPEurh
         AedrAxo/ROPqZS4xB1W3Yuf5lsbMIvrkrGc0MSrljA40c1yDY8D7Ginf0GTSY86F3Lpz
         Iugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734502887; x=1735107687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bV4HRBWZxkX47QY6JDDMA6tt+8zgh76SAzdokkmEw1Y=;
        b=M1NJCW6QfMBlIyjEoYiR1Y6dqv3UKE5Yw74PWlp50bTsVAxwchQc8ISSr73mKDcPSU
         KYrKqG9XC4+rLzNpXSBhpibxjzSUpRQw5x8vQHi8S+vq3Mvmnf7TicSrHGcoqkWbFTyM
         2KVJmVHrUcsK9vv/GWafvb8odrotjHHCnQrf5/wBgvTKwdRyHrrJMU+8LIA9eGf+qmv2
         kWQB8bIfFC6wdmve9f43jlq/d0qdFcKCKYYJtpxY3UC2Wz9OoulidXY8ArRVxzlNT9pU
         +oE9NW9NqmJsiLf76BI/HNVgFxUH3Rl1pIhlM/sijkoy2VEQJb0tbo67deFqthLKEjti
         roLg==
X-Forwarded-Encrypted: i=1; AJvYcCVRhsMGFDo6niHaxUo0M09y9jlF5O+S66JYkYulmUfSSJhApahuGaDC3cDI0aFhB+qYX686olMTpg3mliQ=@lists.infradead.org, AJvYcCWP4qt8ahMhYHEPflWMqGIqe8MCEAjXZILFfXBOkYR2+be8hqxyIcCiD+/HP6HUf+apPO+aw3CxqaylAUB8vYzn@lists.infradead.org
X-Gm-Message-State: AOJu0YwOWgUNdVs1QvO7VfVxLeufZV8Gmregp35txIMwVGXhL8bZrpNA
	/3jtNgjhKSMhuUCqQBJX5K5x8K21ZJpo5AbH4pS6h15Q1IIvt9XB
X-Gm-Gg: ASbGnctdj0D6e4sMPB/+ZPRkH2ZZCVbY4C2O8gm/1z7uFh+v7oS5mD2tZp8nmPd6+lB
	6J/nP8LKafe2fXb5JbB4XUitC0PC9nr6Q3b4USy/EmqgbZJ+N8fekgxrx1Os+CYWa8MJVdeZC9i
	L4g772isQfnyPdFn44PXO/qzhrcpm+8Ua+mIo9SLupxl5ZwQrMUjzOj7UMbE8igUFAa3Ii9abJH
	9fRlbBOivmtcG+nfZdhwBjJYiofsb+LwSLMHWdyXjx+1QBbLLKH2u56BG/sfwbeJuFZ7IP75/bW
	LnJh62y8q4U31C2isQ==
X-Google-Smtp-Source: AGHT+IFlF8vY4Xu+YyeQGqBnLgvAT6KCSD+NGgBHnqg25UXCR6Ho2esifXRrWSvDZ1rmidOkpqKkqw==
X-Received: by 2002:a05:6a00:2c87:b0:729:597:4fb2 with SMTP id d2e1a72fcca58-72a8cd37353mr3156867b3a.0.1734502887210;
        Tue, 17 Dec 2024 22:21:27 -0800 (PST)
Received: from snail23.. (p7659208-ipoefx.ipoe.ocn.ne.jp. [221.188.16.207])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad5bc5sm7987806b3a.69.2024.12.17.22.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 22:21:26 -0800 (PST)
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
Subject: [PATCH v2 4/5] loongarch/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Wed, 18 Dec 2024 15:20:08 +0900
Message-ID: <20241218062009.2402650-5-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218062009.2402650-1-fujita.tomonori@gmail.com>
References: <20241218062009.2402650-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_222128_208787_E90D7425 
X-CRM114-Status: UNSURE (   9.56  )
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
 arch/loongarch/include/asm/bug.h | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/arch/loongarch/include/asm/bug.h b/arch/loongarch/include/asm/bug.h
index 08388876ade4..5cac2d3efd75 100644
--- a/arch/loongarch/include/asm/bug.h
+++ b/arch/loongarch/include/asm/bug.h
@@ -21,14 +21,21 @@
 #ifndef CONFIG_GENERIC_BUG
 #define __BUG_ENTRY(flags)
 #else
-#define __BUG_ENTRY(flags) 					\
+
+#define __BUG_ENTRY_START					\
 		.pushsection __bug_table, "aw";			\
 		.align 2;					\
 	10000:	.long 10001f - .;				\
-		_BUGVERBOSE_LOCATION(__FILE__, __LINE__)	\
-		.short flags; 					\
+
+#define __BUG_ENTRY_END						\
 		.popsection;					\
 	10001:
+
+#define __BUG_ENTRY(flags)					\
+		__BUG_ENTRY_START			\
+		_BUGVERBOSE_LOCATION(__FILE__, __LINE__)	\
+		.short flags;					\
+		__BUG_ENTRY_END
 #endif
 
 #define ASM_BUG_FLAGS(flags)					\
@@ -55,6 +62,24 @@ do {								\
 	unreachable();						\
 } while (0)
 
+#ifdef CONFIG_DEBUG_BUGVERBOSE
+#define __BUG_LOCATION_STRING(file, line)			\
+		".long " file "- .;"				\
+		".short " line ";"
+#else
+#define __BUG_LOCATION_STRING(file, line)
+#endif
+
+#define __BUG_ENTRY_STRING(file, line, flags)			\
+		__stringify(__BUG_ENTRY_START)			\
+		__BUG_LOCATION_STRING(file, line)		\
+		".short " flags ";"				\
+		__stringify(__BUG_ENTRY_END)
+
+#define ARCH_WARN_ASM(file, line, flags, size)			\
+	__BUG_ENTRY_STRING(file, line, flags)			\
+	__stringify(break BRK_BUG) ";"
+
 #define HAVE_ARCH_BUG
 
 #include <asm-generic/bug.h>
-- 
2.43.0


