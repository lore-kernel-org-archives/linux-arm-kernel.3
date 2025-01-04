Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF37BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 18:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IC3C3Jj0ECPtMGXUDy4JdjvWVRz6QWTlZAY+EqQiUks=; b=W0Enbd0qRCax5BDXQ4msOtIFpq
	d4nS3GOBG0H344PAkFVnU+KAOCgQJx62+ft6z4GlDbsGXmrMOsoc7JeruiDYQDgQtGBbqFlfNSBGZ
	+EZq2gMXDgqyLZVHa8MuNpjR+zfzF1tkIyhQQQLPMSZkMM0ZJ3RHWA6SUEESO0/VgGcVeKyez3LsN
	ULl0VBPd5faa/WVdQgQ+FqvJaAbC4xXiSfX7uuqY13w2XsmPRoYFxX+iCH3xuevJ3rzxl0d+ZvesG
	TSs7hPNKSq+BffcDoqDw/Xps8D8k3WkNqvUvkzUkbae+2oVugbqFvtgLOTfmAfiwoz2me1tmBdnZZ
	Hcj0MUsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU8fi-0000000FNuk-106q;
	Sat, 04 Jan 2025 18:14:50 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU8eX-0000000FNmV-1U6k;
	Sat, 04 Jan 2025 18:13:38 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso87215145e9.0;
        Sat, 04 Jan 2025 10:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736014415; x=1736619215; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IC3C3Jj0ECPtMGXUDy4JdjvWVRz6QWTlZAY+EqQiUks=;
        b=eZSjHOMC0PMCJ+DI8ChKCG2WXtO/XXvAbLZIzH8XreWhggOr4Uobp8zC1zqSSbpkBh
         B92iMGzc6ECUYoagm287BFL4OG2sVnutyF9nb7F5JRsjrYiWymYYbRnEG6n4I4ZMUWNl
         uH23x0B3Ss2XRkHTKlcZWQeIgPtY1IeVHHGH0Jnp/OsjLp1W626gC5q725qMIbtQz6ex
         Y9ApSvSredahSBzzk+VjvprTSqgf11Gzh9nhOtwgYN43rfNgqj+3KFGvGoWfKxpWYsz4
         WE3XAHwfY7Y7j0j7EIxrPARKU0cDxpG05RRYnOvhnFTRcw5namZCQne0R+YVT0f7f3Sb
         Xy8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736014415; x=1736619215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IC3C3Jj0ECPtMGXUDy4JdjvWVRz6QWTlZAY+EqQiUks=;
        b=fOb0GD9+d3rtB8eCehltZO0Z3TAr8LoOnj4HI/tClqIRNjpoL0mF4VVE53t6XBxIKR
         WemC7oqYgGXW0n8K+3e64hG/gBzMxRt5vmHQ++7gDynh65LpSSXPQpUQ653Eyyfj4Yym
         cFlqg1IHHcATaBWPvRLZed92Ga5d1MYyiYtGbqZd0/c1vmSVRgNJqUrg4QnKoKoMyLyq
         a1MdFsraRotyFtJDfwHLS+PbXhUskxJ07MFiYZ8NCGb+HfDGjQvogfKt9e+gIPgxprbv
         AdRDyF/2cUd2NoGuXJwTgP52X4vULIHlGJby5ZssW0Xxlc4DkeuNlgtjHdT/eYoHkrlo
         H1kA==
X-Forwarded-Encrypted: i=1; AJvYcCVEsVn8fqhgCGbEoZj/g3Pv1PWps7nOps+SpkYAyBlxAuCoFU3Lji5RdhV1LYHnZFz1Pxmwikk4XqBNG5qQ4Yc=@lists.infradead.org, AJvYcCXmEo07pmO2aDPEl1RnqD+RtrAYGQ7sVwrCcTqtgFnZcfWD25bGHBndbrTl0moP5JQDVyi1Lr8Uody5cJ90wEQu@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3zab9sjJfzFx6HpnRs+K+6gtSB6jkqbyKQ7QvhV4d5NIjIF/m
	aPuNi8p6FPz12eAZBbi5KgZt2XHU5twEOGkaBG1G47HJC4F8yUayUh0LQA==
X-Gm-Gg: ASbGncsG3hLa2xQlPzdnxSKx1GqDSVLMhf8L6nPPNycwvIgLog3nMxpm4Pwg08M5RzJ
	+Chmb1VMg6xiMG9ihBinqOHMfeaDy8WkXlyGLYx4n4OnWAdcR2XB5O2oXv5WUjOJbaTTqCyp+Mr
	+Kf1WVQLtkp4RFNEf01nKMOEdcCNB+kyPqKvGz7Wy7Xh07kx15oxMNhFMbfJiJjyUP/Z2YN03x6
	EbkMtYXhu3dPUnHstJKhmFGuHCgho0cXe0my/EOE3Ffjus9kXczw5X+tcyF6hgyIR59PZtIS32I
	2Oeoe2DPIiDVpzYwFVjbua4WYKM/XFaqNy6eeajw2w==
X-Google-Smtp-Source: AGHT+IEVj8J7H0x2CN9xCT2uuvbsbjXurGVCUw1JaW7uQYexZR/wM6uGfcvvWBNsskg0jDWDee4VCQ==
X-Received: by 2002:a05:6000:1785:b0:386:930:fad4 with SMTP id ffacd0b85a97d-38a221fab43mr45454220f8f.19.1736014415317;
        Sat, 04 Jan 2025 10:13:35 -0800 (PST)
Received: from localhost.localdomain (host-95-246-253-26.retail.telecomitalia.it. [95.246.253.26])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4366128a3c9sm520167595e9.40.2025.01.04.10.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 10:13:34 -0800 (PST)
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
Subject: [PATCH v8 1/2] pmdomain: airoha: Add Airoha CPU PM Domain support
Date: Sat,  4 Jan 2025 19:12:37 +0100
Message-ID: <20250104181305.28185-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_101337_394445_B1365E24 
X-CRM114-Status: GOOD (  23.73  )
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
Changes v8:
- Add this patch
- Use SMC invoke instead of 1.2

 drivers/pmdomain/mediatek/Kconfig             |  11 ++
 drivers/pmdomain/mediatek/Makefile            |   1 +
 .../pmdomain/mediatek/airoha-cpu-pmdomain.c   | 145 ++++++++++++++++++
 3 files changed, 157 insertions(+)
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
index 000000000000..a57855459b64
--- /dev/null
+++ b/drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c
@@ -0,0 +1,145 @@
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
+	struct clk_init_data init = { };
+	struct generic_pm_domain *pd;
+	struct clk_hw *hw;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	/* Init and register a get-only clk for Cpufreq */
+	init.name = "cpu";
+	init.ops = &airoha_cpu_pmdomain_clk_ops;
+	/* Clock with no set_rate, can't cache */
+	init.flags = CLK_GET_RATE_NOCACHE;
+
+	hw = &priv->hw;
+	hw->init = &init;
+	ret = devm_clk_hw_register(dev, hw);
+	if (ret)
+		return ret;
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, hw);
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
+	.remove_new = airoha_cpu_pmdomain_remove,
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


