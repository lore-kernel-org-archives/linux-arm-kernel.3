Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617A4C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 09:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RIfDOjq9qhHckyXryae5MbYL+xPZ6FAVHhgspJGsYWI=; b=iCbDOfcgk4yJtmQbf8eTTRJQbI
	O0V4yyz8QMrJHrdofyjanX+9V5GuVqaNMQkKkTQuGxSfZVmwnIJYrLWqv0n1SopNLr//tBGzZyNwP
	khgnXCStkH5j0j6l4QgjRsuAjpLmSlhkVHxeicn6RRlOs1u4LU6sc0fPglxD+ntHsZrPW2PvH30zb
	/ZWOOoc58tFbfiB109m730SruEaVWZvCnZTwrzKWQPab2XrDzMctp4OJOOcPCCQ9RAmYGsOnBY4F5
	oCsVtuyg6PZHurEXrqqh+qLIW0zqV4GvgYb0Z7jWuWWIWRdck+1MynbIKpWESDN1hsfi/PrNzZkAa
	+rpvpGTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAn2B-00000001Poh-1IqM;
	Fri, 02 May 2025 09:50:19 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAmyp-00000001Ooh-0WpG;
	Fri, 02 May 2025 09:46:52 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-22435603572so21227475ad.1;
        Fri, 02 May 2025 02:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746179210; x=1746784010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIfDOjq9qhHckyXryae5MbYL+xPZ6FAVHhgspJGsYWI=;
        b=F94P4xNBl7jqM8xNuOWaEqPW6tM5g+Wu/G5GfjSis4dXDZlpJatHdF82zz81eBegTm
         zKOpKVViTKfdG3ppEls2M+AE0c8ry5sLyR07ir4GfHkPJudPTcxc0sWA/fEPiy7tTM3W
         DwhKvaowtO7Z5x9hYO3IGUnWiZb8BbbgbQ3NO6umtwq/4luBbVzrTylcI8H71N3b4hdq
         Mbqpseh67QMLjff+l4uzjxno4eLicH3GvnElPR1c3xsfESGtuBtbDH5Gank2abBEDsYb
         bzQndhPI+x8MNMeTJtajuPQFdEbcY4ZpF7fmJJjVGq857G7FWVTTWGxpTKua4w4m3lMX
         lI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746179210; x=1746784010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RIfDOjq9qhHckyXryae5MbYL+xPZ6FAVHhgspJGsYWI=;
        b=QODmwqH87M2anv2xzL77kVvVf9ToI04RJQAL7C0O/vHCeSU1UN7fwstUxPQ81eT12z
         8Rjx+4FQ4Jd3IE3IaMWVuT6Jit6ok0OKW+ukaowRiYouMN425G5dQMoVNjIGEBXFzn41
         plcRByrDNpA2rOZL2HqizHGk656G9GzvxRlZGPxs7NlneQIfYtESCG3dNlUPCqWZfiYW
         rHD5UahcuPI/HXrEFsQ2UcGQmCeYT/0PzUi2hJZneNEWilBY1UfFcSw8ky0SGc4YHujA
         5Ep01q/wQj/5TXegDvS9Z+lK8HjMvKyud5iXp+72fep3L869uYKdxgrh2r6+DlklZKs2
         df+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9WxkmIPeFjLWLXt7/mFmkfQ/mFQrGeTcA2OAcs/RYor5hSt8HgWUc60Oxk8EfYTlGobAERQmGqKuKG7qjNgAH@lists.infradead.org, AJvYcCVM1kwgfOOKfbK2L/FV6Z7EVpojcH+XVg6Gjv6JmXXOCJYbzJPdbyzUoaerfB1rd0Hr5ce9pr6T/hRgl1k=@lists.infradead.org
X-Gm-Message-State: AOJu0YzpQPsMWH4DjjpMLISSdSKQY8sx0hNTVB/qgAI2qnhnKMQ3ZMy8
	JfMh0PBK3vxz4XXPa+fKYZLQBXhOG7eQxv/i6UkPcxqOSHtkCt4M
X-Gm-Gg: ASbGncvbnhzDQACrXlLWr0vpFevUmq6f1oKhMZPTaJe1zvo6Dwmamxan281+qDisiHL
	CPLbm+i6+D7OUzkHrk9XPmri4uYE+1cnVJopdAhRRXZdp75O3JmNja/Yq/w+Boh5grREGGc+/15
	m4O4Rg6dJ9JaueJmhLvf5aePSwqdOlNdj/wNfnvFljuSgn5oS5othCW1gfqSgfJxO+e74mFalwx
	jpFqWmKgBqRLSVTrCk+k90dkjDGLA7xtYQRwNbnfz+0qj0E1R4JSRPnRM1g4s568Tb6yL+WAh9t
	mtjiRWy2FKiN2ua4oSe2aOoHfrGTMjPsm7a/sv54fuddos+UFbLlUYgblx4tcr06Mu6l8el5Dit
	9vlMBpikSQ5xm+1ieFA==
X-Google-Smtp-Source: AGHT+IGNrYRWFIFxS/SMvu1kN7DhVaABG7vkSf2FsbbxwbcCnEdTvQrlp1ORF1H2Cyveec3KLO5zKw==
X-Received: by 2002:a17:902:f608:b0:223:432b:593d with SMTP id d9443c01a7336-22e1039ef34mr38688315ad.42.1746179210153;
        Fri, 02 May 2025 02:46:50 -0700 (PDT)
Received: from mew.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151eb166sm3273565ad.96.2025.05.02.02.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 02:46:49 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
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
Subject: [PATCH v6 1/4] x86/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Fri,  2 May 2025 18:45:33 +0900
Message-ID: <20250502094537.231725-2-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502094537.231725-1-fujita.tomonori@gmail.com>
References: <20250502094537.231725-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_024651_161430_6CBF8026 
X-CRM114-Status: GOOD (  11.12  )
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

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 arch/x86/include/asm/bug.h | 56 +++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
index f0e9acf72547..be5aef1aff9e 100644
--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -32,45 +32,42 @@
 #ifdef CONFIG_GENERIC_BUG
 
 #ifdef CONFIG_X86_32
-# define __BUG_REL(val)	".long " __stringify(val)
+# define __BUG_REL(val)	".long " val
 #else
-# define __BUG_REL(val)	".long " __stringify(val) " - ."
+# define __BUG_REL(val)	".long " val " - ."
 #endif
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+#define __BUG_ENTRY(file, line, flags)					\
+	"2:\t" __BUG_REL("1b") "\t# bug_entry::bug_addr\n"		\
+	"\t" __BUG_REL(file)   "\t# bug_entry::file\n"			\
+	"\t.word " line        "\t# bug_entry::line\n"			\
+	"\t.word " flags       "\t# bug_entry::flags\n"
+#else
+#define __BUG_ENTRY(file, ine, flags)					\
+	"2:\t" __BUG_REL("1b") "\t# bug_entry::bug_addr\n"		\
+	"\t.word " flags       "\t# bug_entry::flags\n"
+#endif
+
+#define _BUG_FLAGS_ASM(ins, file, line, flags, size, extra)		\
+	"1:\t" ins "\n"							\
+	".pushsection __bug_table,\"aw\"\n"				\
+	__BUG_ENTRY(file, line, flags)					\
+	"\t.org 2b + " size "\n"					\
+	".popsection\n"							\
+	extra
 
 #define _BUG_FLAGS(ins, flags, extra)					\
 do {									\
-	asm_inline volatile("1:\t" ins "\n"				\
-		     ".pushsection __bug_table,\"aw\"\n"		\
-		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
-		     "\t"  __BUG_REL(%c0) "\t# bug_entry::file\n"	\
-		     "\t.word %c1"        "\t# bug_entry::line\n"	\
-		     "\t.word %c2"        "\t# bug_entry::flags\n"	\
-		     "\t.org 2b+%c3\n"					\
-		     ".popsection\n"					\
-		     extra						\
+	asm_inline volatile(_BUG_FLAGS_ASM(ins, "%c0",			\
+					   "%c1", "%c2", "%c3", extra)	\
 		     : : "i" (__FILE__), "i" (__LINE__),		\
 			 "i" (flags),					\
 			 "i" (sizeof(struct bug_entry)));		\
 } while (0)
 
-#else /* !CONFIG_DEBUG_BUGVERBOSE */
-
-#define _BUG_FLAGS(ins, flags, extra)					\
-do {									\
-	asm_inline volatile("1:\t" ins "\n"				\
-		     ".pushsection __bug_table,\"aw\"\n"		\
-		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
-		     "\t.word %c0"        "\t# bug_entry::flags\n"	\
-		     "\t.org 2b+%c1\n"					\
-		     ".popsection\n"					\
-		     extra						\
-		     : : "i" (flags),					\
-			 "i" (sizeof(struct bug_entry)));		\
-} while (0)
-
-#endif /* CONFIG_DEBUG_BUGVERBOSE */
+#define ARCH_WARN_ASM(file, line, flags, size)				\
+	_BUG_FLAGS_ASM(ASM_UD2, file, line, flags, size, "")
 
 #else
 
@@ -92,11 +89,14 @@ do {								\
  * were to trigger, we'd rather wreck the machine in an attempt to get the
  * message out than not know about it.
  */
+
+#define ARCH_WARN_REACHABLE	ANNOTATE_REACHABLE(1b)
+
 #define __WARN_FLAGS(flags)					\
 do {								\
 	__auto_type __flags = BUGFLAG_WARNING|(flags);		\
 	instrumentation_begin();				\
-	_BUG_FLAGS(ASM_UD2, __flags, ANNOTATE_REACHABLE(1b));	\
+	_BUG_FLAGS(ASM_UD2, __flags, ARCH_WARN_REACHABLE);	\
 	instrumentation_end();					\
 } while (0)
 
-- 
2.43.0


