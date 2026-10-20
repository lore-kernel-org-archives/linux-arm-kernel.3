Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CA0606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 08:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3gChGWR/;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=PhYK6R8D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P6+BqYqOCbX0gcEFp/cXJ8KXeiFevMuRrQHhNtV6F2M=; b=3gChGWR/aK4nL2vCJKO8ESGP/4
	jaClLepDOF7QRoqtKseU2brPYLazPHMCViYuyQ7m6+s0sRX0L3hKj1WXOhncK+9jFnlWbtdM/gGGT
	XDGFNqayGv8v9+/sdpZcvbpTpa3HrWYQ5c+s248YVwH+8W+6ARWqpbQjfIYb1EP+XsUYyrjtPB/wq
	lRkWahaL1jqUeHjXZe2pEmg0nudJHNqlXgJs7eUQ8YeoZ9g0TjSIkQIm0ep/2Y1RZpuRUdfmkuBor
	QxQe+gYVyjp1xps6dFH2IM+VrnXJchqDsekC9abKm27c3d8In32raV8858hd+fbzoXu8fFHRbrH08
	JeWvyafw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5Fm-00000009Ba4-3zXh;
	Tue, 20 Oct 2026 08:31:27 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5Fc-00000009BVx-3PnP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 08:31:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S1HSeGoXpXMxG5d3uDKzDAMSz9HnonkPDJVQr66ou0L+bTbdRLO1B0FgoRPSpgFDB6wXwgStfusYjwFhTuCmxJo/rU1hqfLrVxDPiP3KeKxBeXZkA5DmU4WEkoK07xnQ01eyh/f5SSZO1U5kh6XEMVKMQsaoNMR141wNTM0fBfRc7NiKm7Jd1KOk8xfIVjl33w2B0YFM4m7d47VoU1oCMlMN+7NbqYviDj0nkCqxX/VV0FJ9vR6LE8nWId7EHoi2c1GdNgSP+YA2DRyMi6CpjpQxRIqu9TojTABiBI1u4etUKJAmLE7ugzz/DILeKG3qBoptMbNiPbGaJ+YqDlY7ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6+BqYqOCbX0gcEFp/cXJ8KXeiFevMuRrQHhNtV6F2M=;
 b=cENVd8VhjcKSA6TXfqiT9fGS1hS2OIevK1V0vU/Ag/e1EtnAv8kLN52rUGqtJsz2LZbUNsGZFhRp/hsD593RVlGTYV2fjtbYgiX9l/pH15f6nvouMf/fP/SVHo8GjYuQwaFES3nDUkI5nx+X6+aEHg/uJCVHhdXbcKlqc1X+IwCrPJ3YdM8cDR18zzCVI/JY6LdEbMjpQYvssslh52mf0ERMUTRWFK9v+I62/jVPD6mQTRykbS08Kmp334ykxtIYCY1jvVV0yE5+XCfG8eoSI5wGhbiUQFC9+x1WrEB3u0Zej/1T12xsfcJ4PO+A3ii4F6lu1tQJg3+UFt+vVZYb9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6+BqYqOCbX0gcEFp/cXJ8KXeiFevMuRrQHhNtV6F2M=;
 b=PhYK6R8DzTlvTq0ZGLOeNLW/YqT//CuNenbKUcTiI9lo4Wb/eCiyAWMIjQYUa7ntO2ggMT34AbeG4ahKjvA6agpapJ6Kbdfril8vajlcajxzHaF94RJmiVhjUtLCY0BJ+qVTt8JMDJT0rwsJcrfbQ1wGzSXaiA6STBN82FEdWkTWx+0DoSJ7qS6wDfoi+zVAKJA6I4OIba0pVz3sPkTjQMja0LgGUrO026mRF++nX2gGD+LxYgPuejlOUPlbPJQCUwhAbLy9ZukDCw/5gNireq2eAIbcPFvubwH771fD5J+RVjmZl+YpUE0xhb6KXV9UdTmxjol/C9etBcVh+Nd/Zg==
Received: from DU2PR04CA0218.eurprd04.prod.outlook.com (2603:10a6:10:2b1::13)
 by GV2PR10MB7077.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:de::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 08:31:12 +0000
Received: from DB3PEPF0000885C.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::76) by DU2PR04CA0218.outlook.office365.com
 (2603:10a6:10:2b1::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 08:31:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB3PEPF0000885C.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 20 Oct 2026 08:31:12 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 20 Oct
 2026 10:31:40 +0200
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 20 Oct
 2026 10:31:09 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Tue, 20 Oct 2026 10:31:08 +0200
Subject: [PATCH 2/3] dt-bindings: clock: stm32mp13: add SPI1 to SPI5 bus
 clocks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261020-ups_mp13_clk_spi-v1-2-6c00730945c7@foss.st.com>
References: <20261020-ups_mp13_clk_spi-v1-0-6c00730945c7@foss.st.com>
In-Reply-To: <20261020-ups_mp13_clk_spi-v1-0-6c00730945c7@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Gabriel Fernandez
	<gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792485067; l=1189;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=RjrmLOO0WrQsz3sKOiZSFp6rYMrOEFswgc18kAyU4Uo=;
 b=ziunOQ2jpJ5jXs506mvZWX3KOljZSVCv3lAUEG9sEU46J567P45x5Vf6zwLRnVniJ/csYNr//
 4LRW59oJVlqBVSQp6Lk+AZNvEmcWqMUfI6xAZ3JQ/56z459ZOjt2em/
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885C:EE_|GV2PR10MB7077:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cf349ed-8abf-49d3-6b47-08df2e847fa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|7416014|1800799024|376014|23010399003|261009223027099003|10067099003|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: PE2XfGP0lNMBQ3haqncZuMo6NOz9HpyFje1Uuw/3320fcVZ8aQhJOzX3Lp7xesDtyy1UmrG8gtA1ihD15CYCPXHohgOBTlM0ofVDcoG29uV0qU9M4QWvDyYNSluGUG0oKZBOKWt7nClRN0FTAHlP+wmG4MQcyqHj8xcMSB+4z0+61ynLQCKmUzBVuAOcGZcPNjeM6DFuv6tF5M2hShgJoDEQDF4x2/KnNYsddhZV7qlrzlAkZz33K3fxuzfp4bYQlKoWQNV0Fqw/K3k9sF8s2l3QEpMdFt1HIQrU8HEiREtreca7hamNhwRULeX9qkjoF/VQJ78ENgA5zYjprGpwXCO7m7iRu2zflrlotixvLfgSO7vAmR2VMBCg215jaRK0wRJom6JSiqmQt3m4IPDe1k0YRynmpMecWpj9A1BoX9nNa9z4KHXvmMwGABiCW8fi6a+zpRXhnmkLAi4K2fA8158s7qUoVr7TBNHruGzVnZjzSmGFVEW0ewO2UGNcIMuFnq3cDGT3uHiRh2XKZj6jNR8+G4x+3763Vs7of8IR2ci5noADTJvY9SC4TclaymFwFi1EGjWwEUliATy8LA0BCRmFOnSwGVGZvekf/LNsUEC8P0o6xbzjcVCfqg5mI0j3YGisr0xd1JrhFIJ5RjUIPHB5b5rTi7o/wKZN4V2evUP606DpzVXdvsGvhG3gHUDSrLl9R/sdu/wWfhmQCJW9Ew==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(1800799024)(376014)(23010399003)(261009223027099003)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: GiptTw2KNeicAP6N0eISkjSVkquJXcvqobTK5S+7Gjo/7mgsCILbjBzseIvF0awCywYrHhDm/bsDm1f1ETdhykzrPbs+9gFXzIS7c6zb6RjWBNRw9vBwivP6iyQJH9qyDtSjUCu1iDUd1VMI9OmxfiL8RaNoHK6oBQAom/8BTfmfu2x5fTIq+JaAbDS30coRXBRFTxKnxWj77n6HeAwPnBp1VUdUtQGPz0hifAUy9kiWvmuDfqa14hHAHO/q9oTWbKmc5iGOA3jnv0ytbu3FUvxCOhJuNmCaBaUDcRTHzppwRpgV9La5qUqRB9YfmFYGf1QGzrO5a7Zfb+T3HIOHvHj6J6vlgYq2UNY7T6aNtHwIyDxETju5747GkMmdpNaosQXPFFgthCf5XyZYTduUnGjhms6t7A6DkbDXyv/2PJTi1Xm0q/pXOuUPbhhoSNno
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 08:31:12.0814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf349ed-8abf-49d3-6b47-08df2e847fa5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB7077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_013116_883264_D1121C36 
X-CRM114-Status: GOOD (  10.44  )
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

The STM32MP13 RCC binding only provides the kernel clocks of the SPI
and I2S instances (SPIx_K). Their bus interface clocks are missing,
whereas the I2S binding requires one as its "pclk" clock.

Add the IDs of the SPI1 to SPI5 bus clocks, as already done for the
SPI instances of the STM32MP15.

Drop STM32MP1_LAST_CLK: it is not part of the binding ABI, it would have
to change each time an ID is added, and the driver no longer uses it as
it defines the number of clocks by itself.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 include/dt-bindings/clock/stm32mp13-clks.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/stm32mp13-clks.h b/include/dt-bindings/clock/stm32mp13-clks.h
index 0bd7b54c65ff..750a46ddad9e 100644
--- a/include/dt-bindings/clock/stm32mp13-clks.h
+++ b/include/dt-bindings/clock/stm32mp13-clks.h
@@ -193,7 +193,11 @@
 #define SAI1		160
 #define SAI2		161
 
-#define STM32MP1_LAST_CLK 162
+#define SPI1		162
+#define SPI2		163
+#define SPI3		164
+#define SPI4		165
+#define SPI5		166
 
 /* SCMI clock identifiers */
 #define CK_SCMI_HSE		0

-- 
2.43.0


