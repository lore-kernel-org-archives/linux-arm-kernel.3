Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DC41075261
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 06:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9vSxpeIw4WgU6sQTDAhICZ86BWyj+COIM5e/68wkb8g=; b=PSUpOQmYJKYmqAett+tt+GHKWV
	rUHZx3hIWGWKPKqkBOQar2IRNf8Y2f7HPWJPX9UuPIrrJP4oz/ntj5GZni7iIJEhJzaqCeVU2aoUb
	fzSWYF9rF8dsiIrw+DRPGNHBNs+dOnjUqfnK1H6bTuD2l3+Cz8EXJiYkXQoX4NtilT1PEj7vcGo9G
	66AmMLLC7Du1QAnC71NhBCXRRPRFOU1xLM/z29ruL6SbuiA1aLxdmwVUFtipaSeVdQU3lNR9S5BJ5
	prmpR5SguVwIis5FYYVJE35ovyH1wBDIG9LkZp9KmXJoRm8L9bhn2NCukISOU/pzINyO4u/t3t+eJ
	L7u4rl+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w36kK-0000000A1D4-2UTl;
	Thu, 19 Mar 2026 06:20:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w36j6-00000009zpf-15eR;
	Thu, 19 Mar 2026 06:19:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A400D6011F;
	Thu, 19 Mar 2026 06:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BE38C2BCB7;
	Thu, 19 Mar 2026 06:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773901163;
	bh=30YR8O9RGszwoyHMoelh/TUtAbWKLQ7inDpOxAFZk7k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lb5YamRuffHIic0o3S+n53i4qR5e6SehVWlaTLv8p1LyBsgjpRVs/k1Cx/Xp7ce1W
	 Zf0W4HoFFtWz5rRWKO4sKN81SffR9WDMIBpwl0xK1/I00zBhZVV5MF6ckGERn1BU6Z
	 m2OAlKc80xW5wLY01FrtxijQ0aLm3eKC9uTS1nN6KW82CQkUXIMv6Jl62fACy+VPm+
	 TMTPRYFNjVleqEA95/N+pxM69ANF2eFCsbQwyUDCmDZ2rKjS12BzFcRwNqGEV8EbLp
	 8f7Bo8/Jb08B8sDDi2wv+tf5yku4WvsNXYwoIrg79Hvcy/49rLVT1DjimFh74VZ0LU
	 uLuXhujkLXMCg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 18/19] lib/crypto: gf128hash: Remove unused content from ghash.h
Date: Wed, 18 Mar 2026 23:17:19 -0700
Message-ID: <20260319061723.1140720-19-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319061723.1140720-1-ebiggers@kernel.org>
References: <20260319061723.1140720-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Now that the structures in <crypto/ghash.h> are no longer used, remove
them.  Since this leaves <crypto/ghash.h> as just containing constants,
include it from <crypto/gf128hash.h> to deduplicate these definitions.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/gf128hash.h |  3 +--
 include/crypto/ghash.h     | 12 ------------
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/include/crypto/gf128hash.h b/include/crypto/gf128hash.h
index 0bc649d01e12..41c557d55965 100644
--- a/include/crypto/gf128hash.h
+++ b/include/crypto/gf128hash.h
@@ -6,15 +6,14 @@
  */
 
 #ifndef _CRYPTO_GF128HASH_H
 #define _CRYPTO_GF128HASH_H
 
+#include <crypto/ghash.h>
 #include <linux/string.h>
 #include <linux/types.h>
 
-#define GHASH_BLOCK_SIZE	16
-#define GHASH_DIGEST_SIZE	16
 #define POLYVAL_BLOCK_SIZE	16
 #define POLYVAL_DIGEST_SIZE	16
 
 /**
  * struct polyval_elem - An element of the POLYVAL finite field
diff --git a/include/crypto/ghash.h b/include/crypto/ghash.h
index 043d938e9a2c..d187e5af9925 100644
--- a/include/crypto/ghash.h
+++ b/include/crypto/ghash.h
@@ -4,21 +4,9 @@
  */
 
 #ifndef __CRYPTO_GHASH_H__
 #define __CRYPTO_GHASH_H__
 
-#include <linux/types.h>
-
 #define GHASH_BLOCK_SIZE	16
 #define GHASH_DIGEST_SIZE	16
 
-struct gf128mul_4k;
-
-struct ghash_ctx {
-	struct gf128mul_4k *gf128;
-};
-
-struct ghash_desc_ctx {
-	u8 buffer[GHASH_BLOCK_SIZE];
-};
-
 #endif
-- 
2.53.0


