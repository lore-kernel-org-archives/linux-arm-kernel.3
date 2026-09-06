Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F78C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 18:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+mcky16Jqg1M8MPgGALXNgo6XVhGv2nPzHDfluAtBE=; b=a4vXGYcOI8j+iZ/2xGglotM9Fq
	69Ou0SDln1YBIWCyZ/D0DrKqrZE9+uXB2bBsQOHItHF64ZCHaeXgrd+v0hCO4fBbLhGC2+NZ6YPRe
	EzCLnd1UfxMMqVsM7EkIoClv/R9OQscD9anmbxv4NR8kXdipnfcgaOeBrku8J8Zj1R5GC4HMEG6zR
	KeT8MkSi+Npn145Ot1SixJ7QJXMyf6HnBzPbmkpWnFhRvua79Pc/NM7haS4mS8dbpZUDWgpI6wDke
	rPDIcu/5L3WIoDdugBYSISFhIJHGZLbU2b+h29k7nDxww2kB8KbOpdSun/sniOuMy22HCu8YmlDDC
	pz4zWlDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Hk5-00000005RPg-17Hu;
	Sun, 06 Sep 2026 18:37:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Hjp-00000005Qzg-0vbw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 18:37:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 85EE144862;
	Sun,  6 Sep 2026 18:37:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 649D6C2BCF5;
	Sun,  6 Sep 2026 18:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788719828;
	bh=McNohOokOZvCOPztdqrD6IMpQ2o/cc6SdtnvvgnHzSA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Q/UnS1vr+6JQD2oEo34N1k8+dCAMqvk6igMeNbpF9zEoBKo57y2ahC98zkgUxLrou
	 FV63WgWHm+hw4qXeXxylUaLUND2TzSset5FPZLZSKXegwnVs4XkpxR3k9wSDGSOmN+
	 Gisv7w9BAcsFermdN66ptpK+oPsLn0/BrdgYOF1LdPObqO0/Sz4j+4wNC94I93X+Py
	 i12qPLap1f3GSqso+jlXncRLgP2bVua3MWFagrECETr5vSawMWyDjtzc1MeRMDX588
	 RrNqkMv3pZy4kA5A7xLTKOzAI2nT9zEay3HNlDyQZGUcrEnFZYJnFu8fIJTvIM24+z
	 mfS/4sSczpu6g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA71C79FA1;
	Sun,  6 Sep 2026 18:37:08 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 06 Sep 2026 20:36:41 +0200
Subject: [PATCH v2 18/22] thunderbolt: Export symbols required by the Apple
 Silicon driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-b4-apple-soc-tbt-v2-18-1f80085f93fb@kernel.org>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>, Joshua Peisach <jpeisach@ubuntu.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2413; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=McNohOokOZvCOPztdqrD6IMpQ2o/cc6SdtnvvgnHzSA=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9bcTSdZK8S/HbugNl+Wt8oy+XhEgu36p59+sgc2Luk42
 n5kQUxGRykLgxgXg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAieyMZ/ie2ml3ZlrJ4+v4H
 pqWaHcd0vlcsSLD9xbDnAvsfm3StyXIM/5PSy6yEY2/IPpeY/aXQR9B4fnjydL0gYzct5a+6O4K
 7mAE=
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
tb_cfg_write() to configure the cable details for its co-processor.
Restrict these exports to the thunderbolt_apple module to keep them
internal to the Thunderbolt subsystem.

Signed-off-by: Sven Peter <sven@kernel.org>
Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
---
 drivers/thunderbolt/ctl.c    | 2 ++
 drivers/thunderbolt/domain.c | 2 ++
 drivers/thunderbolt/tb.c     | 2 ++
 3 files changed, 6 insertions(+)

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
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 72418a07166e..98bf67360cc4 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2019, Intel Corporation
  */
 
+#include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/errno.h>
 #include <linux/delay.h>
@@ -3440,3 +3441,4 @@ struct tb *tb_probe(struct tb_nhi *nhi)
 
 	return tb;
 }
+EXPORT_SYMBOL_FOR_MODULES(tb_probe, "thunderbolt_apple");

-- 
2.55.0



