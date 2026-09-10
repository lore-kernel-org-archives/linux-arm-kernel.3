Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD8DC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z7DvNMalUt3F8BDeT40fRWLrjIguh1DMw4KIgm0suLA=; b=n57qtwj8QyqC0v3mVVEnR6iT1Z
	UwU14w9FyvtZv96fPxCrLaDhYGl+SMvyvkYynE8chsKcPJhJEQwhUum0pyvCyWSNr0fBpszFE2MjC
	F5akyqIn5K5Xsv3BMJ0l+OX2LfsfigFSYTp0dEnpvxMLOhmrmtkGZtPV3JaPgHNO0job9M3bxnJvt
	w2jpIbV3CCp12IofJLkbQfVpTEss4sZdApG9ORlujoW20ighctNDFCauKbtCz4cCgk0ro0xftA3bq
	KL3kpYs6ITbwc66wbIe5gCHu/tSQ4cOOtnYMQgj1gn0nIwJLdf0Xb4/w2mTaziqhToNBfFy2GMMRz
	PUcAY6Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ew7-0000000EUBR-2XSk;
	Thu, 10 Sep 2026 13:35:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ew5-0000000EUA1-3r2K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 13:35:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6D2D2050;
	Thu, 10 Sep 2026 06:35:24 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA9833F528;
	Thu, 10 Sep 2026 06:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789047328; bh=jnmA0n6S6YqDU0KnRi20V6Gu7FJaQfv/zxIH7uoXepU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=olMpN7jKGT9mE9//0kZtkNc3/Rm1xJBV6zMfCK2msJrzo9sEz/E36TObXsrZKdjjd
	 PG3RZaacXmdyR/U7bEcj5sUXNYVA32+7gn3jCo/shhSjZjSFe154Hp4u440B7AKNvz
	 J65lJpquFmXyUTjMnTTmPwrtVcOsCP2bAuo32ZRw=
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Yixun Lan <dlan@gentoo.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/7] pinctrl: sunxi: rename SUNXI_PINCTRL_NEW_REG_LAYOUT
Date: Thu, 10 Sep 2026 15:35:12 +0200
Message-ID: <20260910133519.459011-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910133519.459011-1-andre.przywara@arm.com>
References: <20260910133519.459011-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_063530_034992_C4B5F16F 
X-CRM114-Status: GOOD (  16.84  )
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

After keeping the pinctrl IP mostly register compatible for almost a
decade, in 2021 Allwinner introduced some changes to the register
layout, which made us use a flag called SUNXI_PINCTRL_NEW_REG_LAYOUT.
Now with their latest SoC (A733), Allwinner changed the pinctrl IP
again, so "NEW" isn't really a fitting name anymore.

Rename the symbol to SUNXI_PINCTRL_NCAT2_REG_LAYOUT, with "NCAT2" being
a name often used in vendor source code to signify this "new" generation
of SoCs.

Just a rename of the symbol, no actual code changes.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c     | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 4 ++--
 drivers/pinctrl/sunxi/pinctrl-sunxi.h         | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c b/drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c
index 8efe35b77af4d..37a60e5d1163b 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun20i-d1.c
@@ -821,7 +821,7 @@ static const struct sunxi_pinctrl_desc d1_pinctrl_data = {
 static int d1_pinctrl_probe(struct platform_device *pdev)
 {
 	return sunxi_pinctrl_init_with_flags(pdev, &d1_pinctrl_data,
-					     SUNXI_PINCTRL_NEW_REG_LAYOUT);
+					     SUNXI_PINCTRL_NCAT2_REG_LAYOUT);
 }
 
 static const struct of_device_id d1_pinctrl_match[] = {
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
index 462aa1c4a5fa6..9e07fbb5be7cb 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
@@ -35,7 +35,7 @@ static int a523_r_pinctrl_probe(struct platform_device *pdev)
 	return sunxi_pinctrl_dt_table_init(pdev, a523_r_nr_bank_pins,
 					   a523_r_irq_bank_muxes,
 					   &a523_r_pinctrl_data,
-					   SUNXI_PINCTRL_NEW_REG_LAYOUT);
+					   SUNXI_PINCTRL_NCAT2_REG_LAYOUT);
 }
 
 static const struct of_device_id a523_r_pinctrl_match[] = {
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
index b6f78f1f30ac4..801f62abc93df 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
@@ -34,7 +34,7 @@ static int a523_pinctrl_probe(struct platform_device *pdev)
 	return sunxi_pinctrl_dt_table_init(pdev, a523_nr_bank_pins,
 					   a523_irq_bank_muxes,
 					   &a523_pinctrl_data,
-					   SUNXI_PINCTRL_NEW_REG_LAYOUT |
+					   SUNXI_PINCTRL_NCAT2_REG_LAYOUT |
 					   SUNXI_PINCTRL_ELEVEN_BANKS);
 }
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 25489beeb3125..bc6948e3fb495 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -1107,7 +1107,7 @@ static int sunxi_pinctrl_irq_request_resources(struct irq_data *d)
 	muxval = (readl(pctl->membase + reg) & mask) >> shift;
 
 	/* Change muxing to GPIO INPUT mode if at reset value */
-	if (pctl->flags & SUNXI_PINCTRL_NEW_REG_LAYOUT)
+	if (pctl->flags & SUNXI_PINCTRL_NCAT2_REG_LAYOUT)
 		disabled_mux = SUN4I_FUNC_DISABLED_NEW;
 	else
 		disabled_mux = SUN4I_FUNC_DISABLED_OLD;
@@ -1589,7 +1589,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 	pctl->dev = &pdev->dev;
 	pctl->desc = desc;
 	pctl->flags = flags;
-	if (flags & SUNXI_PINCTRL_NEW_REG_LAYOUT) {
+	if (flags & SUNXI_PINCTRL_NCAT2_REG_LAYOUT) {
 		pctl->bank_mem_size = D1_BANK_MEM_SIZE;
 		pctl->pull_regs_offset = D1_PULL_REGS_OFFSET;
 		pctl->dlevel_field_width = D1_DLEVEL_FIELD_WIDTH;
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 0daf7600e2fb0..c519055e31b73 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -90,7 +90,7 @@
 #define SUN4I_FUNC_DISABLED_NEW 15
 
 #define SUNXI_PINCTRL_VARIANT_MASK	GENMASK(7, 0)
-#define SUNXI_PINCTRL_NEW_REG_LAYOUT	BIT(8)
+#define SUNXI_PINCTRL_NCAT2_REG_LAYOUT	BIT(8)
 #define SUNXI_PINCTRL_PORTF_SWITCH	BIT(9)
 #define SUNXI_PINCTRL_ELEVEN_BANKS	BIT(10)
 
-- 
2.47.3


