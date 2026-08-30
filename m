Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7BAC61DEB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 20:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6iIJc+JZr8i9K13XntVmTSW3J5JcrFURYXAYLELlc7U=; b=TEhsGlK/sNaeeY6ACOA/hfhDXb
	LuMis94IvAqB45/YtZ+Hh6FJi8CV76iwAKOpLkloIRpEisFES/rgRsIiknLbZ4SgZVAOHWeOl7a9M
	M/TCacMh8gPiJJ8uuVLJbb2loEDCtMdfzjqa5HEp++HFQF8iss9dNsntJn3LXXSxszJbBKOygTAgQ
	IuDNYHbcPSihJibuLkcRyK78nM03y0FGlxyY2YfyRS+lciMdlcfxn6YecfdHSQ0T7gTifkH4nVAny
	lP6m10AAdytFu4ZbTDKWz+Oz4r4CgLIiFchLkpM9bxXAHn2TU5McbawqUhf0O6tVUoUypZOdXzCZ0
	pVVzL4lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0m1R-000000083x6-2qQQ;
	Sun, 30 Aug 2026 20:20:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0m0H-000000082pU-2HKs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 20:19:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F0DE43F26;
	Sun, 30 Aug 2026 20:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DB111C4AF4D;
	Sun, 30 Aug 2026 20:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788121184;
	bh=yLZzvweLjoBBYhWj4yAiYhV53Thr+IzutEkoNWzH/mU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=K5IQo6/2KjiuDg4JiKaO9StPJ7B7aoYzgwk/rfs+zrHztkVJv44jUt0USKxcf63ze
	 cWEsQ4V/hzoVag43lvJb0mAml0DBTeZzRuND+joF38FoYz8HtG5/z0Cp0cqEQ6YSzO
	 5WFgmHk5U591YYIo2J/W3I8JL3XX4eZnXuoorsWghsgyyWPhbLeIin47i/ZZR4zUlr
	 AWud6SQj4rWMT82M9NxEW8Uy8IhiDoEWE4BsHLrVyAxkZkLnaTKzkm1bjNPnu01kkt
	 oXuvDVxiMuY7UXMHOil9+5fRJZSpDx6LXxZ+EPDyyL1gjfwtXCs3t1zqenwSmW3eZQ
	 SSXtkwv30TP0Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3940C61DF0;
	Sun, 30 Aug 2026 20:19:44 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 30 Aug 2026 22:19:33 +0200
Subject: [PATCH 15/19] thunderbolt: Export symbols required by the Apple
 Silicon driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-b4-apple-soc-tbt-v1-15-44bc9348683c@kernel.org>
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
In-Reply-To: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3480; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=yLZzvweLjoBBYhWj4yAiYhV53Thr+IzutEkoNWzH/mU=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9aUCVGxa+/vjl/00ytg7Ty7ZUkmM0LkbPpUQ41LnwrW9
 38NX7C7o5SFQYyLQVZMkWX7fnvTJw/fCC7ddOk9zBxWJpAhDFycAjARtxqG/6X8P3eYqC1OmNtf
 eCrcdPU+yfiVH33cd1a6Lp7p9Jztvysjw67stwyKu+ID5Z/zzDBL2H3v9amI6cwLNledCeHdH/p
 EjA8A
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

The driver for the ACIO host router complex on Apple Silicon SoCs can
be built as a module and needs tb_probe() and the domain functions to
register its NHI with the software connection manager as well as
tb_switch_find_vse_cap(), tb_cfg_write() and tb_port_unlock() to
configure the cable details for its co-processor and to unlock the
lane ports. Restrict these exports to the thunderbolt_apple module to
keep them internal to the Thunderbolt subsystem.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/thunderbolt/cap.c    | 2 ++
 drivers/thunderbolt/ctl.c    | 2 ++
 drivers/thunderbolt/domain.c | 2 ++
 drivers/thunderbolt/switch.c | 1 +
 drivers/thunderbolt/tb.c     | 2 ++
 5 files changed, 9 insertions(+)

diff --git a/drivers/thunderbolt/cap.c b/drivers/thunderbolt/cap.c
index 4ab22d5291ac..e000a53e5e75 100644
--- a/drivers/thunderbolt/cap.c
+++ b/drivers/thunderbolt/cap.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2018, Intel Corporation
  */
 
+#include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/errno.h>
 
@@ -254,3 +255,4 @@ int tb_switch_find_vse_cap(struct tb_switch *sw, enum tb_switch_vse_cap vsec)
 
 	return -ENOENT;
 }
+EXPORT_SYMBOL_FOR_MODULES(tb_switch_find_vse_cap, "thunderbolt_apple");
diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index cd47b627f97b..b2a6b300e934 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -8,6 +8,7 @@
 
 #include <linux/crc32.h>
 #include <linux/delay.h>
+#include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/pci.h>
 #include <linux/dmapool.h>
@@ -1159,6 +1160,7 @@ int tb_cfg_write(struct tb_ctl *ctl, const void *buffer, u64 route, u32 port,
 	}
 	return res.err;
 }
+EXPORT_SYMBOL_FOR_MODULES(tb_cfg_write, "thunderbolt_apple");
 
 /**
  * tb_cfg_get_upstream_port() - get upstream port number of switch at route
diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index 12c88509a54f..477a64258b87 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -490,6 +490,7 @@ int tb_domain_add(struct tb *tb, bool reset)
 
 	return ret;
 }
+EXPORT_SYMBOL_FOR_MODULES(tb_domain_add, "thunderbolt_apple");
 
 /**
  * tb_domain_remove() - Removes and releases a domain
@@ -514,6 +515,7 @@ void tb_domain_remove(struct tb *tb)
 
 	device_unregister(&tb->dev);
 }
+EXPORT_SYMBOL_FOR_MODULES(tb_domain_remove, "thunderbolt_apple");
 
 /**
  * tb_domain_suspend_noirq() - Suspend a domain
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index ef267f40c103..db675e4f0bc2 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -627,6 +627,7 @@ int tb_port_unlock(struct tb_port *port)
 		return usb4_port_unlock(port);
 	return 0;
 }
+EXPORT_SYMBOL_FOR_MODULES(tb_port_unlock, "thunderbolt_apple");
 
 static int __tb_port_enable(struct tb_port *port, bool enable)
 {
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 7ab53a30fe30..6a1f49c473eb 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2019, Intel Corporation
  */
 
+#include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/errno.h>
 #include <linux/delay.h>
@@ -3442,3 +3443,4 @@ struct tb *tb_probe(struct tb_nhi *nhi)
 
 	return tb;
 }
+EXPORT_SYMBOL_FOR_MODULES(tb_probe, "thunderbolt_apple");

-- 
2.55.0



