Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535AAC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 07:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PcFZk+cTBpCiBUySXbXFUd4zh3qawFC29H5nrbpKhJc=; b=I7rWshDHi3kfShD5dTqd2XvXFS
	J0wKqvNeF+rf7kT0pZJkurPlreCkmpG8Z/jX0ODmEU1SJLje18jiOCeMQyG1V0xVYJ2NqGc2mim2t
	2Rl4rvqO7RNWmms5A4+Vd/KkDugIF4LC2RdWQjDPrdFDYMso3FPCIf2cSlbLcvZ60dt6e9r+Ns7vK
	zmQbCDfNk22GkMeVeCkX6kZ3lXcvC1Mc4KY0B09rm7QIpNTaHjid0dk8VEckhU2WPJgoOD5+Py/9M
	RoYEuD5k68MpvEyasw3K8VrSViAxwUZeGMy+sbtah18SscGNz7MxcEsd7yA5jn0l/GHr7XXb99nLQ
	L/uhM3Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Ewy-000000086Fv-1s8B;
	Thu, 03 Apr 2025 07:25:20 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Ery-000000085HK-0beQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 07:20:11 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-391315098b2so258976f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 00:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743664808; x=1744269608; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PcFZk+cTBpCiBUySXbXFUd4zh3qawFC29H5nrbpKhJc=;
        b=fX0012EAju8ArIUgbOuyTbCe/xc+9cS1VohGpmGMzhQCnxRDZ2Fr710FMSJThHabKa
         9IcP3tFr0Eo/IW1RG4oRiehOM9D5tf/RCIt0eLYClPzQNVFXtvGuoeqaDsXQj5b2tl6X
         kYR9i1lmMsEssPAk2I1xrVS/OT1mGiKIijltfhV+4THfYvfxdSASgFjw1tt64BBPK/nu
         UI2uvMqTwcTkPTZYXuprPW0wI6xKA5grfwJErI9mHm2KpdKuUkkSqotflMc8N/bgu0By
         vOEtsj2t9Uj2Z1ErB1hRhJx//gTlleRVdYUxQJe4PMUfXX1Dajt26AIoi/htQL7dmOgc
         CY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743664808; x=1744269608;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PcFZk+cTBpCiBUySXbXFUd4zh3qawFC29H5nrbpKhJc=;
        b=uez4ZJpQGcyjVedFdKq3MYkKfjeor9EqzMUcgxzXDCnPNsh8PbaORrsn+tSK67MEZQ
         qgv5rgSnM3zFCE8xf5fzelHqndGiO3Jci9aysk1yqYIun77X309iKN2LdftGLA06gsfW
         Jv3g3dPsndIItc7v1cm5ulnh12X8KOX07GJuXOAVzUaaWGzdCopNQrqm6aZP6EPOSIwA
         E1MUXSAxitw48410Abm4lb+fH43QdLnAD6Q7ezDN63GPeYBipq24/GT/pWGpvo23ak8B
         Ckl3VVFCpqMKC/WxsQJq8kxEDlvGW0l+giN1r1M7YGih3tgjqEbKLqw91f9+JrsLWxMp
         D3og==
X-Gm-Message-State: AOJu0Ywy+20otgtjQZ8xaWTTk5qcf67uzVfqPSf1yuMnDfdtjW+7FgDW
	/yrGeKXZ4oS6Bi5cUnvC/d8rJ2dJNBxWZxqj6fBhuunBRoLNenyEqnXMLxDkA2H8tYPfoQ==
X-Google-Smtp-Source: AGHT+IE+UGU2lxSa+0dYxVwsac6dAuqnT+W910JV+Ov6KJP2ZKeedHZ4gtKXHLmEunkrrWcgfGdBr+Q4
X-Received: from wmbfl9.prod.google.com ([2002:a05:600c:b89:b0:43c:f03d:18aa])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2287:b0:39c:11c0:eb95
 with SMTP id ffacd0b85a97d-39c2f8d28cbmr1045995f8f.17.1743664808229; Thu, 03
 Apr 2025 00:20:08 -0700 (PDT)
Date: Thu,  3 Apr 2025 09:19:55 +0200
In-Reply-To: <20250403071953.2296514-5-ardb+git@google.com>
Mime-Version: 1.0
References: <20250403071953.2296514-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=6600; i=ardb@kernel.org;
 h=from:subject; bh=2nAo/Tnu187qbmrnZyKTrYR/qO/zBrfZ9e5zFBj1pIc=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIf2d2TyPr1cWfpE4sWfK+9vbW2KufdjYeehn/6fCWzbrj
 ffJOX2401HKwiDGwSArpsgiMPvvu52nJ0rVOs+ShZnDygQyhIGLUwAmUq3G8L9qslLLwy8t6l7/
 WQ5/F1x1wOnM5dw/JTF3f6nviuD7/lyf4a+YVHL81zi/mNQHmyM43i0y2vyP42h8nkDoz9SQSUY JBZwA
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250403071953.2296514-6-ardb+git@google.com>
Subject: [PATCH v2 1/3] crypto: arm/aes-ce - stop using the SIMD helper
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-crypto@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, herbert@gondor.apana.org.au, 
	ebiggers@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_002010_191691_7F336CCC 
X-CRM114-Status: GOOD (  18.01  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Now that ARM permits use of the NEON unit in softirq context as well as
task context, there is no longer a need to rely on the SIMD helper
module to construct async skciphers wrapping the sync ones, as the
latter can always be called directly.

So remove these wrappers and the dependency on the SIMD helper. This
permits the use of these algorithms by callers that only support
synchronous use.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm/crypto/Kconfig       |   1 -
 arch/arm/crypto/aes-ce-glue.c | 104 +++-----------------
 2 files changed, 11 insertions(+), 94 deletions(-)

diff --git a/arch/arm/crypto/Kconfig b/arch/arm/crypto/Kconfig
index 23e4ea067ddb..2e73200b930a 100644
--- a/arch/arm/crypto/Kconfig
+++ b/arch/arm/crypto/Kconfig
@@ -200,7 +200,6 @@ config CRYPTO_AES_ARM_CE
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_AES
-	select CRYPTO_SIMD
 	help
 	  Length-preserving ciphers: AES cipher algorithms (FIPS-197)
 	   with block cipher modes:
diff --git a/arch/arm/crypto/aes-ce-glue.c b/arch/arm/crypto/aes-ce-glue.c
index 1cf61f51e766..00591895d540 100644
--- a/arch/arm/crypto/aes-ce-glue.c
+++ b/arch/arm/crypto/aes-ce-glue.c
@@ -10,8 +10,6 @@
 #include <asm/simd.h>
 #include <linux/unaligned.h>
 #include <crypto/aes.h>
-#include <crypto/ctr.h>
-#include <crypto/internal/simd.h>
 #include <crypto/internal/skcipher.h>
 #include <crypto/scatterwalk.h>
 #include <linux/cpufeature.h>
@@ -418,29 +416,6 @@ static int ctr_encrypt(struct skcipher_request *req)
 	return err;
 }
 
-static void ctr_encrypt_one(struct crypto_skcipher *tfm, const u8 *src, u8 *dst)
-{
-	struct crypto_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
-	unsigned long flags;
-
-	/*
-	 * Temporarily disable interrupts to avoid races where
-	 * cachelines are evicted when the CPU is interrupted
-	 * to do something else.
-	 */
-	local_irq_save(flags);
-	aes_encrypt(ctx, dst, src);
-	local_irq_restore(flags);
-}
-
-static int ctr_encrypt_sync(struct skcipher_request *req)
-{
-	if (!crypto_simd_usable())
-		return crypto_ctr_encrypt_walk(req, ctr_encrypt_one);
-
-	return ctr_encrypt(req);
-}
-
 static int xts_encrypt(struct skcipher_request *req)
 {
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
@@ -586,10 +561,9 @@ static int xts_decrypt(struct skcipher_request *req)
 }
 
 static struct skcipher_alg aes_algs[] = { {
-	.base.cra_name		= "__ecb(aes)",
-	.base.cra_driver_name	= "__ecb-aes-ce",
+	.base.cra_name		= "ecb(aes)",
+	.base.cra_driver_name	= "ecb-aes-ce",
 	.base.cra_priority	= 300,
-	.base.cra_flags		= CRYPTO_ALG_INTERNAL,
 	.base.cra_blocksize	= AES_BLOCK_SIZE,
 	.base.cra_ctxsize	= sizeof(struct crypto_aes_ctx),
 	.base.cra_module	= THIS_MODULE,
@@ -600,10 +574,9 @@ static struct skcipher_alg aes_algs[] = { {
 	.encrypt		= ecb_encrypt,
 	.decrypt		= ecb_decrypt,
 }, {
-	.base.cra_name		= "__cbc(aes)",
-	.base.cra_driver_name	= "__cbc-aes-ce",
+	.base.cra_name		= "cbc(aes)",
+	.base.cra_driver_name	= "cbc-aes-ce",
 	.base.cra_priority	= 300,
-	.base.cra_flags		= CRYPTO_ALG_INTERNAL,
 	.base.cra_blocksize	= AES_BLOCK_SIZE,
 	.base.cra_ctxsize	= sizeof(struct crypto_aes_ctx),
 	.base.cra_module	= THIS_MODULE,
@@ -615,10 +588,9 @@ static struct skcipher_alg aes_algs[] = { {
 	.encrypt		= cbc_encrypt,
 	.decrypt		= cbc_decrypt,
 }, {
-	.base.cra_name		= "__cts(cbc(aes))",
-	.base.cra_driver_name	= "__cts-cbc-aes-ce",
+	.base.cra_name		= "cts(cbc(aes))",
+	.base.cra_driver_name	= "cts-cbc-aes-ce",
 	.base.cra_priority	= 300,
-	.base.cra_flags		= CRYPTO_ALG_INTERNAL,
 	.base.cra_blocksize	= AES_BLOCK_SIZE,
 	.base.cra_ctxsize	= sizeof(struct crypto_aes_ctx),
 	.base.cra_module	= THIS_MODULE,
@@ -631,10 +603,9 @@ static struct skcipher_alg aes_algs[] = { {
 	.encrypt		= cts_cbc_encrypt,
 	.decrypt		= cts_cbc_decrypt,
 }, {
-	.base.cra_name		= "__ctr(aes)",
-	.base.cra_driver_name	= "__ctr-aes-ce",
+	.base.cra_name		= "ctr(aes)",
+	.base.cra_driver_name	= "ctr-aes-ce",
 	.base.cra_priority	= 300,
-	.base.cra_flags		= CRYPTO_ALG_INTERNAL,
 	.base.cra_blocksize	= 1,
 	.base.cra_ctxsize	= sizeof(struct crypto_aes_ctx),
 	.base.cra_module	= THIS_MODULE,
@@ -647,25 +618,9 @@ static struct skcipher_alg aes_algs[] = { {
 	.encrypt		= ctr_encrypt,
 	.decrypt		= ctr_encrypt,
 }, {
-	.base.cra_name		= "ctr(aes)",
-	.base.cra_driver_name	= "ctr-aes-ce-sync",
-	.base.cra_priority	= 300 - 1,
-	.base.cra_blocksize	= 1,
-	.base.cra_ctxsize	= sizeof(struct crypto_aes_ctx),
-	.base.cra_module	= THIS_MODULE,
-
-	.min_keysize		= AES_MIN_KEY_SIZE,
-	.max_keysize		= AES_MAX_KEY_SIZE,
-	.ivsize			= AES_BLOCK_SIZE,
-	.chunksize		= AES_BLOCK_SIZE,
-	.setkey			= ce_aes_setkey,
-	.encrypt		= ctr_encrypt_sync,
-	.decrypt		= ctr_encrypt_sync,
-}, {
-	.base.cra_name		= "__xts(aes)",
-	.base.cra_driver_name	= "__xts-aes-ce",
+	.base.cra_name		= "xts(aes)",
+	.base.cra_driver_name	= "xts-aes-ce",
 	.base.cra_priority	= 300,
-	.base.cra_flags		= CRYPTO_ALG_INTERNAL,
 	.base.cra_blocksize	= AES_BLOCK_SIZE,
 	.base.cra_ctxsize	= sizeof(struct crypto_aes_xts_ctx),
 	.base.cra_module	= THIS_MODULE,
@@ -679,51 +634,14 @@ static struct skcipher_alg aes_algs[] = { {
 	.decrypt		= xts_decrypt,
 } };
 
-static struct simd_skcipher_alg *aes_simd_algs[ARRAY_SIZE(aes_algs)];
-
 static void aes_exit(void)
 {
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(aes_simd_algs) && aes_simd_algs[i]; i++)
-		simd_skcipher_free(aes_simd_algs[i]);
-
 	crypto_unregister_skciphers(aes_algs, ARRAY_SIZE(aes_algs));
 }
 
 static int __init aes_init(void)
 {
-	struct simd_skcipher_alg *simd;
-	const char *basename;
-	const char *algname;
-	const char *drvname;
-	int err;
-	int i;
-
-	err = crypto_register_skciphers(aes_algs, ARRAY_SIZE(aes_algs));
-	if (err)
-		return err;
-
-	for (i = 0; i < ARRAY_SIZE(aes_algs); i++) {
-		if (!(aes_algs[i].base.cra_flags & CRYPTO_ALG_INTERNAL))
-			continue;
-
-		algname = aes_algs[i].base.cra_name + 2;
-		drvname = aes_algs[i].base.cra_driver_name + 2;
-		basename = aes_algs[i].base.cra_driver_name;
-		simd = simd_skcipher_create_compat(aes_algs + i, algname, drvname, basename);
-		err = PTR_ERR(simd);
-		if (IS_ERR(simd))
-			goto unregister_simds;
-
-		aes_simd_algs[i] = simd;
-	}
-
-	return 0;
-
-unregister_simds:
-	aes_exit();
-	return err;
+	return crypto_register_skciphers(aes_algs, ARRAY_SIZE(aes_algs));
 }
 
 module_cpu_feature_match(AES, aes_init);
-- 
2.49.0.472.ge94155a9ec-goog


