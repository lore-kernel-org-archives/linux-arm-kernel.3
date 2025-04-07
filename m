Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E12C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 11:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XpFKLqR6KfBk6N/mW4zFpS+zB3MQPjK8qbiPBNr6GzI=; b=hug/cgveVPIEhq+ISUZkVxJP2d
	IBtPyVq/O+/c18lrASeiY3ktlyFJzS3MVD6i0AOUDgfr+hMms8j3rmZ1Q2VFBTSrFg+3TxuCYTdRX
	MigqaE0igt9ugNx/aA6a2Sca+rCN2+QuGQ0N6KI1S2w6lqDxKGdxv8zfhDnCEuUjJqxVv333pEWv3
	4CQq4m0h193aQ2WmUA7SwH2CLgqIgsiDMXTT3ScJGn0x+lcFg+MgUEGtRSRnXqxPEpqxzxytO/daZ
	r9erf924EcThNJnODhp06B64vmVcSxPvEZ1H0FtYG8RdsXjB/2V1tXbDjdm3mpCl5S95tcSK7Ww+u
	yHqtXjBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1km6-000000001bw-3Tq8;
	Mon, 07 Apr 2025 11:36:22 +0000
Received: from mail-ej1-f47.google.com ([209.85.218.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1kjR-000000000xP-318c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 11:33:39 +0000
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso570260366b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 04:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744025615; x=1744630415;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XpFKLqR6KfBk6N/mW4zFpS+zB3MQPjK8qbiPBNr6GzI=;
        b=PGC9fMIiRGKoXhsO0WUEV1ahr2KEeb4t1JeNJYyQ06b3OQIuPIybSdktp/Gmca+GSU
         b6EQaizipQvvLP/9oY05uxP7WfYQsup7fxFDskCmU9xhBayEAxRSjR00Fcsf9vNnzdW5
         /U3flT8g6pJdbxW0jfXOljAinIOSy5cgQNlKFG2+6Jt4EcZbQ5I5hhDt22YipPFXXlDZ
         rZWa3d5OOv+HTlwHiULd3lqeqJEidMpy4uHnqaVVXs1QMkT0hTR9JUoUgx6H5+uMh93h
         PRIbA4RGPBQ4vZVd3pqDXXCBcNib4BV8vGs7hOTqt3QFNRFmueHVIsFz4NIjQ+cmZKih
         +Plg==
X-Gm-Message-State: AOJu0YxXmyKS4OmNljPO3bVzQpcBQLIInbmFYSc+Pr79Rq9Z2cjr8voE
	PN+bdkVH5uc0Fdt9cbnQ7DG1oY6ZDeHm3+8YmY/kfQn0amvRtY4S
X-Gm-Gg: ASbGncsDfHDA0cqZZNKKu/trDJGEAx0MAFl8XLuXfwclpfjI5VyeQXnEGnCOV4aWboI
	9reXm84+PzPa79NHlMvW4mESsbjfqiqpal25NL0R3Qk+8Gq46+3C6R5d1NaOlCCfDdKoNHC1u5R
	ifqgI8hen39MJbQKodSv4+QzECt2l9vj99h50GoXErjGLWjAw3zF0QCNHBAr134ZsWtiGhzvZ/D
	PHon7Kah7XnFxlos9HZPkPot5CjZSYIP0jCbI21m+HeOIXpB5AieV/lPyo3CBQEHEtyY5hleUHS
	iJclDfb4RD+B5ZeKq3TrHUXjBwW6lTHG43U=
X-Google-Smtp-Source: AGHT+IF2aaZkO7nVjA9K/0iq75Czk5dm9yRbO08+u9wz1DCnxIMSTHn+q0hj+kEGx3FRT64/yxZhRA==
X-Received: by 2002:a17:907:c1e:b0:ac6:ffb0:a2be with SMTP id a640c23a62f3a-ac7d6ebb828mr1047119566b.47.1744025615247;
        Mon, 07 Apr 2025 04:33:35 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:5::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c01bfa5csm725053266b.166.2025.04.07.04.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 04:33:34 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
Date: Mon, 07 Apr 2025 04:33:25 -0700
Subject: [PATCH] arm64: vdso: Use __arch_counter_get_cntvct()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-arm-vdso-v1-1-7012de25b195@debian.org>
X-B4-Tracking: v=1; b=H4sIAAW482cC/23MsQ7CIBAA0F8hNxdz0BIik/9hOlC4tjcIBgzRN
 Py7sbPrG94BlQpTBScOKNS4ck7ghBoEhN2njSRHcAI0aoMTaunLQ7ZYswzTguG6jmZEhEHAs9D
 K77O6z4OAnesrl885N/XTP0lTUklN1isdrVFob5EW9umSywZz7/0L77+TdaEAAAA=
X-Change-ID: 20250402-arm-vdso-c4b0c9f35300
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, maz@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=2681; i=leitao@debian.org;
 h=from:subject:message-id; bh=eOxbz5pZkCGZ7yiGl/bs5nW3aGaLCwolZW+2II12O3U=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBn87gNP4wwTebwP9xuWSPtYKwvUWsNDRGsGrV2T
 fUKbnrwigaJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCZ/O4DQAKCRA1o5Of/Hh3
 bU+2D/9KcoB0Rb3vrcypcIrPQP1jk66SqtiiVV7iARiCKsYXMY39AQSIDAG0rCXn14TCDyxtOB1
 Ek9O+EPxNiZNs9c8MCzUMlS1P4kn1KUs7GiMm+9Z/TKer3M0+zVGeh5Ae4oCUy3KfOOzkJc9NKg
 wm2N31DXWNfsPu1UvmCzkJ23OPqlY8huHiiIB6QP2qsd3PTv5BI9t3YKhEl1YO/2ZX5FpTMzeq4
 e7qM0VDWCrfLH4xYE2Fsqlt1g9v+JCvaPF/PqNO/ggrutJ5+fIBnttwpK3OS56frV+TBbDg6FK1
 pV0BHlhKU2r0i/W0A3g6Amu8HwXXcq3NSUtA2gVukGpRB/6P9M7hb1Tx2c0Ctd4qqi4tDz6L8n1
 WIFxqEHCRSn2TFY7qqnrrk1zNKYv9yllS+AGLf6jyHwABtzYzyTI3IF06cH5pWIryhv0fev9sJs
 56/aJmHlckgG3yHiSJbhWcu+02qiyqkgrCw052zoso5srSN+ejlA+uOwFFa0K9rmqzQPrsY0uPu
 nTYfOsljL6RoJ+FvlZjdWUMW5TxhCN0CchbEuIO4/ijy+vOFmQz6mlLLHhjlFzugdnPp838TthY
 E7cA2kLHlKgDQ/iy7QMLIyRAtGXkGp4v6xuXsjWRGZjyYMf8cBXy3J9Q9O95D8exrSEHbv7NUaU
 zTIi0NBfjO4YFcg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_043337_764745_1340099D 
X-CRM114-Status: GOOD (  16.72  )
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

While reading how `cntvct_el0` was read in the kernel, I found that
__arch_get_hw_counter() is doing something very similar to what
__arch_counter_get_cntvct() is already doing.

Use the existing __arch_counter_get_cntvct() function instead of
duplicating similar inline assembly code in __arch_get_hw_counter().

Both functions were performing nearly identical operations to read the
cntvct_el0 register. The only difference was that
__arch_get_hw_counter() included a memory clobber in its inline
assembly, which appears unnecessary in this context.

This change simplifies the code by eliminating duplicate functionality
and improves maintainability by centralizing the counter access logic in
a single implementation.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Changes from RFC:
- Move the #include files to be alphabetically ordered
- Link to RFC: https://lore.kernel.org/r/20250402-arm-vdso-v1-1-2e7a12d75107@debian.org
---
 arch/arm64/include/asm/vdso/gettimeofday.h | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/include/asm/vdso/gettimeofday.h b/arch/arm64/include/asm/vdso/gettimeofday.h
index 92a2b59a9f3df..83c315ed5c6e7 100644
--- a/arch/arm64/include/asm/vdso/gettimeofday.h
+++ b/arch/arm64/include/asm/vdso/gettimeofday.h
@@ -8,6 +8,7 @@
 #ifndef __ASSEMBLY__
 
 #include <asm/alternative.h>
+#include <asm/arch_timer.h>
 #include <asm/barrier.h>
 #include <asm/unistd.h>
 #include <asm/sysreg.h>
@@ -69,8 +70,6 @@ int clock_getres_fallback(clockid_t _clkid, struct __kernel_timespec *_ts)
 static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
 						 const struct vdso_time_data *vd)
 {
-	u64 res;
-
 	/*
 	 * Core checks for mode already, so this raced against a concurrent
 	 * update. Return something. Core will do another round and then
@@ -79,24 +78,7 @@ static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
 	if (clock_mode == VDSO_CLOCKMODE_NONE)
 		return 0;
 
-	/*
-	 * If FEAT_ECV is available, use the self-synchronizing counter.
-	 * Otherwise the isb is required to prevent that the counter value
-	 * is speculated.
-	*/
-	asm volatile(
-	ALTERNATIVE("isb\n"
-		    "mrs %0, cntvct_el0",
-		    "nop\n"
-		    __mrs_s("%0", SYS_CNTVCTSS_EL0),
-		    ARM64_HAS_ECV)
-	: "=r" (res)
-	:
-	: "memory");
-
-	arch_counter_enforce_ordering(res);
-
-	return res;
+	return __arch_counter_get_cntvct();
 }
 
 #endif /* !__ASSEMBLY__ */

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250402-arm-vdso-c4b0c9f35300

Best regards,
-- 
Breno Leitao <leitao@debian.org>


