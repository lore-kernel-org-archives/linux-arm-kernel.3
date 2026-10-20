Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C324F60A3804
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 17:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L1p+B/oT;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cSpwTsOe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=; b=L1p+B/oTTfb6ZF8DaiQXW+1W9r
	hOi57UNtTmrn+PwFZN0C/8D6oC3c9vJ2hiQzChZ69YAwiy2oomh6R3vshLkEyj5AvXkbcT2I560tY
	o95RTt+X6tuAiM/xMcWZWj7EeoqVcG/ynpcG7jv+gTDB21wM8aBYikvS4HF2RQoM6jZyhI0FTSB1J
	5w5ppGxU4rvYpDSt7ec8CSzVcLcl5t2nLLHmcC0+3T+dEOHOoqRXTz0Jimbbd37bv5CNVgY9J3FH4
	4aUnAU2fPfeYsPxK0uymOkiPbW3X49sVv5TORwzJjiDBgZfX+XbUTj5xz0w35EYI+Fm75aizlRD+v
	A/EESj/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDmd-0000000AMYQ-2Bpp;
	Tue, 20 Oct 2026 17:37:55 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDmZ-0000000AMUh-1iZm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 17:37:54 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a1e266fca2so19999165e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 10:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792517870; x=1793122670; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=cSpwTsOebQelrrTy7/Ij6QhP8G2Iu8WWW/lNXj+Mw8re0HmaQNemE80MsOlzq+GG5X
         fagiJqzPv5HRVb2K/LOkxbQHbsfut2DRhkyIReTwmhgnAMH8zPPFXaofjfptose9k/QU
         OT7+n8I840I3KwMto3a6uVqgh3LLVfO0JiHALoj/dMHDPMNsKFXD3fJzzeug10BREpnI
         3acuYzPOFCuh47vSApon1CSLGqZzGHIqNK1Zil6JHbqXa69ogOVrwzcKsGtMIW5Rb8+M
         Renjx4XU3rtuLYTvtar9sV9DxbL4LwcYx+V6GgISA8R8U0g93KevXyCeW4mvCDokRul8
         CFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792517870; x=1793122670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=JJGQD3FkkLa1afD0yA2s0GKtvQ9JRNbkMBXvwEsNaiBnY7iXHkrfaqUE4GY0OYMs0X
         cOwiKN81TlxMfCD3NIS52xYPhf87nBt8rsraTr3YAKd2olR7qHumBalUE/jUVP/ho2N5
         y/AOumKQcp6QuetxYnsRpAcwcAmf/UiF0f+b4L7CmCOGcB4rmQwHazqAwzp4kg4+B0QN
         h8Osl4jPE/2ST9lDuwjGZM7eJaOFwFgazgXcRbZcZkZS64QYSadNQGXiOXHq+ExwnEnC
         E+Xavbm8nzMnVRO2anDsW7DTbpOS9D/HrIBgJPy5+QBWGf0O1aX/OlbuNZEDvUcdHdnu
         gDjg==
X-Forwarded-Encrypted: i=1; AKwUvByql0/vwe74sb0t/5cF5mxppstwfuqXgH+6EjXXiIWR4GULxWv3KFEopkPfMUKrg7PKxWO9etv4WqB7uI9cwpgo@lists.infradead.org
X-Gm-Message-State: AFq9FYLPAwDgADwO5D5JLvjvo/Vs/V4A1Ksu5zLiqm1yq+0IZZqVsM5o
	KhWruWD91dJU3fby2ZZ8OlHuQo5lv7ogu1N/6XhCXlBpJ18ZpkiDOxCd
X-Gm-Gg: AYBFou1CUovKPDTiieezGZk3wRBKdf2PE6NwEZCQZtK3uMQy0sub0npNQk13taQe6qT
	wzItbveUrK1mMGg/xz4hUT8vJd8wJg9TUFLteU5Oo0nRWgEYy9rdnqDyA2T3ztQpw8mVXBMHwU6
	HUiJ/aI/H374jJVa1EdY6dc1V9NGt5Rc8Pr0CsMhdNysiUZU0a+AKrDSZ1W38D/Jz5N8jEkXuAM
	iVHoKWLT3qzpZkoL4M/f0l46w6U6k81ynn+ucewsxsctgg06FuY0rtcDLxT7jdm1xsbcGqIp8eB
	l7knmTxpZIXo7XcID1lSMfVzr0lcFbzsYJ3GE36PMN6Bl+N11BdnpqukMQAU8baVTHNQBEGpoVR
	zZRNSDVPFEwDklq/aYKc5OLsUMCEOEazWs9+x6fY23lrndjFhtP03+6hDBZIkUp1Zy21QqCrdGG
	bNLRCEPVfJG6rKrY0mLduQ26X6Ch+fZdeGxkL2zN7+FmTU9HZz30Ns5ajuSRP9rzcZvDabApmIl
	gwz
X-Received: by 2002:a05:600c:8706:b0:4a1:946c:953f with SMTP id 5b1f17b1804b1-4a1d7601873mr254696305e9.20.1792517869433;
        Tue, 20 Oct 2026 10:37:49 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f8016c93sm52505235e9.5.2026.10.20.10.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:37:48 -0700 (PDT)
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
Subject: [PATCH RESEND v10 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Tue, 20 Oct 2026 19:33:27 +0200
Message-ID: <20261020173556.632798-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020173556.632798-1-l.scorcia@gmail.com>
References: <20261020173556.632798-1-l.scorcia@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_103751_463661_341B9CAA 
X-CRM114-Status: GOOD (  13.39  )
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


