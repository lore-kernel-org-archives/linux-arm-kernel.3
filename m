Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB07F532D6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 05:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TRQv5SoUqO6wpjc4KXUJi5zBo9PQQ21uTlHATv67Buc=; b=rjfbJLMD+7rjzrTUyNLG/Yjhw+
	H+IrqKClZuOAyn3OLBePaiLOkp0VWUydDekoz9FPx6hurR2wsUXXkNbzsvTAdz4rJeGt0eGbWdCru
	kXD3Ex89U8z4KuyzEV4v+fNgHvhJAhDWj0RpzhMaFiCTfz68ptdoJyXG0JW34JrH57xud4/rT2TJF
	j5UmXK/k0zV5TVG5ju8h8XPlBuicrN3xy5zeb5nB8ArHWwJjwAft5pDAFDbBmbdpMfjZugCqdxodS
	dEP5IKrnqgb13oZTuNbaUwOYu2LGjwvWLGzvUEuKN6i939S9Rp2rGhTMlNEGTEYMFXoqFVAzBFCHQ
	p9RppWuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uM0-00000000aYF-1HBl;
	Tue, 24 Mar 2026 05:31:00 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uLq-00000000aR3-48sC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 05:30:52 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-35a09e0dd63so4705015a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 22:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774330250; x=1774935050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRQv5SoUqO6wpjc4KXUJi5zBo9PQQ21uTlHATv67Buc=;
        b=Y/fwPgmg3J9AMSVJWGrfCPhoq9TOPQDnVR9CHQNh+Jmjr9jgCdIq9pVtBKtWoHvPVl
         2nk9dHDBMGGwtFIN+YN8an/5Zztvl9iHJs0HQGE5cAvjrnX6AERpLitC2/YFXRKGaq4L
         kcsH6w5mjaV+Yr6DAVPu3G3rnl+aC9K99CVWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774330250; x=1774935050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TRQv5SoUqO6wpjc4KXUJi5zBo9PQQ21uTlHATv67Buc=;
        b=Ht0wDjD88xy3Y3aa8rw4Xn/rhKojKrbPOEOU5YearR8ekkxmsD6BLhxrN+GBPnNVw/
         g8LGGzTUIx5ajDRNENSZN3kr4tl+ulXIdC6ihu+mhTgs+TViisyx3EthAA1YYQfvYcEJ
         uIDtUW95ikxe1Ej6qdFYRewlRwM6heRA78x8ONeoVUjM+SKLxds+9Z5trcHcA5WJbtP6
         PZqMTWicERbmNGIhXyF8402AcIAxh2eT/ZDUFpOK/8rt+3yV1d3GORjpHygiv6DPvsvG
         Pe2CeMB8FBQZqcm0I/kLX9X4t3XFSh+v+rB5HHeM0efkxJ5smZnougxM16c4JQeBiJGF
         UOeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAh2zj7A1Ggf/riQZqjz4pXNmRQ+Q0ITLzeEVq5PmlvppSQV9sSj9HUJXonCbtiKEXg0jx/sTT6AXRAXqjTe2r@lists.infradead.org
X-Gm-Message-State: AOJu0YzFtGy/vgwcCyNRqiVaZGkgmJNoIcPo1gkjYqlRMdSXsViD3LdJ
	BSRbAp5Khl2M1u1n/mA2YxeXDvCrLw7b618MPiHikETTpn+6Qu+ze+mo4gOTucbKHQ==
X-Gm-Gg: ATEYQzx0GGIFDR52hnfwxh4V4ii13F8+/e+/7XqIkiwSWzuYKaWIyRNGOrRNenazfqF
	L9hq9Co4hrL2Swcx4+GzRd30C7We1bJcO0M9NASzYOF6/kgLUR9Y0UsyW5d4I5nykSlVQqj8WwI
	0Zl8uiLycUrQpncQpx9oUpC0O3D4AEz1v+5syuY1UExRLUsZDCDSN5A/gItNQ97dHorelyoeYxQ
	K+BnuIZXi7/DGkgH3eHvsCam4LhV1Cn0xP7OtpPfE3sl0d8c383v/BvYsK2a+g4cUHqhQoQ1TPf
	+57HHa+5ZvxAsmXqwPndeE67+wlibPZ1h1lBZ/ity8B0yfe5Xq7Fj4oQWVZql1EDzy1KM6F1Ci/
	PmwYW8T/T5RMRmEwdaNK9R5wUm7sAdkEDImWPlk2XG31mYsA1x3r/ZjRkM3nKVTctehv7+RToAi
	lH3KCj4OHUNpCy9HgUvvFcPnj2A137wZ70VGCNSZHUCnA4+S5Dfavw7CluJahtDxz8uHXJANQEi
	zYVyLCo
X-Received: by 2002:a17:90b:4e90:b0:35b:e551:e776 with SMTP id 98e67ed59e1d1-35be551e7a9mr7465594a91.27.1774330250183;
        Mon, 23 Mar 2026 22:30:50 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:19a5:8f2f:d584:8078])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03211351sm953507a91.15.2026.03.23.22.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 22:30:49 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH RESEND 2/2] regulator: mt6315: Add regulator supplies
Date: Tue, 24 Mar 2026 13:30:29 +0800
Message-ID: <20260324053030.4077453-3-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.983.g0bb29b3bc5-goog
In-Reply-To: <20260324053030.4077453-1-wenst@chromium.org>
References: <20260324053030.4077453-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_223051_025299_F36B7CCF 
X-CRM114-Status: GOOD (  12.84  )
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

The MT6315 family of PMICs has 4 buck regulators. Each regulator has a
separate supply.

Add these supplies to the driver.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/regulator/mt6315-regulator.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/mt6315-regulator.c b/drivers/regulator/mt6315-regulator.c
index d3f93aae0fc5..231e64fb0596 100644
--- a/drivers/regulator/mt6315-regulator.c
+++ b/drivers/regulator/mt6315-regulator.c
@@ -31,10 +31,11 @@ struct mt6315_chip {
 	struct regmap *regmap;
 };
 
-#define MT_BUCK(_name, _bid, _vsel)				\
+#define MT_BUCK(_name, _bid, _supply, _vsel)			\
 [_bid] = {							\
 	.desc = {						\
 		.name = _name,					\
+		.supply_name = _supply,				\
 		.of_match = of_match_ptr(_name),		\
 		.regulators_node = "regulators",		\
 		.ops = &mt6315_volt_range_ops,			\
@@ -190,10 +191,10 @@ static const struct regulator_ops mt6315_volt_range_ops = {
 };
 
 static const struct mt6315_regulator_info mt6315_regulators[MT6315_VBUCK_MAX] = {
-	MT_BUCK("vbuck1", MT6315_VBUCK1, MT6315_BUCK_TOP_ELR0),
-	MT_BUCK("vbuck2", MT6315_VBUCK2, MT6315_BUCK_TOP_ELR2),
-	MT_BUCK("vbuck3", MT6315_VBUCK3, MT6315_BUCK_TOP_ELR4),
-	MT_BUCK("vbuck4", MT6315_VBUCK4, MT6315_BUCK_TOP_ELR6),
+	MT_BUCK("vbuck1", MT6315_VBUCK1, "pvdd1", MT6315_BUCK_TOP_ELR0),
+	MT_BUCK("vbuck2", MT6315_VBUCK2, "pvdd2", MT6315_BUCK_TOP_ELR2),
+	MT_BUCK("vbuck3", MT6315_VBUCK3, "pvdd3", MT6315_BUCK_TOP_ELR4),
+	MT_BUCK("vbuck4", MT6315_VBUCK4, "pvdd4", MT6315_BUCK_TOP_ELR6),
 };
 
 static const struct regmap_config mt6315_regmap_config = {
-- 
2.53.0.983.g0bb29b3bc5-goog


