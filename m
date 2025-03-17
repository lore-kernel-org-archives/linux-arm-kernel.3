Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1538C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 09:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+FYeznGF05qGpks00rXyInbtPfAnR/GvyHPNTPLvUWs=; b=VwGFf2B7YAPk7BVkR5QAG800iU
	3lT9e+N0zxQ5Z2z27wMwCCinznpma3Nc6kZQboDasidZ1YBcC5NKFFtvxh4O/r+r/Vyt/9M1MwLOd
	D7lgF2G+58naOkQjJbPi3hzTA63ndGDZn3A1sQr0wxvrAT3wKcz/36sVsqeB2xH8taka7l5E09QI+
	Jay/5BEvCMf8ldPJeR0+ukx40F7QoTw7SKBpkhzx2n64Wm5TFq1K4W18grlb/YVhMp9EGqGBXL1jb
	ROgSr7mI4lS6YYZnzzifnTZC1uXKDyy2u+BY6c3e1RK9Lz8IGpshKMuEh5dSZ6A8sa5j/P2n4hj5D
	4F59/lmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu6v5-00000001xu7-3JAz;
	Mon, 17 Mar 2025 09:38:03 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu6sE-00000001wtP-31Uu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 09:35:08 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id E14BEA02E3;
	Mon, 17 Mar 2025 10:34:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=+FYeznGF05qGpks00rXy
	InbtPfAnR/GvyHPNTPLvUWs=; b=sUUWU1vgSO1NmcKKjrDIwKrJy6vUMjnuToZG
	5g89H7LbJdzisR4B+lx5Pip93dpgRY6em1zgi6kCMNLw5tN81I16g8BsG/r8xokL
	uDGtb7lhNBE81WdGY3qDo+cYjQU1HWVjOu965jMLJxuwUtQ+48Zo1TgnFhDuozYP
	oXDISf+99ycS6XFpGJ/GYKRO3Wv+PMGD7cfb5uErnX3TaVSBVE9c64fWVNMsnpnn
	u1ZUaDvWxS1urUhuZP9GicFezuZ2mtfgV0EO1dM61r7XMYemj5c2RVwFYLRAZI8G
	QwRGn/Xxyf5wbHuveCtBu9zarkceD3c1M/g8YojrXFKBdA6k2oo/isKhEQsT2NjV
	/p+mekwEnuDYXxUo2YYVtJa/rc7jefrPLH0DLMtwRqQudnR0+fXM9KGlTcIw+UJa
	Dq/B0NJqg96dnpVZGourFCQJzfU1UsPid/jHO0V/Exir1OfL8eefZzMMZd/X6HCB
	8uXns+Tvc67RoCuCRT/MrUR9aWm0JrTglDiDDU1t8qxmglA3ZAxkJCsl0d+DB2qZ
	pJzNXxsAT3rqmfBLA8ocIl+8JBiuzjNJbYLuQjEgpvDdSlYhm7SxqkTSroL6FRvy
	9UhJ6kiZeCF79WyMa4DBpCDUe69+PJtKmzSsyj8DFTObkfm4Yv4MnUDu4XblQ/uL
	QwECytQ=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, "Varshini
 Rajendran" <varshini.rajendran@microchip.com>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>,
	Pavel Machek <pavel@ucw.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>, Alexander Dahl <ada@thorsis.com>,
	"Nicolas Ferre" <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Pavel Machek <pavel@kernel.org>
Subject: [PATCH v5 1/2] pm: runtime: Add new devm functions
Date: Mon, 17 Mar 2025 10:34:42 +0100
Message-ID: <20250317093445.361821-2-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250317093445.361821-1-csokas.bence@prolan.hu>
References: <20250317093445.361821-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1742204095;VERSION=7986;MC=658418503;ID=162300;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D948526D7462
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_023507_211707_A95080C5 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

Add `devm_pm_runtime_set_active()` and
`devm_pm_runtime_get_noresume()` for
simplifying common use cases in drivers.

Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
 drivers/base/power/runtime.c | 36 ++++++++++++++++++++++++++++++++++++
 include/linux/pm_runtime.h   |  4 ++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 9589ccb0fda2..821a8b4961d4 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -1568,6 +1568,24 @@ void pm_runtime_enable(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(pm_runtime_enable);
 
+static void pm_runtime_set_suspended_action(void *data)
+{
+	pm_runtime_set_suspended(data);
+}
+
+/**
+ * devm_pm_runtime_set_active - devres-enabled version of pm_runtime_set_active.
+ *
+ * @dev: Device to handle.
+ */
+int devm_pm_runtime_set_active(struct device *dev)
+{
+	pm_runtime_set_active(dev);
+
+	return devm_add_action_or_reset(dev, pm_runtime_set_suspended_action, dev);
+}
+EXPORT_SYMBOL_GPL(devm_pm_runtime_set_active);
+
 static void pm_runtime_disable_action(void *data)
 {
 	pm_runtime_dont_use_autosuspend(data);
@@ -1590,6 +1608,24 @@ int devm_pm_runtime_enable(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(devm_pm_runtime_enable);
 
+static void pm_runtime_put_noidle_action(void *data)
+{
+	pm_runtime_put_noidle(data);
+}
+
+/**
+ * devm_pm_runtime_get_noresume - devres-enabled version of pm_runtime_get_noresume.
+ *
+ * @dev: Device to handle.
+ */
+int devm_pm_runtime_get_noresume(struct device *dev)
+{
+	pm_runtime_get_noresume(dev);
+
+	return devm_add_action_or_reset(dev, pm_runtime_put_noidle_action, dev);
+}
+EXPORT_SYMBOL_GPL(devm_pm_runtime_get_noresume);
+
 /**
  * pm_runtime_forbid - Block runtime PM of a device.
  * @dev: Device to handle.
diff --git a/include/linux/pm_runtime.h b/include/linux/pm_runtime.h
index 7fb5a459847e..364355da349a 100644
--- a/include/linux/pm_runtime.h
+++ b/include/linux/pm_runtime.h
@@ -96,7 +96,9 @@ extern void pm_runtime_new_link(struct device *dev);
 extern void pm_runtime_drop_link(struct device_link *link);
 extern void pm_runtime_release_supplier(struct device_link *link);
 
+int devm_pm_runtime_set_active(struct device *dev);
 extern int devm_pm_runtime_enable(struct device *dev);
+int devm_pm_runtime_get_noresume(struct device *dev);
 
 /**
  * pm_suspend_ignore_children - Set runtime PM behavior regarding children.
@@ -294,7 +296,9 @@ static inline bool pm_runtime_blocked(struct device *dev) { return true; }
 static inline void pm_runtime_allow(struct device *dev) {}
 static inline void pm_runtime_forbid(struct device *dev) {}
 
+static inline int devm_pm_runtime_set_active(struct device *dev) { return 0; }
 static inline int devm_pm_runtime_enable(struct device *dev) { return 0; }
+static inline int devm_pm_runtime_get_noresume(struct device *dev) { return 0; }
 
 static inline void pm_suspend_ignore_children(struct device *dev, bool enable) {}
 static inline void pm_runtime_get_noresume(struct device *dev) {}
-- 
2.48.1



