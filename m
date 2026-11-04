Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D890606D82A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 14:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OVv69Zbo;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=otxGw2b7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+7kNUG83Oj11M0j5M3QsDAZT2F095k4U5l4Fjw41Iio=; b=OVv69Zboqf6ynDlMdYseVsIanM
	cWdWrfJfS/QPc8hjZX5X2DZ6BlXJaMiqB986sSTl4z7zxl3DIM0V7bKwRlVsK/ewGCGZ6CQK3lNue
	raPIPVGKSalp6kLPpWOCCD+tyfmRGoQ0URc+XW+u/UrI4hn9QSIwocdQ4unW/zwymBYsxuVag6GR7
	0vRj1z1SnzU41YqYMeegoOuzqxzTkTKIohyJonUKpwYBKds6/T1tjoY17Bhrynli4YBDvtw/eg1We
	DYwZt40XUhFeHOJTdw2vFROcQEYlwMvcGYres7PGl3Sc2iXpVR7EILyY6YbvISp3A2yYP5VmqcXBE
	uPJykCHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObZL-00000005Xgd-3Jbq;
	Wed, 04 Nov 2026 14:02:27 +0000
Received: from mail-westeuropeazon11011063.outbound.protection.outlook.com ([52.101.70.63] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObZJ-00000005Xff-3NXE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 14:02:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/BD0bRksNpq28ucujwDg25SBTI+aoCTN4LmXXRwPVCTKTI9app16xlzlRH0DCF2iJCqFDm2r07EvjiNSFEt5fe24Nci9p1BH7N2UzeZ1irYFEYFLj8RY3BbPY/UnPgXI3E0cN5BQL4I5RvBp1fug4yq4JBUOK0Mai9MD2RrPp2RBztNpNpaTHnPwKMpjinnkmHGOKfwwwXgtHnDXCGKHmEpmeeqODCbPdG30XBPFFkBE310YhEje8pcXqyFeBigoAWZZAHXSPNAQxCZAvykVTnqihr0nl8SosPJ1OVC2uUBxgaXrf7FO800Rkjb6+IiK+9DfvHZG+yEeYD26u07vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7kNUG83Oj11M0j5M3QsDAZT2F095k4U5l4Fjw41Iio=;
 b=n0sFuKakip3HSDltIet05jLJad9zkT0bkTv2o2O8qoFkrFwf0pQFUv0mhwHUkVuwNzrnDyv7jdjMWSoZKulFbOjfdN7ZbpAQOCL9hfqyVj5IpdpoNVw6hNFf4rPqQmWqFWM7p59dUjixJZrKIo0zcp/8xt+uUMCa0BFz7ltlFmHMIglW58jfm82KYQTewOtc6fyL3XrykEsUJMIY5j+yjJ1LZm4zeYKE/Q9jfmyDji33KVGTBf2hU8H/ybt0sy8nOHL7f6KGFP0ZYugZ5atPfxBT1O4ZKOMsKetw8TDIfIqxYnd/vvG5nubQu/6tK0AHJAWaV7WRngkpHe89mc9XBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7kNUG83Oj11M0j5M3QsDAZT2F095k4U5l4Fjw41Iio=;
 b=otxGw2b7TPVNxfPQ3Lxf/+aN6zKZoGrAJ+0WdRAChn/6lao1UvRpWNtoYXWv5+Z1XkliYwFlZ/ZBcbqHkNTd2HvO/wz7Yjr16l0l4x/vQgx8vYI8NVsfMN5pfnqymdqqNMHFMmQHNYcczD2ZSjfaup9tlsT29CEoKpsHcWUctgh+r904RBukM2GOAVVEl/HTJcFj/ymZHp+n3aEVzS/i5hdb0k6iCe2hjKkq/Cwu8kZziLW10hL5AM2ADlDiEzpIQLsP9Eip08xmMkRY1o5ISyUzuu+owL/jNzrIMhppqyvmuT5Z8PjNAvdZF8IfOdpp7waerZolxRIZOLN5J1f/3Q==
Received: from MI1P293CA0003.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:2::19) by
 VI1PR10MB3551.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:13f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.10; Wed, 4 Nov 2026 14:02:19 +0000
Received: from MI3PEPF00008552.eurprd05.prod.outlook.com
 (2603:10a6:290:2:cafe::17) by MI1P293CA0003.outlook.office365.com
 (2603:10a6:290:2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 14:02:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF00008552.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 14:02:19 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 15:02:47 +0100
Received: from localhost (10.48.87.100) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 4 Nov
 2026 15:02:18 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	"Alexandre Torgue" <alexandre.torgue@foss.st.com>
CC: Linux STM32 <linux-stm32@st-md-mailman.stormreply.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 1/7] dt-bindings: power: st: add STM32MP PM domain binding
Date: Wed, 4 Nov 2026 14:55:04 +0100
Message-ID: <20261104145502.1.If3d55e03486413ca40ac73f9bf07046e76a00f0a@changeid>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104135604.907283-1-patrick.delaunay@foss.st.com>
References: <20261104135604.907283-1-patrick.delaunay@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008552:EE_|VI1PR10MB3551:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ac9b8ef-2e9e-4c83-5b2c-08df3a7c3d71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|11063799006|56012099006|261009223027099003|261021135927099003|261021121427099003|261021123027099003|261022105027099003|261028144727099003|261026121527099003|261026140227099003|261102123227099003|10067099003|22082099003|18002099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info: D1LuatDhV+Fik/1bUJ2O1n/S4Ug3r7MOrvyxsC6aYbfmTA8xY2ALs2uFZNINzt64kFNIrQEGjZjCnBcIg/4PsmGUKl1irwCYX6y8lN4TqLGPJPDdmHjM5xRob8VgDv3Ha7fKvkM0rjaECn+qC2eg8nerh/baGY56ZPS0OnJLVaPvnYn6KFZ/laPHLk1HahyROLzobjXGUZ6K/0VZzG2plEUuheu184qi/YeG8dVvm7R6ASQnoq3D9WtgPt2d2IZYpYt+1nMhfg0nUrQbP/SQHk/s6Wu56zshpttyoA6eMyQ3c174FZQfqpAm8u1Q3dvH2EGV7/2eKv45OAHVs3QoL9uWSMc5IShK/mtalf6R9QTxhNp4KesDirZwnAx0lGspOVLMPJDBw6HpLbQVI2DdxxWDRTPSBV5npbl+4oCusTKnaggyyOB16H4I5+JD89pBgtv2C6hkiZeTGbwX+XxwwBCblCTLxmqWoAyao01s0xlxdPR2CvpcLvyEGJujkosRxh4V6rdSOoivHj+JjEuC2E9YxZNzjxcocmWesWYD1RAKCCNv3QblNg80jf236qe70y8HHlaEEaizY2QNqAINiZUCHtuTd0ide4/aCLiN/m1sZC5XPJFz7RtFQA9vbx23c+4HDMlNBROCEw0fiihFPw==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(11063799006)(56012099006)(261009223027099003)(261021135927099003)(261021121427099003)(261021123027099003)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003)(261102123227099003)(10067099003)(22082099003)(18002099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: vC04OUO37DFPF1lj9/CfzxA0RdUVuL3CNoOTH7TwG5uZ+ttONw9Knr+tY7IhESOkgQXXP33G04MJt/s8HeCBWUA1mnd5K5Hb3YE4TOjr2FyBtSE0YX5wMWg6hXget7dxDR7VUhD77z6DtP4NLiX4M1yEb5a13oPXDBfItpF6nplrG+G3G93Wam50r1XRR5X+ULm8fLfYQhMsFFoNix4QyRTxD+eZ7yQTfLECRmnM2jtYsNoaTvOlCA0OdS8Kd5kRFTDBJ1hvEULvy92SGEl4UtRw/FnzcBTdBLobsFxWDkC742Ui/QnmF83cyKjy5YIZregJuVb6Etnsx1fcrgYjRcnY9eXxlCuWOOvMn1TWhq5/TNHZePJjA3eSsTwTEHXhenVI7r4veQZ67iBOhADhpzFQC9rp0iWZomSGqk/5xAM0I3vZ5y2sPXU9Dr4HcYxi
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 14:02:19.0787
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac9b8ef-2e9e-4c83-5b2c-08df3a7c3d71
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008552.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3551
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_060225_975367_9924B39C 
X-CRM114-Status: GOOD (  14.36  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add binding documentation for the power domains found on
STMicroelectronics STM32MP SoCs.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 .../bindings/power/st,stm32mp-pm-domain.yaml  | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/st,stm32mp-pm-domain.yaml

diff --git a/Documentation/devicetree/bindings/power/st,stm32mp-pm-domain.yaml b/Documentation/devicetree/bindings/power/st,stm32mp-pm-domain.yaml
new file mode 100644
index 000000000000..4ab477fb4499
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/st,stm32mp-pm-domain.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/st,stm32mp-pm-domain.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STM32MP generic power domain
+
+maintainers:
+  - Patrick Delaunay <patrick.delaunay@foss.st.com>
+
+allOf:
+  - $ref: /schemas/power/power-domain.yaml#
+
+description: |
+  The STM32MP SoCs contain a D1 domain which defines the devices assigned to
+  Cortex A cluster, the devices in this domain are functional only when this
+  cluster is not in low power modes (Stop modes) with clock OFF.
+
+  This PM domain node represents this dependency, based on PM framework and
+  without wake-up path support.
+
+properties:
+  compatible:
+    const: st,stm32mp-pm-domain
+
+  '#power-domain-cells':
+    const: 0
+
+  power-domains:
+    maxItems: 1
+
+additionalProperties: false
+
+required:
+  - compatible
+  - '#power-domain-cells'
+  - power-domains
+
+examples:
+  - |
+    power-domain-d1 {
+      compatible = "st,stm32mp-pm-domain";
+      #power-domain-cells = <0>;
+      power-domains = <&cluster_pd>;
+    };
-- 
2.43.0


