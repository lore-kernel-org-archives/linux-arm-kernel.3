Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69683E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 13:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uRM5j6Ot4ZAazzuIZoxOMebBYpgaQOV63uO0HmRhKhU=; b=UP2frfyzpPjv8rirc4W3QCVzWC
	9fEJygf1cwM/OPWySxceHJYPiS/mwEpWw268w6dzUyB0c2v0KIl4+SuBSzFzoIHxymcIHU0PKghP4
	Ce9TBAGr/FxxkH4aS5YOynjn5V/OLQrhWf9CVNQnvPmKOvQ/YVvwJ73O+UlLgD2SazlCWDfuv49SZ
	jMXlbWqOqAXGN9RIp+wTploORSfAJnJVvDbn6d4pt+esQKgpNC4tJ9hqjRbc1gN/EVloDq2uPnUxJ
	0PH/CwAwRA3K0gK6kJNBDVQ3k/3KzhJVSkOvUqat6pzgYnW9mKPAV/eip+Zf19g0ceLxopFH0vDDM
	xD+pF22A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVsNF-0000000ByUd-1f9o;
	Thu, 09 Jan 2025 13:14:57 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVsM2-0000000ByEl-159s;
	Thu, 09 Jan 2025 13:13:43 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4361fe642ddso10211475e9.2;
        Thu, 09 Jan 2025 05:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736428420; x=1737033220; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uRM5j6Ot4ZAazzuIZoxOMebBYpgaQOV63uO0HmRhKhU=;
        b=NTKjNoSOm3yO0BPgErC67ZUM8Cr//qjlZb5jYJz6LXdgPLpdG2g9cRhYXxBNEHAzV4
         QEleIx47w4xnVLJKQ6rKcrxllY80RxTnlLyseuqOS1nw3HnzGvElsJXuih+q25RnVdqA
         JDfQ4MHIsYNhZNoJqC683hhS8ElzmW8o2JCtv9tyq3NkTerC4+PiEoocDNnzlx35rQwf
         4Hm9ZE9yVJuEpt3+IDQ/AiqI9M+eF35PxEA0maJIfm4Vis5L0h16az0fO4w6Q4V9G9dm
         Xrvgnk4bkTi8IYSzVvHJE0ThvESl5c61plLpXdO5K2Yg0fi0aEEheVtjcY+AHiIlPXrC
         brtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736428420; x=1737033220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uRM5j6Ot4ZAazzuIZoxOMebBYpgaQOV63uO0HmRhKhU=;
        b=R6wfYMGF4QHaxGK2xUBd06YoARCuoW0eMc5QMtstX5rqz2XeJ9xpjYtF0jmZAfUk6p
         sfLjVI8rO3vA1gZqc/2d++KnF97shUAhZgUAKrIal0DDg7QhFTdsvfJr283L+1KHm1lF
         g5IUpCQHMlN49EDQqnk69xN6bCFPZAWGU12xnUQND3ld+44G55SecsI2udW+HVaz/rXg
         k3nQBWHX6KrEHZtaKEHYCvrRGc2IW4tfz+aMm91GVWgNTHdAKFWepfbFjpmjQWQaE8AK
         syUxp6K9MM3Zi0y8RAT84jSxn/mTP9o4Tr/IKsvVE52bBRY9DbJI+E+VrQMGrm7Xnu/T
         BYvA==
X-Forwarded-Encrypted: i=1; AJvYcCUgd52FO54Oq6k99QiqIB3BulX0VamoMFVcTJHMxECBvtGOYZDIulp2GFDY85QpL3xfsUr5CKPq65IQZKcErS0=@lists.infradead.org, AJvYcCVgGnxJlx0s4UrZv0Si4ATE/pi1Aw9Q0bvcjeiGsTVGshLVy5VkQ7DFXg2oUa4UU26bjmwYofP8o6OHQNOugJW1@lists.infradead.org
X-Gm-Message-State: AOJu0YyhzkZ8J19N0KbXX5a9MNh47hFU2NBt+opBBZBKgqD3prw+Ct/Q
	grjMSyR5ListUw+IdHU8v6ci4aJbaUbx7U5QqAQzbBbWX1YA+F/P
X-Gm-Gg: ASbGnctA/fFeRKw6zRoJx0cGXrjmXs/HhHeI04zVhqTYPbcwCe0KV8S1qgOz64Kz3Dx
	OPWQWF3bR03oLFMMpW9BWCuIfaSXKX0/5zOLik494RfL9lCd5rLozTgGujBlrrRtwlCr+6mNjQg
	q5V536MgaLjfD+TEref6UV3clWs6qym8T/eXjPhdPOcXXaKzUcp5p9mAPaqIktZC4dB7bbr9mNn
	RtVIIBdZDq3Jsu9r3KY2/cBEaD75xvlSVBNnk2c4kyDM1g3F2Ni6oONgJvF/m716cz7ZTjIbe5o
	u4Q+P+jas9vC1wFuCWttCsqdmq2i/0FUQFkVMdsxRQ==
X-Google-Smtp-Source: AGHT+IGYsdHXDWGW+Q3wxecp7JvcILTEtygYfayS/lnRgUKCfBKAXrNMj5q72OGDlEgPzx8re1XYdQ==
X-Received: by 2002:a05:600c:5112:b0:434:a386:6cf with SMTP id 5b1f17b1804b1-436e267f77amr60316635e9.2.1736428419286;
        Thu, 09 Jan 2025 05:13:39 -0800 (PST)
Received: from localhost.localdomain (host-95-246-253-26.retail.telecomitalia.it. [95.246.253.26])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a8e385026sm1812286f8f.42.2025.01.09.05.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 05:13:38 -0800 (PST)
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
Subject: [PATCH v10 1/2] pmdomain: airoha: Add Airoha CPU PM Domain support
Date: Thu,  9 Jan 2025 14:12:57 +0100
Message-ID: <20250109131313.32317-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_051342_296671_4F04C570 
X-CRM114-Status: GOOD (  23.72  )
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
Changes v10:
- Depends on HAVE_ARM_SMCCC
Changes v9:
- Fix compile error targetting wrong branch (remove_new change)
Changes v8:
- Add this patch
- Use SMC invoke instead of 1.2

 drivers/pmdomain/mediatek/Kconfig             |  12 ++
 drivers/pmdomain/mediatek/Makefile            |   1 +
 .../pmdomain/mediatek/airoha-cpu-pmdomain.c   | 144 ++++++++++++++++++
 3 files changed, 157 insertions(+)
 create mode 100644 drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c

diff --git a/drivers/pmdomain/mediatek/Kconfig b/drivers/pmdomain/mediatek/Kconfig
index 21305c4f17fe..0e34a517ab7d 100644
--- a/drivers/pmdomain/mediatek/Kconfig
+++ b/drivers/pmdomain/mediatek/Kconfig
@@ -26,4 +26,16 @@ config MTK_SCPSYS_PM_DOMAINS
 	  Control Processor System (SCPSYS) has several power management related
 	  tasks in the system.
 
+config AIROHA_CPU_PM_DOMAIN
+	tristate "Airoha CPU power domain"
+	default ARCH_AIROHA
+	depends on HAVE_ARM_SMCCC
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


