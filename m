Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37137E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 16:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SeT74qi39R67oGVYf/LuYuHg5gBTOzBb55wVwF13RH4=; b=GNPZlriQSRZ7/uf9gp/b7WRzA+
	ud/cfwoxyS982HgODov5JRykC0KZGgsWZfOJWIzrOmmLoEQFukNycDO7Z3nksCIbD6ISfsAP0QAHt
	nsWMOsN/Q2PtzoHz9SBdHkrXP6tdE6HHilQF/gHloKMFwOQbrcxJrsuYzsC5jABrGgAQPap419Rx0
	FmL4dmY0DnEeV7fXT2O/z6kxBkX7fWBldVrMskyL8K+fmSQ+xUBgg8+3C2jLS23+Zm0I9sElXKBfm
	s5hp7RWiG3kxcC4YAg/nFvgp47MJzIUfkPz+SdaC53nWmfC1vBeBI1eFG1VqHTd0F5HXZgmURWs2g
	ilyJNonw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKh0o-00000008c1p-36sX;
	Mon, 09 Dec 2024 16:53:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgxp-00000008baM-3cTk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 16:50:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E4D6168F;
	Mon,  9 Dec 2024 08:50:55 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5AF623F720;
	Mon,  9 Dec 2024 08:50:24 -0800 (PST)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	dan.carpenter@linaro.org,
	johan+linaro@kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v2 2/3] firmware: arm_scmi: Add module aliases to i.MX vendor protocols
Date: Mon,  9 Dec 2024 16:49:56 +0000
Message-ID: <20241209164957.1801886-3-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241209164957.1801886-1-cristian.marussi@arm.com>
References: <20241209164957.1801886-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_085030_037726_C7412447 
X-CRM114-Status: UNSURE (   9.56  )
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

Using the pattern 'scmi-protocol-0x<PROTO_ID>-<VEND_ID>' as MODULE_ALIAS
allows the SCMI core to autoload this protocol, if built as a module, when
its protocol operations are requested by an SCMI driver.

Cc: Peng Fan <peng.fan@nxp.com>
Acked-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c  | 5 +++--
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c | 5 +++--
 include/linux/scmi_imx_protocol.h                   | 9 +++++----
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c
index 17799eacf06c..aa176c1a5eef 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c
@@ -374,10 +374,11 @@ static const struct scmi_protocol scmi_imx_bbm = {
 	.ops = &scmi_imx_bbm_proto_ops,
 	.events = &scmi_imx_bbm_protocol_events,
 	.supported_version = SCMI_PROTOCOL_SUPPORTED_VERSION,
-	.vendor_id = "NXP",
-	.sub_vendor_id = "IMX",
+	.vendor_id = SCMI_IMX_VENDOR,
+	.sub_vendor_id = SCMI_IMX_SUBVENDOR,
 };
 module_scmi_protocol(scmi_imx_bbm);
 
+MODULE_ALIAS("scmi-protocol-" __stringify(SCMI_PROTOCOL_IMX_BBM) "-" SCMI_IMX_VENDOR);
 MODULE_DESCRIPTION("i.MX SCMI BBM driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
index a86ab9b35953..83b69fc4fba5 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
@@ -309,10 +309,11 @@ static const struct scmi_protocol scmi_imx_misc = {
 	.ops = &scmi_imx_misc_proto_ops,
 	.events = &scmi_imx_misc_protocol_events,
 	.supported_version = SCMI_PROTOCOL_SUPPORTED_VERSION,
-	.vendor_id = "NXP",
-	.sub_vendor_id = "IMX",
+	.vendor_id = SCMI_IMX_VENDOR,
+	.sub_vendor_id = SCMI_IMX_SUBVENDOR,
 };
 module_scmi_protocol(scmi_imx_misc);
 
+MODULE_ALIAS("scmi-protocol-" __stringify(SCMI_PROTOCOL_IMX_MISC) "-" SCMI_IMX_VENDOR);
 MODULE_DESCRIPTION("i.MX SCMI MISC driver");
 MODULE_LICENSE("GPL");
diff --git a/include/linux/scmi_imx_protocol.h b/include/linux/scmi_imx_protocol.h
index 066216f1357a..53b356a26414 100644
--- a/include/linux/scmi_imx_protocol.h
+++ b/include/linux/scmi_imx_protocol.h
@@ -13,10 +13,11 @@
 #include <linux/notifier.h>
 #include <linux/types.h>
 
-enum scmi_nxp_protocol {
-	SCMI_PROTOCOL_IMX_BBM = 0x81,
-	SCMI_PROTOCOL_IMX_MISC = 0x84,
-};
+#define	SCMI_PROTOCOL_IMX_BBM	0x81
+#define	SCMI_PROTOCOL_IMX_MISC	0x84
+
+#define SCMI_IMX_VENDOR		"NXP"
+#define SCMI_IMX_SUBVENDOR	"IMX"
 
 struct scmi_imx_bbm_proto_ops {
 	int (*rtc_time_set)(const struct scmi_protocol_handle *ph, u32 id,
-- 
2.47.0


