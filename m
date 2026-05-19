Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECC6CD5BAE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 20:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CeQLtV3ZJs9NMCaLxxe8lNWCUSJcJ/X+OKLcCSGP6Uw=; b=njx2inIU6BvG3W5IkHi5sFs8eU
	Vvj3eDyUP0QQoJWHi0oAiD+RtjjGkV1pNH0TCcSEKMH7rUISolRaXi/m0MBXmF3RUT/sgWFhBVwUF
	0xCWi9fw1v9dQUflNPfBZqz2phcU0t2YBf9NXl2BhhUHs/ViMzkKsoXWmRr8Soi52pp520/iG/0x7
	p1hUJZ2RtIM/nGycP0vFbQNzibIcaHZ80MfhZwfGx+PcqhsYHijTc1WLaFf0zsVfN31PDuJAZpHMI
	V0XQaZ/kKcoa2w34v4aAaU533TQ+mEogfN/3Bzx7NIaABYGVQgrIuIJwq2E4hMyJFc6vUKdpV/jG2
	L8RwmKGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRMf-00000002lQB-3PTN;
	Tue, 19 May 2026 20:48:33 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRMT-00000002lEM-0aVa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 20:48:22 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-45b030a5696so426178f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779223699; x=1779828499; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CeQLtV3ZJs9NMCaLxxe8lNWCUSJcJ/X+OKLcCSGP6Uw=;
        b=tACPeF4BUbIMZoqD3hURXBqgbZF4G+/+Y+2K7hfpcVdAFWoXLA1c7o2R3vFEB54ssz
         w6bxRiNYanvRx1FtK+oPxPazKAMbUD+uRtzNNmWOC0iCxvSWG9LN3dQizsaPAK5FEEjR
         +S4znRIdXYdkRARJ6lz24gyA9hXTiZSpNW6mXpnI7x7x4bnfwdnb07MMJ84Ayv5h/VNA
         UiVnIAGxoof7WqQ0tpSECgyu/FQXzdm20ASlv0TCojfO256zgdRChLsoy+5WaGWUBL/J
         vpbCBY/LAygmLx77EbbxYVUcf7fvYS/IsnEAAIBIHKkW/SRcPIDIWIZlBTJKwW7qEvs1
         jaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779223699; x=1779828499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CeQLtV3ZJs9NMCaLxxe8lNWCUSJcJ/X+OKLcCSGP6Uw=;
        b=Bh7WooeRMD5kh8eckbtaCbOlh/yA1nLNAhLszxl5f7jOWGp8jQnTQEY/0gM8V7bUVj
         Z9fWLbX50mAC1bOB5tl5uzzkrJFsJYtq8Yk43G+bfEtC0s5oe+Vg1QT/gTKzwqLRlUru
         kjeFpYNuLLOeHKdKg7lD2ls7yHzus8MylcrNxW5DWHoklB3JFHiufKkS/apvvllyIn/T
         ENzZdeXel4OQyXfnqh2xeJgMYvaBRcayu877cGrt7T8TiXh56KIew5Z12VV4scwxvtDN
         V89H+Af24itNkCABMdpH6MWhB//uRgYIosQDkTS7DDcoVeU/GrJMGkXxHgULi9+x7xLc
         094A==
X-Forwarded-Encrypted: i=1; AFNElJ8m2sSHvGyYVBVmc6whVnaXhLC9v6WljFH9EFtehczQYgrUNfWpVBUPzyZw2PvMQOmI/t7rT8JGKYg2t6C1Jjdj@lists.infradead.org
X-Gm-Message-State: AOJu0YyVRrbELga2b3h5c/+rvxt5+0XJuPZVPzWCEhO4i4sWMiovm/ij
	HNChfbvnMmROzNnYPlOciDJjbDmqlBpGapNWV60oZoKN1kXzJzYyaDOm
X-Gm-Gg: Acq92OGdQegopJ+RNQ2qte0IACf0iqZpm+uhnVstq4ExstL6mLvTrU3mp3ymBrIlPWm
	8sbdBoPDrk53pL9hKuVOt8ylrHrafiTiXxJPppzgVKjVo7sqzbrSRU1xy8i6LzQF/OZgX2QBKng
	1l4LGHIMA0MvKRNKsk5FLKgxukyBAlyvRxsa+TQR5rk8su353XoVWb5f1cRLbd7DsNPljS3jIZP
	bHmrDInZq2jAqKa7O2UvIe/B25+LBbkEpRaHwxzGT6osTVlAdjSLJB/AAm/1Emm05W0zEW4JvZb
	qnlhpwnzwrkYVRoCSxrMvh6uUCPqJ39QapSDtxDZLjIzQXrv+I7bDpAqZ7O8TNL4Wt/uatYIXV3
	2bGAIcUyhyz5LeQaRf5MqxQdHLwx2PDwP8TbDVLCWXSu3SyHqys8UOcJ7GGZ/Hm3O57dCBmgQxt
	NK6q4Kh5q38R4kkD/EhD0hVoZpT6WyibmUT0F3Fo7pWZ8/9NN/1DlGK5vIIXLzqPM=
X-Received: by 2002:a05:600c:4fc5:b0:489:1dc6:d6e with SMTP id 5b1f17b1804b1-48fe5fcf406mr148338135e9.1.1779223699130;
        Tue, 19 May 2026 13:48:19 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4dac000sm356457755e9.0.2026.05.19.13.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 13:48:18 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: thorsten.blum@linux.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH v2 10/12] crypto: atmel-sha204a - integrate into core management tracking
Date: Tue, 19 May 2026 20:48:01 +0000
Message-Id: <20260519204803.17034-11-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260519204803.17034-1-l.rubusch@gmail.com>
References: <20260519204803.17034-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_134821_213885_A58CE930 
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

Register the SHA204A I2C device instance into the shared atmel_i2c client
management tracking list during the probe phase. This allows the driver to
participate in the central hardware selection infrastructure.

Rework the error-unwind paths inside atmel_sha204a_probe() to prevent stale
entries from remaining in the global tracking structures if a partial
initialization failure occurs. If sysfs group creation fails, explicitly
trigger devm_hwrng_unregister() to preserve the strict lifecycle ordering
introduced in previous stability fixes.

Convert the removal path to use the core teardown helpers. Ensure the
device readiness state is deactivated using atmel_i2c_deactivate_client()
before any local hardware cleanup runs, and call
atmel_i2c_unregister_client() at the end of the sequence to safely drop the
node from global tracking.

No functional change intended beyond improved lifecycle handling.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-sha204a.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
index 3853d2b95449..38a269186e2a 100644
--- a/drivers/crypto/atmel-sha204a.c
+++ b/drivers/crypto/atmel-sha204a.c
@@ -172,9 +172,15 @@ static int atmel_sha204a_probe(struct i2c_client *client)
 		return ret;
 
 	i2c_priv = i2c_get_clientdata(client);
+	i2c_priv->ready = false;
 
 	i2c_priv->caps = 0;
 
+	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
+	list_add_tail(&i2c_priv->i2c_client_list_node,
+		      &atmel_i2c_mgmt.i2c_client_list);
+	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+
 	memset(&i2c_priv->hwrng, 0, sizeof(i2c_priv->hwrng));
 
 	i2c_priv->hwrng.name = dev_name(&client->dev);
@@ -185,15 +191,28 @@ static int atmel_sha204a_probe(struct i2c_client *client)
 		i2c_priv->hwrng.quality = *quality;
 
 	ret = devm_hwrng_register(&client->dev, &i2c_priv->hwrng);
-	if (ret)
+	if (ret) {
 		dev_warn(&client->dev, "failed to register RNG (%d)\n", ret);
+		goto err_list_del;
+	}
 
 	ret = sysfs_create_group(&client->dev.kobj, &atmel_sha204a_groups);
 	if (ret) {
 		dev_err(&client->dev, "failed to register sysfs entry\n");
-		return ret;
+		goto err_hwrng_unregister;
 	}
 
+	spin_lock(&atmel_i2c_mgmt.i2c_list_lock);
+	i2c_priv->ready = true;
+	spin_unlock(&atmel_i2c_mgmt.i2c_list_lock);
+
+	return 0;
+
+err_hwrng_unregister:
+	devm_hwrng_unregister(&client->dev, &i2c_priv->hwrng);
+err_list_del:
+	atmel_i2c_unregister_client(i2c_priv);
+
 	return ret;
 }
 
@@ -201,12 +220,13 @@ static void atmel_sha204a_remove(struct i2c_client *client)
 {
 	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
 
-	devm_hwrng_unregister(&client->dev, &i2c_priv->hwrng);
-	atmel_i2c_flush_queue();
+	atmel_i2c_deactivate_client(i2c_priv);
 
+	devm_hwrng_unregister(&client->dev, &i2c_priv->hwrng);
 	sysfs_remove_group(&client->dev.kobj, &atmel_sha204a_groups);
-
 	kfree((void *)i2c_priv->hwrng.priv);
+
+	atmel_i2c_unregister_client(i2c_priv);
 }
 
 static const struct of_device_id atmel_sha204a_dt_ids[] = {
@@ -239,7 +259,6 @@ static int __init atmel_sha204a_init(void)
 
 static void __exit atmel_sha204a_exit(void)
 {
-	atmel_i2c_flush_queue();
 	i2c_del_driver(&atmel_sha204a_driver);
 }
 
-- 
2.39.5


