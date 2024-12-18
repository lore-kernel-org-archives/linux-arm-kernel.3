Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66038E77183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 06:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GaW3Ni06SPvaTbLHs0pbUeHaTTwDPxQuBfccVmzf3vY=; b=T+AT++KXXJ/2AZdKhWPqX/R3aJ
	5FeArrMNpPj0spITZthOfSei/hla8F8zsops8RP+fyMTWUrnm68m5Cu90pJbANLxPvjzkkmPSZgaK
	4Xy8GbmdUSVi7G5y4Oi+r9dt7DllNzPV4pxzKwNJODFv/Z+l32RgzqkGR3es7Px1+sv9NW5BlRHEm
	32P/xIiFhb6/en0e7DrvjrGXhfQe2kd63Lt001AQEpxLTZjmF+YJsBF9jPIF9lLS3vC75syTPfTHe
	uxaRval88ptsMPkTOmDuKbCvbs+4Lg3PwUCwgKLhMOrzxTzmaPQywUTpk5+/pT14QhTH6OeMndA+D
	G6+7mL3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNnUz-0000000Fi9V-2mwB;
	Wed, 18 Dec 2024 06:25:33 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNnQw-0000000FhDf-0ILK;
	Wed, 18 Dec 2024 06:21:23 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7273967f2f0so6592455b3a.1;
        Tue, 17 Dec 2024 22:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734502881; x=1735107681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GaW3Ni06SPvaTbLHs0pbUeHaTTwDPxQuBfccVmzf3vY=;
        b=Mn4spuaKel42voPRpa/pSK0zM89c7M4aSN460fTNzrMHxQkoDR7EoNPZcoEHxeiraZ
         Izic/GeYUplLdRj5pv/6fiOf5az4STY0nm1DwzXfBlOaLE6vusFVAISXd2g265qPeJlb
         /suhVSyN6iVYJV7frDYz4GZUV+niC9PPlgVC0HlmSJXgGdBvCob8JJ5B8+GxaSqJ00dE
         NkoJdx5N8+eLGPcyRsvBFIKC0orbhHmKeKUK3ghw8cbszfNSytPdG7kDZmuProIOZOyO
         H4xsKzrwO3ih4l97nyKDMqntIAitCqI5WStguvHImVaIyj7ZEHH92AV08m3fghbAQynt
         Wpkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734502881; x=1735107681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GaW3Ni06SPvaTbLHs0pbUeHaTTwDPxQuBfccVmzf3vY=;
        b=csyrNRMxJpl/wPyKCC0cA0wM4a45+qSMq8y00oyxHqeZZx9cL1rs8c9D4PImaPku/E
         k7UDzSG4MXI/kBsg4MNqpuMyrHn9LRHpFOM+ilSb7pSSu9TobS8uYcdo1y7zw9qkxAyU
         c0G3P2iy4y5BCWzikG2/NCUAkpwCbeN5vU+Ay7VpLT9L1z8Fi50vgn59JVt3+IYv8EtU
         j+nD+Q3zFvcahLU0AXkNMkrjJbzlH/kLYrZUpupoVzsohRh6TEwuYkiWokQzhLxOlsfL
         3oEwrV7wOCqmhelenewZ0ngfcQopVgH9G8/ILUPLDIaMa2LMVwiIsVnGwHdiFXQJxfS5
         spPQ==
X-Forwarded-Encrypted: i=1; AJvYcCV442jDLluogq7A7VkYHAQwNH1vR3/relJxLzbKGlw8T3CCHZNcH8zIMq4gqkaY1DKCkgo6epn+UDG3zNJMy6rV@lists.infradead.org, AJvYcCVK67VE+cHQ3MmPYABga8cw52oF17gKln6fRZb72QUA9aA/CRVYqIy03YQdrVhYbvgTD5UAZVVTEU4zwho=@lists.infradead.org
X-Gm-Message-State: AOJu0YxbYUfZWQZXPVF9El7VP2xNoqlzUQ/LDzwHzkVQLbY9cV5/uRpS
	O3WsJCUzwtGWKFp25phDEL7PA8fh4r1Tg46PluiJyOO45nrYpF35
X-Gm-Gg: ASbGncut6+1kWxBlrcBPyO8G4sG+VJLgjPVxGGKSppRMlyWHwy+MZ68bE/phg2dPXXY
	WpR+2pAeGSa9YLDMECyecOx7auJ1P/YQk1JSDV50I1Kg6yOdFszVqdawX+OsVFTcxcRxEaxqses
	+PMnpVs+70J1+Rr/Pmg92fAC+g96eJvQcMLuR7E9rKCNVd30gXOaOu4JU7+IEJOJnvjqEiQw/IS
	kL+S5M+tdree+BlZOWS6o+XbhCo2aMehxu4EKB/dv5Mnwa1ioSzpTbbhDTygGRzqui0fHBhX4wt
	82qDEWfVsMImsEJftQ==
X-Google-Smtp-Source: AGHT+IEuE5RibS/0PE8QGo2Gm9cyN9hV9VQKXrPoGrTJF/gtHBVwLDycc3gJhMqxVgMQzkxuMYzzBg==
X-Received: by 2002:a05:6a00:21c6:b0:71e:13ac:d835 with SMTP id d2e1a72fcca58-72a8d26988emr2575186b3a.11.1734502881056;
        Tue, 17 Dec 2024 22:21:21 -0800 (PST)
Received: from snail23.. (p7659208-ipoefx.ipoe.ocn.ne.jp. [221.188.16.207])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad5bc5sm7987806b3a.69.2024.12.17.22.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 22:21:20 -0800 (PST)
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
Subject: [PATCH v2 3/5] arm64/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with Rust
Date: Wed, 18 Dec 2024 15:20:07 +0900
Message-ID: <20241218062009.2402650-4-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218062009.2402650-1-fujita.tomonori@gmail.com>
References: <20241218062009.2402650-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_222122_127858_405D49A2 
X-CRM114-Status: UNSURE (   9.90  )
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


