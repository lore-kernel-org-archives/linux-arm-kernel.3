Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E23606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 19:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wS8uuVqW;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o4QGgerz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=; b=wS8uuVqWNSDQDq
	xNE8NjnCrnmrkkMcmonTWKRHV5se/9i5ZqWcDsDgGYtV5MLlYmC1ma9Y4CRDUHf8q563uHa0XZJa7
	6Z7TH/7BjW0SyFWVLPiJ/nXQc37bjFQRB0sEXcmDydRm3xuU3O05xQKSCyxLIMwlYYJ8bRIxORxL2
	fyPR6ixxcagjdBePJb44oKMSCjzB0iJPYHvtv3NSdLR2SQQ3UU9CBGwOF0+TICC//fpAXGrHlp38d
	GRV670uLNdp7HY36PEoI8znEjOP7XlkZRNeZDspB9oGDLrBPcgsTrWktQi+kRH1+Ilazw5T4v/uOf
	pKsRvk3AjXyk3nQBJDJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3Xu-0000000ARgm-1yCW;
	Thu, 05 Nov 2026 19:54:54 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3Xm-0000000ARb0-0fcu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 19:54:46 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso16097835e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 11:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793908480; x=1794513280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=o4QGgerzq/T5GwloPl5LIVLyNCBhoWyEDJrSMRtLjCGchqckvXvfpq+20tiD3PamTW
         WfXJKBuZOOpeAWEGh2qX6F0FnGXgs/y0IvfV5Aw0rrB+cGIsyL3fvECLqTeI3+QrDHiP
         yZeGZ2jQccfljssgksk5qoec+Ukcb3hxy0iUwqveOWWtcVciKX4kSfMrP+6rzkaGF4zH
         AdsSLFjGSUh30O5DVyswBeEzDuHeopT8IP8U4jYb7dFJsuEDyH+FZaU7WIz7Tk3hfrBZ
         xCJKMPvAheMs8mZywE+uOLx4CB8nKes56Mr2I2BdDrJCmjQJ19x6b1W72EQv2HM1YdHc
         RBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793908480; x=1794513280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=x4BSZIW7yQr25h1P2wblMJ5aC5DOenLU8G19bJcfL8cEdk0sNfCpgT2XeD7bDAb8ps
         FCefmpKDKV/XwfWPfomk6c4WYzOUQAhEI/o0Hnuv1GgrDR3OkBJCH0xLzV7znD+MRa7S
         boapsRBAgcu84HPHgHWoSnaAhVI13aB3cPaAVdopxR6sdm1LCcFkRN1nsiBeHZhEV25w
         dz6nVd+FlRaHwXoqZhQKlUynEw10TQWDJ8B/I/LPcQMI/uHwpK8NlIpRMmEguk0RPouG
         p6NJ8ehu/zn0xidJR1dWRDNgZ6Rhkpz1c/9HN0x4mdlG5s2BRzmo7jrs8sv1ujx35o14
         yI8A==
X-Forwarded-Encrypted: i=1; AKwUvBwMJkp5IsDsb4dPw3R/p8KcrWcd8Rrp2oALJTI4ZEuyDANJT6OesXu+VExZDg5mMxVTZVjEKNCo88IQP1OBQEWp@lists.infradead.org
X-Gm-Message-State: APuU4Z+LfmRi1vP7Do/ebJswfzp0tC2tB1nqY9NU6xSrHpzCIS/h9/jJ
	eOiPe2f5yuyvV0Hwnu2jseF3S5eg0EM14jF7TlJ8B+8Tz+8ewkkEjved
X-Gm-Gg: AYBFou27T03mSXumYu9zokKPWUHFJhBTC87MOzkNQRgbg9lXkBPHeShGNIAm2suQUw4
	8osPRe7Lt8aBEL949yy29P9SL0J1bzK5UvZcEKRb/F5mJxzFSIk4w7gFngoWVJV5PjVLqyAuaYV
	nkL+zFdxIwvGAfGbMSddC3TNsbPek9Yw6i8eRLZlrQzh2pB5xAniEXuSZUDo1srJEkUSkYAZ5gv
	HWsXCsk9GAXT+Ei4xei4wy4y6sTl6P2YBDe/bzqqvIB2B9sg4cO2S/WM8qMIojHmXbeYx4xYCBJ
	hX/+1rB5IqZOvDFJBBhZWhn10Xav8Jlocas/+zLDlny51tzrLlViSlBTujnll6bwXTmwODqIyao
	oE4gnGkjaR2kTUIsNKLN44rvQcWCxXXcVTsmILhXGGSOCBXekK2ZIBokhrgdAOwM6r/1AIuzxSW
	Aqj/jTNCaar39oOt0j4Ch7SD8PL3EtzeUlZbNOUgJDxf1e0w3aQMFMETvjwKFOOtUiyHT7npjVs
	VirZnppcn9gbficmNgn5I5XwFxPvpD0yCklQQ2bGu+M6of5+2WS7QDVmi5g50ZFCKhAiqLq+Guy
	7nZrh5eeNOWQm8t/p3jIXdB1
X-Received: by 2002:a05:600c:1f95:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4b6e063f1e5mr3032495e9.29.1793908480210;
        Thu, 05 Nov 2026 11:54:40 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b5725fb0d1sm83862895e9.8.2026.11.05.11.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:54:39 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [PATCH v12 5/8] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Thu,  5 Nov 2026 20:50:25 +0100
Message-ID: <20261105195206.3440-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105195206.3440-1-l.scorcia@gmail.com>
References: <20261105195206.3440-1-l.scorcia@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_115442_371484_5A7075AC 
X-CRM114-Status: GOOD (  13.26  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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


