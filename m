Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B03CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 06:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eG0rTodn0DU81UbM7Y7nOdcQ/eVn9TOf7zlRSmencCY=; b=CmE8RC0lefNZpSErSC9nH0qiZU
	Zzc8zOKCnueyHnQq0Y1tTHdVQ15Qu77UKiYvHFXixSYcZkDKx0s+LYREbuPuTBQBXkMJI3GuRvOW2
	0eDGTCKuIgNA85TNIeiwp2qv3UCL1LrEafNtaBtxh5mI4w0zREnlqdnwjPdi+3f6W6RSQhhlrTBO6
	KHisVh6aMYQMVuKFkOoW5uxK/cgnm52NaK1pXuIJGc5VXOjcDL4s/XRwilaiutXEOIF3SGCcKysoX
	t1hupH0FqjK1ro0hxV3G753j4ld3QP55YcFyg4jTtRK3S6RsWYCrSfnAVTw2DSqTZ+3L6CPyNW5xH
	51Sr5Axg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYIK7-0000000C0nN-2iKI;
	Sat, 13 Jun 2026 06:58:31 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYIK2-0000000C0kD-0pmq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 06:58:27 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490be03d47bso16718775e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 23:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781333904; x=1781938704; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eG0rTodn0DU81UbM7Y7nOdcQ/eVn9TOf7zlRSmencCY=;
        b=kXQk3domny8bz2GGyR326S5qk62Qdftvj9RcAZ8Tizt+oamWNpbcAtDAdRg4EDaqmM
         uKXlahl1gmdufd0ubNWA1E5eu+lGr086pMqB3AGt7TXNCRmLw6FArJ8I22iUgwOuKg7Q
         ktmk3K69egl1i3Nfv++BD3Kfc4uI64dxcf/4yvIvLbn0QeOC6ZKlN+QC/ny2KWJ+HKPQ
         d7Jbwgy/RJu4502NxzXEMFddVkA1kfhMqYoHfaz1WEN5Wpqs7Zogfb/LmROmCKTpIFdO
         SStv21OuxuXvikhXnGetKgVclDZXzX0wS2rpdnDSFNItHhI5R00FD/+XUA5ZHMP74dmj
         mFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781333904; x=1781938704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eG0rTodn0DU81UbM7Y7nOdcQ/eVn9TOf7zlRSmencCY=;
        b=ObYV8phiAKaD+fv1XM76JGkYUiaNUiY9vN6fIwpSZX0+fRTxeSWeAY2MoIw9w736by
         4cAmJIAjGotzgeMYMMngOKAbpykTE7i7bd1sjCn5jVgJ4Ai8i2+GuzWizrsZu716qX+W
         RK59FrKfSs4A8KGcOwxIR9fc2r6jIN3GCZY7NZQaTw8auJiloS9iw6PgDSxuArL9CXng
         D1zkWxs7C99KwK11E/Jo659sawSfH+SSKf2fGC350WBK3c+QnnhYiCi0p+FQMcTTZ0cX
         VwjdGz/0n/g7vnUOIm9ZvAIDq4TQj55apccEy9TWKilXnokzzXM9+3rh+y2QJ5ZpLAwr
         p6LA==
X-Forwarded-Encrypted: i=1; AFNElJ/9v4Cj/GltgK38TOOmweoAYzon3g3mCI8nmhuKy9h61BexRBvorLUk/4cCS2r7vGm6yZR5T5y/fnrrFFeEJeCS@lists.infradead.org
X-Gm-Message-State: AOJu0YwSaYjppLWiZHceM/6N//OX7G/KrE9pDByKOaZRa72bn/+xhZeI
	6wI0rV+12pQcMXCFFysc/vtNAIknyxc3XzhSHnU28N529Qtr7Bzthnlj
X-Gm-Gg: Acq92OG3vP9mCsKJoOhfO83A3mqNX71AQaKSLoOYHIngzEA3hX+izNvT5u4UXIGiLYo
	5dgfBqf0RX7ZeGpsaDlxSbhJAydf1ZRcY/MlYHCotTIj0kHDfSPDcMy2gzv/w30v8PePtEL9ZQF
	ocWuvlfdCcKmf9VYI1hgvdzV0iotCNgRg8Paymh3vOwOzJPVTnOUpNOr+zH238PiUP1j32SI6yL
	3guYDbcmcfW/aYzLvpyLwTW8wpKe0ANVsfuRm79pKG4srCxygHPzmTaJiLNSdKN4pc47ePRDlV8
	3mS9wE/GoA0cTaVSAk1c5cEHy3javAEMBlW+band8addowT232WJcj149OvZ6TKt7wcX/GZrM/7
	3Ggoo1qc+fZHLggpsOISxXyVrYpG++9upzgIdcbKt01zCb4pBfY5j5MvYLhLquE5AwF6Jc6tizJ
	EuFHBcrTla1UXgjaO8C1kot93x2rxCeZgwhW5qDELCxw==
X-Received: by 2002:a05:600c:820c:b0:490:45bb:8dd9 with SMTP id 5b1f17b1804b1-490ec4cde5bmr72801305e9.8.1781333904245;
        Fri, 12 Jun 2026 23:58:24 -0700 (PDT)
Received: from debian.tailb81abf.ts.net ([2a01:e0a:104a:4d80:14c0:9448:1c38:77df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202e5cbasm42917705e9.2.2026.06.12.23.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 23:58:23 -0700 (PDT)
From: MidG971 <midgy971@gmail.com>
To: tomeu@tomeuvizoso.net,
	ogabbay@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulf.hansson@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	xxm@rock-chips.com,
	chaoyi.chen@rock-chips.com,
	finley.xiao@rock-chips.com,
	diederik@cknow-tech.com,
	jonas@kwiboo.se,
	Midgy BALON <midgy971@gmail.com>
Subject: [RFC PATCH v4 1/9] accel: rocket: Introduce per-SoC rocket_soc_data
Date: Sat, 13 Jun 2026 09:01:08 +0200
Message-Id: <20260613070116.438906-2-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260613070116.438906-1-midgy971@gmail.com>
References: <20260613070116.438906-1-midgy971@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_235826_274976_C1292A63 
X-CRM114-Status: GOOD (  16.75  )
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

From: Midgy BALON <midgy971@gmail.com>

Add a per-SoC data structure carried in the OF match table, currently
holding only the NPU AXI address width, and use it for the per-core DMA
mask instead of a hardcoded 40-bit value.  No functional change: the
RK3588 AXI master is 40-bit.  This prepares for SoCs with a narrower
address width.

Signed-off-by: Midgy BALON <midgy971@gmail.com>
---
 drivers/accel/rocket/rocket_core.c |  7 ++++++-
 drivers/accel/rocket/rocket_core.h | 11 +++++++++++
 drivers/accel/rocket/rocket_drv.c  |  6 +++++-
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/rocket_core.c
index b3b2fa9ba645a..09c445af7de73 100644
--- a/drivers/accel/rocket/rocket_core.c
+++ b/drivers/accel/rocket/rocket_core.c
@@ -7,6 +7,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/iommu.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
@@ -21,6 +22,10 @@ int rocket_core_init(struct rocket_core *core)
 	u32 version;
 	int err = 0;
 
+	core->soc_data = of_device_get_match_data(dev);
+	if (!core->soc_data)
+		return dev_err_probe(dev, -EINVAL, "missing SoC match data\n");
+
 	core->resets[0].id = "srst_a";
 	core->resets[1].id = "srst_h";
 	err = devm_reset_control_bulk_get_exclusive(&pdev->dev, ARRAY_SIZE(core->resets),
@@ -52,7 +57,7 @@ int rocket_core_init(struct rocket_core *core)
 
 	dma_set_max_seg_size(dev, UINT_MAX);
 
-	err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(40));
+	err = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(core->soc_data->dma_bits));
 	if (err)
 		return err;
 
diff --git a/drivers/accel/rocket/rocket_core.h b/drivers/accel/rocket/rocket_core.h
index f6d7382854ca9..8ee105a0be40e 100644
--- a/drivers/accel/rocket/rocket_core.h
+++ b/drivers/accel/rocket/rocket_core.h
@@ -12,6 +12,16 @@
 
 #include "rocket_registers.h"
 
+struct rocket_core;
+
+/**
+ * struct rocket_soc_data - per-SoC configuration data
+ * @dma_bits: Physical address width reachable by the NPU's AXI master.
+ */
+struct rocket_soc_data {
+	unsigned int dma_bits;
+};
+
 #define rocket_pc_readl(core, reg) \
 	readl((core)->pc_iomem + (REG_PC_##reg))
 #define rocket_pc_writel(core, reg, value) \
@@ -31,6 +41,7 @@ struct rocket_core {
 	struct device *dev;
 	struct rocket_device *rdev;
 	unsigned int index;
+	const struct rocket_soc_data *soc_data;
 
 	int irq;
 	void __iomem *pc_iomem;
diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
index 8bbbce594883e..384c38e13acce 100644
--- a/drivers/accel/rocket/rocket_drv.c
+++ b/drivers/accel/rocket/rocket_drv.c
@@ -213,8 +213,12 @@ static void rocket_remove(struct platform_device *pdev)
 	}
 }
 
+static const struct rocket_soc_data rk3588_soc_data = {
+	.dma_bits = 40,
+};
+
 static const struct of_device_id dt_match[] = {
-	{ .compatible = "rockchip,rk3588-rknn-core" },
+	{ .compatible = "rockchip,rk3588-rknn-core", .data = &rk3588_soc_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.39.5


