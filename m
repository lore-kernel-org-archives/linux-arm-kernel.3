Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77601C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 00:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9RE0LT6wLYyzcsFPhNQIEquRQ4Y1gcU4IML1N68Lt8=; b=ExKDPJ8UrLmHkxu8Zk5E9vt5/q
	lOn4iQy6cCNRKf5JNvdrNLiIn54jhvYOhaERi7irdasC55Njqx6Cy5eafWqxapGQsa5XoWiuxJwuF
	EH7COKmjbv3dnkjzpQ3Hz2ovkkN8KN93opcy0S+5gnh1bcrcbErDYz/VJYptSH6TH8aumiBJXKyNM
	F+y8wMU5oDhjIWi0UhdCfn1x4zzbJhg4HEFdxWuHSZFal6I8b4XDsdTcKrlNdJaZccXAB5PcVgMiZ
	yyIxgNNGw+9Weju0l0h624G4Va4U3ZOZotwdHiISpirUecEqeUMGSuwKxD5voR0ObxAs7YW3ljggL
	d1t4pQNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7kcM-0000000CPqq-3GPG;
	Thu, 24 Apr 2025 00:39:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7kMm-0000000CNWK-1Af1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 00:23:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A1484A7AC;
	Thu, 24 Apr 2025 00:22:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8228FC4CEEA;
	Thu, 24 Apr 2025 00:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745454179;
	bh=fLNBgB98VHmWsYsqCxuP82EHevhaDk2EjXMCqMw0UcU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aWvr/EPcncCLXclOTaLe63YVgnOiy+N9wim0CGWVLG5JPWdao8sIiUrgqjP211Og9
	 jPYSkEqI/LubFLgHvX/Bs8rYkIWlBfokdgGAg1NEnskSiGSHt3Nm6+IstDdT6KUUvq
	 fdgzd3OQesUexCmrJKlCoN1f3jVyfzH1CNy4mmnAHvwpQ8eDpRo/vD+7tBTlGf9Gc4
	 RK+zxG9iJwmrLDceJAjix6paW6sEefqykYt7k4iVglMQp+Eo40VZan/De8XZf8qqM3
	 LewXnECsVB/HbYP2Cod7GN060YdqJlgseAaFPHHRZF7MctsFoP+9elJbTKHFnqXqzI
	 quzBIIJ3wXqLQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 7/7] x86/crc: drop "glue" from filenames
Date: Wed, 23 Apr 2025 17:20:38 -0700
Message-ID: <20250424002038.179114-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424002038.179114-1-ebiggers@kernel.org>
References: <20250424002038.179114-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_172300_361869_5642193E 
X-CRM114-Status: GOOD (  10.78  )
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

From: Eric Biggers <ebiggers@google.com>

The use of the term "glue" in filenames is a Crypto API-ism that rarely
shows up elsewhere in lib/ or arch/*/lib/.  I think adopting it there
was a mistake.  The library just uses standard functions, so the amount
of code that could be considered "glue" is quite small.  And while often
the C functions just wrap the assembly functions, there are also cases
like crc32c_arch() in arch/x86/lib/crc32-glue.c that blur the line by
in-lining the actual implementation into the C function.  That's not
"glue code", but rather the actual code.

Therefore, let's drop "glue" from the filenames and instead use e.g.
crc32.c instead of crc32-glue.c.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/x86/lib/Makefile                            | 6 +++---
 arch/x86/lib/{crc-t10dif-glue.c => crc-t10dif.c} | 0
 arch/x86/lib/{crc32-glue.c => crc32.c}           | 0
 arch/x86/lib/{crc64-glue.c => crc64.c}           | 0
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename arch/x86/lib/{crc-t10dif-glue.c => crc-t10dif.c} (100%)
 rename arch/x86/lib/{crc32-glue.c => crc32.c} (100%)
 rename arch/x86/lib/{crc64-glue.c => crc64.c} (100%)

diff --git a/arch/x86/lib/Makefile b/arch/x86/lib/Makefile
index 1c50352eb49f9..7cf8681cba0f2 100644
--- a/arch/x86/lib/Makefile
+++ b/arch/x86/lib/Makefile
@@ -37,18 +37,18 @@ lib-$(CONFIG_INSTRUCTION_DECODER) += insn.o inat.o insn-eval.o
 lib-$(CONFIG_RANDOMIZE_BASE) += kaslr.o
 lib-$(CONFIG_FUNCTION_ERROR_INJECTION)	+= error-inject.o
 lib-$(CONFIG_MITIGATION_RETPOLINE) += retpoline.o
 
 obj-$(CONFIG_CRC32_ARCH) += crc32-x86.o
-crc32-x86-y := crc32-glue.o crc32-pclmul.o
+crc32-x86-y := crc32.o crc32-pclmul.o
 crc32-x86-$(CONFIG_64BIT) += crc32c-3way.o
 
 obj-$(CONFIG_CRC64_ARCH) += crc64-x86.o
-crc64-x86-y := crc64-glue.o crc64-pclmul.o
+crc64-x86-y := crc64.o crc64-pclmul.o
 
 obj-$(CONFIG_CRC_T10DIF_ARCH) += crc-t10dif-x86.o
-crc-t10dif-x86-y := crc-t10dif-glue.o crc16-msb-pclmul.o
+crc-t10dif-x86-y := crc-t10dif.o crc16-msb-pclmul.o
 
 obj-y += msr.o msr-reg.o msr-reg-export.o hweight.o
 obj-y += iomem.o
 
 ifeq ($(CONFIG_X86_32),y)
diff --git a/arch/x86/lib/crc-t10dif-glue.c b/arch/x86/lib/crc-t10dif.c
similarity index 100%
rename from arch/x86/lib/crc-t10dif-glue.c
rename to arch/x86/lib/crc-t10dif.c
diff --git a/arch/x86/lib/crc32-glue.c b/arch/x86/lib/crc32.c
similarity index 100%
rename from arch/x86/lib/crc32-glue.c
rename to arch/x86/lib/crc32.c
diff --git a/arch/x86/lib/crc64-glue.c b/arch/x86/lib/crc64.c
similarity index 100%
rename from arch/x86/lib/crc64-glue.c
rename to arch/x86/lib/crc64.c
-- 
2.49.0


