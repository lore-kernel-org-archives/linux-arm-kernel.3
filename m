Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CB0106FD87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 06:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qa038Vk4jk979t+QVTamnRblrqeFhpY0JuSphPBf7yc=; b=xuzkF3VdKdvhM+qcOOaMcE/gQ5
	dJFSRf/Rwx4lDT3I27ZmuKF5IsKOw/2sBTJ9TgkMwW69h/pvW54CuasBGPoDjH3CMhxUBA8K0bTsf
	28ZsHkXrtWnL+oTXI+MuKPasB8Voppk+Jr4h94C1xfmh1Ak72JFOYR51ojYOd2rD8HV71ztAcyOvQ
	OF5pYEf7FoElEAtGCk8LRZApwVluI2Sx/JpZ5Suce6QnAkUAOPaVDiMGsImqTF1GB7P4uYN5gSHGR
	UQgsAQ5hMq1O1fmTQDXF+sTErJL4EkSdzLhJifZ5pegiqhcWCa3hPHiW/gs6D5umXBCYkj4accaUt
	M4Sqx3AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vyK-0000000GqkQ-3zuP;
	Fri, 13 Mar 2026 06:26:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vyJ-0000000GqiH-1Kwh
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 06:26:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Qa038Vk4jk979t+QVTamnRblrqeFhpY0JuSphPBf7yc=; b=qf7OE0HPJw74i91Snq7bPVlb17
	hBs+41rLQ/+gFYZXtYU+DFXGW3lzMvPXQj+ZzWW9+qlGbQ3JUq5i5TJ8bzru/0NDnaDEAQ25uxJsn
	6Qp08kGn2CSGH58v6AUoop2YFoF9M94wSHoonzBhyXyQegMqwdWYl+5NKP0J2VahxVAHhWGRzafqa
	yV2+AuKYUvPz+ka/ZvC2ISqzh3KFiepJMRBVuuNfUygxlI5PpL0y0iEAxqiv4FTLzELrBVt5MeDXj
	t34mWQRLoCThoFinmaoQJRKkN6XOEKwX3r4fGwEdx+5YaAgzDDhc7VnLeBXKt0keFCCoocsSHKJK3
	/NbfOflw==;
Received: from mail-westcentralusazon11013001.outbound.protection.outlook.com ([40.93.201.1] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vyD-00000002emR-1XuA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 06:26:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EB+I3NPD1D7C5YW8gS1uzPZ++55l01VQXEwZoUfD619torKZ4eQnskucWeUZ0SUxHNcGWajIAWRd7YCfTsA6v3sL2AQHCZ6uoZDPGRphOcEBw++JfUXorhq1qwN0MksGU3OkSap3N+y2u3m85H2MODVsr+a1PeaAN+xLLEChPxAD27rddkaYl+ST9oeKBpicXM1fz+LmnAT0b04lAru8GlDaAThPG1WcWUNwwoCUi2su/FT1cwm42C8dY/2Hn5U22hIPy05rX/Rm4YtlDXgk91yVkmGe1QVycarfcxOykRZcyGUvSAy9m132aELdDZc5/siaDTrK97jtcs/Iy0qJ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qa038Vk4jk979t+QVTamnRblrqeFhpY0JuSphPBf7yc=;
 b=S7fMAKrc77lS9D1Y+yEtPyHYgEMOl7AjuydpCPI4DMj6srN9sBtSqvlxym+VS3p6P+fyRrKDSLDZM37Z2J1FneczGFT6zQCdpVtKgr2NCyFbgTYTzb6kp8Pwgm/cKXMdlsnzIR1HIB3qtbTHEq1CJsKdssbOuyIxPksJLq8xw5a9E7mvWqSdauZiStpKzI3o+TnCZdFn9CpL4uc0OooSnlwZXqxE6D5zZyyxLCZ7por3kCF/nNkFAzwPPycyAM0FVQ2G0U29PYKJVytUbPc0KVS0dBoGhJ1pkRp8nkbsBz/sXLVeCj7oat4i6glczVmnIMlEOtb3WtU4DjFIhkdWVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qa038Vk4jk979t+QVTamnRblrqeFhpY0JuSphPBf7yc=;
 b=W9wR5GPjdYkIjoIcJwzDVAZ1Eduwe2VUp2YzAmQyPZx5gRlCeLvlEo8vK0Mw1NhTXU6waojE04xVW81I05j4WMnzklYb98MsSxKoWi1eNQe0XpFvguzhVAPQM7kN+633sMndaHcOuU4y5h4rRu/db76Y9d/nGnm5zeqMjkUiy8c=
Received: from SJ0PR03CA0060.namprd03.prod.outlook.com (2603:10b6:a03:33e::35)
 by SN7PR12MB7418.namprd12.prod.outlook.com (2603:10b6:806:2a5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Fri, 13 Mar
 2026 06:25:50 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:a03:33e:cafe::3a) by SJ0PR03CA0060.outlook.office365.com
 (2603:10b6:a03:33e::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Fri,
 13 Mar 2026 06:25:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.1 via Frontend Transport; Fri, 13 Mar 2026 06:25:50 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Mar
 2026 01:25:49 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Mar
 2026 01:25:48 -0500
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 13 Mar 2026 01:25:44 -0500
From: Srinivas Neeli <srinivas.neeli@amd.com>
To: Vinod Koul <vkoul@kernel.org>, <git@amd.com>, <srinivas.neeli@amd.com>
CC: Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Suraj Gupta <suraj.gupta2@amd.com>, "Radhey
 Shyam Pandey" <radhey.shyam.pandey@amd.com>, Thomas Gessler
	<thomas.gessler@brueckmann-gmbh.de>, Folker Schwesinger
	<dev@folker-schwesinger.de>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, Kees Cook <kees@kernel.org>, Abin Joseph
	<abin.joseph@amd.com>, <dmaengine@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH V2 2/5] dmaengine: xilinx_dma: Move descriptors to done list based on completion bit
Date: Fri, 13 Mar 2026 11:55:30 +0530
Message-ID: <20260313062533.421249-3-srinivas.neeli@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313062533.421249-1-srinivas.neeli@amd.com>
References: <20260313062533.421249-1-srinivas.neeli@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|SN7PR12MB7418:EE_
X-MS-Office365-Filtering-Correlation-Id: 732da20a-1bf3-4fd4-ae94-08de80c95ef7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 1CNRTcrf0TPWdr470GDNgB4yCHhRTInHsQEnj4GpxXsbv6mMumnHVdxog9jRArazdIeTuj2buijylsX/uRQqerSEpS0EhAWpdqxt3TdK/8CrI+BOeHgtQrhHlDn/p2cuQ/hP8O35CYdCVyR3XyLZ2yfNkPFFwRZSwOrt95cn7FFXgkjJnSbZKbF35B4+Ssg12F8Gi4ZEZBnsBuhxECgXYSKUf4UtqUIPQtv67jrQWC2ue/UTqdV8bfRt/roriFX7rLDB4BrYLetWuHNLBIAHIHYc66ivxaDtjEls5DJLv7ALhoByJ1DVS0QVIgPKZdQ97Q7ukyYnUA5Ps1+wtf1VH0LsYUksy2CvO9b/OFaMPs4CsI/N57qhcuTjIv5a3Oop1k5o7ojozrHC/xUNlMM7BLxW6uytNCVkLz1Khf6FwOoDlfUN38E2UNLAdM7Z41IXkDvn3lP+eWUnhMO13N0WapcylVNzXkQxxotssIpEqPQxJU0BvKnztLK+wOMgDvDCckxy2mb336WBo50c4GjnF6krYUaBx6+MBkw/zUgwXbXGoM8/dzc0tXxIZeRGxijL3i4fnl5kz2EGXOaW7xtHOwDkZlVevoUtz4SUEmLftIzpyWftLYnUz3ocgdM6EtmSnqxTHb7BJZsifhdxaQKjfsgTE7guXoRqbKlSV4wWEPjz9znRikHD29OxmQSXx/V0ImKYoyE0iybnH4oglPp031JaFBdgDKIlAqk3+CCVRIbmjxhUG07OFEg/hYQFgUxKx/+dLG3bhT0fu5YgWMRTkw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LDbfELgskV8y2CJcBkhj2DVuPnNEKaWmDZJFQFB50Q2NCqVBBTtlwrO3zU25qsLB9ygB2aPBmw0czeEU94dCMWAnrIdaHYLX9Y+v9+2PALd3GzEZ8udEf5AXhl1QP2GJlZALT5lUPoQmOHC1SgmffkSlG17eKtPDE9+fycqE9YaL5qPlE/pwkZN4Ahtu5L9hzq1GGoOf9FZpNDFuaAaUGesU1+lmD+0J6cxeOSTVpfGvDgTUvh/0PjjW48F8yysnAVYIJxUnamVYoKO4+QR46uAuGLDB5m9d9AXo+IpLDX+ePv+OFbth9F3GvGuMjMxpR1KyWbsAxuOfAozTNz13Ug2rtYg5VicCjlWtDvjQTpmg4rA6TzhbyAz6pGryWfauFGl5ezSvRqo7rjvazE886bC0ffW5XcfoycF9j71WKXlHHEePgou+7RTRaGjgsbs4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 06:25:50.1923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 732da20a-1bf3-4fd4-ae94-08de80c95ef7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7418
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_062602_717865_9444FE92 
X-CRM114-Status: GOOD (  12.95  )
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

In AXIMCDMA scatter-gather mode, the hardware sets the completion bit when
a transfer finishes. The driver now checks this bit to free descriptors
from the active list and move them to the done list.
This is required when interrupt delay timeout Dly_IrqEn is enabled,
as interrupts may be triggered before the configured threshold is reached,
even if not all descriptors have completed.

Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>
---
 drivers/dma/xilinx/xilinx_dma.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 4a83492f2435..00200b4c2372 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -1762,6 +1762,18 @@ static void xilinx_dma_complete_descriptor(struct xilinx_dma_chan *chan)
 					      struct xilinx_axidma_tx_segment, node);
 			if (!(seg->hw.status & XILINX_DMA_BD_COMP_MASK) && chan->has_sg)
 				break;
+		} else if (chan->xdev->dma_config->dmatype == XDMA_TYPE_AXIMCDMA) {
+			struct xilinx_aximcdma_tx_segment *seg;
+			bool completed;
+
+			seg = list_last_entry(&desc->segments,
+					      struct xilinx_aximcdma_tx_segment,
+					      node);
+			completed = (chan->direction == DMA_DEV_TO_MEM) ?
+				(seg->hw.s2mm_status & XILINX_DMA_BD_COMP_MASK) :
+				(seg->hw.mm2s_status & XILINX_DMA_BD_COMP_MASK);
+			if (!completed)
+				break;
 		}
 		if (chan->has_sg && chan->xdev->dma_config->dmatype !=
 		    XDMA_TYPE_VDMA)
-- 
2.43.0


