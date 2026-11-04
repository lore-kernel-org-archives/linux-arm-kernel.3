Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536E1606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q9s0zcE+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=k8vcglFdNRJ+Ul+n5cwH3SgLZqsIg3iHMh0FJsU5jOg=; b=Q9s0zcE+Bl4+4RCXDPbjz/6T8m
	Q3bB07AFQBM7lI5HvA0Sh+++LfpgO+mdm2QQFXABntE1Nwf/TESlfGbco4ar8lCwAVJRLKwVcJ3+g
	qWdpoWgjlx6HAVtYBqBhQUnZsGh4eqvHZtzqdJBpHEhu15Jzl/r7jfEDkhuifKsIMo4837S47AJmn
	Cy9HO3rfUGuFmor/pUbopVi/+lfnH3tComwybQTvh/b5B+Td++fllLMZyWxi/yocSiDa0wJDstCE8
	9pQwY0QBjJERtQ0Yu2ExlSTqmmSkEfczsiVA4sM0iO4P6zaHBGkyfFuh2hLmn5xk56zbG0JZ8m4Nj
	c9VjMsuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaRo-00000005NqE-1m82;
	Wed, 04 Nov 2026 12:50:36 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaRg-00000005Nhs-2RvC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 12:50:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iv6T842IxCo2fFYIdnrNvsS2rouUZwyTbqk+/Ue/HBn8E0iAUAyKwxqJUqAmCcxoz9nHH5Dg6gogSnht8icCF4BmnB/vvT010Doxr74RtgAm2bV594XS0/JuL/z0xV9lwdhBUrR62t7yIvVuF0GhFSCZm5jzY1Dl+1KwHvql/YIZDjTutrqzrM78aIT4FU0XaJgsfpZn11rmAf4VgQEsRzutriBdGj8oOHbxiJsE2s3azZj4mBZU3yXeJ66M+mRC2xvn+ZsGa+2/0zGKN5qco1cW/05jS0xkqWU6zb2YX2dUMOH+F7amA+lwc+hmF63DFjgekj+6pNFMuqpkLSd6aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8vcglFdNRJ+Ul+n5cwH3SgLZqsIg3iHMh0FJsU5jOg=;
 b=WE4WPLUo7DeQF4fvHr4q/ilDIYCGULS0IMp97UWMBcb1VJm75vtkOG/aqifhP5oGHLOSd18mZTwxlysloTLWOeA05yAYnL2iysGv0fZwNgv3P0NwODhegGDwU7hcUL+WS4ODSVr613ilIX3e7i3rOF8LfNDgYabPextktpEgvBa8AaHBBpRUk8dPPynmP2gi8oCFRS74Xs11kxZKLaKxhxCV/bxvG+mrSnNR6zeq98y6ELxK5Ds+pqEu2zfplaWy1mIU+tVlCregPKQzMvJexOU88MZ4819vIDJdNsnX566dV2w62dt2Yq6hUFn5C0ljYL9CVScq6wpon7/W/kaBnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0020.apcprd02.prod.outlook.com (2603:1096:4:195::7) by
 TY2PPFB683BA8FF.apcprd06.prod.outlook.com (2603:1096:408::7a3) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.8; Wed, 4 Nov 2026 12:50:20 +0000
Received: from SG2PEPF000B66CC.apcprd03.prod.outlook.com
 (2603:1096:4:195:cafe::44) by SI2PR02CA0020.outlook.office365.com
 (2603:1096:4:195::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Wed, 4
 Nov 2026 12:50:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CC.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 12:50:19 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 1FF0840920E2;
	Wed,  4 Nov 2026 20:44:38 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com
Cc: devicetree@vger.kernel.org,
	Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com,
	linux-clk@vger.kernel.org,
	joakim.zhang@cixtech.com
Subject: [PATCH v2 0/5] soc: cix: Add the Sky1 AUDSS DMA-350 interrupt path
Date: Wed,  4 Nov 2026 20:44:32 +0800
Message-ID: <20261104124437.296753-1-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CC:EE_|TY2PPFB683BA8FF:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ecd55323-0c76-43ca-7c81-08df3a722f05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|7416014|376014|6133799003|10067099003|18002099003|3023799007|261102123227099003|56012099006|5023799004|261022075727099003|261028144727099003|261021121427099003|261026121527099003|261022105027099003|261021123027099003|261026140227099003|261009223027099003|260925021911599003|260925021311599003|260925022911599003;
X-Microsoft-Antispam-Message-Info: 7hU2y65PnE9YKwDKk+ptwUX2GE5IO1Hr4vtjQ9EPE9Qqpj0IUTBOoPPQpgkIrUVbVESze6fUc2Kok44tGof+c/F2u5lTJLnuMuuImEJwcY7R/4zTmUSXSF+0mKj5C7Sk1MPq8mkQ5Z/YhVMN9kr3AtNOg2z2L0r7z6hTw7YbEoq0mKQx7V9N4uHaKfmCKDPDH7LwQyl4gPcSza0wmzVHXRNurjCpk/FayEijnxiBcpLRXrQPSwcdEaHPHGU9SMnQZCgmUKa1BLVpJJv9BS7NWfyb2pJFQ23u2yFbuyRiwXGEFfbEUL//VTmUSKurXfH6kEziJzwY5ubGtzida8OZCNBpXtdd7doT3gEJ1dOlOfRu58BG2p2yGRNcBB3VPViAO8NFY5sFnmkxMh/BmTma69swUe+Lns8MVSd7FdkOhvnsyuU9CgHxlZx3JZL8eBUn67RBeidrhpKnyQETtQr1EdhzJ98LhxQ1IYZSeeINol30SaBIsn/PY3kH18e9eXFz+7FFUHPtyXagRtWXAeDVTvFj3fN3+72HhKpYI6nfbYPdVvGz6Y1/5MSrapEut7q4fzxP3GzaKkdLOfLNOkPep22OS5E0Ix/hC//vL1NrYgzfyr6gmBUC3lI2W+QZaRo2hypKWVWFtn7egho0JU7meWwRBbrpQG2vQP5d5e4yMSo9Qj2D27Z6mdS4hEGzTTgr5U76wbeTiblZ3xxt/wgXBA==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(7416014)(376014)(6133799003)(10067099003)(18002099003)(3023799007)(261102123227099003)(56012099006)(5023799004)(261022075727099003)(261028144727099003)(261021121427099003)(261026121527099003)(261022105027099003)(261021123027099003)(261026140227099003)(261009223027099003)(260925021911599003)(260925021311599003)(260925022911599003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wmUI32+fX16G3RZDCpjO6Yk+VHWmX9mXiUpiMjACU2ISEVDxNBxGDyQZd9I2elLQmNwHNnJ19SO4b+UnXPmSMRsgetS/9HSMqmawLgRb8wkXa//7q+o3AJqq+tmJ7y56gBZvVZEX9CF5AYFinmbWIWxbHFrZ1hy/0XiS7jnQPGoFx+SFMVUIQZPhQrGRjSqbP96pvokCj/t9WuZXGCXdVBez6YiKUsGANmRNuikEvbq4yJbzoq1QKmxs7PqYnQmsE5rHXQKf2Vlp8GbVHd8ocojH0tTGKmPJnE9aFhst0kQXeDX0DzpS0SI9Xck+L2eW4GSAg3F/xdfZBeVxKLtXAAraTUz9JI2t4bZ/RkTSQ/z8/58/AOvp+2KV/3oBhTfJR2B8O4V912UtdyU2ncfldwbtx7oKiKyP13If83WYKYdyDcKlZPfujVUV3pAWhcRa
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 12:50:19.7750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecd55323-0c76-43ca-7c81-08df3a722f05
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CC.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPFB683BA8FF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_045028_623870_0990FD17 
X-CRM114-Status: GOOD (  12.77  )
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

This series adds the CIX Sky1 AUDSS DMA-350 and its interrupt path through
the audio subsystem CRU. The DMA, CRU and DT changes are posted together
because the controller depends on the CRU interrupt gates, while
dma-channel-mask describes which channels Linux may use. Keeping them
together allows the complete interrupt path to be reviewed. If separate
submissions are preferred, they can be split in the next revision. No
audio client drivers are added here.

It depends on the companion v5 series, "dmaengine: arm-dma350: Add slave
support and Sky1 integration", for slave/cyclic transfers and optional
clock and reset support. Apply that series first.

The CRU gates the AP interrupt path for each of the eight DMA channels
and combines enabled inputs onto GIC SPI 230. Channels may be reserved
for firmware or the DSP; dma-channel-mask limits those available to Linux.
The AP gate bits control interrupt delivery, not channel ownership, and
this series does not implement runtime AP/DSP ownership transfer.

Conor suggested interrupt-map when the routing was described as being
configured by firmware. This series instead manages each AP gate via
irq_mask and irq_unmask. A static interrupt-map alone would translate
child specifiers to the shared GIC SPI but would not provide that gate
control. Model the CRU as an irqchip so the register owner manages the
gates, without CRU register accesses in the DMA driver. Feedback on this
choice of irqchip rather than a static interrupt-map is welcome.

The gate register exposes no per-channel pending status. The chained
handler polls every enabled child, and each DMA channel handler checks
its own status. The children use level flow handling with IRQ_IS_POLLED
so disabled and oneshot-threaded interrupts remain masked, while inactive
channels returning IRQ_NONE do not accumulate spurious-IRQ counts.

The AUDSS DT describes a 1 MiB peripheral window and a 512 MiB DRAM window
with dma-ranges. The prerequisite series allocates linked commands from
a coherent DMA pool, so successfully allocated commands are reachable
through the controller's DMA address windows.

Changes since v1:
- Drop the unrelated GIC node from the binding example. (Krzysztof.)
- Retain Krzysztof's Reviewed-by for the dma-channel-mask binding. DMA-350
  supports one to eight channels, so the single-cell mask is retained.
  (Frank's array-handling question.)
- Use raw regmap locking, explicit irq_disable and level flow handling
  with polled children, including the oneshot-threaded case. (Sashiko.)
- Dispose of child IRQ mappings before removing the domain and select
  IRQ_DOMAIN for COMPILE_TEST configurations. (Sashiko.)
- Associate the domain with the PM device, protect teardown register
  accesses, quiesce the parent IRQ before runtime suspend and use noirq
  system sleep callbacks. Save and restore software reset state as part
  of the CRU context. (Sashiko.)
- Rebase onto Linux 7.4-rc1 and use irq_domain_create_linear().

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>

Jelly Jia (5):
  dt-bindings: soc: cix: Describe the Sky1 AUDSS DMA IRQ controller
  clk: cix: Handle Sky1 AUDSS DMA interrupt gates as an irqchip
  dt-bindings: dma: arm,dma-350: Document dma-channel-mask
  dmaengine: arm-dma350: Honour dma-channel-mask
  arm64: dts: cix: Add the Sky1 AUDSS DMA-350 integration

 .../devicetree/bindings/dma/arm,dma-350.yaml  |   3 +
 .../bindings/soc/cix/cix,sky1-audss-cru.yaml  |  37 +++-
 arch/arm64/boot/dts/cix/sky1.dtsi             |  26 ++-
 drivers/clk/cix/Kconfig                       |   1 +
 drivers/clk/cix/clk-sky1-audss.c              | 181 +++++++++++++++++-
 drivers/dma/arm-dma350.c                      |  20 +-
 6 files changed, 261 insertions(+), 7 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
prerequisite-patch-id: aad1bc3c30a4825048143a3e0395e696201548e9
prerequisite-patch-id: d7f5243feddb5f16231302bd4c948d359ca92ac1
prerequisite-patch-id: ddc9ee115f12a7d2ee7ceff7e0485e7166581756
prerequisite-patch-id: 3d5fb2f7a5b2da42cb013d1c2e0a6e5eac5ffd6a
prerequisite-patch-id: 0e54074dcfd104480233bb076d2424e6ba1bd25e
-- 
2.54.0


