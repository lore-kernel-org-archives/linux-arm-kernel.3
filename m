Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF19FCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 03:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z8uyqtJucGRhHAMPSIQ7cb4WnZTqHSO1ebBr3H7uCas=; b=ytIISKVMWtwCw94v/IssQMvJt5
	gvEFihHd8NGrMdmagXlJZBpDs1B6Q3KGxeLHX/0grV3cOFAY/1yE/3Aey4gFNf5qsLxdp30/BB/4i
	JQt76YFGC3AIO4fUVrWrTzQQpIanu29d1Oe5JgH7iMnCWjrJnU3q3NGI6aFsL2OGFFxFahkXxOmK1
	KsHBd9REt2E2QLv6MHE6O+cXIjPD91VXgaCo1zRMC3z6I3SbCUV+HOdCYqsGcgRQuRIvamX6m7q4S
	jt9bmvSlr4hDlHT/1epGzBtPgxl5i+scb3BjNilPXfAz/Z/KU32gKXEeWt+Rc0d3I8nHOwmuNM2+J
	H6tgA55g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uowBc-0000000Fgyo-0Pgg;
	Thu, 21 Aug 2025 03:42:00 +0000
Received: from mail-pl1-f178.google.com ([209.85.214.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow8t-0000000Ffmb-113Y;
	Thu, 21 Aug 2025 03:39:13 +0000
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2445811e19dso4426795ad.1;
        Wed, 20 Aug 2025 20:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755747550; x=1756352350; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8uyqtJucGRhHAMPSIQ7cb4WnZTqHSO1ebBr3H7uCas=;
        b=IclCbMStF3huiGFIfEPVwm6sNK8ChEWIq2bBfg4RwRLooLgqHJEagzyTIJ74ScC/sk
         VVjPGs5e9ZyV8K5jIZeRfZEPvSK4uRT9gZwARRPLk4mDOh9RKyXWZirubL5r7qRntcTj
         gapj99AC8UOZm9MaIuXyYssr+GeOFmCKT2gyQKtwQfs5m/Q/1abA6VBXhvBZ4/HeblXH
         Ht6z5Y1PrNiYyxYBlEtqINzIAO/GnxZZdO1jNfDZyUPN37CI0sZiqMDP/mUZ93dsmYle
         l+O2s4ErwtbFGYNK+x8DBjjB6QunKn4wVX2JqcMnifGYSzuD8Uc6AZZklNcuH+xqatgt
         LoKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755747550; x=1756352350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z8uyqtJucGRhHAMPSIQ7cb4WnZTqHSO1ebBr3H7uCas=;
        b=GuOhnb5pX0JhpeahBj4Z9SNZSzzmTFZm0rUY3JkgYNr0TYS964DXfnH0Tj9bYoLjXJ
         LdteN4ksYyxEQ8Z0DNb6eqPjqsGKPCOPbWJwRoQvqx5geR3GOR8+8gK1uQhqYRP+FThL
         FaDwXCZWnsSTjPXK5C0VBImILNiT9q1S1s9rKTPVDvKcYiBnx6dnD18CYz/7vCp8PwzS
         yjQVukWm/2x3hqMt5p/pL4+DDG4L3A65y0v+ABPpUnG8oJ+7S47vrUkpQplhp0X0tg1X
         gH2wB19vmZBBL5V7sRPlYbZmAGxip5eobwGUae2tcCoi5wIukKykQ3DJMHbfMHyuPyBc
         OEMQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5HzHj2qiUnujYjpRVjQKykL7SnLWogPGN4OOIc8+gMulqoobmWpf42HbNg6CVClb1oa5QBD8N4IU1MwCo@lists.infradead.org, AJvYcCXMnTLreHrWv1EOSS2VjhiyYZPwapfFfrYd1LGinkLYWhbwbHpx7BqAV/COvq/4IoSZqFjnjmDVNjxGvscDCsZ6pg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxxK1O9l8zI9hDt2PIxqprDlvwe0MD2dDYLBLlxyWbBEtSPxGZ9
	vM90kT14zut09SS0X6Yvg7i3ksADNZ1YLSvKVT4ypPc8X1Y2PBBiwMYoXVUzAA==
X-Gm-Gg: ASbGncsJM0iazY6/jOAaHFf8RmOQiUm0DADNqC4bRWRWsnT0upnSYCy1opQ2gLO4EKY
	2MPS579ta+WI4Y+z7SS4bRSLKKXDqUsPMSSqhiMwE9H/JryZI6NM//WjEw0/QJKo7fzaAY38Kjw
	KLFZcAdLWmBjnW0BIM52HyYrEjnuCLLXkH2KZdMYk5OND3DgtNVJZxgEA7/d2mdWJAu3mgR0kbB
	392tSKWtHXOQeSrydP2YAoRJPOvOlGOUKrKJnpMF6rjwzFj7ubk50YeylIvpP+2WFM1o22YnKyN
	mnJfqEL/Vxh9Fcv61VwP1GWz9b3ubd4NhFXt4e87l4cgM0TZBscF0WLVCGfNSHXA29Dpd6n9PEw
	jME/Q
X-Google-Smtp-Source: AGHT+IHwuUrsCGRj99hLQ285uZapEb5o3oL6q6U0D5DJlzBFxoN/jLfLD8vBbPMDeM4DW+vxhrlf4Q==
X-Received: by 2002:a17:902:d50b:b0:242:fba2:b8e4 with SMTP id d9443c01a7336-245ff87d7cbmr15536745ad.56.1755747549584;
        Wed, 20 Aug 2025 20:39:09 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:acc7::1f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d524c88sm6799386b3a.76.2025.08.20.20.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 20:39:09 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ACTIONS SEMI ARCHITECTURE),
	linux-actions@lists.infradead.org (moderated list:ARM/ACTIONS SEMI ARCHITECTURE)
Subject: [PATCH ath-next] wifi: ath9k: simplify eeprom format strings
Date: Wed, 20 Aug 2025 20:39:08 -0700
Message-ID: <20250821033908.638871-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_203911_370157_14A68D36 
X-CRM114-Status: GOOD (  12.83  )
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

devm is already used here so might as well simplify the whole function
with devm_kasprintf.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/ath/ath9k/ath9k.h                |  2 +-
 drivers/net/wireless/ath/ath9k/ath9k_pci_owl_loader.c | 11 +----------
 drivers/net/wireless/ath/ath9k/init.c                 |  7 +++----
 drivers/net/wireless/ath/ath9k/rng.c                  |  4 ++--
 4 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath9k/ath9k.h b/drivers/net/wireless/ath/ath9k/ath9k.h
index 6e38aa7351e3..60aac2c50409 100644
--- a/drivers/net/wireless/ath/ath9k/ath9k.h
+++ b/drivers/net/wireless/ath/ath9k/ath9k.h
@@ -1076,7 +1076,7 @@ struct ath_softc {
 #ifdef CONFIG_ATH9K_HWRNG
 	struct hwrng rng_ops;
 	u32 rng_last;
-	char rng_name[sizeof("ath9k_65535")];
+	const char *rng_name;
 #endif
 };
 
diff --git a/drivers/net/wireless/ath/ath9k/ath9k_pci_owl_loader.c b/drivers/net/wireless/ath/ath9k/ath9k_pci_owl_loader.c
index fe1013a3a588..c4f8d1f98369 100644
--- a/drivers/net/wireless/ath/ath9k/ath9k_pci_owl_loader.c
+++ b/drivers/net/wireless/ath/ath9k/ath9k_pci_owl_loader.c
@@ -140,19 +140,10 @@ static void owl_fw_cb(const struct firmware *fw, void *context)
 static const char *owl_get_eeprom_name(struct pci_dev *pdev)
 {
 	struct device *dev = &pdev->dev;
-	char *eeprom_name;
 
 	dev_dbg(dev, "using auto-generated eeprom filename\n");
 
-	eeprom_name = devm_kzalloc(dev, EEPROM_FILENAME_LEN, GFP_KERNEL);
-	if (!eeprom_name)
-		return NULL;
-
-	/* this should match the pattern used in ath9k/init.c */
-	scnprintf(eeprom_name, EEPROM_FILENAME_LEN, "ath9k-eeprom-pci-%s.bin",
-		  dev_name(dev));
-
-	return eeprom_name;
+	return devm_kasprintf(dev, GFP_KERNEL, "ath9k-eeprom-pci-%s.bin", dev_name(dev));
 }
 
 static void owl_nvmem_work(struct work_struct *work)
diff --git a/drivers/net/wireless/ath/ath9k/init.c b/drivers/net/wireless/ath/ath9k/init.c
index ee951493e993..04903b5c611f 100644
--- a/drivers/net/wireless/ath/ath9k/init.c
+++ b/drivers/net/wireless/ath/ath9k/init.c
@@ -625,7 +625,7 @@ static int ath9k_of_init(struct ath_softc *sc)
 	struct ath_hw *ah = sc->sc_ah;
 	struct ath_common *common = ath9k_hw_common(ah);
 	enum ath_bus_type bus_type = common->bus_ops->ath_bus_type;
-	char eeprom_name[100];
+	const char *eeprom_name;
 	int ret;
 
 	if (!of_device_is_available(np))
@@ -635,9 +635,8 @@ static int ath9k_of_init(struct ath_softc *sc)
 
 	if (of_property_read_bool(np, "qca,no-eeprom")) {
 		/* ath9k-eeprom-<bus>-<id>.bin */
-		scnprintf(eeprom_name, sizeof(eeprom_name),
-			  "ath9k-eeprom-%s-%s.bin",
-			  ath_bus_type_to_string(bus_type), dev_name(ah->dev));
+		eeprom_name = devm_kasprintf(ah->dev, GFP_KERNEL, "ath9k-eeprom-%s-%s.bin",
+					     ath_bus_type_to_string(bus_type), dev_name(ah->dev));
 
 		ret = ath9k_eeprom_request(sc, eeprom_name);
 		if (ret)
diff --git a/drivers/net/wireless/ath/ath9k/rng.c b/drivers/net/wireless/ath/ath9k/rng.c
index e1def77591c6..7d549d18f605 100644
--- a/drivers/net/wireless/ath/ath9k/rng.c
+++ b/drivers/net/wireless/ath/ath9k/rng.c
@@ -103,8 +103,8 @@ void ath9k_rng_start(struct ath_softc *sc)
 	if (!AR_SREV_9300_20_OR_LATER(ah))
 		return;
 
-	snprintf(sc->rng_name, sizeof(sc->rng_name), "ath9k_%u",
-		 (atomic_inc_return(&serial) - 1) & U16_MAX);
+	sc->rng_name = devm_kasprintf(sc->dev, GFP_KERNEL, "ath9k_%u",
+				      (atomic_inc_return(&serial) - 1) & U16_MAX);
 	sc->rng_ops.name = sc->rng_name;
 	sc->rng_ops.read = ath9k_rng_read;
 	sc->rng_ops.quality = 320;
-- 
2.50.1


