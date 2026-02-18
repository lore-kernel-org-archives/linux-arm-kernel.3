Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D673E9A03E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 09:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Vfut6LTTTN6NRsRAb8ysALKW+pWY5zz3y5Wdwu4dcY=; b=vhsK9RCIB2whTDvje1B707269a
	WMlxY3QPibOOj0eqhJuRdZ5Y18aqnYd+SfF1bWTtAG58I0eB8CatONZ87bQxVC+FS0oM8vtv7ffzb
	Aj2pQWyG0D+P0dH6TlJvoLnaWqgyh8Cz2iAlZps0TTOo64vDv/y+fxk4MdrdLv99tGuX5yvewwi97
	JOeqvzlQD2h89KKz6SdDS7kcufahsdl7HqwFLr466RKE53lLx/Jc7yMNWXabK5niJ0qx4VIFbo3CN
	R40SaGQV5Kyzy6i+EFT5/POZta1W//5EyjEvTjaw3fU5V75sWcUUUnYJgZiueGe2wHD4xQ2DBmto2
	79mTFU0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vseG8-00000009aZM-30hh;
	Wed, 18 Feb 2026 09:54:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vseG6-00000009aWE-0I5e
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Feb 2026 09:54:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/Vfut6LTTTN6NRsRAb8ysALKW+pWY5zz3y5Wdwu4dcY=; b=iQZ3ACc2kni/h24ge6Pwzzcp8W
	H34KntTFzl1gKqLFwaIiCHJSp2sI8kN45d0rxg1TzH2chiKmmh76jkr4eyhL3wXC0035ZzxVagUXQ
	YfSqrE6OHwEesGVT3u3ivpPKvMFfgZ3OC+WFbRmY1aRhMYyqoOt0GMfSjO2U+L+1xXCG6M0VP406t
	Ky5zTIqG6K9f+zclXiHiiZYZI1OvaJsuRGnHHFixqf0c6zmWwk+FbofqqMcjP2RjAAK0VJqRGvBmd
	CaQedpEFZyQWirWcfcmiTB/eFOPlgIgxHk/gO4BxeRbYe2jvOZD4AZEfaE1rfV1XLBRHIS0fD3Vxq
	suvtdiXA==;
Received: from mail-westusazon11010040.outbound.protection.outlook.com ([52.101.85.40] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vseG1-0000000HBqv-1szb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 09:54:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UGPTmLBUeWuaVoS3x6bdLbOkKUnRiQaqntLIW6yHoQJqrWHXOpKXQ0J9+bHk0DOScYV/vSxRzKLosIYG6/MSvYda232JrlJhjuylVJUnVJyxNcH5pcXejZxrWg8FVeMbEIid+2riDZK4z3G3ViD7ag7VzZFfI7ahdAiledHQ4Ai33eRW25rI8/xBcXf8+VWslp/xMf8IOAVHduRveCVpRjZRCeL63+Bj9COGkVXNRWroDeZWMsiQpm1g3rDjRuU2gG5VJGSkkPEUAKFOweHC2vagpGr+JuQgFFvouANJwEi27mLK0r+zU38hNeaym9tST1/GVc2CC0iH5exSmTDuLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Vfut6LTTTN6NRsRAb8ysALKW+pWY5zz3y5Wdwu4dcY=;
 b=mvzr6eEB5ZBx+auX+E6eh1BSJl9/ICbZFGImBypYz0Dn3wr+CAOOSETBHAcJf70tuzZaXoIWDoh7UsANUrMSED6aiFMzJ1YnQXZna+/hhKXJQMOduMd08+5Wn63XRLx0j1fzhivFJMN0MsItZ23yca1PkKfVBkJ1dhfYOeBX0x9vsBDhJ9UIB8LeYC/dUEJzPyhG+pAgO+oqnmT4Nyb/pZYKySkPj3dKhB+7HU32BSStewHy5AfpHSo6MZz8J1KtZX3SQRfEPH7kNZJ7ErXdlx+mKiFBxwXFe3UNFl+iL3PzesTPYGlRIN6bDATkjPvoxXi1G3SySIvx3+RdpIHqgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Vfut6LTTTN6NRsRAb8ysALKW+pWY5zz3y5Wdwu4dcY=;
 b=kLg2RYf46BX+qhJnubDBj1tlZvWg9Jg9Jo6PpT3o/xE+U8E1EWHgsaKc8YqEIFv9thkoI/tNS9JXEXLZ7W25XukE/zjR7xPg47nA+X/nEhf7qqPiYf7+TGhGZ+iZJkhmJ4cGFdMtFRYIb5TRxDMNzCmr7UjJQ6VQ1gmJtdpmguA=
Received: from DS7P220CA0039.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::33) by
 IA1PR10MB7470.namprd10.prod.outlook.com (2603:10b6:208:453::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 09:54:01 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:8:223:cafe::a8) by DS7P220CA0039.outlook.office365.com
 (2603:10b6:8:223::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Wed,
 18 Feb 2026 09:54:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 09:54:00 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 03:53:54 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 03:53:54 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Feb 2026 03:53:54 -0600
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [172.24.233.239])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61I9qpIJ200561;
	Wed, 18 Feb 2026 03:53:49 -0600
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
	<ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
	<Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v5 12/18] dt-bindings: dma: ti: Add K3 BCDMA V2
Date: Wed, 18 Feb 2026 15:22:37 +0530
Message-ID: <20260218095243.2832115-13-s-adivi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218095243.2832115-1-s-adivi@ti.com>
References: <20260218095243.2832115-1-s-adivi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|IA1PR10MB7470:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f0bc331-b07e-4c42-3d93-08de6ed3a3fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Eczf7FDt4eABOBclZWVmz5tmiFbbD1v2gkBlu+g3yfaWnBhC+WGF9ozrQnlk?=
 =?us-ascii?Q?dwc4szOmlTYIbtmI45et2pESCAsv2POO3EDBZY229cVBl+/y6Z9s2V/575rK?=
 =?us-ascii?Q?gcJJuKXCJ3+S+5UzeNEyo3lZWL59qDTmi0ddJG7MyFW8O+7cMBfhSYMdRMOn?=
 =?us-ascii?Q?ph4rjBaUfgjSdfckwi4GrfY32S7gGXnsB0vb5rtm9Wypp3nhY+kYeTMMeQQX?=
 =?us-ascii?Q?yF/eIr7VkLgYG59ApIRalWPuzelHdL+xpHn/wv/QRylRco8DiCVnFaC45QdO?=
 =?us-ascii?Q?S6BGRHE5lnCt+mZUfXkTtcHUA6d6KWJOzra1CrX3Cu7ZWlcKIGtjZdvTLhgH?=
 =?us-ascii?Q?sDiuB+vLhTS0odOfI8EdG8TBsTtJ5dUobQm5Roj65K39nH1g93MB6IDr4v4r?=
 =?us-ascii?Q?XV+pZAU+MfAOlF0TCFVnNScJoGGLg5g9ETKoEgyTN05OCi7Ddiokkm+P7FCh?=
 =?us-ascii?Q?p2zDVqXn8zw0Jqhv0PJ+kVXjSa3yK0No8mqvIUVmPsrKEXXcwokSnefD1ard?=
 =?us-ascii?Q?P53kbtjUJIpuG42H/RiEN0XInxD5P+PSMdQ5tHNOS+BQcG4LnpPbmVsktgWB?=
 =?us-ascii?Q?lyhM6s0w6iNrQ6mm/KiVZblxH0wA3Iwv/t6Q58Ldjv89ut5gFaZ3ljAi6BEu?=
 =?us-ascii?Q?7Rw6XAqh1x/Mv+33O1n6f769wCpTbJwEx7PzkPI0RokLLKqX4Mw76i1C7kFM?=
 =?us-ascii?Q?EnvNShQ/E2f6z1Gpi6czOZlI36VSKsi4SOW5E6AgzU735MHDP+o3PSWwH0VI?=
 =?us-ascii?Q?kSLhYYjz9awnqbI/PF3SO7Lqu51y1j1owipviauuB5LZfNu+uj37Z/izeyb1?=
 =?us-ascii?Q?gtL9kh+B5BY7PqwemdTs0bnFP+YtZJwNNmKmOUdAssJDC57ywcujV1uyY/+C?=
 =?us-ascii?Q?NXQyZiEAXGhGAC5C1VF+xkmDSNZxM5lTbj23mtUVElqAFUywM5sh689kIH02?=
 =?us-ascii?Q?pKuCezvKI7mYZ8LWL/Pc2J0Gp6sHzhEdM6Oe87ZHeD+4u/0hDNCfs4grAPj5?=
 =?us-ascii?Q?n/ZeUpZNg7KBIjReZIlI+phD9sQlITnaBNeWhLCvQ7exC7D9oC6Z9yzsepuZ?=
 =?us-ascii?Q?RT+P0y0dJ/I4dgpBn1e03n+AdgeoO1HQ6G6LFITLPJj0EeluYCFFQOfzCHNC?=
 =?us-ascii?Q?TBuivXqCY3vcbH3XJ7oZpIuFVzHJL0W2hhOHquAwX0Mj0BJAfYqEhBpPoC6g?=
 =?us-ascii?Q?zAemQK+ZsoboWC/97QmHpou31BGXDDNVdgpV5jQLmqkfPP3AScDRR/WjE6Cc?=
 =?us-ascii?Q?QGHZI5kSeMt6VHpwBfiX1XSZYx1zcWNXRloeJA9VED6Z8vbKvoDOV53yTjV8?=
 =?us-ascii?Q?t0Pza86v7cPVkPHE+aL/uI2OUs31omefn7CIPprluhiCMOUDMuy1F3s8ucKj?=
 =?us-ascii?Q?ZXQPcTv99a1Kg4dGiX5bvPinsRHiLSM8761TMXw0IqK6otop7okN+zcOmIlf?=
 =?us-ascii?Q?rrzAvr/AqNIlkOn6dgAQarN2FAoVW1KwVqukzhhosy0qBEHOvpLU/iX68PjB?=
 =?us-ascii?Q?5sK4RnIJ7ClFub+jcT9/UEz+CJSzPv0s+FpRIYjSH44aebsXNY5um2YSMBD4?=
 =?us-ascii?Q?IAbYKAZGvV9D1YZ4wLQMqnorpJ2IYr40dFaUbULSJsAe19X4jPiNvv67CGLU?=
 =?us-ascii?Q?khvNxeKkHTSGuxWdzRmxkrXQ3qQHo6nOLZ3sIItpWp9DEweHkoKiP/xOxUbi?=
 =?us-ascii?Q?nM0+5P0kHVtyBRoHoNZap+WE3zc=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: vM/7dqySq4gmi2nIxB4gWkDrtCImTAsvicW4bVXHsqf15CTN7y0g0QRAVtM2Fw+1DoHWJ1Rio2cDoL9YUFy+UtrBwZJgyKo3zDgWtSY36kkOV2CZKnW4n0dgXEGFNBxjO07BAU+zMLbZwbOCEvA4QABOKcuOEguBe/ghp0+bmoooq8EH4g2Ff1jF/NovIMHLpRam5+mEnumXztFW1lIH2S9awXhC9GIAhduT3QIfyLhKDquFD0RbmOioPvdwPYykN/JMkac1wNh9Uk18FqRA/ieK4uBwF5qVuFSqlys4xkrBFlk1uBctiZbOGOd5J3xqr2u35X1elUbgo1u2OsAEPzMCAGFDI5h0WARcphRYhhLhbRfwBWfXP5YJZ36yiK2aX11H08ijLFtGTDZuKuFm0G7kowpsIb1qEhJ/ZjpsSNnQU6n8Mou7lmC1CVIGKKpl
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 09:54:00.0399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f0bc331-b07e-4c42-3d93-08de6ed3a3fa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7470
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_095409_654112_9E3F0B33 
X-CRM114-Status: GOOD (  15.41  )
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
Texas Instruments K3 Block Copy DMA (BCDMA) V2.

BCDMA V2 is introduced as part of AM62L.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 .../bindings/dma/ti/ti,am62l-dmss-bcdma.yaml  | 120 ++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml

diff --git a/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
new file mode 100644
index 0000000000000..6fa08f22df375
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2024-25 Texas Instruments Incorporated
+# Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/ti/ti,am62l-dmss-bcdma.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments K3 DMSS BCDMA V2
+
+maintainers:
+  - Sai Sree Kartheek Adivi <s-adivi@ti.com>
+
+description:
+  The BCDMA V2 is intended to perform similar functions as the TR
+  mode channels of K3 UDMA-P.
+  BCDMA V2 includes block copy channels and Split channels.
+
+  Block copy channels mainly used for memory to memory transfers, but with
+  optional triggers a block copy channel can service peripherals by accessing
+  directly to memory mapped registers or area.
+
+  Split channels can be used to service PSI-L based peripherals.
+  The peripherals can be PSI-L native or legacy, non PSI-L native peripherals
+  with PDMAs. PDMA is tasked to act as a bridge between the PSI-L fabric and the
+  legacy peripheral.
+
+allOf:
+  - $ref: /schemas/dma/dma-controller.yaml#
+
+properties:
+  compatible:
+    const: ti,am62l-dmss-bcdma
+
+  reg:
+    items:
+      - description: BCDMA Control & Status Registers region
+      - description: Block Copy Channel Realtime Registers region
+      - description: Channel Realtime Registers region
+      - description: Ring Realtime Registers region
+
+  reg-names:
+    items:
+      - const: gcfg
+      - const: bchanrt
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
+    const: 4
+    description: |
+      cell 1: Trigger type for the channel
+        0 - disable / no trigger
+        1 - internal channel event
+        2 - external signal
+        3 - timer manager event
+
+      cell 2: parameter for the trigger:
+        if cell 1 is 0 (disable / no trigger):
+          Unused, ignored
+        if cell 1 is 1 (internal channel event):
+          channel number whose TR event should trigger the current channel.
+        if cell 1 is 2 or 3 (external signal or timer manager event):
+          index of global interfaces that come into the DMA.
+
+          Please refer to the device documentation for global interface indexes.
+
+      cell 3: Channel number for the peripheral
+
+        Please refer to the device documentation for the channel map.
+
+      cell 4: ASEL value for the channel
+
+  interrupt-map-mask:
+    items:
+      - const: 0x7ff
+
+  interrupt-map:
+    description: |
+      Maps internal BCDMA channel IDs to the parent GIC IRQ lines.
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
+    dma-controller@485c4000 {
+        compatible = "ti,am62l-dmss-bcdma";
+        reg = <0x485c4000 0x4000>,
+              <0x48880000 0x10000>,
+              <0x48800000 0x80000>,
+              <0x47000000 0x200000>;
+        reg-names = "gcfg", "bchanrt", "chanrt", "ringrt";
+
+        #address-cells = <0>;
+        #interrupt-cells = <1>;
+        #dma-cells = <4>;
+
+        interrupt-map-mask = <0x7ff>;
+        interrupt-map = <49 &gic500 0 0 GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>,
+                        <50 &gic500 0 0 GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>;
+    };
-- 
2.34.1


