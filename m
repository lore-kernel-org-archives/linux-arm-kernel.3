Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45AE606A334
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 07:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4kH/sO64;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zel3JzDq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=d+cEXz8UxGPuqQ5Mf2QjoAOu8C3Tu/pSpc0uPcOqFz4=; b=4kH/sO6471gD1cmsq2Im3oxAep
	u//JNQZ0q5Tn+9fbbBH3S/IO0yp5w11D2vWGqAeW4w2I0IN1tlzg2IRAX0VFk9MKMuZ9dx85obSC2
	KIdDdDlL27K2PsfjM4scGpbvk1YPvzEKeRSP9IFndIxc65d9aPFXL+aa0eMTReMWIZPccU4xeyD8r
	Dq0TjQRL2qdaXY1fyxbkRcDWtIXUsKUaLt8c1FjzRGafBptI4e8zFm7Zpq9W/GKpOtM3VAzxpSm7r
	87okl/xUA7lxWVuW+TDtjZrxMGfIMqBigFAOLPu2qJms1Hah5QpzpfVmXCHLLsb3mdKNBTxIfm+jV
	MAKhCG/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsKr-0000000840V-37Rf;
	Thu, 05 Nov 2026 07:56:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsKp-000000083zW-42mZ;
	Thu, 05 Nov 2026 07:56:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D9AC4067D;
	Thu,  5 Nov 2026 07:56:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793865395;
	b=lWNi/GZ7JyG+pVT7ur6gIYEtmT7jw/W8qxZ+YgNXfGf8xwHZI+lqvdHevQGWTwKnHpEx
	 0xKyw/BKTBoazgTAtEQqPfZfwGAKdEbQZlZGTbzEeERyvGbewK4l/pBEmRx+Uheen2ZhL
	 AvEnQ28PbrWdWw1iz2rtTFdZn43MCyv90oMtpyrtIFtEZglrgl7E1yKRatoRQYUOyp6+n
	 IxRClyIgDzI2/xak6yPCIsW5MeLJBZkPananSE6+GXH5b9cWC7jFqvdpDLQzLKpGb6LJZ
	 JFtL4RqadQx3zWIcpdMcidjhGgRl31RcDzH80bcokRA9W+6lKXdc58CxidOph8HOTzQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793865395;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=d+cEXz8UxGPuqQ5Mf2QjoAOu8C3Tu/pSpc0uPcOqFz4=;
	b=oVBdV2FTB8MVjXelJ9tF0gFDz/oKp5R7uvtpETTEv8ILPKkPsVCa/gGUlNhH/2E9Sfq3
	 ShDwcTVkQK6qw24MHwcRvyKO1mH1wyu0MecT55oLfNN994qeMEREBFfzqPv87evyn9/eg
	 rXpJJTKLxPaLYUaPT/8yUFXJBNmEuTOo0Sub3VtvKgxGWxNeA2tfLWm8aVv3HkCxXhWpz
	 M1fuE2OZWXNbE/15hfpyCyNbnAWXp6Y/xc2qGBCTkh2diBQ9Ys/trOD+6oBEmpSrmDI0r
	 PYtMqfGIKEHEKoOBwTJosxBxJ/r8HvcQX79ggUPtY/RUq9Bd7Kwd4/PwMY0EM4hTv1g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 853061F0093A;
	Thu,  5 Nov 2026 07:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793865395;
	bh=d+cEXz8UxGPuqQ5Mf2QjoAOu8C3Tu/pSpc0uPcOqFz4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Zel3JzDqodF0nGiBeCjbXvs4FCxZur/6TqWOJxL5uMIblqWgENckAqpN7d3qwvNwY
	 RqYjursG0EWgQpfNVyNO10iacDghMiPIAe7tScStdaNzRiXsIaWV+7rJiLQ01BVVwl
	 C/NKdSQ64A7p6U+nAu+zfXTYRSk+RMOq255aCNuuJEyI4DuRxW49AXhCKEN6NaiJpZ
	 0V4O1eEB6X0Vp9+yB6RRvxiz111YUSbwMyAJWWnAQ31+7jPmVd2FA11hKWL1zm8xUr
	 Vq8jjUgrpOlAmiPGq/dcHD8kg1+uukjg5mahONF30E6s99DGc90YL6uxxkex0tH76L
	 nSWZzdyMQPsuQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 07F454715D;
	Thu,  5 Nov 2026 07:56:34 +0000 (UTC)
From: Jack Wu via B4 Relay <devnull+jackbb_wu.compal.com@kernel.org>
Date: Thu, 05 Nov 2026 15:56:28 +0800
Subject: [PATCH v11 2/6] net: wwan: t9xx: Add control plane transaction
 layer framework
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261105-t9xx_driver_v1-v11-2-2084aa512864@compal.com>
References: <20261105-t9xx_driver_v1-v11-0-2084aa512864@compal.com>
In-Reply-To: <20261105-t9xx_driver_v1-v11-0-2084aa512864@compal.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Sergey Ryazanov <ryazanov.s.a@gmail.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Jack Wu <jackbb_wu@compal.com>, Wen-Zhi Huang <wen-zhi.huang@mediatek.com>, 
 Shi-Wei Yeh <shi-wei.yeh@mediatek.com>, 
 Minano Tseng <Minano.tseng@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Robert Yu <robert_yu@compal.com>, 
 Jeff Chang <Jeff_Chang@compal.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793865391; l=4974;
 i=jackbb_wu@compal.com; s=20260526; h=from:subject:message-id;
 bh=bZSBCrepq6pzXVTWgSsPcjFEwaLd8BCjmEh0yOmNpvo=;
 b=d62eTKghqpXgcUJGyskYwgawcj1LD6sZT+Na7KiyMj8sEMHV4C+yE4DSv71uNMjkUAZd/WYnh
 +K77rL4XSq8APH3dDQkCOnNCXcyorHMZB9aGcClkBp5e7DgBHnFcXjd
X-Developer-Key: i=jackbb_wu@compal.com; a=ed25519;
 pk=VH1prTWixNl8OEUPPSfII3p46MzJpQN8J3+ecE1tZXg=
X-Endpoint-Received: by B4 Relay for jackbb_wu@compal.com/20260526 with
 auth_id=793
X-Original-From: Jack Wu <jackbb_wu@compal.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: jackbb_wu@compal.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jack Wu <jackbb_wu@compal.com>

Introduce the control plane and transaction layer framework
for the T9XX WWAN driver. This patch adds the core data
structures (mtk_ctrl_blk, mtk_ctrl_trans) and initialization
entry points that subsequent patches build upon.

The control plane block (ctrl_blk) serves as the central
context for managing the transaction layer, port layer, and
FSM interactions. The actual DMA engine and TX/RX service
implementations are added in subsequent patches, and
mtk_ctrl_init() and mtk_ctrl_exit() get their first callers
there, in pcie/mtk_trans_ctrl.c.

Signed-off-by: Jack Wu <jackbb_wu@compal.com>
---
 drivers/net/wwan/t9xx/Makefile              |  1 +
 drivers/net/wwan/t9xx/mtk_ctrl_plane.c      | 46 +++++++++++++++++++++++++++++
 drivers/net/wwan/t9xx/mtk_ctrl_plane.h      | 21 +++++++++++++
 drivers/net/wwan/t9xx/mtk_dev.h             |  3 ++
 drivers/net/wwan/t9xx/pcie/mtk_pci.c        |  1 +
 drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.h | 19 ++++++++++++
 6 files changed, 91 insertions(+)

diff --git a/drivers/net/wwan/t9xx/Makefile b/drivers/net/wwan/t9xx/Makefile
index bd6063c85c2b..0a07507f1ddf 100644
--- a/drivers/net/wwan/t9xx/Makefile
+++ b/drivers/net/wwan/t9xx/Makefile
@@ -6,4 +6,5 @@ ccflags-y += -I$(src)
 obj-$(CONFIG_MTK_T9XX) += mtk_t9xx.o
 
 mtk_t9xx-y := \
+	mtk_ctrl_plane.o \
 	pcie/mtk_pci.o
diff --git a/drivers/net/wwan/t9xx/mtk_ctrl_plane.c b/drivers/net/wwan/t9xx/mtk_ctrl_plane.c
new file mode 100644
index 000000000000..81f6b3fbc0bd
--- /dev/null
+++ b/drivers/net/wwan/t9xx/mtk_ctrl_plane.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022, MediaTek Inc.
+ * Copyright (c) 2022-2023, Intel Corporation.
+ */
+
+#include <linux/device.h>
+
+#include "mtk_ctrl_plane.h"
+
+/**
+ * mtk_ctrl_init() - Initialize the control plane block.
+ * @mdev: Pointer to the MTK modem device.
+ *
+ * Allocates and initializes the control plane block
+ * associated with @mdev.  Runs once per bind; the allocation is
+ * devres managed and is released at unbind, not by
+ * mtk_ctrl_exit().
+ *
+ * Return: 0 on success, -ENOMEM on allocation failure.
+ */
+int mtk_ctrl_init(struct mtk_md_dev *mdev)
+{
+	struct mtk_ctrl_blk *ctrl_blk;
+
+	ctrl_blk = devm_kzalloc(mdev->dev, sizeof(*ctrl_blk), GFP_KERNEL);
+	if (!ctrl_blk)
+		return -ENOMEM;
+
+	ctrl_blk->mdev = mdev;
+	mdev->ctrl_blk = ctrl_blk;
+
+	return 0;
+}
+
+/**
+ * mtk_ctrl_exit() - Clean up the control plane block.
+ * @mdev: Pointer to the MTK modem device.
+ *
+ * Clears the control plane block pointer. The allocation
+ * itself is managed by devres and freed on driver detach.
+ */
+void mtk_ctrl_exit(struct mtk_md_dev *mdev)
+{
+	mdev->ctrl_blk = NULL;
+}
diff --git a/drivers/net/wwan/t9xx/mtk_ctrl_plane.h b/drivers/net/wwan/t9xx/mtk_ctrl_plane.h
new file mode 100644
index 000000000000..46f1ab9f0551
--- /dev/null
+++ b/drivers/net/wwan/t9xx/mtk_ctrl_plane.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright (c) 2022, MediaTek Inc.
+ */
+
+#ifndef __MTK_CTRL_PLANE_H__
+#define __MTK_CTRL_PLANE_H__
+
+#include <linux/skbuff.h>
+
+#include "mtk_dev.h"
+
+struct mtk_ctrl_blk {
+	struct mtk_md_dev *mdev;
+	void *ctrl_hw_priv;
+};
+
+int mtk_ctrl_init(struct mtk_md_dev *mdev);
+void mtk_ctrl_exit(struct mtk_md_dev *mdev);
+
+#endif /* __MTK_CTRL_PLANE_H__ */
diff --git a/drivers/net/wwan/t9xx/mtk_dev.h b/drivers/net/wwan/t9xx/mtk_dev.h
index fc25418bb957..ff3cbaa4329e 100644
--- a/drivers/net/wwan/t9xx/mtk_dev.h
+++ b/drivers/net/wwan/t9xx/mtk_dev.h
@@ -28,12 +28,15 @@ enum mtk_dev_evt_d2h {
 	DEV_EVT_D2H_ASYNC_HS_NOTIFY_MD	= BIT(6),
 };
 
+struct mtk_ctrl_blk;
+
 /* mtk_md_dev defines the structure of MTK modem device */
 struct mtk_md_dev {
 	struct device *dev;
 	void *hw_priv;
 	u32 hw_ver;
 	char dev_str[MTK_DEV_STR_LEN];
+	struct mtk_ctrl_blk *ctrl_blk;
 };
 
 #endif /* __MTK_DEV_H__ */
diff --git a/drivers/net/wwan/t9xx/pcie/mtk_pci.c b/drivers/net/wwan/t9xx/pcie/mtk_pci.c
index 902bcbe1512e..27785092b2f7 100644
--- a/drivers/net/wwan/t9xx/pcie/mtk_pci.c
+++ b/drivers/net/wwan/t9xx/pcie/mtk_pci.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 
 #include "mtk_dev.h"
+#include "mtk_trans_ctrl.h"
 #include "mtk_pci.h"
 #include "mtk_pci_reg.h"
 
diff --git a/drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.h b/drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.h
new file mode 100644
index 000000000000..9b42f33bd008
--- /dev/null
+++ b/drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright (c) 2022, MediaTek Inc.
+ */
+
+#ifndef __MTK_TRANS_CTRL_H__
+#define __MTK_TRANS_CTRL_H__
+
+#include <linux/list.h>
+#include <linux/skbuff.h>
+#include <linux/types.h>
+
+#include "mtk_dev.h"
+
+struct mtk_ctrl_trans {
+	struct mtk_md_dev *mdev;
+};
+
+#endif

-- 
2.34.1



