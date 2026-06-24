Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A420CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 11:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qAOUbo/1p128tVHptJ4mU0jT91GW4wZCWa80G9NU8gU=; b=ofpmoFw6VUapJb/0mhXGDtLhtW
	ZuqIDO0HONtyJEKrE3B8OeJjp+/zFCFTBo4S7kGUJHUpkLNzZMycJ/MhbE8GPg/BqmPfJSfke3DIU
	4H33O6HgiuBcWEDKsFnYxIgHEa0chYBku+9l/ZwQL/V/hNLjXTmFvfJVboFIuh+bWimYkf2HYVUdH
	3uc2dGRH5UeT5O1GnLGaiBPYEfnKkRZ5eC99Wn21PvxadjPbWnkdp+YmhqVwB9PYncglVx0uv2u4v
	3iaT6XHJV3zrS2yywLj8bsWON4QU2TDi1DttJkgcaI3O+u7vuwh38xMVdkMkV35HzIbAbIuHGvnCQ
	554XlOtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcLoM-00000007fVQ-41KO;
	Wed, 24 Jun 2026 11:30:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcLoL-00000007fVA-15Nw;
	Wed, 24 Jun 2026 11:30:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qAOUbo/1p128tVHptJ4mU0jT91GW4wZCWa80G9NU8gU=; b=mV94ClsQl2Www2cu9urDQzVWhF
	SZmAFFP44Onxq6/HxmMPscNpm57d5ne//faN7wYirtDGekg5iwTNdAvn+qrbZdy2F8Lq5rnPXIbXU
	IJSxdHhljFc7VEQuMJeadvnlyhFUaAw01nklI7P2iCjlRgIhV3nZQh0nluXJ1vzZ97JDOIzt8ovfC
	xwhlMDAEl3DMVAmjf4UyvL+L8X00yECKdiG5MAtiW0gY8NdIueEFogKBVUB0SHlPXuzGVAziEmwfb
	fQISVxThMDtYKkWB3lk9S43PoHBoLCrp9/fvIJTC+/57sYDgmyG1PvUqUnHXZL18C9FCAKr+nL0nR
	MoKavNIQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wcLoH-00000002Glk-1wZz;
	Wed, 24 Jun 2026 11:30:28 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 65OBTj3vA4147251, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1782300585; bh=qAOUbo/1p128tVHptJ4mU0jT91GW4wZCWa80G9NU8gU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=ejRbpWebxPQZHG+yqwTkzbmC7cHNVKbImI0jue12Ac++OYuVALNf1y3i+cXqGbSKG
	 GyNPt+s9ySAirmaYscVp5TL4U+yfE2gIfgUCEHKvMM1y+PyNv5U/XrOeHF8h+xUt6n
	 Nu2QRpc26/S1sTm/B1KPOZcZ5p6leCPNVKnjbT1Yljc8QUzqoS9M1g8bfa4L2w5YgD
	 P63BTcoT3wCwmg8Am5WhsGiT6sBZKi+xzhvRLk1z+nAijl1QJmzy4y+1wbIOGgNHWS
	 IUwrf4jiV4p0Qzo6LTXItgk4X7WmTf7KUcR/CdNo/uKzRiCHtzM/zzwFCYxo6rLVBW
	 RDzdYcg7pF5Dg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 65OBTj3vA4147251
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 Jun 2026 19:29:45 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Jun 2026 19:29:45 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Jun 2026 19:29:45 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 24 Jun 2026 19:29:45 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <p.zabel@pengutronix.de>,
	<cylee12@realtek.com>, <afaerber@suse.com>, <jyanchou@realtek.com>,
	<bmasney@redhat.com>
CC: <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>, <james.tai@realtek.com>,
	<cy.huang@realtek.com>, <stanley_chang@realtek.com>,
	<eleanor.lin@realtek.com>
Subject: [PATCH v9 04/12] reset: realtek: Add RTD1625-ISO reset controller driver
Date: Wed, 24 Jun 2026 19:29:32 +0800
Message-ID: <20260624112940.3475605-5-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260624112940.3475605-1-eleanor.lin@realtek.com>
References: <20260624112940.3475605-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_123026_276170_22230F8F 
X-CRM114-Status: GOOD (  18.73  )
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

From: Cheng-Yu Lee <cylee12@realtek.com>

Add support for the ISO (Isolation) domain reset controller on the Realtek
RTD1625 SoC.

The reset controller shares the same register space with the ISO clock
controller. To handle this shared register space, the reset driver is
implemented as an auxiliary driver. It will be instantiated and probed via
the auxiliary bus by the RTD1625-ISO clock controller driver.

Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v9:
- Extract reset-related code from the previous clock driver patch
(formerly patch 9 in v8).
---
 drivers/reset/realtek/Makefile            |  2 +-
 drivers/reset/realtek/reset-rtd1625-iso.c | 99 +++++++++++++++++++++++
 2 files changed, 100 insertions(+), 1 deletion(-)
 create mode 100644 drivers/reset/realtek/reset-rtd1625-iso.c

diff --git a/drivers/reset/realtek/Makefile b/drivers/reset/realtek/Makefile
index c3f605ffb11c..9007c9d5683b 100644
--- a/drivers/reset/realtek/Makefile
+++ b/drivers/reset/realtek/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_RESET_RTK_COMMON) += reset-rtk-common.o
-obj-$(CONFIG_RESET_RTD1625) += reset-rtd1625-crt.o
+obj-$(CONFIG_RESET_RTD1625) += reset-rtd1625-crt.o reset-rtd1625-iso.o
diff --git a/drivers/reset/realtek/reset-rtd1625-iso.c b/drivers/reset/realtek/reset-rtd1625-iso.c
new file mode 100644
index 000000000000..78eaabb408f0
--- /dev/null
+++ b/drivers/reset/realtek/reset-rtd1625-iso.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Realtek Semiconductor Corporation
+ */
+
+#include <dt-bindings/reset/realtek,rtd1625.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+#include "reset-rtk-common.h"
+
+#define RTD1625_ISO_RSTN_MAX	29
+#define RTD1625_ISO_S_RSTN_MAX	5
+
+static const struct rtk_reset_desc rtd1625_iso_reset_descs[] = {
+	[RTD1625_ISO_RSTN_VFD]                 = { .ofs = 0x88, .bit = 0 },
+	[RTD1625_ISO_RSTN_CEC0]                = { .ofs = 0x88, .bit = 2 },
+	[RTD1625_ISO_RSTN_CEC1]                = { .ofs = 0x88, .bit = 3 },
+	[RTD1625_ISO_RSTN_CBUSTX]              = { .ofs = 0x88, .bit = 5 },
+	[RTD1625_ISO_RSTN_CBUSRX]              = { .ofs = 0x88, .bit = 6 },
+	[RTD1625_ISO_RSTN_USB3_PHY2_XTAL_POW]  = { .ofs = 0x88, .bit = 7 },
+	[RTD1625_ISO_RSTN_UR0]                 = { .ofs = 0x88, .bit = 8 },
+	[RTD1625_ISO_RSTN_GMAC]                = { .ofs = 0x88, .bit = 9 },
+	[RTD1625_ISO_RSTN_GPHY]                = { .ofs = 0x88, .bit = 10 },
+	[RTD1625_ISO_RSTN_I2C_0]               = { .ofs = 0x88, .bit = 11 },
+	[RTD1625_ISO_RSTN_I2C_1]               = { .ofs = 0x88, .bit = 12 },
+	[RTD1625_ISO_RSTN_CBUS]                = { .ofs = 0x88, .bit = 13 },
+	[RTD1625_ISO_RSTN_USB_DRD]             = { .ofs = 0x88, .bit = 14 },
+	[RTD1625_ISO_RSTN_USB_HOST]            = { .ofs = 0x88, .bit = 15 },
+	[RTD1625_ISO_RSTN_USB_PHY_0]           = { .ofs = 0x88, .bit = 16 },
+	[RTD1625_ISO_RSTN_USB_PHY_1]           = { .ofs = 0x88, .bit = 17 },
+	[RTD1625_ISO_RSTN_USB_PHY_2]           = { .ofs = 0x88, .bit = 18 },
+	[RTD1625_ISO_RSTN_USB]                 = { .ofs = 0x88, .bit = 19 },
+	[RTD1625_ISO_RSTN_TYPE_C]              = { .ofs = 0x88, .bit = 20 },
+	[RTD1625_ISO_RSTN_USB_U3_HOST]         = { .ofs = 0x88, .bit = 21 },
+	[RTD1625_ISO_RSTN_USB3_PHY0_POW]       = { .ofs = 0x88, .bit = 22 },
+	[RTD1625_ISO_RSTN_USB3_P0_MDIO]        = { .ofs = 0x88, .bit = 23 },
+	[RTD1625_ISO_RSTN_USB3_PHY1_POW]       = { .ofs = 0x88, .bit = 24 },
+	[RTD1625_ISO_RSTN_USB3_P1_MDIO]        = { .ofs = 0x88, .bit = 25 },
+	[RTD1625_ISO_RSTN_VTC]                 = { .ofs = 0x88, .bit = 26 },
+	[RTD1625_ISO_RSTN_USB3_PHY2_POW]       = { .ofs = 0x88, .bit = 27 },
+	[RTD1625_ISO_RSTN_USB3_P2_MDIO]        = { .ofs = 0x88, .bit = 28 },
+	[RTD1625_ISO_RSTN_USB_PHY_3]           = { .ofs = 0x88, .bit = 29 },
+	[RTD1625_ISO_RSTN_USB_PHY_4]           = { .ofs = 0x88, .bit = 30 },
+};
+
+static const struct rtk_reset_desc rtd1625_iso_s_reset_descs[] = {
+	[RTD1625_ISO_S_RSTN_ISOM_MIS] = { .ofs = 0x310, .bit = 0, .write_en = 1 },
+	[RTD1625_ISO_S_RSTN_GPIOM]    = { .ofs = 0x310, .bit = 2, .write_en = 1 },
+	[RTD1625_ISO_S_RSTN_TIMER7]   = { .ofs = 0x310, .bit = 4, .write_en = 1 },
+	[RTD1625_ISO_S_RSTN_IRDA]     = { .ofs = 0x310, .bit = 6, .write_en = 1 },
+	[RTD1625_ISO_S_RSTN_UR10]     = { .ofs = 0x310, .bit = 8, .write_en = 1 },
+};
+
+static int rtd1625_iso_reset_probe(struct auxiliary_device *adev,
+				   const struct auxiliary_device_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct device *parent = dev->parent;
+	struct rtk_reset_data *data;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	if (of_device_is_compatible(parent->of_node, "realtek,rtd1625-iso-s-clk")) {
+		data->descs           = rtd1625_iso_s_reset_descs;
+		data->rcdev.nr_resets = RTD1625_ISO_S_RSTN_MAX;
+	} else {
+		data->descs           = rtd1625_iso_reset_descs;
+		data->rcdev.nr_resets = RTD1625_ISO_RSTN_MAX;
+	}
+
+	data->rcdev.owner     = THIS_MODULE;
+
+	return rtk_reset_controller_add(dev, data);
+}
+
+static const struct auxiliary_device_id rtd1625_iso_reset_ids[] = {
+	{ .name = "clk_rtk.iso_rst" },
+	{ .name = "clk_rtk.iso_s_rst" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, rtd1625_iso_reset_ids);
+
+static struct auxiliary_driver rtd1625_iso_driver = {
+	.probe = rtd1625_iso_reset_probe,
+	.id_table = rtd1625_iso_reset_ids,
+	.driver = {
+		.name = "rtd1625-iso-reset",
+	},
+};
+module_auxiliary_driver(rtd1625_iso_driver);
+
+MODULE_DESCRIPTION("Realtek RTD1625 ISO Reset Controller Driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("REALTEK_RESET");
-- 
2.43.0


