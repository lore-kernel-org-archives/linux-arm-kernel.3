Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED136CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 09:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y2sIITgEDWZdcO/sXZ85Mvn3hZAdFIIPOJDbEun6R/M=; b=Jpmin/BtjQDitUftz1hjwdQLFl
	luJiVRGgmAibfDXN5T7KH45KXStxvT5omRQhLYjwOYbDUtyhyv6KInEFYMAwIySQIctkY3UCJa7L8
	6EKfKXm6H/Y31W0qVdrLdzYfCRdu6cOwum/AFHN83rmx1va7SMAbNU/sO5zqBJkHHg0O8a0oDbbe3
	+OFYRUfuzHxqPad31ngd98Rywvu7N/mFOjWJ5onkHPms6BbecGtF5gILp+YeWk4vctmBsBx4rPA7L
	sK1hPXCBbVs2LiMUKU/4381MtOKjKuSa5ip1WNcPESQzhvWr++aHOoJsgB/HNA3cx2Xy4tU2xyDuK
	morszzXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyRek-00000007JPb-37OU;
	Tue, 16 Sep 2025 09:07:22 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyReh-00000007JOo-42Er
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 09:07:21 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45f2c9799a3so13500155e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 02:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758013638; x=1758618438; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y2sIITgEDWZdcO/sXZ85Mvn3hZAdFIIPOJDbEun6R/M=;
        b=B2aCllpmD4wZnyrkF6NRt8yKd5bPKKYceUGUVy59ElgK6ngmT9jZVIQhtBrJYq+KlP
         gn9NFJXuZNp5BaExkzEnYr5n8/hgtFUVM4E4kA+ETyPxMoguZT8M8c1nFPTnmuKUhVON
         3Sf8W57xtpKLTjbm9FygypfaFrd2nmXE3oUWu8cHl8JL7WOxSH8oTot6blRuFaZb76wx
         2l2JXjfbkiyLCoQAkA+FvMKVuhBxr7O2dftdjcnjdbNr6tX/Pg4PtNlCAj6UarVnM9tp
         3z+FsyVtTU/2cLIw9llZpwjn68M6WRbh+/m9dgCO1eyne7wL5AUcWHVqwe1MnIdZW1In
         6hmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758013638; x=1758618438;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y2sIITgEDWZdcO/sXZ85Mvn3hZAdFIIPOJDbEun6R/M=;
        b=pOGRIM1lscZDy350jYchDGqHq0mM5FUVsf53CgLdV+hvnPuOzs38i1ZgS0XehOm1Up
         kqgmrUGKUcv6s58DJepJW3idIfg12Owk84lOu86pk86e0Mc7nfEFhkwDn5B3PSBrskBS
         KRhPmquwrmO5NXPuWagq1JoenKg0PuF6Pv634ucWCDiQyeGpbDo57z5+QvzWQOCaQODw
         FBR41f6Nw432USVlcao86vqN4gdjQrUJeNiTXshGjAROzwvtC7TMhSg3a00E2WffH//Y
         O/j4aaQ5XXNJA2mM6msQOXYj1FhPyqBOvngZKtlApFLQWMA33MHTu/W93e5Fp7nOclhM
         S3kg==
X-Forwarded-Encrypted: i=1; AJvYcCUx3PhkGK3euMX+8Qw/00Gn04KWPMM1wKJmIIuPNv4S34PjihsGe8mJy0d4Senq1lgfpjHLzYzDHVsnmRQSc+63@lists.infradead.org
X-Gm-Message-State: AOJu0YyTrqYX4o6IFoftSdV1UpgtCqxsslxPsoXi10IqdOIff7Z2Z7Au
	Aa5HolO3sFpvEnWd828AcUixb4DNFRNmEHr5FHxO0gzxwJSewVSYadGwhluRtQ==
X-Gm-Gg: ASbGncuMCsS6md+WH3uwGVyR5QSsBrEhpuQkk7o5Xar80ELeR6B/2plR+FJRysb9npK
	j6h1ndKTHrdU6PHFuC7IIauNCmnKqaLqmYkwlTDEOQWeXyp4rajsdWzL458eIhls9x2xGyQEkt4
	6abAnydJcPt2m4eVLfQvOP1MBZmbvMc9V0NQwDZge+0SYAx8dTr+eVI3CjlEnCRsV+kT/bMavWv
	59CAT2QAD3e4L5e2+bxtUnYgSBP7i66qfIAVKpy4SQKcjzFn8jlllxHSUXT4XPcqLvhnwASmojX
	RtxitLyQiK+SkwIzNONSkVSmwE56ybyBB6JVfrDIx3J7TWtWRGtHdtE1E6dL9hAvzasc2zBWiKf
	NPtynyVwPNi+62umSSChjBoxj8AFteu3HeReiRXTX1F1Zj0AnOJldkkDcol1aEi5hR2c1ao2B9f
	g5ZgtYVcbxp46oSBqsODiwNjigcws=
X-Google-Smtp-Source: AGHT+IEuR5WQEBjj4/xvD5G9A1WwnGivKz0/sMVmdKU1XiTsdSofMByYMjzCbnjKIX3aOCcY/494jg==
X-Received: by 2002:a05:600c:1992:b0:456:fc1:c26d with SMTP id 5b1f17b1804b1-45f211c8437mr129293605e9.2.1758013637683;
        Tue, 16 Sep 2025 02:07:17 -0700 (PDT)
Received: from localhost (2a02-8440-7509-4cd6-9055-f88b-940e-15eb.rev.sfr.net. [2a02:8440:7509:4cd6:9055:f88b:940e:15eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f32081248sm15568305e9.0.2025.09.16.02.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 02:07:17 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 16 Sep 2025 11:07:10 +0200
Subject: [PATCH v7] bus: firewall: move stm32_firewall header file in
 include folder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250916-b4-firewall-upstream-v7-1-6038cf1e61d8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAL0oyWgC/x3MSQqAMAxA0atI1ga0WK1eRVxUTTXgROoE4t0tL
 t/i/wc8CZOHKnpA6GTP6xJQxBF0o10GQu6DQSVKJ2WaY5uhY6HLThMem9+F7Iy9I6ONsSp1BkK
 6CTm+/23dvO8HXeR4NGYAAAA=
X-Change-ID: 20250916-b4-firewall-upstream-dfe8588a21f8
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
X-Mailer: b4 0.15-dev-dfb17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_020720_024561_2F973609 
X-CRM114-Status: GOOD (  13.49  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

Other driver than rifsc and etzpc can implement firewall ops, such as
rcc.
In order for them to have access to the ops and type of this framework,
we need to get the `stm32_firewall.h` file in the include/ folder.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
This v7 is a subset of the v6 and other prior versions, splited to simplify
the review and merging process.

Changes in v7:
- None
- Link to v6: https://lore.kernel.org/all/20250909-b4-ddrperfm-upstream-v6-1-ce082cc801b5@gmail.com/
---
 drivers/bus/stm32_etzpc.c                       | 3 +--
 drivers/bus/stm32_firewall.c                    | 3 +--
 drivers/bus/stm32_rifsc.c                       | 3 +--
 {drivers => include/linux}/bus/stm32_firewall.h | 0
 4 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/bus/stm32_etzpc.c b/drivers/bus/stm32_etzpc.c
index 7fc0f16960be..4918a14e507e 100644
--- a/drivers/bus/stm32_etzpc.c
+++ b/drivers/bus/stm32_etzpc.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/bus/stm32_firewall.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -16,8 +17,6 @@
 #include <linux/platform_device.h>
 #include <linux/types.h>
 
-#include "stm32_firewall.h"
-
 /*
  * ETZPC registers
  */
diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
index 2fc9761dadec..ef4988054b44 100644
--- a/drivers/bus/stm32_firewall.c
+++ b/drivers/bus/stm32_firewall.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/bus/stm32_firewall.h>
 #include <linux/bus/stm32_firewall_device.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -18,8 +19,6 @@
 #include <linux/types.h>
 #include <linux/slab.h>
 
-#include "stm32_firewall.h"
-
 /* Corresponds to STM32_FIREWALL_MAX_EXTRA_ARGS + firewall ID */
 #define STM32_FIREWALL_MAX_ARGS		(STM32_FIREWALL_MAX_EXTRA_ARGS + 1)
 
diff --git a/drivers/bus/stm32_rifsc.c b/drivers/bus/stm32_rifsc.c
index 4cf1b60014b7..643ddd0a5f54 100644
--- a/drivers/bus/stm32_rifsc.c
+++ b/drivers/bus/stm32_rifsc.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/bus/stm32_firewall.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -16,8 +17,6 @@
 #include <linux/platform_device.h>
 #include <linux/types.h>
 
-#include "stm32_firewall.h"
-
 /*
  * RIFSC offset register
  */
diff --git a/drivers/bus/stm32_firewall.h b/include/linux/bus/stm32_firewall.h
similarity index 100%
rename from drivers/bus/stm32_firewall.h
rename to include/linux/bus/stm32_firewall.h

---
base-commit: 46a51f4f5edade43ba66b3c151f0e25ec8b69cb6
change-id: 20250916-b4-firewall-upstream-dfe8588a21f8

Best regards,
--  
Clément Le Goffic <legoffic.clement@gmail.com>


