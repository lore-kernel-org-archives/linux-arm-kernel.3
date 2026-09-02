Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56A1C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 19:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=; b=SMOwi0Oxnnn5kiHYp9KxXX+h6N
	jgG275xMCzkoPqvK6aOQmPtL08U6orcZro3tBcrXrowh0UoMhHD7Mt0gFKkufttOm/I/u1pOFKbqA
	zc78Bw3cSLnGRWd+O0z7Zuqpr5fuLuSDB3zRFCcFYHDccPt8biB49XjIpYQ7g8ch0PaCC/vGLTta3
	b8YX9/bE+1Md3L6AigACjsBQo4VaqpEpThbVEzOIlCVcWB5u95P2RSU12rvZN2Z89P4jtbWCeik4u
	vM2ffdRNhAzxzooiWE6/eju3LRqNORdNy1UWEiFkC/AWT3lVq+uAlnaehWwUuteRteNkI7a8zBWrj
	bVbTB4Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qkI-0000000Fjdm-2n2i;
	Wed, 02 Sep 2026 19:35:42 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qkC-0000000FjYF-2bn3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 19:35:41 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so1039838f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 12:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788377735; x=1788982535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=AAOgLrlJXUdzaefS614IekAGi3G7LfeJkVNP5LRGdXwumzFm62YV8LGH9rcWPy4PH2
         5gpydaSj/cnMH4/YsWGLiveP4HVxLwZ3lF7sra7XywERB97jmBASZ1Bw5e73nDntUdfq
         nt7D5opyGRssmqqyIm/6MLh2QJSL2ia8S1b/RDHroWa+HpPAf5+H8Qr4uXA9KpyPuUIK
         ZSDqRSBpwVcjW21DQKwiU78CcmC4CRHgcD1kTSKgTaJ+O8bMmv3qejiRRiQfMt+Xsn8j
         4c5lhGscCrYcdkR986x8OU87q40fXFK+cXF1EXEiAdcKR1kMiBTQC6C0VggpLdSW57Nl
         KkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377735; x=1788982535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=G1DIJ9e0ueBOSSrqISCU8LNlMhIgNGTDrLVGciNwRT1fcQovmIAj8qDn5Hck2ne//s
         JJyM33RLGmZ3HagemLR0j+aijStqO/l6h72M1Jzvp/6OpoC5p7Lfeg+sTlVsxJx3B4Zh
         C5/fXr2Gn9KNSUia6ORoqKUPRw++UGeMMSpOd1Z7iUiCUY2tzhihtDbdxJxfnQRpgXy2
         nvjQitL/q9oFsPq63cW7Jrnnehcxzx1Y5JFQ/TAoVDwPVgPQ0oj7WFNEFaLchic7Bpj4
         kLp6peebgknOjEofBzcnyQJsSLo6zdnfNZXn/gmdz9SzEDHQjVX1VXJWRAJSEpuU14JC
         YWNA==
X-Forwarded-Encrypted: i=1; AKwUvBygBpw7i0q2n74N4degKOtdzYwQDpJaHQLKdJaALztTxOaJWkqrSFAbPG5bcOvEro9CFgLgj9Zqg+z22LQypw2T@lists.infradead.org
X-Gm-Message-State: AFuF++k1+yoXBy9W1cDCUXyrOLdPuIaq61PsM5adGQ2/1WSLQJkbxaIL
	nEz2crWTbhODCo+SOAZ4BUnw6PMz9h74mOOwvhPw7WyVNvztOQMJNxrl
X-Gm-Gg: AYBFou2mEIkcZ88NYumTxu5C/GkQpcqmMFKgfiV/9Fr2sKC+BsWt186wNi3L9Yh6TBR
	jN95EImb5r3j7trWmd0nCBY5Mq/xS5WhGKeUojM9jO5jeI7GfbATK6DKheaGTJUIf796NwGUrkz
	1pQ+sd/uufZ2hAz0Z+hH1LjmA3NlB1mkeq8N7S0oE/pfeengKBzZo9sp/GGlfXHf9Sr6DbwyOry
	ZU45leixeWCG/sUpEAJqKuJLpx7K/98e1Neux24FvMurF+WzN8sHMe39XQodZZG/0/+KLTft6FE
	WfZuxT+m0/W7g3Voyfz2hTrLQMGrMX9cFFCEYaGqE3Ac44OsGsEfg2ihy11goiSBXyTQRn6Kqc0
	WDYjz+ra/omTa63Zkrn+PGK0L7kCcHrbjJby7zB4qRxu7ZnBOrhvZcntZcF3DC9/2N2xrXQ+Wmt
	R9/RtSi/asrCi4LYTc1upj0L73h6+P9gkRcu9M92uRUrlOEBTEKnT7KD55
X-Received: by 2002:adf:e19e:0:b0:47f:f20d:8d4f with SMTP id ffacd0b85a97d-484913b9852mr14461136f8f.18.1788377734976;
        Wed, 02 Sep 2026 12:35:34 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492cdc37sm8889191f8f.34.2026.09.02.12.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:35:34 -0700 (PDT)
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
Subject: [PATCH v10 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Wed,  2 Sep 2026 21:25:42 +0200
Message-ID: <20260902193351.185771-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902193351.185771-1-l.scorcia@gmail.com>
References: <20260902193351.185771-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_123536_684318_BAC0BB8F 
X-CRM114-Status: GOOD (  14.06  )
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
 drivers/input/keyboard/mtk-pmic-keys.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c78d9f6d97c4..d758c7743f6a 100644
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
@@ -69,6 +70,20 @@ static const struct mtk_pmic_regs mt6397_regs = {
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
+	.key_release_irq = true,
+};
+
 static const struct mtk_pmic_regs mt6323_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
@@ -301,6 +316,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
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


