Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1A8606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uJxdQwIg;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TRwj4u5j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WZCcOUUIhCEQ9Fj14Fk6W+WsOHHcMABIP8ZRGfIzWVM=; b=uJxdQwIgYfeK/I1L3TPQ6nJnXK
	nJfvF5G2yTP2g3WJ4IIheZ/XiA+KsFY8esnAHa/v5KlGGrXcFC9NZ4MHhppoPuoeZIgVvs0MTYh3E
	aHKkUrfjOxUn0G+ghZz+uMzYBCd2rU2FZBnTdzDhvR+WLhC2QQ46CnCRslPVfSi8wHKIMVrRvd7wZ
	ZDFxdJKx2GpO5Y7ruv3FuPelBuSMeDhl9Barihh5DLNPRXFAbnqYwz+DIXz5K3993azExQoN7YdIz
	toHHo6A8jah4Levt5roM3atBQyB5Xoklcj5pLCyGhjFy7RGs574wosxtPDVGkmWd5YvS32T59rVba
	BgItEl8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQWd-00000009Qrq-3AIG;
	Thu, 29 Oct 2026 13:50:39 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQWb-00000009Qq9-0MSd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:50:38 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4a9d51dc486so4981925e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 06:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793281834; x=1793886634; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZCcOUUIhCEQ9Fj14Fk6W+WsOHHcMABIP8ZRGfIzWVM=;
        b=TRwj4u5jbeXfvX49SU9x643k+Wx0KdDGkwQOHrVJb55HUoGenPHsKhFbL4ALiyJRjB
         1A2eJ/eeE122P/dGBPAaYe4x8x3SWTEkuXp4/JYZHkWeeZUnGSP0akZMTlaX712zMaOr
         rDcBgMhLY01XqlssWEPWWgLgWsjli/s1G5dmmlVW8KXCRYi1ovdEDc/3swf9zdqA5/xY
         H0q3NrjF09KRTI4GctyHPz4OHM7G9s5kpygQBfMeLrOoUAcz9mTpVECHPEEKP1qlRQb6
         /fARw0iM2EywxiI8p8rRgO09DicIMxsG4PNC0WPiiSBHDU+Y6zNHEF4iIDPfERkBPS5T
         pFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281834; x=1793886634;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZCcOUUIhCEQ9Fj14Fk6W+WsOHHcMABIP8ZRGfIzWVM=;
        b=SWw1chyB7pcIcdJxGl8mTsXFOBJsu4ODkJDkX10sWyIKXDo0QzRLlnKaVrHYsotkNK
         MEjLWQeCYVVkdRj9XQcpS7Qyum6Qp+ip1/Dk6U78JhDNd1atwB4IkAjWAal/F1hlZ6FH
         bIJPN+1rXO5sDdp7i/hVmDKSfzsYilUbxwiOqj65p1CfoDhKhc5uX/G6EeZfRN9pfsbH
         XvNk3jDYWTCdoxChGJNKOeJJgOzYPDxiaDwFwe8GA9Lpv+SG9sBM4Atq3biUfdIEytN2
         dv5pbRyBcwUjLQOtLL5zQH0kRhG2t0DXwPUTpwZSDfbsZ4pIasY0NXn1Z/bVqvFeQFKF
         uKdw==
X-Forwarded-Encrypted: i=1; AKwUvBw9oGHPHd4L1hGovzIXr3dAxZ0WjOPnNEifxIIC8awHFZIrX5DzUHc97d79C9fOW/lKx22t4nlny5KWRknJUPhh@lists.infradead.org
X-Gm-Message-State: AFq9FYLCmX9HkWSBpMvHsqz7EaCOXXNrC8NYEz/HVaAyZjCcu+zLpWLF
	I6gqmYK98Ynsrfq74zPHQ7NykpshTAIqqOiR+0e1URk9KR0GbpkiVMINVrMCwfdNjPQiyzd06w=
	=
X-Received: from wmcq2.prod.google.com ([2002:a05:600c:c102:b0:4a1:d8be:ba51])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:540f:b0:49e:65f2:db64
 with SMTP id 5b1f17b1804b1-4aa871e8bd4mr66653385e9.5.1793281833756; Thu, 29
 Oct 2026 06:50:33 -0700 (PDT)
Date: Thu, 29 Oct 2026 14:50:21 +0100
In-Reply-To: <20261029135020.272082-6-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261029135020.272082-6-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261029135020.272082-7-ardb+git@google.com>
Subject: [PATCH 1/4] lib/crc: Don't include <linux/types.h> in NEON intrinsics code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-crypto@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>, Eric Biggers <ebiggers@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_065037_140703_5425A730 
X-CRM114-Status: GOOD (  13.98  )
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

The kernel's definitions of uint64_t and int64_t in <linux/types.h> are based
on [unsigned] long long, whereas the ones provided by <stdint.h>, which is
included by <arm_neon.h>, are based on [unsigned] long on arm64. On 32-bit ARM,
a similar mismatch exists for intptr_t.

Including both into the same compilation unit currently only works because
asm/neon-intrinsics.h overrides the predefined macros that the compiler's
freestanding <stdint.h> uses to define these types. In order to be able to get
rid of those overrides, stop including <linux/types.h> into the CRC64 NEON
intrinsics code.

Instead, use <stddef.h> for the definition of size_t, and rely on
<asm/neon-intrinsics.h> to provide the u8 and u64 types used in the prototype
of crc64_nvme_neon(), which is shared with code that does include
<linux/types.h>. Use uint64_t for the arrays of constants that are passed to
vld1q_u64(), so that they match its prototype regardless of how uint64_t is
defined.

No change in generated code.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 lib/crc/crc64-neon.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/crc/crc64-neon.c b/lib/crc/crc64-neon.c
index 4753fb94a4be..1267df1310be 100644
--- a/lib/crc/crc64-neon.c
+++ b/lib/crc/crc64-neon.c
@@ -3,7 +3,7 @@
  * Accelerated CRC64 (NVMe) using ARM NEON C intrinsics
  */
 
-#include <linux/types.h>
+#include <stddef.h>
 #include <asm/neon-intrinsics.h>
 
 #include "crc64-neon.h"
@@ -11,11 +11,11 @@
 u64 crc64_nvme_neon(u64 crc, const u8 *p, size_t len);
 
 /* x^191 mod G, x^127 mod G */
-static const u64 fold_consts_val[2] = { 0xeadc41fd2ba3d420ULL,
-					0x21e9761e252621acULL };
+static const uint64_t fold_consts_val[2] = { 0xeadc41fd2ba3d420ULL,
+					     0x21e9761e252621acULL };
 /* floor(x^127 / G), (G - x^64) / x */
-static const u64 bconsts_val[2] = { 0x27ecfa329aef9f77ULL,
-				    0x34d926535897936aULL };
+static const uint64_t bconsts_val[2] = { 0x27ecfa329aef9f77ULL,
+					 0x34d926535897936aULL };
 
 u64 crc64_nvme_neon(u64 crc, const u8 *p, size_t len)
 {
-- 
2.56.0.313.g2479322e68-goog


