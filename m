Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687D0C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 22:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=369dAJGZKeB0JOjSvrMu1FUQdCgqdozrza7riiyrYK0=; b=nzMH5Fh60aAOWlruP393P+iYZ3
	MK65duzDTDsC7F91ERSWyo0NvmYhTA0TbKW6o5rqY0znBHuaDX0nE6MAWZKyUYYnSycUtG+PKkydG
	2d3GzWfyIGVGcxApD7iowZRms4LDkPShHSXULab8c22zG4tgbfyGjuhKPfTfq13QlEj9QJKlxJCVr
	U+BVML3HNfb2ksHAtl0IHlHhHFnIDwsShMlI4kY84RuknLYOlwRAs4qKofcI7xkS8rR8xNWfh71Lx
	4dvRzvugwicwgMDsTWtv1enSllBR7worbLKXtUYUFRgwd/isa8QDLv8xLDKBDYuicmJDDUZFKQZzQ
	3pkpBBeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thFfu-0000000FgnK-1bEQ;
	Sun, 09 Feb 2025 22:21:14 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thFSN-0000000Feid-0SRY;
	Sun, 09 Feb 2025 22:07:16 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-38dcf8009f0so1010701f8f.2;
        Sun, 09 Feb 2025 14:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739138833; x=1739743633; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=369dAJGZKeB0JOjSvrMu1FUQdCgqdozrza7riiyrYK0=;
        b=hGCVv1Y4uUnlr/ge7mD7v8hEcCim3hSaBsmRVGM3U7JsntOF4f5aT8QBjZen+z7Q8I
         /5jWNiEUeVZ+9WuWgd7veH+TEFd1kLzQeM17sSfEuxQBckwSMTljX7IVxezSZUboPJHc
         MrtFBSGGxy2QFE3LLHQSlVpSQPFGMvNM/6sYjmDIAHQ1PFjQeLCuf1wMaeNqJPbKEobM
         xdvkKzWGrr8kHh39qLlQnq6PvYgRUrokOoW4xHydmn7+1C+iwElPxxy4A/gByDs8ueED
         G6EsnGu4iQM9f2c64NJOGdY9XVKiaQSidQcjBPn5omWKtSbZG4kSOkv/NrxCsnAYnSpU
         RVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739138833; x=1739743633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=369dAJGZKeB0JOjSvrMu1FUQdCgqdozrza7riiyrYK0=;
        b=AMBGfOfzlP4L5SvQVvgIgDjmD77j0mKueU4OLXFccoE2fECMpxJNBjq9puxjX37ZBw
         XPiINUH2g7sWa5143VoP0nS/YboE+Y1yv0Wa76L3p6YryaKkwcsJ3GtflyndWQUKczP4
         NtSHL9fibzzA9PUL9MMJt4DUFnKvGt59pYdLahP6lqYkPHbNE+v2EfPDkUKyVF9buSQl
         WpI161EGpXDzxwanIod7jWXxlLZ1Fc96ZtMiVKhHzdwPn3N/YVLAy7Szu4ollqCZNog9
         L9PefG5zD6Q5H48onwI2p+7W86LAii6kTcAzhOqLajCrKh7VS8YVy2K19grj4NS5gKY7
         GSIw==
X-Forwarded-Encrypted: i=1; AJvYcCVcVdbIp0A5v6NmgoInOFKScNe80Znc8suHGxuyKizGbauzQB0LUAm0zUxXWsBUzXokdQqcJgJKFBTXXEE=@lists.infradead.org, AJvYcCWKjNZ8ynzAYXPBVJVoJRlI1iuy5FKfGc4WYu8tbaJSTg3HYbGb/tl3svohikcqpxouRX6Vt4QgLfQFaawHQ3TW@lists.infradead.org
X-Gm-Message-State: AOJu0YyKdjDxNCGxr6S0k3sXMp+3VUpjK9ed1xh+tDkJgPixrD/o/0zs
	iGXLpUWncc50CIN9PWQdBYCAPj0b9nRbLL13OkYQOmwT969jnx9xWoiaymDG
X-Gm-Gg: ASbGncv43A/xhGvkpZHJCyUKDhFNRAWx4/nsNt7MtFpB/DpMQdWJvRg8h6n4AdE767f
	ui1xHof8Vu2+n7RN0+RP3BoLmuuLHHhU49AEucQXJIYjPHLqJWSVMavRCL7ybM3eVly1ugjIghx
	vxLJyLep8SMtaAkJMrDAQzaTxd14LwTxXABmgpZrE2PdQIzeP0gIOmrmvIQE5BvM6ZW1gC94nAH
	aTEko+0gf5U2Ph+vkfLONGAPNFq3Msv7nqawC3wKH1gKbST90UbdbO5F9Bo8SRafWZYtPshTbV1
	vTu0yp8O5NXyM32lp+4mQK4pddD4
X-Google-Smtp-Source: AGHT+IGQNeDm9SkXrpQUSzcKpyxZS28meHGL8UbkTV9jZIpjqhrqbWvmN7mXz5mtgw2H/4aI14AXXQ==
X-Received: by 2002:a05:6000:4028:b0:38d:d767:364 with SMTP id ffacd0b85a97d-38dd7670e6fmr3783272f8f.13.1739138833224;
        Sun, 09 Feb 2025 14:07:13 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbf2ed900sm10386544f8f.53.2025.02.09.14.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 14:07:12 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	Sebastian Reichel <sre@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH 09/10] power: reset: cv18xx: New driver
Date: Sun,  9 Feb 2025 23:06:34 +0100
Message-ID: <20250209220646.1090868-10-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_140715_151498_AF4C8DF2 
X-CRM114-Status: GOOD (  20.89  )
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

Add new driver to support cold and warm reset on Cvitek CV18xx and Sophgo
SG2000 SoCs.

Link: https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm-v1.01/sg2000_trm_en.pdf
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 MAINTAINERS                        |  1 +
 drivers/power/reset/Kconfig        | 12 ++++
 drivers/power/reset/Makefile       |  1 +
 drivers/power/reset/cv18xx-reset.c | 89 ++++++++++++++++++++++++++++++
 4 files changed, 103 insertions(+)
 create mode 100644 drivers/power/reset/cv18xx-reset.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e4f5d8f68581..b7fec02f7673 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22147,6 +22147,7 @@ M:	Chen Wang <unicorn_wang@outlook.com>
 M:	Inochi Amaoto <inochiama@outlook.com>
 T:	git https://github.com/sophgo/linux.git
 S:	Maintained
+F:	drivers/power/reset/cv18xx-reset.c
 N:	sophgo
 K:	sophgo
 
diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index 60bf0ca64cf3..d41ed3c2a30d 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -75,6 +75,18 @@ config POWER_RESET_BRCMSTB
 	  Say Y here if you have a Broadcom STB board and you wish
 	  to have restart support.
 
+config POWER_RESET_CV18XX
+	bool "Cvitek CV18XX/Sophgo SG2000 reset driver"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	depends on MFD_SYSCON
+	default ARCH_SOPHGO
+	help
+	  This driver provides restart support for Cvitek CV18xx and
+	  Sophgo SG2000 SoCs.
+
+	  Say Y here if you have a Cvitek CV18xx or Sophgo SG2000 SoC and
+	  you wish to have restart support.
+
 config POWER_RESET_EP93XX
 	bool "Cirrus EP93XX reset driver" if COMPILE_TEST
 	depends on MFD_SYSCON
diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
index 10782d32e1da..ce24e74e0477 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_POWER_RESET_ATC260X) += atc260x-poweroff.o
 obj-$(CONFIG_POWER_RESET_AXXIA) += axxia-reset.o
 obj-$(CONFIG_POWER_RESET_BRCMKONA) += brcm-kona-reset.o
 obj-$(CONFIG_POWER_RESET_BRCMSTB) += brcmstb-reboot.o
+obj-$(CONFIG_POWER_RESET_CV18XX) += cv18xx-reset.o
 obj-$(CONFIG_POWER_RESET_EP93XX) += ep93xx-restart.o
 obj-$(CONFIG_POWER_RESET_GEMINI_POWEROFF) += gemini-poweroff.o
 obj-$(CONFIG_POWER_RESET_GPIO) += gpio-poweroff.o
diff --git a/drivers/power/reset/cv18xx-reset.c b/drivers/power/reset/cv18xx-reset.c
new file mode 100644
index 000000000000..bc1797e7d3f5
--- /dev/null
+++ b/drivers/power/reset/cv18xx-reset.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reboot.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
+
+/* RTCSYS_CTRL registers */
+#define RTC_CTRL_UNLOCKKEY		0x04
+#define RTC_CTRL0			0x08
+#define  REQ_PWR_CYC			BIT(3)
+#define  REQ_WARM_RST			BIT(4)
+
+/* RTCSYS_CORE registers */
+#define RTC_EN_PWR_CYC_REQ		0xC8
+#define RTC_EN_WARM_RST_REQ		0xCC
+
+static struct regmap *rtcsys_ctrl_regs;
+static struct regmap *rtcsys_core_regs;
+
+static int cv18xx_restart_handler(struct sys_off_data *data)
+{
+	u32 reg_en = RTC_EN_WARM_RST_REQ;
+	u32 request = 0xFFFF0800;
+
+	if (data->mode == REBOOT_COLD) {
+		reg_en = RTC_EN_PWR_CYC_REQ;
+		request |= REQ_PWR_CYC;
+	} else {
+		request |= REQ_WARM_RST;
+	}
+
+	/* Enable reset request */
+	regmap_write(rtcsys_core_regs, reg_en, 1);
+	/* Enable CTRL0 register access */
+	regmap_write(rtcsys_ctrl_regs, RTC_CTRL_UNLOCKKEY, 0xAB18);
+	/* Request reset */
+	regmap_write(rtcsys_ctrl_regs, RTC_CTRL0, request);
+
+	return NOTIFY_DONE;
+}
+
+static int cv18xx_reset_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	int ret;
+
+	if (!np)
+		return -ENODEV;
+
+	rtcsys_ctrl_regs = syscon_regmap_lookup_by_phandle(np, "sophgo,rtcsys-ctrl");
+	if (IS_ERR(rtcsys_ctrl_regs))
+		return dev_err_probe(dev, PTR_ERR(rtcsys_ctrl_regs),
+				     "sophgo,rtcsys-ctrl lookup failed\n");
+
+	rtcsys_core_regs = syscon_regmap_lookup_by_phandle(np, "sophgo,rtcsys-core");
+	if (IS_ERR(rtcsys_core_regs))
+		return dev_err_probe(dev, PTR_ERR(rtcsys_core_regs),
+				     "sophgo,rtcsys-core lookup failed\n");
+
+	ret = devm_register_restart_handler(&pdev->dev, cv18xx_restart_handler, NULL);
+	if (ret)
+		dev_err(&pdev->dev, "Cannot register restart handler (%pe)\n", ERR_PTR(ret));
+	return ret;
+}
+
+static const struct of_device_id cv18xx_reset_of_match[] = {
+	{ .compatible = "sophgo,cv1800-reset" },
+	{}
+};
+MODULE_DEVICE_TABLE(platform, cv18xx_reset_of_match);
+
+static struct platform_driver cv18xx_reset_driver = {
+	.probe = cv18xx_reset_probe,
+	.driver = {
+		.name = "cv18xx-reset",
+		.of_match_table = cv18xx_reset_of_match,
+	},
+};
+module_platform_driver(cv18xx_reset_driver);
+
+MODULE_AUTHOR("Alexander Sverdlin <alexander.sverdlin@gmail.com>");
+MODULE_DESCRIPTION("Cvitek CV18xx/Sophgo SG2000 Reset Driver");
+MODULE_ALIAS("platform:cv18xx-reset");
-- 
2.48.1


