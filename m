Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C435606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kK0MzsZP;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=t1XI4mN0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hCbh9ZQo8dvq5YI5WI53zqaGBnm8v4KkmJZCW4dz3rM=; b=kK0MzsZP6uh+y4Nn7Ch77/uBTL
	DNJgv66o3+4fL0Mbg0iXfLg60z7dCBZQkb4AMhtyCi/XbDnEM/bGUD9Cb7meC14yUulGF9zloVIdV
	p2dGr8JaLnkU2ime3vThC8SvLF83kQbZEcBD+adT7EdJClggNhwMThTI2ycLOhb7WI0Qt9rU2LNgv
	sfNl5r8jjy4i9CJ7oj+xtvde+f5cHD5P8tP+HCUrqXxJ7k8UG46DMNs6/vUpBw+r9LUq0qP509TSZ
	GYllip+AfFjIdHDSbDcPRjjf/AwNn9hrmXLUWWZFAFpc4hw8Tsti6HWuue/7GX+fZEOfSgAPtGPM/
	PAZjOdBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoH9-0000000FzF3-0V7h;
	Mon, 02 Nov 2026 09:24:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoH7-0000000FzEF-1UYc;
	Mon, 02 Nov 2026 09:24:22 +0000
X-UUID: 2cfdd15ed69f11f1acbe4559397dec65-20261102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=hCbh9ZQo8dvq5YI5WI53zqaGBnm8v4KkmJZCW4dz3rM=;
	b=t1XI4mN0It8CMGxSndVJgzbG19aFfJbBQ7vcsm8FuakNWGwgCysvkeTF2hOdpaBgKWw8ZJtF+TCvlXDnT3fjP7Q7xm6QlllxDXoRlxHVx4OvK8sH/Nv1HVxck4O82YeCLQS9EuXNXBfqlN1q4lhdGyAMBOZuxS8kbLa2EKcoZms=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:8e7b44a1-7214-49e8-86a8-3ffb7b6da35e,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:dbefa340-45ea-40f0-99fe-3ce442058644,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2cfdd15ed69f11f1acbe4559397dec65-20261102
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <santino.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1882060264; Mon, 02 Nov 2026 02:24:16 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 2 Nov 2026 17:24:14 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 2 Nov 2026 17:24:14 +0800
From: santino.wang <santino.wang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<light.chen@mediatek.com>, <Fred-WY.Chen@mediatek.com>,
	<arnab.layek@mediatek.com>, Santino Wang <santino.wang@mediatek.com>
Subject: [RFC PATCH 01/11] soc: mediatek: dram-ecc: add the DRAM ECC driver skeleton
Date: Mon, 2 Nov 2026 17:23:23 +0800
Message-ID: <20261102092334.138759-2-santino.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261102092334.138759-1-santino.wang@mediatek.com>
References: <20261102092334.138759-1-santino.wang@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_012421_404579_D6D14E53 
X-CRM114-Status: GOOD (  23.98  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Santino Wang <santino.wang@mediatek.com>

On the MediaTek mt8992 SoC the secure firmware (ATF) owns the DRAM
controller ECC interrupts and reports each corrected (CE) or
uncorrectable (UCE) error to the OS as an ACPI GHES record. The
following patches add the driver that consumes those records.

Add only the module skeleton here: the Kconfig entry, the Makefiles, a
class device that the later patches attach their sysfs attributes to,
and the MAINTAINERS entry.

Signed-off-by: Santino Wang <santino.wang@mediatek.com>
---
 MAINTAINERS                                   |  9 ++++
 drivers/soc/mediatek/Kconfig                  |  2 +
 drivers/soc/mediatek/Makefile                 |  1 +
 drivers/soc/mediatek/dram-ecc/Kconfig         | 16 ++++++
 drivers/soc/mediatek/dram-ecc/Makefile        |  3 ++
 drivers/soc/mediatek/dram-ecc/core/Makefile   |  6 +++
 drivers/soc/mediatek/dram-ecc/core/main.c     | 53 +++++++++++++++++++
 .../soc/mediatek/dram-ecc/core/mtk_dram_ecc.h | 24 +++++++++
 8 files changed, 114 insertions(+)
 create mode 100644 drivers/soc/mediatek/dram-ecc/Kconfig
 create mode 100644 drivers/soc/mediatek/dram-ecc/Makefile
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/Makefile
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/main.c
 create mode 100644 drivers/soc/mediatek/dram-ecc/core/mtk_dram_ecc.h

diff --git a/MAINTAINERS b/MAINTAINERS
index aaf2825ac945..e7d25be97f24 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17026,6 +17026,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/dma/mediatek,*
 F:	drivers/dma/mediatek/
 
+MEDIATEK DRAM ECC DRIVER
+M:	Santino Wang <santino.wang@mediatek.com>
+L:	linux-kernel@vger.kernel.org
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	drivers/soc/mediatek/dram-ecc/
+F:	include/uapi/linux/mtk_dram_ecc_netlink.h
+
 MEDIATEK ETHERNET DRIVER
 M:	Felix Fietkau <nbd@nbd.name>
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index d7293977f06e..91aed7d29be0 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -89,4 +89,6 @@ config MTK_SOCINFO
 	  information about the SoC to the userspace including the
 	  manufacturer name, marketing name and soc name.
 
+source "drivers/soc/mediatek/dram-ecc/Kconfig"
+
 endmenu
diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
index 0665573e3c4b..880342bed606 100644
--- a/drivers/soc/mediatek/Makefile
+++ b/drivers/soc/mediatek/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
 obj-$(CONFIG_MTK_MMSYS) += mtk-mutex.o
 obj-$(CONFIG_MTK_SVS) += mtk-svs.o
 obj-$(CONFIG_MTK_SOCINFO) += mtk-socinfo.o
+obj-y += dram-ecc/
diff --git a/drivers/soc/mediatek/dram-ecc/Kconfig b/drivers/soc/mediatek/dram-ecc/Kconfig
new file mode 100644
index 000000000000..c015c66635b2
--- /dev/null
+++ b/drivers/soc/mediatek/dram-ecc/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# MediaTek DRAM ECC error handling driver
+# See plat/mediatek/drivers/dram_ecc/ in ATF for the SMC handler side.
+#
+
+# core/ -> mtk_dram_ecc.ko
+config MTK_DRAM_ECC
+	tristate "MediaTek DRAM ECC Error Handling Driver"
+	depends on HAVE_ARM_SMCCC && ACPI_APEI_GHES
+	default m
+	help
+	  Driver for MediaTek DRAM ECC runtime error handling. It works
+	  with the secure firmware (ATF), which owns the DRAM controller
+	  ECC interrupts and reports each corrected or uncorrectable
+	  error to the OS as an ACPI GHES record.
diff --git a/drivers/soc/mediatek/dram-ecc/Makefile b/drivers/soc/mediatek/dram-ecc/Makefile
new file mode 100644
index 000000000000..977922150133
--- /dev/null
+++ b/drivers/soc/mediatek/dram-ecc/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_MTK_DRAM_ECC)              += core/
diff --git a/drivers/soc/mediatek/dram-ecc/core/Makefile b/drivers/soc/mediatek/dram-ecc/core/Makefile
new file mode 100644
index 000000000000..77751c836027
--- /dev/null
+++ b/drivers/soc/mediatek/dram-ecc/core/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_MTK_DRAM_ECC) += mtk_dram_ecc.o
+
+mtk_dram_ecc-y := \
+	main.o
diff --git a/drivers/soc/mediatek/dram-ecc/core/main.c b/drivers/soc/mediatek/dram-ecc/core/main.c
new file mode 100644
index 000000000000..5000d1f3c7e3
--- /dev/null
+++ b/drivers/soc/mediatek/dram-ecc/core/main.c
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ */
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/device/class.h>
+
+#include "mtk_dram_ecc.h"
+
+static struct class *mtk_dram_ecc_class;
+static struct device *mtk_dram_ecc_dev;
+
+struct mtk_dram_ecc_data mtk_ecc_data = {
+	.lb_threshold         = MTK_ECC_LB_THRESHOLD_DEFAULT,
+	.lb_decay_interval_sec = MTK_ECC_LB_DECAY_INTERVAL_DEFAULT,
+	.lb_max_tracked       = MTK_ECC_LB_MAX_TRACKED_DEFAULT,
+};
+
+static int __init mtk_dram_ecc_init(void)
+{
+	int ret;
+
+	mtk_dram_ecc_class = class_create("mtk-dram-ecc");
+	if (IS_ERR(mtk_dram_ecc_class))
+		return PTR_ERR(mtk_dram_ecc_class);
+
+	mtk_dram_ecc_dev = device_create(mtk_dram_ecc_class, NULL,
+					 MKDEV(0, 0), &mtk_ecc_data,
+					 "mtk-dram-ecc0");
+	if (IS_ERR(mtk_dram_ecc_dev)) {
+		ret = PTR_ERR(mtk_dram_ecc_dev);
+		goto err_class;
+	}
+
+	dev_info(mtk_dram_ecc_dev, "initialized\n");
+	return 0;
+
+err_class:
+	class_destroy(mtk_dram_ecc_class);
+	return ret;
+}
+
+static void __exit mtk_dram_ecc_exit(void)
+{
+	device_destroy(mtk_dram_ecc_class, MKDEV(0, 0));
+	class_destroy(mtk_dram_ecc_class);
+}
+
+module_init(mtk_dram_ecc_init);
+module_exit(mtk_dram_ecc_exit);
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MediaTek DRAM ECC Error Handling Driver");
diff --git a/drivers/soc/mediatek/dram-ecc/core/mtk_dram_ecc.h b/drivers/soc/mediatek/dram-ecc/core/mtk_dram_ecc.h
new file mode 100644
index 000000000000..456961818ccd
--- /dev/null
+++ b/drivers/soc/mediatek/dram-ecc/core/mtk_dram_ecc.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ */
+#ifndef _MTK_DRAM_ECC_H_
+#define _MTK_DRAM_ECC_H_
+
+#include <linux/types.h>
+#include <linux/device.h>
+
+struct mtk_dram_ecc_data {
+	/* [leaky_bucket] */
+	u32 lb_threshold;
+	u32 lb_decay_interval_sec;
+	u32 lb_max_tracked;
+
+#define MTK_ECC_LB_THRESHOLD_DEFAULT      100
+#define MTK_ECC_LB_DECAY_INTERVAL_DEFAULT 3600
+#define MTK_ECC_LB_MAX_TRACKED_DEFAULT    16
+};
+
+extern struct mtk_dram_ecc_data mtk_ecc_data;
+
+#endif /* _MTK_DRAM_ECC_H_ */
-- 
2.45.2


