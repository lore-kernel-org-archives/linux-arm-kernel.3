Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D091E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 00:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Og2RZIwk2Fmm4a1enxRaJzgczmbvkc80VyX2Z+HeAaA=; b=0BohA+7kY4Sq0vPPIgtSMBVttv
	vMDOh6gk9buXtuJ1pjP7/sA4gsGc7Cje8ARxU1wImOO1zqcsyC5O5/ZKpm38UP1S6Yd37CR7Ruyun
	zoWMDCENNxYInpBad8Dte+jQrg0AbHdCuPkHdd9DRy4cArVDnisN67gcOjP0FrKs4+DSutlpag62K
	QZ/myeKbJtGNqGPfnexLYROVdE21cAtoXDcxBcpSedTYRGh2LyN56+s/aKNoaGoNmgpgJ7TF4u38F
	Ekbcrkd5JEiwprsF35YdupaX5v7xE80LHxa5gP/8l+Ap0RKWDYt+gt/sxMO/Ru59t6CZgeEbH96vh
	ddEBDrYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKo7m-00000009iDB-3Sjz;
	Tue, 10 Dec 2024 00:29:14 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKnyT-00000009gT5-2EH2;
	Tue, 10 Dec 2024 00:19:38 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-7fbc65f6c72so4869377a12.1;
        Mon, 09 Dec 2024 16:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733789976; x=1734394776; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Og2RZIwk2Fmm4a1enxRaJzgczmbvkc80VyX2Z+HeAaA=;
        b=T9Z9VIDVqGG6IS0jMS6nFDIJL/1xVlRyI3WzHgoBNQswZbuXnF9LI3FZCY0jfr2nFt
         DF8kpoQKgCsYJ4ShxjYAV0hXQVqZDwXQhQE7h/yXB3a6Aq6U4i5XU9q/BhLzOksqi5HK
         rs52gdFsgsw7wvOhfKKu7MFLYk53BlN9gbKsIF88bbwoSmQ/1vTjJP0sdkdpt6YLzCYq
         F/QmxGwDXIEptLoBhl8ClhifKQRCE/ztgOMjM+L5Gi2+0ynYpsoqtzeA7zJR0vKcQKqD
         2SzQPd3O/awDB68man9+AHu/xUl2ZMT21PV6M41q5XGJUjwnrPw8wt+GBY9wVub73aZk
         Lupg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733789976; x=1734394776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Og2RZIwk2Fmm4a1enxRaJzgczmbvkc80VyX2Z+HeAaA=;
        b=bZ453vrnW3ujPyuuE7f6srULuQcmnETi7ny2InhjECAFXzIa9nWOQ5QAM4x7DmEEr6
         02MxoBWT3uS5MMLWXdNfzOLe1HDTLpxeiL6vJ4iuQJypkIKqlCXRXhzMBde+h9MKgQIt
         eLXObS+YIBv1qRpC0UuKHFeOR5Gnt7aJSvD4UdBTZzrxlbmxF3/CBPXWbQbBnz0svjgn
         9P1ozKGbea7gABRuRJzq2Y764dOfnFFWg5s5gi0HDNZnYA8am2AHHueAnupplH2q3w5l
         FGnL15ywoRm4qH9nldCeR9Da0sR62mUGdIdLDlZfNOo4O1LywaifOiKqCGA7RKGWJxep
         Nr2A==
X-Forwarded-Encrypted: i=1; AJvYcCUMzxSUkhHexs4vO27Y6RHxHROAvwZ4WzKUWbNRBWMn1H7fSdO0QtxTVlPUIycG7qbCjV2oFyQPRVzlgeY=@lists.infradead.org, AJvYcCVVx7kbjDJ/+jmyJjPnpOkY6KXyGtECxxiNUoNbb6oAhi0Q6yX38jPw0k0Zp1VfOeDLaDrtog3wIXqQu8mfMt3b@lists.infradead.org
X-Gm-Message-State: AOJu0YwIHVzaA/dRZ2A1iuaE1E8HVfRdvKUpbiI3PYGSRWlOEAbXunrH
	yGMus1W5LSlbKS3989gV02QSyGR2S8vexfBB3csIiBWIyuBPCJT5
X-Gm-Gg: ASbGncu5r15OnHr0NaQ2/CAzhPgsh9fszuYNgxjxpHN3A+6RQhQeXHiWjeY8JBsBHpw
	vTPlYU2xq88rd/wqSTc3WqSIW/Y1p7fEx2dHFasccAtXBaWpJIEs/5NoyA/z2kD10gr2QV2rIeO
	/MTaKIWWa8qDR2nu/5eBl6AflL2H5/kheaQHNF7/vjvujsx45gEtTvR43rydJLzu4PV3S+PB6ul
	hEDBi9dFDg/GG+UmYdP8txAG3UXhflOEMGH4EmVzKgjvJ6w9ezClIFPA7TY4YCYvfthHW+sQaud
	PbADDSugoxUC4f4ooLbnrAzhf0c2
X-Google-Smtp-Source: AGHT+IFzrftQzGze1g0ifR+gfHYjdPe8pRM5le+6CFZEL33/9GPgGvUcXSJX0JYy+N5Of4n1uRZr/g==
X-Received: by 2002:a05:6a21:8cc7:b0:1d9:c78f:4207 with SMTP id adf61e73a8af0-1e1870bb625mr22034147637.11.1733789976324;
        Mon, 09 Dec 2024 16:19:36 -0800 (PST)
Received: from mew.. (p4007189-ipxg22601hodogaya.kanagawa.ocn.ne.jp. [180.53.81.189])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725f1fba027sm2005005b3a.3.2024.12.09.16.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 16:19:36 -0800 (PST)
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
Subject: [PATCH v1 4/5] loongarch/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Tue, 10 Dec 2024 09:18:00 +0900
Message-ID: <20241210001802.228725-5-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210001802.228725-1-fujita.tomonori@gmail.com>
References: <20241210001802.228725-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_161937_561740_DB3BAF9E 
X-CRM114-Status: UNSURE (   8.83  )
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
index 08388876ade4..2343c4226595 100644
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
+#define __BUG_LOCATION_STRING(file, line)		\
+		".long " file "- .;"			\
+		".short " line ";"
+#else
+#define __BUG_LOCATION_STRING(_file, _line)
+#endif
+
+#define __BUG_ENTRY_STRING(file, line, flags)		\
+		__stringify(__BUG_ENTRY_START)		\
+		__BUG_LOCATION_STRING(file, line)	\
+		".short " flags ";"			\
+		__stringify(__BUG_ENTRY_END)
+
+#define ARCH_WARN_ASM(file, line, flags, size)		\
+	__BUG_ENTRY_STRING(file, line, flags)		\
+	__stringify(break BRK_BUG) ";"
+
 #define HAVE_ARCH_BUG
 
 #include <asm-generic/bug.h>
-- 
2.43.0


