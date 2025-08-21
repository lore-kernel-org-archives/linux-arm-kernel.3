Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FA0CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 15:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bkjygQ4RWB5YIgYQcmBxJ6rnQ07NLsR8LZDpK7ads0U=; b=gRqOzCa+zg3o6C0yzvrHTmWVF3
	rEis6vexJ9rBH/cKEjK8X/k2UM83oGewXyTymS3X/iavlo0CMUSIjCuJVexcfk1XcOUSCIZH/cQNE
	ys7UD8J3kjnDdlx795VwRbyRdv51RDpzg5jQ6Msj+wyeSyuj/dmiLdPgyx7r9klCDOPK2D53vqh0+
	FS5qbl4ONLw9y2XmCgOz3rX6toXS59slWRlyxm8ydiUBZqw/F6HwTZnTxbbl6HiCD4JU+BM2zB0ZL
	VyVERKUgEdyL1P8Q1A76KBNwz6Qf1yq+M1+QvyNfwq6xe9ZiHjpGguzPWqI6gg0rHKJ4fh2zN+Nh/
	mUmqBfuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7Ey-0000000HMQI-2S5G;
	Thu, 21 Aug 2025 15:30:13 +0000
Received: from mx.olsak.net ([37.205.8.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3KJ-0000000GjVg-1pwd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 11:19:30 +0000
DKIM-Signature: a=rsa-sha256; bh=bkjygQ4RWB5YIgYQcmBxJ6rnQ07NLsR8LZDpK7ads0U=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1755775105; v=1; x=1756207105;
 b=CxfT9eFL4rvOBnLW1jE2TKKw9hAxb2IL/njJ+KTx4fo3hjj7cM2jDUiuaHKeT/V7F5UZSfRa
 eK40zC/915W6zEIOi/NwNXWUKnu4f4Y0xXoahtUqj1jc+IEJZ+qarw5GMmga+xs5/mNVJmJOklT
 P9D4bYEIwiQxpnfwTTiCHncr1koYexKTRRy3cjLRph5cwa+W/xtiv7M0WpxFPxRmqBpfprTPRnn
 G0WnJ86NvCOlYpWLn3zBJCQNdm3TsXo7Pc3LRAzhZa/uAoJntjw1VuYqpdYy3MaNRjso6EoZkLk
 BcoYCemXq92frPp41ZfMKaAoTC/iWr2LE8YM75dW6fqyg==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 5c9dea5e; Thu, 21 Aug 2025 13:18:25 +0200
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Date: Thu, 21 Aug 2025 13:17:44 +0200
Subject: [PATCH v2 2/4] dt-bindings: power: Add Marvell PXA1908 domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250821-pxa1908-genpd-v2-2-eba413edd526@dujemihanovic.xyz>
References: <20250821-pxa1908-genpd-v2-0-eba413edd526@dujemihanovic.xyz>
In-Reply-To: <20250821-pxa1908-genpd-v2-0-eba413edd526@dujemihanovic.xyz>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=sZfO0I33cgEm+4dMt0Hj0C6c34cVlAeZrFGi34N8QJA=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBnLGerK7fbeUouRVtmkL8VxZSWvtcvRTNFXC7uvP/Xhb
 vjl2SbTUcrCIMbFICumyJL73/Ea72eRrduzlxnAzGFlAhnCwMUpABMpTGX4p68rLSS5tfSu+K5U
 m5nmveynzR6eiWBM/2YXl9k/U8N4B8P/2o8X5hwSf7umzl+49WAO/4XE5MOWJq90EzbdvLXnRis
 3PwA=
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_041928_482536_3DECE663 
X-CRM114-Status: UNSURE (   9.25  )
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

Add device tree bindings for Marvell PXA1908's power domains.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
v2:
- Drop schema
---
 include/dt-bindings/power/marvell,pxa1908-power.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/dt-bindings/power/marvell,pxa1908-power.h b/include/dt-bindings/power/marvell,pxa1908-power.h
new file mode 100644
index 0000000000000000000000000000000000000000..19b088351af138823505a774ff27203429fe2d97
--- /dev/null
+++ b/include/dt-bindings/power/marvell,pxa1908-power.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Marvell PXA1908 power domains
+ *
+ * Copyright 2025, Duje Mihanović <duje@dujemihanovic.xyz>
+ */
+
+#ifndef __DTS_MARVELL_PXA1908_POWER_H
+#define __DTS_MARVELL_PXA1908_POWER_H
+
+#define PXA1908_POWER_DOMAIN_VPU	0
+#define PXA1908_POWER_DOMAIN_GPU	1
+#define PXA1908_POWER_DOMAIN_GPU2D	2
+#define PXA1908_POWER_DOMAIN_DSI	3
+#define PXA1908_POWER_DOMAIN_ISP	4
+
+#endif

-- 
2.50.1


