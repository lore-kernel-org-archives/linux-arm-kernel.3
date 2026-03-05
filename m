Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98921F47CB0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 18:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4FzuoEEpRY+L14uQlsGmCRGMqZLXTc3G6agjBXy78yU=; b=FkihNU5A4SbqEdPUDYl9hqIvTh
	yY9I0L5Huw6+qFdSIeqrkus4/xX6XC5Z6TrZ6JMWrgxB2QhyW7uqPJquh6pPhKoZUlCA+QXQldb/D
	AxNsn/XGCGmHSZN1WmNurp8ySs0IIbzNwWJl+nQc6oZX5M12ReYRCqGZ4s50GNfq6lIkVaEcyDudd
	hbHtG3Pl8OoEtuJ6TukvgRG24lBv/DCbWN3cZ5s9gbSSpKihHJAdQYiWo9W3xo4FuElk8eZ0ER9M2
	mLfkxayGmc5+aBZheZhB2YrKbhPEXGTJXE8gInh5luz/nURrtkcuTDth4P9d9FmKqmnp0pIOwhI7E
	C3sg/+Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyDV4-00000002O8o-1DRt;
	Thu, 05 Mar 2026 18:32:42 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyDV2-00000002O8J-0yrO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 18:32:41 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-82735a41920so3241291b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 10:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772735560; x=1773340360; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FzuoEEpRY+L14uQlsGmCRGMqZLXTc3G6agjBXy78yU=;
        b=c32L3xYJiMbOQF0XYGR9vnmIrJ+Gmf41VPtM+8nuKdNXSodQH97IkP23qC/zD8ouiR
         5wIOUh3PbGOCW+ANd+hyLd2gzqg4Gb9aV+cwTXQX4raaGa/dCulzDaXqIJXD78Qt/9sY
         Bwp34Eq1ZBeqWny2gxH3FfyPsyzBQStZGrJFth7/NwCprYA3Np0TlNRs0d9wfEiVoINB
         n508y/t43ThEQV0gu9zywp+HmM/hkkm3LYZGVl9v5hOzQomPmB2kfPhJX9XGBHCXBXN9
         m2SFnh4meroou7TMOjHvNK4c3CwhHgf0puLGbz7fvXMpBXjA/dVWyl2qTypUeQ6eKSPV
         DTLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772735560; x=1773340360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4FzuoEEpRY+L14uQlsGmCRGMqZLXTc3G6agjBXy78yU=;
        b=WKWQHUWZgePwjxBE1WIvM+qsEio/YTTC51nTtMlSY2X75IYVX9ORPKXXpdjeCh2EnD
         9Ru/jQ+zfO8+iDs/Kjoqd/qJWb+Q0BW/uxeI8rXH/6bOMe8vx8O+3bgciPpHH6gr6hBi
         dFoeZZNHYAmLJIeGNMclDQWzDaYRRdFos64loX6G3pfmLysGkevt0afl3gfjsGP3jawC
         UEE8qqSHi1Cuh8uVRsfdfE/MQQw0HPYwW6Nwf8fBQN6SLSv6H6RE9U7tLhelPg+KaNQY
         KIsAfW6Ou/qWP5UoS7GzcbPxu6xP6zVPlxVM/mTtJAHUM5jLf/UplAcA1XQzUqaeMDNR
         s/Dw==
X-Forwarded-Encrypted: i=1; AJvYcCWllZ5ks9GhN/DRPP+08aM2kd99xnnEplm5ksNGhGAKMUOBIwC/PCCNlo+rbs0DIp86rkZprKOJj3RvhJ63a/JQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwcTV58IVdQOXIZoT5927oRi01CgFaTMmrJ2qFqgCNfh74QvthX
	n3+AqtZs7OgG9ob1XV+vNvaOQ9RM6wJOsPDhl+PvtMF5jBWqS/1qiKdP
X-Gm-Gg: ATEYQzzXQFwxOlF1PFSAtLT9AX/Wl9KcXjivm60bSarcvtI+nvp/00cTTmA3iVFV4Yt
	HDQ07lf407/RNKQBcKoN5TMFNvZ42BXZVoEI/86ORux6QFnWvVzlZam/nM2emyJu63zE5WTFnlF
	OcaXUQfzrocEj29/suJg3IeJJTcoDQJQXEziI6rS6tl/O4wRYrG4gXkSw561/1zHDtx2KHgTRpi
	BENuBNzu0xiYLPQSIpVYFLE8m1m4FoLMVAy5f9jaKA8nDChjlVXMMSGstERw6APr8JApRPT+/o/
	vJWi6Q+UphZ1x2Ll99wQ5kAz2Kro2KuVN3ehlre5jHWis/03CWowy+STYwBEzlNDEYvwV1T9yyD
	IlUyQCiTQ5DMUrPnwnQzNaQyodsmn+uH1hacGmyP5163Qr2bAFFnlOzraTvL6H+yRKk1VQrgEp/
	waScluMARBXuBaF/xz2OwnOsnAOdtoow==
X-Received: by 2002:a05:6a00:2482:b0:829:7245:92f7 with SMTP id d2e1a72fcca58-8299aa203e0mr484415b3a.3.1772735559482;
        Thu, 05 Mar 2026 10:32:39 -0800 (PST)
Received: from arm-server.. ([2001:288:7001:2724:1a31:bfff:fe58:b622])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829898e1417sm2554420b3a.62.2026.03.05.10.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 10:32:39 -0800 (PST)
From: Cheng-Yang Chou <yphbchou0911@gmail.com>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: jserv@ccns.ncku.edu.tw,
	yphbchou0911@gmail.com
Subject: [PATCH 1/1] crypto: arm64/aes-neonbs - Move key expansion off the stack
Date: Fri,  6 Mar 2026 02:32:24 +0800
Message-ID: <20260305183229.150599-2-yphbchou0911@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260305183229.150599-1-yphbchou0911@gmail.com>
References: <20260305183229.150599-1-yphbchou0911@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_103240_290827_BED16495 
X-CRM114-Status: GOOD (  11.14  )
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

aesbs_setkey() and aesbs_cbc_ctr_setkey() trigger -Wframe-larger-than=
warnings due to struct crypto_aes_ctx being allocated on the stack,
causing the frame size to exceed 1024 bytes.

Allocate struct crypto_aes_ctx on the heap instead to reduce stack
usage. Use a goto-based cleanup path to ensure memzero_explicit() and
kfree() are always called.

Signed-off-by: Cheng-Yang Chou <yphbchou0911@gmail.com>
---
 arch/arm64/crypto/aes-neonbs-glue.c | 39 ++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/crypto/aes-neonbs-glue.c b/arch/arm64/crypto/aes-neonbs-glue.c
index cb87c8fc66b3..a24b66fd5cad 100644
--- a/arch/arm64/crypto/aes-neonbs-glue.c
+++ b/arch/arm64/crypto/aes-neonbs-glue.c
@@ -76,19 +76,25 @@ static int aesbs_setkey(struct crypto_skcipher *tfm, const u8 *in_key,
 			unsigned int key_len)
 {
 	struct aesbs_ctx *ctx = crypto_skcipher_ctx(tfm);
-	struct crypto_aes_ctx rk;
+	struct crypto_aes_ctx *rk;
 	int err;
 
-	err = aes_expandkey(&rk, in_key, key_len);
+	rk = kmalloc(sizeof(*rk), GFP_KERNEL);
+	if (!rk)
+		return -ENOMEM;
+
+	err = aes_expandkey(rk, in_key, key_len);
 	if (err)
-		return err;
+		goto out;
 
 	ctx->rounds = 6 + key_len / 4;
 
 	scoped_ksimd()
-		aesbs_convert_key(ctx->rk, rk.key_enc, ctx->rounds);
-
-	return 0;
+		aesbs_convert_key(ctx->rk, rk->key_enc, ctx->rounds);
+out:
+	memzero_explicit(rk, sizeof(*rk));
+	kfree(rk);
+	return err;
 }
 
 static int __ecb_crypt(struct skcipher_request *req,
@@ -133,22 +139,27 @@ static int aesbs_cbc_ctr_setkey(struct crypto_skcipher *tfm, const u8 *in_key,
 			    unsigned int key_len)
 {
 	struct aesbs_cbc_ctr_ctx *ctx = crypto_skcipher_ctx(tfm);
-	struct crypto_aes_ctx rk;
+	struct crypto_aes_ctx *rk;
 	int err;
 
-	err = aes_expandkey(&rk, in_key, key_len);
+	rk = kmalloc(sizeof(*rk), GFP_KERNEL);
+	if (!rk)
+		return -ENOMEM;
+
+	err = aes_expandkey(rk, in_key, key_len);
 	if (err)
-		return err;
+		goto out;
 
 	ctx->key.rounds = 6 + key_len / 4;
 
-	memcpy(ctx->enc, rk.key_enc, sizeof(ctx->enc));
+	memcpy(ctx->enc, rk->key_enc, sizeof(ctx->enc));
 
 	scoped_ksimd()
-		aesbs_convert_key(ctx->key.rk, rk.key_enc, ctx->key.rounds);
-	memzero_explicit(&rk, sizeof(rk));
-
-	return 0;
+		aesbs_convert_key(ctx->key.rk, rk->key_enc, ctx->key.rounds);
+out:
+	memzero_explicit(rk, sizeof(*rk));
+	kfree(rk);
+	return err;
 }
 
 static int cbc_encrypt(struct skcipher_request *req)
-- 
2.48.1


