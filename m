Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BA9606D827
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qI6xaWIa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cA1bvQrdLE6ZDcNkqNiWAdXdg103OEauWYsUNrJUNDk=; b=qI6xaWIaM7WgGO4htVph22JO6t
	g8JjGLYVZq+1y7RQtF54z0XsTOEzlA05V9Vn41iooHbaxK+fgNxzlumYZ5VkYtcLRQN9Yvxe9PPJa
	qf2OzDJ3O/Sl+VoFfJ8GQdq4c10e1aS9SjnbcRTN9amGtNVyjjzJQoC2FkjqLLyjXtm1A8NvuF5Y1
	NJMKOS0uI4qN2AS520DdZwSDcZvrPhY8amRvrj50PPGJd00T9yoeJzTPoYVz+mIl35hmacrfPYjE7
	3u+x8J7ePDr8M8yT/wfXTX43R8ZZMcQiFTkey/B3YpTajdX48qoWsj0rpRhUB8r5s1s7N29kxXfuv
	iSOM5QIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaRh-00000005NkA-3yhZ;
	Wed, 04 Nov 2026 12:50:29 +0000
Received: from mail-japanwestazon11022138.outbound.protection.outlook.com ([40.107.75.138] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaRd-00000005Nfp-3aGZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 12:50:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=maJXqdd6t2N+6fp4PteK8HFtCkxxBdJEJzDNUV7ZUCKuDdL42/tOcUG+j5nmIdn5tfxfWKd20gzNxsHF0d3MhT9RfcssVQ/8ei64OFuzfe8M8add0Rha44Fac3RpzKE+7kt3DlwDlZrgc/uq0iPQ50M2nQa9PlhHoeCkTxZhaabopG+Gi1dXEurUC5e+4k4iZRE1+K8aEY4PDU9KDhCMi12HrPGdOHOVBIScVKFDydofCD794KLEpUAP63QkwjPh2vAtQco1ahyANDKBLxEuk7mnE1pthkinqt57a4LUed2GRT+Wmc1F2Vga6ir8UnG10k5eRe1vVwpAmQiSxjwAFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cA1bvQrdLE6ZDcNkqNiWAdXdg103OEauWYsUNrJUNDk=;
 b=jVyuJCwyJKCUG0Ft9bTziYdbVc4XOkUt2XF+KrgrTy/OnPme5683g7R6x/Nh9CKKaa7f1xhwvK/5zQGjNu0INwEOPld0r6KwmfnU6qm9CSXcvS4WDzarNnK6/WwC0cuxt5KE6HWUslwZsgDDJVfU3IX4tYjUnxFi2S6agQCNkBRAywEGeM/JkMqt+VrdIqz4/dKfR6yHMcNcz6adxNZ9sr6v/B+aZdvjmr1DaBXejXztRHduzmUr+bPsT+F/LOQ2EtIYiHUz5dlXNiUJ7S7FYuA2zJSBYsg5XYDtCqub9CkqD4n+RQTPElXsexAf06NBCkLN3Hz1OqPGVz4Q2Dv3/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0019.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::12) by KUXPR06MB8081.apcprd06.prod.outlook.com
 (2603:1096:d10:4f::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 12:50:22 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:192:cafe::b) by SI2PR01CA0019.outlook.office365.com
 (2603:1096:4:192::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 12:50:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 12:50:21 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id EA3C740920F8;
	Wed,  4 Nov 2026 20:44:38 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com
Cc: devicetree@vger.kernel.org,
	Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com,
	linux-clk@vger.kernel.org,
	joakim.zhang@cixtech.com
Subject: [PATCH v2 2/5] clk: cix: Handle Sky1 AUDSS DMA interrupt gates as an irqchip
Date: Wed,  4 Nov 2026 20:44:34 +0800
Message-ID: <20261104124437.296753-3-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104124437.296753-1-Jelly.Jia@cixtech.com>
References: <20261104124437.296753-1-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|KUXPR06MB8081:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cc3e79f5-c1ce-41c9-4981-08df3a72306e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|82310400026|36860700016|56012099006|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261022105027099003|261022075727099003|261026140227099003|261028144727099003|261026121527099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 2mFAlM9VNzin926Z5KEgYkXPDl8cbceeSNz4zcNKlh55KTu1gmBAgnXSFCluM5NuBFGwowDQhxm+/acn5E67YCeC6UE2MCBt4PyIe2P8FEMZOmq9NO3Lo6KURRJiBzAyMxmIw+b392dsd5017pDaMaI+B8TAsHD3ZfWxkspLNbHuur6wIiI9r5vzPzNNTpEq4QYCbfu0KftjbR7k7KpJm3Am/0TMLX0Ki1t9tbIQHbLWdauvWHAkTif7oeRDLS8Gyldcc62WXrLrXcT6StTuj8HlBaAxQKzdkrh+wbeuvNJTT8Sm7qeUg/0Dj9UypcVedbShWbgrxsNwdxP5mXUXbOCGwM1WtRqPXlR9Bx+G0F/ONq9w8ymwWPyIqCSRctJhzmQs5NVm09oth3CY3HB6VPEHOnESwRXErlZ9ilGJCzkmRMUMLB0+0v7rkpIXhpXbEDEXUZ/tXY7f02EygoPE86f8Q4RNlMHkhgDLxdtagpUhaMJiq2ei6+SliS+mZhUi0M7n3uBCHDjr1KHBr532eeADGFy56clDQa0VwQ3hw50S5UeD7c3BiIit/6GnuyurYOuRTuEjIn2JIVByl1rzUZpLdbKmDRCWDBvhyxwpmfq4jeM5HlcT08BX7q0jb0SLAXz7jQ286UAnS4rNJNBX2VczkebPLQaHN8SBtdU/wTXmz7/qfiPzRZjcc4N4rX1mkGMJrcTDYA0UNonJ8bF93A==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(82310400026)(36860700016)(56012099006)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261022105027099003)(261022075727099003)(261026140227099003)(261028144727099003)(261026121527099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ov/D3q/GmPH8LALM8NPhlhZslpEyUTE/wN0TPlVawBwT2aFZbBe5moQLClareSSpgUNuDpT4SI3ugDBE21SZ7XMSDDc42DFEltJMGQmuJQY1FUIa4K3PbGX/52xQBMBayJv6OqfLtQkKrpjAgVnW9Zw9WERGcx7OVCIC5IRp8d4gA6gX4qAuriGsdpdSooPznpjKkZyeChB1EcIwVFGjkJm88eoFDNcq9KtUHTbJKrQVwp2ik8tSDYgFkvWlS+xM+bMMlIYVNZWjuMeqFxofwsOzBfv7FwMFzIrPxABFQ+ApDUiziqRLwvxu6gFArnVRPda9a3qg9pgiUI1rsMJYCBaUrM/9JxC0pPDlENYJgotINFhPq9HKbrhfM9A7ZymTzOpSlRcdmbwMqhxWvDWbMTcna353eiZu82M539JbVAIC3DH4VmtxbWvKgK0ymVCp
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 12:50:21.5351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc3e79f5-c1ce-41c9-4981-08df3a72306e
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB8081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_045026_007981_EBB4DE73 
X-CRM114-Status: GOOD (  25.97  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	T_SPF_TEMPERROR,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The AUDSS CRU INFO_AP_IRQC register gates each DMA-350 channel interrupt
onto the shared AP GIC line. Manage these gates with an irqchip in the
CRU driver, keeping access to CRU registers out of the DMA driver. Mask
and unmask the corresponding AP gate through the IRQ core; this controls
interrupt delivery, not AP/DSP channel ownership.

The register exposes gate state but no per-channel pending status. Poll
each enabled child's DMA handler to check its channel-local status. Use
level flow handling so disabled and oneshot-threaded interrupts remain
masked, and mark the children as polled because IRQ_NONE is expected
when a different channel caused the parent interrupt.

Use a raw regmap lock for the hard-IRQ callbacks and keep the CRU powered
while its IRQ resources are in use or being torn down. Quiesce the parent
IRQ before runtime suspend and move system sleep handling to noirq.
Save and restore the interrupt gates and software reset state with the
other CRU context. Dispose of child mappings before removing the domain.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/clk/cix/Kconfig          |   1 +
 drivers/clk/cix/clk-sky1-audss.c | 181 ++++++++++++++++++++++++++++++-
 2 files changed, 179 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/cix/Kconfig b/drivers/clk/cix/Kconfig
index b057ef85fab6..de463ae63cb4 100644
--- a/drivers/clk/cix/Kconfig
+++ b/drivers/clk/cix/Kconfig
@@ -6,6 +6,7 @@ config CLK_SKY1_AUDSS
 	tristate "Cixtech Sky1 Audio Subsystem Clock Driver"
 	depends on ARCH_CIX || COMPILE_TEST
 	select AUXILIARY_BUS
+	select IRQ_DOMAIN
 	select REGMAP_MMIO
 	select RESET_CONTROLLER
 	help
diff --git a/drivers/clk/cix/clk-sky1-audss.c b/drivers/clk/cix/clk-sky1-audss.c
index e096b8121df3..9c8457334e17 100644
--- a/drivers/clk/cix/clk-sky1-audss.c
+++ b/drivers/clk/cix/clk-sky1-audss.c
@@ -2,9 +2,14 @@
 // Copyright 2026 Cix Technology Group Co., Ltd.
 
 #include <linux/auxiliary_bus.h>
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/device.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -18,7 +23,11 @@
 #define INFO_CLK_GATE				0x10
 #define INFO_CLK_DIV				0x14
 #define INFO_CLK_MUX				0x18
+#define INFO_AP_IRQC				0x54
+#define INFO_AP_IRQC_DMAC_MASK			GENMASK(7, 0)
+#define SKY1_AUDSS_DMAC_IRQS			8
 #define INFO_MCLK				0x70
+#define INFO_SW_RESETN				0x78
 
 #define SKY1_AUDSS_CLK_PARENTS_CNT		4
 #define SKY1_AUDSS_NUM_CLKS			(CLK_MCLK4 + 1)
@@ -28,7 +37,9 @@ static u32 sky1_reg_save[][2] = {
 	{ INFO_CLK_GATE,  0 },
 	{ INFO_CLK_DIV, 0 },
 	{ INFO_CLK_MUX, 0 },
+	{ INFO_AP_IRQC, 0 },
 	{ INFO_MCLK, 0 },
+	{ INFO_SW_RESETN, 0 },
 };
 
 static const char * const sky1_audss_clk_names[SKY1_AUDSS_CLK_PARENTS_CNT] = {
@@ -519,6 +530,7 @@ static const struct regmap_config sky1_audss_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
+	.use_raw_spinlock = true,
 };
 
 struct sky1_audss_clks_priv {
@@ -529,6 +541,8 @@ struct sky1_audss_clks_priv {
 	const struct sky1_audss_clks_devtype_data *devtype_data;
 	spinlock_t lock;
 	struct clk_hw_onecell_data *clk_data;
+	struct irq_domain *irq_domain;
+	int parent_irq;
 };
 
 #if IS_ENABLED(CONFIG_RESET_SKY1_AUDSS)
@@ -928,6 +942,147 @@ static int sky1_audss_clks_enable(struct sky1_audss_clks_priv *priv)
 	return err;
 }
 
+static void sky1_audss_irq_mask(struct irq_data *d)
+{
+	struct sky1_audss_clks_priv *priv = irq_data_get_irq_chip_data(d);
+
+	regmap_update_bits(priv->regmap_cru, INFO_AP_IRQC,
+			   BIT(d->hwirq), 0);
+}
+
+static void sky1_audss_irq_unmask(struct irq_data *d)
+{
+	struct sky1_audss_clks_priv *priv = irq_data_get_irq_chip_data(d);
+
+	regmap_update_bits(priv->regmap_cru, INFO_AP_IRQC,
+			   BIT(d->hwirq), BIT(d->hwirq));
+}
+
+static struct irq_chip sky1_audss_irq_chip = {
+	.name		= "sky1-audss-dmac",
+	.irq_mask	= sky1_audss_irq_mask,
+	.irq_unmask	= sky1_audss_irq_unmask,
+	.irq_disable	= sky1_audss_irq_mask,
+	.flags		= IRQCHIP_SKIP_SET_WAKE,
+};
+
+static int sky1_audss_irq_map(struct irq_domain *d, unsigned int irq,
+			      irq_hw_number_t hwirq)
+{
+	if (hwirq >= SKY1_AUDSS_DMAC_IRQS)
+		return -EINVAL;
+
+	irq_set_chip_data(irq, d->host_data);
+	irq_set_chip_and_handler(irq, &sky1_audss_irq_chip,
+				 handle_level_irq);
+	/*
+	 * The CRU exposes gates, not per-channel pending status. The parent
+	 * handler polls every enabled channel, so IRQ_NONE is expected and
+	 * must not trigger spurious interrupt detection. Keep level flow
+	 * control so oneshot IRQ threads run with their channel gate masked.
+	 */
+	irq_set_status_flags(irq, IRQ_LEVEL | IRQ_IS_POLLED);
+	irq_set_noprobe(irq);
+
+	return 0;
+}
+
+static const struct irq_domain_ops sky1_audss_irq_ops = {
+	.map	= sky1_audss_irq_map,
+	.xlate	= irq_domain_xlate_onecell,
+};
+
+static void sky1_audss_irq_handler(struct irq_desc *desc)
+{
+	struct sky1_audss_clks_priv *priv = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	unsigned long enabled;
+	unsigned int hwirq;
+	u32 val;
+
+	chained_irq_enter(chip, desc);
+
+	if (!regmap_read(priv->regmap_cru, INFO_AP_IRQC, &val)) {
+		enabled = val & INFO_AP_IRQC_DMAC_MASK;
+		for_each_set_bit(hwirq, &enabled, SKY1_AUDSS_DMAC_IRQS)
+			generic_handle_domain_irq(priv->irq_domain, hwirq);
+	}
+
+	chained_irq_exit(chip, desc);
+}
+
+static void sky1_audss_irq_teardown(void *data)
+{
+	struct sky1_audss_clks_priv *priv = data;
+	unsigned int hwirq;
+	unsigned int virq;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(priv->dev);
+	if (ret < 0)
+		dev_warn(priv->dev, "failed to resume CRU for IRQ teardown: %d\n", ret);
+
+	disable_irq(priv->parent_irq);
+	if (ret >= 0)
+		regmap_update_bits(priv->regmap_cru, INFO_AP_IRQC,
+				   INFO_AP_IRQC_DMAC_MASK, 0);
+	irq_set_chained_handler_and_data(priv->parent_irq, NULL, NULL);
+	synchronize_irq(priv->parent_irq);
+	irq_clear_status_flags(priv->parent_irq, IRQ_DISABLE_UNLAZY);
+	priv->parent_irq = 0;
+
+	for (hwirq = 0; hwirq < SKY1_AUDSS_DMAC_IRQS; hwirq++) {
+		virq = irq_find_mapping(priv->irq_domain, hwirq);
+		if (!virq)
+			continue;
+
+		/* Disassociation must not access an unpowered CRU either. */
+		if (ret < 0)
+			irq_set_chip(virq, NULL);
+		irq_dispose_mapping(virq);
+	}
+
+	irq_domain_remove(priv->irq_domain);
+	priv->irq_domain = NULL;
+	if (ret >= 0)
+		pm_runtime_put_sync(priv->dev);
+}
+
+static int sky1_audss_irq_init(struct platform_device *pdev,
+			       struct sky1_audss_clks_priv *priv)
+{
+	struct device *dev = &pdev->dev;
+	int ret;
+	int irq;
+
+	if (!of_property_read_bool(dev->of_node, "interrupt-controller"))
+		return 0;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = regmap_update_bits(priv->regmap_cru, INFO_AP_IRQC,
+				 INFO_AP_IRQC_DMAC_MASK, 0);
+	if (ret)
+		return ret;
+
+	priv->irq_domain = irq_domain_create_linear(of_fwnode_handle(dev->of_node),
+						    SKY1_AUDSS_DMAC_IRQS,
+						    &sky1_audss_irq_ops, priv);
+	if (!priv->irq_domain)
+		return -ENOMEM;
+
+	irq_domain_set_pm_device(priv->irq_domain, dev);
+
+	priv->parent_irq = irq;
+	/* The chained handler cannot implement lazy-disable masking. */
+	irq_set_status_flags(irq, IRQ_DISABLE_UNLAZY);
+	irq_set_chained_handler_and_data(irq, sky1_audss_irq_handler, priv);
+
+	return devm_add_action_or_reset(dev, sky1_audss_irq_teardown, priv);
+}
+
 static void sky1_audss_clks_disable(struct sky1_audss_clks_priv *priv)
 {
 	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
@@ -1110,6 +1265,13 @@ static int sky1_audss_clk_probe(struct platform_device *pdev)
 		goto fail_pm;
 	}
 
+	/* Tear the irqchip down before the runtime-PM cleanup disables clocks. */
+	ret = sky1_audss_irq_init(pdev, priv);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to set up AUDSS DMA IRQs\n");
+		goto fail_pm;
+	}
+
 	pm_runtime_put_sync(dev);
 
 	return 0;
@@ -1125,6 +1287,11 @@ static int __maybe_unused sky1_audss_clk_runtime_suspend(struct device *dev)
 	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
 	unsigned long flags;
 	int i;
+	int ret;
+
+	/* Quiesce the chained handler before registers become inaccessible. */
+	if (priv->parent_irq)
+		disable_irq(priv->parent_irq);
 
 	spin_lock_irqsave(&priv->lock, flags);
 	for (i = 0; i < devtype_data->reg_save_size; i++)
@@ -1132,7 +1299,12 @@ static int __maybe_unused sky1_audss_clk_runtime_suspend(struct device *dev)
 			    devtype_data->reg_save[i][0], &devtype_data->reg_save[i][1]);
 	spin_unlock_irqrestore(&priv->lock, flags);
 
-	reset_control_assert(priv->rst_noc);
+	ret = reset_control_assert(priv->rst_noc);
+	if (ret) {
+		if (priv->parent_irq)
+			enable_irq(priv->parent_irq);
+		return ret;
+	}
 
 	sky1_audss_clks_disable(priv);
 
@@ -1164,14 +1336,17 @@ static int __maybe_unused sky1_audss_clk_runtime_resume(struct device *dev)
 			     devtype_data->reg_save[i][0], devtype_data->reg_save[i][1]);
 	spin_unlock_irqrestore(&priv->lock, flags);
 
+	if (priv->parent_irq)
+		enable_irq(priv->parent_irq);
+
 	return 0;
 }
 
 static const struct dev_pm_ops sky1_audss_clk_pm_ops = {
 	SET_RUNTIME_PM_OPS(sky1_audss_clk_runtime_suspend,
 			   sky1_audss_clk_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				      pm_runtime_force_resume)
 };
 
 static const struct sky1_audss_clks_devtype_data sky1_devtype_data = {
-- 
2.54.0


