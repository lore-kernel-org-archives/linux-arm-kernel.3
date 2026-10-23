Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3366760A2638
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 09:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z5W40V9q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=O1Ca1J+pdV6OKvlU9na0iOEnhl0GgywNZia5rpit8mg=; b=z5W40V9qstDVwhx+fM5JBOffJW
	wsekuezWKAtuRd/v2OMubqaCyA+TpsgXQBZ/M5BxPFbbFCLIN0H4R0AepeMPAdbbc4H7mcXCqCUIP
	sRDWk6eF9u/cP+nQlSOCImZWejlW18uxcruNyg+hvIiRJCSmGJEiFJEzV3yNUaaUsW+4pU629bO9n
	M5+RXTX8n8W8RVd4KtjsuxViCsB5tBC3b02A6AXm7wROK0rrsTnlvynRcXPwI1VIdoOS/HOpxZtQ4
	T38dNRxZwJynrJoGiVkJmuRLzEqYPfYxcSHI77eHNCnp5ma3zdqqdDQI/OYkiWH80YIzg2i1YyWBP
	04VkeAyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBbj-0000000G2Q7-0qXB;
	Fri, 23 Oct 2026 09:30:39 +0000
Received: from mail-japanwestazon11022083.outbound.protection.outlook.com ([40.107.75.83] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBbc-0000000G2N5-1tTP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 09:30:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZFaA8KWzDloRS6u10IIsrmROPtjmodEA2VtZ4Uo/t/5SydjkQyTEcbihjsgaRWXjFf+hbPfvqEFlKXzp83d4bA2HYGBRY8DwURnMNTlLoH8l+CHEmHRt0rJ4+9nK3gh7k9txyqUEhM0SbVrgnclP0rPbr3yZCSii3Vqtdeuo1Rhb/Z+oiBwGoN+oxe64XDhLhS2a/9ph+dj/r4+bshxCMU6dU84UoiLuhNyRGZFt59wiYqCT7dnGzRvsNEFvfPXqeaFUFJLOIF9aVOANS0eDk4BE2uvQFhLN2HkclvJA0BaSGM479JqPCAB+wQSC4lpCslM1Kx1asR1HyjeOhxqtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1Ca1J+pdV6OKvlU9na0iOEnhl0GgywNZia5rpit8mg=;
 b=FCIYz+g81BRa5DRiSAOWoYKFFsajh206FjzHJHg6a4ybAjnGjKshJB6FNVQvQUyDKaKOcI+3I6QyGc43U2/+vg7CMGHC9rypwklLpE4GGZSvo07SM9aUyvc8VKtvgz2xVll4/D0rmzSCD892Oht9oH2ify3LuH5DYcSRulQsoLygmeNnuD5HxwWlT6qG9tIACOX2n+6MWpAQhTf07HtnXL+3t01uE9L/nCsNurtL6Z6MjnpucbRkujWs0C+1kweat3b3g32GBAiPYz9dQVugzGhYGZyxv4RBKhlURerz24r+hJaR5ULy1dgeXRXxU9AWX2S/Ho2RTgjZscr646L0Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OS3PR01CA0074.jpnprd01.prod.outlook.com (2603:1096:604:da::7)
 by SEZPR06MB5221.apcprd06.prod.outlook.com (2603:1096:101:74::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.3; Fri, 23 Oct
 2026 09:30:20 +0000
Received: from SG1PEPF000082E1.apcprd02.prod.outlook.com
 (2603:1096:604:da:cafe::97) by OS3PR01CA0074.outlook.office365.com
 (2603:1096:604:da::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Fri,
 23 Oct 2026 09:30:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E1.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 09:30:19 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id D610C4102B40;
	Fri, 23 Oct 2026 17:30:17 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com
Cc: devicetree@vger.kernel.org,
	Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com
Subject: [PATCH v4 0/5] dmaengine: arm-dma350: Add slave support and Sky1 integration
Date: Fri, 23 Oct 2026 17:30:12 +0800
Message-ID: <20261023093017.3248454-1-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E1:EE_|SEZPR06MB5221:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e684b4b6-0be5-4681-6807-08df30e8410e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|7416014|6133799003|18002099003|10067099003|56012099006|261009223027099003|261021121427099003|261021123027099003|261022075727099003|261022105027099003|3023799007;
X-Microsoft-Antispam-Message-Info: sZUZIvWukFX1VuY/+d78AAFVaApK4WuoDMvS5sWB02RJ3tuMRA2737rVQLhbGfPnA/RjPjJr560YIRx6dFC07iyyJD531XMQZuQj1ft47CdNFxKDW794PNAavZdHsBfOqgDTZ/zQfgfozqDFdPN1jxXt7f6zgcMenYg1E1dYD/CDfFhDAmnWRy+MCMqgI/K8GGP8ghUlg1KtsBN21J42LQeaniUUYCMwRtxWQS/CUtC2vPG5cmAj9zcmoA7rl4thckcrUzg//E2wH0Jdt2XWjqQ1k5mhNY6BQSG6l2GmNcS2jI6Cv7BRcW8fS8LU46NFG7Fxo3fmyvk/XyTxxUDC2Er4Twdd3lxeyIPCu2F+t++2vP+IeuQaV3yWhrOdcybSi0KqDNCbi5Bx60nBr9MHy+CelTsQNK977pub0kVv7C9xRYXGYLntU+HN6gp11plAVKcSwVPWudxnGd7fiCU4aNI9BdfV6FpXGKli+2UPJRF7NQuKPP/xYXC2LatQ8vcLi+/7wggxRP9WOunUVNxtjEJ/lO62LmRSO96b8I+MBVbcQt2HdlgdoiCg244wbWp1HvAYRvwI1iPBqZQDLt0rkTCaA7eU7zCe6lf4BBSTSlzyVacjefT3f4PjKAPtgw12QPNKfxJzv9Wu/VcNK14t6A==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(7416014)(6133799003)(18002099003)(10067099003)(56012099006)(261009223027099003)(261021121427099003)(261021123027099003)(261022075727099003)(261022105027099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jDPlw0F41p2lyEAV2RygDA2XnxvfzVfFhZSepgqRfmQvit/T0/wcEN1XXwWHPAdT3Dp4/ImFWljbTKyjN68B8T4ISt/kog+JeR7jFx9OvJ4l/m20w2JqLgdk1H+PjT1lLTXw82fTaDSrWhjXlAYbbsj3eNr4Gzb1XST/z8VGMxxUySlR24ybaalerABd+p/1kfH/geXWREGfCQ5VAR+lo7upNZvVlYmkt428sTEUvXaUlfrIZINZy3F+inczZUF9Y5co2j6mK/xPr1r/GAEnhFj5dn7kTt1shW21Q+zKp9+zpg9Y/QfOwYxuhln0/NF7DOiUyg99aN8TEX/Yu3K3NSfmnSKSB3rxYynrUbIknEzjdC5R8I2B3VNDYLqLZTQJyB68MKZPX0ZOwfNQo1mOizAimckoD/Cb4o3XWvxrQTw9DkoALY2yDNzuWuMT2H6m
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 09:30:19.0069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e684b4b6-0be5-4681-6807-08df30e8410e
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E1.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5221
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_023032_500672_C0BD7E08 
X-CRM114-Status: UNSURE (   7.95  )
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

This series adds scatter-gather and cyclic slave transfer support to the
Arm DMA-350 driver, then describes the clock, reset and DMA address view
of the CIX Sky1 FCH integration.

Patch 1 fixes the source-trigger bit. Patch 2 adds peripheral transfers
with descriptor-owned resource mappings, coherent linked commands and
hardware-based residue reporting. Patches 3 and 4 document and handle
optional integration clocks and resets. Patch 5 describes the FCH DMA
address windows and adds its bus clock.

The controller nodes use arm,dma-350 in this revision. The driver changes
use standard integration resources and introduce no CIX-specific register
programming. The companion AUDSS interrupt-path series builds on this
one and manages the AUDSS interrupt gates in the CRU driver.

Changes since v3:
- Merge command-list synchronization into the slave/cyclic patch. Use
  descriptor-owned peripheral mappings, a coherent command pool and
  stable residue sampling; also handle little-endian commands, valid DMA
  address zero and maxburst in both directions. (Sashiko, v1-v3.)
- Keep clocks and resets optional and move allOf after required.
  (Krzysztof.) Use a deasserted reset rather than a reset pulse.
  (Sashiko, v3.)
- Describe DMA address windows with dma-ranges and omit memory-region
  from this series. (Rob.)
- Move AUDSS and its CRU-owned interrupt gates to the companion series,
  keeping CRU register accesses out of the DMA driver. (Conor's device
  separation comments.)
- Poll STOPCMD with a bounded timeout and retain IRQ and callback cleanup
  on timeout as best-effort teardown.
- Keep patch 1 unchanged and retain Frank's Reviewed-by.

Link: https://lore.kernel.org/r/20261012084155.2547480-1-Jelly.Jia@cixtech.com

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>

Jelly Jia (5):
  dmaengine: arm-dma350: Fix source trigger bit
  dmaengine: arm-dma350: Add slave and cyclic transfer support
  dt-bindings: dma: arm,dma-350: Document optional clocks and resets
  dmaengine: arm-dma350: Support integration clocks and resets
  arm64: dts: cix: Describe the Sky1 FCH DMA-350 integration

 .../devicetree/bindings/dma/arm,dma-350.yaml  |  16 +-
 arch/arm64/boot/dts/cix/sky1.dtsi             |  36 +-
 drivers/dma/arm-dma350.c                      | 771 +++++++++++++++++-
 3 files changed, 778 insertions(+), 45 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.54.0


