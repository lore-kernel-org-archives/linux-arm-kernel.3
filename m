Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36308C54FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 13:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i4yPDqsLK7jiGH7o4kkVFUcIshokTB9S3yEpFG3icdI=; b=EwKLIYWpEGEphX9D8Pg/luTnRi
	6LLR71jqgEGUenyUFIYQ3ImSlmZjKJZEW0rFXaVkMh0B/V370MxFsRlId0oLdlBGLX0eNvc8j+uQO
	QGZU5YEFUTiUSVJ8wG4bZoEa1VJLsLpL1EcR4wE9wJfPJ2bIg2ihyjMpJSxJkFvhYUuN1uSoDKAEY
	9XeJnD2NFbkN+LA13ogrk5Ka1uxvgIPFPKrM5wr1vhbgPuDdwZnBU+SoiIYXpdDbkhTqAZaluBbev
	m4CV+TvmOF75uSNz9hB5eO9FzS8bO9AxEmwP8H/E4cqavSE3cktQ/nGMS1euh5h7pBlbwi+thPi78
	sKIBFh3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQmd-0000000EYux-0NEg;
	Fri, 20 Feb 2026 13:43:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtQmW-0000000EYr7-3heL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 13:42:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9128F15A1;
	Fri, 20 Feb 2026 05:42:49 -0800 (PST)
Received: from e134710.arm.com (e134710.arm.com [10.33.10.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2CABF3F7D8;
	Fri, 20 Feb 2026 05:42:54 -0800 (PST)
From: Ahmed Tiba <ahmed.tiba@arm.com>
Date: Fri, 20 Feb 2026 13:42:20 +0000
Subject: [PATCH v2 02/11] ACPI: APEI: GHES: add ghes_cper.o stub
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-2-347fa2d7351b@arm.com>
References: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-0-347fa2d7351b@arm.com>
In-Reply-To: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-0-347fa2d7351b@arm.com>
To: devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
Cc: Ahmed Tiba <ahmed.tiba@arm.com>, Dmitry.Lamerov@arm.com, 
 catalin.marinas@arm.com, bp@alien8.de, robh@kernel.org, rafael@kernel.org, 
 will@kernel.org, conor@kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, krzk+dt@kernel.org, Michael.Zhao2@arm.com, 
 tony.luck@intel.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771594970; l=1802;
 i=ahmed.tiba@arm.com; s=20260219; h=from:subject:message-id;
 bh=N1f4SRYezXSa/uMOQEX8DB2+1/M96GssxRQ1Pvuw15I=;
 b=/FmPQ9RSvf87rZnccFSFp7h8u0bqVpfz2+RjrpY8dLLsykFUXp2Yuy8NV1lzS63ivedYqXewj
 VybkwdzdWuaCXN+lOuUYGpIrfPUYfz3u094l+axdSkycWzHlHDAEAKh
X-Developer-Key: i=ahmed.tiba@arm.com; a=ed25519;
 pk=xVOtd+Qklh/4tuM3tB+BEZD4jj5a6W59C3KCNX6v7OE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_054256_965927_04C80BEC 
X-CRM114-Status: GOOD (  11.54  )
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

Introduce a dedicated ghes_cper translation unit so that follow-on commits
can move helpers out of ghes.c without touching the build logic twice.
This keeps the object in the tree while remaining functionally identical.

Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
---
 drivers/acpi/apei/Makefile    |  2 +-
 drivers/acpi/apei/ghes_cper.c | 26 ++++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/apei/Makefile b/drivers/acpi/apei/Makefile
index 1a0b85923cd4..b3774af70883 100644
--- a/drivers/acpi/apei/Makefile
+++ b/drivers/acpi/apei/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_ACPI_APEI)		+= apei.o
-obj-$(CONFIG_ACPI_APEI_GHES)	+= ghes.o
+obj-$(CONFIG_ACPI_APEI_GHES)	+= ghes.o ghes_cper.o
 # clang versions prior to 18 may blow out the stack with KASAN
 ifeq ($(CONFIG_COMPILE_TEST)_$(CONFIG_CC_IS_CLANG)_$(call clang-min-version, 180000),y_y_)
 KASAN_SANITIZE_ghes.o := n
diff --git a/drivers/acpi/apei/ghes_cper.c b/drivers/acpi/apei/ghes_cper.c
new file mode 100644
index 000000000000..63047322a3d9
--- /dev/null
+++ b/drivers/acpi/apei/ghes_cper.c
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *
+ * APEI GHES CPER helper translation unit - staging file for helper moves
+ *
+ * Copyright (C) 2026 ARM Ltd.
+ * Author: Ahmed Tiba <ahmed.tiba@arm.com>
+ * Based on ACPI APEI GHES driver.
+ *
+ */
+
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mm.h>
+#include <linux/ratelimit.h>
+#include <linux/slab.h>
+
+#include <acpi/apei.h>
+
+#include <asm/fixmap.h>
+#include <asm/tlbflush.h>
+
+#include "apei-internal.h"
+
+/* Helper bodies will be moved here in follow-up commits. */

-- 
2.43.0


