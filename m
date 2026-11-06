Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8F8606A335
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 01:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MWjzz7S5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VZrSVwYpZW/2P1ljs/nVCcJV57bpcGcXU/xs6looOUw=; b=MWjzz7S5rXoPDEtsDM3bQz/CNZ
	/Y5VdUVz3RQ/tUEhmcPN1U715M0YrNsd+Ko0s02akEyWivAz2kLN6iAuutqonAbSOuEkqovoRTgQ4
	IcyjbFF7UWvO+1Cld9OW/+O1BII177e34z5DyDBKk/t043ffegIxnjPsJcTUIPh8j+FH66NhGaEbg
	UlgDvMPPvcd9oUxKwoSgJwSUe/YRlQLePqql7kOxioI3A3zFp6NR4rl81HXPbpidSP/+R0cBBsMPY
	JWFGidGc0aIdmlrTjESUzDWjcj1cWrMbQRv0Au/Q00JkSV1MMjXuuMuXMdpvLg/icDA9lLAZra/el
	aoDMOSig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP8rj-0000000AzSQ-3TfS;
	Fri, 06 Nov 2026 01:35:39 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP8rd-0000000AzM8-0RZJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 01:35:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nol5SZsGtG6tNnq7ayOo0xYQN2gM7AmjuRLCLplw2zBl//Y9A1dn/Ih7axseEEZbNSl9IbXJOFMDfqiDaAbmca6l2r105fut0I+wp2aXOd9SEgv4whBDHKLzzQ2mZzfK0TT8H2+gGA3BHs1TvdiA+OzEpUN2/K42/7gPhHO/jm7NmMnaGQL+jnSaHJ1o42Fi7DkKhgzVU7sDLW5MwBYREYJdA4J+2ixsotHYWQ2xd8VopovsDgYh/amcQHVL4riGJO3cN2wHBdshXufd4Jp5qGflnsLOTjyO/zcu7OcIs9Ia/Zwi7iYA5CHDyn+zBpr7qUl9bk9SOdrnPDgrxuBIOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZrSVwYpZW/2P1ljs/nVCcJV57bpcGcXU/xs6looOUw=;
 b=ZzDTFveXWnAKDxJbAQNoILIeDc5oigafLd9/A3eAE0gtmRInStbQXA0Y+MjcXEiAaUxOgTkDmcVhNHJNcBuNhowLFjc5GgInkVv6cTVamZeNeW8WRMs5VGMp0JnZqxL+vjTTOwDzMMyHG3T0Fmx9yEoULGVUMrTRKVPRYjUXKi2xx2Leg4ir9vePDhc0eEkfJEKPEmwnAOMFnl4rcnG/9zkSu7m2e8Mfd/my6kYhkk1wvjlhohpHGbzOgkcltkfIzVBN/ObttYTTXrJmEvSrjyBhBTGQa5jCwRfn9T2C/1hUtmBsrpt5QGEedvWuMalECochYxybGUqjVH+e5dylLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SE2P216CA0018.KORP216.PROD.OUTLOOK.COM (2603:1096:101:114::17)
 by SEYPR06MB8310.apcprd06.prod.outlook.com (2603:1096:101:300::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 6 Nov 2026
 01:35:23 +0000
Received: from TY2PEPF0000AB8A.apcprd03.prod.outlook.com
 (2603:1096:101:114:cafe::ad) by SE2P216CA0018.outlook.office365.com
 (2603:1096:101:114::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 01:35:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB8A.mail.protection.outlook.com (10.167.253.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 01:35:23 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 00EDF40920E2;
	Fri,  6 Nov 2026 09:35:21 +0800 (CST)
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
Subject: [PATCH v3 3/5] dt-bindings: dma: arm,dma-350: Document dma-channel-mask
Date: Fri,  6 Nov 2026 09:35:18 +0800
Message-ID: <20261106013520.1134450-4-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106013520.1134450-1-Jelly.Jia@cixtech.com>
References: <20261106013520.1134450-1-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB8A:EE_|SEYPR06MB8310:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 18f52f39-2158-4fff-21c1-08df3ba63a05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|1800799024|376014|7416014|82310400026|22082099003|18002099003|261021121427099003|56012099006|261009223027099003|261026121527099003|261102123227099003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: 2vlVutNsH26waOnuTQZHlXT9qkBe9jumlMCG65RiYvnZLjZ4kI89f7i/KTQPumZW0RSdNd2UvpMJ98ZByvSnTD4on5dTNFIKmeCfxBNOOVkxEFopo9r1yVPYhKwi0fuHeT9fwjvnwx7ADeSE+TG3mm1eTdeHE7E2XcZP76G0+kKd020UCNV8bixl/58m/Sa6DVZ6k98au7DfkEoZlIThzrha2EMDRKwO7fbxxGPMLT91z9NpfLvU+8lFoEKea8An3W70n9Ufvwr68V1EMysf6Y63cyq/c67CJpeJld+pGmMdRSIAhoITkFAev1izeOyNZhKH/gw/qpoWPydPmey9wLGXJ91c/pBhuF2fRDQDt+zgx842zuN4ktoJ1tK+FPLtMgW7Loes0kVWfm4wguAe5hl5Fh206/ns1WbKQ3an2DRRWu6j+KN++gYPKDULQqsO2TeDj5UAowOmhA+xeC4CUE8YhPRIhVq6CfTgSgCi7Ue5ztmoHBXhCfnGBTHc5vrl9EiBs4NCGWnQUZCvPr41trLE0rMVDZwkVkxlMCOKLxDfi0+ClXgex76H+QujFAksKqUBeA/6+r/OJ7A/7HkZIwC7e+HFcDLkrIjTvVbKZecQU6S/YCfceB7ssrZ1SrtLys3srumaPev0vP/g9aAwuneohH6yONV/++pYoUfvOw4RsvmHGZFopAM/UzGiA0d5ZUjiFZxFnpSzMGCsB9NZAQ==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(376014)(7416014)(82310400026)(22082099003)(18002099003)(261021121427099003)(56012099006)(261009223027099003)(261026121527099003)(261102123227099003)(10067099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: e3789ZEazmHv+6ai3ItfJS5pxRc8p0R2UZvaKlD607QFCLaFCf87bXmgPk5ppw169GXR305nEi1yZlQtthPdBtEY2Ad8YemLryWOWq17JJX8Ka6Rx9JMaO0KIn7oUjWZp6ahNnjSHKa7za24luaadCldwwisK/9bGlQtVpBA76SP+YoB7ZCVlznsZLlV0qyFLUP6y1ye5OdTweRY2OYuckFRIL1Ym8cXnGW15uS5Hx1LQtLPCYNAnI+pbMH+hYgToyip3f9jBMLPfj82LYD05FK7eSWfYC/LOdpsGOCeSiwivzcDXPq4JI08oClTOtxrImUmdOq4E5ViwrxJK/gGb1ykx+I7rbaO0GMhy0zuRu16+WT6r3udUjBI6fz189T2mcz6SWkcbhr7i0wv85jWOsUugPRwuFROmQNGfpw2UkONSIfc83rQyRZTrYfgDdG+
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 01:35:23.1695
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18f52f39-2158-4fff-21c1-08df3ba63a05
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB8A.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB8310
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_173533_607544_82784B08 
X-CRM114-Status: UNSURE (   7.59  )
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
index eab3b31aeba7..59f3b59b47f5 100644
--- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
+++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
@@ -47,6 +47,9 @@ properties:
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


