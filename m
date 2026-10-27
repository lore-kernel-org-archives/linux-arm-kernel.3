Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D16B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 19:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YD1d2w5w;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.com header.i=@phytec.com header.a=rsa-sha256 header.s=selector1 header.b=goiulHET
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=83yhGSCAnUM4FMQUE05O4wIaIhluxLP/LEePPIzw/08=; b=YD1d2w5w5tfiEjlIlLvvnZf3+m
	XHsuldbXWGkTvswxn7enib/YsFs+BF2M8HCuipi3dY5Yu8f1beP2DKDm+EJLM0mU3q4ktGLVCBODT
	OU/aLh6yZ90IRZShqpdOAQsyTp4bHWgHiLM3IVutw6owu5/lcOAFdvbuasOEOL+X7EcfP8msbC+/r
	OP6Al1I9dXu4AOaz7A7xf2bTLTlVNfzF0Kg+irh55BxJHdf7DorCeWI6IQ7yPJZq9ogwc+K7PjVah
	kyXGrHrI09gDo1MQdUAKqbX/83qTmcBhogCMUETFHCBf1dV4pVjHmWXf0nx8o3U6ntUsO6uj1xMEG
	d+HQ/hvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLn17-00000005fBj-2c7C;
	Tue, 27 Oct 2026 19:39:29 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLn15-00000005fBH-0Hng
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 19:39:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O4jN8mOHlMQ+F+OO/hHi1PtA52pm4RE4Gq+bRj8kciM2kRNeVFmgWuOr+o0/Nuht1pOA+wwJs//nst9bQsLGNmlHm/TPcs02vAtR4WfG4vdy6AIEVsdJ+ltMtgjs+anRPkPusV237YZ2MNzq0++IhdznE3aYdmREbMoYENZNEVDNfhp71s5SaQbOHtmVm2C/qoJnDFg227jw9c6r+fudQpMPJGOp5OL5evfXVtzoWTKe0Nk2MSotE49WnK3WXn0WI3qFgfJz1XrPx5XEtp+5HKymcikXzAWvG0UhAVqdtLgTbh0kHTzgCSGvc8JHItA+yhNAlO0zbdszFOiFfW6qHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83yhGSCAnUM4FMQUE05O4wIaIhluxLP/LEePPIzw/08=;
 b=w7W9bAibz8zHuF6FqF8c9j65CsDEioSmzGcasb3mcZH1NmYh2G/zo5vWP3bQCw+CvSdOXF5nbpMXgPAxXJuVeVcg4YlhHZV/siIbc7924GtAK3EfSh2aR/zrDlZ52ClxPlHktvriWlQnIalo6fHKwPZJMMEcK9A1taZtUdM3WMfzkzBOmCcl3ZDgvnLPZD0sfXo20yvZtmR6QAAEZOCapVHSb7wI9I/Uo/tcR7y5ccoWru6qY4Uu70v20YliVgarYdrxOShQ/hZWoezIiL1dM3+gWXY+8qKh/rmLv2fRb3EUosdVR5ZzGOwGYapOIjlec++jajapw4nVSmgjwd3qsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83yhGSCAnUM4FMQUE05O4wIaIhluxLP/LEePPIzw/08=;
 b=goiulHETCvNU0bDxHbmv2o4ts4W82nOEiT/1jCX11GXVN7XHNaQsJvAPTeaHPkuUgzcfTQJQ2cKL9TwJ2jtPGh/cS/K0HJFKebk/FbABTHiDKCDB6N9fKsktIqpJJb29+ookZK4qvPhmyieRF0vNc1u/LFEjGLwdJfOdZZPK2Ra8i/G13/c5XWyXx5NlDpVABL0H8WczVF4QIwrwFPKuEdYqTIdrUqVU2yUeUs3Hbcxy9HV+UbiTvAJfvODY00KHWIuAlqRBqO4vQeM6sKJ/47ay09jGugvQnf0KHmzCT8AYnuE2al3w7zuoarH6hJaVFeZnSoR8yDlPR9O+8twh7Q==
Received: from AS8P251CA0011.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::31)
 by PAWP195MB2630.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:46e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 19:39:18 +0000
Received: from AM7PEPF00000056.EURPRD83.prod.outlook.com
 (2603:10a6:20b:2f2:cafe::43) by AS8P251CA0011.outlook.office365.com
 (2603:10a6:20b:2f2::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Tue,
 27 Oct 2026 19:39:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 91.26.50.189) smtp.mailfrom=phytec.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.com discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AM7PEPF00000056.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.0 via Frontend Transport; Tue, 27 Oct 2026 19:39:17 +0000
Received: from wl-jma.com (172.25.39.17) by Postix.phytec.de (172.25.0.11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 27 Oct
 2026 20:39:13 +0100
From: John Ma <jma@phytec.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <w.egorov@phytec.de>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>, John Ma
	<jma@phytec.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: ti: Add bindings for PHYTEC AM62Px based hardware
Date: Tue, 27 Oct 2026 12:39:00 -0700
Message-ID: <20261027193901.3538135-1-jma@phytec.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PEPF00000056:EE_|PAWP195MB2630:EE_
X-MS-Office365-Filtering-Correlation-Id: fccbc05d-5df5-4b8d-4c7e-08df3461fd01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|23010399003|7416014|261026121527099003|11063799006|56012099006|261021121427099003|261009223027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: ZeuVh6PN8Xjz18HchdfBBqVb+JrSwdgioSF1wfxjW9oPYnpbThU10wT4Y1voxx+aZJ9gyIY/dl645iRDYiS62V/EMsEH/w2P7o4rfO6n+TGIJVwn8iYBuzc7W7ANuwaquw7e2Lnk+kuDTRnCxE/XGd2MNoKsiPuhXF8kLcPjAaSOnzxGoofo4AAvebPHYq7004HAH7FxGZseoV+ae0V/njGjdb6Da96/iogwpIm1KBXcswSIQwrIZawHKi86rE6rkxfDcZFX11BzqjyoYiY80Oj7a5nT5rUMyzOKzE04844UMzZf05YyE3z2M1f4zQpgJLokCkwRTBZKx7viFRjG7CDvMny5Ab6uDbtudhhp8SZQPt2CRC8LykmFub2OzTfAs8bik5SLJ2kSOAcsLD7TbHYYCku/7CGmurwQOtp9lR7M+HTrhDS/U+xQTSfSvUTjzdOZEGRC+fYcSR1d/bo/jDPruoMv1TUCCAXqH7UMqJkqbH9Nac4V+u4Pt/A0I0ej/aTD7ajdj1isNkq8PgRv6gPjwe6W/Padm24jAG6MhUE6CmpBZtxSDEM6/05vCZjxKsz7K4iUA0Wyl49I9kqDjb4JStsiDo8112DGNJHKjDMX92tcxw6uyVfra3nsC1QiimXX+wZwVLOiGsPixJzY2HPhhNyQciy9YG7a6feYAlg4bmSQAMggSnr6VNaGz0Xf9ajA0su5RaTsdH+KGVBaGg==
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(7416014)(261026121527099003)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: B3aNG6o8qL5QLwWSMgLBGcDGertxlbWNpz33na+bAotDb67Y96uf7E4WA4UKxCazmIPwXfkEBfSzzug1vL2DPtqTA3XATkSxgz343fYYSozCkrqTbiVUmI+niBhUnJy3t+bFkm2JoMAgyYTQ4zTgA1hmrJnuKAqVI4iaDNAdPkRkkik79L4jBM33XhMjn3uCinJYk4TzkbhzC7J+cnSOS7S77bTtQruOH0ugLi3nRuHRz2CNbxfsG4lUDsjUEG/aW+mT8kX1ugrhjWmFc4PNOQObhRyPR6CCc24dYv+UuNg/YvIXnp57sZwmXTFklURwDtNeuD1doPkDBupTMktN24xI99IGv7MYhUWPbrlL6yfpMUGxIP8w0nuQar/JnzdbjlWnHgKtqARfEmlsJLfgk1nKno+8D8UXsGlmk6zcb8HzLKUwj7cN/jghr6gVrF9w
X-OriginatorOrg: phytec.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 19:39:17.0634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fccbc05d-5df5-4b8d-4c7e-08df3461fd01
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AM7PEPF00000056.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP195MB2630
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_123927_219350_163DC605 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add device tree bindings for the AM62Px based phyCORE-AM62Px SoM and
phyBOARD-Lynx.

Signed-off-by: John Ma <jma@phytec.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v4:
  - No change
v3:
  - No change
v2:
  - Add Acked-by tag

 Documentation/devicetree/bindings/arm/ti/k3.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 9a0d62234058..7c1241053ad4 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -50,6 +50,13 @@ properties:
               - ti,am62p5-sk
           - const: ti,am62p5
 
+      - description: K3 AM62P5 SoC PHYTEC phyBOARD-Lynx
+        items:
+          - enum:
+              - phytec,am62p5-phyboard-lynx
+          - const: phytec,am62p-phycore-som
+          - const: ti,am62p5
+
       - description: K3 AM625 SoC PHYTEC phyBOARD-Lyra
         items:
           - const: phytec,am625-phyboard-lyra-rdk
-- 
2.43.0


