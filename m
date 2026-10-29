Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D25606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Yv74t2Vh;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BSP2VFXc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rHmC9nnHSs/HBIYFqAJimZ70eQd4OJw7JCv9j7P9OZ4=; b=Yv74t2VhRPnRwgfOo6v939o95x
	MHwz0WWzjn7BIFWTovITnImex8+uhOKSaWLscsyIjfxu2mcuyJyNrntVllxy/nbmiSbPWhlNyWEqp
	7gnlkDpoDRn9JuL5iqZQyOAdcJ+zkurNhEEp7KHpY0qi/17f0+/gEzI6tLJGvab6eO70Co5Re+Ub0
	0jaExYCWQyYiK+4nOLbM2EYf64KmHu9uU/jdDTfCR4sedociSRLYY2IHNkplSIvau+Y9Rh1wLU+Zp
	ttProTbuWt6ZXEH9I42mQECboqitAzkWI3yvxadIubPV0n83qLXuXLYQ9h0g3G3nPUOJJ5D0Uh9OH
	yrvZkXkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQWo-00000009QyD-0tEe;
	Thu, 29 Oct 2026 13:50:50 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQWe-00000009QrF-2ikH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:50:41 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4a0284121c6so18525065e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 06:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793281839; x=1793886639; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rHmC9nnHSs/HBIYFqAJimZ70eQd4OJw7JCv9j7P9OZ4=;
        b=BSP2VFXcEL7R5BFmfcR06qD18FdJ95XBdXoN671fa0HZs0m8TF1Ko8+R0CXaE38xfB
         LKq8Oho6yrIHHfBLtFJus5K+Z8aTJHEfmQtUIgLu/btbRBL6hdhlxSZnUxlACb0GYmf6
         GVSx5sgaI/6SGEc2g07TVnIXfxzLwh2koE7d+6tHkEZJOIQRyHPDMnBYXM1U1gsHGA6a
         91vHUO4KuSq9o2RG9pkcW7vUOtVNK9wiISKkcWDADsf6Dr5s6pnyl5SERhhoW3ImLTd9
         bGypRXlHkOIz2lrUbXZ0kxLNYoQeIZ+MHNL7bpA2Q5n9ls1tWJrRxq1bphNxKdyQqpre
         ihjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281839; x=1793886639;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rHmC9nnHSs/HBIYFqAJimZ70eQd4OJw7JCv9j7P9OZ4=;
        b=pTu5t8aLlBx/bMnX7E/iMbuw3NYIJmd+hsCQErRx7iheXEKmZhpQFz7OeYIV8CQM6M
         jXMhnX482vph2F4Wg0NIoF3HvML42l7OhbBdpMifKtcE+jSNOv1/zX23UcIIgcjmno1K
         qd8hq+2OJSRYnC4ckSxOQnNZsqHNlAX43DxRrV6FQjP9pXmSZYsWUFPSodJv3GlcxEfb
         Q+xfMRrbT8UmT3ikP3jB7bJDJ9c7y/jlSHr7UJIDy6ig4SIb7pIvFYDEImZ8pWNOtJWY
         UhgUavueYcPWbuX5zzN64RDFVXEBZ/P/eFhvQKTLLbaq3sncyxAIPCX8xFYWardLD2my
         83RQ==
X-Forwarded-Encrypted: i=1; AKwUvBzypgGe5Vs3y6cB5iVEPI/6i8vdtRrteY2Z62C7sW04FLaG3bMfV7ymLWd/ADRTBjPPDPTRqf5dGPSi4dVEaQcg@lists.infradead.org
X-Gm-Message-State: AFq9FYLMlNI11AQ1mxvsZU45kjD8jmEV789zeZc6RWh8teTAI3lmDk8S
	2mQOVK6BpWJpjShPujwoI8bRdSz4305gjlfJB0muhf6+v4ueHcEedMTCr55mZeokWUaktg7WCg=
	=
X-Received: from wmbdx18.prod.google.com ([2002:a05:600c:63d2:b0:4a7:a5bc:d876])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8183:b0:4a4:fc8c:cfd9
 with SMTP id 5b1f17b1804b1-4a96710c712mr106879715e9.25.1793281838064; Thu, 29
 Oct 2026 06:50:38 -0700 (PDT)
Date: Thu, 29 Oct 2026 14:50:23 +0100
In-Reply-To: <20261029135020.272082-6-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261029135020.272082-6-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261029135020.272082-9-ardb+git@google.com>
Subject: [PATCH 3/4] arm64: Drop stdint.h type overrides from asm/neon-intrinsics.h
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-crypto@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>, Eric Biggers <ebiggers@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_065040_709263_EA13F51F 
X-CRM114-Status: GOOD (  13.78  )
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

None of the users of NEON intrinsics include <linux/types.h> anymore,
and so there is no longer a need to override __INT64_TYPE__ and
__UINT64_TYPE__ in order to make the definitions of int64_t and uint64_t
provided by the compiler's freestanding <stdint.h> compatible with the
kernel's. So drop the overrides.

This also means that uint64_t now matches the type that Clang uses for
64-bit quantities in the prototypes of its NEON builtins, and so the
-Wincompatible-pointer-types warnings that are currently being disabled
for all NEON intrinsics code will no longer occur. So drop the pragma
that disables them as well.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/neon-intrinsics.h | 24 ++++----------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/include/asm/neon-intrinsics.h b/arch/arm64/include/asm/neon-intrinsics.h
index 5f13505d39fc..43cdf4d16170 100644
--- a/arch/arm64/include/asm/neon-intrinsics.h
+++ b/arch/arm64/include/asm/neon-intrinsics.h
@@ -6,23 +6,13 @@
 #ifndef __ASM_NEON_INTRINSICS_H
 #define __ASM_NEON_INTRINSICS_H
 
-#include <asm-generic/int-ll64.h>
-
 /*
- * In the kernel, u64/s64 are [un]signed long long, not [un]signed long.
- * So by redefining these macros to the former, we can force gcc-stdint.h
- * to define uint64_t / in64_t in a compatible manner.
+ * <arm_neon.h> includes <stdint.h>, which defines some C99 types differently
+ * from <linux/types.h>, so the latter must not be included into code that uses
+ * NEON intrinsics. The kernel's u8/u16/u32/u64 types can be used alongside the
+ * C99 ones, so provide those instead.
  */
-
-#ifdef __INT64_TYPE__
-#undef __INT64_TYPE__
-#define __INT64_TYPE__		long long
-#endif
-
-#ifdef __UINT64_TYPE__
-#undef __UINT64_TYPE__
-#define __UINT64_TYPE__		unsigned long long
-#endif
+#include <asm-generic/int-ll64.h>
 
 /*
  * genksyms chokes on the ARM NEON instrinsics system header, but we
@@ -33,8 +23,4 @@
 #include <arm_neon.h>
 #endif
 
-#ifdef CONFIG_CC_IS_CLANG
-#pragma clang diagnostic ignored "-Wincompatible-pointer-types"
-#endif
-
 #endif /* __ASM_NEON_INTRINSICS_H */
-- 
2.56.0.313.g2479322e68-goog


