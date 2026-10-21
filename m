Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844BE606A322
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 10:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EHjVxpjX;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=r0M0YdrG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=; b=EHjVxpjXAyVYvCkRZ+F2x6DQK2
	5X0NFUKJXgc1du7G7mSUD5eh6VBO7endc+CJ5arYKOU4BBbNO3BhGoGw2MO3HkocKD7tmtBLXQ9GC
	jrGIdtJQr9M8u/+udgUFweZ202AzBJw78vesN+4tFVNjt6ZhkEc5BHakH+879qSg4LBrk01a2QJGi
	CTj83KJDXbX/KqMh0fI9Se/M7QJNJXV5Eh1sm6W+f8iEmtzdIjRGkQsb8BakHKCtpkG7l6r40mVpe
	ONgxlXWE22AoBiiwjv7oth9ti8tsuGQal9hm4I+IMVYajHtHt57EmYnIPxlQmcv4ZCDUHJ5/uogV2
	/jSqIpKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTwx-0000000BfZ5-2FUj;
	Wed, 21 Oct 2026 10:53:39 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTwv-0000000BfYA-2YvG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 10:53:38 +0000
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so6500555e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 03:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792580015; x=1793184815; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=r0M0YdrGh/bVNLrPGa2m+T2WHpMvhzd4Jf1OS3psQmd42+ujoglJzfBZv8Mz2o6b+v
         G9SEmp4P+L6oSuRpfdDVwj7HAYyc3RQczFAiCNM5cTXFE9G2ro8bQdXtrmT/Zx2rHhnK
         X5TShCMVTkeMAWxVz0CxoUiuR+x0DXbhSVAv+Zcd2okcul4CD+I4bMOqE2z+yqwOzfZW
         WwsCu2sb+XGJxJyYOOS/Digt/JmOkI+mnvJ3cDVHBu9AUP7anhcboj3GPK9gGQogbbpo
         ewqMmYVnRmLYNRwn/4162ZXQ4Zgyc2R0Yig8ysi1ncKaGQ0FSsjArVELl+65CGxApKoM
         pojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580015; x=1793184815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=ZbJMuEtRGgzMHQGnqtCDLkWwc5x7c+yjMF+VGiJbYvI+kwFdKo0AiVsdtvk39E68Zv
         MItrbNEQCoYVMHQrc0QQ84REZZdGylJ62BMGf5Bij0qHcM7UTSdnRNhzdZSrp2VI6eax
         /dRWPYpvQxNLIUlGt1Sa/Jq6oeHqQl80lrmMhCOOMBFYIfdwxRZGBoeo4RyxnogAmRcC
         VC/AC6b+0YB7bLnKU1/JuhpB4WrdDSWcZTXtFiV0wrho3oBaBslLoh0B58j8KMlDY9tH
         29Mo/5bf/3plZb707O3EbioaaJoVXxSeG35PKbdP0hq99TYevfyTBDqLM+O7VQf+nRNV
         yNFQ==
X-Forwarded-Encrypted: i=1; AKwUvBygSYgH5t7QtqkKIDMhnMfqUfWrlMfLkklG6Zazy+ZlVzxweobxzZU1Ro8nun5NReKclq2ZoS0icNHME9jxv/za@lists.infradead.org
X-Gm-Message-State: AFq9FYKSL4ZN5gK8KQpN+RVJG8JNToCo3R04f89rAT8eqc6mtItrtN1X
	oEeXJ7Z6htKevdMK52yX0GMnUMF0f3aEZxYnZ6iZm+fF22HOTb7XJTB4
X-Gm-Gg: AYBFou2/5HgYnLDirJDzznKDG9df0d1x86YSGbckQMuAyqFQ3NVAf6y1L0teEqQkuYQ
	6PQGkeT8NBk5NBP4domdrWfGJPbs0AFfDTCnijefFNEtp0a3gaA6+2vehEnZNZQzpzKtRmfQyK4
	uUTIaX8a1to9OO8y9zF2iOB8v9Qc6oVGo06akb1UHrnNewGofdHGXu7P15t8Wif8BKakuml/hzd
	gbetpaedzTMN5T+vhr7J1JKN0AoQk5Ure5twfjLZW5JZJBlBNJg4Aw+tQVkKyJsHJPPApr0958E
	+xSY+2NMWcKeaIVESrlHYx6VKobU/xXR2QVFOLI4tIBXKqmRaSkYZA5HDGLSGPuhIHIOaKpFeXp
	65MN2TsZw3TYBKXsCy23K4FwcJ3i3bK1IzvhWksyAPwforpvvkUzsuGYWVyZe17RFS91kfZ3WAS
	4tyDOGJc/URUG5vspDbSUx5Hy35JdtSCWT0Iher664OcFYqSrunXvfjF+qhXLWiXpkgg4eK62El
	LL4CtTRcK4DQJUtZIP8Toxse4dsQBS6ITaWMPtqvtevREWTYpd8
X-Received: by 2002:a05:600c:3f0d:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a1fdd29c19mr35588045e9.14.1792580015036;
        Wed, 21 Oct 2026 03:53:35 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm153388305e9.13.2026.10.21.03.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:53:34 -0700 (PDT)
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
Subject: [PATCH v11 6/9] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Wed, 21 Oct 2026 12:47:24 +0200
Message-ID: <20261021105109.199886-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021105109.199886-1-l.scorcia@gmail.com>
References: <20261021105109.199886-1-l.scorcia@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_035337_662669_7CC923B3 
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


