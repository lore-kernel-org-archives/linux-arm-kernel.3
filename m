Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118C6606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 08:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZDiJDSb4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4i260fXWHKh+C26SB4tIDrAGnSm6VNibwL5cGtIrNaQ=; b=ZDiJDSb4kbnT9Y6Cri/ferH/fx
	ew6zW5aIpRQVjUj6uTYnh74xQgGHl5AtmNi9RRhQcFQcZJrx1tJsOi9PfLQAKMrPy2AalGIei5fZ/
	B1r+QmckhGOn3vtWSL6QFlReEdLOpk/HdHSUxRkdDacJ6eIXbMSJrO3/cg5RIQseuWPublojJqlQZ
	Pzkrt1xDOHeMrD+c5JqG+WLOrpZkbd9E+XhCbB6+JEDAzC0Ze1JScS4DXbTAvtVVqlNlzyNm/o2AN
	+jkgMIJ9/HuiFuVy1yxHMtoUIL9kl2n0ijGEfbF5xy01wStiUBIbSfPSAN1XGhMkVNQy1eILKpGqW
	6yNARVAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNncK-0000000FtWA-0lVM;
	Mon, 02 Nov 2026 08:42:12 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNncD-0000000FtRK-4C0c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 08:42:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ilQR89MiQGzYLx8fsI5tZuNgkKjbjVLtzOWYdPvyKnEKUeMYp+/MeDQ52a9xpJVP/3zVRSiCHmWk8gLqP2d/r1oyrR5b0CgFxttdGdrJ1mAyeGTw8QnyokePDLle+R27nRtptj072Jo1aRkvnYhZlf1uNysmMZtqt9GrAB3a+GaUCwZWBb9iBtp1iXlxs27Q/51icdo1sN1/l03MWLx/fwdjR+gkEeXciQLwnoCzIYcUqPXWdprzaBJMQ0eSTgrxSG9CZsSy5dN5APG8Z/BEuNaVTCNapDhfLYRl1b+qnA/WIFbG/bGUaXlFtDjgdXXEnaSWSVb1LHEYAp2pXLKvcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4i260fXWHKh+C26SB4tIDrAGnSm6VNibwL5cGtIrNaQ=;
 b=U1eMYr/JO6PWiqYk4kDrgfS/7ELNVFOfPoP8NoQ/8eh2ggyoqKN8218P1ep6Qljj8GkbmE08i1LsRpJbzs9SI3BTFUTBcq/KPIWTfYZd5ef0PuzXJ4Iz1fJf3qhJIfEREmffGTdcWwjAQcmoRif7et2E+sfYRwAY7hZN91CPpDNV4WnMHzHqYuqEYdhU9KF6FmUbz7wMIOuCWF9lHQItTeEGByy6e47oQKI2cMFdhn+k5+4inXhdU6tNlLgNad4DKRINMrbRZnWFevOmhL3mGT666rTXdp2VYlxU0kgaHZXQhXAH2nXp5NXknsTaVPj0eF/HRJ3bMRWkZaN/wLg8CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI3PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::17) by TYNPR06MB8880.apcprd06.prod.outlook.com
 (2603:1096:405:3c3::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Mon, 2 Nov 2026
 08:41:54 +0000
Received: from SG1PEPF000082E3.apcprd02.prod.outlook.com
 (2603:1096:4:296:cafe::48) by SI3PR01CA0001.outlook.office365.com
 (2603:1096:4:296::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 08:41:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E3.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 08:41:54 +0000
Received: from JohnnyFan (unknown [172.21.64.24])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 60B7540920E2;
	Mon,  2 Nov 2026 16:41:53 +0800 (CST)
From: "Johnny.Fan" <johnny.fan@cixtech.com>
To: will@kernel.org,
	mark.rutland@arm.com
Cc: suzuki.poulose@arm.com,
	leo.yan@arm.com,
	jeremy.linton@arm.com,
	maz@kernel.org,
	mike.leach@arm.com,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	jie.fu@cixtech.com,
	bob.zhang@cixtech.com,
	"Johnny.Fan" <Johnny.Fan@cixtech.com>
Subject: [PATCH v3 0/2] perf: arm_spe: Support heterogeneous ACPI systems
Date: Mon,  2 Nov 2026 16:41:50 +0800
Message-ID: <20261102084153.3975282-1-johnny.fan@cixtech.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E3:EE_|TYNPR06MB8880:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0f8290ec-d6bf-40fd-1ee1-08df38bd25c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|7416014|376014|82310400026|1800799024|23010399003|10067099003|18002099003|56012099006|261021123027099003|261021121427099003|261022105027099003|261026121527099003|261026140227099003|261022075727099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: BXyKhndbgy05W/iXqCTbunrjipH4Zp1FXSkiL7Wj44iavNs1tpg6DPAmgrjnSPD5w3CxJIBGZSj7wYacnYsEvmUIQI6y0/X+TsfAuTjkHzJLGN+PFVa4xNd+156CtkAbraeC1SRhk1AGCXONZSZR5oIkt7ud/nZejRM0OFESRQ6XqshxX8LhiIU7ezCs22fRIfKVHuD+5johFPkzJIlhw8K6LcCn0rKxr142a0J89LTqLy+PS9CGyXDbQJBaGFDs+bsC61LEnP8WWD3qB/A/FkaK7R8NcxvA/gNGZWEyW84IGmOTOqWNV5gO2hbJTU7pUmEdVXWyY8qAyu5A4IWinr3KlrMeWQIyp3N1zXV45BT4Q2XkZiBwexR9CTQt0h1PxBJKn7CNYUEmq1NkDPLUQtGmStbjzVSyldjEpvV1RQ5yuLJ1IOuzJSqGu0o0KiFQjCJpp2VP+O+FVpY7sH8uKn5d3qRtY+kkSppgMKYOKB1EnA2l7yARkbrY/JqilCdbmMVC0J0Aet0LqaI2lvlqrrFL180tttnSXyL9Uk8DWG70U614eCVXvQAH/S1BEf1ND7PAuc2afFtYYd+tvP/zRJO5+k0y9kCzv0tPZrq1Hh7MrNSnSaBnJyv/Ub1GMlMUWd8sTxiYS1cIKvbZNGyNQg==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(82310400026)(1800799024)(23010399003)(10067099003)(18002099003)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261026121527099003)(261026140227099003)(261022075727099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4b6yJMujTP+Kpia0kqYG2zR2E+7yfPauGOuGM8KmYysbG05EON8VvjXgecNEuYmxtVgl243dEJe4saiev1RopjTO22z+ByjOSxzl4Ac7gJ/IaYvWrI7/cnuc0s6mMX72y3YiE6ivxw7VIenJEwzrf+l6DIefG7ZF/15TWzFl+Ar+dzyoVCpsWoUIUA+f6pg+9PZQlHCYunXihC+wQopOlwLwC6lfbztyeQ6bQw6BekJq0bN4OPmrXCX9WKC5LFdoe6ofm2G8ZAWvnZ73Dz0srVXi+M4ifmlkfa1iN0NmxjbDgpXbSXXwSK7D7w7CiWZb0SMhudku3vEq5EGtenKIZFasNH1tXg1+WinCj29yVKZFxzLxNXU7Pqz6+VCWmbDa95cJtUT3MCfTxeemL7r0AwAzuz9qJgVAaZWmXDoqB171qm9etXSKzFx3B0K8CdD9
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 08:41:54.1791
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f8290ec-d6bf-40fd-1ee1-08df38bd25c4
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E3.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR06MB8880
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_004206_043175_F5664046 
X-CRM114-Status: UNSURE (   9.01  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Johnny.Fan" <Johnny.Fan@cixtech.com>

This series makes SPE and TRBE usable on heterogeneous ACPI systems,
where not all CPUs implement the feature and the ones that do may use
different PPIs. The MADT describes both per CPU, and the PPTT hetero id
tells identical implementations apart.

Patch 1 lets the drivers take the CPU mask from platform data; patch 2
creates one platform device per (hetero id, interrupt) group and passes
the mask along.

v2: https://lore.kernel.org/all/20261021020322.3015121-1-johnny.fan@cixtech.com/

Changes since v2:
- Split into two patches: drivers first (no functional change), then
  the ACPI producer. This keeps every patch bisectable; with the
  opposite order an intermediate kernel would create devices whose CPU
  mask falls back to cpu_possible_mask and probe CPUs that do not
  implement the feature.
- Reject GICC entries with inconsistent lengths instead of silently
  skipping them, while still treating tables that never describe the
  field (pre-ACPI 6.3 for SPE, 6.5 for TRBE) as "feature absent".
- Allocate the groups dynamically instead of a possible-CPUs-sized
  array; the counting pass remains as the firmware consistency check.
- Only release a shared GSI once no successfully registered device uses
  it, fixing the mapping leak when every group on that GSI fails.

On Leo's question about exposing the mask through
platform_get_irq_affinity(): these devices are synthetic and have no
fwnode, so the lookup falls back to cpu_possible_mask. The mask is a
property of the device, not of the interrupt: a GSI can be shared by
groups with disjoint CPU masks, so a per-interrupt affinity would be
wrong for each of them. ACPI cannot describe PPI affinity today
anyway.

Johnny.Fan (2):
  perf: arm_pmu: Accept a per-device CPU mask from platform data
  perf: arm_pmu_acpi: Support heterogeneous ACPI systems

 drivers/hwtracing/coresight/coresight-trbe.c |  22 +-
 drivers/perf/arm_pmu_acpi.c                  | 238 +++++++++++++------
 drivers/perf/arm_spe_pmu.c                   |  10 +-
 include/linux/perf/arm_pmu.h                 |  10 +
 4 files changed, 205 insertions(+), 75 deletions(-)

--
2.55.0


