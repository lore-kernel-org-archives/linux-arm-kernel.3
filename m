Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81FAD49793
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 01:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=710RFBmGsjX2YG7fhFrhLJpisCuudrgWgQ6Gyze+LAs=; b=JUEmLNmCm9wvrV2OpbhG59aQsu
	myFNoGWSUhIyo25zUeH/E0rc7XwtYh3FQtN3oN9II5o1J5gS8EfbemaPAr6upDHSaAG138xuhmvDv
	hxBoLQ9CX0TpUpDHOh2IJEinOktmuHO41PnzHexS9YJX6QvFDJmIBh+1vJ++5uU28jBC1ZSLN8tDk
	XNRQ2fbjxii/N54Bs9DNa+x0X3oj2ZCJLEEvPjTUFLC3RZBoEcYZhtiYKh69Hc/1JqPeIcyAHUYQM
	WyotGvGyLDZrzARAOh/uMcIe7ZFYWnnpc5wAvUy8t9HTZ+qqdrpopzh426eWPhsTSSPvzj/tF7K8S
	loH06lxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHvQ9-00000004jwn-3Gfq;
	Mon, 02 Dec 2024 01:40:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHv85-00000004hQu-2G3r
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Dec 2024 01:21:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=710RFBmGsjX2YG7fhFrhLJpisCuudrgWgQ6Gyze+LAs=; b=YlIKzA56Iw4iMGFcqQdj7L1a4D
	v57mMAFLd2BGHLVLf78D2CKxfJoIuhMgGYDaJ9Jz2ZuHU2HaEspGJuprqMh8v++M4D9wabPcVURj2
	V9/+CUTnUCC9WylGkNedGjtsBwVpErup6dfD22RM6udvIzga6OfrY4ykKTYcFwikCnJtUwQw93URL
	WXlNWSJcavdSy0027gs4Ybqd16BHly6JIAP6V7btnuOJgUk9X3p3CyhIIyw/jV9pHiqJ4HARZmT14
	M6qk8vlhocIyRDAI/HCYRdquTMS0yLMxt9MMzLWriELWS00qGAT6WPq/HZOzGOh5dESd6NB8ep1wk
	u2OcaiGw==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHv80-000000024jy-1fdS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 01:21:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7FD21A40C31;
	Mon,  2 Dec 2024 01:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81811C4CEE3;
	Mon,  2 Dec 2024 01:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733102489;
	bh=zOpYjUq7IQjKYIrBHyUZaVOUe0+fJqvMIlVQKF8tL0k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uai+Cmj9j4A5P2GS5WcQnAxocOeWsVEwvyY8SeucQw2OkVH3+H0ju+3XodE3WUhjm
	 IetkN0BFtXZzJHJkKPm38BROhdzjnJvjZuVYNRz+oJi0J6p0EulS5ZZwtNZRZlW+JN
	 YG6DKvPLc8JaIy9odQYgKTxJRIvsa3yRbyJ7t4POK/1jomC1TrH48M6UkYTYfEqWJN
	 U+hIi40pO1eLq/Ux+3HDkDhigE4eo5RvPS8vFJrpsleYrm7Bm8UWy+FGd8ykUtigIT
	 86HnhwIVcWZv7LwSRMVPNH1anQmBJw0pn5v7QyrdTNCXZQdif9jP8TPcHqCy1NYZgS
	 lzwosfEA5MdKA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [PATCH v2 03/12] crypto: crct10dif - expose arch-optimized lib function
Date: Sun,  1 Dec 2024 17:20:47 -0800
Message-ID: <20241202012056.209768-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241202012056.209768-1-ebiggers@kernel.org>
References: <20241202012056.209768-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_012134_334317_70E1BBFB 
X-CRM114-Status: GOOD (  12.81  )
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

Now that crc_t10dif_update() may be directly optimized for each
architecture, make the shash driver for crct10dif register a
crct10dif-$arch algorithm that uses it, instead of only
crct10dif-generic which uses crc_t10dif_generic().

The result is that architecture-optimized crct10dif will remain
available through the shash API once the architectures implement
crc_t10dif_arch() instead of the shash API.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 crypto/Makefile            |  1 +
 crypto/crct10dif_generic.c | 82 +++++++++++++++++++++++++++++---------
 2 files changed, 65 insertions(+), 18 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 0537df1719d3..ffd94c7f2643 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -156,10 +156,11 @@ obj-$(CONFIG_CRYPTO_MICHAEL_MIC) += michael_mic.o
 obj-$(CONFIG_CRYPTO_CRC32C) += crc32c_generic.o
 obj-$(CONFIG_CRYPTO_CRC32) += crc32_generic.o
 CFLAGS_crc32c_generic.o += -DARCH=$(ARCH)
 CFLAGS_crc32_generic.o += -DARCH=$(ARCH)
 obj-$(CONFIG_CRYPTO_CRCT10DIF) += crct10dif_generic.o
+CFLAGS_crct10dif_generic.o += -DARCH=$(ARCH)
 obj-$(CONFIG_CRYPTO_CRC64_ROCKSOFT) += crc64_rocksoft_generic.o
 obj-$(CONFIG_CRYPTO_AUTHENC) += authenc.o authencesn.o
 obj-$(CONFIG_CRYPTO_LZO) += lzo.o lzo-rle.o
 obj-$(CONFIG_CRYPTO_LZ4) += lz4.o
 obj-$(CONFIG_CRYPTO_LZ4HC) += lz4hc.o
diff --git a/crypto/crct10dif_generic.c b/crypto/crct10dif_generic.c
index e843982073bb..259cb01932cb 100644
--- a/crypto/crct10dif_generic.c
+++ b/crypto/crct10dif_generic.c
@@ -55,10 +55,19 @@ static int chksum_update(struct shash_desc *desc, const u8 *data,
 
 	ctx->crc = crc_t10dif_generic(ctx->crc, data, length);
 	return 0;
 }
 
+static int chksum_update_arch(struct shash_desc *desc, const u8 *data,
+			      unsigned int length)
+{
+	struct chksum_desc_ctx *ctx = shash_desc_ctx(desc);
+
+	ctx->crc = crc_t10dif_update(ctx->crc, data, length);
+	return 0;
+}
+
 static int chksum_final(struct shash_desc *desc, u8 *out)
 {
 	struct chksum_desc_ctx *ctx = shash_desc_ctx(desc);
 
 	*(__u16 *)out = ctx->crc;
@@ -69,49 +78,86 @@ static int __chksum_finup(__u16 crc, const u8 *data, unsigned int len, u8 *out)
 {
 	*(__u16 *)out = crc_t10dif_generic(crc, data, len);
 	return 0;
 }
 
+static int __chksum_finup_arch(__u16 crc, const u8 *data, unsigned int len,
+			       u8 *out)
+{
+	*(__u16 *)out = crc_t10dif_update(crc, data, len);
+	return 0;
+}
+
 static int chksum_finup(struct shash_desc *desc, const u8 *data,
 			unsigned int len, u8 *out)
 {
 	struct chksum_desc_ctx *ctx = shash_desc_ctx(desc);
 
 	return __chksum_finup(ctx->crc, data, len, out);
 }
 
+static int chksum_finup_arch(struct shash_desc *desc, const u8 *data,
+			     unsigned int len, u8 *out)
+{
+	struct chksum_desc_ctx *ctx = shash_desc_ctx(desc);
+
+	return __chksum_finup_arch(ctx->crc, data, len, out);
+}
+
 static int chksum_digest(struct shash_desc *desc, const u8 *data,
 			 unsigned int length, u8 *out)
 {
 	return __chksum_finup(0, data, length, out);
 }
 
-static struct shash_alg alg = {
-	.digestsize		=	CRC_T10DIF_DIGEST_SIZE,
-	.init		=	chksum_init,
-	.update		=	chksum_update,
-	.final		=	chksum_final,
-	.finup		=	chksum_finup,
-	.digest		=	chksum_digest,
-	.descsize		=	sizeof(struct chksum_desc_ctx),
-	.base			=	{
-		.cra_name		=	"crct10dif",
-		.cra_driver_name	=	"crct10dif-generic",
-		.cra_priority		=	100,
-		.cra_blocksize		=	CRC_T10DIF_BLOCK_SIZE,
-		.cra_module		=	THIS_MODULE,
-	}
-};
+static int chksum_digest_arch(struct shash_desc *desc, const u8 *data,
+			      unsigned int length, u8 *out)
+{
+	return __chksum_finup_arch(0, data, length, out);
+}
+
+static struct shash_alg algs[] = {{
+	.digestsize		= CRC_T10DIF_DIGEST_SIZE,
+	.init			= chksum_init,
+	.update			= chksum_update,
+	.final			= chksum_final,
+	.finup			= chksum_finup,
+	.digest			= chksum_digest,
+	.descsize		= sizeof(struct chksum_desc_ctx),
+	.base.cra_name		= "crct10dif",
+	.base.cra_driver_name	= "crct10dif-generic",
+	.base.cra_priority	= 100,
+	.base.cra_blocksize	= CRC_T10DIF_BLOCK_SIZE,
+	.base.cra_module	= THIS_MODULE,
+}, {
+	.digestsize		= CRC_T10DIF_DIGEST_SIZE,
+	.init			= chksum_init,
+	.update			= chksum_update_arch,
+	.final			= chksum_final,
+	.finup			= chksum_finup_arch,
+	.digest			= chksum_digest_arch,
+	.descsize		= sizeof(struct chksum_desc_ctx),
+	.base.cra_name		= "crct10dif",
+	.base.cra_driver_name	= "crct10dif-" __stringify(ARCH),
+	.base.cra_priority	= 150,
+	.base.cra_blocksize	= CRC_T10DIF_BLOCK_SIZE,
+	.base.cra_module	= THIS_MODULE,
+}};
+
+static int num_algs;
 
 static int __init crct10dif_mod_init(void)
 {
-	return crypto_register_shash(&alg);
+	/* register the arch flavor only if it differs from the generic one */
+	num_algs = 1 + crc_t10dif_is_optimized();
+
+	return crypto_register_shashes(algs, num_algs);
 }
 
 static void __exit crct10dif_mod_fini(void)
 {
-	crypto_unregister_shash(&alg);
+	crypto_unregister_shashes(algs, num_algs);
 }
 
 subsys_initcall(crct10dif_mod_init);
 module_exit(crct10dif_mod_fini);
 
-- 
2.47.1


