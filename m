Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CD4C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 09:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TxlRvYVV9khSZoxHTmi6Xm+xr2AQ+F0Z9nuDl3ZM9+Y=; b=fUA8ummOJZ1bZBKEc1i7BczZmG
	0mQrLmSKlfk3SuHRhUbgxK1MmsTsG3BghDBeDlftmZ56NX2o/vKkAc6XYiy33aJHY7YdDMaJ+Y1On
	57QZ5O8us5aj4Rcm4CivsGNEz/LhIYuaplklspiixOTpAGsnlpN7cpOzOSw8oE8TaMLc5RUn9f7LS
	rioDz05WTjaT2rvKskowT1AT+obPJwP8eZmn8xRM655X+LOOJCg2ZWdBKaTbXpAh7dJrcCXc9qdNF
	fPsmQS8zQVgccDXktr/AbZVhMqVk8H7FlmwS2CyepdoVBqVacBfxCfuAjkBehml2rLXuZKwDZJG7A
	CFq2bixw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tirY5-0000000EDFn-20G8;
	Fri, 14 Feb 2025 08:59:49 +0000
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tirSz-0000000ECC3-0LhQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 08:54:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=TxlRvYVV9khSZoxHTmi6Xm+xr2AQ+F0Z9nuDl3ZM9+Y=; b=IAgOutDXlTV7f8paqVi7ze48Uf
	QaqjVPTOg+IsBteCrfmS7OXmowYm8gbJEndF8REIZ1kMQ8JWhaxJ5j6YvlYRHQUC8sC6qsL/GTRDN
	VzDswVN+GAHvJC10L37032/IGF14NXlf10HCqBU44WPZC6vRmTL30205soeSfRZ+l00muCx3PoXbc
	xysV/NXfghDWiYDjsLU2Iv3cu5/p1UDVzkD2HUkTATgX4184L8ouJ+H5VogMg0PKg2XSenZ4taXfk
	z6NEG1CfwTTibQ3ptd6LqJ43zI+E0mTwkstVhTJM3XaTXW3DqXWVfHgltwFmHwJBSvD8sARewkcVR
	rBnMuqjw==;
Received: from [122.175.9.182] (port=45524 helo=cypher.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpa (Exim 4.96.2)
	(envelope-from <parvathi@couthit.com>)
	id 1tirSv-00050J-0x;
	Fri, 14 Feb 2025 14:24:29 +0530
From: parvathi <parvathi@couthit.com>
To: danishanwar@ti.com,
	rogerq@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nm@ti.com,
	ssantosh@kernel.org,
	richardcochran@gmail.com,
	parvathi@couthit.com,
	basharath@couthit.com,
	schnelle@linux.ibm.com,
	diogo.ivo@siemens.com,
	m-karicheri2@ti.com,
	horms@kernel.org,
	jacob.e.keller@intel.com,
	m-malladi@ti.com,
	javier.carrasco.cruz@gmail.com,
	afd@ti.com,
	s-anna@ti.com
Cc: linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pratheesh@ti.com,
	prajith@ti.com,
	vigneshr@ti.com,
	praneeth@ti.com,
	srk@ti.com,
	rogerq@ti.com,
	krishna@couthit.com,
	pmohan@couthit.com,
	mohan@couthit.com
Subject: [PATCH net-next v3 10/10] soc: ti: PRUSS OCP configuration
Date: Fri, 14 Feb 2025 14:23:15 +0530
Message-Id: <20250214085315.1077108-11-parvathi@couthit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250214054702.1073139-1-parvathi@couthit.com>
References: <20250214054702.1073139-1-parvathi@couthit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: parvathi@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: parvathi@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_005433_148836_AABB6A95 
X-CRM114-Status: GOOD (  18.57  )
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

From: Roger Quadros <rogerq@ti.com>

Updates OCP master port configuration to enable memory access outside
of the PRU-ICSS subsystem.

This set of changes configures PRUSS_SYSCFG.STANDBY_INIT bit either
to enable or disable the OCP master ports (applicable only on SoCs
using OCP interconnect like the OMAP family).

Signed-off-by: Roger Quadros <rogerq@ti.com>
Signed-off-by: Andrew F. Davis <afd@ti.com>
Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
---
 drivers/soc/ti/pruss.c       | 77 +++++++++++++++++++++++++++++++++++-
 include/linux/pruss_driver.h |  6 +++
 2 files changed, 82 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
index d7634bf5413a..a0e233da052c 100644
--- a/drivers/soc/ti/pruss.c
+++ b/drivers/soc/ti/pruss.c
@@ -25,14 +25,19 @@
 #include <linux/slab.h>
 #include "pruss.h"
 
+#define SYSCFG_STANDBY_INIT	BIT(4)
+#define SYSCFG_SUB_MWAIT_READY	BIT(5)
+
 /**
  * struct pruss_private_data - PRUSS driver private data
  * @has_no_sharedram: flag to indicate the absence of PRUSS Shared Data RAM
  * @has_core_mux_clock: flag to indicate the presence of PRUSS core clock
+ * @has_ocp_syscfg: flag to indicate if OCP SYSCFG is present
  */
 struct pruss_private_data {
 	bool has_no_sharedram;
 	bool has_core_mux_clock;
+	bool has_ocp_syscfg;
 };
 
 /**
@@ -286,6 +291,72 @@ int pruss_cfg_xfr_enable(struct pruss *pruss, enum pru_type pru_type,
 }
 EXPORT_SYMBOL_GPL(pruss_cfg_xfr_enable);
 
+/**
+ * pruss_cfg_ocp_master_ports() - configure PRUSS OCP master ports
+ * @pruss: the pruss instance handle
+ * @enable: set to true for enabling or false for disabling the OCP master ports
+ *
+ * This function programs the PRUSS_SYSCFG.STANDBY_INIT bit either to enable or
+ * disable the OCP master ports (applicable only on SoCs using OCP interconnect
+ * like the OMAP family). Clearing the bit achieves dual functionalities - one
+ * is to deassert the MStandby signal to the device PRCM, and the other is to
+ * enable OCP master ports to allow accesses outside of the PRU-ICSS. The
+ * function has to wait for the PRCM to acknowledge through the monitoring of
+ * the PRUSS_SYSCFG.SUB_MWAIT bit when enabling master ports. Setting the bit
+ * disables the master access, and also signals the PRCM that the PRUSS is ready
+ * for Standby.
+ *
+ * Return: 0 on success, or an error code otherwise. ETIMEDOUT is returned
+ * when the ready-state fails.
+ */
+int pruss_cfg_ocp_master_ports(struct pruss *pruss, bool enable)
+{
+	const struct pruss_private_data *data;
+	u32 syscfg_val, i;
+	int ret;
+
+	if (IS_ERR_OR_NULL(pruss))
+		return -EINVAL;
+
+	data = of_device_get_match_data(pruss->dev);
+
+	/* nothing to do on non OMAP-SoCs */
+	if (!data || !data->has_ocp_syscfg)
+		return 0;
+
+       /* assert the MStandby signal during disable path */
+	if (!enable)
+		return pruss_cfg_update(pruss, PRUSS_CFG_SYSCFG,
+					SYSCFG_STANDBY_INIT,
+					SYSCFG_STANDBY_INIT);
+
+	/* enable the OCP master ports and disable MStandby */
+	ret = pruss_cfg_update(pruss, PRUSS_CFG_SYSCFG, SYSCFG_STANDBY_INIT, 0);
+	if (ret)
+		return ret;
+
+	/* wait till we are ready for transactions - delay is arbitrary */
+	for (i = 0; i < 10; i++) {
+		ret = pruss_cfg_read(pruss, PRUSS_CFG_SYSCFG, &syscfg_val);
+		if (ret)
+			goto disable;
+
+		if (!(syscfg_val & SYSCFG_SUB_MWAIT_READY))
+			return 0;
+
+		udelay(5);
+	}
+
+	dev_err(pruss->dev, "timeout waiting for SUB_MWAIT_READY\n");
+	ret = -ETIMEDOUT;
+
+disable:
+	pruss_cfg_update(pruss, PRUSS_CFG_SYSCFG, SYSCFG_STANDBY_INIT,
+			 SYSCFG_STANDBY_INIT);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(pruss_cfg_ocp_master_ports);
+
 static void pruss_of_free_clk_provider(void *data)
 {
 	struct device_node *clk_mux_np = data;
@@ -570,6 +641,10 @@ static const struct pruss_private_data am437x_pruss0_data = {
 	.has_no_sharedram = true,
 };
 
+static const struct pruss_private_data am57xx_data = {
+	.has_ocp_syscfg = true,
+};
+
 static const struct pruss_private_data am65x_j721e_pruss_data = {
 	.has_core_mux_clock = true,
 };
@@ -578,7 +653,7 @@ static const struct of_device_id pruss_of_match[] = {
 	{ .compatible = "ti,am3356-pruss" },
 	{ .compatible = "ti,am4376-pruss0", .data = &am437x_pruss0_data, },
 	{ .compatible = "ti,am4376-pruss1", .data = &am437x_pruss1_data, },
-	{ .compatible = "ti,am5728-pruss" },
+	{ .compatible = "ti,am5728-pruss", .data = &am57xx_data, },
 	{ .compatible = "ti,k2g-pruss" },
 	{ .compatible = "ti,am654-icssg", .data = &am65x_j721e_pruss_data, },
 	{ .compatible = "ti,j721e-icssg", .data = &am65x_j721e_pruss_data, },
diff --git a/include/linux/pruss_driver.h b/include/linux/pruss_driver.h
index 2e18fef1a2e1..15b3c9c58539 100644
--- a/include/linux/pruss_driver.h
+++ b/include/linux/pruss_driver.h
@@ -118,6 +118,7 @@ int pruss_cfg_gpimode(struct pruss *pruss, enum pruss_pru_id pru_id,
 int pruss_cfg_miirt_enable(struct pruss *pruss, bool enable);
 int pruss_cfg_xfr_enable(struct pruss *pruss, enum pru_type pru_type,
 			 bool enable);
+int pruss_cfg_ocp_master_ports(struct pruss *pruss, bool enable);
 
 #else
 
@@ -172,6 +173,11 @@ static inline int pruss_cfg_xfr_enable(struct pruss *pruss,
 	return -EOPNOTSUPP;
 }
 
+static int pruss_cfg_ocp_master_ports(struct pruss *pruss, bool enable)
+{
+	return -EOPNOTSUPP;
+}
+
 #endif /* CONFIG_TI_PRUSS */
 
 #endif	/* _PRUSS_DRIVER_H_ */
-- 
2.34.1


