Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD742C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 07:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CGtEOhOpR/1OiCj9qufh1O1atPkJph2JTGUTc+kCL1E=; b=xhTbLkmUzT5/fO1aZAET9m2I/y
	LbZbqqhpmWLlzGXZUVBTknP90VWP/+XnMOWIMgaOHQZMYQDyQUoQxsxyAu45PzAjLfIsroKoVXmbH
	E8k2a6umO934WeXEioNHFesR0arTRPPLAdZWdEavTm4EW10y6Ir6/xhBsNE/POds2oZ8K1nBn670C
	OrBrhfJN2Qv+nmiiRZjGS9ZSgDJpI/2s7EDVyJ/Yl3Qyu++iUBpl5N9HJ95ffrrbJSc4tQhcuh1Aw
	RDaJWhK57pCqEJwsFTtmwyJw9I3S4lrvfgjH8qOyTCaLkZRLeSAF9xpE6qGi0VwQS6Irhol2YRck8
	PHhuiS4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5Iq-00000008hmf-1XjO;
	Tue, 21 Jul 2026 07:54:12 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5In-00000008hkO-3ENE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 07:54:11 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2ce7d2adef4so109583475ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 00:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784620449; x=1785225249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CGtEOhOpR/1OiCj9qufh1O1atPkJph2JTGUTc+kCL1E=;
        b=TmHAwahBFfigPThzMjDusMftJxNVhU7Ts94TY7v+66wr5cQwLTP+QBIGr83I+QfunN
         0qyd1E3nY4nUbra2OcoBEPdEpb6oBsjTrfjORnX2SmSPOLnJRj6vpjx6O7vwbMbezt12
         RGzV61S1+Ii48Iobu2Heb4NoGQwCQ05hMyhm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620449; x=1785225249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CGtEOhOpR/1OiCj9qufh1O1atPkJph2JTGUTc+kCL1E=;
        b=T4YL9ASsyfJ3ntIJ1v9kC7yTsJywEzfJiClXqfgmkCZh47PuWJDXlO8uqQHhYKISMs
         E1MSXNqvx8TtLtC+6EIyBNMFGpdOVkEb+CV+xJD8tLXiXCu2Ua3pGi5eJRXd43KBMip2
         nxzbEGq5UogpW7eP0tOiHa7xhBY1HBO4hfXBjBm+PIfxLCV1Fhgr8gJWpWC4bBcsOVzv
         7ZEJTbDct3+yAIEl3tVi1fmuOQdUGf1eMhpL78oyHKvpu6XaBqJRxOy8vSm/4/b5eDRb
         AFhmpEqaHCZWotI0P/bA+Q7y0Bqv+g9t3jR+G+5c2Da/FNBd1/gTa3oolzAEdYS+l/4h
         3vyA==
X-Forwarded-Encrypted: i=1; AHgh+RqnyOw8FWR7WD+xEIQzqV56bHcfOKkFA25ZPRMve3Sd5LttsvXbNRfn5nsk1AUQy7/4xk7dcdCJUf2SD7+OWbrh@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk8rwGjC0uPu2WtSxcALyu/aiFeIw8AT4ZAYlC+0xXt+1aswqk
	MBgP0XOcFGOQKyAdxtuTZXzbPpYrdTNzKJRzpJGfhiH4LoNOucI3f1xfjZEWYb/o5w==
X-Gm-Gg: AR+sD10E33BhGD6k/l9NuGlOUQOMh68E992HHOF01GPQCkVeNN8MAy9AL1WNzUZ4rK1
	TYukGGWyo5Fgv3ZYM7eDLgxE/Hlzale5xs2nVo/5DI+Riq6JQ0R+i2Azm2tyzSaoU01SqYTfXA/
	ttMdgfVb3eZGNBQiMn/dWjywQfJQTNGsqTsIgbD3q27czVM1DZhiysh8AYYxRrJpFf91wlfd+kN
	F8cT0/Roh6tSpQNTc/Ofd8clCayK7IDMTGZxvrZfeHpD82w1hwxv9d8Rro5EqAocCT6aZ2IqPX/
	cqaEXhnOv1OxylRyXEWJzaC+4ojbZjinYKbV955dBbD7KERA2zZnfqogH23rhSePQzlYh0HBHlV
	Nd8fqi2J2k1bIdhIQA2hq4Gn4LOQevhLy0jRjIfRrKYLPEIu4SvPv4P21FG25dsr9u8e8+mQ52T
	2jlVzsTBe6TL7zTgcr7nnginRy3S70KUfNHIVvv7dbsIiIUqc++gdzyZv3BdU=
X-Received: by 2002:a17:902:e748:b0:2c1:98b7:ecf3 with SMTP id d9443c01a7336-2cf3494aebdmr189718205ad.23.1784620449012;
        Tue, 21 Jul 2026 00:54:09 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f705sm70724175ad.15.2026.07.21.00.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:54:08 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/9] Input: elan_i2c - sort include statements
Date: Tue, 21 Jul 2026 15:52:16 +0800
Message-ID: <20260721075226.2347933-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721075226.2347933-1-wenst@chromium.org>
References: <20260721075226.2347933-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_005409_837125_99271FBA 
X-CRM114-Status: GOOD (  12.39  )
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

Sort the include statements before adding new ones in the next change.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- New patch
---
 drivers/input/mouse/elan_i2c_core.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index f93dd545d66b..9f024a435dbf 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -16,27 +16,27 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/firmware.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
+#include <linux/input.h>
 #include <linux/input/mt.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/module.h>
-#include <linux/slab.h>
-#include <linux/kernel.h>
-#include <linux/sched.h>
-#include <linux/string_choices.h>
-#include <linux/input.h>
-#include <linux/uaccess.h>
 #include <linux/jiffies.h>
-#include <linux/completion.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pm_wakeirq.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/string_choices.h>
+#include <linux/uaccess.h>
 #include <linux/unaligned.h>
 
 #include "elan_i2c.h"
-- 
2.55.0.229.g6434b31f56-goog


