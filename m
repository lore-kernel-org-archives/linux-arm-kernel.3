Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81083C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 18:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lcshcCFgPieIG5e8bwiFJkZupH8EGx8PYrfbPTGlSIU=; b=PUxkrcFwdgHSDbLeiBgAHRMEks
	7dcj1na6qgt0XZwhTB50nBWcom6zmuodviB5AaWHy4x4ZKebY3+kcXL+K5bNgaPmKb6Un8Zjmi+Jw
	ZAZsbzN4q6v2HfAnJH2jdS6UrGGkjEqx77Yod5a0q4rQ3Ghe6VhgQasY7eH95GeSbhCFqnIAkF+jx
	MrIFjr4F+pGY13QieIOmC1WzyV+WldGnnH/6gRLCTDy9On8M7KdMLE7tiMRIkB8NaPmqTQ1n6cd71
	Nx9xV46pX8e25+Ll+Q2OGa9hwuGaI3p1BK/rbmawrofNT2czHU0rTfbm4fWt1zry6ATN46Dzxbt6o
	wi3pnp7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RjG-00000009CFk-2nFo;
	Wed, 23 Sep 2026 18:30:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Rj0-00000009C7l-2FD0
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 18:29:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=lcshcCFgPieIG5e8bwiFJkZupH8EGx8PYrfbPTGlSIU=; b=Wd+Lk6grTp7x7/7BBKCxHdHRZz
	Jb1LCsqxtXnFjhbUhpXk1CfQU70BFxLQsKWkvdQPhoUIwVMzr3zeOsol1u42K3rjB8G+7Lf4QBtIH
	5ICD3AdL2CziCwcXdtQf/+W9sNjZXt++en7fqBmnE3JJwhF6FybSzkDZgmun23a8TZFHD4r76PI9V
	+v0Z15S8TJ+POMT+zKv5QAYSVUiDHS1KuJmhs4AjXNex60Xa0ofdOYxxVLeNah760vi9NsiViNuZ+
	u8Q/K9wxIZJsw+FKoK+6lVFSbj/7Qs1Y/IoX+mYsZmX8McsxksbjZqqcGn85abpky+0m1MmVpD5nz
	WVKhMcag==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Rix-0000000F9da-2ySX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 18:29:45 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e721b5503so11131585e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 11:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790188182; x=1790792982; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lcshcCFgPieIG5e8bwiFJkZupH8EGx8PYrfbPTGlSIU=;
        b=Eedwt6NE8Ytv8qEE0nMGAxYLIN6ednKdYSUmyQtVSoQSu2FedI6oUDxhnJAs1YnI9Y
         pZk/43tAj3gkdtbN1X4VCdHNOjXuwyXvnOWMF0BNeZinx7rp6CMJR4CpYwI+VWXGMt+x
         BGsrLtUObJTb4ZLW32+RpQ9o3L5L2nQ9dO5b2DVNHW8I7O6umKqiwnlrvtqElljI2Z3m
         SAQbQf+JzOhpwV8ioyfY0nnUyPoNrk+NHvgnyLlJ5VOn3RXotBAin+tgQ6K5QTZ6uXh3
         pTpqewYHVayROUv8SID6Y5jgGriXae6aymJGO4dVwVcg3yCzT24hc7Z6z/1biFBr1FCp
         2XNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790188182; x=1790792982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lcshcCFgPieIG5e8bwiFJkZupH8EGx8PYrfbPTGlSIU=;
        b=pTBMu9p8ffGYpbMGVJZtMDFZT78yWVmzDPPa5mOLHxUM++SFdiIGBESjHOtF2imWxI
         vJsDJmHFFGHVecXd+ncKAA75jJz7Pi8GfWSo92Y6lzkSrAPvvpKJadTy+YJ3j6PV8W+o
         H+CVmUBUO1/yzkQqnpOtbqYj14DHVea1gpcVuvN8N6L6xhZ7D2KFGvKYJIJhYXABc7nW
         gTa9SZJZKGqUc8AuurZzzk5vUmOr5ov9Bt2T1HFywnyf3+Z14eoB06S11zJM7c2Yn4J6
         RhbbQn9K15cTnDpvxcqBQIoMNmgyrr71HGx85ik7pEhtbZKaGvcCIGmP0B3Pr0Gr3VxY
         1bJg==
X-Forwarded-Encrypted: i=1; AKwUvBxe/fHubRt6PoPVxK8ZKs4KFhAahbgeXauW3FtO67IPGzSBlL7B4y7ac2YAEVFfve9S1qJLw+EpS298kvrbqV/X@lists.infradead.org
X-Gm-Message-State: AFuF++lD8GO3Zbo5fzl2beAInR6LO2jqRFEMCtrDudh28yESaBQJPRrq
	pGQq3w5Nsd7XNM8dzb/rRY8oLzz/yjqBm5uP5yVLw5As4fIc8w77VIvL
X-Gm-Gg: AYBFou3d5n6xT9nohSB3tUIfgN4hmgLSqOp47qLd1mN08fbKqTod5s6ixcFki3Ul78C
	GWQSMZ81TpSK13Hvu0fKI63l/XgpLnm8ezyhiMrAGMQQMzmCxPKznddmVpZMWq4BJ9ADCNpWvqg
	58fSrQwGrCGbPrhHPi060nWGK1BFmfCxcQNcwH8TBcChAtHKyycE04Yvhi7dSBRPaXMz/h28ELb
	KVrG/NCf1QHY2KdCwXSUpwnc/qVN4nNFBKuW72SwrvuaqwDMz0/XZcS5vuWI9mMMoPraACPkQQe
	7Lr4RhXZ0z5JM26unygfYPlH7Ig22CXPHaSRT9thS3r6P+SfhQuSJXLg4B/fNCbQTUndDAP6twa
	t/kg45x8nCfKUU2vVdPqZ+rtSUyX6wzzc2Ns6J5XR+yytj55zxKeHCVJpQeOHRGPavno4N91ITc
	D+9s2MUDWHVq57C2b0kO/dD1yYORshcgHO8CvJ2X6EK7Ms7oKUVBBXfTfuXp2XmNqUXn9XsYLL9
	cIG
X-Received: by 2002:a05:600c:34d4:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-49fe66d1279mr1377135e9.10.1790188182438;
        Wed, 23 Sep 2026 11:29:42 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd3d5csm4711835e9.14.2026.09.23.11.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 11:29:41 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 23 Sep 2026 21:28:51 +0300
Subject: [PATCH v12 05/12] clk: zte: Add Clock registration infrastructure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260923-zx29clk-v12-5-9c243796b6d2@gmail.com>
References: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
In-Reply-To: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=15712;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=ofd8rVoz0p52QzPz9+SkZywnce00Yrxb97abl1XuDdk=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqtBpuFtBzCl8Ov/qlCBR4Dtxs3iIbzdBgZvkcR
 Ytb5C98qKmJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCarQabhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJZ/xAAlmatuZTD+iQ1xOXN+cKc7/9RnLvdEuO
 D1E3j0mfd3tTdj/0WwESy+pGtil5h4lW5+XEpNkcu92pSxNjY7TBBcjVqVNcMByhHVP2YWQNHD1
 JSNCNGm0kiOnCDGgBht6oAWEW3LdGRwg7U9Jmscby2ZnBeazirvB3HhqFUGNXa2Sos2/PGrdQFC
 TmYRLWNT3evYcBuLJiAlk5/+ZAcu0PEeU4IojfBACCSM5w00vayvglQzZM0iyrbMjMDog+URrQx
 ohJhx3huCP+8L7ImHCztTs/hyJzf4JgLP/nVFsTWVAJ06ImVuia1ilVCCO8q/2Vfs/gs1sAiBKE
 byzt1VZNxXg8mOT3VfsN9ViKPK6IuBaj27AeVBvk2IR1PmpbyfhGwMvf53ti1L/mW7Rsaw5ZqqC
 BKDly5bL38bYcHtae9yLNRVePyrwO1ZdTi2SFU8GYIZT9K76rWgy9UOglHjCpnoWZK6p9md416u
 8TJv7Osk2HUI1kX3Qu4r9xoK58zoAzJ8wBYC0j/DLWlaW2sQqXLFmzkp5lhPVvfo0iJcT37xV4K
 K9pmFznhpa/1PThZLnmeaWWixBXmht706FhGJPCFm5Mr2yvvIoK7Czl6YrMizBGKWBZiXH6Ehxo
 QzXHLWpoOODBX+xZ8m6R0VaHoCEZvWJ2MHANQUpR9A9ewrqdlt9g=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_192943_955753_E9E0AB36 
X-CRM114-Status: GOOD (  35.21  )
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

The next patches will implement the regmap clocks and PLL driver. The
actual hardware specific clock listing will live in a separate module.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

Version 11, 12: Unchanged

@Sashiko: I think your concern about a NULL of_node in the call to
devm_clk_hw_register_fixed_factor_fwname is a false positive. The CCF
code looks for of_nodes in dev and dev->parent.

Version 10 (Brian):
Remove unused struct zx_clk_export
Remove a stray semicolon from switch/case in zx_get_parent
Explain the rationale for the validation code and discourage copying it
into other clock drivers
Make the exports array const (Sashiko)

Version 9:
Rework parent matching and clock export control. Most of the changes
will be in the next patches. The visible change here is that the clock
array is unified with single clocks having a type rather than one array
per type.

Depend on HAS_IOMEM, similarly to Sashiko's flagged issue in the Reset
patch

ZX297520V3_CLK_NO_EXPORT is gone again.

The explicit clock input array and enabling of LSP's pclk is removed
from the clock driver. The MFD parent takes care of this instead. The
clock driver does some sanity checking on the static clock data though.

Version 8:
Use ZX297520V3_CLK_NO_EXPORT=(~0u) for unexported clocks. While using 0,
and starting clock indices at 1, is a common pattern in existing
drivers, it exposes a driver implementation detail in the hardware
binding interface.

If desired, I can change the special index to a separate field in the
structs.

Fix the return value if the ->init() callback fails. (Sashiko)

Version 7:
*) Add fixed dividers to handle PLL subdivisions
*) Never register PLLs directly as exported clocks - everything on this
SoC goes through a gate before it leaves a controller.

Version 6:
*) Remove auxdev now that LSP clocks also use MFD
*) Error codepath fixes pointed out by Sashiko.

Version 5:

*) Pass the static clk data instead of calling get_match_data to prepare
for operating as an MFD child.

*) Don't use devm_kzalloc to allocate the auxiliary_device
structure. I guess Sashiko is right, and that's what "Because once the
device is placed on the bus the parent driver can not tell what other
code may have a reference to this data" is trying to tell me.

*) Fix error check for device_node_to_regmap.
---
 MAINTAINERS                  |   1 +
 drivers/clk/Kconfig          |   1 +
 drivers/clk/Makefile         |   1 +
 drivers/clk/zte/Kconfig      |  17 ++++
 drivers/clk/zte/Makefile     |   5 ++
 drivers/clk/zte/clk-regmap.c |  32 ++++++++
 drivers/clk/zte/clk-zx.c     | 192 +++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/zte/clk-zx.h     | 137 ++++++++++++++++++++++++++++++
 drivers/clk/zte/pll-zx.c     |  18 ++++
 9 files changed, 404 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 41c287316d0e..cf4e8c48ddfc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3927,6 +3927,7 @@ F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	drivers/clk/zte/
 F:	drivers/mfd/zte-zx297520v3-crm.c
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 F:	include/dt-bindings/phy/zte,zx297520v3-topcrm.h
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 252f6a1f21b8..ca4869c4e5e1 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -548,6 +548,7 @@ source "drivers/clk/uniphier/Kconfig"
 source "drivers/clk/visconti/Kconfig"
 source "drivers/clk/x86/Kconfig"
 source "drivers/clk/xilinx/Kconfig"
+source "drivers/clk/zte/Kconfig"
 source "drivers/clk/zynqmp/Kconfig"
 
 # Kunit test cases
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 2d8f60254373..91b73be31707 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -182,5 +182,6 @@ ifeq ($(CONFIG_COMMON_CLK), y)
 obj-$(CONFIG_X86)			+= x86/
 endif
 obj-y					+= xilinx/
+obj-$(CONFIG_COMMON_CLK_ZTE)		+= zte/
 obj-$(CONFIG_ARCH_ZYNQ)			+= zynq/
 obj-$(CONFIG_COMMON_CLK_ZYNQMP)         += zynqmp/
diff --git a/drivers/clk/zte/Kconfig b/drivers/clk/zte/Kconfig
new file mode 100644
index 000000000000..152c2423b8f0
--- /dev/null
+++ b/drivers/clk/zte/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# ZTE Clock Drivers
+#
+
+config COMMON_CLK_ZTE
+	tristate "Clock driver for ZTE SoCs"
+	depends on HAS_IOMEM
+	depends on ARCH_ZTE || COMPILE_TEST
+	default ARCH_ZTE
+	select MFD_SYSCON
+	help
+	  This option selects common clock infrastructure for ZTE based SoCs.
+	  You will need to enable one or more SoC specific drivers to make use
+	  of this.
+
+	  Enable this if you are building a kernel for a ZTE designed board.
diff --git a/drivers/clk/zte/Makefile b/drivers/clk/zte/Makefile
new file mode 100644
index 000000000000..27db07293165
--- /dev/null
+++ b/drivers/clk/zte/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_COMMON_CLK_ZTE) += clk-zte.o
+
+clk-zte-y += clk-zx.o pll-zx.o clk-regmap.o
diff --git a/drivers/clk/zte/clk-regmap.c b/drivers/clk/zte/clk-regmap.c
new file mode 100644
index 000000000000..80332dba97f6
--- /dev/null
+++ b/drivers/clk/zte/clk-regmap.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Stefan Dösinger
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/regmap.h>
+
+#include "clk-zx.h"
+
+struct clk_hw *zx_clk_register_gate(struct device *dev, struct regmap *regmap,
+				    const struct zx_gate_desc *desc,
+				    struct clk_hw * const *clocks)
+{
+	return ERR_PTR(-ENODEV);
+}
+
+struct clk_hw *zx_clk_register_divider(struct device *dev, struct regmap *regmap,
+				       const struct zx_div_desc *desc,
+				       struct clk_hw * const *clocks)
+{
+	return ERR_PTR(-ENODEV);
+}
+
+struct clk_hw *zx_clk_register_mux(struct device *dev, struct regmap *regmap,
+				   const struct zx_mux_desc *desc,
+				   struct clk_hw * const *clocks)
+{
+	return ERR_PTR(-ENODEV);
+}
diff --git a/drivers/clk/zte/clk-zx.c b/drivers/clk/zte/clk-zx.c
new file mode 100644
index 000000000000..aef0f7c753e6
--- /dev/null
+++ b/drivers/clk/zte/clk-zx.c
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+
+#include "clk-zx.h"
+
+static struct clk_hw *zx_clk_register_fixed_div(struct device *dev,
+						const struct zx_fixed_divider_desc *desc,
+						struct clk_hw * const *clocks)
+{
+	const struct zx_parent_desc *p = &desc->parent;
+
+	switch (p->type) {
+	case ZX_PARENT_FW:
+		return devm_clk_hw_register_fixed_factor_fwname(dev, NULL, desc->name, p->fw_name,
+								CLK_SET_RATE_PARENT, 1, desc->div);
+
+	case ZX_PARENT_ID:
+		return devm_clk_hw_register_fixed_factor_parent_hw(dev, desc->name, clocks[p->id],
+								   CLK_SET_RATE_PARENT, 1,
+								   desc->div);
+	}
+	WARN_ON_ONCE(1);
+	return ERR_PTR(-EINVAL);
+}
+
+static int zx_clk_validate(struct device *dev, struct device_node *of_node,
+			   const struct zx_clk_data *data)
+{
+	const struct zx_parent_desc *parents;
+	unsigned int i, p, num_parents;
+	struct clk *clk;
+
+	/*
+	 * Sanity check: Make sure all parents are there and write a clear message rather than
+	 * leave potential orphans.
+	 *
+	 * This check is unusual in clock drivers. It is in this driver because the clock tree is
+	 * based on manual reverse engineering rather than generated from a SoC datasheet.
+	 */
+	for (i = 0; i < data->num_clocks; ++i) {
+		switch (data->clocks[i].type) {
+		case ZX_CLOCK_PLL:
+			parents = data->clocks[i].pll.parents;
+			num_parents = data->clocks[i].pll.num_parents;
+			break;
+
+		case ZX_CLOCK_FIXED_DIV:
+			parents = &data->clocks[i].fixed_div.parent;
+			num_parents = 1;
+			break;
+
+		case ZX_CLOCK_MUX:
+			parents = data->clocks[i].mux.parents;
+			num_parents = data->clocks[i].mux.num_parents;
+			break;
+
+		case ZX_CLOCK_DIV:
+			parents = &data->clocks[i].div.parent;
+			num_parents = 1;
+			break;
+
+		case ZX_CLOCK_GATE:
+			parents = &data->clocks[i].gate.parent;
+			num_parents = 1;
+			break;
+
+		default:
+			return dev_err_probe(dev, -EINVAL, "Invalid clock entry %u\n", i);
+		}
+
+		for (p = 0; p < num_parents; ++p) {
+			switch (parents[p].type) {
+			case ZX_PARENT_FW:
+				clk = of_clk_get_by_name(of_node, parents[p].fw_name);
+				if (IS_ERR(clk))
+					return dev_err_probe(dev, PTR_ERR(clk),
+							     "Input clk %s failure\n",
+							     parents[p].fw_name);
+				clk_put(clk);
+				break;
+
+			case ZX_PARENT_ID:
+				if (parents[p].id >= i)
+					return dev_err_probe(dev, -EINVAL,
+							     "Clock %u has parent %u\n",
+							     i, parents[p].id);
+				break;
+
+			default:
+				return dev_err_probe(dev, -EINVAL,
+						     "Clock %u has unexpected parent of type %u\n",
+						     i, parents[p].type);
+			}
+		}
+	}
+
+	return 0;
+}
+
+int zx_clk_common_probe(struct device *dev, struct device_node *of_node,
+			const struct zx_clk_data *data)
+{
+	struct clk_hw_onecell_data *exports;
+	struct clk_hw **clocks;
+	struct regmap *map;
+	unsigned int i;
+	int res;
+
+	res = zx_clk_validate(dev, of_node, data);
+	if (res)
+		return res;
+
+	map = device_node_to_regmap(of_node);
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	clocks = devm_kcalloc(dev, data->num_clocks, sizeof(*clocks), GFP_KERNEL);
+	if (!clocks)
+		return -ENOMEM;
+
+	if (data->init) {
+		res = data->init(map);
+		if (res)
+			return res;
+	}
+
+	for (i = 0; i < data->num_clocks; ++i) {
+		struct clk_hw *hw;
+
+		switch (data->clocks[i].type) {
+		case ZX_CLOCK_PLL:
+			hw = zx_clk_register_pll(dev, map, &data->clocks[i].pll, clocks);
+			break;
+
+		case ZX_CLOCK_FIXED_DIV:
+			hw = zx_clk_register_fixed_div(dev, &data->clocks[i].fixed_div, clocks);
+			break;
+
+		case ZX_CLOCK_MUX:
+			hw = zx_clk_register_mux(dev, map, &data->clocks[i].mux, clocks);
+			break;
+
+		case ZX_CLOCK_DIV:
+			hw = zx_clk_register_divider(dev, map, &data->clocks[i].div, clocks);
+			break;
+
+		case ZX_CLOCK_GATE:
+			hw = zx_clk_register_gate(dev, map, &data->clocks[i].gate, clocks);
+			break;
+
+		default:
+			return -EINVAL;
+		}
+
+		if (IS_ERR(hw))
+			return dev_err_probe(dev, PTR_ERR(hw), "Failed to register clk %u\n", i);
+
+		clocks[i] = hw;
+	}
+
+	exports = devm_kzalloc(dev, struct_size(exports, hws, data->num_exports), GFP_KERNEL);
+	if (!exports)
+		return -ENOMEM;
+	exports->num = data->num_exports;
+
+	for (i = 0; i < data->num_exports; ++i) {
+		if (data->exports[i] >= data->num_clocks)
+			return dev_err_probe(dev, -EINVAL,
+					     "Export %u points to out of range clock %u\n",
+					     i, data->exports[i]);
+
+		exports->hws[i] = clocks[data->exports[i]];
+	}
+
+	devm_kfree(dev, clocks);
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, exports);
+}
+EXPORT_SYMBOL_NS_GPL(zx_clk_common_probe, "ZTE_CLK");
+
+MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
+MODULE_DESCRIPTION("ZTE common clock driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/zte/clk-zx.h b/drivers/clk/zte/clk-zx.h
new file mode 100644
index 000000000000..8137185f497f
--- /dev/null
+++ b/drivers/clk/zte/clk-zx.h
@@ -0,0 +1,137 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+
+#ifndef __DRV_CLK_ZX_H
+#define __DRV_CLK_ZX_H
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+#define CLK_ZX_PLL_PREPARE_IS_ENABLE	1
+#define CLK_ZX_MAX_PARENTS		8
+
+enum zx_parent_type {
+	ZX_PARENT_FW,
+	ZX_PARENT_ID,
+};
+
+struct zx_parent_desc {
+	enum zx_parent_type		type;
+	union {
+		const char		*fw_name;
+		unsigned int		id;
+	};
+};
+
+#define PARENT_FW(_name) { .type = ZX_PARENT_FW, .fw_name = (_name) }
+
+#define PARENT_ID(_id) { .type = ZX_PARENT_ID, .id = (_id) }
+
+static inline struct clk_parent_data zx_get_parent(const struct zx_parent_desc *p,
+						   struct clk_hw * const *clocks)
+{
+	struct clk_parent_data ret = {};
+
+	switch (p->type) {
+	case ZX_PARENT_FW:
+		ret.fw_name = p->fw_name;
+		ret.index = -1;
+		return ret;
+
+	case ZX_PARENT_ID:
+		ret.hw = clocks[p->id];
+		ret.index = -1;
+		return ret;
+	}
+
+	WARN_ON_ONCE(1);
+	return ret;
+}
+
+struct zx_pll_desc {
+	const char			*name;
+	const struct zx_parent_desc	*parents;
+	unsigned int			num_parents;
+	unsigned long			rate;
+	u16				reg;
+	u16				flags;
+};
+
+struct zx_fixed_divider_desc {
+	const char			*name;
+	struct zx_parent_desc		parent;
+	unsigned int			div;
+};
+
+struct zx_mux_desc {
+	const char			*name;
+	const struct zx_parent_desc	*parents;
+	unsigned int			num_parents;
+	u16				reg;
+	u8				shift, size;
+};
+
+struct zx_div_desc {
+	const char			*name;
+	struct zx_parent_desc		parent;
+	u16				reg;
+	u8				shift, size;
+};
+
+struct zx_gate_desc {
+	const char			*name;
+	struct zx_parent_desc		parent;
+	unsigned long			flags;
+	u16				reg;
+	u8				shift;
+};
+
+enum zx_clock_type {
+	ZX_CLOCK_INVALID = 0,
+	ZX_CLOCK_PLL,
+	ZX_CLOCK_FIXED_DIV,
+	ZX_CLOCK_MUX,
+	ZX_CLOCK_DIV,
+	ZX_CLOCK_GATE,
+};
+
+struct zx_clock {
+	enum zx_clock_type type;
+	union {
+		struct zx_pll_desc pll;
+		struct zx_fixed_divider_desc fixed_div;
+		struct zx_mux_desc mux;
+		struct zx_div_desc div;
+		struct zx_gate_desc gate;
+	};
+};
+
+struct clk_hw *zx_clk_register_pll(struct device *dev, struct regmap *regmap,
+				   const struct zx_pll_desc *desc,
+				   struct clk_hw * const *clocks);
+struct clk_hw *zx_clk_register_mux(struct device *dev, struct regmap *regmap,
+				   const struct zx_mux_desc *desc,
+				   struct clk_hw * const *clocks);
+struct clk_hw *zx_clk_register_divider(struct device *dev, struct regmap *regmap,
+				       const struct zx_div_desc *desc,
+				       struct clk_hw * const *clocks);
+struct clk_hw *zx_clk_register_gate(struct device *dev, struct regmap *regmap,
+				    const struct zx_gate_desc *desc,
+				    struct clk_hw * const *clocks);
+
+struct zx_clk_data {
+	int (*init)(struct regmap *map);
+	const struct zx_clock *clocks;
+	unsigned int num_clocks;
+	const unsigned int *exports;
+	unsigned int num_exports;
+};
+
+int zx_clk_common_probe(struct device *dev, struct device_node *of_node,
+			const struct zx_clk_data *data);
+
+#endif /* __DRV_CLK_ZX_H */
diff --git a/drivers/clk/zte/pll-zx.c b/drivers/clk/zte/pll-zx.c
new file mode 100644
index 000000000000..fc76c6524a16
--- /dev/null
+++ b/drivers/clk/zte/pll-zx.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/regmap.h>
+
+#include "clk-zx.h"
+
+struct clk_hw *zx_clk_register_pll(struct device *dev, struct regmap *regmap,
+				   const struct zx_pll_desc *desc,
+				   struct clk_hw * const *clocks)
+{
+	return ERR_PTR(-ENODEV);
+}

-- 
2.55.0


