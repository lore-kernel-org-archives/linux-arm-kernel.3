Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A4BE77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 00:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GaW3Ni06SPvaTbLHs0pbUeHaTTwDPxQuBfccVmzf3vY=; b=azxfu0cvBTshryPrz2TDsKOdXZ
	JumV6B6hnEprqwt5Mji+wRxIWSWfb3anUhJz6hvcjd4lfxMSGlS7MVEZsYHSTHKNaCDAVCHcvrym+
	ttBuyW3KHJ605bbsIfqWs23bCwfeuwfjCGdTS/npboew3/rcJvk51QauA4vR8x0WN9l42fXwAA6jz
	+2RoUZqZmNF731uSmPHvrlpAuqcr9a8NGHdy+jG1GF+fqD/ngWG90Hpk37vht+2vtIZxU0f0QFG/Z
	omYy8EYqaMOCfUHhmaDCdrOunQ9C0EF2wSGcYzrkjv2cDUmId4oZcKS4Zd4KB+ZCPnPb69gQGHFB/
	uzmOlmrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKo6l-00000009i2Z-2Zxp;
	Tue, 10 Dec 2024 00:28:11 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKnyM-00000009gRA-3Gh5;
	Tue, 10 Dec 2024 00:19:31 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-725c0dd1fbcso3605381b3a.0;
        Mon, 09 Dec 2024 16:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733789970; x=1734394770; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GaW3Ni06SPvaTbLHs0pbUeHaTTwDPxQuBfccVmzf3vY=;
        b=jsYXOWig0e8YLAH9oEpJt0FuPXueg7NqavFk4HCZJaUH9NxSfUUraKEf3HLBr6cy7y
         0KyZRzR6UoWfWi+5ZQ66Y+w6tMcUOKdPZTtIHsoRYKslzAhveIVfGceJCnY/5POIQWmJ
         NF1WRRY/fBw6dk46dmwqI7u3ZUXbWmb0zO4AxYL6GjJyZ0N1RLMSfMJRuZ09kkGzsxPQ
         1n7emsfthIEcEftxaRDCFngomrCdO+1ctrwJQqvO6dsrvgwr2aXGd57bj7pN8dJAl7Hf
         cdKekmwYBX52+KTcwI9ekR9ZbEGyFkaG9WGlEnm3Yk1DyVAAVkOkpzHhYEo+luK8yLKm
         qkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733789970; x=1734394770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GaW3Ni06SPvaTbLHs0pbUeHaTTwDPxQuBfccVmzf3vY=;
        b=u1idRwqdP8g1WJdACFD6fdBH1/0As7yS5VhWtZUgAPldYLkKhhU8MRY5ushDBQt8Qh
         qjrRbi8sXDrETkzLxWBXUgrdBDJEBBlVC1+OCDqYzFHarZRBu2jxInlXD0qGosuoywvc
         Nlm1x46shxRqasfavFbsfdC0Z41VtDKSVF+wd5LffNdT2vljTSj3tdyQMeiZwSBijJ8R
         8EYAWWBfNUvMJ3AHJPFdj+G5NBfmOKWMGe6iTxvimUSW24udLb56BpxhWyIoL3z/1L+P
         v6bs+IxMRdQQBcsMFwjBYMeq2rEFyFws2+tAqPWoAfhlYSX4LQfrrYAjYDr0Bm01C5Kw
         4pHg==
X-Forwarded-Encrypted: i=1; AJvYcCUyBvuKt1/eD06nDB7uDAMPavBHV8XhmOKtjqoNcvPol2b4g5TPKkK0+zcABZEvigQfQi0VduVM5bGwJoI=@lists.infradead.org, AJvYcCX1sjPzTy62KV9QjUQeXsal+KFmfoUJm2B1T0YbKsC3zN6+SRyDq3RdW79+zA7Tpviz70SB30IOMWDSAuvAWwqM@lists.infradead.org
X-Gm-Message-State: AOJu0YyQEKaLeoUX+pBMPzKaWkPX2hVJI9cfN3aOuAK3QTKF4W/psAXT
	ZYlkfAajmYiIFpQ/0LGNvMU9BXNOFw4augJO/OJBHosNfMSWN8fV
X-Gm-Gg: ASbGnctUFm8d4yjI6YSdvgoJuH+Z8A2wxAZ+TowPSWYqSVd0HX/xTERJVEGSF/h4pJi
	jUCVHhmYC6Um2uvNT+h79eUQm8ykPcgy9ETQKPDd36YQ5TaMvLXiyamSnhwyh+ozrOrAKo94J/E
	xVqVvrXwSPBcigo0sLlD/uyctydR7NeKq3J5KOvxS5SwRZEvCF+2tTmRufgpsP4v0tj1zYDGdXL
	t9kBS8aiHPOiOBM6/7ahkDiEQP7d7j3E7sdTVmaMIUi2yCf7HFNJj6ViTU9X5w0RD0nhQ6l6CDe
	0/MLvQZow4T8tG9V4fRGr9O/3zqq
X-Google-Smtp-Source: AGHT+IEHFQLb+CnaKIfB/aQiVn4EtFWGkBf9ZZUksgIXRkbcaqD+tHXdDTDwGlizNlrZosk3pbCxTw==
X-Received: by 2002:a05:6a00:1d8b:b0:725:dab9:f732 with SMTP id d2e1a72fcca58-725dab9f7f2mr11873956b3a.22.1733789970068;
        Mon, 09 Dec 2024 16:19:30 -0800 (PST)
Received: from mew.. (p4007189-ipxg22601hodogaya.kanagawa.ocn.ne.jp. [180.53.81.189])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725f1fba027sm2005005b3a.3.2024.12.09.16.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 16:19:29 -0800 (PST)
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
Subject: [PATCH v1 3/5] arm64/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Tue, 10 Dec 2024 09:17:59 +0900
Message-ID: <20241210001802.228725-4-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210001802.228725-1-fujita.tomonori@gmail.com>
References: <20241210001802.228725-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_161930_814170_6C56BE74 
X-CRM114-Status: UNSURE (   9.17  )
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
 arch/arm64/include/asm/asm-bug.h | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/asm-bug.h b/arch/arm64/include/asm/asm-bug.h
index 6e73809f6492..822e9d51d3e9 100644
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
@@ -41,4 +46,22 @@ _BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
 
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
 #endif /* __ASM_ASM_BUG_H */
-- 
2.43.0


