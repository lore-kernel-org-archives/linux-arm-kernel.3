Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77B4606EEB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hPsTum0m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=A/zwYppY3H/BbzZu44s8fKjSB6dURflHGaaiXbNMdwY=; b=hPsTum0mhDrt2mwA210mUWDM54
	zMsDdxIh4Sd2z4nUFyDayrVH6h4TJ06wAQCMBe7xXtkivVMTaTrQfRGyRo1FbFNfh+byndLH+DeCH
	TUPuPEEINKN8tuhR+8qulrGwnbsEiil5mNnGmiqHLUFCwvAAUUAGMi0jSfmPP1vMKqaoop+23JZEd
	WSQBND96fDDgCunOdv68RYy35zpxZTI9mmvSo64do/iaakvpE/RIucDvsxluxpUcH+cIv+01O/ngE
	Hw0+aZEn4gYoq8bygqTYfM7vP7QIYiy/Y1aNhEeFwTAoQhrtSi7Jm9OX9wkereW2jGCbUIQLeXUzc
	ZmALaW6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaRi-00000005NkS-0IkD;
	Wed, 04 Nov 2026 12:50:30 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaRe-00000005Nfm-1RMz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 12:50:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DnirZDgihYq5V9rP2EZ3KOzqjqmZW2gOnt40rMP9TWhm9SAb5517VDnnG8f1YSP7fk14SHarQifRRR4gZ1n9yhp1PCmeh9pXLocY55xQFZtRLJz2hf6Xwj5MRQ5Hwm/3tBcqGxTulEpv02himOs8QOh51/OvitVGZYgqB+N5KhIMcaEcEdTFAuTA7aTfrDKMSxuIrShRxQeir4zTh/ulBmNkOXY1RcyJTlN/d8VYXoUZCZt7SCDeGIRlYyyzO759eSi9fpbKT6eGsVJwOQWf5RICsFiCro7FkbxA0aa9jiK8gZIk6+Pci5363EdfZbpL0Nt515+xdMFD+P8IgtXfWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/zwYppY3H/BbzZu44s8fKjSB6dURflHGaaiXbNMdwY=;
 b=QOY24am3NTTqtFqMJSVWCvR9HUWznZMVPKzAyl74HwcCIeDIax93kliUfw0oC9LWlsV6qtJe63A+tv8/FQhZmdbb+zsIKiaOyZie45XIwIqURNh09l46fr/VSdYLG7BIBozDtl9s4Q/3jpdcBRgftejgBXSgQe0F/ByvCtE893Dpjy8E5OTiozLt5TYx6bcnpi2LFKBVkm5I9jDttlCsUvQfijR9R2zs+eAe4Fm6oHy+G3qID3Qd5UhbbIdkw5E+BR9SknhwrF+2koBRP526lxONr9+YSHhEWiBSlOpx4Ggti1VMAzLqkPlshgOgfoIyO5jf1DjN/oQtZ5Km8amz4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0002.apcprd02.prod.outlook.com (2603:1096:4:1f7::16)
 by TYZPR06MB6498.apcprd06.prod.outlook.com (2603:1096:400:465::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 12:50:16 +0000
Received: from SG2PEPF000B66C9.apcprd03.prod.outlook.com
 (2603:1096:4:1f7:cafe::90) by SI1PR02CA0002.outlook.office365.com
 (2603:1096:4:1f7::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 12:50:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66C9.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 12:50:14 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 714264091E31;
	Wed,  4 Nov 2026 20:44:12 +0800 (CST)
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
Subject: [PATCH v5 0/5] dmaengine: arm-dma350: Add slave support and Sky1 integration
Date: Wed,  4 Nov 2026 20:44:06 +0800
Message-ID: <20261104124411.296640-1-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66C9:EE_|TYZPR06MB6498:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5c5bdb58-ece7-4638-6ee8-08df3a722c46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|7416014|23010399003|376014|1800799024|6133799003|10067099003|18002099003|3023799007|56012099006|261022075727099003|261026121527099003|261022105027099003|261028144727099003|261026140227099003|261021121427099003|261021123027099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: ZP3NkVLR6rTCxou5s5BxmTAXC4MX8LKRHJu6mr9FjtapsraiDRyg29pdRczEaNRsg6EHcfhUkz9oizgFbjDAx5mNZaYpyj0hOXZ0xAyv/XSURtro1n7rdBVDcMqQzK+rKOedBOWYMwnC+diHqypvqhrOIOzXDu/YsnDS1IVkxlEyKUR7y6p4k3vSx6wa6jq8NQ9bPdIKZyi4VxaxDP0wUiUD11XgT+Z9DQaXY51zxZ+QlB6+zQ9rNAIaY+K42Zr0OnKpK8ON+LSzgZ0XNDB3t13bcT4ZMsAuUaVWEvtDuGc3bJSmTE2YiQ8hcDDEdfdvPPvQT8mTt+4A2dote881lOM8pU1DzKK3XKCJzGwuk6lkCUkwEN7sx2rzo3J+3jaZMs2xvUgKsgGtelOxhnFGMPikG8ft2uLTVyoIgc2L0TIYYmzA2g4qR0aT5+/wOeCPdCTmq3StvSDfb/3UbG0jD9W4Hdr2W2p6Us+vp6bpWVydtMOyTsppNxsNHfAXPNGRVpeYgEhyycfysVhFk0BVHlFC975tl0vzSPI3saaDmithJ1OAA+mMsu6BguCvGnfsesBpJQNCBt9+ycGk+g0aEBFmaA+EPYPNcBcnvm82vT98ERi8gB1+f/O2MX1S9DjelNU98s1S6DKLERXdDgk+2Q==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(23010399003)(376014)(1800799024)(6133799003)(10067099003)(18002099003)(3023799007)(56012099006)(261022075727099003)(261026121527099003)(261022105027099003)(261028144727099003)(261026140227099003)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DCHTL7T57ihp0TctpK3IRbfCOW0v0Dh2Ezcn+973+bBFXTuYpfr34caEo/Xt0pBWPJyRTxceRJJW+06GdNJE3uVujwY31p12a8cyViGZpse7AeYVnyckubZOzLv+fCZ43tHlNI0Z3el6T+aHNhlM29c7xWV2Fvt5G3JskDILV05rseDjIBu7y86lSsEsCCCCpmzlGP7NTnDm1cIb2CZ+rEPPNFCnjDPraPIoJBsHRapmC7zMysyg9U3gqxp1Ht24Byt20lmbsST9u5AwirC8XVQ/jn2egUDbK/8rIaDG8kvjnqZ0vzuKvaSHTI6nZD8RvZjlGk7NVbnilVtqqQCrSzHrAhID6sbEFtceWGA2XZjCa7sCKlxcwhhxgPIdXAL1wVIa46QUx8rLdVxdqx2dNIq1XCfK4CdUCRdWTHiYPpeZD7gnatBCaiPMdwMz65Sl
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 12:50:14.8547
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c5bdb58-ece7-4638-6ee8-08df3a722c46
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66C9.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6498
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_045026_404091_A5AED750 
X-CRM114-Status: UNSURE (   9.68  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

The controller nodes use arm,dma-350. The driver changes use standard
integration resources and introduce no CIX-specific register programming.
The companion AUDSS interrupt-path series builds on this one and manages
the AUDSS interrupt gates in the CRU driver.

Changes since v4:
- Allow slave configuration updates while descriptors exist, and take a
  locked configuration snapshot when preparing transfers. (Sashiko.)
- Derive cyclic residue from the hardware link pointer rather than a
  software period count. Retry changed samples and retain cached residue
  when a usable sample is not obtained. (Sashiko.)
- Stop advertising undefined bus widths; validate trigger support and
  transfer widths per channel and report per-channel capabilities.
  (Sashiko.)
- Remove the stopping flag and always poll STOPCMD during synchronization.
  Serialize IRQ status sampling, acknowledgement and descriptor selection
  under the channel lock. (Sashiko.)
- After dmaengine_terminate_async(), the DMAengine API requires clients to
  call dmaengine_synchronize() before issuing new transfers. The start path
  continues to rely on that requirement. (Sashiko.)
- Rebase onto Linux 7.4-rc1 and regenerate DTS context on the clean base.
  Keep patch 1 unchanged and retain Frank's Reviewed-by.

Link: https://lore.kernel.org/r/20261023093017.3248454-1-Jelly.Jia@cixtech.com

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>

Jelly Jia (5):
  dmaengine: arm-dma350: Fix source trigger bit
  dmaengine: arm-dma350: Add slave and cyclic transfer support
  dt-bindings: dma: arm,dma-350: Document optional clocks and resets
  dmaengine: arm-dma350: Support integration clocks and resets
  arm64: dts: cix: Describe the Sky1 FCH DMA-350 integration

 .../devicetree/bindings/dma/arm,dma-350.yaml  |  16 +-
 arch/arm64/boot/dts/cix/sky1.dtsi             |  36 +-
 drivers/dma/arm-dma350.c                      | 821 +++++++++++++++++-
 3 files changed, 828 insertions(+), 45 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.54.0


