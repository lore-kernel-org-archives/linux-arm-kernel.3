Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B24BC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 07:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F6ESC/VhTdnSV5QgrCO0g0jydHpmThXbd+4+o2GkoH8=; b=puTrMKkK+3ij9D
	DsZM26M9bisJMXX0H+tAZ+oQORqzQ69loKUujoKAfmIs1dBWdLDiyt84vEerYBS9PKzc116MCrh1N
	I19fwmq6wLucXzlZuatJx1fw5JlWoeDHdaD9UHKQucwxnw4WV8lfXADWjGSz/hHt0opyHsLzgYcBy
	OzezX3/mgel1FZqpIDiifuHifwNghluBNf5XKGqO/AhFQqteBnHMVED6YnbdHIKcouyuEh1OFN8gJ
	8pdHbyEsecd9TihnwbZjqW1kwaf8/4Uqx02rWQNa8NvmBJQxUBj5YEYstdnXqbFpQC3wJepyS2SoK
	BeeTxYOIL9wODNnZ2RBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9HDv-00000007Nb2-1eEW;
	Wed, 23 Sep 2026 07:16:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9HDt-00000007NZy-2vN3
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 07:16:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=F6ESC/VhTdnSV5QgrCO0g0jydHpmThXbd+4+o2GkoH8=; b=mPQ6sYR4uhLKP8U1mxxBltO5qR
	EhPfxCeyHfPcHEr2BF88EkohKKuCtPO3EY30DeDczfcmIUSvJXhfZS0eT76Gubx/Ryi92/r15awzA
	vIJXPazaSrNooD0ePd4sRGPelxEc0b2mSRDdnktTanV0sqLIrWoaXUaC2jcXfppZCtZok47grWIc9
	k7v9hveoC7E/zogWNEcCyUK9ZiUxtslK7qZ/BTCA9xpBkw+7rpnWOnsoVwh5WRgcyeMbIEN2tXf1f
	rbNNkc+mfPKlu21j2NmSkCq8hhftFr9O9xyqoe3GV2fI3M9mAqdhGWWhZqhwUYyy30gsEG4zbuiOi
	8kcnw1hQ==;
Received: from mail-eastus2azon11010005.outbound.protection.outlook.com ([52.101.56.5] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9HDm-0000000ESlP-0rBO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 07:16:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G01hCN3ktLniijUnNdOAs/GysozHGAWCmqr95fYim4MLUtNCG1gLbuM+GPDMjsnTMpF2PFdlIP53xr/P5LaIQLiGFr7unoteVyrK1C5t8Oj1sZiYUNRhJ1IQn6fKPNxtU10X9VUyDzZf3p3P1R37d2DcUo96siXSm/sHMX/12fOUvE7YTKKotrZbGDoAlgHQXa3OKWvRF6+H1Qt2ZpPYyKRU841S7WXmigKR25BKwPap6xOEkOhRJv+51ECnWXx/yVocu2gWPhsYrK6jUQ+I89/A/kI6vMP/mEplcD18xQd4IVt+65NAlnNKYchEer446MENo0Vcu3XBgJ+G7U6D2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6ESC/VhTdnSV5QgrCO0g0jydHpmThXbd+4+o2GkoH8=;
 b=efWy+T1ZWnitED5fHe8FnOn/W6ldl6jug4o6ydl9MYP5RQOCeUjIx9o/zbujqDCD5QSd8XY98oeQQjfQ859+bpUt2aVMWtaL2GHlFEHNhzJxbO4IqHp3c/e3LjkcQkS0HTz/JukP8vkmnHLqSmjHlJxe0vGaEs/6fQZ+hfX0LG3wPHBOq2U7coZ3uJMNM8/lX4CeJirjAK2avyb58vb7Cb06wNH1ERU0ISwOpDB2dGPfb6R3Ly8uHOYhJXpZaYE3E0rNITIDS0v58v+CLdjtVPKrlnjwoyrIQA/6I1i4q7L9HcQTf3uF8gRZh2/cVgMPRMZLKHtnOWCu/cUXGWR/pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6ESC/VhTdnSV5QgrCO0g0jydHpmThXbd+4+o2GkoH8=;
 b=nOkeGLqH6fE7DlfqFLu1M4mJBmLD3z/juEziMuCqn4AkmHVcrd5Xu9c+0kEXMhIhh4N3gewzPgBjOs2HXNtQxZOBAt6q0tNXVXUQ3Yggq8+Ri/t+m5tbL+bXL6jtOt1t/YtbQKLvpj+jMtjajgqtoD2tN3KSSkdYruT561XmbBA=
Received: from BY3PR03CA0014.namprd03.prod.outlook.com (2603:10b6:a03:39a::19)
 by DS0PR12MB9397.namprd12.prod.outlook.com (2603:10b6:8:1bd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 07:16:39 +0000
Received: from SJ1PEPF000037B7.namprd05.prod.outlook.com
 (2603:10b6:a03:39a:cafe::8f) by BY3PR03CA0014.outlook.office365.com
 (2603:10b6:a03:39a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 07:16:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000037B7.mail.protection.outlook.com (10.167.244.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 07:16:39 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 23 Sep
 2026 02:16:37 -0500
Received: from xhdtunimkar40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 23 Sep 2026 02:16:34 -0500
From: Tushar Nimkar <tushar.nimkar@amd.com>
Subject: [PATCH v3 0/2] Add Xilinx Versal NET SMMU CSR interrupt controller
 support
Date: Wed, 23 Sep 2026 12:46:30 +0530
Message-ID: <20260923-smmu-changes-v2-v3-0-87bd09ba9605@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM98s2oC/2WNQQ6CMBBFr0JmbQ20Wqgr72FYlHaQmpSSDhAN4
 e4WiCuT2bz8/98sQBgdEtyyBSLOjlzoE4hTBqbT/ROZs4mB51zmqigZeT+xIyI2c6ZMW17E1Uo
 lFaTVELF17934qA+mqXmhGTfN1ugcjSF+9pcz33o/e/VnT5czba2WVaEbVYm79vZsgod6XdcvX
 fzwzr4AAAA=
X-Change-ID: 20260917-smmu-changes-v2-9cf7435d6969
To: Anirudha Sarangi <anirudha.sarangi@amd.com>, Thomas Gleixner
	<tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>
CC: <git@amd.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Tushar Nimkar
	<tushar.nimkar@amd.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790147794; l=2831;
 i=tushar.nimkar@amd.com; s=20260917; h=from:subject:message-id;
 bh=dcaP//lux8UKT6iLWE2PjmAzR2xOPitWirktA6l+RwA=;
 b=srOgpJ1tfaB8AA+JVrFZKICOH9bndzTPYkRxVztqR2xWSe6eFUobgv+tnJ9WvfdkZ+VYIMauS
 IsktJ5PsCa6CPqa5U8TUZ8XSyhRT6DqHqqD+hGB+Cu0FdZA2Z9+nebg
X-Developer-Key: i=tushar.nimkar@amd.com; a=ed25519;
 pk=Uirerl/gKBwPgdWL9awJAJkw5FM33ZF2TlUTJ58DEYA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B7:EE_|DS0PR12MB9397:EE_
X-MS-Office365-Filtering-Correlation-Id: 97e00331-e268-427a-62c8-08df19429c71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|13003099007|6133799003|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: Ls8b+eH5W6FEmIyDXh/WAmmkViRt+awQ4sHBPH1LZvmEY4R4YU07zOmMUD6VVJBgEU4SJOOLEm/hBB6rkDTmgoujnwyHLsJUVdllFDGmHHjT6GkiRoeQAtGyWlgDDrVDxhBXyhnwsIcNfioyEGG7BHHhzqOU8QXgxdsfMbmkNIDoZXbQnydnSLxvLfoX/CnaLPFNOVzI8uQ15u3Npr8bu/EKYn9P6cgVSbyb7KCLTm9svwmzeVUKY/x9MqYUQtnFhnmyG4vYvzkh+sa9Gh0EdxBxkppeOYLLIJGDdRjE0cUx/WUMrn0XVan5Kbe5J0zojhnAi2ooKArgu2Qw79YzKVjHMaT/eOrqn+OIv8Z3DhJ2/x6GaiKyZmC5p61HqFQG+YiSW6m1a+8Xrbx2sPf6GK3KZx5SGifyjk2S2jSWHhhIxOvHS4VNtpdyv0n02uqu50+CPrwlxS2X+PmU/qlEJUyKI/Zx4IXfwd9zzVPVJ9EMp+swHN2rkPY1vMEYgvK31h0FS4U8IKVhsS1g2oMAY1vnirt+ATF5wuEr6Vf0NNmi5kOZ4DXGeX8bmF4hA6KUWMqUFEV+5PXq16IpERC6LIyDmW4WChMvOfwMn2G6zj27Avtgs/kHiB0t0ZotvANh5wg9oOr749qaC7PvokdnUtYHt/EqJkWq3s2FUL8b4Vs=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(13003099007)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: A43eeVJ/ncF8ZzreD3/e7foK6ii6bzb4MTs8xLmLq0Un1LLtpKiJls4x4q55fAkGJlLs2yxLypNHPURGV/rL9jCBcPdg2Zek5gyoUAjVdwA907AiRUUEQw6wtswrZ6NXYVvoae/tpqYL68KL0PzF1JgO83fUnlQPY/+iIBli0X036pe8ga1mYRF+vras7+SZ0/VauIdwqhfcS5miY7Qrr77PBqOEpgejeP4Ie/P4RbaVB/CTKv70+gQh/kiM0PRz4p9aorBMQeAXPfVwSb88xzkMBL56q4R7qZMLZAj9FcoJ/M54rpGqedH+YkAvM6YegLnQlN8OrkVciSNI2/D+ZqfDNB4YiA0oLyIJtY7Jcs8JpZaGyxGzzysLsXzjDMkJU9IteG5IIwZw7nAs+p9B7ha5LD6gDvO1vgg2FsvXcdzGkHB5OTU/Qbaq7l0dCIIG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 07:16:39.1841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e00331-e268-427a-62c8-08df19429c71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000037B7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9397
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_081650_944539_AAD14672 
X-CRM114-Status: GOOD (  15.04  )
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

On Xilinx Versal NET, the ARM SMMUv3 EVENTQ, PRIQ and GERROR interrupts
are routed through a vendor-specific Control and Status Register (CSR)
block, where they must be enabled, cleared and acknowledged before being
forwarded to the parent GIC.
This series adds a small irqchip driver for the CSR block that chains to
the standard arm-smmu-v3 driver, so the generic SMMUv3 driver needs no
changes.
Patch 1 adds the DT binding.
Patch 2 adds the irqchip driver.

Changes in v3:
- irqchip driver (Sashiko): harden against interrupt sources left
  enabled/latched by a prior boot stage:
  - Mask and clear every CSR source at init, including CMD_SYNC (bit 1)
    which the driver does not service.
  - Gate the handler on the mask register (ISR & ~MASK) instead of the
    raw ISR, so masked-but-latched sources are not dispatched.
  - Mask and clear any active source with no mapped consumer so it cannot
    spin the parent line.
- dt-bindings: No changes

Link to v2:
https://lore.kernel.org/all/20260918-smmu-changes-v2-v2-0-adda681ab983@amd.com/#t

Changes in v2:
- Posted as a proper threaded series with a cover letter (v1 patches
  went out individually).
- dt-bindings (Krzysztof):
  - Dropped the irrelevant arm,smmu-v3 consumer node from the example.
  - Dropped the unused "smmu_irq_csr" label from the example.
  - Dropped the redundant "binding" from the patch subject.
- irqchip driver (Thomas):
  - Aligned kernel-doc member descriptions and used "interrupt"
    instead of "IRQ".
  - Used guard(raw_spinlock)() in the mask/unmask/ack callbacks and
    addressed the comments related to lock handling.
  - Thomas suggested using devm-managed allocation and irqdomain APIs;
    however, the driver is registered via IRQCHIP_DECLARE() and has no
    associated struct device, so devm APIs cannot be used. This code is
    left unchanged.

Link to v1:
https://lore.kernel.org/all/20260817105233.1557748-1-tushar.nimkar@amd.com/
https://lore.kernel.org/all/20260817105251.1557770-1-tushar.nimkar@amd.com/

Signed-off-by: Tushar Nimkar <tushar.nimkar@amd.com>
---
Anirudha Sarangi (2):
      dt-bindings: interrupt-controller: Add Xilinx Versal NET SMMU CSR
      irqchip: Add Xilinx Versal NET SMMU CSR interrupt controller driver

 .../xlnx,versal-net-smmu-csr.yaml                  |  75 +++++++
 MAINTAINERS                                        |  10 +
 drivers/irqchip/Kconfig                            |  10 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-xilinx-smmu-csr.c              | 247 +++++++++++++++++++++
 5 files changed, 343 insertions(+)
---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260917-smmu-changes-v2-9cf7435d6969

Best regards,
--  
Tushar Nimkar <tushar.nimkar@amd.com>


