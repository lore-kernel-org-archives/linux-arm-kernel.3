Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255D3D46607
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 18:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jjfig5FliQUs9ADQ/ZTAenbmONQVMcTNTez6nPlyfpk=; b=KBzRmGaggdA55GuosReV2PTv+8
	eI5OlO/bVNi7+LLhz/ufJGUArdzeRXN35DvKSDoTQ+pdkr6cHucrq5PgTvpqmVCLIUKpTZqkf1kE3
	etHQ38apbC5Ygl030p2PxcXYd4dllkOmocHgNKGRCyLS3zvz3ObpJbrCPQTqHsseU6RBBNnm/5kkf
	viAnpdg4EuZlEn4BQJu7i/4s194NnqnbydoVROFWC7W8iFgE8hu59mdge8mvzMhXgLUNsM/mrY0bC
	mDDCshRqyj3vjOevdbb6PsGFTn2+AwbRAxHfESZ7LdzNZ54nTBzpCJrZs01PDyQpT4FBsHXmFYbPo
	AhEoBk3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgS11-0000000CxRs-0ryi;
	Thu, 15 Jan 2026 18:24:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgS0v-0000000CxO8-0vQv
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Jan 2026 18:24:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jjfig5FliQUs9ADQ/ZTAenbmONQVMcTNTez6nPlyfpk=; b=jEZNBJ/JnbEklXuPzJEaO9cxCd
	oc4K/HwRMaTU9XiujZN7MXbQEJLglwHyQdnZ89hiz3o/N+qSPcEuQI1abWI5d/RVZG6tHSiITaurb
	wEgcrKNuwB/MzFYhnJvzKgMoJxR27EQjxJEnP6VjOJgYl2WRXuE5bUcNIV+/X1kbboGX1cLXiFGzQ
	6zzAmpdOwhrgrdYJEDPSfqPRvQnERjRfAYdfcdXwctFX4EMfaYLBcAiX73LRkdg0IQ4D1fiP/wZqB
	WEgtYmURXNlPcf51Qnjt7g2Ikl+C/GseSYKt8VD71TwMmDbWK3xTBCCWhCIuPJVaydWiz6KRnboSt
	rGQCWlgQ==;
Received: from mail-southcentralusazon11011023.outbound.protection.outlook.com ([40.93.194.23] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgS0s-00000007MCc-08j3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 18:24:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ra38PtYTzAiOCRH/izjkwb68XsVZo9S68v5Z+3XG49NXTE3yRy0frvq19Mzj9oNUL8Q70zAuG4Px8KZwbCWuSUW1z1fMRodhqtDKfxVYTS6R0EIXEIuGXDLTREo8Sl2RuqNkQXkcWHHQOM+jXdMnehWp+L1viouZ/1SL9EmCK84WCcWpCWO7D0MNJa2Lqmqy3ywNqufYwptBQHc8AS1LUj7Fb1AHJhOVicngda4SInQyKng3wVHxgV5S48h7wu/NVNwrL0lt7mcRAihmw64ZXIVwr2z6To2SSrm509achsVNTEMu4c0y/1MLG9KoFwau4y+3IHQTOqVtfLJOM24Wsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjfig5FliQUs9ADQ/ZTAenbmONQVMcTNTez6nPlyfpk=;
 b=ncQHE/vXNo/CCqgfG+rTdlBkKBzLZ1np9DaFbHDE5QsiH0bFmNXVNnt1xL2mC4WaYHflJr8WW6BdaUnUAMl93bhxwkQbyobzD7tVzxHiJBp6Nt7J1c0lbQnvJ91bw43xmsfSdK9yfyJu5ITOZ0oXTmEkhnRFsRHtmeWh29w6yEBkfGWIb4tFAcelP0MTcjav4ZpRzDex4xkSmfKGuhzBA2nGQsdexNGbBxDWlIFGFLeyscDR+af/ziVeVsaEHQKx9ATX+VQOkrktHnsLFxyReKEyv5JhmhBUpGotjdewo+QgA01bNKnjRQQi1GCiKJcngsmXGpbKRlxP3aHcFEI0Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjfig5FliQUs9ADQ/ZTAenbmONQVMcTNTez6nPlyfpk=;
 b=GGCzdOwGnggpIKMPeEWm4zTNktNgewZ3BlLMel25pEO/yw0YXsdQpdViyH3xj0ZK9vqgD4HONzhi4k0unQF9RKS1v9PYGUIeJ13S6o2T7s7a5QA0+ROSn5ClWL3ULaEUX81h5Ic6D3cmrOReEa5BJcRLAcm2qLCShgS+L4Ddt4nnJO42U4uotZHq87WicuGIawwq2WSFrX7H57BNuDXhdikjCXJVEHddXMYyqjO8rM4ISLu0qVTGwxY+hz1i5WiymSBxNvrjWL9vFvLkONQ3zxO4QYBgNRFquWJ+VM2lAf3cwwNmFsaMvXdCnQTObhzsSoGU2sO7MpF7A9n03b8wOw==
Received: from BLAPR03CA0076.namprd03.prod.outlook.com (2603:10b6:208:329::21)
 by MW6PR12MB8664.namprd12.prod.outlook.com (2603:10b6:303:23c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 18:23:56 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:208:329:cafe::de) by BLAPR03CA0076.outlook.office365.com
 (2603:10b6:208:329::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Thu,
 15 Jan 2026 18:23:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 15 Jan 2026 18:23:56 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 10:23:38 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 15 Jan 2026 10:23:37 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 15 Jan 2026 10:23:37 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>
CC: <jgg@nvidia.com>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <skolothumtho@nvidia.com>,
	<praan@google.com>, <xueshuai@linux.alibaba.com>, <smostafa@google.com>
Subject: [PATCH rc v7 3/4] iommu/arm-smmu-v3: Mark EATS_TRANS safe when computing the update sequence
Date: Thu, 15 Jan 2026 10:23:30 -0800
Message-ID: <d7af5227af69d3e12023e29eb79785e792ce5b5c.1768501336.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1768501336.git.nicolinc@nvidia.com>
References: <cover.1768501336.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|MW6PR12MB8664:EE_
X-MS-Office365-Filtering-Correlation-Id: c4b5bcda-684a-40d7-3047-08de54633edb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Wsv5Kt8be5vcJX6IBayqyW1FMYNQdkpnTCxgjXJSYXKjQnVmBhyKx/wdtwBG?=
 =?us-ascii?Q?9gNO8ludGp4eEPcqIZF0VFD5sCQ166RxkTaw+oZ1Kp180To86QjDHKwKehAF?=
 =?us-ascii?Q?RHzU5Lb+bHednGapKuOli1k/E0eqZ6brRvdF1Oa2oojsu0prlyJfvppI/oQx?=
 =?us-ascii?Q?QJX0fALPohytouiWnChc+9jH4XvnNmkcA6UMoMhzmPcQyMvC5DBbNVowYrNk?=
 =?us-ascii?Q?lKOb2v3/x/avueugbLNhaY1sLDya48dlKpnpOUk+vAhbuVvuxi3dcfhK9BCE?=
 =?us-ascii?Q?Zr+ii1tLnJqKatNh/kiNXCCYqRyFMckYu65gTYzVeXnVZ8X4HIUDaCDTf2wP?=
 =?us-ascii?Q?TvRlcc10HTrkdbdjWoa4o+KdkV2hgnBpdOLOPBPzxq+OOzoh3jGssBA4i46c?=
 =?us-ascii?Q?tplXMJmSptW1P4LZUy+8tKotGAy3hcoVHOZTbWY/NHlWhcXE7gV6e7TGzdjJ?=
 =?us-ascii?Q?caSiRr4GXtd4N/hog5Uq4a+HQrWdO5ZX+as39KEc1opE2hKIyAOxMAixT2a3?=
 =?us-ascii?Q?jazWEpdTyX4x7epX0PKdLLyqcmpLBtA5eYH9ON7V0S1Sz1OxZGYXl5iGeJ+Q?=
 =?us-ascii?Q?LjchMq3DMFBo34h1Xr1toT+0HtvjfSCkIaxM9x+S2RwcU1Kq6Hhb7MqDf247?=
 =?us-ascii?Q?lYFYqPpVTiLrsYlQw7i0FoOse/S1OawAK3H9fMlFfGLRblV9YkyyqVLWRFec?=
 =?us-ascii?Q?uR8KH5tsY3mKjwFkAMjsCLWsOx/QNZfgwyS8/1J1IiTN/isGZcf+2Tawm6oe?=
 =?us-ascii?Q?V8xU2DYHB96NyoCYR/CiaSs9zWR6hXPJZj1hPTrc3MJY4PB1VbWuPyRIrfWC?=
 =?us-ascii?Q?xZ/RteSQVe/FEoR5wjPBziYjLrHp2roVXhLIHmzK6s9DKptXgo+/xIPuUitF?=
 =?us-ascii?Q?3tUhbns8VOBohgDflUUiSz1cafzmOpbOSFAscTRq02tm4UyZIW8rJP5KzU+z?=
 =?us-ascii?Q?+eJ/SotUwrkse+oDkm/vQnVTWymfaFpnDqA72gfggB7hHUwuT0o3JwW5uUZ+?=
 =?us-ascii?Q?kHLPjHOEE5gW94/QE9CmjDHuH0xAm6ohXmka36Q1f5n6Zpx5SRrA6n36cA4v?=
 =?us-ascii?Q?15cbTTBY8EtK3jxJ+hJ5lIR4WFbE9kRhuooso9rIlZPdK8z0BToSe9940OEi?=
 =?us-ascii?Q?iOJ+26MSizneKqObJ++CJVDPtDoS5lB9PngdjXnKOdY/ng3qaj+jHAvaAS/k?=
 =?us-ascii?Q?vsXFHQOdppstoEKrbBrFIwm78tYlbj45PuGN+PAkaxYmrVZnGx0FnKU8HDHz?=
 =?us-ascii?Q?HrQtoc2cAn9ZORV6ic/O3H9rEzl14M5cldiXHjGIfwbAYMRLEu9ocyAV1EI7?=
 =?us-ascii?Q?de+nl1zr/7vgQ0Ewmq4dMYYwDDwObcNdR8xsyLkq0YhWyiLGKB2haQl/GEH1?=
 =?us-ascii?Q?zF9hRTJ6QCd3akCXwsjMktY2vMjIfmGEwuAUdT0s6ZT1HU4twL27AUeBhKTM?=
 =?us-ascii?Q?ZROHXKav4hucSFtJKXrCu2cd97r0eUFpv2JTuVOERR3pegdvKShlTmLnoJcY?=
 =?us-ascii?Q?1Cq2a1BppCPndJi8voGCtzh6uQX4PNUz4oRl73uSnGWEDGllTPwCbPiW8Qma?=
 =?us-ascii?Q?dfh9TMw8ELDbtawm9fQbGcmHnaxTbAvK7IPd54laow0wswUyvp+YAVrRb2E9?=
 =?us-ascii?Q?8jatXTJYdV5Jj2NpDg1zXshnH1kNch0np4tkHoOSrIelvdGVYZi5ZwTmhoY/?=
 =?us-ascii?Q?RL5bYg=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 18:23:56.4508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4b5bcda-684a-40d7-3047-08de54633edb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8664
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_182406_294837_DD3F7035 
X-CRM114-Status: GOOD (  17.68  )
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

From: Jason Gunthorpe <jgg@nvidia.com>

If VM wants to toggle EATS_TRANS off at the same time as changing the CFG,
hypervisor will see EATS change to 0 and insert a V=0 breaking update into
the STE even though the VM did not ask for that.

In bare metal, EATS_TRANS is ignored by CFG=ABORT/BYPASS, which is why this
does not cause a problem until we have the nested case where CFG is always
a variation of S2 trans that does use EATS_TRANS.

Relax the rules for EATS_TRANS sequencing, we don't need it to be exact as
the enclosing code will always disable ATS at the PCI device when changing
EATS_TRANS. This ensures there are no ATS transactions that can race with
an EATS_TRANS change so we don't need to carefully sequence these bits.

Fixes: 1e8be08d1c91 ("iommu/arm-smmu-v3: Support IOMMU_DOMAIN_NESTED")
Cc: stable@vger.kernel.org
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 26 +++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index ccd6357fa5a8..77a87af5c673 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1086,6 +1086,32 @@ VISIBLE_IF_KUNIT
 void arm_smmu_get_ste_update_safe(const __le64 *cur, const __le64 *target,
 				  __le64 *safe_bits)
 {
+	const __le64 eats_s1chk =
+		FIELD_PREP(STRTAB_STE_1_EATS, STRTAB_STE_1_EATS_S1CHK);
+	const __le64 eats_trans =
+		FIELD_PREP(STRTAB_STE_1_EATS, STRTAB_STE_1_EATS_TRANS);
+
+	/*
+	 * When an STE changes EATS_TRANS, the sequencing code in the attach
+	 * logic already will have the PCI cap for ATS disabled. Thus at this
+	 * moment we can expect that the device will not generate ATS queries
+	 * and so we don't care about the sequencing of EATS. The purpose of
+	 * EATS_TRANS is to protect the system from hostile untrusted devices
+	 * that issue ATS when the PCI config space is disabled. However, if
+	 * EATS_TRANS is being changed, then we must have already trusted the
+	 * device as the EATS_TRANS security block is being disabled.
+	 *
+	 *  Note: now the EATS_TRANS update is moved to the first entry_set().
+	 *  Changing S2S and EATS might transiently result in S2S=1 and EATS=1
+	 *  which is a bad STE (see "5.2 Stream Table Entry"). In such a case,
+	 *  we can't do a hitless update. Also, it should not be added to the
+	 *  safe bits with STRTAB_STE_1_EATS_S1CHK, because EATS=0b11 would be
+	 *  effectively an errant 0b00 configuration.
+	 */
+	if (!((cur[1] | target[1]) & cpu_to_le64(eats_s1chk)) &&
+	    !((cur[2] | target[2]) & cpu_to_le64(STRTAB_STE_2_S2S)))
+		safe_bits[1] |= cpu_to_le64(eats_trans);
+
 	/*
 	 * MEV does not meaningfully impact the operation of the HW, it only
 	 * changes how many fault events are generated, thus we can relax it
-- 
2.43.0


