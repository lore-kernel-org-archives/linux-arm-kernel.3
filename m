Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFACEC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 07:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=of6wCNXS5Ss8rOtX027YOzmJzT22LfAjPavKHPx9nZU=; b=oePhPxxzxQRQJPWQwi1vrYlvhW
	NylKhqhLfIaSCk3yHt5UkjnksgZz7UagbuUmbDQ3QtgLR2FXlTQE+sVKqi8IKd5xIvXnhl+Yfe7on
	bpuWdAUBXDY/CnCm0/w9KJZA2w5F6sKYqI8c03wsjIRlbgCJ6sCZ5ndIdA/E3VjqmKgkp0Oftqxrf
	K9Ukp6kjXB3PFj6RBWbSseAzOcUutXqlBQSAGVydxgTejrjXqMG3YQdElhpj2FNWD0wd7SnykIXyd
	5SjNYzwrhlxPPiv/SKIFvGsucbmhgtfT2ErpxDl9M/Jmma/qGo74FPhnC2l5J0dvuANcaKwSTK3ys
	aMNfVVBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKQH-00000007nRZ-06hN;
	Wed, 25 Jun 2025 07:19:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKH8-00000007lKS-2thX;
	Wed, 25 Jun 2025 07:10:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 22DE24AFFA;
	Wed, 25 Jun 2025 07:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A66DCC4CEF2;
	Wed, 25 Jun 2025 07:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835430;
	bh=2LrGs37CGEadHzUgE3udzC7iJiB7yoZqC5JHegQK+WQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UyXquyVZWgisY6zFwDG5d4ZzxprCHqDlisQ41lEvQ5IHurjnN/m8NqcWJG2vqieps
	 QNFaI0iSMcmJ46Ug61uPBEtuUygIKDzSDjAxynb4e32/Bzo9ew8IRX1nVeNa3fkzqN
	 syi5JxOKQKXDORFsRNuQUSvE2MTtpLQan5nDKmPDEZTdAAdaOORBOzhXfhVgW++ZhS
	 8aQcYq36vJoEcgEO11QoLWRlxYpBu5iW/xpJLuTKV0vQsT609fAI+9N0MKxz1aEcLo
	 feCNVsiIJhz/3Gd10BL2tMvEMtB3M5eyiDmrObThqsEaq+JwDKnQHAVQO+KU2HI6MX
	 nTvdfxLoh5QYA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 06/18] lib/crypto: sha512: Fix a grammatical error in kerneldoc comments
Date: Wed, 25 Jun 2025 00:08:07 -0700
Message-ID: <20250625070819.1496119-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625070819.1496119-1-ebiggers@kernel.org>
References: <20250625070819.1496119-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_001030_774762_B11D049F 
X-CRM114-Status: GOOD (  10.93  )
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

"An HMAC", not "A HMAC".

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sha2.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/crypto/sha2.h b/include/crypto/sha2.h
index 36a9dab805be7..296ce9d468bfc 100644
--- a/include/crypto/sha2.h
+++ b/include/crypto/sha2.h
@@ -247,11 +247,11 @@ struct hmac_sha384_ctx {
  */
 void hmac_sha384_preparekey(struct hmac_sha384_key *key,
 			    const u8 *raw_key, size_t raw_key_len);
 
 /**
- * hmac_sha384_init() - Initialize a HMAC-SHA384 context for a new message
+ * hmac_sha384_init() - Initialize an HMAC-SHA384 context for a new message
  * @ctx: (output) the HMAC context to initialize
  * @key: the prepared HMAC key
  *
  * If you don't need incremental computation, consider hmac_sha384() instead.
  *
@@ -262,11 +262,11 @@ static inline void hmac_sha384_init(struct hmac_sha384_ctx *ctx,
 {
 	__hmac_sha512_init(&ctx->ctx, &key->key);
 }
 
 /**
- * hmac_sha384_update() - Update a HMAC-SHA384 context with message data
+ * hmac_sha384_update() - Update an HMAC-SHA384 context with message data
  * @ctx: the HMAC context to update; must have been initialized
  * @data: the message data
  * @data_len: the data length in bytes
  *
  * This can be called any number of times.
@@ -278,11 +278,11 @@ static inline void hmac_sha384_update(struct hmac_sha384_ctx *ctx,
 {
 	__sha512_update(&ctx->ctx.sha_ctx, data, data_len);
 }
 
 /**
- * hmac_sha384_final() - Finish computing a HMAC-SHA384 value
+ * hmac_sha384_final() - Finish computing an HMAC-SHA384 value
  * @ctx: the HMAC context to finalize; must have been initialized
  * @out: (output) the resulting HMAC-SHA384 value
  *
  * After finishing, this zeroizes @ctx.  So the caller does not need to do it.
  *
@@ -405,11 +405,11 @@ struct hmac_sha512_ctx {
  */
 void hmac_sha512_preparekey(struct hmac_sha512_key *key,
 			    const u8 *raw_key, size_t raw_key_len);
 
 /**
- * hmac_sha512_init() - Initialize a HMAC-SHA512 context for a new message
+ * hmac_sha512_init() - Initialize an HMAC-SHA512 context for a new message
  * @ctx: (output) the HMAC context to initialize
  * @key: the prepared HMAC key
  *
  * If you don't need incremental computation, consider hmac_sha512() instead.
  *
@@ -420,11 +420,11 @@ static inline void hmac_sha512_init(struct hmac_sha512_ctx *ctx,
 {
 	__hmac_sha512_init(&ctx->ctx, &key->key);
 }
 
 /**
- * hmac_sha512_update() - Update a HMAC-SHA512 context with message data
+ * hmac_sha512_update() - Update an HMAC-SHA512 context with message data
  * @ctx: the HMAC context to update; must have been initialized
  * @data: the message data
  * @data_len: the data length in bytes
  *
  * This can be called any number of times.
@@ -436,11 +436,11 @@ static inline void hmac_sha512_update(struct hmac_sha512_ctx *ctx,
 {
 	__sha512_update(&ctx->ctx.sha_ctx, data, data_len);
 }
 
 /**
- * hmac_sha512_final() - Finish computing a HMAC-SHA512 value
+ * hmac_sha512_final() - Finish computing an HMAC-SHA512 value
  * @ctx: the HMAC context to finalize; must have been initialized
  * @out: (output) the resulting HMAC-SHA512 value
  *
  * After finishing, this zeroizes @ctx.  So the caller does not need to do it.
  *
-- 
2.50.0


