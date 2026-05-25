Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9D8CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 10:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CnP6fu1gIF8/BeJwmQenLDKjaBsUwE5zDv/qSLU/so8=; b=a8boPSLHhrn+vN2zKh+VjTMYk9
	IX8GQg4c/YSJSH5az79Las1QUGFWCmnNIFG+IF/GZLqX1+3H1YQ/joBrdJLFFtHg56T8pwzYEmgfS
	5f5HJPoAO+n4RNWhD+uSddiyrtTLRcEumMhP4n9r0RjEH+xf8vCFKLQ9Il/I11led58JDDhsgxWUF
	39lxJEzgC/ksx8lACChNxvqblOt4FjgwvLtpNUOAjas2fZqupz1DV/HFA7+aB1FShHGHMrw0g3YSy
	CwQffeIQHuvqb91i3Qa8x1bBSXe6PbAbtAHHIuVtP0RV8bLn2eySlPaNQBtSzdKodeJeUJs5Yhluz
	oHISXCmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRSto-0000000GzWC-3j0m;
	Mon, 25 May 2026 10:51:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRStn-0000000GzVZ-3Ub1
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 25 May 2026 10:51:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CnP6fu1gIF8/BeJwmQenLDKjaBsUwE5zDv/qSLU/so8=; b=jsTVVsBjjCtvPKpBXAwWZdY9GZ
	0I8gIrPSj5pvJfjl9xBkJLDB3vZSGI2A6KlpnxefEdFKgPLWrLqLMi+T0BKoJ7cQ9ftYlPV6TH9om
	diZrUdOzlZ2YwYAEce9TPUoYXukaMykRP8Z57mSKMJBvKBqJhbbZYYQ4R7W2zbuhYYExfZNDLbCyw
	HGeIRG8QQzzk9cpWF0TTpmxhx0N66NjtL8I4WHlXvAyx4M9pRtVycF58cbmflsT3ezaZkO1vWk8j6
	3ypv6wXZoj2yezQ/UheyVDxtBbqO2ZjN/CffbsJaNpoFx/cyJh/dLvNWlXM/1+Ufnc3E5BaiubqGD
	3HoMieCQ==;
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRStj-000000092S6-2FCt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 10:51:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iWopx/P7X3tPeAjLq2MUu8eqwjJ3DeM9EcqqjjFxjDRZmUa6P7WAITMnE9pJqxGvRR7dsEz3bZ/tSx1TCQpgg9IFMTiEQ9QiWRdAdpT2l0fg7JMeLLXp75gtrjfJEalBTqmd/f8rCOLT8zCrc778TTfOD0f67CpqQz6dpEQ3LTAJy6ZcL7F3TLTI3zI3NZ3JXk3NzveaCdkl80OPviKrEVeg6z555T52HRedn531grp+vWfqg2ulLWo69lY+HX/pSrBeV1otaJPjNpSHqxo9JsOogCqkMMuq1R2VKoDl3SKJNnzkDptcy7IpdliHrPK9szFZ3BMEqtpquwzu5dJVKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CnP6fu1gIF8/BeJwmQenLDKjaBsUwE5zDv/qSLU/so8=;
 b=OkBRmAMnl5aIKpGPrm9puixp8Od7pSfw6hDLzw9m6wf6g1ilyKlADdaG9pdW0X8vNdj753rEYP2f5rBst1jUZNHJ3yRertUWIRygRb47v2aSeNnj9STTYkWH7hLziIpUwg7t/poQxKb+6E/KnzZb9ixmrnbK2xa0vxmJcGbzro69MBV6KxAb+XsZFrckqSr6s6DfuOQDbleWANvRqLOgKDuxRg4Xl11pz+nPS1e82VXmDhvFIAE6azW1rJz5+8iD331oQgn8T+5Iqk2kIGy4Qwq1FVVNl0HSO7m5mTBmeZ108TLSASUmAoFFsnDb0XZF6xyYvzMZCNCO+MR6SaBobQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CnP6fu1gIF8/BeJwmQenLDKjaBsUwE5zDv/qSLU/so8=;
 b=ITYB4/wQ93I1aoxt7c27sGQptGqlKtg3dG8xn9W7lPPue6dv4hUP2UiDf8aZc1ISyojph9s5r+OTyPs/x8WBHrnH+RtLges0zVK3QxXbu48DDy4MK5rWKYJuCCnEfy0Mp4VC520Q+ZULo3GMER79LhTEIk2Jyp6Ez61abq6+fdY=
Received: from SJ0PR13CA0156.namprd13.prod.outlook.com (2603:10b6:a03:2c7::11)
 by SN7PR12MB6768.namprd12.prod.outlook.com (2603:10b6:806:268::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 10:50:54 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::a7) by SJ0PR13CA0156.outlook.office365.com
 (2603:10b6:a03:2c7::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.10 via Frontend Transport; Mon, 25
 May 2026 10:50:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Mon, 25 May 2026 10:50:54 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 25 May
 2026 05:50:53 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 25 May
 2026 05:50:52 -0500
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 25 May 2026 05:50:48 -0500
From: Golla Nagendra <nagendra.golla@amd.com>
To: <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nagendra.golla@amd.com>, <jay.buddhabhatti@amd.com>,
	<harini.katakam@amd.com>, <m.tretter@pengutronix.de>,
	<radhey.shyam.pandey@amd.com>, <abin.joseph@amd.com>, <kees@kernel.org>,
	<sakari.ailus@linux.intel.com>
CC: <git@amd.com>, <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] dt-bindings: dma: xilinx: Add optional resets property for ZDMA
Date: Mon, 25 May 2026 16:20:41 +0530
Message-ID: <20260525105042.2249542-2-nagendra.golla@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260525105042.2249542-1-nagendra.golla@amd.com>
References: <20260525105042.2249542-1-nagendra.golla@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|SN7PR12MB6768:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c2b8730-3d57-43ad-c6d5-08deba4b7ed5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|1800799024|11063799006|6133799003|18002099003|22082099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info: 40uMJoUmT5i5EgTUhdB0VutulGuZJYmef9tENevAr4L3yRjl59ViquKsK4NfVxe3cXH4QrMEg4hvkcpqGTpKUXSyUZH02/QJCnmckfu9aJOfmo0RGhVPUE2m+MTScfddrQgpsz4HKMufL1kbA+ntC2I0pJ6aFVLF3fhV28m8QCDW/ebOAcYyoYuQ94R49DxApEdna1jFJka9qgljeo00buW0vtAtVqR7OUWlJolFLa3za99zpiQuMCYF+6jVJzYsxroujSySkYyOWtFT/zNmlcT5Tyw4ZyQS6+O/g+PcpynORCQ9qHvsOTe6Uai0OWpUku6zJaDMfCT/+tosaz4md4kfoDKfTXx38kteNImgDu8xvv7/eQmSIywAjOJ9rMzCJJjwmu5Blvg5OZhSVH/YQWSxQPr+JuL9yu5Q88munHnHU2HQDpmUVmbnZ93ZYS5LYeUoj9SjETReZuuj9TLSj2EWqpAHqfXy731U5V9hXgBny24NlV7xANYuz5sMRF3f5c11UDuE6qfOGQFjzs+3UyeHM89x5baQcv6wJ2SZ4R2invX06ssi7tCXRtoxVgzW7zZSSraFtr7AtZW6Xb3ZNraMyh7qIxyWhBPKTr/F8H9zakzSgqEzMnYzmw/qK4agf9ZT5+bGwqa3IulQyP458cezXLI2tdW9WtklY4ybAIiSSYj8qNRo5u+2sfRvIloi1fYP50GQMXhxXEdk07FYm9jr8tSQX4wvRf+YqveV4RYwiXMMh2vuOcIK5b/cStdDZMsjDi6bJeR3ch7h31+A/w==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(1800799024)(11063799006)(6133799003)(18002099003)(22082099003)(56012099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: v9kGM48VHWIlN7dMGZjBoLdgyQXmgKVkwSXHVHescIB1DqQa2LFK9SyMQ0SLcPkvlOWrdqM4xjZZRJVYwRUfdt7EoN4KSPmTSaXfaZzBvdtM4ewgmYKzoXQORnA0VM2PTtk+8Er6Zflv+EBze6dFR1eyYZ9cjLBW1p1Dkke2nnZ1X66VQ7hfc2Q001D6D1H2WS1s36/4h55zei3vUMvUCawImzdEqUDY3wdrIMZpJKcd3G2tsidZca2/HluNdjDVPksWUY1jUplIV+hneaqb6+lQNVjDljcQG9u2yGUzcF+uS1aG0pbkeZlSNECMMIARzYRB8Cpv+ANnB5yz50dt6QsjQ4Pf45SIjg7Sdzcm3j6NkFieUMqssn9MQ3iBBKsc+j3xpT7JhHS+HEDYlqYxfFkzpbZj6+44BIijrXR4kdP46UF7+HdE8Y7G4Sd4GSm4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 10:50:54.5107
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c2b8730-3d57-43ad-c6d5-08deba4b7ed5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6768
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_115104_072224_820E43AB 
X-CRM114-Status: GOOD (  10.08  )
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

From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>

Newer SoCs such as Versal Gen2 and Versal‑Net expose a reset line
for ZDMA. Older SoCs do not have this provision. Add an optional
resets property to describe this reset.

Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Co-developed-by: Golla Nagendra <nagendra.golla@amd.com>
Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
 .../devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml    | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
index 2da86037ad79..dff16763e11b 100644
--- a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
+++ b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
@@ -56,6 +56,9 @@ properties:
   iommus:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
   power-domains:
     maxItems: 1
 
-- 
2.43.0


