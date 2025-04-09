Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E8BC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 07:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/DonzYY8ky0NPr6wCGSqroH7cDtAqrs9o10+/q7fXY=; b=QdknEl6deKZwDo7EjOLsMhDPE4
	i+jgJ8LltaVivMgIOayU9SBZkwbQSfAsRfX/GrZSU13dlBXJwFXFRAaXNZjxW+NztQa89YLSlRGiB
	44orboOKRYyGo3FUW3gZFzEnhx1eGX4utxctsVjyU/KhmKaerKCYTPi2k9oeVKxiRU7TpGiYBC1kx
	yJWqvEU93KMmUrclLHI+gamFqkvvvfVY9LvZtF6Qj56RlRwOFLNKEK0th/ohAPS8ESX27bL2F1UAV
	kN/L2tlzMQ+I7kb42jJJeqBfspTxW/8hjQzWaVuLtLrxVgi3ePAERpRUszoOhX+DpC98De7Na2c3w
	+qpQ7OCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2PVd-00000006MzV-28lK;
	Wed, 09 Apr 2025 07:06:05 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2PPO-00000006LcM-0jFy;
	Wed, 09 Apr 2025 06:59:39 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2241053582dso82190715ad.1;
        Tue, 08 Apr 2025 23:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744181977; x=1744786777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/DonzYY8ky0NPr6wCGSqroH7cDtAqrs9o10+/q7fXY=;
        b=S4HWM99b6va8SAInaQT5La5h20t8FRHF4f4uSZ5mY8yORaRkqsMlWb9/9DNggG5O/W
         krjQHkzrymVeAlndtBZoSnEHhv9hKAfqehz6Gaor+oJpB1FFKLItlf+IF5v9SIL5NXfg
         YcUt/MS5ZcNXgUG2eqCBn19uRtz8QPMfkj+dtzeF/IZlVjvEURIk2BorZGoFeJxv2iTE
         5sTm6sH1pgj8W2KgKIFgD0g6OdMBOOAsg2zkgL1rw0q7NLBUyE5CSG5hmNvI4TN0pIBO
         1CfyyFGD/9X+5mJ4bmYix7EqdZddSMiNpVslBm8sUyf+HXRkzglRlmOl0GxYa1XtC4St
         f+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744181977; x=1744786777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/DonzYY8ky0NPr6wCGSqroH7cDtAqrs9o10+/q7fXY=;
        b=SjcP6mzaXd47SSpRqsCdj2roZy8G82TBCaa7ZxvAUM2V3BTmQK7jvlHQBU9bAc4SNE
         b7RJvsqFeFdSoCsasvSDIZtxefXBsR0uZHi7Sowwe0ztG0nt46zR7pk4lAuhOpVQkffG
         w6gCaAesiWx4SjKSa5mx+u20DB4fqUF6aWJdsUSYvjpIOpdMvRWEPGUcQGo16CuNkBEK
         fmeamkNQRLitkxBT6EZj2l5I1IsjYr7X/olu2Y5MbSUwbffqhNrkrlUoam858aYqwpYY
         CipoWra2bxBgPogt7WtolHjb0siPF28yUk1bbFhUhEF+s0p0HuKZ4G4pMd71iScP6o3M
         Q1xQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9adkio4B0tupDzlQgeS8f3TMzaTK5R7U2bpxY1MTS4d9wXdtFqOMxB0KXCmQyntxJsO0RvRwJVFp15iw=@lists.infradead.org, AJvYcCXNlXg+PzLgejzoXRQ+WvdLoNS8IycSiX6kLkZXOgTiBoax7nB8iksQypu+4qO9Rr/H3dlunA7d7Fk7l/sR4rze@lists.infradead.org
X-Gm-Message-State: AOJu0YxtFySqiUxLxJ0olpuKqCVtc/oFiJmkLjxJ4tw+v086NYXYrTNT
	aF4y04VwqG60NmOIzThOE8JX9s6iE85cR5IGJxzktbhhvhB5aUvV
X-Gm-Gg: ASbGncvjWENIqBMi9lpSP8fjd8yITvbh5YeH9AwRuFpFJoeID0ZjZbeov2u1O3B5QBI
	IWSDs39BLu0Fbq7J7EQrGnrWIhaero0mAQp2xjC84xTvHICyQvYzNDU725DP5NamRZyu0CW6ZIj
	YpWLlqct+zL7qMDN73LtZuoHBT6Xw2cBz4WtaG8tHl/3qXhZ12Y0IfeP1m7UIYjhLF2uGjmdkOx
	Yx5DB5KUUiNTWk92ov/aympfne6YGSJ7aaWzJphaSKH8ql4g9eErSzVIoTx0uvjw1yOFoVLG844
	EuW+5ktp8tdXj9mZbttcg/jb7f4cZ3pOjqN4XC4/nECqwuBH5+t13KHe8/u+lvFrdt3+CWLs9jw
	8EviYW7Lcy6y54PHsNQ==
X-Google-Smtp-Source: AGHT+IF2Tbyqa8jlbF8mK3RKpXeeOmZUaQjjm5vh3ODXS1zPKWwm1EPLzxRklzhDHZPXhNC/FLbkog==
X-Received: by 2002:a17:902:db08:b0:220:be86:a421 with SMTP id d9443c01a7336-22ac3fe6feemr26628755ad.38.1744181977595;
        Tue, 08 Apr 2025 23:59:37 -0700 (PDT)
Received: from mew.. (p4204131-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.160.176.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb596sm4407815ad.220.2025.04.08.23.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:59:37 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
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
Subject: [PATCH v5 3/4] arm64/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Wed,  9 Apr 2025 15:58:00 +0900
Message-ID: <20250409065802.136971-4-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409065802.136971-1-fujita.tomonori@gmail.com>
References: <20250409065802.136971-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_235938_209937_6656B1D2 
X-CRM114-Status: UNSURE (   9.58  )
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

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
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


