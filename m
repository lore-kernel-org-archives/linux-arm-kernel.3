Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDE5E9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 09:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JiPRIxo+IMLzu0n86ZjOGSxyqY2mQX47qBoDcQU90v4=; b=ptMHshBw+RAv7u7dnj1TV4eqGc
	UoSfxqR2L43FelATNrcyQmqrcEOmlh5X4wokm6hcervjbY/734HwUZ7TSMCz6MVlM7nFQ4xetJ0vv
	n90htKOc5BgkFXuNcr1kKifkPm4/5A4c0PyEMf6b/P3QsKu8iBquhQu0fANy26cCXGoWsjCOnyzp0
	74vXPIEyigfR57XKl2Sh4IDR+P1gSOHMoNDmDSaxIKEBW3z0Afd5V+wDl7NIFTdwbyiDvZWcLkNuU
	iKGhn3S0yUE+N8Opq/DbolwM1zhbt1wUzb9epOQqlUzqjM/NpfEnw+06XlEGDuqJlFNPzHfQLmJl9
	HWnAQp1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vseG8-00000009aYa-0lYk;
	Wed, 18 Feb 2026 09:54:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vseG5-00000009aWC-4B1N
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Feb 2026 09:54:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JiPRIxo+IMLzu0n86ZjOGSxyqY2mQX47qBoDcQU90v4=; b=CdoUPOsys7i8QgWpkjF/e/HaSy
	+XLTBMI9jfzqbtdCefQm0+rZ48c3VmImLa7OT3PzqKYZNrbsZAXzLOK7bobriZzoa8ySK+zwCkCWe
	A7F/JtDctNsfNwBAaWxN0x5VaMqCr8l6UXR2Vny8X/D6YcQGGQw7plApONXZDUYY3khZ0TiPnSUO6
	AQhHunU+R+9Xao8hny3hMzWX7DI0kHTanEhNyfgg0hF3ggVkH+HQQtVhMirrJ0f/Q0lyXZDEu0G4i
	BDQG3FDu5uEpL4gHaCY/apsNWW9qQv5gVayqyiZra5K8RhUMOVv8Leg51dHuxXaz14RzuaervYfFp
	KTO45dWA==;
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vseG0-0000000HBqw-3j78
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 09:54:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pVIXe+czxAg6vnvV+AZZ9uejtEemvabUeSzxV5VRdd7/ywMXOlc2zE1/RUS8Pdy//TkKYRphv9vRKiYwgeBb7xLK05T8pL1yRYrKcqZEfFrqmWlp3k1whsXnvG7qCKJaXIdKtWesd6ShBoTnGjC1RXTRVRr3m3x99bQwSkX2OpVMmoMeZOmwBjvjYBYcBEvTWHA5I3im8g4I3JW8agMbK0fwnI6NHtrwdGnIgwU4nVazgQ9hNZWBchsoC5eUPjxn4H5Q2c8bUN6vKNeWrI+uUwIyj+u9gn9tNKYQGHi8O2KoyxUABhA6I/qhPy+UgmlWvoGtE/JPUdlt1B8r48CRDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JiPRIxo+IMLzu0n86ZjOGSxyqY2mQX47qBoDcQU90v4=;
 b=Unqo+t1WWt/NW3XJThiQjNxvxtUp3B9uW27wafe1tG0LxcQvchLkHhQLbBpbaj0+9NYylES2VAfZqpRqvG7OXsqNiIK7HNyPlU4E+bglxoiffKw4EzBZx5KWOPiTyyZ8oQ42eSJXk58nV4n6+sMYsPfRY5+OCDpYK8f/6PxSkjm3i6tJFFGbhTHNYKvkuDY8GIqF203jBMQXoQuFm1dVBhrhZ+Bb10dSyEZyMGn+RC/or7z/8WZU9xtnwiD6SjjtuUrtbsF3Nc3sK4pidoL920YnNHiS/lGkgsx1RW5GoXUcFs8tKaI/q318eWSE9LVo8iQrYZqf/RlOGLgAJLbIag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JiPRIxo+IMLzu0n86ZjOGSxyqY2mQX47qBoDcQU90v4=;
 b=RtCxAY7UF7qkIVAN6rujSNAIDcDrELgySXbxpiHB9KoJoj9OyzHjmmFmLGRRZ2hE+Tws3o3kHKjtt6oARjvs9DIAgbSUsBp4E8JRhxh3YKjbUA02iWq/L4Hd97jxIZNEMqWqWd/w486QE868hDSY6yHnpcSXTQF78nTvsrTGF4A=
Received: from BN0PR04CA0203.namprd04.prod.outlook.com (2603:10b6:408:e9::28)
 by MW4PR10MB5810.namprd10.prod.outlook.com (2603:10b6:303:186::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 09:54:02 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:408:e9:cafe::5b) by BN0PR04CA0203.outlook.office365.com
 (2603:10b6:408:e9::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Wed,
 18 Feb 2026 09:54:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.0 via Frontend Transport; Wed, 18 Feb 2026 09:54:00 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 03:53:59 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 03:53:58 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Feb 2026 03:53:58 -0600
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [172.24.233.239])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61I9qpIK200561;
	Wed, 18 Feb 2026 03:53:54 -0600
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
	<ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
	<Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v5 13/18] dt-bindings: dma: ti: Add K3 PKTDMA V2
Date: Wed, 18 Feb 2026 15:22:38 +0530
Message-ID: <20260218095243.2832115-14-s-adivi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218095243.2832115-1-s-adivi@ti.com>
References: <20260218095243.2832115-1-s-adivi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|MW4PR10MB5810:EE_
X-MS-Office365-Filtering-Correlation-Id: b2a65cee-0ad2-4b72-3e4b-08de6ed3a40d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2Of9Eyp80HGYkT5n/SfBNgkyz1tsb34fnL21H+hzYNMI5nRtlwPz+MiEHjjf?=
 =?us-ascii?Q?/eV5jRlablOjpVtynfkHVTU1r3QxXwvTxBkHYV2VERqi1PAlcvPmYKydblV3?=
 =?us-ascii?Q?vWkpqmLg4BmF1Gz4DhVBNnn9PDjmEj7Iz2EiORnZvo7Zg1woxo/mmiH/fa6y?=
 =?us-ascii?Q?QkzdVrROuffbNMSiyO93SSIdI9sHTIM95r5oU0NAw7QNrrKAs5xfVGKPLx+x?=
 =?us-ascii?Q?Y2OPIUgJTT7hbpouH5elgksoqDBg7eNR/y+VK5EZ1AlMne4cgTIHRZf9CjBM?=
 =?us-ascii?Q?RpQK/QslUpCy0IwKph1uHdxfzsmkgJ55ypNBycqT31ZZCNxK8XB4NmpIp+5A?=
 =?us-ascii?Q?T+RV2wCVDAvj2lE0h8WKVSOOy/c5AvBu0b+Bi9cPbcpuEP9g9/+W4IxsCkdA?=
 =?us-ascii?Q?deN6KfgtQ5i2P/YWY43nsOf1jvBaQXnPPLEJJ5mdjsZrxPiiZSNxGgofeaqL?=
 =?us-ascii?Q?XhGsiZLU4MreJqVsX4nvMAsWsyGWkTdJv5lQGzKoOT7kdqNiS3LkrdMWLO6x?=
 =?us-ascii?Q?iyGZPs6ziDXCmrqh7Sw1wGJE2YfwxloNLpdEWtbpOq3g7LWNELKMEeZAi+xh?=
 =?us-ascii?Q?23HXk7AHI1F2AFz5eUnj5inyhG4TJrcPQBVuMYdSpX8vZKKP8jHdYKSLVXwe?=
 =?us-ascii?Q?gpmQGzS/OR8LmyUoBNi+TYhjWVz/n4lQJkP0GHgXlgn+NvBGUVY6+0gG7RW7?=
 =?us-ascii?Q?I4S4xD7gqi+sn/3th26r6791kuckxT7PqQnntH+flW2oUSz/frJ+fxXwHi1x?=
 =?us-ascii?Q?YosiVumAtY+97bD93MxtZwMv86aVdnz7TPZAhh382BRhKBECkqqhuS7fDLul?=
 =?us-ascii?Q?hxPrylbl7Imca9bgxwgfwwJCBfc8jKDhXeY+UPGQ1cqOuZ6MxWFKzrtF32+N?=
 =?us-ascii?Q?kxT9fG+LiolgKARckoZ353551wnhiq+U5PajBHVnrxTFZfCdzkfCMS9mp0yc?=
 =?us-ascii?Q?/nCMBKYQSSyl8aKgYUXbxkJrKunOxS47uhIeSmHXr94Ab77zbVEW0iwGf7h3?=
 =?us-ascii?Q?/kLCZjfBcSjkuOc7Cw424pRgJ7zqTxLNNO3ANNM4F0N8Y06QVs5mVPC3Op8y?=
 =?us-ascii?Q?HIvlKusI5Wl68InsPPAh4szZIDpasDn73PMhfFy3LUgBS8/a6inZziR7pSyg?=
 =?us-ascii?Q?jLP/lYu9SgCakOodiGpZRcGD3cya0rcCZnBrKXRXcFgQYIKs3Cn7p9SdHj4A?=
 =?us-ascii?Q?BfIdBK8lEkkdlmJQrmbtN5/3HKw/4SBBp3DdhDNnmojBmitBrwU09lRR8oe6?=
 =?us-ascii?Q?I1VN+xcyNZRaCawerK/3irQ2ekfsL9i33kepP+1xn5sEhJilr8QWbEfikMCl?=
 =?us-ascii?Q?T6lDv1zt3d3SzoVwWa6uebly69131MFjZ1YsILTm7ZyQJZX2fE4XynGMQtfW?=
 =?us-ascii?Q?PBM+VwEkh93l2SqRGuA2LLVwC4DnUxr4lrFOIpIJRsSS8l+1dNuFBuhxCOvW?=
 =?us-ascii?Q?l2y5c9Ph1CFt9A3hf0R8S/4u6aAVFeBNnbqt88LGsUyW30Flr+2dxwaBAjQs?=
 =?us-ascii?Q?dQONxnfGxwn7dvDlgTEHB8wdB9OLzEaSFZ9yH8VrbYMqWqZ3PlxC6cjdpLSf?=
 =?us-ascii?Q?zs0jmDLR4RhKJlnw9E2lUx/paMwN6a3FgfuAagqYUZlWE2zIg7fx/ckaC8Xq?=
 =?us-ascii?Q?1Mk4GSMrb1E70Pg8FCXJbsy1GynoKHiLDq93mkiOa3nVcAP/s/mjPodSh5nB?=
 =?us-ascii?Q?3ra9/MipIN/A8ub3pmfx+j6WZ0o=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TIkioAgdhZse+o7WUNTkZrwBrlVnxt8XBlfH87oUZZPAc6VR835lQuKLWg4gLOfyjhpapjJMUXxN94VmFgjOqDA/t4xKZg8CnNQfjwfKpR/ljuKu/yXu4M7MBOAzh5OFS7ij22AZ5aH0UsOdkhnqvHNgfTS2+r2dBqFtQ2zgYKM71YuOhmoPP2sqSne9858tt9ceVkwavjm3JJy0xep2jWNHAaDLXIAXKeIJ+XJOUwuFDThQkGGv25SqTJ0Grp73o1Q+kEfhslTyYcRlS8KEcw/aLiP2hdcDVansmW+++YM0Al+J+gpa6kws4rBpmoU+/KRgyTJwjoOiPVJboYKdcdrF0u14vUhqPogJU+mNsKdjkkjCA2yw6KYfqv+GjurY70o4KPLyWfQJuMFV88a3nNZep93W+tUZ5S6BAqDzQCqOpIl5ogSyXGIMxDaFcYhl
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 09:54:00.1481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2a65cee-0ad2-4b72-3e4b-08de6ed3a40d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5810
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_095409_019574_5B5FC367 
X-CRM114-Status: GOOD (  14.39  )
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

New binding document for
Texas Instruments K3 Packet DMA (PKTDMA) V2.

PKTDMA V2 is introduced as part of AM62L.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 .../bindings/dma/ti/ti,am62l-dmss-pktdma.yaml | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml

diff --git a/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml
new file mode 100644
index 0000000000000..b7a04071b17a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2024-2025 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/ti/ti,am62l-dmss-pktdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments K3 DMSS PKTDMA V2
+
+maintainers:
+  - Sai Sree Kartheek Adivi <s-adivi@ti.com>
+
+description:
+  The PKTDMA V2 is intended to perform similar functions as the packet mode
+  channels of K3 UDMA-P. PKTDMA V2 only includes Split channels to service
+  PSI-L based peripherals.
+
+  The peripherals can be PSI-L native or legacy, non PSI-L native peripherals
+  with PDMAs. PDMA is tasked to act as a bridge between the PSI-L fabric and the
+  legacy peripheral.
+
+allOf:
+  - $ref: /schemas/dma/dma-controller.yaml#
+
+properties:
+  compatible:
+    const: ti,am62l-dmss-pktdma
+
+  reg:
+    items:
+      - description: Packet DMA Control & Status
+      - description: Channel Realtime
+      - description: Ring Realtime
+
+  reg-names:
+    items:
+      - const: gcfg
+      - const: chanrt
+      - const: ringrt
+
+  "#address-cells":
+    const: 0
+
+  "#interrupt-cells":
+    const: 1
+
+  "#dma-cells":
+    const: 2
+    description: |
+      cell 1: Channel identification for the peripheral
+        PSI-L thread ID of the remote (to PKTDMA) end.
+        Valid ranges for thread ID depends on the data movement direction:
+        for source thread IDs (rx): 0 - 0x7fff
+        for destination thread IDs (tx): 0x8000 - 0xffff
+
+        Please refer to the device documentation for the PSI-L thread map and
+        also the PSI-L peripheral chapter for the correct thread ID.
+
+      cell 2: ASEL value for the channel
+
+  interrupt-map-mask:
+    items:
+      - const: 0x7ff
+
+  interrupt-map:
+    description: |
+      Maps internal PKTDMA channel IDs to the parent GIC IRQ lines.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#address-cells"
+  - "#interrupt-cells"
+  - "#dma-cells"
+  - interrupt-map-mask
+  - interrupt-map
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    dma-controller@485c0000 {
+        compatible = "ti,am62l-dmss-pktdma";
+        reg = <0x485c0000 0x4000>,
+              <0x48900000 0x80000>,
+              <0x47200000 0x100000>;
+        reg-names = "gcfg", "chanrt", "ringrt";
+
+        #address-cells = <0>;
+        #interrupt-cells = <1>;
+        #dma-cells = <2>;
+
+        interrupt-map-mask = <0x7ff>;
+        interrupt-map = <64 &gic500 0 0 GIC_SPI 500 IRQ_TYPE_LEVEL_HIGH>,
+                        <65 &gic500 0 0 GIC_SPI 501 IRQ_TYPE_LEVEL_HIGH>;
+    };
-- 
2.34.1


