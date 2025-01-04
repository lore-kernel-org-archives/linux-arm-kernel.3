Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983BCE77197
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 18:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xV+8RO/Ef30DT4vDUqGvKPdTER63OAV9teSiIpFh5bo=; b=QGkqKiqbhCDo+Y304KgQh9sjo2
	BStQyuSYjQecTbxWJ1OzvxdVW3Go2VLmYh3tJqZ+nUN06h/vYJ16eWXjLelXafU52AERDIpU5KRCz
	aeQlnuGfc463SRcnQluYYzjfc0n5k2gxQzow5H4EDN5QCMVJSzE+xBFbtw1rEtrOvtFYYsYguOy14
	JMs9TAkeEBi0y9wMW7k8K+9QDlVbtTAI4ZYU4U9GwF/ni/mFQZqWbe8qRYrd62H1kPIql/tCY8yHi
	sqzcdXSGbYjeIkqWmspXF69YYogrbDBPUHYEZXCTWtvsS8En43dQ+89Z2UUVnKzvFVTN9Df1X3zl7
	KxIN0s0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU8gr-0000000FO2f-0Xov;
	Sat, 04 Jan 2025 18:16:01 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU8eY-0000000FNmr-3yQM;
	Sat, 04 Jan 2025 18:13:40 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-436341f575fso136047205e9.1;
        Sat, 04 Jan 2025 10:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736014417; x=1736619217; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xV+8RO/Ef30DT4vDUqGvKPdTER63OAV9teSiIpFh5bo=;
        b=iMr9DllurQNGe226U1P4im49yDn0nV2KcSagEAKfBtn6A6P9IqiIDOeaiS41D/A7BI
         R+tP1NzgprQzmvpOqGkuN8XcISMK8cbWz8feaWknGr9Z2/m+BpyW7MXA3FE/DzogBiMh
         QZ6AjrVGdCl1oyxltL5xxFN4Fm0ttPnnu9ndgPMEz2T+3b9paa8PqgWrTZ99vuLd7QhR
         iMdqrfuzHtWWjggNoSPUVwIfN7OLzGJVWA56J11EufdywbPqvqK7fPeEA8eUA/5cJDhO
         2/VH8TqS1x200z6J1/W7/SHLSYVNdxGWE6jJYm4ubAPkHQ9Sd0xAhg71Yl6LWqNwVhCc
         ayyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736014417; x=1736619217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xV+8RO/Ef30DT4vDUqGvKPdTER63OAV9teSiIpFh5bo=;
        b=H662TR51CR7jAIoGd15KALDM5efziglm7caQr+PXZTQJ4eU497+WUSmXlCVBP4KAH/
         pojuUrfO+LDaJzTWAlHHJTfMRs1p8YGGA/fLXgbXVC7DcOiHxE77lsySeTBf+WF0NBlv
         Kylk3ha5tBZrsnxUADdmsTXgdB2apWtxrgbzm4IJS/YSRd+8xsF7AJI+HFWaGBK3g+Bj
         DlrcmPkdRjj7zNuxRMTBoisHhHI3hFVIk4n2cnZ9bgHrGwOCZ+XPB6FAl7wjMA2H02n+
         w87IyLlqZBAtpqbv86hJb/nET/UWTuP8iuHvfzRbWPYeIKT42QlaDY2cN7xkxfddDGUH
         ZO3g==
X-Forwarded-Encrypted: i=1; AJvYcCU/OYelyVNMKSh/lBmjQeJEenzyOxaEdaFEdqL8uoPIcVUTb8pTYZQM0Snl3fOD4+T0esplATveLQxTEcTz3LA7@lists.infradead.org, AJvYcCXppEKDxF2g/iVbiVJkm5nSHg0cNYbnPE9BsB0FpVyzA4r0pF0GHFveLGIcloA4aSaGCf2OPAgjkMWBJihXD/Y=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2VQNav+L/ASd9bd3DnYHOAf0YVS/NG7RT8h1nxzChqHg8yLpX
	G1JkYAaHt8jqmFK5Uq/Blv8b2+6872AqjcLIGMKNlrgnP3Vm8ZPX
X-Gm-Gg: ASbGncvDog2pZjGd77lERozrgUkTvS7GuhcSDnrU23IjBa2FPjxKya3+INq+0UrK+Ts
	D2FeQ8E1YhWYFcj5ZUbrwYecMMnEqVfrm2N/xvBi4knBodZrCUOWCQS4FXjESAE0yW2giDblPrG
	XBt6wfHLCMzU80nkRJYPdl/9aIDSKbrR0DWZdsZt9dayDxscD4s0B4YvjjxNam8EBehsYtsR4N3
	54H5bqo9JwWEw9WvQwwOXqDnKseSSSYazO0SKymO40rjchI6jm8VqmUmKzQPzXWxaAAh71iAOHb
	qVi/Ze2aDilQQqY7gK1HuKya5lLjXDhCegjI7hVlAQ==
X-Google-Smtp-Source: AGHT+IHZ9RHFwy4NU/YhiX1jRd9CAQ4xsTogB3A40Eq9ggchtQQG0Ko4CuvvRbK9Fw1CF7r+Ai9xqA==
X-Received: by 2002:a05:6000:70a:b0:382:4ab4:b3e5 with SMTP id ffacd0b85a97d-38a2213e228mr47250390f8f.0.1736014416944;
        Sat, 04 Jan 2025 10:13:36 -0800 (PST)
Received: from localhost.localdomain (host-95-246-253-26.retail.telecomitalia.it. [95.246.253.26])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4366128a3c9sm520167595e9.40.2025.01.04.10.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 10:13:36 -0800 (PST)
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
Subject: [PATCH v8 2/2] cpufreq: airoha: Add EN7581 CPUFreq SMCCC driver
Date: Sat,  4 Jan 2025 19:12:38 +0100
Message-ID: <20250104181305.28185-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250104181305.28185-1-ansuelsmth@gmail.com>
References: <20250104181305.28185-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_101338_992020_7EFCCE23 
X-CRM114-Status: GOOD (  28.70  )
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

Add simple CPU Freq driver for Airoha EN7581 SoC that control CPU
frequency scaling with SMC APIs and register a generic "cpufreq-dt"
device.

All CPU share the same frequency and can't be controlled independently.
CPU frequency is controlled by the attached PM domain.

Add SoC compatible to cpufreq-dt-plat block list as a dedicated cpufreq
driver is needed with OPP v2 nodes declared in DTS.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v8:
- Split in dedicated PM domain driver
Changes v7:
- No changes
Changes v6:
- Improve Kconfig depends logic
- Select PM (PM_GENERIC_DOMAINS depends on it)
- Drop (int) cast for 
Changes v5:
- Rename cpu_pd to perf for power domain name
- Use remove instead of remove_new
Changes v4:
- Rework to clk-only + PM set_performance_state implementation
Changes v3:
- Adapt to new cpufreq-dt APIs
- Register cpufreq-dt instead of custom freq driver
Changes v2:
- Fix kernel bot error with missing slab.h and bitfield.h header
- Limit COMPILE_TEST to ARM64 due to smcc 1.2

 drivers/cpufreq/Kconfig.arm          |  10 ++
 drivers/cpufreq/Makefile             |   1 +
 drivers/cpufreq/airoha-cpufreq.c     | 166 +++++++++++++++++++++++++++
 drivers/cpufreq/cpufreq-dt-platdev.c |   2 +
 4 files changed, 179 insertions(+)
 create mode 100644 drivers/cpufreq/airoha-cpufreq.c

diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
index 5f7e13e60c80..8494faac58ae 100644
--- a/drivers/cpufreq/Kconfig.arm
+++ b/drivers/cpufreq/Kconfig.arm
@@ -15,6 +15,16 @@ config ARM_ALLWINNER_SUN50I_CPUFREQ_NVMEM
 	  To compile this driver as a module, choose M here: the
 	  module will be called sun50i-cpufreq-nvmem.
 
+config ARM_AIROHA_SOC_CPUFREQ
+	tristate "Airoha EN7581 SoC CPUFreq support"
+	depends on ARM64 && (ARCH_AIROHA || COMPILE_TEST)
+	select PM
+	select PM_OPP
+	select PM_GENERIC_DOMAINS
+	default ARCH_AIROHA
+	help
+	  This adds the CPUFreq driver for Airoha EN7581 SoCs.
+
 config ARM_APPLE_SOC_CPUFREQ
 	tristate "Apple Silicon SoC CPUFreq support"
 	depends on ARCH_APPLE || (COMPILE_TEST && 64BIT)
diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
index d35a28dd9463..890fff99f37d 100644
--- a/drivers/cpufreq/Makefile
+++ b/drivers/cpufreq/Makefile
@@ -53,6 +53,7 @@ obj-$(CONFIG_X86_AMD_FREQ_SENSITIVITY)	+= amd_freq_sensitivity.o
 
 ##################################################################################
 # ARM SoC drivers
+obj-$(CONFIG_ARM_AIROHA_SOC_CPUFREQ)	+= airoha-cpufreq.o
 obj-$(CONFIG_ARM_APPLE_SOC_CPUFREQ)	+= apple-soc-cpufreq.o
 obj-$(CONFIG_ARM_ARMADA_37XX_CPUFREQ)	+= armada-37xx-cpufreq.o
 obj-$(CONFIG_ARM_ARMADA_8K_CPUFREQ)	+= armada-8k-cpufreq.o
diff --git a/drivers/cpufreq/airoha-cpufreq.c b/drivers/cpufreq/airoha-cpufreq.c
new file mode 100644
index 000000000000..cca5183495cc
--- /dev/null
+++ b/drivers/cpufreq/airoha-cpufreq.c
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/bitfield.h>
+#include <linux/cpufreq.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+
+#include "cpufreq-dt.h"
+
+struct airoha_cpufreq_priv {
+	int opp_token;
+	struct device **virt_devs;
+	struct platform_device *cpufreq_dt;
+};
+
+static struct platform_device *cpufreq_pdev;
+
+/* NOP function to disable OPP from setting clock */
+static int airoha_cpufreq_config_clks_nop(struct device *dev,
+					  struct opp_table *opp_table,
+					  struct dev_pm_opp *old_opp,
+					  struct dev_pm_opp *opp,
+					  void *data, bool scaling_down)
+{
+	return 0;
+}
+
+static const char * const airoha_cpufreq_clk_names[] = { "cpu", NULL };
+static const char * const airoha_cpufreq_genpd_names[] = { "cpu_pd", NULL };
+
+static int airoha_cpufreq_probe(struct platform_device *pdev)
+{
+	struct dev_pm_opp_config config = { };
+	struct platform_device *cpufreq_dt;
+	struct airoha_cpufreq_priv *priv;
+	struct device *dev = &pdev->dev;
+	struct device **virt_devs = NULL;
+	struct device *cpu_dev;
+	int ret;
+
+	/* CPUs refer to the same OPP table */
+	cpu_dev = get_cpu_device(0);
+	if (!cpu_dev)
+		return -ENODEV;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	config.clk_names = airoha_cpufreq_clk_names;
+	config.config_clks = airoha_cpufreq_config_clks_nop;
+	config.genpd_names = airoha_cpufreq_genpd_names;
+	config.virt_devs = &virt_devs;
+
+	priv->opp_token = dev_pm_opp_set_config(cpu_dev, &config);
+	if (priv->opp_token < 0)
+		return dev_err_probe(dev, priv->opp_token, "Failed to set OPP config\n");
+
+	/* Set Attached PM for OPP ACTIVE */
+	if (virt_devs) {
+		const char * const *name = airoha_cpufreq_genpd_names;
+		int i, j;
+
+		for (i = 0; *name; i++, name++) {
+			ret = pm_runtime_resume_and_get(virt_devs[i]);
+			if (ret) {
+				dev_err(cpu_dev, "failed to resume %s: %d\n",
+					*name, ret);
+
+				/* Rollback previous PM runtime calls */
+				name = config.genpd_names;
+				for (j = 0; *name && j < i; j++, name++)
+					pm_runtime_put(virt_devs[j]);
+
+				goto err_register_cpufreq;
+			}
+		}
+		priv->virt_devs = virt_devs;
+	}
+
+	cpufreq_dt = platform_device_register_simple("cpufreq-dt", -1, NULL, 0);
+	ret = PTR_ERR_OR_ZERO(cpufreq_dt);
+	if (ret) {
+		dev_err(dev, "failed to create cpufreq-dt device: %d\n", ret);
+		goto err_register_cpufreq;
+	}
+
+	priv->cpufreq_dt = cpufreq_dt;
+	platform_set_drvdata(pdev, priv);
+
+	return 0;
+
+err_register_cpufreq:
+	dev_pm_opp_clear_config(priv->opp_token);
+
+	return ret;
+}
+
+static void airoha_cpufreq_remove(struct platform_device *pdev)
+{
+	struct airoha_cpufreq_priv *priv = platform_get_drvdata(pdev);
+	const char * const *name = airoha_cpufreq_genpd_names;
+	int i;
+
+	platform_device_unregister(priv->cpufreq_dt);
+
+	dev_pm_opp_clear_config(priv->opp_token);
+
+	for (i = 0; *name; i++, name++)
+		pm_runtime_put(priv->virt_devs[i]);
+}
+
+static struct platform_driver airoha_cpufreq_driver = {
+	.probe = airoha_cpufreq_probe,
+	.remove_new = airoha_cpufreq_remove,
+	.driver = {
+		.name = "airoha-cpufreq",
+	},
+};
+
+static const struct of_device_id airoha_cpufreq_match_list[] __initconst = {
+	{ .compatible = "airoha,en7581" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, airoha_cpufreq_match_list);
+
+static int __init airoha_cpufreq_init(void)
+{
+	struct device_node *np = of_find_node_by_path("/");
+	const struct of_device_id *match;
+	int ret;
+
+	if (!np)
+		return -ENODEV;
+
+	match = of_match_node(airoha_cpufreq_match_list, np);
+	of_node_put(np);
+	if (!match)
+		return -ENODEV;
+
+	ret = platform_driver_register(&airoha_cpufreq_driver);
+	if (unlikely(ret < 0))
+		return ret;
+
+	cpufreq_pdev = platform_device_register_data(NULL, "airoha-cpufreq",
+						     -1, match, sizeof(*match));
+	ret = PTR_ERR_OR_ZERO(cpufreq_pdev);
+	if (ret)
+		platform_driver_unregister(&airoha_cpufreq_driver);
+
+	return ret;
+}
+module_init(airoha_cpufreq_init);
+
+static void __exit airoha_cpufreq_exit(void)
+{
+	platform_device_unregister(cpufreq_pdev);
+	platform_driver_unregister(&airoha_cpufreq_driver);
+}
+module_exit(airoha_cpufreq_exit);
+
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_DESCRIPTION("CPUfreq driver for Airoha SoCs");
+MODULE_LICENSE("GPL");
diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index 9c198bd4f7e9..2aa00769cf09 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -103,6 +103,8 @@ static const struct of_device_id allowlist[] __initconst = {
  * platforms using "operating-points-v2" property.
  */
 static const struct of_device_id blocklist[] __initconst = {
+	{ .compatible = "airoha,en7581", },
+
 	{ .compatible = "allwinner,sun50i-a100" },
 	{ .compatible = "allwinner,sun50i-h6", },
 	{ .compatible = "allwinner,sun50i-h616", },
-- 
2.45.2


