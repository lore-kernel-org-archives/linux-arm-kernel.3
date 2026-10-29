Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFBA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tL6485g4;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LV7qDBmG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=exWtIBRZ56EySSgogA875Ex4m63J1/CXAzQ1NHtAG7s=; b=tL6485g47n5viF3QCkmT0k9lKK
	8IsXg5kcWwKYfTIjvt34e9xuHA65NRUc8mh+4pMLgy/mfJSBOoVQUCyLtilmLle7m346dIY2V/Q+c
	dHmd1Li0M1IxTtwdX5O2ko5r5pktSqSqrX6i9o/5BjXtoinHiUKD9v8tw0nzl6H8ve1FIlIrGcChl
	YPkWZu/WXANE4tBJ5UNGWs4NmygKpwx6jwicVRGqDNQLtZBNW+JGfIwdOzs16c1cdWGmhOuYKs+xX
	FqHV6grmG1XDTSw+NhXPVY4rimYvkvEdPur+YTyW600FCSUE6/2mNsdZ/WKnhGUvmPD3z5PHZo5rK
	fSppcTXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQWo-00000009Qyl-1TDI;
	Thu, 29 Oct 2026 13:50:50 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQWg-00000009Qsg-1uHG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:50:43 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4a359b714f8so19781545e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 06:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793281840; x=1793886640; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=exWtIBRZ56EySSgogA875Ex4m63J1/CXAzQ1NHtAG7s=;
        b=LV7qDBmGQKFdm6jNRspaKBocZZy5w0hfwxio6xczGu8eNfFMvjg78Nnp9/wesdnuUZ
         /pvJKkMv/C4F2NRn3hwFZaUeIQoL/W2Z6BYqWgSTRnrKtuI+nroTjeJHsmjiugE14VpH
         NdbrzUAyGmyNQ/bu/Ls7Cc0gQbMOj/Iu8v515ozjFMo9Vbpp07ryFfPLt1JNn1N3Kv1q
         iaHfSdir7YopWxxsE3R8YBt7/e0zCqevJYfMaOCrqYn6s8mn6OzYJNdKB3LoWKQ7YvQ2
         Lq8ELyetyskvFnlKf+et7zQVSgxAR+/Eu9WsfeM/2lS+b6tRzyKdu75cs3l7LwVnMhkV
         pFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281840; x=1793886640;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=exWtIBRZ56EySSgogA875Ex4m63J1/CXAzQ1NHtAG7s=;
        b=QptKTOovNhnXLhmZCoPfFZ1UZrIJt+UEqfoWzbbiuXoClZQRVGOGfk3ohLLy4nVy4e
         +DoWUqYKClmx5Cfc102SGYvc0/rTrFy9KBblBy3rZbnE5j9Paiy86e4SfsYG8W589Dg/
         mPRIHeEjBSyOeWCmQpU91VmeYUO8iGOsp8K7bWanCiyo9JUZjxTkT7Vi0WGyJnhJdZKA
         7/oppiBmktDcTIhpERRmEvolb0XLXSvwFrE63lDP8sScxcjKUpduNBP47ja0M3T4Qq4l
         uqbvvhUTSozuK40Gjrk+QNov7oRdQUe08g3Tpt4AfrbBdF/qrXCdean5yWSHgVB7VRgD
         /Q/w==
X-Forwarded-Encrypted: i=1; AKwUvBzqvQWuu8A/OAdbqb18/Wv8WwBqWRedxuXSXz1Xmca0EmznB5OfoO431ufGTa1tqdz5OJT1ftrvdOc7MdTrR3sN@lists.infradead.org
X-Gm-Message-State: AFq9FYITisjYx5zpa7JuDnjjeI5IWbZ/mEVYPkQTRK8n1vi94k5tDAi1
	xM9C6WL3VG2LWW4Ub6sWquCH/hTxk5eP1gJna8ccN2X+HAqGtO4ufb7Oxt0/KXAQs+YTzFgsiw=
	=
X-Received: from wman14.prod.google.com ([2002:a05:600c:6c4e:b0:4a1:bec2:1cfe])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4454:b0:4a3:2f35:38b6
 with SMTP id 5b1f17b1804b1-4a967017cf8mr130515735e9.24.1793281839636; Thu, 29
 Oct 2026 06:50:39 -0700 (PDT)
Date: Thu, 29 Oct 2026 14:50:24 +0100
In-Reply-To: <20261029135020.272082-6-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261029135020.272082-6-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261029135020.272082-10-ardb+git@google.com>
Subject: [PATCH 4/4] ARM: Drop stdint.h type overrides from asm/neon-intrinsics.h
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-crypto@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>, Eric Biggers <ebiggers@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_065042_524929_CAC13E8F 
X-CRM114-Status: GOOD (  18.44  )
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
and so there is no longer a need to override the compiler's predefined
macros that are used to define the C99 [u]int32_t and [u]intptr_t types
in order to make them compatible with the kernel's definitions. So drop
the overrides from asm/neon-intrinsics.h.

Update the documentation accordingly.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 Documentation/arch/arm/kernel_mode_neon.rst | 10 +++--
 arch/arm/include/asm/neon-intrinsics.h      | 43 +++-----------------
 2 files changed, 12 insertions(+), 41 deletions(-)

diff --git a/Documentation/arch/arm/kernel_mode_neon.rst b/Documentation/arch/arm/kernel_mode_neon.rst
index 1efb6d35b7bd..73331f17b2c0 100644
--- a/Documentation/arch/arm/kernel_mode_neon.rst
+++ b/Documentation/arch/arm/kernel_mode_neon.rst
@@ -121,6 +121,10 @@ observe the following in addition to the rules above:
 * Compile the unit containing the NEON intrinsics with '-ffreestanding' so GCC
   uses its builtin version of <stdint.h> (this is a C99 header which the kernel
   does not supply);
-* Do not include <arm_neon.h> directly: instead, include <asm/neon-intrinsics.h>,
-  which tweaks some macro definitions so that system headers can be included
-  safely.
+* Do not include <arm_neon.h> directly: instead, include <asm/neon-intrinsics.h>;
+* Do not include <linux/types.h>, or any other kernel header that includes it,
+  into the same compilation unit: some of the C99 types it defines (e.g.,
+  intptr_t) are incompatible with the ones defined by <stdint.h>. The kernel's
+  own u8, u16, u32 and u64 types are provided by <asm/neon-intrinsics.h>, and
+  can be used safely in the prototypes of functions that are called from code
+  that does include <linux/types.h>.
diff --git a/arch/arm/include/asm/neon-intrinsics.h b/arch/arm/include/asm/neon-intrinsics.h
index 8b80c05ce1d7..449f6556ac67 100644
--- a/arch/arm/include/asm/neon-intrinsics.h
+++ b/arch/arm/include/asm/neon-intrinsics.h
@@ -7,46 +7,13 @@
 #error You should compile this file with '-march=armv7-a -mfloat-abi=softfp -mfpu=neon'
 #endif
 
-#include <asm-generic/int-ll64.h>
-
 /*
- * The C99 types uintXX_t that are usually defined in 'stdint.h' are not as
- * unambiguous on ARM as you would expect. For the types below, there is a
- * difference on ARM between GCC built for bare metal ARM, GCC built for glibc
- * and the kernel itself, which results in build errors if you try to build
- * with -ffreestanding and include 'stdint.h' (such as when you include
- * 'arm_neon.h' in order to use NEON intrinsics)
- *
- * As the typedefs for these types in 'stdint.h' are based on builtin defines
- * supplied by GCC, we can tweak these to align with the kernel's idea of those
- * types, so 'linux/types.h' and 'stdint.h' can be safely included from the
- * same source file (provided that -ffreestanding is used).
- *
- *                    int32_t     uint32_t          intptr_t     uintptr_t
- * bare metal GCC     long        unsigned long     int          unsigned int
- * glibc GCC          int         unsigned int      int          unsigned int
- * kernel             int         unsigned int      long         unsigned long
+ * <arm_neon.h> includes <stdint.h>, which defines some C99 types differently
+ * from <linux/types.h>, so the latter must not be included into code that uses
+ * NEON intrinsics. The kernel's u8/u16/u32/u64 types can be used alongside the
+ * C99 ones, so provide those instead.
  */
-
-#ifdef __INT32_TYPE__
-#undef __INT32_TYPE__
-#define __INT32_TYPE__		int
-#endif
-
-#ifdef __UINT32_TYPE__
-#undef __UINT32_TYPE__
-#define __UINT32_TYPE__		unsigned int
-#endif
-
-#ifdef __INTPTR_TYPE__
-#undef __INTPTR_TYPE__
-#define __INTPTR_TYPE__		long
-#endif
-
-#ifdef __UINTPTR_TYPE__
-#undef __UINTPTR_TYPE__
-#define __UINTPTR_TYPE__	unsigned long
-#endif
+#include <asm-generic/int-ll64.h>
 
 /*
  * genksyms chokes on the ARM NEON instrinsics system header, but we
-- 
2.56.0.313.g2479322e68-goog


