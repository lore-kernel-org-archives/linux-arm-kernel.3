Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE93606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 21:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ERNP9zL7;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lOvXCeB+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fFnPwskegPZzfHsLT5NNhjCL4eznWzxTpvnez9GW2eg=; b=ERNP9zL7vtqAM5
	kcuysxh/jrbVBKuMrHe/yhbejNa6Z0aD17SqiT/xLpkZpt6cVYUNWrNn5ZBXYgUSwhjORtEgX/8s/
	0AWxR8xsdvRyg8aQBfM9KRakaEk9aPdy/rudOrh3yLsxgdJipaIxzzDwXh0NZAuqCBwwOHbsf3kRS
	2w8+nkewQhrBsjl9nSHojdMfH5B2NFGXvga6a4UcE1Q33TWw/iE5lNkE1uWANEXZOdasrnjsMCjrd
	40V95nXXxM4CWDAk7TWoy3t2bcH2le64h84TBUB3c7KT1KXwwFK3gg+cNnim/KnhmYq/o/BzuWUyl
	SUuBqoCPskdh/IlMkEiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLSVp-00000003JyK-27u3;
	Mon, 26 Oct 2026 21:45:49 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLSVQ-00000003Jau-1NoO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 21:45:26 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso5692434eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 14:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793051124; x=1793655924; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fFnPwskegPZzfHsLT5NNhjCL4eznWzxTpvnez9GW2eg=;
        b=lOvXCeB+TTEgKeTXqodYCEAeNoZJV/Cpq9Zjmkaf0AlXT571zvIDqWam1mGjIXCQIk
         KGWsFcJjh6wHh3hDMr5halXc+GPyMlI650wBdDMaOKw2jigtS+Iue9LL78gPa8z1i8o5
         wOjksmgMgYY4RYG/O099KnCg2sOEN4vs/RKqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793051124; x=1793655924;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fFnPwskegPZzfHsLT5NNhjCL4eznWzxTpvnez9GW2eg=;
        b=gqREVvpLld8xLR/1VTRBeu9Go7dHqZFpiXkcZ2MiqLNjCzlEfQcRTDok/hOHjDlHvR
         +F2Kxur6mRI3LhvZrudcokUgDKbb45icxkWkWlyJgpexqhmoOSutyWZKF7mxtbDjbXKE
         rAWFnwCPp78zKt90sEL2Em7yDV0ZZXiypjHNHgpAexJmVRPzfPAPrhV9qMPRj6y253Qt
         H9PiPrg9WdEkOxWeosbGFgid39fOIq63RQe0ZJBkeVpRY1GCV73T1aushx/TojvArUHA
         M1+LZT3evpTh9fgLc8aJbPgockQNdHQHncmcGdrCQ8zS0Z4Ps4mUkh40QBTEkdhndOz/
         s1uA==
X-Forwarded-Encrypted: i=1; AKwUvBxPNQ8rvjSTGKCPKil7UJ5HCkPEADD3IS9dOmwlVLI7mBncMpf0fY8ukr2N2IA5GTvdI4rSMc7aOmSWVGGG+pg7@lists.infradead.org
X-Gm-Message-State: AFq9FYLeIWYtNqCx6FUtwtZqjJhnzVmK70ER6h7WLK2hY6ToTiCAVlb4
	nIDbAzFXH19NpOGfOIP6+U3XE4wJ8vCgaI58vusDPkEJX7KYYfyRtkyOWsfWPVu4MQ==
X-Gm-Gg: AYBFou0gX4rg2I/iVNhyUShXagdbohgKhcHFkpRcyGGntnaYmi15dLRSEltNw4rMXRF
	IciLmLZaZNVt+vjWpfk4oP9dn2UdlIkfO7UcmUbsIdlYhMFy/aAeKf9KEcmScWw7/wghjmsTo04
	E9fUPHIV48Kb6PLdVsEyBpFjdic9njOUm7o7B8wb/C7LeCfnI8UetxJR+RJ9XP9xj7CbjCn3tvh
	X4o0y5t8P5c1+zj8pJcnFT9TiM6rV2g2hrjCGEevhhfEntl3xf4Ndt1LfQuEAjH+q14pSf5S+zu
	B8/OHBDG+O44fgqYf6bzVw7G9raP65hE4SElPv9h6t+lKJA+CvldeSncIoiH4dB4XHINHvaZDjF
	4Hr+sdga6CI1LGowkFz9uoNw9ebissLiHUZ26d1JZ+ZdGb+ZzHxgwCAK8FxKN/v+KTr9tXDnOA6
	69cSKI5R2y/lmSHHYLDZhCMI56BQGE74nj96sKaCDrC762Qq+r5j1AFAJPHdAcMZGFwEAZf1CpK
	dN1UeEstumqWSuTkUgedLhyqDrwGT+pH6AsWbQ3Yg3gGVNPTCLKqO4Ai3pAMm8rAucSBh3sDARD
	COZ5Frh+nf38uhqpjoY=
X-Received: by 2002:a05:7301:d80f:10b0:369:f7d2:d7b4 with SMTP id 5a478bee46e88-369f7d2eed8mr7550254eec.26.1793051123451;
        Mon, 26 Oct 2026 14:45:23 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:79c5:9cd3:db14:7468])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-369ff5a4d68sm13241766eec.14.2026.10.26.14.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:45:22 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Jakub=20G=C5=82owacki?= <jglow@google.com>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 7/9] irqchip/google-cpm: Add CPM IRQ driver
Date: Mon, 26 Oct 2026 14:43:45 -0700
Message-ID: <20261026144346.7.I41e14e9460b3add41e69dac97abf57a741e9c4c5@changeid>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261026214359.3122870-1-briannorris@chromium.org>
References: <20261026214359.3122870-1-briannorris@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_144524_386459_B6DBECF8 
X-CRM114-Status: GOOD (  25.35  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Central Power Manager (CPM) on Google Tensor SoCs can signal
events/interrupts over its mailbox communication protocol. Today, the
downstream driver for these chips only supports interrupt notification,
although the CPM firmware may also have mask/unmask support (not
currently used) that could be added later if needed.

In practice, this driver is used for RTC alarms and for events driven by
the Always-on Compute (AoC) subsystem.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/irqchip/Kconfig          |  10 +++
 drivers/irqchip/Makefile         |   1 +
 drivers/irqchip/irq-google-cpm.c | 123 +++++++++++++++++++++++++++++++
 3 files changed, 134 insertions(+)
 create mode 100644 drivers/irqchip/irq-google-cpm.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index ca915fca0ef5..47f9739b1d74 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -556,6 +556,16 @@ config CSKY_APB_INTC
 	  by C-SKY single core SOC system. It uses mmio map apb-bus to visit
 	  the controller's register.
 
+config GOOGLE_CPM_IRQ
+	tristate "Google Tensor CPM interrupt controller"
+	depends on GOOGLE_CPM_MBA
+	depends on ARCH_GOOGLE || COMPILE_TEST
+	select IRQ_DOMAIN
+	help
+	  Support for the Central Power Manager (CPM) interrupt controller
+	  found on Google Tensor SoCs. This controller routes interrupts from
+	  the CPM to the Application Processor.
+
 config IMX_IRQSTEER
 	bool "i.MX IRQSTEER support"
 	depends on ARCH_MXC || ARCH_S32 || COMPILE_TEST
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 16a5fd126c9a..ca10888687fd 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -101,6 +101,7 @@ obj-$(CONFIG_QCOM_PDC)			+= qcom-pdc.o
 obj-$(CONFIG_QCOM_MPM)			+= irq-qcom-mpm.o
 obj-$(CONFIG_CSKY_MPINTC)		+= irq-csky-mpintc.o
 obj-$(CONFIG_CSKY_APB_INTC)		+= irq-csky-apb-intc.o
+obj-$(CONFIG_GOOGLE_CPM_IRQ)		+= irq-google-cpm.o
 obj-$(CONFIG_RISCV_INTC)		+= irq-riscv-intc.o
 obj-$(CONFIG_RISCV_APLIC)		+= irq-riscv-aplic-main.o irq-riscv-aplic-direct.o
 obj-$(CONFIG_RISCV_APLIC_MSI)		+= irq-riscv-aplic-msi.o
diff --git a/drivers/irqchip/irq-google-cpm.c b/drivers/irqchip/irq-google-cpm.c
new file mode 100644
index 000000000000..a235cc1cfe7c
--- /dev/null
+++ b/drivers/irqchip/irq-google-cpm.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Google CPM IRQ chip driver
+ *
+ * Copyright 2023-2026 Google LLC
+ */
+#include <linux/auxiliary_bus.h>
+#include <linux/device.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+#include <linux/module.h>
+#include <soc/google/goog_cpm_service_ids.h>
+#include <soc/google/google-cpm-mba.h>
+
+#define CPM_IRQ_COUNT				512
+
+struct cpm_irq_info {
+	struct device		*dev;
+	struct irq_domain	*domain;
+};
+
+static void cpm_irq_process_irq_status(struct cpm_irq_info *info, u32 irq_number)
+{
+	int ret;
+
+	ret = generic_handle_domain_irq_safe(info->domain, irq_number);
+	if (ret)
+		dev_err(info->dev, "Error handling IRQ %u, error code %d\n", irq_number, ret);
+}
+
+static void cpm_irq_rx_callback(u32 context, const struct cpm_payload *msg, void *priv)
+{
+	struct cpm_irq_info *info = priv;
+	u32 irq_number = msg->payload[0];
+
+	cpm_irq_process_irq_status(info, irq_number);
+}
+
+static void cpm_irq_domain_remove_action(void *data)
+{
+	struct irq_domain *domain = data;
+	unsigned int hwirq;
+
+	for (hwirq = 0; hwirq < CPM_IRQ_COUNT; hwirq++)
+		irq_dispose_mapping(irq_find_mapping(domain, hwirq));
+
+	irq_domain_remove(domain);
+}
+
+static int cpm_irq_domain_map(struct irq_domain *d, unsigned int virq,
+			      irq_hw_number_t hwirq)
+{
+	struct cpm_irq_info *info = d->host_data;
+
+	if (hwirq >= CPM_IRQ_COUNT)
+		return -EINVAL;
+
+	irq_set_chip_data(virq, info);
+	irq_set_chip_and_handler(virq, &dummy_irq_chip, handle_simple_irq);
+
+	dev_dbg(info->dev, "Mapped hwirq %lu to virq %u\n", hwirq, virq);
+
+	return 0;
+}
+
+static const struct irq_domain_ops cpm_irq_domain_ops = {
+	.map = cpm_irq_domain_map,
+	.xlate = irq_domain_xlate_onecell,
+};
+
+static int cpm_irq_probe(struct auxiliary_device *adev, const struct auxiliary_device_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct cpm_client *client;
+	struct cpm_irq_info *info;
+	int ret;
+
+	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	info->dev = dev;
+	auxiliary_set_drvdata(adev, info);
+
+	info->domain = irq_domain_create_tree(dev_fwnode(dev), &cpm_irq_domain_ops, info);
+	if (!info->domain) {
+		dev_err(dev, "Unable to add irq domain\n");
+		return -ENODEV;
+	}
+
+	ret = devm_add_action_or_reset(dev, cpm_irq_domain_remove_action, info->domain);
+	if (ret) {
+		dev_err(dev, "Failed to add irq domain removal action\n");
+		return ret;
+	}
+
+	client = devm_cpm_request_client(dev, CPM_AP_NS_IRQ_SERVICE,
+					 cpm_irq_rx_callback, info);
+	if (IS_ERR(client))
+		return dev_err_probe(dev, PTR_ERR(client),
+				     "Failed to request cpm client\n");
+
+	return 0;
+}
+
+static const struct auxiliary_device_id cpm_irq_id_table[] = {
+	{ .name = "google_cpm_mba.irq" },
+	{ },
+};
+MODULE_DEVICE_TABLE(auxiliary, cpm_irq_id_table);
+
+static struct auxiliary_driver cpm_irq_driver = {
+	.probe = cpm_irq_probe,
+	.name = "cpm-irq-chip",
+	.id_table = cpm_irq_id_table,
+};
+
+module_auxiliary_driver(cpm_irq_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Google CPM IRQ chip driver");
+MODULE_AUTHOR("Jim Wylder <jwylder@google.com>");
-- 
2.56.0.307.g5fe7bd680c-goog


