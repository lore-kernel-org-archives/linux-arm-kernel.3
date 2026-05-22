Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EE6CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 23:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MfLcGNZgqb+V+WxyXEnSFJnXPIqON2cg7XA1OePB+Uk=; b=ae6KZocFWqY436WAzYZqIBYOHs
	LeZRL6xvDZyZDO2waYeatw36V4q5C3xhVQxc3DuHIyvyzfqVH5rQDzwCWWgkJci9gjTLwN8TzVOsR
	JtcCwKmHFPjw3NCMLKFH3Bdp7B209tTXgwOppb0/RRRnIIhWbGF7G1Qvrymk4dHr4QOZDrWYS43Hi
	GepH5Qs65bQFJjfdzGJ1E6aAXVm1LiuX1ZAqkWF1fdFWhuqkqoIytW8sKOPderA0eLEiHx7HKobmg
	HNNkAIBx9niF+N1qo8tBX8LNpBvQ4dSUral48zO3YOosns73RFRGP9C2WTL56MaoBxpfUKxk6ylwc
	9sV8bvmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYsU-0000000CASS-02Eu;
	Fri, 22 May 2026 23:02:02 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQYsM-0000000CALO-0myF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 23:01:55 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-44a7c719151so592705f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 16:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779490912; x=1780095712; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfLcGNZgqb+V+WxyXEnSFJnXPIqON2cg7XA1OePB+Uk=;
        b=s+lCBdZdfMQxAw+LZMwouzh6dGmGit+KGO5hqiGeYXbP1dOaQ4SfayFCyeMI2u7IeG
         KZd906J0Wbt44/v0epC5/nXIazHZ/jLtnoUu4kpgmy+TlQGqVfgtEPyIFOBHJv/tkmXV
         3kZ5pq/AHc0muCmVxV6ofvxNHLhOFW1g94pkzeljJEFp6y9bGz7Q+ZB52ITZC15tPVym
         LmeXxUR1VsbgXNXhfbg/1kVr3+NdMMnXQHqstxEyHJP4MtDidlk76dfIFV5DF0uREtPa
         nifVYqOVsXvKpLwmLTK0LDgGVNRgdbK3iTg8KV0LX6TMp6MyL6+3nsyxKEJFAjKOEeE9
         c+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779490912; x=1780095712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MfLcGNZgqb+V+WxyXEnSFJnXPIqON2cg7XA1OePB+Uk=;
        b=JGCvL/YzadJMXoLUOqv8CtfZwRCmgnYy3juBvY5WrjQYe4Ye8anMhTHDeM1f2ixgr+
         Eh4Wg+Doyof0NK2R5kW6aj5bC6xn4wEWxG5/RLbR31DslypHS8gC/ptWnwoshSO73brG
         QzbGztN5SfTyv87ifiNRLCfjOD+boOV10kn/IgyOH/DaTe8OS5tE1Kzrku+VVPg+k/B0
         6oHynFkE9HYFJTDR6JeacaHEEylZO6GkNHZIEyufYYKOaGhFVUHt6hVBcA/4sq+/Y9Rn
         peL13q+jkPCeOV1aws3x3tXmfQi/RZuxPBYNl+ueW/qdCN50PN5aEVcFdPwPxbEg8q4f
         Kwzg==
X-Forwarded-Encrypted: i=1; AFNElJ9VKaz1OnWvyrBJoBSv33au+nd5OPy+tAG6tTuHYciIowy+zFXSlmQ8FMB6PTbbOw4zwR0QTyASBhr0wYesue5Y@lists.infradead.org
X-Gm-Message-State: AOJu0YxqAo1tcJ8Rt3kqBYBCqSS6ff+74tggtKH7A7rdxUN4Z4sT1K1x
	2ygQv+PJQEZ7y0PLRlgWvcJJ6PY008a0pRdo0HNQzW1ltGmPSnxYePKiDgrF9Q==
X-Gm-Gg: Acq92OG/wO2h9WmSnLRxPuXsfb5kfU3J4IAoBuoMftSvSTg8S19yraILukkNRWUgOq4
	78twU6pXw8zRpupuKZMZzmCh1Z3X33Rlha5O1laPZ94gnCKz2L6Cmq4IGToyD/9In1Cs2OXZ15Z
	DKXPl41GuDF2HW77lli3wavjqYwJVatjhZJNwe1oYaz5ARA4w1U/nrsnWuRwMAXbMuazm4q4B5C
	VyVMKkxXev0Eaj29W9I0960Iv3ijxmQ2ux9SzS4f7nlP2I7N+6sSnHN2Pl2FR2KdbPF+1JTeXBS
	IvRVFTuMxRc0PCVXnGMKY9ftpcss/Ife3GlPikrwqmC8DQ1slLhX9ClxlxIxIiAJWHJm9csGS6u
	VGygx9WJrfE94G+aTKAsYoMTosd/cnCfkBzdJMIPSr0gfWBqgjVXWexshf3hK/YpXNyzvcIAATB
	FO3bCaWMucrU7Fy9lFWJO2NqXJLpXkSEvuk8UistlUPKsYUaUY3uubooJ1Na7k1Ls=
X-Received: by 2002:a05:600c:590f:b0:488:a2ac:a338 with SMTP id 5b1f17b1804b1-490426cc0dbmr28853145e9.5.1779490911959;
        Fri, 22 May 2026 16:01:51 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490456274ebsm67100265e9.15.2026.05.22.16.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 16:01:51 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: thorsten.blum@linux.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	tudor.ambarus@linaro.org,
	ardb@kernel.org,
	linusw@kernel.org,
	krzk+dt@kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH v4 09/12] crypto: atmel-i2c - move shared client allocation logic to core
Date: Fri, 22 May 2026 23:01:31 +0000
Message-Id: <20260522230134.32414-10-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260522230134.32414-1-l.rubusch@gmail.com>
References: <20260522230134.32414-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_160154_256839_9496476D 
X-CRM114-Status: GOOD (  16.91  )
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

Migrate the I2C client allocation and runtime load-balancing routines out
of the ECC driver code and into the central atmel-i2c core library module.

Export the symmetric lifecycle helper interfaces atmel_i2c_client_alloc()
and atmel_i2c_client_free() using EXPORT_SYMBOL_GPL() to expose a unified
client management API. This consolidation enables the dynamic selection
subsystem (which chooses the least-loaded client device based on the active
transformation count) to be shared by both the ECC driver and upcoming
Atmel crypto modules.

Refactor the ECC driver's transformation context initialization (init_tfm)
and teardown (exit_tfm) paths to use this centralized core API.

No functional change is intended.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c | 51 +++-----------------------------------
 drivers/crypto/atmel-i2c.c | 47 +++++++++++++++++++++++++++++++++++
 drivers/crypto/atmel-i2c.h |  3 +++
 3 files changed, 53 insertions(+), 48 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index d2490693a198..16e607cd06c4 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -205,51 +205,6 @@ static int atmel_ecdh_compute_shared_secret(struct kpp_request *req)
 	return ret;
 }
 
-static struct i2c_client *atmel_ecc_i2c_client_alloc(void)
-{
-	struct atmel_i2c_client_priv *i2c_priv, *min_i2c_priv = NULL;
-	struct i2c_client *client = ERR_PTR(-ENODEV);
-	int min_tfm_cnt = INT_MAX;
-	int tfm_cnt;
-
-	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
-
-	if (list_empty(&atmel_i2c_mgmt.i2c_client_list)) {
-		spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
-		return ERR_PTR(-ENODEV);
-	}
-
-	list_for_each_entry(i2c_priv, &atmel_i2c_mgmt.i2c_client_list,
-			    i2c_client_list_node) {
-		if (!i2c_priv->ready)
-			continue;
-		tfm_cnt = atomic_read(&i2c_priv->tfm_count);
-		if (tfm_cnt < min_tfm_cnt) {
-			min_tfm_cnt = tfm_cnt;
-			min_i2c_priv = i2c_priv;
-		}
-		if (!min_tfm_cnt)
-			break;
-	}
-
-	if (min_i2c_priv) {
-		atomic_inc(&min_i2c_priv->tfm_count);
-		client = min_i2c_priv->client;
-	}
-
-	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
-
-	return client;
-}
-
-static void atmel_ecc_i2c_client_free(struct i2c_client *client)
-{
-	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
-
-	if (atomic_dec_and_test(&i2c_priv->tfm_count))
-		complete(&i2c_priv->remove_done);
-}
-
 static int atmel_ecdh_init_tfm(struct crypto_kpp *tfm)
 {
 	const char *alg = kpp_alg_name(tfm);
@@ -257,7 +212,7 @@ static int atmel_ecdh_init_tfm(struct crypto_kpp *tfm)
 	struct atmel_ecdh_ctx *ctx = kpp_tfm_ctx(tfm);
 
 	ctx->curve_id = ECC_CURVE_NIST_P256;
-	ctx->client = atmel_ecc_i2c_client_alloc();
+	ctx->client = atmel_i2c_client_alloc();
 	if (IS_ERR(ctx->client)) {
 		pr_err("tfm - i2c_client binding failed\n");
 		return PTR_ERR(ctx->client);
@@ -267,7 +222,7 @@ static int atmel_ecdh_init_tfm(struct crypto_kpp *tfm)
 	if (IS_ERR(fallback)) {
 		dev_err(&ctx->client->dev, "Failed to allocate transformation for '%s': %ld\n",
 			alg, PTR_ERR(fallback));
-		atmel_ecc_i2c_client_free(ctx->client);
+		atmel_i2c_client_free(ctx->client);
 		return PTR_ERR(fallback);
 	}
 
@@ -284,7 +239,7 @@ static void atmel_ecdh_exit_tfm(struct crypto_kpp *tfm)
 	kfree(ctx->public_key);
 	if (ctx->fallback)
 		crypto_free_kpp(ctx->fallback);
-	atmel_ecc_i2c_client_free(ctx->client);
+	atmel_i2c_client_free(ctx->client);
 }
 
 static unsigned int atmel_ecdh_max_size(struct crypto_kpp *tfm)
diff --git a/drivers/crypto/atmel-i2c.c b/drivers/crypto/atmel-i2c.c
index db818ce55033..92d3e28f9d9a 100644
--- a/drivers/crypto/atmel-i2c.c
+++ b/drivers/crypto/atmel-i2c.c
@@ -57,6 +57,53 @@ static void atmel_i2c_checksum(struct atmel_i2c_cmd *cmd)
 	*__crc16 = cpu_to_le16(bitrev16(crc16(0, data, len)));
 }
 
+struct i2c_client *atmel_i2c_client_alloc(void)
+{
+	struct atmel_i2c_client_priv *i2c_priv, *min_i2c_priv = NULL;
+	struct i2c_client *client = ERR_PTR(-ENODEV);
+	int min_tfm_cnt = INT_MAX;
+	int tfm_cnt;
+
+	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
+
+	if (list_empty(&atmel_i2c_mgmt.i2c_client_list)) {
+		spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+		return ERR_PTR(-ENODEV);
+	}
+
+	list_for_each_entry(i2c_priv, &atmel_i2c_mgmt.i2c_client_list,
+			    i2c_client_list_node) {
+		if (!i2c_priv->ready)
+			continue;
+		tfm_cnt = atomic_read(&i2c_priv->tfm_count);
+		if (tfm_cnt < min_tfm_cnt) {
+			min_tfm_cnt = tfm_cnt;
+			min_i2c_priv = i2c_priv;
+		}
+		if (!min_tfm_cnt)
+			break;
+	}
+
+	if (min_i2c_priv) {
+		atomic_inc(&min_i2c_priv->tfm_count);
+		client = min_i2c_priv->client;
+	}
+
+	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+
+	return client;
+}
+EXPORT_SYMBOL_GPL(atmel_i2c_client_alloc);
+
+void atmel_i2c_client_free(struct i2c_client *client)
+{
+	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
+
+	if (atomic_dec_and_test(&i2c_priv->tfm_count))
+		complete(&i2c_priv->remove_done);
+}
+EXPORT_SYMBOL_GPL(atmel_i2c_client_free);
+
 void atmel_i2c_init_read_config_cmd(struct atmel_i2c_cmd *cmd)
 {
 	cmd->word_addr = COMMAND;
diff --git a/drivers/crypto/atmel-i2c.h b/drivers/crypto/atmel-i2c.h
index 07fd2248e20b..ddab80bc1a72 100644
--- a/drivers/crypto/atmel-i2c.h
+++ b/drivers/crypto/atmel-i2c.h
@@ -193,6 +193,9 @@ void atmel_i2c_init_genkey_cmd(struct atmel_i2c_cmd *cmd, u16 keyid);
 int atmel_i2c_init_ecdh_cmd(struct atmel_i2c_cmd *cmd,
 			    struct scatterlist *pubkey);
 
+struct i2c_client *atmel_i2c_client_alloc(void);
+void atmel_i2c_client_free(struct i2c_client *client);
+
 void atmel_i2c_deactivate_client(struct atmel_i2c_client_priv *i2c_priv);
 void atmel_i2c_unregister_client(struct atmel_i2c_client_priv *i2c_priv);
 
-- 
2.39.5


