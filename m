Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7EECD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 06:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=md/GGIDIRp1UAjMLufBimrZJ+UVWByYJJsyDARmJqag=; b=NntuIKpRQzfvY+lZkqhkX6BafP
	xz3xIdKdhhukvyuvqrINXg8//E+maaPWKlFHozWytzgxix7GKwOLYjYMyM5nQv5YY+H8D1Mj0mAq8
	W7WiC6jNLrODGcW08obtScsk6LBHPi4GoF7dJdQbiG17ro0IUeLRWvkfKIZTNZ9twjATCt1LEXwfX
	aokYYKdePVsJl8LLVvaHK0hcIS+v9hmzz7NBSA95CkXH/gXh9tLyfGjz/7kbAP9QtyksXvLSaF3F6
	u+xkJZGTWG8eXyIQECmxNiwlbrbIFfBOrh+TwHGIdplkxs0QmG4NmYOoON335MhX3HSW0jOVgYgtI
	I0HaX1sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMgJe-0000000Fjqr-2fo3;
	Tue, 12 May 2026 06:10:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMgJb-0000000Fjoi-1dsP
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 12 May 2026 06:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=md/GGIDIRp1UAjMLufBimrZJ+UVWByYJJsyDARmJqag=; b=CmQIcBAbjdXWgB9HsVpyXSN5q0
	YjD4CHECZPsZCkm2+Yzh3OAsAHUk0RDWFaROgDFgJwGqlSENIxOoSUtCrU583bEwc6LmdvM6I7tmK
	QdgOZZ7aMQzSDYHiL+RI0iLMusMFI5z0YNiR2uuhjvmYX9n/9AwtVDtIGfZFLt/50N+afZzGaThYV
	PPo/Pt6aAuFd8PwgyvVPWqXjzxEQF3PoVPUDjTf7LJqAsX7hIYLFx59b83VwZAEADfgq/z8B8KoZ9
	TVFNc4XrgjIGK0Uk+tytSjBOnRTK2PSHkSGY0LG/Mj2HBIsUYM699KuWDXkygHgPPo6NR7TJne9aM
	WtmJZwAg==;
Received: from mail-westcentralusazon11010044.outbound.protection.outlook.com ([40.93.198.44] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMgJT-0000000DmA3-0Lyl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 06:09:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qlCCG4S1ITYfwXabSm8nqswivKk6PaL8QD6kdu93fp+RtlrbScuy2X6p1Z6TCclMt4G82BmO6E8D0PHHQqI8AmcbXCujZb4xmulWNYcrZNNFhQsbbA/G/Ee+4U/9/B9DuSCDTwh8vBKOKu43Y3kfETO7W4sxC6K6v5K74I85krMi5HbbHTiJ4CDNvC6uhmY3zhG4Raq09TK9o49bNDBfUEueYJHQuHen1cB/qBcvjXBakKgGMtgqmVUR89QctNMu8aaNEku0wxCQGghF+Xq9YOvSd4NdJ+L6D7sMgEwy81U8ifExtNJFZlaoGBmG0zXQoW2S2n2jh50w1+ZyUCht1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=md/GGIDIRp1UAjMLufBimrZJ+UVWByYJJsyDARmJqag=;
 b=GMWIKS+8mgxTuVlz5YvIyy/aWCNSeTYgbeG04/eMW8UnQMj3hYpmnBeDkWXGXnwB6fZLt/RdDQ5CCzOVS+GSZ922QpfB/j4nXVwt5iRea6btcgDPenrh1mPGrccn0h67bdmlnfOBtflexSHl3Ba7oV3wg8RZdO50g+s3zD+1iwDriB1H/Bj7hev+NYU5mQ/zJppvYqpkUEEjY9LFbu6k+r5186saC5qV2WHgGCi/cTz8qceMt76zi4GQ5CiemUWzib57Zbx+C/seyBpipcgbU+GIakgO7Qv+U/vjnmYkwEJT9bi5jKcEisA77SWhF3bCMvsWPXtLGO8NM9Esx5XWSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=md/GGIDIRp1UAjMLufBimrZJ+UVWByYJJsyDARmJqag=;
 b=n2Lu/0hD9LcSpeMjBJWFiEbJQ1iEvVDaebtEt1yzPYV6FNSLJh2cKRjsNYMvJlFMxIghVs3Jk0uIlBojqPSv2xr3SihK7qqCf5Ouj1uaHklfgYp4PiQt/cHkps1JxhOMT4pvfyHbPiPysJQdlop8PnCSGESfshg1fYCJCfVk624=
Received: from BL1PR13CA0355.namprd13.prod.outlook.com (2603:10b6:208:2c6::30)
 by DS3PR12MB999241.namprd12.prod.outlook.com (2603:10b6:8:38e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 06:09:42 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:2c6:cafe::52) by BL1PR13CA0355.outlook.office365.com
 (2603:10b6:208:2c6::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.15 via Frontend Transport; Tue, 12
 May 2026 06:09:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 06:09:42 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Tue, 12 May
 2026 01:09:30 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 May
 2026 01:09:29 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 12 May 2026 01:09:25 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Shubhrajyoti Datta
	<shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, Michal
 Simek <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 2/3] dt-bindings: gpio: Add EIO GPIO compatible to gpio-zynq
Date: Tue, 12 May 2026 11:38:48 +0530
Message-ID: <20260512060917.2096456-3-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20260512060917.2096456-1-shubhrajyoti.datta@amd.com>
References: <20260512060917.2096456-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: shubhrajyoti.datta@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|DS3PR12MB999241:EE_
X-MS-Office365-Filtering-Correlation-Id: 110db0e7-2d38-482e-8e81-08deafed0edd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700016|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info: AkH9dVrefPwlBWFwOIPeGWJeE4VkZF2d6Lik6TisGpRrLYM84qppQbgBQGU5axkukDzAg7wsb7u9HzDNPXUp0Srn2deHTzNzWAUK8uHgT55mggrsarkPLXhaNgeRZZ/SeH9SjwpM6OA4btJbA3VTJ4fAQL5PYNLYLrv5yjPr0d6GYuD3DGrdipOK2/ZiofVCpVTuIUvWHjjG42Mj7dRhNYkkI/HDz/weuwm2V6aT/xK42cGi9XICy48i+cAhiY8x8vchg9i8Oh3ud3QbFpXcCssSkYJZEYSTasYnemZxx+8VVjLF1U/nmcdikz1ouWOVj+6gy0dKOfeaUtQkJZOJpM5nSPB3yTp5APmyNEDtVPTBq9p9ocA6lmJZkpiNj4nezQgXb8V+S7LqHJjS5VlYVDQ7Og9dBegPw5Bdo3q87R3kEg94osKcC2yKPyxZzBoSNrkpc95TjCj+wNwP+M9tVkGcyUgKOkCEo53jmYoa3lAYcLeqx+nVC7FdivjrcqIkFOe5BXHpOlOvDdMngLzP5uZvZxTwpVJvYy6BXdWtCEU4qGjzRtOPwajVCD19BIUCc8jYBem269cUvCuqyt+W/XBIFsa3kdsvIArFbylqJO6KDhgXbUVdLQdxVVK2C6wxeTqYcuahWKowtixZMo/IHfoXsHcr1Ke0kQJd6ohesxrzr2WhZcgSFcy2mcEshSVM/mNXYmxALSKkZmj2j/6jP3phOhJOYNgyrwk8hGB0+tA=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700016)(22082099003)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0O5JCKC/2skYcZSRgIn8mAVRtld2d2VHfrt2eHTq0uQtMTswHBIlEsOFjgmmURE1LNtKV6dEGgcGbdBNn8iTQFEe/jLkrrwUn2e/4TlR7CzAXeHl+KjGegTIBDzKDP5ndV49vdxguYZlkii/jqP9JeJlELRgpquNuI4DeMxQncm4fkKzGvGd6T5pa6YG5x11LrMuXQ1INQSqybiaQ1RRXYZU9BIPGayVm3XGjxJkJ3kAD7PsZI9LPhOCKWBGlD2wEumM4P8A+hERQkEgsCMB5NQJNBv4+wiZDGJLjMIVGy6djiHbHJka6zvZtKrPAFlj6+fq3lqKF+tVuxPPPP/+Oh/9KGtYskLhKLuH7pwRYcbueCJuMrNy9Dz5b5WEqg9otV9p+nhhJiRFPPOc1bIDIG7/z7SQp9XorCLX9CIh3P32V0YeA7QCsh4lor6mk0QF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 06:09:42.4341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 110db0e7-2d38-482e-8e81-08deafed0edd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR12MB999241
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_070952_782433_538017E1 
X-CRM114-Status: GOOD (  14.66  )
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

EIO (Extended IO) GPIO is a Xilinx IP block that exposes
multiplexed I/O pins through an EIO interface.

The EIO GPIO block has 2 banks with 26 GPIOs each (52 total).
The GPIO width cannot be determined from the hardware registers,
the driver relies on the compatible string to select the correct
bank/pin configuration. A new compatible is therefore required.

The block is currently present on xa2ve3288 silicon.
The compatible string uses version 1.0 matching the IP core version.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v4:
- Remove the min 52 for eio

Changes in v3:
- Update the commit message

Changes in v2:
- Add description of EIO block

 .../devicetree/bindings/gpio/gpio-zynq.yaml         | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
index 30a7f836c341..de24bb361e9f 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
@@ -12,6 +12,7 @@ maintainers:
 properties:
   compatible:
     enum:
+      - xlnx,eio-gpio-1.0
       - xlnx,pmc-gpio-1.0
       - xlnx,versal-gpio-1.0
       - xlnx,zynq-gpio-1.0
@@ -30,7 +31,7 @@ properties:
 
   gpio-line-names:
     description: strings describing the names of each gpio line
-    minItems: 58
+    minItems: 52
     maxItems: 174
 
   interrupt-controller: true
@@ -89,6 +90,16 @@ allOf:
           minItems: 116
           maxItems: 116
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - xlnx,eio-gpio-1.0
+    then:
+      properties:
+        gpio-line-names:
+          maxItems: 52
+
 required:
   - compatible
   - reg
-- 
2.34.1


