Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D504CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 03:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hlkn86tFaab5UiAZXN0Fgueo0yNi2gOrgaWnUcPslO4=; b=VWq+wGGRi/QARiXmLQmWw1+ni2
	tccUf4czbqhTAqxjvz8BjaMAK66dPDzsjmrS496ntkQ83gs6I4TvTc50HASueGuyIWn2Ce4ievAOE
	9ITxK62yK5tmskCaSM/5saTsi/erO0Ng4MGGDjyDB0iYFUUew8l65uiGKkmhvwxEO3S1vNOcS//aT
	QRvV0VAjvQWJfSQZ9irw2VsfhQSTuTWtAiFMOfoRAczzepQhuSL+Thcz1TAWFXP1TEqwObNaBm3Bo
	gxcomV0Pl7Di5pZWUC8H2wo4BMHyDqmT0enzsWhn6sAdLIiViRjFgiztvpigSh69fNrEBg1EAOzZ6
	VuuAZd4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPBJj-000000000UA-3NzQ;
	Tue, 19 May 2026 03:40:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPBJZ-000000000CC-1BZR
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 19 May 2026 03:40:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hlkn86tFaab5UiAZXN0Fgueo0yNi2gOrgaWnUcPslO4=; b=JVYNi69T954EALsqtC9dSdOtkK
	swegcXXFDxqbtWYCD1GWLMJEkJNojqCqXCvjjTJnCtieHr6042ATy06T7Kbb7U09BThVLxvXDVNCk
	/9mlX1OcQU6CaXD1kE1sm7hV7ecA1tmYQxDHzHsSavpnpXrGJW9s+ko70OUrOmNykKoLVVaF0cWCy
	hQftahCMspjMHJzCUuLJoFppCy2kAkBHgvn0QJubG8tdwnR/MbCvU7EzOc1qZnih2ry4CIes+B7ke
	H2+iHYWxL74216LQtEXtKh/igPe726NWsaW+n6pUOsyZvmxj24jqFNtmyurCJtAyzEnFLBbtUwtCg
	8yeT5F7w==;
Received: from mail-northcentralusazon11013000.outbound.protection.outlook.com ([40.107.201.0] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPBJJ-0000000D00W-2XDN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 03:40:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/j95Y2PK1jEVA+WDy2ZWhEm2zW9r2nr6+BSkI8/mKUVF51sxP5ZWLkSHIrOhJvQ9+G4HiHSwHa0wcNyPsRStV0Z3/OSLkrDRX7mxH0eytpZC/43artmGoM6x68VFp82qPys5tbPB3olXzxe5YUaN1KECA5M6yNXe/+zU6xZhtdib1B1Bfrqc2GVX8UJXYTFdGwotHCEaN2JqOeMxsmff9EeoK/0f71Wc8sgOCDFZV89yPFd62+0D4oE3bZWT1N43bLQtGr9HtEjx+N+WDu4e6R1psobygATPhPHj/0WmJII4cMGMmjb8YPU4WUj/LzkcjbhM2IDxVyhdNRr9cW3Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlkn86tFaab5UiAZXN0Fgueo0yNi2gOrgaWnUcPslO4=;
 b=c9LlDl5ZC6CoB13Z73rOF7EvkQCXtfHCQcwKC7bq2MceFz6RoukDONF4qIjNaAM1BoDKxkk8GzxQELnXW9Xy4PgwLceuyy5Qy/pxrinhgwRCEg2X5Uazfj+uqrn4U/6rm7YMO7EdP9xrsvQ3+9ht3crpfvARh85En3FtazJGqagF1axTbX++XyASPESfhHKJhgub15ojVhzFUpuCKNCg8D/HzAwUIcPUOVpPPy3MtLjfUVVU3m82gk7uMKIakMFUJWVNm03Xl2BVHS9EE+tDhpZX8vX31FV11tQPAghPDtdtii9kojHA/bGkDO+74B2WZqUjmsQrohpioZg/L8tIcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlkn86tFaab5UiAZXN0Fgueo0yNi2gOrgaWnUcPslO4=;
 b=LhFxwtF1CZNtOtKekawYmYew3/kiegIwMly9Mm7+Xadxr+b7WsKiFrQBX7tUmoANq5zbp884I7zGGC8+etuEAI0U1tWLjeXGBDJoj/6XANJP5Atw5ISpSIAYiR/dRnRdd9Dv3UX1m8J4owNnyT0536LaMc4v45OYtRl7clbpK3vl+I3MT2uc1XafFzwSLgvxiWUXegycwe2iD6EraVajVDK+tsQdulWYchMfyuMGLoaUM+L68A+HK/d1wyTGkTR/OEEHt52e7bPPWVMYA2xKjW1bVyeLBjHmu93/vNpw5uTKs8jqCZhORNyhY3jl1plVI5koEmChxr3dtFLMlQVCrQ==
Received: from CY5P221CA0031.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:b::35) by
 DS0PR12MB7704.namprd12.prod.outlook.com (2603:10b6:8:138::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.23; Tue, 19 May 2026 03:39:53 +0000
Received: from DS2PEPF000061C8.namprd02.prod.outlook.com
 (2603:10b6:930:b:cafe::46) by CY5P221CA0031.outlook.office365.com
 (2603:10b6:930:b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Tue, 19
 May 2026 03:39:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF000061C8.mail.protection.outlook.com (10.167.23.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 03:39:52 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 18 May
 2026 20:39:39 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 18 May
 2026 20:39:39 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 18 May 2026 20:39:38 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg
 Roedel" <joro@8bytes.org>, Bjorn Helgaas <bhelgaas@google.com>, "Jason
 Gunthorpe" <jgg@nvidia.com>
CC: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Pranjal Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>,
	Lu Baolu <baolu.lu@linux.intel.com>, Kevin Tian <kevin.tian@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <vsethi@nvidia.com>, Shuai Xue
	<xueshuai@linux.alibaba.com>
Subject: [PATCH v4 13/24] iommu/arm-smmu-v3: Skip remaining GERROR causes on SFM
Date: Mon, 18 May 2026 20:38:56 -0700
Message-ID: <3a224e880cfe3a35003fda0f075e0111b7086e27.1779161849.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779161849.git.nicolinc@nvidia.com>
References: <cover.1779161849.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C8:EE_|DS0PR12MB7704:EE_
X-MS-Office365-Filtering-Correlation-Id: 86a7fa29-e665-40e1-4fb3-08deb5584992
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|7416014|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info: 5tqs7frRGoAg498II6XJoiBrScS2jwdBQ4A7rt+APJud+9e8WfKHzdFy3tuOg8CpEzTarkSdHHc8aC2iGvSXeutVrck8yyDuMIkp33uusOpEtO/4m1rzbSZ0DUGS+DXugjiehoXlSaxPn6VmGbbMBv0NrHxvSIqlXTAS9aljiOg06sMjs0Fb70waOaEeF+YMQ9Jkjg35Llzm8LW0qxFsNnxCgJjFlzlHA81LETqNBmL67rltjzEgarlkLrzmeuHK2Qb4pe7SrEyz64quyGy+Jn5bGts++9rI3Ysxr+r6V+fbFJYeQzvMj5rCEoPCRlzrKtIMd/THB/xVJa7OhYt3I1rJxXaOWZibUxfANp1hcbjCTqQKnwQWMTtLLMUdAZSpJT/Daq9OJWiLzD2dc8+uxDqgsuXTdGnXSqk+cd10jXTgH+XymL+4VqP2G2UjEYR8qNrJvfs22Ysz/wvy0dLX0BHnZOcBf2mBUvw2lqLDMf5GMR5gY1LuI0kI+inJtwhZILGe5BlLoJllweNMBXG/op8pgVdTu7e/fT8RbO2HbVZebz7G1ZrOkmIaJ0oU5FkxycUPJVtwii88Rd6jo6zmjhSNcQt0T6V3cwiFeU5wZsLDwyoOo0DGWqBylbmR6/r6Vo7KIi1HbeThgLIx6P/BkCxEzw1ww3uhZOL5ssFIPEZAP9UbAI2hQ6F8MT2fCs/CIQQhJQgdL28atSIXHpx51JhOMT2z3sQvrUjfJ2dKO3c=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(7416014)(22082099003)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DRgCl49RoPJKAnwWD+f5o8HVPaCKL5QRiwOCXRhXClsYZQAq8tlWBCzy+sMr/PGPuNLtj0GPdNWidTBEoOVOzM9ax7cTalAt59xKkkXH/FpqFbIpD7pGQJZwigYqkdJ2MUHgoOD3B9SqtJG64F1ccsEim3jD1eEmS4/UC5G8gOO7sGXBK//ukhwRn5U21c3mUAq2xoV2K+uVUNHtf54t/x1m0b21oBFJLeEp/B9B7i1hNNAF9Pmp7+tKcOgIOKYSfEcIYiUDqHluZWB5i+SSGh7ZjRzCPQYYLqY7PNlWf/getW8a3anV5MZkZBF1//4D05lJPwjwMVqf0YxzNHRRCa22pXryWwrCOuyiUIc9FiWJ/V0M3AnNABWrE5kXOSZgCOx+zW2eyUP8ix5aDLFC1GzPycVY19rgW1JzDO8+Q1kC3E3tlKcvaC3meYHhjdUY
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 03:39:52.8005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a7fa29-e665-40e1-4fb3-08deb5584992
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7704
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_044002_707562_4367415F 
X-CRM114-Status: GOOD (  11.39  )
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

When the SMMU enters Service Failure Mode (SFM), arm_smmu_device_disable()
clears CR0 and the SMMU stops processing requests entirely. The remaining
GERROR causes (MSI write aborts, PRIQ/EVTQ aborts, CMDQ_ERR) are moot at
that point: the cmdq is dead so arm_smmu_cmdq_skip_err() would just twiddle
bookkeeping for a queue nobody's reading, and the per-cause dev_warn lines
add little diagnostic value beyond the SFM message itself.

After arm_smmu_device_disable(), ack GERRORN and return. This intentionally
duplicates the last two lines of the function because this SFM path will be
slightly different.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 1065301a54eeb..d9fe48989fcd7 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2268,8 +2268,11 @@ static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
 		 active);
 
 	if (active & GERROR_SFM_ERR) {
+		/* SMMU is being disabled, so other errors don't matter */
+		writel(gerror, smmu->base + ARM_SMMU_GERRORN);
 		dev_err(smmu->dev, "device has entered Service Failure Mode!\n");
 		arm_smmu_device_disable(smmu);
+		return IRQ_HANDLED;
 	}
 
 	if (active & GERROR_MSI_GERROR_ABT_ERR)
-- 
2.43.0


