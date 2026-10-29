Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DA0606A322
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xmdtKuxS;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KMg0JFGf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=L70Byn5v8ZFkrMF0OAudmvIVEZ2EuogOofsD9gsL04E=; b=xmdtKuxSAhYSNUkdi10J+mmo9/
	qQ3/hMoxZlqtiZ51hP76cWMoLjmk+FG+Ze9igwmR/2EhnRG92KqkurUCZYeaOe/aliOarxOZzC1DG
	YhhW6aI7y2TRl2mOc4bxKdo/LAOGJE54Axa6m6NUJR05xyJ0LApgbCmeHBfJkQDTXYKZQ5iVHdMwK
	bjCDZlNhTg6CcmDI0vnjQfwvtW52vsSy9AEBOMffKigV3fpiJEQIlZsuqTrJ09DUUmcaeqbodWS+A
	V4OfyQZKYO+wtThvtA88im/+D/wpPoRAGrmBE08WRhjuuKnDFCMFgTJav9bEKiHIXHQPsD81siDhb
	cWGv2LyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQWd-00000009QrN-2g4h;
	Thu, 29 Oct 2026 13:50:39 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQWa-00000009Qpy-1bcG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:50:37 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4a214a5f8a1so20217055e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 06:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793281833; x=1793886633; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L70Byn5v8ZFkrMF0OAudmvIVEZ2EuogOofsD9gsL04E=;
        b=KMg0JFGf//J1f7cGKVOK+LJ7eb3EI1pYu7ezX8gZ8pTt3Ag3dqymqS1SAYdm5YSLvW
         TKghzucg+aFgqxa0LzzuGwoqtwjgA4ZKC+dTxcmwXrGZ4ItMceBWBUIwxdyJi1Gfswc4
         KOrSMmsEnJIWK9pIEsWtR/Kg6b5O3LICJMaQIg2pHrrFMU9wLgcu2H2o91g2ZvEBBovh
         8BK6II7+3WPnCSacxX5CXv3jdX2fH3q8TcJHDGi+Agu4PFfG5LZe3+aoCIMpTY0TgtRg
         1AIp0mVwr8MHhDxi4zr8jB7WlQBlJsFr49GMhw0BNMlHhoglefQN0PZbFAZpkRBaNk6z
         t5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281833; x=1793886633;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L70Byn5v8ZFkrMF0OAudmvIVEZ2EuogOofsD9gsL04E=;
        b=u+pkHl5xvvEzbuYcnVmIytat+5joEo45rgxMTPjlPd2ZEtbFKmwMwj2nAvdENgndZK
         VQwEigL9oym+6h4+CRpeatAREVWwAZHEOzHrJ1NFRCytffZgSjMfyVihwpm/cwZuRny/
         GM7Qi0jeqQjNYQtSraTqo4lLB1Z3iNUo3yndlgzRigjFxLifDc3byzI7jdtmznjpgFAm
         dONEfSn6F2gvjwPeyiHDwdFJu1VIn7aewOVGa8mlY5GudKbl+UYmphkJKNT/PFM49j1J
         XiLPFsxGCnvk7wAy0l9GNOZIVbOEsRmHw3Np559fxEEkOhJxzxExjy7+eLVxeBaYZtxF
         2plw==
X-Forwarded-Encrypted: i=1; AKwUvBwoSHxYNa2RAVaYfkKRavj/AvO9VNp8UpXdb1gqLgRB25nhTsnYa0rX3NQhpJvOeT1LpPhRE8KMpn6TwMCPlfaw@lists.infradead.org
X-Gm-Message-State: AFq9FYLch8B3gxLtF5hhJ+lKhUqGhb4SjQsV4V3yg96mwLOzQn49gUeO
	gICWjVOQJUH0nzW90cy8JXeTJAGKn2WrmZgfLIN7aexC2inKoxAs9i0LxhNzSggQcJnPjzABsQ=
	=
X-Received: from wmdd24.prod.google.com ([2002:a05:600c:a218:b0:4a1:e51d:9268])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:e493:b0:4aa:2339:a375
 with SMTP id 5b1f17b1804b1-4aa2339a4a1mr77860825e9.13.1793281832038; Thu, 29
 Oct 2026 06:50:32 -0700 (PDT)
Date: Thu, 29 Oct 2026 14:50:20 +0100
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261029135020.272082-6-ardb+git@google.com>
Subject: [PATCH 0/4] Get rid of all NEON intrinsics stdint.h type hacks
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-crypto@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@lst.de>, Eric Biggers <ebiggers@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_065036_435711_BD642561 
X-CRM114-Status: GOOD (  12.45  )
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
X-Spam-Status: No, score=-21.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

Recent Clang has become more finicky when it comes to overriding the
type macros that the freestanding stdint.h consumes when defining the
uintXX_t types, and so it is time to finally get rid of this entirely.

So instead of making stdint.h (which comes from the compiler when
-ffreestanding is set on the command line) agree with the kernel's
linux/types.h header, avoid the latter entirely in the compilation units
that actually use the NEON intrinsics (which are always leaf functions
that are not tightly coupled to kernel APIs).

Note that the disagreements are about long vs. long long on arm64, and
long vs. int on 32-bit ARM, so never about types that actually have
conflicting representations.

Cc: Christoph Hellwig <hch@lst.de>
Cc: Eric Biggers <ebiggers@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>

Ard Biesheuvel (4):
  lib/crc: Don't include <linux/types.h> in NEON intrinsics code
  xor: arm/arm64: Move NEON xor_gen() dispatch into the glue code
  arm64: Drop stdint.h type overrides from asm/neon-intrinsics.h
  ARM: Drop stdint.h type overrides from asm/neon-intrinsics.h

 Documentation/arch/arm/kernel_mode_neon.rst | 10 +++--
 arch/arm/include/asm/neon-intrinsics.h      | 43 +++-----------------
 arch/arm64/include/asm/neon-intrinsics.h    | 24 +++--------
 lib/crc/crc64-neon.c                        | 10 ++---
 lib/raid/xor/arm/xor-neon-glue.c            |  3 ++
 lib/raid/xor/arm/xor-neon.h                 | 16 +++++++-
 lib/raid/xor/arm64/xor-eor3.c               | 15 ++-----
 lib/raid/xor/arm64/xor-neon-glue.c          |  5 +++
 lib/raid/xor/arm64/xor-neon.h               | 31 ++++++++++++--
 lib/raid/xor/xor-neon.c                     | 16 ++------
 10 files changed, 78 insertions(+), 95 deletions(-)

-- 
2.56.0.313.g2479322e68-goog


