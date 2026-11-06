Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4C3606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 05:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kZWv4S26;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ssIjqEwe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=a+0UpmdUZtnEfJYE9ks7kgqGlnpYDh7rsQ5F3m+q3XM=; b=kZWv4S266NAW+pAVsXbUX5HLza
	I4KpqjQA+u3EqI/SWAa+pVs0QSM7/sFZbDF+UNUSoYy6Bgccyv65NODEHJ6WZLl8nwAwj+hIy9iCR
	08q8oXmSFjcB2vDXB7iNQvkhNpiCgQUbU3M+6NJo13gupY2zosM2n4FN+6+v5fYesT4+0Y3LvgaRI
	gmjlGY3I6hfwlpJ2ZbmXMAYV9y7qQvoEe6FBcR3EJTVymDPn2tPC9qCqd29nymLq133mDxXuQYPBZ
	qd5NrMbflj86LphaGwECzRtLEeuvo5zTHFslMQAzrp6819YPuIfXsrPaU5m0ETwU93XYbcl7BKci1
	PamDIC1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPCLo-0000000BFza-2Vov;
	Fri, 06 Nov 2026 05:18:56 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPCLj-0000000BFvd-4ALs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 05:18:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oSvRbexRPP4dVJ9x/xE7ObGgG/oUIx/MAAu5JpBHF7BndcdzSJYhXaWIQh0nEHedjLEB2h+FFHld7HUSvpN8tNUbm037fyLOZT5AoGpCV2+jRfvkU6ja1krg1r9Wq4wfnH1vAJA7ofKQeWtJ8VWY25C/a2mLr7RYtUFauxBCEqwaP8JQ85/c8PIpTZJYaqAS+CiPN/7uJiHh39bQ/BkfbXa6z3kOR5Int5Mz5FBABWkh00w37/EtaVrmbWLq8/H7xb/GqGkOxHC7EWYWt4Uzei5vYSfwlOqr5dKWo0mLxOhDc0eCMdOGm90DqHsyesv60OUJaW51HxdlR6NfrbDQJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+0UpmdUZtnEfJYE9ks7kgqGlnpYDh7rsQ5F3m+q3XM=;
 b=rdFWvLyPEhWDbsLif2omdDsOLsor3CEECRYyMC2yKy66Es4/vRqPvD3LlQ/DT8ZL92whaV4tDuRy8sbUdpJll+nkhj9FAk3Xz+UCwePt0JSwoVugS5dAGPUri8jZe/Wos4a8giX/SKD8aDxBWE+J9JlV8gKzIRUBMbIFz1a+97tpMntYiNnKz8w/WbWxWX/Ncghq4bIO25GP3aLNpcvPz1q1KC1DCN3m0Ym4aX3VK02YoSQ2begqZe8u0+zSpiTaVYy61c1rT1MIkohyctaJ4nEcYr8ssbMAWF7UzXiNuGh2Jspa8SqHs1BGX0pAUKPHKfUVtIJ2eptY2J7PHGoi0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+0UpmdUZtnEfJYE9ks7kgqGlnpYDh7rsQ5F3m+q3XM=;
 b=ssIjqEweCggbuxSo7Bzg/spd8lwmzK73vATnJKTtQfW4JNSLW2fKQre2qTvQvfM842uYI1wj+se3RH2J5Fd5hpALafsKe2ulZIElWI6Hi0PcMxGhgkJmMZl3+Nfp0D8w/rilwMjbi7D6nYReU1zKa1kTfUaavmyFETmcvhU9Tbo=
Received: from PH8PR20CA0006.namprd20.prod.outlook.com (2603:10b6:510:23c::11)
 by PH7PR12MB6465.namprd12.prod.outlook.com (2603:10b6:510:1f7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 05:18:43 +0000
Received: from SJ1PEPF000026CA.namprd04.prod.outlook.com
 (2603:10b6:510:23c:cafe::36) by PH8PR20CA0006.outlook.office365.com
 (2603:10b6:510:23c::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 05:18:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026CA.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 05:18:43 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 23:18:42 -0600
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 5 Nov 2026 23:18:39 -0600
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<michal.simek@amd.com>, <gregkh@linuxfoundation.org>,
	<stern@rowland.harvard.edu>, <saravanak@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>, "Radhey Shyam
 Pandey" <radhey.shyam.pandey@amd.com>
Subject: [PATCH v2 2/2] dt-bindings: xilinx: Remove description for USB host controller
Date: Fri, 6 Nov 2026 10:48:19 +0530
Message-ID: <20261106051820.3414532-3-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20261106051820.3414532-1-radhey.shyam.pandey@amd.com>
References: <20261106051820.3414532-1-radhey.shyam.pandey@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026CA:EE_|PH7PR12MB6465:EE_
X-MS-Office365-Filtering-Correlation-Id: bba9f79a-1aa4-43eb-2fdf-08df3bc56d20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|7416014|1800799024|18002099003|22082099003|10067099003|11063799006|261026140227099003|261026121527099003|261028144727099003|261021123027099003|261022105027099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info: PbRlogvT3xUr6Ywr8oWudv2VOsP9cXrsEeZ6Qz/Npk/Zdq2Vds+RZSmglG7onwA7eoAkJ216si5RTnDGplHZZSckv057uob2QWGk8OchVC9P0GfSEfW4tCGt1/u3MoQYIivn0hcxDG4YuBx1xCbSscNvmRhlbwT+mgj3kHlC5NmPqknJQv7C6hdfriiHHRpCYFN48iGIe0s2FLUwWgM4iQelwInqpJKfsbKf59TVV7TkqkTT26T9R3ofo3niarFj7CE+R60wRZynzvcRI+NWwk4Xso75dciRYh5j0cLeUaJk6LQjbNN57GyblfYaIhPKCJo5qGVsGObvQmos5wNI44HifEu20ttQOL6ZMO5Mjkun0fmEi8oke9tivq0EGC5vFDJYGrSPyvJWCoj3SXuBz5nQyKk968pDjRq4Z30sTpQyhokh+sWmhqVWua9eZy4aBj+oZrx5cpmqy6gndMGZgVyus9/8ukX4znQuWxaAvIqhm+P/57ki/m9v+lN9zxr1EteugfOvNp7NUm7H6pF21sgspumtaw7U9rAN7eIGOHW7KNPP4PtGtJoff9I5mMT59uIXvkoaeEeIbsBDO+NFurloGMtBLj27/gGZ4E6Bs2YuiEdehSX93bMZk16924eHKf80xcMV78VVOpBvGNfy2xqk9nuZzusIOkawarmuhCC+/wbjotXKeaRVHbpp6bqEpiTNVRbljGvuDbPJxu7sow==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(7416014)(1800799024)(18002099003)(22082099003)(10067099003)(11063799006)(261026140227099003)(261026121527099003)(261028144727099003)(261021123027099003)(261022105027099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QobNM+6nz6fQIGPKOtm15D6GS18mQzrSvjNFTj+DijkdjNSUMTdXwQmOqeBWU1/AldWTUgsrxJ3t+DNJLZ7k5UdjGPjnTB7qjnjjKwElvMnrs3AmqFxpG8NbRnHYQrPGbjavP9oT59VqY0by4tLggxeh/Ps5nwvULZUGffEStSR/HGXPoJA9ziP60X2HO0VyiSG5FeQUIvSUeLuov077T0l6B3Afmohb5jw8iFlf6BERiow02TM2FHi52af/1f4nLfmniuAwyffSrpKVLC9tAJNVA/F7u/uh3m7vwqALEJl4PYflLxLJpPth4x6PGaJOcjbOFK7cx+vRlfgoQtU62ma9EXaXeff4oxVIBKZ364x9MdnI2qSKT2Pnv0UmAZkHvcB0h9COf6Wsm3RYunbdjFosAC5eicOH6DMP6dtGbCdbhDjqJCpy30puuyY6t882
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 05:18:43.4057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bba9f79a-1aa4-43eb-2fdf-08df3bc56d20
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026CA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6465
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_211852_069196_061E1BA8 
X-CRM114-Status: GOOD (  11.68  )
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

The Xilinx XPS USB host controller IP relies on Xilinx Platform Studio
and the ISE Design Suite, both of which were discontinued years ago.

Driver support for the controller is removed by the preceding patch. Keep
the bindings in sync by removing the corresponding Xilinx USB host
controller description.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes for v2:
- New patch to sync binding document.
---
 Documentation/devicetree/bindings/xilinx.txt | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/xilinx.txt b/Documentation/devicetree/bindings/xilinx.txt
index a1a2cde7b7d8..5049af6ff4cf 100644
--- a/Documentation/devicetree/bindings/xilinx.txt
+++ b/Documentation/devicetree/bindings/xilinx.txt
@@ -29,15 +29,3 @@
 		- compatible : should contain "xlnx,xps-hwicap-1.00.a" or
 				"xlnx,opb-hwicap-1.00.b".
 
-      vii) Xilinx USB Host controller
-
-      The Xilinx USB host controller is EHCI compatible but with a different
-      base address for the EHCI registers, and it is always a big-endian
-      USB Host controller. The hardware can be configured as high speed only,
-      or high speed/full speed hybrid.
-
-      Required properties:
-      - xlnx,support-usb-fs: A value 0 means the core is built as high speed
-                             only. A value 1 means the core also supports
-                             full speed devices.
-
-- 
2.44.4


