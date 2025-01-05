Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A556EE77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 14:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c1Z478PFccNSln7dWMuQv7DfZOcfEI4cNLlL4tJQu2w=; b=2IZ3RJX2mxgBUM3um7o3MUgPuE
	Cv4giORDqZZ0YKf14rnQAv9Scq7zvQ6kzrGw9ikNI4BJzWRyCP861WxBZxP5CetTcIwwJ0bEDY3gQ
	VC73Q+zPddlf9f12PqNMF/3MbTaoCCTMwJPWKnrEIIOkpNF+kQsYsy9dXTzIhgEMf8zIYnD1ZiPCK
	yBlNlVIlZdXhGV+k/hn0LKe626O5iznqKXV+WcrXaa+G7Nn750PhQ2Eq3HFE8Yl1I+M0LZHLxUOGz
	CcD6BhXH2u2sCVGfJhHeCue7ySvM7opQ41y392XsvVLPYiisPRGTgoyTfqnmptgel9CgYOiJFDnND
	WC1GiNGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tURcG-0000000Gv5Z-0ALW;
	Sun, 05 Jan 2025 14:28:32 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tURb4-0000000GuuQ-39US;
	Sun, 05 Jan 2025 14:27:19 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-385d7f19f20so5967670f8f.1;
        Sun, 05 Jan 2025 06:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736087237; x=1736692037; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=c1Z478PFccNSln7dWMuQv7DfZOcfEI4cNLlL4tJQu2w=;
        b=Jd8yb6WNrd7ZSklh1345KRg4R8Nc5UsJWDQ4pU1OEsoH8i2yMSOb5FBl3v7fXpr04N
         gfBDtjZyY323npukAyEnFYzSHeRP0cAK3zfL/DSh7HFPH2z/AhAwBraVjVMJoZeI0TSJ
         /adnAQzGUMM/CFrRqNXFHHEFv3D82O1Tb4qhdzQFOXXiAEp6KTJ8QsuNc/TiLOF1pRLr
         XzxyFtZtxG4wKKNZrKIlfixpZVzR918rZHbHt6y+1gIva7wq/pLSFPd1H10AOZ5MTHru
         KhBZl8xx0CXvzJHC9S0+fSEvso4fkuTmPqkf+S9UnBzH6Z8xR0LyM3kOg5idkOB9E1Xq
         xpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736087237; x=1736692037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c1Z478PFccNSln7dWMuQv7DfZOcfEI4cNLlL4tJQu2w=;
        b=Defy9Gsy9lvqyqLOz69lP4+V1iniD7gfTvaMsxr2gtohSVI+0xHPHPD578mQ+HktKB
         93DDrn+ywxBRqcSzOZmgbYPur9YGsNaierg11tfJv7rYL3sgMWOjJkEvCJxNfWM0p8Gt
         ZnHPgYDZXMsrFTBxSFn2meymrUrZ4AXYiLtMhtsS1uzOx5+HU1inazDyH7I/Fdi/YP1F
         1cHPIjIRZGp7Uvq57OpX8dfRXDvAeh0YOn0L9ZD/dpDZup5MaYm+DdQmqF1Zs66xO20o
         VG7tt2gRWLijVrpiay+TzZUjj92xR7RmJgHTer3Q5fev9FJbijdryU88T/X9weLSao7q
         Ieyw==
X-Forwarded-Encrypted: i=1; AJvYcCUqVGd64uI/h18Oqq/IP1ZNVd1rsfzWRNtYKaBYRapggCq1Jahnnq5oGcviwlGcIgW4bmQMYrdh9kK/vkDecZ4d@lists.infradead.org, AJvYcCVscoNtKvQJfFXrP6n8OOXJucy1A/X3MBTizAnI3eA3nsGKQgwTmlrOh+DG9T76v5aLWIcDRa5AfKW1vusHPBk=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp5rLujsF6YZ2mQ6gGP29fvUkF7m1Sfs6eLe1BJFRU/S2tJymK
	HCq+f7Lx3emaX0VEBZKkyMhqQp6T7CI+uD2GPkKBhFnG5aYMCAfl
X-Gm-Gg: ASbGncs93vQK0dK5b/4ZuXzJLCeuQ990dF3PyWo93pxwye9Md+Unc+AceBPCQoS3I/D
	1cM3z0n0UMUcSTayHhXG+pWl6E0MZ7dU/E0kfAqPFgqj6fd+OJP1yy7HGnbcTS3D1rCBdRn1n26
	TLNpugTQC+1IPqrOiX3TsKEqZ8H1MmUJG1WC0H6GATSU2v9dIuEDFJWoasMEdnp632hjnaWASds
	Va5XDRraMCHvGzo/TPKOtebGDjAiXxOf7VexrbfEaypOrtiKC2plhmyTIQ1yPI1mj2g+w6JUK2f
	vxjDdjzvSSKX8Vr+MB5FOUgHSH9GU6g2sd+Qh9B+nQ==
X-Google-Smtp-Source: AGHT+IH3TVvLO6Boo/d3hFJnZXriXGGLDYi9SEG0+9a0+qMMbDXLIu9FNeyFJd/B1BVWtRAPfZfTiA==
X-Received: by 2002:a05:6000:186e:b0:386:378c:b7ec with SMTP id ffacd0b85a97d-38a22405d3emr48026648f8f.58.1736087236583;
        Sun, 05 Jan 2025 06:27:16 -0800 (PST)
Received: from localhost.localdomain (host-95-246-253-26.retail.telecomitalia.it. [95.246.253.26])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c846ca4sm46438420f8f.43.2025.01.05.06.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 06:27:15 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	upstream@airoha.com
Subject: [PATCH v9 1/2] pmdomain: airoha: Add Airoha CPU PM Domain support
Date: Sun,  5 Jan 2025 15:26:03 +0100
Message-ID: <20250105142645.20128-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_062718_792909_05CE2F54 
X-CRM114-Status: GOOD (  22.95  )
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

Add Airoha CPU PM Domain support to control frequency and power of CPU
present on Airoha EN7581 SoC.

Frequency and power can be controlled with the use of the SMC command by
passing the performance state. The driver also expose a read-only clock
that expose the current CPU frequency with SMC command.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v9:
- Fix compile error targetting wrong branch (remove_new change)
Changes v8:
- Add this patch
- Use SMC invoke instead of 1.2

 drivers/pmdomain/mediatek/Kconfig             |  11 ++
 drivers/pmdomain/mediatek/Makefile            |   1 +
 .../pmdomain/mediatek/airoha-cpu-pmdomain.c   | 144 ++++++++++++++++++
 3 files changed, 156 insertions(+)
 create mode 100644 drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c

diff --git a/drivers/pmdomain/mediatek/Kconfig b/drivers/pmdomain/mediatek/Kconfig
index 21305c4f17fe..049e599a5b57 100644
--- a/drivers/pmdomain/mediatek/Kconfig
+++ b/drivers/pmdomain/mediatek/Kconfig
@@ -26,4 +26,15 @@ config MTK_SCPSYS_PM_DOMAINS
 	  Control Processor System (SCPSYS) has several power management related
 	  tasks in the system.
 
+config AIROHA_CPU_PM_DOMAIN
+	tristate "Airoha CPU power domain"
+	default ARCH_AIROHA
+	depends on PM
+	select PM_GENERIC_DOMAINS
+	help
+	  Say y here to enable CPU power domain support for Airoha SoC.
+
+	  CPU frequency and power is controlled by ATF with SMC command to
+	  set performance states.
+
 endmenu
diff --git a/drivers/pmdomain/mediatek/Makefile b/drivers/pmdomain/mediatek/Makefile
index 8cde09e654b3..0f6edce9239b 100644
--- a/drivers/pmdomain/mediatek/Makefile
+++ b/drivers/pmdomain/mediatek/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_MTK_SCPSYS)		+= mtk-scpsys.o
 obj-$(CONFIG_MTK_SCPSYS_PM_DOMAINS) 	+= mtk-pm-domains.o
+obj-$(CONFIG_AIROHA_CPU_PM_DOMAIN) 	+= airoha-cpu-pmdomain.o
diff --git a/drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c b/drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c
new file mode 100644
index 000000000000..0fd88d2f9ac2
--- /dev/null
+++ b/drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/arm-smccc.h>
+#include <linux/bitfield.h>
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/slab.h>
+
+#define AIROHA_SIP_AVS_HANDLE			0x82000301
+#define AIROHA_AVS_OP_BASE			0xddddddd0
+#define AIROHA_AVS_OP_MASK			GENMASK(1, 0)
+#define AIROHA_AVS_OP_FREQ_DYN_ADJ		(AIROHA_AVS_OP_BASE | \
+						 FIELD_PREP(AIROHA_AVS_OP_MASK, 0x1))
+#define AIROHA_AVS_OP_GET_FREQ			(AIROHA_AVS_OP_BASE | \
+						 FIELD_PREP(AIROHA_AVS_OP_MASK, 0x2))
+
+struct airoha_cpu_pmdomain_priv {
+	struct clk_hw hw;
+	struct generic_pm_domain pd;
+};
+
+static long airoha_cpu_pmdomain_clk_round(struct clk_hw *hw, unsigned long rate,
+					  unsigned long *parent_rate)
+{
+	return rate;
+}
+
+static unsigned long airoha_cpu_pmdomain_clk_get(struct clk_hw *hw,
+						 unsigned long parent_rate)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_invoke(AIROHA_SIP_AVS_HANDLE, AIROHA_AVS_OP_GET_FREQ,
+			     0, 0, 0, 0, 0, 0, &res);
+
+	/* SMCCC returns freq in MHz */
+	return (int)(res.a0 * 1000 * 1000);
+}
+
+/* Airoha CPU clk SMCC is always enabled */
+static int airoha_cpu_pmdomain_clk_is_enabled(struct clk_hw *hw)
+{
+	return true;
+}
+
+static const struct clk_ops airoha_cpu_pmdomain_clk_ops = {
+	.recalc_rate = airoha_cpu_pmdomain_clk_get,
+	.is_enabled = airoha_cpu_pmdomain_clk_is_enabled,
+	.round_rate = airoha_cpu_pmdomain_clk_round,
+};
+
+static int airoha_cpu_pmdomain_set_performance_state(struct generic_pm_domain *domain,
+						     unsigned int state)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_invoke(AIROHA_SIP_AVS_HANDLE, AIROHA_AVS_OP_FREQ_DYN_ADJ,
+			     0, state, 0, 0, 0, 0, &res);
+
+	/* SMC signal correct apply by unsetting BIT 0 */
+	return res.a0 & BIT(0) ? -EINVAL : 0;
+}
+
+static int airoha_cpu_pmdomain_probe(struct platform_device *pdev)
+{
+	struct airoha_cpu_pmdomain_priv *priv;
+	struct device *dev = &pdev->dev;
+	const struct clk_init_data init = {
+		.name = "cpu",
+		.ops = &airoha_cpu_pmdomain_clk_ops,
+		/* Clock with no set_rate, can't cache */
+		.flags = CLK_GET_RATE_NOCACHE,
+	};
+	struct generic_pm_domain *pd;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	/* Init and register a get-only clk for Cpufreq */
+	priv->hw.init = &init;
+	ret = devm_clk_hw_register(dev, &priv->hw);
+	if (ret)
+		return ret;
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
+					  &priv->hw);
+	if (ret)
+		return ret;
+
+	/* Init and register a PD for CPU */
+	pd = &priv->pd;
+	pd->name = "cpu_pd";
+	pd->flags = GENPD_FLAG_ALWAYS_ON;
+	pd->set_performance_state = airoha_cpu_pmdomain_set_performance_state;
+
+	ret = pm_genpd_init(pd, NULL, false);
+	if (ret)
+		return ret;
+
+	ret = of_genpd_add_provider_simple(dev->of_node, pd);
+	if (ret)
+		goto err_add_provider;
+
+	platform_set_drvdata(pdev, priv);
+
+	return 0;
+
+err_add_provider:
+	pm_genpd_remove(pd);
+
+	return ret;
+}
+
+static void airoha_cpu_pmdomain_remove(struct platform_device *pdev)
+{
+	struct airoha_cpu_pmdomain_priv *priv = platform_get_drvdata(pdev);
+
+	of_genpd_del_provider(pdev->dev.of_node);
+	pm_genpd_remove(&priv->pd);
+}
+
+static const struct of_device_id airoha_cpu_pmdomain_of_match[] = {
+	{ .compatible = "airoha,en7581-cpufreq" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, airoha_cpu_pmdomain_of_match);
+
+static struct platform_driver airoha_cpu_pmdomain_driver = {
+	.probe = airoha_cpu_pmdomain_probe,
+	.remove = airoha_cpu_pmdomain_remove,
+	.driver = {
+		.name = "airoha-cpu-pmdomain",
+		.of_match_table = airoha_cpu_pmdomain_of_match,
+	},
+};
+module_platform_driver(airoha_cpu_pmdomain_driver);
+
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_DESCRIPTION("CPU PM domain driver for Airoha SoCs");
+MODULE_LICENSE("GPL");
-- 
2.45.2


