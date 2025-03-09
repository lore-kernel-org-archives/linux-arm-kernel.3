Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6C6C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 13:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vMiZGcno+hW9tt+O9F3Zmv9JkNkMks439bcycH2JGwI=; b=eINkNx0nQN+C/FB2T6Q+dWZ5up
	6uPdXMyk6zqgwI39eCLxiWog9Cyc49jvmp30DD2gt7Nb4NewqabfO0oJVH/ksb9S28UKGVLl+pANO
	fcrhX4BbrlyTemGGtj8vdCH+ASv23phCSRTJ/7sDvGKhohY2SuKbkHN4xoPBfjhO1/Dgg341vyMRk
	d9Jd4zgj3zvJkqX9ZrKQhz7dbBLy8DtbLEDWVhXMnnXSLTuBsSexcJb3PKERf0KbZ4YYk2hoUAzWj
	dwpfybpBeCmuo+n1PrS+ze9rtX3xN9EtkeB8VKTGBbPBApv9W8jHr4DsxTvQ1xgsPL0lKr25mYsZu
	Ky5RWr/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trGwi-00000000cKy-0U6r;
	Sun, 09 Mar 2025 13:44:00 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trGk0-00000000aTy-3KoW;
	Sun, 09 Mar 2025 13:30:53 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3913fdd003bso272946f8f.1;
        Sun, 09 Mar 2025 06:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741527051; x=1742131851; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vMiZGcno+hW9tt+O9F3Zmv9JkNkMks439bcycH2JGwI=;
        b=LeEgiM8uK5jBW3PgSUVUA60BaEDWHluLvBVEkxFO4LZEowgSA3nBa2N09EU9qOIPiB
         mlc3uRJrhUN5P0K6YdLuyyChcVJ+kMzO1L65uJIQBFlKcir+mDCnOT9gFTYkWjntNFdg
         yAbrtiZpy0q/i3EE1VostyH0iLntbxhkQZM0zYVPpdeoEvTf/3A3uQZ637Cc8Cwtu9H0
         bjzxxwjmxcdFjEMkQU+KvUpod7UiH5GVueWG6yAWzv0ckpjRENWHmJLxL406AZMt8cfA
         sACugV44zdv+GVjTefwTfNg5GVQxArpU/lm4DNd08aiwZM8WO6ua8iogzzKtOTc278D6
         2EoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741527051; x=1742131851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vMiZGcno+hW9tt+O9F3Zmv9JkNkMks439bcycH2JGwI=;
        b=trWAZbfEPTeF8ZXIZQr6M/4TFsAk3N4VCzuEnyYEK+3MKchBwcUIGBa7LE2Pc7cySJ
         Xqc6vtzTJ/svRmB4VInGmVWHvPROncs2PF/3KuvBt8F42BFnnbVHbb1HHjXg2oWKvXUy
         NheaCaPSSKbw5+vwMv04pceWg74V27n/dRcdqTpClZJmxi9kUeZDgboPGk3QDftNDWrc
         ddgT62dBJkmfENpngd3e2aTAzH2EbWd92UgDUGHF1yeTZoO25G8RfgkxOo7FAJMxl8+g
         zRh3ZCZNihzEttnWq33joTgrCyCTJkohVdB2EeGU3uNGgWYNUWkc2EGhbY/gfW8LNQZP
         SIKA==
X-Forwarded-Encrypted: i=1; AJvYcCUFUCZiF7Ha18y6y/Dd8hu08y8JkQAsl/Re4x3Is7zV0yu5Ix6LzTaUfR/ZadqxmP99TBObQWBBPam4DjshXsk=@lists.infradead.org, AJvYcCWQ7n8YUjDWa2ODATuUjblkiYXvVFJGZXvCMl34dCNldKsgKfhfrdtqH6RqeTynyA1fjg4wHXle/OjJ9IKs1tYN@lists.infradead.org, AJvYcCXVsFBUtNHEps/glPQSEtJ8rOVja0riOaYMZoHyvwl1Uy21ffW7HiOS/zII97xSR7xF96nkSdg2ZJ0O@lists.infradead.org
X-Gm-Message-State: AOJu0YzLr80KNhRdvw4R58WaFaCWvl6X0AkucKrcmkT31ytav9cORSL2
	2PONJ7DgIq2LcjIJrMGqYiiG264CQZrPIDwe01ZU2Lh66khZX58F
X-Gm-Gg: ASbGncuoiBGeSyyMw9rwMewxgNO6JDDLta4RkteFtcZyREMQNXozbqwV9NY8UL6y4+5
	8PEvzUNBBWFTJeMEaxU1b5nlF3WuIig63XN6ws7V0ph/ki9Q6dpW0abOX4Nbbz68gQDowUSNe+y
	gqxQ729xW3eZwQEV612BDXboUDe1m+zZFsFyfSAhasBGSVKteUnjmveOPjGbAvhylrFLeT7Dvgd
	KPUBZreOBOtD8rOPadsaOwkEdMi+ANDxYMFCzmSB9sDQqIKq2N2V/cjCgIXr/E+/P9nVOscNYMv
	ozTusu9jOGcHNsBXclgJ0CRRKU3CujSGLHauOKjnGjT4XBVR2DgdjG+LYU68KTOp80ooR0NU+jz
	Ra9B7MZsu6EbgzQ==
X-Google-Smtp-Source: AGHT+IEKDnwZY7XkrfL/HLuqPzV7EZSUKsEKRaNGjzZ6iQ8qzVfwZIlEdBBipFRunBqGuf6Da3ld5w==
X-Received: by 2002:a05:6000:184b:b0:391:865:5a93 with SMTP id ffacd0b85a97d-3913af328d5mr4021842f8f.22.1741527049718;
        Sun, 09 Mar 2025 06:30:49 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3912bee262esm11867536f8f.0.2025.03.09.06.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 06:30:49 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Daniel Danzberger <dd@embedd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Guo Ren <guoren@kernel.org>,
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
Subject: [PATCH 07/13] clk: en7523: support getting regmap from parent node for EN7581
Date: Sun,  9 Mar 2025 14:29:38 +0100
Message-ID: <20250309132959.19045-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309132959.19045-1-ansuelsmth@gmail.com>
References: <20250309132959.19045-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_063052_831004_D2BC2CA6 
X-CRM114-Status: GOOD (  15.02  )
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

Add support for getting clock regmap from parent node for Airoha EN7581.

This is needed to support new implementation with SCU (System Controller
Unit) as an MFD and clock-controller node as a child node of it.

In such implementation the register regmap is provided as a syscon from
the parent node.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 2a74bc8fed24..29cb7ccea29a 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -665,6 +665,7 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 			      const struct en_clk_soc_data *soc_data,
 			      struct clk_hw_onecell_data *clk_data)
 {
+	struct device *dev = &pdev->dev;
 	struct regmap *map, *clk_map;
 	void __iomem *base;
 
@@ -672,22 +673,28 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 	if (IS_ERR(map))
 		return PTR_ERR(map);
 
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	clk_map = devm_regmap_init_mmio(&pdev->dev, base, &en7523_clk_regmap_config);
-	if (IS_ERR(clk_map))
-		return PTR_ERR(clk_map);
+	if (of_property_present(dev->of_node, "reg")) {
+		base = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(base))
+			return PTR_ERR(base);
+
+		clk_map = devm_regmap_init_mmio(dev, base, &en7523_clk_regmap_config);
+		if (IS_ERR(clk_map))
+			return PTR_ERR(clk_map);
+	} else {
+		clk_map = device_node_to_regmap(dev->parent->of_node);
+		if (IS_ERR(clk_map))
+			return PTR_ERR(clk_map);
+	}
 
-	en75xx_register_clocks(&pdev->dev, soc_data, clk_data, map, clk_map);
+	en75xx_register_clocks(dev, soc_data, clk_data, map, clk_map);
 
 	regmap_clear_bits(clk_map, REG_NP_SCU_SSTR,
 			  REG_PCIE_XSI0_SEL_MASK | REG_PCIE_XSI1_SEL_MASK);
 	regmap_update_bits(clk_map, REG_NP_SCU_PCIC, REG_PCIE_CTRL,
 			   FIELD_PREP(REG_PCIE_CTRL, 3));
 
-	return en7581_reset_register(&pdev->dev, clk_map);
+	return en7581_reset_register(dev, clk_map);
 }
 
 static int en7523_clk_probe(struct platform_device *pdev)
-- 
2.48.1


