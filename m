Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F0BC9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 09:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OstTNDk8mZdVEfCJHH3Kb7CUNFboDG62kKZL3iWlE7Y=; b=bxWoeUBrnK948F
	YpjfRZeEJVcKSO2HKzMpM87jj41zk9udQMPe5CL1gOl+eeUgVsvDr82tQquXjXptTixdki4P8eN97
	eblMVHzDdJ2Ng3cUSgn7hdZD4LtB9DLOvKIqeUK6TprzWHVDIaBZnG+mlbDN8hZpY4HJnBJFBNgJN
	28txf40Bnn0yf0EA5RVVGcxSn8cASKIYNWLX4uhwNKWtzCiUtmBaXLaQNN0rcHRGdY1WmYrUMHRwb
	uSwI9qMP8Nkw5YLgoC6jybhRG85i/kmJGfhr9+wR0r+KMx3Roj5l4zJcsga7jjpGJ/wbTUEXTqSBf
	Vu2Ucr7VGKu1FtJb8ClQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7k2-00000000EP2-022p;
	Mon, 28 Sep 2026 09:33:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7k0-00000000EOh-3QgO
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Sep 2026 09:33:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=OstTNDk8mZdVEfCJHH3Kb7CUNFboDG62kKZL3iWlE7Y=; b=Kj+ynIdZ2Ha7r+mJQKu/eshOR6
	A2L+HfoUSo0mGtPukFT2o/IDeFXBZkZdRxwG7OKQ8IDGSNosiNdbKkCBfCve8RniCk9sSrgPbs8F/
	GyfZchIQ5e88AtrfTh+oHrKGKPw23UCtCGRTWypTUa3iZGXoMDtdGV9lhI1WcWz4Wo35n4M5w9HB4
	yUlUFXDmTumumwNWPrl4sTcc2hHt7SGfNKF4nWeiPUurbX/7Ly7LuHgGH5lclMH1wiCbJjqZNwtOV
	ujcAhQ9k4p3X377bCd18wWAMGm+YjSc5OKKDtVuG7hUkPKcHBt7UTGOiPpxgutSXT02LrEOVJAl4x
	teC9GJXA==;
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xB7jw-00000001JAo-2vfC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 09:33:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aFVDPla1G9sfB7H44PDe9FMeOTh5b8QlaA7ihCFifVWMOO3M5Qc+U6WHMHa8kPRyibw7idcICceZLuQMd3SeiwBedzWDC63fy7epXK4l83Ck06KLK4O1bHwgvWqOp9TZD3qhD9HWX4Xr2kjD1OVYCIkm0HdZSej5qMbNnCuJ99RpNzIv+Ly8euODWVC3hIYK7x7fPxqBg0P1HZNBydSzAHMkZScQGvfOejA7vfQgfoKmt8NqSCxz5P+z2LaxCCtz61gvOJwwg3ENmYdUnaXoKy3jY+Je+3g65IPg5fdok9U3PpQrZe5iQCzInZhc/RVxmlVwfsec/XVZb7KziN/u+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OstTNDk8mZdVEfCJHH3Kb7CUNFboDG62kKZL3iWlE7Y=;
 b=WY1FwmM+dAzGDfPT49JA/aD0E8ajhXO0KqkcoX61pw5mZNGMRWiCr2FKPQ+K60VUKsNMOv3v8b4yQmuTjKPtSe2IqCN7C7q9lNfuFvl5cIZVYc/OR1kSGtadQTAEgw/p3XNK1sqVCyplqGl1rdKPjyNSpgbX3oDNmtUKFfFM05WjrRIGNMp/xbfUgziJ+WONPu2SES1iqJAbzNC2QoAIOoX6yokdzL6FTgcd4gCY+ETjnSsWLAKja+BrB3sWBweCj8p/Vegw1T54mVTJ1OWHC09WYC60DggaOSoO/I5zAb+dXqbH/hTeWCEwEieJU8xSPQOMMSoC8n7bZnH2bTuAmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OstTNDk8mZdVEfCJHH3Kb7CUNFboDG62kKZL3iWlE7Y=;
 b=gIFYDQ2mkt25wMJBi9HL4tpjpzBq2A6WrXfABBBqzNYAiDeFtjOaTVQxnB5YFa0AmE5TT39w+wCDFbwgIpAW86NE4VCsE7xTjF3nGusIIwMlM9B2/jucS4iZNzZfozhxh8TLjZYhAuEs0tDxqtNWoLPm4VVULua44SHKwxuUthY=
Received: from SJ0PR03CA0038.namprd03.prod.outlook.com (2603:10b6:a03:33e::13)
 by PH7PR12MB7115.namprd12.prod.outlook.com (2603:10b6:510:1ee::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Mon, 28 Sep
 2026 09:33:28 +0000
Received: from BY1PEPF000264B0.namprd02.prod.outlook.com
 (2603:10b6:a03:33e:cafe::57) by SJ0PR03CA0038.outlook.office365.com
 (2603:10b6:a03:33e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 09:33:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF000264B0.mail.protection.outlook.com (10.167.242.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 09:33:27 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 04:33:10 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 04:33:09 -0500
Received: from xhdtunimkar40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 28 Sep 2026 04:33:06 -0500
From: Tushar Nimkar <tushar.nimkar@amd.com>
Subject: [PATCH v4 0/2] Add Xilinx Versal NET SMMU CSR interrupt controller
 support
Date: Mon, 28 Sep 2026 15:03:02 +0530
Message-ID: <20260928-smmu-changes-v2-v4-0-3c79a14cd806@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE40umoC/2WN3QqDIBiGbyU8nsO0THe0+xg78K/lwAot2Yjuf
 VqMDYLv5OV9n+dbQDDemgAuxQK8iTbYoU+hOhVAdaJ/GGh1ygAjTBEvGxicm+FeBRgx5KptKlJ
 ryikHiRq9ae1rM97uew6zfBo1ZU1edDZMg39vLyPOu6+dHezpEBRaC8pKITkjV+H0WQ0OZHckf
 zQmR5okmjVSIy4Fp6j+0eu6fgDLrB8z/AAAAA==
X-Change-ID: 20260917-smmu-changes-v2-9cf7435d6969
To: Anirudha Sarangi <anirudha.sarangi@amd.com>, Thomas Gleixner
	<tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>
CC: <git@amd.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Tushar Nimkar
	<tushar.nimkar@amd.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790587986; l=3228;
 i=tushar.nimkar@amd.com; s=20260917; h=from:subject:message-id;
 bh=w+oDenSjq25C7G+cvIlBriSr9cVaWzlyx3Eyi3Wy+Ik=;
 b=v0yrjnfEDERWMtAEEznjNwIaw//emgQSpQrLgSNbCY/Okh5HD5lnLIe67cySa9okEsaIQX06z
 9gH4cEZurdwCEKIuJFIGAy4buc+X2btlz7t5N7riVuPjL81DZpzoYCw
X-Developer-Key: i=tushar.nimkar@amd.com; a=ed25519;
 pk=Uirerl/gKBwPgdWL9awJAJkw5FM33ZF2TlUTJ58DEYA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B0:EE_|PH7PR12MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a92a227-0513-4220-c3a6-08df1d438d47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|82310400026|1800799024|36860700016|13003099007|6133799003|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: fYfmaUyNM5/GfSh8qgpvb1F48/IZZbmem6uNzR6m2eurQHowPBJUPUsbwyjbAL2b6ELjCdyCh6M8tFrCN3C1y/iJoljjQdFyKErwzM88uEuK+yEwq9IFjt526YExqWmEsPlQ1zxj02L5tTgkeJgWuqtym8fkOihZkLsbjXIesux4jJ4kfrUBM8eziZtgVDJSSOOiASe8krOVNtBihDoiSqU6E18cZHsP5C2hN1/OLYCpnA4FsPUXWSfOny4PpMUMBeZGlSKmHqQrU1jsvq2GYYDjeK7muuxLJXkg1F3q8lx105ckhnqG6YW+/FjVV34pkfr/w6wH7ZPf0iko6jwIyuFYPi3ZtD+WoQQsT1jdZPqn0WjTGge8fTPPg2vBoY4R2h5POFc/NKBXPIRP/lKjz9yoItkLqUylTwVH13hcmFETY7+DiN6EwdSjM0QBCsRvwlltHKZfN38PWfKUC0WggqWI1DwQR86gwjx/UI4y1GlIWVl4qX4uVZuAmwrdtoUjMPZyq3i+d57pcqcdAGSCxPaZzR/VkFEw71qyuUsH0yucK6dk7uoW2kM9qCmmRdorjd+0wmKTezonIxwizrSoSZ0YJslldI34T5NhLE9GCz3pJrz01xchP405thsvZqGgrIiJnBonKTlmn7XI/sLtBgzSS7W0jQCzJUcnGN8hRF8=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(13003099007)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ihCC49/ONdTiBm3sEWOV2XoWZLQuYsZ16EczrB9PFZ5QDxnU87dNsZoQcKIASV+IwmHpM0VlCT/uslCOpaoAvbpaRqTnlGN4v2fWPeRNlqFGnuRGNRqX86eSlLCQCFNr0KuVHGMIUuqbG6bKHyJFL1exWmYKbPbtaP0x9CYPU70LeooyDcwFX6YaOHxrjCNd8cmIjavnJCZ12eVkHI55eY4wlIhhUcf+KYzD+gkN9k0KEJmmN5JLbTcrKVyauCqvVHavcppRDZ3BInuyRhL3aAaDfSBJ1tnJBZAD2VsrgsUs35OqFevPNJdJwO90+1vfJEq1bYYb+0u8oF46ORqJVGYCScpeW+Rrs82dW20UFmJFDiQgw+EEVDakqAJlOZjZO18ZLxZXKW0skEJP1u/BeDb408c9PT6HNsRK72Grw1tjNHH+0JwR+ZgJQnGH+EHW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 09:33:27.9207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a92a227-0513-4220-c3a6-08df1d438d47
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF000264B0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_103340_936365_9C3FF239 
X-CRM114-Status: GOOD (  16.01  )
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

Changes in v4:
- irqchip driver (Sashiko): use handle_fasteoi_irq() + .irq_eoi() with
  IRQCHIP_EOI_THREADED so the sticky W1C status is cleared only after the
  threaded SMMUv3 handler drains the source, avoiding spurious interrupts.
- dt-bindings: No changes, Added Acked-by:Conor Dooley tag

Link to v3:
https://lore.kernel.org/all/20260923-smmu-changes-v2-v3-0-87bd09ba9605@amd.com/

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
 drivers/irqchip/irq-xilinx-smmu-csr.c              | 249 +++++++++++++++++++++
 5 files changed, 345 insertions(+)
---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260917-smmu-changes-v2-9cf7435d6969

Best regards,
--  
Tushar Nimkar <tushar.nimkar@amd.com>


