Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9300DC021A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 14:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YTck7L/TM6YT4d7fP2I9343oTdjN2yh7jLib0/ivQs=; b=yXUEC4FxK0Sukiw9IbE/FslUaO
	o782PBFYpM1CEZSo2lj1nz0p7CA4WshjCcbOw3r41BOdl+837ziOVdMRDOYRd4zbS50R/+hJuJNmr
	vuwBp2X8m2Uh7z5wci4vCOaB7mqVo9KPlwbWdR76BVLz8BIOtXBHSppY6uHUu0MkZtpk1hUUOuXvs
	L5Euxql60FnCyWFaZMLfF8Mb4Kc2yQicqUTzjR/WVpcu/L21BieWViXNee6vDROHg2HYum4GBUBvJ
	JTCRpy2f6tA9uhE11gWCIHWqKro8RikOvklVh314wiVHSjK38MdYIufMNge+Yc96YaRXP0e/dmWOh
	CLuHqTuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaIG-0000000BKyh-25YC;
	Thu, 13 Feb 2025 14:34:20 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZm5-0000000BEvV-12Wk;
	Thu, 13 Feb 2025 14:01:07 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-21f6f18b474so10832165ad.1;
        Thu, 13 Feb 2025 06:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739455264; x=1740060064; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YTck7L/TM6YT4d7fP2I9343oTdjN2yh7jLib0/ivQs=;
        b=PzKXcd9v40WGpG+fxKh3Ca1l923TQeI0oiWWmxeccDd4Zkvl52EbRc+c4gbTvI+hjr
         nRN5kl9UNNaB3Ue1KlGrRpVDCPYmOaVwTIuMo1pGJnnmRIzmsVarrUWL2JWWrqywSHzR
         sdsU7NVkMuudGfRxiNUXjkcfMVgcUs+RZ1+mS0AIDvtoCtA0y+qlvrH3Khua/taZZ0hW
         +LtflkvGJoohUuAa3K1llizwsn8ar6iiaMDgCOLnYGJyHp+q8ysisT4eKkEray62F3f0
         g7/7Un6R6J48wxFvbcFyDvwSKVtnvU2k70I4VT8IJwLdqtAojtYGavQ8wy2dyPVVQfPF
         87HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739455264; x=1740060064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6YTck7L/TM6YT4d7fP2I9343oTdjN2yh7jLib0/ivQs=;
        b=eY+Ljs6/A5XHGStcZXZBgri5U/xHIUQmUKaEc6bss+AKCiOYPgK3sHYUdcYFmACmPz
         kDwteOFOERGoHMQ1l4kLxe1XvnFtO8wcnQlaE8Or+U4f7GdqCm3+MvSIgcjbGzjVMiYb
         07DaMU/TNzZC9JLW716aU9Y5EdtZz2yoPZs3Bk18IqEtYOys5094psyXSor/uLSM3F4/
         3EfY7/9JzAFVHfNURCWUqfbXpt7nfgCoycPORng6izQcfKBOFqfGhFoeiqf63wT/0Cf3
         QeVgFTVW1MruS8NaDwavB2UJNxS3EKyD+ZdVcp1oOoSfPhJOlG5+o61+a/KlAF86fJCp
         6f7Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2IpzOX1Yss5Lvy+kJ5a3Z1AYdjRpC6vkgDkKBzHFDRIF7MhY8JPdJhKHsBqQGwcK8WWDeKSvyhhhy9J51qrCI@lists.infradead.org, AJvYcCXhC6IGhC1ix/SwkGyY255JTrKk3EYWSKCNlopVXaJjm+IEsq3uCu+7N4B9iRFr4DiFXLKQ5upKIICz8wU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwL0Ibi+dPJtM08X9X73nP07HYCIBGb66dlRXx75bUm5SYJhVu9
	IuHphG29Zb36LQlgGidYyyodx6sEc3/2vJd+fe4Ft+pMMcHDEV9Y
X-Gm-Gg: ASbGncuLSpGVx/d1LwR6oDbErOSNVgEMLbTBFh/LQICWRN1JuPfcp02GsXR0Nu9875r
	FDrRVuCN93Mlo8rocU/qgyd0gi5TzO4WA9tKlAlL2EFMYs5D1KqNF7IuDj3eqWeMNNPDauGac5p
	NnyiaYd81+KxW7hpoBir/xIO6LiFrr8M/hYuYrtlXUluXCyJNeAhowsMa3nELfIwaLx7Fs4aKLW
	TMFx8zf+uLPaHnhpvY+ebgSaQDpCz/bWEBxFvrbHQj//8uXgko896EGHzuz9VUh3VFFTxJy7trX
	CM1eOwLSHmBJyri3V3G0ZJfeRqylDrrZXc9ZQAsMfsjk9MUmuu8h3SkD29XwRQcuCtU=
X-Google-Smtp-Source: AGHT+IH1x9tK23DwJyRFWv8i5Lca//kx4EQ6K/f/4h09IEIvt0Nq6qmEVopHA91pvULj+H6RHqZ0EQ==
X-Received: by 2002:a17:902:e750:b0:220:e392:c73 with SMTP id d9443c01a7336-220e3920eebmr20624875ad.22.1739455264110;
        Thu, 13 Feb 2025 06:01:04 -0800 (PST)
Received: from mew.. (p3882177-ipxg22501hodogaya.kanagawa.ocn.ne.jp. [180.15.148.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d55858d6sm12565225ad.223.2025.02.13.06.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:01:03 -0800 (PST)
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
Subject: [PATCH v3 3/5] arm64/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Thu, 13 Feb 2025 22:57:57 +0900
Message-ID: <20250213135759.190006-4-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250213135759.190006-1-fujita.tomonori@gmail.com>
References: <20250213135759.190006-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_060105_288288_8EB28A55 
X-CRM114-Status: UNSURE (   9.07  )
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
 arch/arm64/include/asm/asm-bug.h | 33 ++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/asm-bug.h b/arch/arm64/include/asm/asm-bug.h
index 6e73809f6492..a5f13801b784 100644
--- a/arch/arm64/include/asm/asm-bug.h
+++ b/arch/arm64/include/asm/asm-bug.h
@@ -21,16 +21,21 @@
 #endif
 
 #ifdef CONFIG_GENERIC_BUG
-
-#define __BUG_ENTRY(flags) 				\
+#define __BUG_ENTRY_START				\
 		.pushsection __bug_table,"aw";		\
 		.align 2;				\
 	14470:	.long 14471f - .;			\
-_BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
-		.short flags; 				\
+
+#define __BUG_ENTRY_END					\
 		.align 2;				\
 		.popsection;				\
 	14471:
+
+#define __BUG_ENTRY(flags)				\
+		__BUG_ENTRY_START			\
+_BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
+		.short flags;				\
+		__BUG_ENTRY_END
 #else
 #define __BUG_ENTRY(flags)
 #endif
@@ -41,4 +46,24 @@ _BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
 
 #define ASM_BUG()	ASM_BUG_FLAGS(0)
 
+#ifdef CONFIG_DEBUG_BUGVERBOSE
+#define __BUG_LOCATION_STRING(file, line)		\
+		".long " file "- .;"			\
+		".short " line ";"
+#else
+#define __BUG_LOCATION_STRING(file, line)
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
+	__stringify(brk BUG_BRK_IMM)
+
+#define ARCH_WARN_REACHABLE
+
 #endif /* __ASM_ASM_BUG_H */
-- 
2.43.0


