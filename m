Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B28CCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HmGPE3DNDSXOjHya8g4AmQk3m15oPbfzDvM3u2NfIRo=; b=f25u2MHc4RsUuYcU+bi2yk77aW
	F19zBjkf34hswtyax+uNZtMhmuhHHpc+Xa01mwzPpgLfmsOGdEHEiqkV6fFhlHBu2ogmysK718Txt
	4sZSJhNMpMMfscqIoNHm85s1nmJ4ojsIPvD95oYZRp4d/wuxLkl+GCgIPNENC4CqWwbcl31C4LfvI
	Yg9wRjbB2xAXh3chSxGF/bEX5C6ZBDOX6m8xqAWJ22jWDEEnoPDGg4HZj961ezWVlVgJIdwk7FhEM
	EyWujrfXg70tSCOtrX298QsWQ1eN5sDA0JzOJA6YPi4+uLfCWPwpu40RgxXTp0baEgdoyN85LhfIe
	TEnLSvgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjIa-000000055Rd-2BsP;
	Wed, 20 May 2026 15:57:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjIW-000000055OS-31pz
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 May 2026 15:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HmGPE3DNDSXOjHya8g4AmQk3m15oPbfzDvM3u2NfIRo=; b=gdewE74IsHmmhWi3phbU4K8FGP
	DZqwJB06szoW2mRY3DSInR2F2K4E4/DUmIeUK+LbM3Iz2+KBCcKhGlv1poMjQMd1IaQi3G3oa5x0y
	NYCznWYelvFsipscL3AHvr4WPX3EK1n/yyEIBRUi6jn4OQp5j9plHo1LakQT5sGCPhfMXcOiIjNFU
	OYudaZR+FRpqXU2rP3IAsG0isGw/NAZTpRFxVakVnw2ztqU197bkD7x0y8VsZHqRXsAeRCIZkMQlX
	3/FZefooJVHsC6xWsLP+ti6EhF1eiDGiAKqLX+czZgwxCNr+84X6AFzoMwKPHc+JHR5VQyuxafecD
	jVxPc4UA==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjIR-0000000HIty-3SSr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:57:26 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4891b02a0acso2821725e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779292641; x=1779897441; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmGPE3DNDSXOjHya8g4AmQk3m15oPbfzDvM3u2NfIRo=;
        b=LQL+ZdUjVvjex4JWf+O6IoAjrqj3aA8IthNDwr/CdUfOPhCl2i19ckOMIm4XGX6Nhd
         vhjCKFFKC8VXcgsbxBHW8nY84N93rJfmkQHlZVAG0SDDAMU7FLxnORHTYwERrQeyVKYI
         F79Qvn4AwNSaey6bw0SBbK1nv1vF2AzEMpQ1QrjSgtk+wJenXiXhG39JooDqMrJtLDIl
         OtXMgOs8h5SSue8TsotpDWwnxVT7iWj/dvXKlY8TYhOi0KiCixElOdQ1zO4e2zA5o9pt
         7txY+IgnTyt10UnBBHsy+LAC3HQxuQi+vgZi2q4MBWhv5CiXFpyjTkd2Qjg/EZCC+vJg
         xTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292641; x=1779897441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HmGPE3DNDSXOjHya8g4AmQk3m15oPbfzDvM3u2NfIRo=;
        b=H7QD6mqZMY8Ihw2/n/5ZLaPzosdztrdRthcqJ6udJd3CK2VLbKtCl8ThiWLqpbCvWH
         d7+e7ttZlbyxS6Pm1Jfe9ByuTTGnN3KHpboutkWB5GLUoWNi1GRbejuH5KblvkJ3PD3j
         Tjn7ZJ9tNOkCGorSnt7tl51dDiYf8Uup2K7le5LMJltMUMyE4nEEFAEa+pL0Wr2d/DCc
         /lLBb2TaoNhibaKAV8xJV1C5KpnsyoBTBHn4pleXJTt+XVRaT8K9k+MHMdtRgw0YxDoW
         JI8j5l6MM90bNB4EvUZrvJurREo8CpgnPi+Du4d3WqqR+R2qloqlsVYSxqJY/rRVeZqS
         6hww==
X-Forwarded-Encrypted: i=1; AFNElJ/wZ3tNj1TK0ooz92fRJqA+kI18A4YBnRPox92xBvPaRf8Z8IHfBPR/Z8c2MvXt1ildKZnVyThYsGUpGneXwJVQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyyb147v0V+WSSCS/bimQuDzB0Kz4Dcr3JDdoQccW72S5hOKuPP
	3O2EeuvQHUSqBhlv+2ggmaoU/3vcY4JBLPFHHZZ4KbR+GGu8HVjBjxmL
X-Gm-Gg: Acq92OEKSgmf80B/xS7RBpRPMpmPhvzSNuYRypIP9kQoR1bUuLdJDJneC5eXi8NSm6d
	cLStukAlvaWV3VriLfm/t1aNrJ6Th/bjgooy2Nbvwx5A7u3dzcw+uNrYPq5bP9wdlZY7tXUDlrO
	MPEOZQf7pSWqBzQYnyH14Ag/qsXKgrzC/ggVZKnU7+cQtrioTc8hSo8p/KuTUWpfuVYA8qygkNc
	KKZ6eCDp+XyDERdlYuHKtBvY4sv6WAJkx+syiNDmfUgsS98abIaGsklP2OYMlalVNTQPH9nLZKU
	4dbzo3WazcbLOcBxQ6hdPSO/0I0V2kU7suoqw6mp0Dz34IemXImRgeQOZNDGnWsVntTBVuFpj03
	htlGLSDB4Iq7dqOmvrKjyh8Ek8Nn1OTo39m6F+UfFCycyTmBVCtq1LikgJ+OtaKHD26NmHERS7U
	uzTj5RbeZVcEJqSHS8ORmirRQCb5dUIyif99qQzzTAS1nPGi2UUXBCPGXjF4Mf3Ns=
X-Received: by 2002:a05:600c:198d:b0:489:6c28:dbb4 with SMTP id 5b1f17b1804b1-48fe62f7cbbmr206383235e9.5.1779292640788;
        Wed, 20 May 2026 08:57:20 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe79ce3sm137216715e9.31.2026.05.20.08.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:57:20 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: thorsten.blum@linux.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	tudor.ambarus@linaro.org,
	ardb@kernel.org,
	linusw@kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH v3 07/12] crypto: atmel-ecc - switch to module_i2c_driver
Date: Wed, 20 May 2026 15:56:58 +0000
Message-Id: <20260520155703.23018-8-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260520155703.23018-1-l.rubusch@gmail.com>
References: <20260520155703.23018-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_165724_985130_DB709D3E 
X-CRM114-Status: GOOD (  11.59  )
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

Remove custom boilerplate module configuration code and convert the module
init/exit paths to use the modern module_i2c_driver() helper macro.

This shortens and simplifies driver initialization. Custom structure setup
is no longer required here since management tracking context initialization
was already safely moved into the atmel-i2c core library module.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/crypto/atmel-ecc.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
index 433f40224be2..f166144febfe 100644
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -397,18 +397,7 @@ static struct i2c_driver atmel_ecc_driver = {
 	.id_table	= atmel_ecc_id,
 };
 
-static int __init atmel_ecc_init(void)
-{
-	return i2c_add_driver(&atmel_ecc_driver);
-}
-
-static void __exit atmel_ecc_exit(void)
-{
-	i2c_del_driver(&atmel_ecc_driver);
-}
-
-module_init(atmel_ecc_init);
-module_exit(atmel_ecc_exit);
+module_i2c_driver(atmel_ecc_driver);
 
 MODULE_AUTHOR("Tudor Ambarus");
 MODULE_DESCRIPTION("Microchip / Atmel ECC (I2C) driver");
-- 
2.39.5


