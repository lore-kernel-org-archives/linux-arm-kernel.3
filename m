Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C58C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 12:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=; b=UL9VrU8h3RSYoMWBNl4s62CXvW
	4JGLfD50SD2fkm6nBucWWRm17gUluXc9INOHPTKFqnpg5JbbwyasyS1oqJbddqMTSSW7BkwN26nzM
	O/sspkw5yfHreA6kZlehDRMizi/1bWAjm3Rin4VXQnApdeNCnXFuelc8a7N/GyPN1abSMIp5a9GDI
	vb+g4/mX7DuqnBS9w+7+Ktkq7nSOSKQuB//ki1Y5EI64IYGdrS91XsPUD7/VhyIA5RgMB5yVBbTd8
	aiKIsFUE12Ju4Np993L7Ked2dkPpPzaRxveFavsfE7ohQcYsNBwHEp/lzN2cCYIEiMy9hb5ej9TWZ
	A7mLVlPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1rF-0000000BXWu-0s29;
	Thu, 20 Aug 2026 12:26:57 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1rA-0000000BXRn-2ZdC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 12:26:55 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-480033bdcf4so1362242f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 05:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787228811; x=1787833611; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=qyd/cezee1l8o/hAMkGexmI+EkaeZH0+T778bhu3V6wcUwL5Dw7Q6NG2Rky5qfD4yy
         gpO86ui3w6dTvbr16PJXkD6W4ZtUrlOSPSM8mF0PHrKQGj4z0q5iJ8nGblCirGUU+hKL
         avkx5xKEUMXua9hQPF7M+TRqsmQIVdomaAK1gRQEdPTlpQn1d2uoEJ7SPr5Y7d4kdHC5
         YSFUWk8rh3/KVjbhLjxP4GdnnNJg8lWHxFf0Hhqg0LGVMJOSGEOVUBv7AfW44Hm0Go2L
         DQpCRALOTbQNF+V9qTBkaQagFYo/OSUbZWfYzTd+3b/Ntz61frdlSNueQmcniL12ivXq
         wJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787228811; x=1787833611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RzvCFyjr8bx4d2LvTNFN/pQ0QZHT1mGXGPc+CarTw40=;
        b=VRlrggoNf9Tg3wSraB7mIFSDrQiZnEOi/wcpOe/rixRv6s8hw/wVjcOKi60to18EhL
         u5dDZdALpLbezV0BPLbVTreW1FDSKfyBmq+mvKwSxMAppDbfUVNTG5z82wQVa/Xt8Zep
         tUymfGaGrqyTxDNhsXSNF2KE7j39g7HYkTqZ/RBfdycmfPDXPZ3S8cuPKfnDwOUEyWyB
         I2x3gOxA50DPIKTjEBitrxJyf9lk7hLXSSCHMZYdjLfqnWrD40PeK1kvpPLN5IkoaADP
         Q7uyYNAy+sfY+MTOvCGoFZxk1ByiKmXIrqrCYiLJQAlvaqZOKBWd5jtFeMR5FjGwcEZZ
         uQ8A==
X-Forwarded-Encrypted: i=1; AHgh+RpfYZLdbxlYWCyHQjfuH5lWizzkwxHs4SrQnLbmjKWzVUYUppYzskFHB7/djAd4ClkB2fdfCoDIeIwMr8rFCV54@lists.infradead.org
X-Gm-Message-State: AOJu0YxIkpxFrx5ZrXkNzLLrEBxfBS6/imMuavRw5rBujv7D3TE2HbDT
	4qc4AVWYUb7NPk07rR0WIe8PsCMN1sRVXJA6LqIbHa4UM4wsM0v/nKCV
X-Gm-Gg: AR+sD10lM5gdmTS+6kYHFUHcUNBK7QtJKmhXRpGHDWOvq++dDH4nEV/00mF0ubptXKH
	MMuZ3Cn1hgGIA+wTO+l84K8KK4ax3QcFFmtEhf1VMYiToBDf9H2RGCZn42w606hs3qCmsDcjpbQ
	O5uGU8Ml73VcepnjFvp6yfWy+JcysLDjiDgqHsxrcgpQLHihrH3xnAdd0f8vaWwf14LffTlS8eR
	CGsS7jj9BYmrTAPY4pMIMe28JKKlxCpOiNuD0EJKqaZSVBfvQpAuy/d/XJcUgbsNJppIsgx6/K3
	40PSj5qtzt/ghup7ALQcGj551EZN2tAhmyH25C9OeubyU5S6VfnyljANWqY6KWhWvPYKAQ08GhS
	lA0FPlxtTpgL3JKFK1snskZC8j/E/lT2jR0AcEOeg9QOVPrT/UmrNnfD0prTJott5Dp8eJBMfD4
	/PwW3L4lGEkSYDwSFJmkXQ9+Roo2h/rQLR4CwuwDpb+OwIbz2z8XgjvA==
X-Received: by 2002:a05:600c:3f18:b0:498:1595:be7b with SMTP id 5b1f17b1804b1-499aa194df0mr233187165e9.4.1787228810718;
        Thu, 20 Aug 2026 05:26:50 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499ab2a8b34sm170494645e9.8.2026.08.20.05.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 05:26:50 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v9 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Thu, 20 Aug 2026 14:20:04 +0200
Message-ID: <20260820122242.120039-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820122242.120039-1-l.scorcia@gmail.com>
References: <20260820122242.120039-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_052652_682561_E677E5D4 
X-CRM114-Status: GOOD (  13.58  )
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

From: Val Packett <val@packett.cool>

Add support for the MT6392 PMIC to the keys driver.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c78d9f6d97c4..8b4a89fce4fb 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -13,6 +13,7 @@
 #include <linux/mfd/mt6357/registers.h>
 #include <linux/mfd/mt6358/registers.h>
 #include <linux/mfd/mt6359/registers.h>
+#include <linux/mfd/mt6392/registers.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
 #include <linux/module.h>
@@ -69,6 +70,19 @@ static const struct mtk_pmic_regs mt6397_regs = {
 	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
 };
 
+static const struct mtk_pmic_regs mt6392_regs = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS, 0x2,
+				   MT6392_INT_MISC_CON, 0x10,
+				   MTK_PMIC_PWRKEY_RST),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS, 0x4,
+				   MT6392_INT_MISC_CON, 0x8,
+				   MTK_PMIC_HOMEKEY_RST),
+	.pmic_rst_reg = MT6392_TOP_RST_MISC,
+	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
+};
+
 static const struct mtk_pmic_regs mt6323_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
@@ -301,6 +315,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	{
 		.compatible = "mediatek,mt6397-keys",
 		.data = &mt6397_regs,
+	}, {
+		.compatible = "mediatek,mt6392-keys",
+		.data = &mt6392_regs,
 	}, {
 		.compatible = "mediatek,mt6323-keys",
 		.data = &mt6323_regs,
-- 
2.43.0


