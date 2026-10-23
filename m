Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3B3606A319
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 01:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XwjzRsMC;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Awh440Ft
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+p8cIpnt0YjLXT/3n6WuKQxFq68+6JJEn3PVDsIrB3s=; b=XwjzRsMC9t3laEd2Svylb1rVNf
	NuyCpzhkfbtzUGvKNNkz7VZSLKbelSEjyUAfRuaez6kpqQtHBcdyiwOaDPKSsUg20uWta57WFqgbK
	PHM4NkLauHEeHlt3fIpzj9lD8p+GD2/YD3yDuZptVEBWK1EvH7XC+it7OoKCA9VvnxesOYNf+wd1q
	KLSlt2+LgYj44o6L/9zx5a3BIvxAQMeowSZ19MPfz0sPUAimTTJRPCTMa0nODWS5kPVMz/Atk8E5s
	xO0zIvrd8NjVKC0Io8FI9RJcu35oGqnWBMt8mQGU+Qgrwk71pteQHiNTFAexJDqLm2e4BYjy+o0Ff
	GJLad38w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK4Py-0000000FHcR-2eXT;
	Fri, 23 Oct 2026 01:50:04 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK4Pv-0000000FHbP-3eE3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 01:50:01 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-353804b591eso742852eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 18:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792720198; x=1793324998; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+p8cIpnt0YjLXT/3n6WuKQxFq68+6JJEn3PVDsIrB3s=;
        b=Awh440Ft8UEYMoIIwebJsWPHka/ePnxRCW6krc/2A6pAVc3JsXq1rMQrBtNMfnmSGK
         j5PG4pPi8+eL7C0qeXSsKaEdgqsI4zHrpDHiRUGGzBTgA7AwlQFfx9knYu8rRqpFE33o
         Z+Hf0vVJ84TX6ZN7zoiK0bg5fpSG5Mq5wj3xTkkdzl5DVpNvj8a0lHo4c0yrWJn6rvS+
         IL4i4jWI+yqQUNMOp42cYmsXt1BGFRb8rje5KxZqlFn0TkOSewnSwHs5d8RTTmIDP+0l
         J4ubVusu7n+D2e+nQKxogdMzEXhgjx514tM6dgxDv6ZG8F6A0BPYRY8Ya9WT6x7/RJgU
         WPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792720198; x=1793324998;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+p8cIpnt0YjLXT/3n6WuKQxFq68+6JJEn3PVDsIrB3s=;
        b=soyOWIoHumpMkFwbUYbA8CPMdDBJaGpE230l+Fht/q7mPLTXRKDbY+KNn+j29sqwsV
         sUi1HpRvyA9juDwZfdMfu3ls3rBNmvVEnRSTreGv5vNavpY4tsh655pz4RYDRI+hprGp
         ffT/da2F6yc2zWRoEN0bP7PVRloLVB9xoYJrA4Ry6Kl3AFH/E7WD7AYrdJMQui/grc98
         gyBYniS7cG+JckOE/uVdquHXCoNWm+XMCtikwebSkQ13n1gwS37kNItZABOM4UhwC+M5
         DNNtzh6XuXSHAc+cmjIMebeLghIAOZHUmJLJJe59d3hHgPkozAopNXKjvpWL4qaAIU0s
         gz7w==
X-Gm-Message-State: AFq9FYJAVtgB8Tkdt28r/cLKPtRGVA5jAw9rFmqqGWN+Z3Ov1z/EssMj
	u+y3H2x8FX6qq7jilAtBMxpSJrLmBGD5GxKUca98BWtMS3ApiiFkoD6m
X-Gm-Gg: AYBFou3T7Cwh+C1VKYx/6Km6sDDIdtHelhXdZngj68WoIOSbAYGi2naEwIZmqGSfekH
	DHJr//mEDM/rOb0TjxOVKj+vE1WmvB1/IeezPCSrb5x2wmk4/Ej/4PYURWsE6uHHNPBgjEbJYsH
	zFaz1oR7pvca47fkxi1ekEe31Kw+nYYDO/cPzeE79EE2uy48FFyonUXYzzHigGlDO5ieGmFDBnH
	w6PoSlcaZf6nQmwOx9+wpzbNWt910Aydgg2LEl9FGYrGgSY63fIurynWvJSZSNs4AEwTeO0TB6t
	zCDIF2ytmt6u09ZlclPh1bM7fZj85Q+ODpRTA8b2MsR30nntVXMgb0V+b/K75blkRedINvJvRfV
	3jIDS11YjFBlXjuMcbQeyc+cz0C7B0g/SXdkmwh0v64vb92uTFiCfnCdoYJyFFKwICIXZPJ4PZt
	JQIgaVYEm6i2atBZNXmdEkGg77gN0XkcvIvEuw6KB6RdxgLhw6KMPagAYY6IHwwk6+PeSKttSlT
	9uQgK1R+YbA+0wamw6/bVTMSkbl0VEavdP3mx477nbKiZwXozM=
X-Received: by 2002:a05:7300:c00d:10b0:35f:4780:518e with SMTP id 5a478bee46e88-369d97155f0mr1233857eec.16.1792720198309;
        Thu, 22 Oct 2026 18:49:58 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9c0e60dsm1971091eec.2.2026.10.22.18.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 18:49:57 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH v2 0/2] word-at-a-time: let KASAN see
 load_unaligned_zeropad()
Date: Fri, 23 Oct 2026 09:49:47 +0800
Message-Id: <20261023-bug-word-at-a-time-zeropad-kasan-v2-0-be0ecfbae847@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADu92moC/5WNSw6CMBBAr0Jm7Zi2khJdeQ/DYqQDTBRK2oofw
 t2t3MDle4v3FogchCOcigUCzxLFjxnMroCmp7FjFJcZjDJWK33E66PDpw8OKSFhkoHxw8FP5PB
 GkUak1pRWldYyW8iZKXArr21xqTP3EpMP7+0465/9Iz5rVNgaTQd2lsqqOncDyX3f+AHqdV2/W
 tfq3NAAAAA=
To: Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, 
 Marco Elver <elver@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, Kees Cook <kees@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-mm@kvack.org, 
 Qiliang Yuan <odys.yuan@gmail.com>, Peter Collingbourne <peter@pcc.me.uk>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_184959_901866_A9978D8C 
X-CRM114-Status: GOOD (  11.12  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

load_unaligned_zeropad() is inline assembly, so KASAN and KCSAN never
see the word loads that sized_strscpy(), the dcache name compare, path
name hashing and x86 csum_partial() do through it. While reviewing a
strscpy() KASAN fix, Peter Collingbourne suggested checking the first
byte inside load_unaligned_zeropad() itself, as read_word_at_a_time()
does [1].

Patch 1 adds that check on the six architectures that implement
load_unaligned_zeropad(). Patch 2 adds a KASAN KUnit case for it.

[1] https://lore.kernel.org/r/CAPQLkRhXZwozmfhNd_PEx1ihwdH1_5qthP6PANYJ_m-v9vfQTw@mail.gmail.com

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
V1 -> V2:
- Call instrument_read() instead of open-coding it (Andrey Ryabinin)
- Keep Marco Elver's Reviewed-by, as the check itself is unchanged
- Rebase onto 7be4bc52fd9e, which drops the big-endian branch of the
  arm64 header and rewrites the s390 load_unaligned_zeropad()

v1: https://lore.kernel.org/r/20261019-bug-word-at-a-time-zeropad-kasan-v1-0-f21a3ed6a477@gmail.com

---
Qiliang Yuan (2):
      word-at-a-time: check the first byte in load_unaligned_zeropad()
      kasan/test: cover load_unaligned_zeropad()

 arch/arm/include/asm/word-at-a-time.h              |  5 +++++
 arch/arm64/include/asm/word-at-a-time.h            |  4 ++++
 arch/powerpc/include/asm/word-at-a-time.h          |  4 ++++
 arch/riscv/include/asm/word-at-a-time.h            |  4 ++++
 arch/s390/include/asm/word-at-a-time.h             |  4 ++++
 arch/x86/include/asm/word-at-a-time.h              |  4 ++++
 mm/kasan/kasan_test_c.c                            | 24 ++++++++++++++++++++++
 .../powerpc/primitives/linux/instrumented.h        |  3 +++
 8 files changed, 52 insertions(+)
---
base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
change-id: 20261019-bug-word-at-a-time-zeropad-kasan-af2460466ee6

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>


