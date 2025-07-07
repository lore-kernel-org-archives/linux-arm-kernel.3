Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE937C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 10:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XFK9CGANpFb6qlTeThT0DwZIyre/1tnyiYdjSQY76dQ=; b=gAryKGwMvIZ85CFkizmSw6MjjE
	v4SLDK4hQtAYDyoODM2WMgLvOUKYHn+5CDeSGFmksVdNrer4zv1owGatfo5EEfXfyyII8oShwU+4C
	SfNJfWCRWzTGWeIn7Q7opgk1WGlUzq6hIAtCXaxbE233tzMEps7usjT5H/LVKVkxTheKC35kMSYsP
	W69pNeKboui4JnqPkLygX601SaxMl0+BnauamlExhQpbsn7DemTp370JmpcRhiyYrUmjRLE3BgaDc
	KEEpQY6RqGiGWbVvkr67FENyYX+oRO3ftjI3xxdfBElmA1iyNyWCV3L1cBb1dKtMOWLWsbRKo32QB
	BGy3Aueg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjD3-00000002AtW-3Rdz;
	Mon, 07 Jul 2025 10:36:29 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiZr-0000000244X-2EK4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 09:56:00 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so32497485e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 02:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751882158; x=1752486958; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XFK9CGANpFb6qlTeThT0DwZIyre/1tnyiYdjSQY76dQ=;
        b=hNYYBRByraejp0mz+WGXyJ5HMQNDsaKBats6PahuMVypG/CTPrG5lbGr+GpAlVr03k
         6Y27dQDFde0vxGQSmNoELbTN+vBznP2NaxvE5jSngCDuGQEER/+0TD69L7JaUjnto9m9
         s8aPrHCfTs9p80493uTLAOAzUJy/83DTB6YXpco8m6xseW/peUPXTtOogM74JAf0JBlz
         rv46ocds2Vzx5CqFUQezr3jIua5U1EMSJfCBnbc2kqycc5A5baRoljGPaaUjvhHmf2gk
         +nKMt0HAj97OWXlriKSq0KQfb790ZgaZjeELkzWod7M+0r/xGCXuaUSwXYbKSll+Mr8e
         f1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751882158; x=1752486958;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XFK9CGANpFb6qlTeThT0DwZIyre/1tnyiYdjSQY76dQ=;
        b=iKtfVCdMBtiEHyOHdJYH9DVBrTS/9CI9ML+083hIz4mlO9U7QPLsMEyC4Hmv50K125
         VgW/scABQephvF4FZ8gkzu/+ig5CTiXVbJXMGYHVHrClQ7hIYzXEPoCe9U5Hk08czTzB
         jUuZYAZZC6+kWbty9Vc29d5/zaPVjIsjiC66msdlRECMjJN2ry2UrsXGteIq0H7BteIR
         YXoU4DNPzDplyNAW3sewdyw2GM/Ux6XBtFtit/teroy20oOy2ygfxr2AKoKSj66KBDtC
         JoqPrCaV3yxMqlxKHr8IEYkh3996VLt51p6Vo8Q8YLf1Q7SlgWN1xTqGtmd4qwQFbDdu
         +vAw==
X-Forwarded-Encrypted: i=1; AJvYcCW4b8lVjBt+FKlzmmWmw2idjOM+xEp+3t56nbyOGBO0JXMZHxesHIizVChRc/H0H40rSS2s1UaohCTnR74oYN4r@lists.infradead.org
X-Gm-Message-State: AOJu0YyZhGQvxvYE8WLhr6tlwppqmeKRBg6VL0rGiNC4VjRkBEpIKXHC
	hvMe0BoDzOylMNiWp1RFZjE2yBsayW2x/PxSZ4gDy0HqsN14HCDqTsq9xXS2bmK3mmQ=
X-Gm-Gg: ASbGnctSBik89zMo2g1csDQqz9/YCwQjyn6sOnevTY7lseLEd/8FaQ/RgeE55V1kywR
	HKLsCuNmmcmA0DpkZM0RvsXci6un9sreH369N+LC+1upbbNw80WlY49wk/hnlIaaNSeOxE8Vv8P
	a8t3sGWwUDFdC8wOSxJmhimlRm/YNT06E0J/5zscZUrBqGaQNSa9Id0NCS9BN6/3N1z23XBzqIQ
	XPSlcb43FZlrFbjxUbXraBlJlndzXnsvqGtmCG4eDpNG95N2h/9TOTAy0JzfJT9DtTuuZeih1k2
	Hs9fn5UOTiC+Hyov7YWl9yXB9poeIPt1HlKq7czlBJOIvoql4T+Y0u7Kr6aSQNVAENPW1Vg=
X-Google-Smtp-Source: AGHT+IHrp6i6CjW0J0hqro//S7APuf2A8nxf/qPiQQ/JN5ARtQAbdWL7Q7Mj0NHZUV2exYC6za6wrQ==
X-Received: by 2002:a05:600c:3b95:b0:454:ad94:4b3d with SMTP id 5b1f17b1804b1-454cb768c35mr1610785e9.1.1751882157640;
        Mon, 07 Jul 2025 02:55:57 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9beb22asm136617625e9.36.2025.07.07.02.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:55:57 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 07 Jul 2025 10:55:27 +0100
Subject: [PATCH] coresight: Fix missing include for FIELD_GET
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-james-coresight-bitfield-include-v1-1-aa0f4220ecfd@linaro.org>
X-B4-Tracking: v=1; b=H4sIAI6Za2gC/x3NywqDMBBG4VeRWXcgxhv1VUoXmvzRERslY0tBf
 PeGLr/NOScpkkCpL05K+IjKFjPKW0FuHuIEFp9N1tjGdKbjZXhB2W0JKtN88ChHEKyeJbr17cG
 m8mUdmqq9B0s5sycE+f4Xj+d1/QAcuFN9cgAAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Naresh Kamboju <naresh.kamboju@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Linux Kernel Functional Testing <lkft@linaro.org>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_025559_577100_2B9C58DA 
X-CRM114-Status: GOOD (  11.22  )
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

Include the header for FIELD_GET which is only sometimes transitively
included on some configs and kernel releases.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Closes: https://lists.linaro.org/archives/list/lkft-triage@lists.linaro.org/thread/6GKMK52PPRJVEYMEUHJP6BXF4CJAXOFL/
Fixes: a4e65842e114 ("coresight: Only check bottom two claim bits")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c        | 1 +
 drivers/hwtracing/coresight/coresight-etm4x-core.c  | 1 +
 drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 1 +
 drivers/hwtracing/coresight/ultrasoc-smb.h          | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fa758cc21827..c2db94f2ab23 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2012, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/bitfield.h>
 #include <linux/build_bug.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 42e5d37403ad..cbea200489c8 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/kvm_host.h>
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index ab251865b893..e9eeea6240d5 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -4,6 +4,7 @@
  * Author: Mathieu Poirier <mathieu.poirier@linaro.org>
  */
 
+#include <linux/bitfield.h>
 #include <linux/coresight.h>
 #include <linux/pid_namespace.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/hwtracing/coresight/ultrasoc-smb.h b/drivers/hwtracing/coresight/ultrasoc-smb.h
index c4c111275627..323f0ccb6878 100644
--- a/drivers/hwtracing/coresight/ultrasoc-smb.h
+++ b/drivers/hwtracing/coresight/ultrasoc-smb.h
@@ -7,6 +7,7 @@
 #ifndef _ULTRASOC_SMB_H
 #define _ULTRASOC_SMB_H
 
+#include <linux/bitfield.h>
 #include <linux/miscdevice.h>
 #include <linux/spinlock.h>
 

---
base-commit: 408c97c4a5e0b634dcd15bf8b8808b382e888164
change-id: 20250707-james-coresight-bitfield-include-03d14f5369f2

Best regards,
-- 
James Clark <james.clark@linaro.org>


