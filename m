Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A51606A333
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PHf3sJrj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=To3fWOoRLJzqLf3X3/o69QrbEd4fgxNMFgsdUeyxWp4=; b=PHf3sJrjJ8ZT4upO+o4gXIAuYy
	PoXW2SNhd5lGsZsE4QQi+Lo8XnbcB3d3bHD1CYqnjUuwm5M+89ymICi2yQihdJftmc/U4X0mWJCC+
	dBe/ahDRlvedSRr8aNn+vIH2tej2bHuIJpcdyZ4YZ3R8vDBI0s4wg5tUqfCzmW5tivfuA4OEiUd27
	diuDPNCYyJDxXK22OPK0Qa90DsKmplo3aV5A4E5PsS1y7QhfkA+myJ5da+PhXoycLxabhpxA/9fOv
	KWhButKzWNyWlAc97lceyxR5zTqa3M/+krp1p+W7oBcLlI9erNNCcypjEQz2qUPTAYyWXt1j6PsKE
	tcK2FcLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaRn-00000005Nop-3kUN;
	Wed, 04 Nov 2026 12:50:35 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaRf-00000005Nh0-0dwf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 12:50:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPl7VgToQbhw12zmZVQ/JEY2vtbB8PjUcYkDdtJMrMdE6We0CQ6izHzVaYT2MR9exCw2fMv/V1kHrV6m9caQFRtESaN6h/+DV6TbnLJtgu2rWyikiq7RcXnAkjIgGNkMjxi1HhRZM5YKKHJvj0A/5CeeOmM/H+2BaQv0f27auu/V6G7k12DznwH+lt6XUPZ2aYZwXb6M2j6rW+aaDPDYEElj4H7uhloDlHOk/UDkDYOdZJhSHqAgCskf2hvmh+Daws4JyNXJL35BhwH/3ZqjBg+q/Ct+u1v2Ofk7+Mvt2HuiHHLGoPt2nzDrtxURhEvyJiwB+WGl79jJaRCbVh31gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=To3fWOoRLJzqLf3X3/o69QrbEd4fgxNMFgsdUeyxWp4=;
 b=yQfinc3qR4Hhg8Z3JIhoque6D659IQSx9tugGjBsxmJy0ib01dlOdhnhOBjBeihllsiycL+7vekjplIiu3rqb6WtW76wzfMOWngXGhZAlIAhOQvdftqofol2RjF9Fa0RenRytEzQpvouK65G86CR4TBZ5gkmRm6ZabDcr4ztsIy9Nt7qrzDySiEvCvEWYoU/VN7Sv5+tiHwsmSIzcX8cMhX1mA/7CuH/ruWnsdNktYrmAHafvCGl3h5IL92aZoWhypC5jt7AxdSuWV3z/5Qxj6ZuobS1qnTeOdmrbhqtUcMvLFgq3SZrh1W/p1NJaulmxrmsy9iMihpRAxX/hV8eTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0042.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::23) by TY0PR06MB5596.apcprd06.prod.outlook.com
 (2603:1096:400:31f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 12:50:20 +0000
Received: from SG1PEPF000082E2.apcprd02.prod.outlook.com
 (2603:1096:4:193:cafe::29) by SI2PR01CA0042.outlook.office365.com
 (2603:1096:4:193::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Wed, 4
 Nov 2026 12:50:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E2.mail.protection.outlook.com (10.167.240.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 12:50:19 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id A86CA40E6384;
	Wed,  4 Nov 2026 20:44:14 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com
Cc: devicetree@vger.kernel.org,
	Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com
Subject: [PATCH v5 5/5] arm64: dts: cix: Describe the Sky1 FCH DMA-350 integration
Date: Wed,  4 Nov 2026 20:44:11 +0800
Message-ID: <20261104124411.296640-6-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104124411.296640-1-Jelly.Jia@cixtech.com>
References: <20261104124411.296640-1-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E2:EE_|TY0PR06MB5596:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8ee13f9b-fbcf-4609-de9e-08df3a722eb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|36860700016|23010399003|1800799024|10067099003|18002099003|22082099003|56012099006|261022105027099003|261102123227099003|261026121527099003|261028144727099003|261026140227099003|261021123027099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: VGujIibmvNHR8sGWWtOrMXDOIgjmoz0TazF8oUI6MwV9/0X0vtkV16HlNjCtZoPQa99C684dE2coS+oe9VMPnbX4286sa/8P0XGyzCmyO2QwZh2qK5aPhSqxbUqSY04B9rWyCkEqowrfFHP/RyyRSdiAuUOFnCmKuvNUJv0POdEheLo5pDhzo+Bey797qAFW0Ada0ICknnek4rqBW+DF970hId4qWBCmDt/UamhgWd3vYA8cVyQ0HcTMdfJBr0Z16+xO0S74+33j4nnTDMOGmjg32LgKwoisbSdM9dqWe4ifdZdX5+V6L8smKe4QBEFyemvF1vaIMi5sRvURCavYqk5h2IUSecOXlsGxId/2A2ZnAg5tt3b+2BNVb7C988vb/qOyFgpuVugVqCQXVL7SiA7rrWUKBEIdtxpQs+dDE2ejoX+vtUGOOWUHhVa0oDbD/spOPWN1sCNUYGtPugfPBXKKotrNzAh5wY5W121Y1oq6Ny4jMZKyTkdXgo68Lc2jYHFB5f1P5lrzpPYwXJmmjd6AOC0D12gUQdiWrB0eozXJdRsjWbXCoiXPENEFQl/kcrgkoMtbHzpu+sz+uGrEv0pQal6bRM1C4fdicPTAxcTewjwdQobnXc1U8TM0lxsWGDSmpu/fOIW0UzhA029yIYvISkPp4HTlxyTyPIcg4D8E62FvN1YNbcMJ8vTj1uDHqrlL72nXin0d1RTq23NTHA==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700016)(23010399003)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006)(261022105027099003)(261102123227099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021123027099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: kgVIGpNTpf/smb0psrCsgiMDQLVKcaxUDrVL+9yBSumKxHkyyKBKIeLCpbHDyESSpfQYKVt3pvroSjAe0jJOUviLIu+ilrRWLq7fNeOYHMMw59q8jUG75VorTG0DaYBDlQKTHBRY+zBgIb1kVJcUiefFvEQUugCwhBXGGEBRfbU1ScXWXXNJxmVK2452VxZO1JhvgRQfv5s2IMS+eK0O+mTidCYG9yYuJMYcLa3oeN6LJCGtwBqWCSDjVkOqQjl8d2Q9AOXEl4U4UNDlZvgnLLBNOq98bYygt0oy3MyR6iQl3jwqmujqX7iWNi49Ui0oHR++Vk0qfXwuRaTLXlpTRnlsumZlycEMZ0eUoUAh+N4Qv5c1K+BCOVEj0huQmkPkO/CDqGTDi7Zi9xsUScB5JUub+D91fJg9coK4Mui/NWhuorgzWBjWpitCeiNvDxMr
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 12:50:19.2502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee13f9b-fbcf-4609-de9e-08df3a722eb6
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E2.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5596
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_045027_211783_3C82D4A2 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The FCH DMA-350 master accesses the CPU physical peripheral window at
0x040b0000 through DMA address 0x040a0000. Describe this fixed translation
and the reachable DRAM windows with dma-ranges on the parent simple-bus.
The CPU register address view remains unchanged.

Keep the existing controller register region and eight interrupt
specifiers, and add its SCMI bus clock.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 36 ++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 0a820f45feb9..cd498ee7e9a7 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -518,18 +518,30 @@ iomuxc: pinctrl@4170000 {
 			reg = <0x0 0x04170000 0x0 0x1000>;
 		};
 
-		fch_dmac: dma-controller@4190000 {
-			compatible = "arm,dma-350";
-			reg = <0x0 0x4190000 0x0 0x10000>;
-			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
-				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
-				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
-				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
-				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
-				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
-				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
-				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>;
-			#dma-cells = <1>;
+		fch-dma-bus {
+			compatible = "simple-bus";
+			ranges;
+			#address-cells = <2>;
+			dma-ranges = <0x0 0x040a0000 0x0 0x040b0000 0x0 0x00040000>,
+				     <0x0 0x80000000 0x0 0x80000000 0x8 0x00000000>,
+				     <0x80 0x00000000 0x80 0x00000000 0x80 0x00000000>;
+			#size-cells = <2>;
+
+			fch_dmac: dma-controller@4190000 {
+				compatible = "arm,dma-350";
+				reg = <0x0 0x04190000 0x0 0x10000>;
+				clocks = <&scmi_clk CLK_TREE_FCH_DMA_ACLK>;
+				#dma-cells = <1>;
+				interrupts =
+					<GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					<GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					<GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					<GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					<GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					<GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					<GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
+					<GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>;
+			};
 		};
 
 		mbox_ap2se: mailbox@5060000 {
-- 
2.54.0


