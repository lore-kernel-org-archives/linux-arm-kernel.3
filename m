Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEE56082BD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dQqUDIg0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yDZPcnE1uFPGSiI0MS8aKMlU2GHR0GHCdoJTfCo3Xdg=; b=dQqUDIg0ZdTu4ekm++mhHckJu7
	H9IJ3JaUOZwV+3GUd7dTJLRvkQwqDNVGgMBaFFzqOF8YLZXNzuecMjtZ6S6QvXng9ogvCMnw/jFfh
	ogiRVufsdLIABrCucnly/Uj+jOPFYEjL+s7HamDc7n1LNYOefqI2kVs2SpuHGpMMvy8oBM4IkOvDs
	mXTuFLm4rEVqOGKSkZnK0VQwxYp+k0kxmPLZ8C0W3xsBDnCjyv20nEdCHJLUdYBDCHQqZWXOQ5KVt
	i0WvvcTlTmBWfo0krsfbCKVWu726y/4rnMV+9dofp2mbAGTrep8RvuLPMReRcXlPBvhRaF5jEOZqz
	2QGojOqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaRo-00000005NrD-3USJ;
	Wed, 04 Nov 2026 12:50:36 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaRh-00000005Nig-04hm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 12:50:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xgn12F3J9jNMrtTqITPxFo1mrHXRFJWDan+PcWCpvdHYyGpt0FMpZYyhwjg3720JSLHosMD7BiD35YtwjCsMvDRODVS5M9IHt9hp+EYDoR7Yeif+zSB6cLNyEnLY+9woWu3On6F6Ht1ONbCv9snGVOZ30bQdnl9yfwd3lpIPE+8QZqR/VhW+MHR7/3N2bgYH7Xk05ezorndEvtqBd9POCgGIY6AGhD32EH3DQ40lDPtRKxuJA+lcZdh7ax+qrhUGt9WBuZibsv56F09hSf+OX9ZXcM35eNZwezk8kpx4tqI1F9+2vgmzpgzhybAyuBS+yyNZj+7B32tj5AYSBA8Ehw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yDZPcnE1uFPGSiI0MS8aKMlU2GHR0GHCdoJTfCo3Xdg=;
 b=kr4eJGH2iZtdFE2HxhnXb+E0r3jv/Y0sKXKu6mGaWc7dPrQIRKZcNrUX/ryy6cLL/J7Lw++7mpNluYGPLE+IXqEeWt6FhQYBqyN1WSR9CimRoQEeW0KtQcldOaiN4Dd7/gyDbwHXxiLZQl7Qj+S9dHZAj7BvDlWAYUZsms2WoGKycvd2hcWQQSI+kAdf5Y/l3atfUeUODvBpPaT3Lxhjo/3m/vTiQLCBTLKIa3oacDPOtK/LVeTg9xxRvoh80TZhZY/darV8SZe0d58LUBjHuAZ81Zp3MFWgNfV4RyD7oy8oHveGtHmcSb0m58mJc6TO/vvVIp/rD0j8JOdmKsFoog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0046.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::18) by SEZPR06MB6551.apcprd06.prod.outlook.com
 (2603:1096:101:187::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 12:50:23 +0000
Received: from SG1PEPF000082E2.apcprd02.prod.outlook.com
 (2603:1096:4:193:cafe::f) by SI2PR01CA0046.outlook.office365.com
 (2603:1096:4:193::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Wed, 4
 Nov 2026 12:50:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E2.mail.protection.outlook.com (10.167.240.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 12:50:22 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 574F140920F9;
	Wed,  4 Nov 2026 20:44:39 +0800 (CST)
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
	joakim.zhang@cixtech.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 3/5] dt-bindings: dma: arm,dma-350: Document dma-channel-mask
Date: Wed,  4 Nov 2026 20:44:35 +0800
Message-ID: <20261104124437.296753-4-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104124437.296753-1-Jelly.Jia@cixtech.com>
References: <20261104124437.296753-1-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E2:EE_|SEZPR06MB6551:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1acc1b6d-6825-4287-ee5d-08df3a7230a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|7416014|82310400026|1800799024|376014|261021121427099003|261009223027099003|261026121527099003|18002099003|22082099003|261102123227099003|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: SMX9AAg5w0R6PUmCeND/FGWLycm0wjDzmAlvT3+/foUnmdFwuC5KZQDF6zZpdj1Wdlb2gmMxeAjAECgBdhwwEQQbw6/BcIfs2PiVe4vncdCxFK7/9YyiXLQS/Q2EUooR+c5vsjYsSU0jMVLzS8muWbwBvjwjI+BWZOaW8O3bphiIPi2gw2TQTFugXloX+oCFr5Rz10+NzOQuUepdr+vRAG+HdD6r79meZGMHP1vH1/llcCZ/vrkbkCyhPP6k4oimMiEHjAJvG2V2MIFt9oebOcn6XkoZE8AB0QRJyICOhc1KdrMpnBoaBywZZ8cWVIEtxOBqw/1uFC5mPG1vh6Eg4G88Bo/50wdgfXatpO0TbUJ+8etBQxXh4g4YkaeiY5apAvmeJfoCBRCVQ4iPn3Im72YURVk2c1X0bKirZ8echJT+BcIXbMfd5MTDDOsVIdl/ug4mJQLQVz+jtjm6RCnlhpTvCbpshTsITvl3zpsCJLD1jDQMV2MfprXwCuSx99WvX3o8dIZRXdVU4PJZ7ji4ib/dPFSOlF1a/N/OHfZxGBvgBaPXD7yUfoXfF9DE6MyxFTLRBjziJHDxTTiTB4ig0Qzz704PwZni2lJePq+dFvH3FZTpeh0/6qbo4sNK/mceyBVLsJS460bzNDViD9qzwk6Tf0Mo5C22RWwNOST1ymOCVP8fNKz6uEchrG1aC5THrOtubAd44FUhdjF6TGmVgQ==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(82310400026)(1800799024)(376014)(261021121427099003)(261009223027099003)(261026121527099003)(18002099003)(22082099003)(261102123227099003)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: kwoGkAftb+tBTlsg+aM0p59u4QNwNL9fU7IFULVuWgLLjjCySf5QKLWf51OU98F7fjOncDQfeuOHFS93U0u1pYXLfR4ZuBjqlOew6CSj8JA1+Yj16y7BwOwO1kZ+KXgwvG+StaBosoWagYRSB0HuF7XNg2y6SlNWc3etesyrTOM+LgwJmhcDYxRYdLnuvVkwDOCudM/9pdgTxqbHq+3tJHNZTpajVMsKmxZhNY1LIj7riN8tlmxy6fEe+th2ukTdqX2WycNmMFu2Y9ntKEHmZ9HsAQOSK9WDizde8k6cihNZwpLxSwBl9sG0qyiIyWWzYPTc3ZaoEyM9rF0PobntkeD3XCQ9SZEdSsew6WdGNg4On2E+57A3Clq8tXt+vK4JSdw/guq4aQoHymu0cK+BPJePHx8Yvc6x6azypcrK3lDh06HSzBBfQhKC2gqpNv+i
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 12:50:22.1725
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1acc1b6d-6825-4287-ee5d-08df3a7230a2
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E2.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6551
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_045029_098296_1513A15E 
X-CRM114-Status: UNSURE (   9.09  )
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

Some DMA-350 integrations reserve channels for firmware or another
processor. Allow the standard dma-channel-mask property so firmware can
describe which channels Linux may use.

DMA-350 implements at most eight channels, so one 32-bit cell is enough;
limit the property to a single cell.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 Documentation/devicetree/bindings/dma/arm,dma-350.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
index 43279878207c..98e7bb651210 100644
--- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
+++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
@@ -43,6 +43,9 @@ properties:
     description:
       Optional reset line, where the integration exposes one.
 
+  dma-channel-mask:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.54.0


