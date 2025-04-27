Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63502C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 06:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:
	References:In-Reply-To:Message-Id:Date:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p52B43yI7yzG7IFY2yqwoQVRnjSzHB18F+tstzNAX4I=; b=asTZIvX7bVPhIfHOf2LfcpnzFx
	iMGAeLiHe2+gV2qlM1Cb0YKYL1UDiNphX5IHzjBYC3cwdfmm6GdQVv65PABNH3G5Nump2X4fvP9RN
	fdYPH0AUNTDcq+Nw2HBRUhDWNsAx0gBDPa5DUrVNRPrhNCJuDExBksznodX7vJWiHVOO9sB1PgX5M
	GPpKSeqBXfk0tlgYMwBgjirDv3vMVPXkYvNhpaciZc4JM4BgZ5p3osdh2ur8P0q18xFVBCeZgCEj8
	ligS2SzSEYf55/06MowRwdUt8fScYoY/5Y9QhKjqvVycNucHMe/QKWdBV9yjOda8nWnivcj21UJoF
	NGb1r/Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8vwL-000000033Sd-2XUN;
	Sun, 27 Apr 2025 06:56:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8vXz-00000002zlc-3E90;
	Sun, 27 Apr 2025 06:31:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Subject:From:References:
	In-Reply-To:Message-Id:Date:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=p52B43yI7yzG7IFY2yqwoQVRnjSzHB18F+tstzNAX4I=; b=XxuwH+SXLyKs4GOPpsLRgQvDs1
	8bY90CjebbYK35Y2rCZT2ijESIIaYIngCHAzUtaemlMMFhF3SJYiP+BBQxfETvWEmbcW2p3ZKQz59
	kL8iVkKFLAt5zdQ7vMtjvc9lCaDjakquZCX5lhJ4omXaH1XWZToVMJ67WCEvnqregHa9+W7KVC+wY
	m6XhqIBn1dBVq5H1bwBo6V4WdTRs28SgL5Ef4qYc0NhK0Ka+Bh88EDdM09VnEpvjffW2zFjuTNrKf
	Bfn1aY2sNMuFMVXY8cConC3sohNGt1YQRVRcd1KtoZrBMT7eTlAwKDNSHe4JSHFi/qsReS1Ib9529
	76f21M3w==;
Received: from abb.hmeau.com ([144.6.53.87])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u8vXo-0000000CPRi-1MVo;
	Sun, 27 Apr 2025 06:31:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:References:In-Reply-To:Message-Id:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=p52B43yI7yzG7IFY2yqwoQVRnjSzHB18F+tstzNAX4I=; b=c/bG7PmonGoeGCcd/Ntc0Cz8ar
	hBLXW/VxFBpKXZi3xo5i2meaz/6R3cCqYVdKIiRLrWN8VtjiN2F2WnWy/q1ssBztd4D9XD5HFR1jA
	5Pkj4sPqYktI1OYjVt90QVAYdnL20m4K4SVVgn/yL8O0uNkSi9U1peWa/6h9PeYowVZbIjhDo8FqJ
	e5ZTZoS2dqBy9gLSGnQ/qAy9o28ctdu2ZwBndw9Y4lbPpberlPlWMKIVZb8QJwVZpQTkg2i0d621G
	Iq5lPqLx2si1FzrOOa00uCCojbqrFJ2or0Rid0kTydSAI9sRXY8WsdsztGHyCvAvDQYfbfeArMD6z
	RHhemc1A==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u8vXk-001LXh-0E;
	Sun, 27 Apr 2025 14:31:13 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 27 Apr 2025 14:31:12 +0800
Date: Sun, 27 Apr 2025 14:31:12 +0800
Message-Id: <e1fd4c41e9c1e0da47176b811e23ae2c84fa1d98.1745734678.git.herbert@gondor.apana.org.au>
In-Reply-To: <cover.1745734678.git.herbert@gondor.apana.org.au>
References: <cover.1745734678.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [v2 PATCH 13/13] crypto: lib/sha256 - improve function prototypes
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld " <Jason@zx2c4.com>, Linus Torvalds <torvalds@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_073122_777184_BAC61A13 
X-CRM114-Status: GOOD (  11.03  )
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

Follow best practices by changing the length parameters to size_t and
explicitly specifying the length of the output digest arrays.

Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---
 include/crypto/internal/sha2.h |  2 +-
 include/crypto/sha2.h          |  8 ++++----
 lib/crypto/sha256.c            | 12 ++++++------
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/crypto/internal/sha2.h b/include/crypto/internal/sha2.h
index 09f622c2ae7d..421872a93a83 100644
--- a/include/crypto/internal/sha2.h
+++ b/include/crypto/internal/sha2.h
@@ -46,7 +46,7 @@ static inline void sha256_choose_blocks(
 
 static __always_inline void sha256_finup(
 	struct crypto_sha256_state *sctx, const u8 *src, unsigned int len,
-	u8 *out, size_t digest_size, bool force_generic,
+	u8 out[SHA256_DIGEST_SIZE], size_t digest_size, bool force_generic,
 	bool force_simd)
 {
 	unsigned int bit_offset = SHA256_BLOCK_SIZE / 8 - 1;
diff --git a/include/crypto/sha2.h b/include/crypto/sha2.h
index 9a56286d736d..9853cd2d1291 100644
--- a/include/crypto/sha2.h
+++ b/include/crypto/sha2.h
@@ -100,9 +100,9 @@ static inline void sha256_init(struct sha256_state *sctx)
 	sctx->state[7] = SHA256_H7;
 	sctx->count = 0;
 }
-void sha256_update(struct sha256_state *sctx, const u8 *data, unsigned int len);
-void sha256_final(struct sha256_state *sctx, u8 *out);
-void sha256(const u8 *data, unsigned int len, u8 *out);
+void sha256_update(struct sha256_state *sctx, const u8 *data, size_t len);
+void sha256_final(struct sha256_state *sctx, u8 out[SHA256_DIGEST_SIZE]);
+void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE]);
 
 static inline void sha224_init(struct sha256_state *sctx)
 {
@@ -117,6 +117,6 @@ static inline void sha224_init(struct sha256_state *sctx)
 	sctx->count = 0;
 }
 /* Simply use sha256_update as it is equivalent to sha224_update. */
-void sha224_final(struct sha256_state *sctx, u8 *out);
+void sha224_final(struct sha256_state *sctx, u8 out[SHA224_DIGEST_SIZE]);
 
 #endif /* _CRYPTO_SHA2_H */
diff --git a/lib/crypto/sha256.c b/lib/crypto/sha256.c
index d2bd9fdb8571..107d2bdea682 100644
--- a/lib/crypto/sha256.c
+++ b/lib/crypto/sha256.c
@@ -33,7 +33,7 @@ static inline void sha256_blocks(u32 state[SHA256_STATE_WORDS], const u8 *data,
 			     sha256_force_generic(), false);
 }
 
-void sha256_update(struct sha256_state *sctx, const u8 *data, unsigned int len)
+void sha256_update(struct sha256_state *sctx, const u8 *data, size_t len)
 {
 	size_t partial = sctx->count % SHA256_BLOCK_SIZE;
 
@@ -43,8 +43,8 @@ void sha256_update(struct sha256_state *sctx, const u8 *data, unsigned int len)
 }
 EXPORT_SYMBOL(sha256_update);
 
-static void __sha256_final(struct sha256_state *sctx, u8 *out,
-			   size_t digest_size)
+static void __sha256_final(struct sha256_state *sctx,
+			   u8 out[SHA256_DIGEST_SIZE], size_t digest_size)
 {
 	unsigned int len = sctx->count % SHA256_BLOCK_SIZE;
 
@@ -54,19 +54,19 @@ static void __sha256_final(struct sha256_state *sctx, u8 *out,
 	memzero_explicit(sctx, sizeof(*sctx));
 }
 
-void sha256_final(struct sha256_state *sctx, u8 *out)
+void sha256_final(struct sha256_state *sctx, u8 out[SHA256_DIGEST_SIZE])
 {
 	__sha256_final(sctx, out, SHA256_DIGEST_SIZE);
 }
 EXPORT_SYMBOL(sha256_final);
 
-void sha224_final(struct sha256_state *sctx, u8 *out)
+void sha224_final(struct sha256_state *sctx, u8 out[SHA224_DIGEST_SIZE])
 {
 	__sha256_final(sctx, out, SHA224_DIGEST_SIZE);
 }
 EXPORT_SYMBOL(sha224_final);
 
-void sha256(const u8 *data, unsigned int len, u8 *out)
+void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE])
 {
 	struct sha256_state sctx;
 
-- 
2.39.5


