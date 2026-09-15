Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB2FC982CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 16:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cvZnDQUdwN5MuEEqCw7h1pu7ZSBxTS+mWYEFcTJlPKs=; b=IVNcJFDUhjvRNE17hr75STcxM0
	gcRtA36meD1zPvG9plYHo4QrD3+lhCCbCG8bxTOUZnIpyxTKstrKR2ol4+rdaS71PekFDeDdyx1QF
	BzydyaG+BhTd7gD0x2p4HkTFu7xoZJed2wxnWlacM3zkkvOBEyZAyKj11BkFHO/QdzuNwF7US3483
	tDibMdLWI1qTSn497GQw48ssoSgXYAc/q92gNHM6Ae4KxY9q+l4HGUwiuIw9fXM9EDq8BX4645dFt
	bsQDy7tPebYdgHTbXH+SAkiC6w7IoHmE4KEEvNTKiK2CAAF/ONFY25YzVdpDdzChmsy6uBQ4tIfqB
	mvzKduHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WC6-00000007QuC-3aaK;
	Tue, 15 Sep 2026 16:39:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WBw-00000007Qn1-3Sdp
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 16:39:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cvZnDQUdwN5MuEEqCw7h1pu7ZSBxTS+mWYEFcTJlPKs=; b=PmDJ1ENpysHap2z1mUeoTWFdds
	XX780tEUGBOzGA87pyHLFsxp9EcJBBiIfVrCkKPS2y91XXFzcmzqjlZPEwpNSTOL32xJ7LTieRTAy
	+BI+NojQjhFJvng4NjyI11a1z7feMzZYXsLn7qWjw5BsnqOAvMswK0zG8/hnQACWSnukgd8aO9gSo
	+pXEKvMrt6EEUNGy4s3k4kah7F2zMzM/Iq7G+xQqJIBCkA/2mH/vYmYeWit6JEryZn0etIeGaqVp+
	HxcWwaaWcfibCb2PtIgDuMZf7WnnBDi/1MPjwgBM4m/ZnyShh8hw/VhwTYm7mb2M3jFc5zuIpamnW
	Fu1k2YJA==;
Received: from mail-westcentralusazon11010047.outbound.protection.outlook.com ([40.93.198.47] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6WBt-0000000720g-2Fsm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 16:39:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hvx+bQYo6iMprog2QOOSvVI+4OqPU0RfFmeqQ4hJ+6K3/yTaiWWblleblaoAK17G2XlxM/6tfLbY2vg6dfCbDM+Eedf5hvzMVmgFIOGDihzhCKwhYmq77+ltmzd83gS88mb9G1K5BrkwUALj7l8l4XOWk4pkubLg3ZgXZpsmzJ0FLA653RFvaCDoupolYNQ3SiG1A5RxiikdNp6jxhdl3/fTHsjALh2Xyg93l8ED2XvxkvuN/ZSTeXAebTAjAc0UIr0KsmoBu2eztEtsBzzl4C9s1dJAdZj+avrbxAbLAOktKgiZz3wjKqBJQnVrVtpK8EHHgEOvVux02+9TM6oi3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvZnDQUdwN5MuEEqCw7h1pu7ZSBxTS+mWYEFcTJlPKs=;
 b=wuu5m1+s278pwFP76SqWrw5Q+eQRPtqunt9lbEK4j2pVOZmgrb2Wr3hhdTMgo6ZUnhypmh36cs12SAQQ7kICJa0JfyTmjXek1V7OyRgFhrRQu3KW8zZEOHQr4WSqQwmmwi2Mml3S5/PPRjUZLI+D96xCpYtHXFu+lWVvkosImdPHzYl2IAb8dYzWWTBse56k1zyQ/ixc4mMvWG5hU9sOgK63ZMH79WiU5YTmbf0oPp6HBfVq6nMKnC3MBGMu8i+ttshS4zaBfAqsDMpaiFvPCeYyv5WbPbkYrOfOaSLTuU4w/cVkSEtC8G9vNCE++oT0TrgizfJKCPoUkb+LDTayiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvZnDQUdwN5MuEEqCw7h1pu7ZSBxTS+mWYEFcTJlPKs=;
 b=hrIY9XMGN99/8eJM51sPMBzKphItINTgAmOJ1oBngc3qVOR3ZPdtV0NmKJqNQ3xOwD8+iOUOzn860m+81IpGIKHSiSewgMrPkSC2kEZSxYDSd+CwYvyyYw1KmcL7WRJkLAPemDMd/99MoN5snPMlVlDa1dDdD8WiKd+M7oD5CfkVzJJrcp/iRRFNxR1Cp7UeLKnRkEZdaWMrZ5xvqtNUUaF4W/8NVYoQ7sN/25rDYGchymZxTRRLBQryJXbfpSrCZBhdJeOrGvfUajtZq932+tToL2jQp/suKQcwa2EfWZ7CWF8sq3gpmzEWT+Vqx5C++C/TE5BQ9cX70/Mrf2P3DQ==
Received: from CH0PR04CA0074.namprd04.prod.outlook.com (2603:10b6:610:74::19)
 by MW4PR12MB7333.namprd12.prod.outlook.com (2603:10b6:303:21b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 16:39:18 +0000
Received: from BN2PEPF0000A801.namprd02.prod.outlook.com
 (2603:10b6:610:74:cafe::1d) by CH0PR04CA0074.outlook.office365.com
 (2603:10b6:610:74::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 15
 Sep 2026 16:39:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN2PEPF0000A801.mail.protection.outlook.com (10.167.245.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 16:39:17 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 15 Sep
 2026 09:38:49 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 09:38:49 -0700
Received: from Asurada-Nvidia.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 15 Sep 2026 09:38:48 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>, "Jonathan
 Cameron" <jonathan.cameron@oss.qualcomm.com>
CC: <joro@8bytes.org>, <bhelgaas@google.com>, <praan@google.com>,
	<kevin.tian@intel.com>, <kees@kernel.org>, <smostafa@google.com>,
	<baolu.lu@linux.intel.com>, Jean-Philippe Brucker <jpb@kernel.org>, "Eric
 Auger" <eric.auger@redhat.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <skaestle@nvidia.com>, <mmarrid@nvidia.com>,
	<skolothumtho@nvidia.com>, <bbiber@nvidia.com>, <harsha.v@oss.qualcomm.com>
Subject: [PATCH v5 14/15] PCI/ATS: Export pci_enable_pri() and pci_reset_pri()
Date: Tue, 15 Sep 2026 09:38:26 -0700
Message-ID: <0eea03fe5d763738aa348c96c9dd18612e8b788f.1789446520.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789446520.git.nicolinc@nvidia.com>
References: <cover.1789446520.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A801:EE_|MW4PR12MB7333:EE_
X-MS-Office365-Filtering-Correlation-Id: 563ab9b2-6a15-40fa-0507-08df1347e2b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|82310400026|36860700016|13003099007|6133799003|10067099003|22082099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: Ur8/jyDnzw//wItTqLam7skZfrskL8kv8W/LCHZiQMGib7/vW4wP5Ux+4v8BGx1UoxC/XRbn/pz98S2rMkKktgBRoqIFa0PaJLxSm5zCgwd+sjXqBoqjpmaRtg9A4XgksGS414kzf9A5NL/5zNV+RaC1fuXgS6NBnfUYOtUCZk+Jz3u3+YP/5ZlLUKCuBvz31C0a89a39SIIlRTEhVupaiF3u+0KOn14w6dFbjnBpDpYQlbO0+uD5y4ajFiToxfDEHVzSMPqoE5BFAl0eHsa57hiMfMKk6B+W1CTfklOGgdbmTC3PdGRLE2kC8vY0aP9ww7jddXz78H/k4BGZuEUMvBdtP+XpeAsoHz3dAL3mk3QS/MKJHdzS4MWbToUXxW0uTD0pU38mslBzlZQFEeqXCrbcNTpaT/8pCBjTwCM9xT10g8CVXO2zGNsKQj6mR+jX54j5XCMDvcFmK2qitH3y3O94HD0xnEhgKBO68eqLQ3iUyrv272OyroiBSgcc9iZWvMNCtRXIdK+RxCsABWAd7dYVyVJPRVUD2wl0TVoY6mY5k/r89WeHKQBL0EA1v4VHdgqcPWmh2mk7S8pp78XBIE8gwy7KN1qcX08n03+c8McSM2a4ErNXuck7bVuvzAQOLxjjy1jqK0HOMx9IzSXTDnVtpHGEUckUr/1RdpyID1UYd7aKt85mIOaTIZ2sRdnAn9xuNPHOP52JMFMNe1kTw==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(82310400026)(36860700016)(13003099007)(6133799003)(10067099003)(22082099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: aPtpMTyWh/cFv+ecrCNXN6HJZ9m006Kw3cG2Sn3VGhRj1HNA4Zr9W0/DHyCiK6wcLgjGH4CuVvlWuf4rGkR69ATQpOyVD0iNTNOVOnLz2mX3BuB9/LRpE1QgmY3ukdk8NNJyA6VgO/PM0tHiQvTdraIZ3pOpwGKeqMcuxL9cmwgRJv352qd/B3posrKTfBLKK2xEbMBxWxYluwOccojHMG4FuPxk+zl2I6tz4AHM3YghZonCBn9+g2x3qwuDrMY3g0+Pk1x5RUav6SPyc9wcJzqTMZ8d3PORuIPvQ7o4lSnAEyrCGq3lktR/CSXLKQa+NVAZ1bP1CfA/nU11t7UoKEykg1KyDJR9yKhhEUXwbfS2dIXM7FWsKXuUkUUdqeIM/heH4cCXVVvy3ZCzrr/DJBiGwD5Ljc/L+csudQ+OTIRF45hzzyZnJgvkGxOhefyp
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 16:39:17.5464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 563ab9b2-6a15-40fa-0507-08df1347e2b8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000A801.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7333
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_173929_667986_CA70A162 
X-CRM114-Status: UNSURE (   8.15  )
X-CRM114-Notice: Please train this message.
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Export pci_enable_pri() and pci_reset_pri() so the SMMUv3 driver, which is
tristate, can use them from its probe path when built as a module.

Link: https://lore.kernel.org/iommu/20201112125519.3987595-9-jean-philippe@linaro.org/
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
[nicolinc: drop stale or already-exported APIs]
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
---
 drivers/pci/ats.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
index 9cb23780093dd..b6de3c858d390 100644
--- a/drivers/pci/ats.c
+++ b/drivers/pci/ats.c
@@ -320,6 +320,7 @@ int pci_enable_pri(struct pci_dev *pdev, u32 reqs)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(pci_enable_pri);
 
 /**
  * pci_disable_pri - Disable PRI capability
@@ -399,6 +400,7 @@ int pci_reset_pri(struct pci_dev *pdev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(pci_reset_pri);
 
 /**
  * pci_prg_resp_pasid_required - Return PRG Response PASID Required bit
-- 
2.43.0


