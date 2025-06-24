Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79349C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 15:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RO69daI5W04OIOGnZa1tJIfwSEk4z8uvJzpownmww5k=; b=3dsPJohYxQeuy1PrCaipuamLrU
	iBs0uN5hmpx2E6ohHkgFNAhpFPcVlSi8t5UTYYgWKzKK7S4m0+lDoOuPTVR7qGovRaNzHzTmN5RXx
	Il0j/cjtQ672sk0qNSo8nS5hE1Go22NrpmG4Ma7j88qW3WpOSZ1ZxHKvwk5dDXlVzdhZXBT2IEnNt
	g1cLgzpj+swWT4D4Opwp7hl4f0bGQVyGy/kkpmEIACl8Z5YCdUM4DmQFZxtZtB7yFQs12bWTEOWVj
	nIZRCujvUx9zD7snYbSI0Cb6C6ioW64VyRumLnmmInc6BYySzWsZ+Fu8H6WZ76iivlwsQAaw7cuU0
	yQNbZsnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5cl-000000067rC-19xd;
	Tue, 24 Jun 2025 15:31:51 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU45M-00000005n79-2xTg;
	Tue, 24 Jun 2025 13:53:17 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso575280e87.1;
        Tue, 24 Jun 2025 06:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750773195; x=1751377995; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RO69daI5W04OIOGnZa1tJIfwSEk4z8uvJzpownmww5k=;
        b=Eq9IqNsTe1+n9kZfgCT8+KiucGTo1J0nf2mlk7ttskMr15lyGbGEFoYY/aRgJFoKL6
         c7wLZ8/w9SDBGMyWtdm1uFPPqNFtjxbRf9N6bQJN7Q+ZQQgrEIuA/jGO4/HfTN3v12wk
         pYhsGEGCGcWhjzS+12phbD2ljg7Y4W7wjTRZIAKqMZ+YBVKA9DE5koQABoRyhDWVXcgL
         mwSwUhTkgph1Hz5X71Am8yguiSGCW3SMZw51Tqyyduv+2Is42zqk9ov4ct5JZIDY///W
         k/JqMTYuqkz/WPfK5/6x94St/DJm71FQdjOJZMJ2h4dhP1DPCZN3bn+Gkuu/u5w529Pr
         mPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773195; x=1751377995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RO69daI5W04OIOGnZa1tJIfwSEk4z8uvJzpownmww5k=;
        b=tij8CLWrgrxe5mxkV+4oH9HKFmPKbObgflXVaaTbwY3mAzwyYiI0BFmfv19DH5hnGz
         pKBOxPLrzyj7cGW7UvepkaTnYnBy355sNthM1mArlsLHu6e033Hl5PdewSEHde1n49Ty
         07ZSDHHgYS6ZNwqArp0/CRnhD86BWzjJieGdp0scGHMM1NJdtRrsSZobDPD/sqXHch9u
         /JB6qysDS05Q/r2jGimNJxHiotyjzXXvC+QkQrgsCDix8FA3Wduuj1/EXRwH1f/MYDuG
         x+by/Jsf/cQYClWlMoHZrYO6VhEjY+ZXA85yWbaQUiZCNyZh7RC+svMinz/rqRGjapYK
         qZNw==
X-Forwarded-Encrypted: i=1; AJvYcCV+apO9DGpUXqQJdO4pU24nunZ4/yfQ+U25cV35HmeheClH0Fb2gFo8w8/muvqTRdlBG8hAfoi3mF0Copcs@lists.infradead.org, AJvYcCVbx7gCy5g3n1POtEP42TmcCiTaXCzxkfchXnQxLWg5e+4gF/fs464HKvyTIHyHxua/+uKSOOk+608mWvLOkCv2zw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRL1RZhO/Tzlfk6hf31MzGuL03pVYli5RDLdFr3uoEWMyb6xDE
	s0vxylYzrz7NJM4r/tOE7fFETMQp2eUHJjDH4P3PgMoIwYXRSwScNOvz
X-Gm-Gg: ASbGncvQ5tZKhcrqcCYPTUUAnfgr3lY8vC7r31KtVknZR95of+kDHHPjzCthwS4voPM
	Lwn9QOeDKJSQ818A+T/5CNbiaG4if6wy+idGNQv9jbUFAX3IJhRA+B4DNwH1LP46B/KKLOsaP6H
	uvn6mAt6R1eDAj+fB0oxOA/BJ8KnMWcZ7PK8WUmdFSBRHU7UvlASDWztwWrTGf8aUJ9CDpW9nOR
	4/oFxtWb/xDTMeVhAFvyV3xcXI3T0LmPfCAgEjyOssc71yuvfHEBoVYNRxPOMSnkcl5iULZ+Riw
	kzj5AnoZyHeLScUOXstuDNV9slBAfA4kfuhOoeAe1eSt9rtvyFVuYmaFvup31jsrEb2WkVNgqnr
	nyDzruvgAi4Vr4AcidMITyHYxSqWTrzqm0T5dhlM9Ad3ZzBcCE3P05taWp3l78g==
X-Google-Smtp-Source: AGHT+IHqC0I7lY85uruxM8FbkichBl5lVOZaUMavYs1QcspMaDSIZ5c23RtGIRSTLmBN3qMhhWwupw==
X-Received: by 2002:a05:6512:3e0f:b0:553:2869:3a5 with SMTP id 2adb3069b0e04-553e3c07c9amr4738378e87.48.1750773195001;
        Tue, 24 Jun 2025 06:53:15 -0700 (PDT)
Received: from user-A520M-DS3H.sberdevices.ru (broadband-188-32-30-96.ip.moscow.rt.ru. [188.32.30.96])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-554e6dc186esm1282905e87.114.2025.06.24.06.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:53:14 -0700 (PDT)
From: Alexey Romanov <romanov.alexey2000@gmail.com>
To: neil.armstrong@linaro.org,
	clabbe@baylibre.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v12 08/22] crypto: amlogic - Cleanup defines
Date: Tue, 24 Jun 2025 16:52:00 +0300
Message-Id: <20250624135214.1355051-9-romanov.alexey2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
References: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_065316_766564_4AE16283 
X-CRM114-Status: GOOD (  12.74  )
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

It is bad to use hardcoded values directly in the code.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/crypto/amlogic/amlogic-gxl-cipher.c | 24 ++++++++++-----------
 drivers/crypto/amlogic/amlogic-gxl.h        | 16 ++++++++------
 2 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index bc3092a8a2c2..c662c4b86e97 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -141,8 +141,8 @@ static int meson_cipher(struct skcipher_request *areq)
 						 ivsize, 0);
 		}
 	}
-	if (keyivlen == 24)
-		keyivlen = 32;
+	if (keyivlen == AES_KEYSIZE_192)
+		keyivlen = AES_MAX_KEY_SIZE;
 
 	phykeyiv = dma_map_single(mc->dev, bkeyiv, keyivlen,
 				  DMA_TO_DEVICE);
@@ -161,7 +161,7 @@ static int meson_cipher(struct skcipher_request *areq)
 		todo = min(keyivlen - eat, 16u);
 		desc->t_src = cpu_to_le32(phykeyiv + i * 16);
 		desc->t_dst = cpu_to_le32(i * 16);
-		v = (MODE_KEY << 20) | DESC_OWN | 16;
+		v = DESC_MODE_KEY | DESC_OWN | 16;
 		desc->t_status = cpu_to_le32(v);
 
 		eat += todo;
@@ -205,7 +205,7 @@ static int meson_cipher(struct skcipher_request *areq)
 		desc->t_src = cpu_to_le32(sg_dma_address(src_sg));
 		desc->t_dst = cpu_to_le32(sg_dma_address(dst_sg));
 		todo = min(len, sg_dma_len(src_sg));
-		v = (op->keymode << 20) | DESC_OWN | todo | (algt->blockmode << 26);
+		v = op->keymode | DESC_OWN | todo | algt->blockmode;
 		if (rctx->op_dir)
 			v |= DESC_ENCRYPTION;
 		len -= todo;
@@ -348,14 +348,14 @@ static int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 	struct meson_dev *mc = op->mc;
 
 	switch (keylen) {
-	case 128 / 8:
-		op->keymode = MODE_AES_128;
+	case AES_KEYSIZE_128:
+		op->keymode = DESC_MODE_AES_128;
 		break;
-	case 192 / 8:
-		op->keymode = MODE_AES_192;
+	case AES_KEYSIZE_192:
+		op->keymode = DESC_MODE_AES_192;
 		break;
-	case 256 / 8:
-		op->keymode = MODE_AES_256;
+	case AES_KEYSIZE_256:
+		op->keymode = DESC_MODE_AES_256;
 		break;
 	default:
 		dev_dbg(mc->dev, "ERROR: Invalid keylen %u\n", keylen);
@@ -373,7 +373,7 @@ static int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 static struct meson_alg_template algs[] = {
 {
 	.type = CRYPTO_ALG_TYPE_SKCIPHER,
-	.blockmode = MESON_OPMODE_CBC,
+	.blockmode = DESC_OPMODE_CBC,
 	.alg.skcipher.base = {
 		.base = {
 			.cra_name = "cbc(aes)",
@@ -402,7 +402,7 @@ static struct meson_alg_template algs[] = {
 },
 {
 	.type = CRYPTO_ALG_TYPE_SKCIPHER,
-	.blockmode = MESON_OPMODE_ECB,
+	.blockmode = DESC_OPMODE_ECB,
 	.alg.skcipher.base = {
 		.base = {
 			.cra_name = "ecb(aes)",
diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
index f0ccd28545aa..8f20903842ec 100644
--- a/drivers/crypto/amlogic/amlogic-gxl.h
+++ b/drivers/crypto/amlogic/amlogic-gxl.h
@@ -11,19 +11,21 @@
 #include <linux/crypto.h>
 #include <linux/scatterlist.h>
 
-#define MODE_KEY 1
-#define MODE_AES_128 0x8
-#define MODE_AES_192 0x9
-#define MODE_AES_256 0xa
-
 #define MESON_DECRYPT 0
 #define MESON_ENCRYPT 1
 
-#define MESON_OPMODE_ECB 0
-#define MESON_OPMODE_CBC 1
+#define DESC_MODE_KEY (0x1 << 20)
+#define DESC_MODE_AES_128 (0x8 << 20)
+#define DESC_MODE_AES_192 (0x9 << 20)
+#define DESC_MODE_AES_256 (0xa << 20)
 
 #define MAXDESC 64
 
+#define DESC_OPMODE_ECB (0 << 26)
+#define DESC_OPMODE_CBC (1 << 26)
+
+#define DESC_MAXLEN GENMASK(16, 0)
+
 #define DESC_LAST BIT(18)
 #define DESC_ENCRYPTION BIT(28)
 #define DESC_OWN BIT(31)
-- 
2.34.1


