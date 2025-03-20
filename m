Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A806C36000
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 13:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYnsaKwLQcaTkvM+4ffTJRr6nfs/V7lVq/qqbRtol90=; b=cf6DwbgdoZ9ZqB4hnCjiAoi+a2
	VLAOiG66BesMO6j6VKenFaWa1NddwWiFQb1Lhtzb3nftU9n5oeB1Tbx7fXZLaVs0LUQPwZCa1EAbf
	bouvsiALyWHXHYwTcFFDJfj/eOAu6PcvZFCznZ+WytCCdSxmjLucd+VWi7oknj4Ye2NkqKvR5aMhT
	sphG9SfDJmoGhk9o5Zhx4upLImOF0dePEieoV4hl4dYeb4ool7oBAUdtycWhjZWh0akwzT32s4IN6
	/CCm2ylA/f12R05d1kdfrKDgCDrAVDGEDfUgBmfgb7WFblJo2asXP/I54KOI5LAZqRb6BWY2436U2
	Nu1zMPZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFei-0000000CBxS-1PWp;
	Thu, 20 Mar 2025 13:09:52 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFWd-0000000CAaR-2WSq;
	Thu, 20 Mar 2025 13:01:32 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso7365895e9.2;
        Thu, 20 Mar 2025 06:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742475690; x=1743080490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qYnsaKwLQcaTkvM+4ffTJRr6nfs/V7lVq/qqbRtol90=;
        b=Ar45eeJ2Wg/UjtF8yIfENX5qbOje1kpny8uRlM5CQG6f32DsUY8MhyorUpyfjukIAO
         Fukk7uAv2dvYlhkiqTrRZwfeWzlvW9Vy3om65yO0EK7abGerWR9sGpqhMMUBRqrjOSJJ
         9DdUfE7SF3XBBbn0gmq+bvxDBGqeugbIVaxvUV1H4whK08Aijqz7GffE17kbEwk6db5s
         ZyYdBuso3Fld7BxoYgIwqq8u8K/87WxLouWfUwc9v2x5t1eYPe2TyeNrsCA7hEP3LeT2
         fI8Jflt5FteEYusF7jydvSWcWuylkh9lyDdlhwKngXmKxl1QdQf6rNJSYefrz9pQXGdc
         Pf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742475690; x=1743080490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYnsaKwLQcaTkvM+4ffTJRr6nfs/V7lVq/qqbRtol90=;
        b=gtsf2t8gZUgLJ74cGHjwKEDF/Uy9e4eA67tuk8zaVcEQAOykA/4UzibnVHxSTRNMTN
         S/gyivv8Nsgr9jEx/+wBO2qle3rpVyjQWMRod1LpAP5WFjXloOvjW64dZR6YsxipCbow
         FTNfaYJjAaTHLLQZKm5l8PPqH1rT5tHdqy7bCjiBf7ttw2FivpokjR1yIDXj4Uwyupns
         BaKynrcQqPQP4xe8QWl3T/VwLEYuNKOl9kkhApIpNO/LuLzzzJBUDzoAql5wEBBHfUkD
         Y/8vFxG+E0W+zlk12QaUobUIo8lYoBx4gxQ982dtyz/Eyx4RbLgCzUpKr283uWGHnfSY
         t7ig==
X-Forwarded-Encrypted: i=1; AJvYcCW0/CKynbkksN35FO36SUaC0F/8ipqSJRQvypN2VPyqoDt2E+A31Y/Ey+8YVuT/C5aJJtSdTxkH0FUQ@lists.infradead.org, AJvYcCWZtHHBBdGD3UD/V3/thHZ2eZtz/xrCgiTTc3g8Q77+aXW2NSK1ZhdLlZTc35CNn9dlWydb8lwyCaFQaodeh0E=@lists.infradead.org, AJvYcCWaSa7MonInz7cCiTmSCM6Hj9LSyaswzNUxqk3FzaV/YUuQYUfmeZd/dO6mI5nWdtREWP2nFPjWQ6YcqVfm5p5a@lists.infradead.org
X-Gm-Message-State: AOJu0YwABO4oCe1Z4jMiqIJjc1DiwiyNHA1NZ4zfmRJ71kl7p9gY+jCo
	eggDsGkJrBM8Jst49r88iDQqafunwHupOVBV2khzdQQI7W0B1KeN
X-Gm-Gg: ASbGncu5OTkhU+B6wewF6CXWAKFTgR6PuJmRSMjkVqa6R/QVCubG6JMIhadHZ98q2WT
	NV1FjTwgJPzXDg9SxlqUxhI+F3yqlYHISj0S6h5Jw/oNuxRLjkbZ5Bjw9nWZYXwRN/gIBarMWav
	kOBFjUpqJdvoFqWO0scu2srQredYy/9axNitaDxGbI+wzvj8u1E1SM6uuFAg2cC1H344l/OaHx+
	h5/t/5jO3zUM/se0dguZOgsRGOQaoX8HplM733EtRxP0RxRgpwhTVdAP8lPCaBBYNibS0M3OIbY
	CcQdMNMRndTH/MWQy58ssCjlY3NgRfkED8/GA6uf8Uwp0ljRw9OedX97jXWZTXpfD+swqNfbMej
	PFKCVL886fgdh8g==
X-Google-Smtp-Source: AGHT+IHitBKtOOy1SucPgUEGQLzzWHiEWJEFOJ0pyvyjc03NX9aNdjwUqdZDmvLHpRN43tzfEYYlSg==
X-Received: by 2002:a05:6000:21c7:b0:390:e1e0:1300 with SMTP id ffacd0b85a97d-399739d437amr4854037f8f.33.1742475689504;
        Thu, 20 Mar 2025 06:01:29 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-397f2837e61sm18492328f8f.97.2025.03.20.06.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 06:01:28 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Danzberger <dd@embedd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Linus Walleij <linus.walleij@linaro.org>,
	Yangyu Chen <cyy@cyyself.name>,
	Ben Hutchings <ben@decadent.org.uk>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH v2 02/11] clk: en7523: generalize register clocks function
Date: Thu, 20 Mar 2025 14:00:25 +0100
Message-ID: <20250320130054.4804-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250320130054.4804-1-ansuelsmth@gmail.com>
References: <20250320130054.4804-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_060131_641993_36A54FC4 
X-CRM114-Status: GOOD (  20.76  )
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

Generalize register clocks function for Airoha EN7523 and EN7581 clocks
driver. The same logic is applied for both clock hence code can be
reduced and simplified by putting the base_clocks struct in the soc_data
and passing that to a generic register clocks function.

There is always the pattern where the last clock is always the PCIe one.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 130 ++++++++++++++++-----------------------
 1 file changed, 53 insertions(+), 77 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 314e7450313f..2a74bc8fed24 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -78,8 +78,10 @@ struct en_rst_data {
 
 struct en_clk_soc_data {
 	u32 num_clocks;
+	const struct en_clk_desc *base_clks;
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
+		       const struct en_clk_soc_data *soc_data,
 		       struct clk_hw_onecell_data *clk_data);
 };
 
@@ -467,6 +469,50 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 	return &cg->hw;
 }
 
+static void en75xx_register_clocks(struct device *dev,
+				   const struct en_clk_soc_data *soc_data,
+				   struct clk_hw_onecell_data *clk_data,
+				   struct regmap *map, struct regmap *clk_map)
+{
+	struct clk_hw *hw;
+	u32 rate;
+	int i;
+
+	for (i = 0; i < soc_data->num_clocks - 1; i++) {
+		const struct en_clk_desc *desc = &soc_data->base_clks[i];
+		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
+		int err;
+
+		err = regmap_read(map, desc->base_reg, &val);
+		if (err) {
+			pr_err("Failed reading fixed clk rate %s: %d\n",
+			       desc->name, err);
+			continue;
+		}
+		rate = en7523_get_base_rate(desc, val);
+
+		err = regmap_read(map, reg, &val);
+		if (err) {
+			pr_err("Failed reading fixed clk div %s: %d\n",
+			       desc->name, err);
+			continue;
+		}
+		rate /= en7523_get_div(desc, val);
+
+		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		if (IS_ERR(hw)) {
+			pr_err("Failed to register clk %s: %ld\n",
+			       desc->name, PTR_ERR(hw));
+			continue;
+		}
+
+		clk_data->hws[desc->id] = hw;
+	}
+
+	hw = en7523_register_pcie_clk(dev, clk_map);
+	clk_data->hws[soc_data->num_clocks] = hw;
+}
+
 static int en7581_pci_is_enabled(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
@@ -504,38 +550,6 @@ static void en7581_pci_disable(struct clk_hw *hw)
 	usleep_range(1000, 2000);
 }
 
-static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
-				   struct regmap *map, struct regmap *clk_map)
-{
-	struct clk_hw *hw;
-	u32 rate;
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(en7523_base_clks); i++) {
-		const struct en_clk_desc *desc = &en7523_base_clks[i];
-		u32 reg = desc->div_reg ? desc->div_reg : desc->base_reg;
-		u32 val;
-
-		regmap_read(map, desc->base_reg, &val);
-
-		rate = en7523_get_base_rate(desc, val);
-		regmap_read(map, reg, &val);
-		rate /= en7523_get_div(desc, val);
-
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
-		if (IS_ERR(hw)) {
-			pr_err("Failed to register clk %s: %ld\n",
-			       desc->name, PTR_ERR(hw));
-			continue;
-		}
-
-		clk_data->hws[desc->id] = hw;
-	}
-
-	hw = en7523_register_pcie_clk(dev, clk_map);
-	clk_data->hws[EN7523_CLK_PCIE] = hw;
-}
-
 static const struct regmap_config en7523_clk_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
@@ -543,6 +557,7 @@ static const struct regmap_config en7523_clk_regmap_config = {
 };
 
 static int en7523_clk_hw_init(struct platform_device *pdev,
+			      const struct en_clk_soc_data *soc_data,
 			      struct clk_hw_onecell_data *clk_data)
 {
 	void __iomem *base, *np_base;
@@ -566,53 +581,11 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
 	if (IS_ERR(clk_map))
 		return PTR_ERR(clk_map);
 
-	en7523_register_clocks(&pdev->dev, clk_data, map, clk_map);
+	en75xx_register_clocks(&pdev->dev, soc_data, clk_data, map, clk_map);
 
 	return 0;
 }
 
-static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
-				   struct regmap *map, struct regmap *clk_map)
-{
-	struct clk_hw *hw;
-	u32 rate;
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(en7581_base_clks); i++) {
-		const struct en_clk_desc *desc = &en7581_base_clks[i];
-		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
-		int err;
-
-		err = regmap_read(map, desc->base_reg, &val);
-		if (err) {
-			pr_err("Failed reading fixed clk rate %s: %d\n",
-			       desc->name, err);
-			continue;
-		}
-		rate = en7523_get_base_rate(desc, val);
-
-		err = regmap_read(map, reg, &val);
-		if (err) {
-			pr_err("Failed reading fixed clk div %s: %d\n",
-			       desc->name, err);
-			continue;
-		}
-		rate /= en7523_get_div(desc, val);
-
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
-		if (IS_ERR(hw)) {
-			pr_err("Failed to register clk %s: %ld\n",
-			       desc->name, PTR_ERR(hw));
-			continue;
-		}
-
-		clk_data->hws[desc->id] = hw;
-	}
-
-	hw = en7523_register_pcie_clk(dev, clk_map);
-	clk_data->hws[EN7523_CLK_PCIE] = hw;
-}
-
 static int en7523_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
@@ -689,6 +662,7 @@ static int en7581_reset_register(struct device *dev, struct regmap *map)
 }
 
 static int en7581_clk_hw_init(struct platform_device *pdev,
+			      const struct en_clk_soc_data *soc_data,
 			      struct clk_hw_onecell_data *clk_data)
 {
 	struct regmap *map, *clk_map;
@@ -706,7 +680,7 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 	if (IS_ERR(clk_map))
 		return PTR_ERR(clk_map);
 
-	en7581_register_clocks(&pdev->dev, clk_data, map, clk_map);
+	en75xx_register_clocks(&pdev->dev, soc_data, clk_data, map, clk_map);
 
 	regmap_clear_bits(clk_map, REG_NP_SCU_SSTR,
 			  REG_PCIE_XSI0_SEL_MASK | REG_PCIE_XSI1_SEL_MASK);
@@ -732,7 +706,7 @@ static int en7523_clk_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	clk_data->num = soc_data->num_clocks;
-	r = soc_data->hw_init(pdev, clk_data);
+	r = soc_data->hw_init(pdev, soc_data, clk_data);
 	if (r)
 		return r;
 
@@ -740,6 +714,7 @@ static int en7523_clk_probe(struct platform_device *pdev)
 }
 
 static const struct en_clk_soc_data en7523_data = {
+	.base_clks = en7523_base_clks,
 	.num_clocks = ARRAY_SIZE(en7523_base_clks) + 1,
 	.pcie_ops = {
 		.is_enabled = en7523_pci_is_enabled,
@@ -750,6 +725,7 @@ static const struct en_clk_soc_data en7523_data = {
 };
 
 static const struct en_clk_soc_data en7581_data = {
+	.base_clks = en7581_base_clks,
 	/* We increment num_clocks by 1 to account for additional PCIe clock */
 	.num_clocks = ARRAY_SIZE(en7581_base_clks) + 1,
 	.pcie_ops = {
-- 
2.48.1


