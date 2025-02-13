Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A111C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 14:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNM9wcMBMuP84PLY2t7KRndWObkL1hWNmjkX5I560RQ=; b=m/itEAQtE7YcauxLX0xU1gKx/S
	m+B4CSDNMyUHNsPtEExlAUTGLdldo/2GraFDSfl7KyzLeplmz4NlL++SMBDmFmLWaNc4T/O8ZJ1hU
	z+gltJP5gDUZ9MdT/GVDpQvQJY3um60GHeF0HcSmg31cp19KGWF6TWM0J1KhP02EeoZUCweq4WpWw
	DOLOZd4MJrOlYdQ6SXJGtJi2iLkF7uP/9ZiLphAGtEg/o9zO50aarXCDCnmT5ND5sPM3kXSzuvKBp
	Mm2hPYOYNTEX5lxM+kDa62N6QJcCzPCaWYkn2enHs5eoXZ54Aw/t5lb3HVzd3TT05cxmND+5jMWGB
	sBHEL3hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaIH-0000000BKzl-32RM;
	Thu, 13 Feb 2025 14:34:21 +0000
Received: from mail-pl1-f171.google.com ([209.85.214.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZmD-0000000BEyl-1M9D;
	Thu, 13 Feb 2025 14:01:14 +0000
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-220d601886fso9445765ad.1;
        Thu, 13 Feb 2025 06:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739455272; x=1740060072; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNM9wcMBMuP84PLY2t7KRndWObkL1hWNmjkX5I560RQ=;
        b=bJ+wO13Q5L5JwyxDTvoDEGblmeGC0FqCOCa8TfN2YtPhi7VdgWTcsuRPmWSNEyeJBq
         HBzI7B6K/2wwMA1DQ22mxxbXw2VMPl4d7+wdHQKlk3I8TGcVw+iooLdr81Kfic+xKkkS
         iheF/YOB5aGP4NI9LDhfaqwE+IhQ/kOCity67j0ShyG5OwDaiOMkhn8LTmHStfjC6DL/
         9+81413b1S0di/VaCYS3bgLqTLmjgNLAKR6yG3Lc33WntC37wZrMWddAjeRc/lfZJiiy
         xBJ+4+m0Q2lkVSyuEer+fHtTDk53qvO7R+IY5qfhHBKSr6oXqo/Sv6rgcd/TeCc4bANt
         qw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739455272; x=1740060072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNM9wcMBMuP84PLY2t7KRndWObkL1hWNmjkX5I560RQ=;
        b=KIuzp52cQIqCj2o/+iNmDwaZfTrolOC44be7hvy+koGu3SNCbXbEwqd1iPE5uhgAlf
         GaYfd4DOtd4ZW6FD4EepjTYDTm9CTfPsldbh62AJSMbeVIiunDEuAOvCKD3nBPcXbT/f
         Uc5t/11W83cx5nvU0fRQlY2MOXE+ME7dJfTnJN8lkIxT/U6bscBVJPqVZ6UfqSq5dnZ/
         BdZXwEw3o+h6mlZxAtLUqt+1B1pcB0cXsAaNkMQZ/ahbWf55lhNMHxXB7pVusy9hWn8K
         s5scNU2rdSehaxw73T1mhTqtS8P0HrFomZwPUDDyvmLFKV9lVT7sdYehQR/Ke4ZueqDT
         HsPw==
X-Forwarded-Encrypted: i=1; AJvYcCULImAm/JY//UbXxuxonOU9CQCSPdKYxTjPHG5CXC8DYue8rSezU/FHM7w1uiaYQ+W0CNBQcYXvxnOr6nYWV3h9@lists.infradead.org, AJvYcCXljCGQR5XjUags0rUoYiDa3xFLmO1/qRE4U6g5uIerbtBj9h1VKaAlC3/b3QlD2rQHX+S/ER4OZHMluI4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx5rFqe+6dV41WOtV8RYOXGCr6D7ueu4R/ZXridp/KDBt/Fxwa
	+r/hCPdn0H9TsSvapN4M+8JaHIee4rU7JnvsD5lWD1SK7aQZdMCG
X-Gm-Gg: ASbGncsd79KCN4GZOQaAQ19OROga9IQ3RTzNAV9o1mNMmN1tMhx20Ol8GZROxi8TrDB
	KFusyfTy1+IFR/+9f9d6tRH4lXq7bjAWcX9FyC5Hx0Kx5H4ZwJASBDFPquokT3sataZN70VQoGC
	fr477Y0ByaZY7p8lfo/JDykhgOSuAFdIpUateQw0BpOUcqFOzqkEG4PBgwNRGFmQ52V9T4WZnTg
	cLe3YFETIFnAxfsrkYdjwUMXstqPN0xaVcbjt4Z6gPL2PHrMuZnjcs8ysN2faCNn7Rnd9BW9+p+
	YLJ4f0fjSlsRJj5EYx+2OdQQ0YABVxalPhEH9BHIn46t/2loCSfjgSEKrEvcw16B1uk=
X-Google-Smtp-Source: AGHT+IFfgCF1ArRZmNz2DsvrIgfU+ShH60hN/cRDjxK0gXLSiUzxtydzUB1xCTWoBREuB6sO6ZsxDg==
X-Received: by 2002:a17:902:f706:b0:21b:d2b6:ca7f with SMTP id d9443c01a7336-220d2110efcmr56668855ad.32.1739455271912;
        Thu, 13 Feb 2025 06:01:11 -0800 (PST)
Received: from mew.. (p3882177-ipxg22501hodogaya.kanagawa.ocn.ne.jp. [180.15.148.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d55858d6sm12565225ad.223.2025.02.13.06.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:01:11 -0800 (PST)
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
Subject: [PATCH v3 4/5] loongarch/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Thu, 13 Feb 2025 22:57:58 +0900
Message-ID: <20250213135759.190006-5-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250213135759.190006-1-fujita.tomonori@gmail.com>
References: <20250213135759.190006-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_060113_356077_DFCFD86A 
X-CRM114-Status: UNSURE (   8.76  )
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
 arch/loongarch/include/asm/bug.h | 35 ++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/include/asm/bug.h b/arch/loongarch/include/asm/bug.h
index f6f254f2c5db..06903aef1101 100644
--- a/arch/loongarch/include/asm/bug.h
+++ b/arch/loongarch/include/asm/bug.h
@@ -22,14 +22,21 @@
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
@@ -42,10 +49,12 @@
 	asm_inline volatile (__stringify(ASM_BUG_FLAGS(flags))		\
 			     extra);
 
+#define ARCH_WARN_REACHABLE	ANNOTATE_REACHABLE(10001b)
+
 #define __WARN_FLAGS(flags)					\
 do {								\
 	instrumentation_begin();				\
-	__BUG_FLAGS(BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
+	__BUG_FLAGS(BUGFLAG_WARNING|(flags), ARCH_WARN_REACHABLE);\
 	instrumentation_end();					\
 } while (0)
 
@@ -56,6 +65,24 @@ do {								\
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


