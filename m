Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B6E606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 16:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VIfeBd46;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=WxYOdnhP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=K3qvdZEbe9enl6/OgzNx29PXWLOaXXolNcKLq1YCZJc=; b=VIfeBd46uKJ7tw
	/Ae4pPzjPb5jFgE21FvmMS/b2VAdJCxb+yWVTMRoJD4ihwXcKdS3DGcmUhb5CyiyWeOu9d77LioEl
	rr8gryGMbqU+C+7ndjgLHVms+h21Vjwdk4Yc7oury5J6LFxLlWUueVhxVFWTsJg0/Glxr9bYUOcc9
	wF9Rovm7RkxuBrw6QRyjMxph4Q8q1lFv0xA0sYuE2bflLFa+TctahAUEv5tOVKBIplWRCEpYJzBzP
	Bk5KoYxEE7MSxoACNZPYNJ4M1tGFSTiTM0zuEpRi/wRiEthQ7gVHqtLwzZJy5nxOJO1cVY1drHPT5
	EiLiPnXfIQTYefNW1rOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKIMi-0000000GfrJ-2hkj;
	Fri, 23 Oct 2026 16:43:36 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKIMg-0000000Gfpw-0HS6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 16:43:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nCHnk/oBUT2OEadlswIUeh9CeVk1ADRuk8650KTrPcdNgWHPkicEjOLxDniL7ypJFVKRTS8EsvdkrmWhGLDXjgntTdjVDWMhQ/6qyBo8gCham7kxtJyzJGGv3bPhFbyD4/W0uQyWEQvy1dCThMwaBIBN/q8l4gSI7v62Ps8+83KPAmQ2C2zPM3krBovsl1Y0/1y1SEEn7+/QreTf5lVVq23Dll+ttvsGyfBut1pOCtM3442In+YxH6xjBBOtAk68uK5D4hgYqbMJNRSFeZ7R4Z/mntZbpTSc54cSMJ+3oxClPAo7/Ji9u0mtegDpjsW8wwNYYvIaILBYu8TcB8B7Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3qvdZEbe9enl6/OgzNx29PXWLOaXXolNcKLq1YCZJc=;
 b=UOM7NUHTItOfUBPmoK8eeG9lpDMZEdTeblbYVBNvBoD+oUss6kI0iAW1kov9KOX7+CJF2ZAEgLwegG+IJRF6Qe0QqLBbCmsvYyMgPkkzuAROCdG5fUHJZJfQcATJq8ywdUYHa81OLP93YnhC4MOAE9xOv/k6g2FFwfv6iUH97OMvavqj1Vq2eFqOi+Vs4m+1+0eCu227cBWrxPPHLykRfZbuyoGlG+jlAGdMup7TfzsFeYDPuqk/ieDIbIy103Q42/S/wBklUbwR6OrrGsesDwX9Q4pEFUKxhLmZJ9IYOdktsVtRC9+H1+nDoe2AuciQ0G6BhT4deeFsOpCYJULdTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3qvdZEbe9enl6/OgzNx29PXWLOaXXolNcKLq1YCZJc=;
 b=WxYOdnhPYUUIE1O7mcY7Rq68Cse+kAKZ4BfEAk9LcVuOC1MSAZA2TpUJJSW8uRCzVHNUq60Hfr9goz/s+x+WCposQ52mbre65nSPrJ7QuI1RluEPU9a+p5xSFXA9J8V4AXMQjri3bpsnz+sTmIPVrbK2llF9RIL3kzGGlkacFInGI9yZ0WCzvGaDTCuktjN5Mu7exUWmQRE1Ld0ZqCURS+TDCno6vG+4QkkwJbUrMV2YBOmG1pKT1XqddMVWK8Sr4b+8YJ0X+z7Jp7iaskPtFTu3cLluusmmgEBhDlPjL7on+GcpPbj+pprX7Q1l7S0bX5sDIQDrccrfXVfnSPIeuw==
Received: from DUZPR01CA0054.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::10) by BESPR10MB9222.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:b10:ec::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.4; Fri, 23 Oct
 2026 16:43:27 +0000
Received: from DB1PEPF000509E2.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::ae) by DUZPR01CA0054.outlook.office365.com
 (2603:10a6:10:469::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Fri,
 23 Oct 2026 16:43:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509E2.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 16:43:27 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 18:43:58 +0200
Received: from localhost (10.252.9.175) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 18:43:26 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 23 Oct 2026 18:43:17 +0200
Subject: [PATCH v2 1/7] clk: stm32mp25: define the number of clocks in the
 driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261023-ups_mp25_clk_update-v2-1-398d348ea8fd@foss.st.com>
References: <20261023-ups_mp25_clk_update-v2-0-398d348ea8fd@foss.st.com>
In-Reply-To: <20261023-ups_mp25_clk_update-v2-0-398d348ea8fd@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792773804; l=1765;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=twnI4QR92BUewKdyoUDjAQ7Mve6tD53Osw5Y047pTZc=;
 b=7JXM31wZ/5vb4E82mnomqHIm4+tsioIwBRDc8Q9wQDhr1qjVT59LpUZjjhTQHORnwcdAGeakw
 qeHqsbTUoE0B69qLXhPj430CQ72HCBdNlzW2ockzp3V9lH5kKPhcqt4
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E2:EE_|BESPR10MB9222:EE_
X-MS-Office365-Filtering-Correlation-Id: aa451975-4ac5-4111-2bd6-08df3124c31d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|82310400026|36860700016|56012099006|11063799006|261021121427099003|261021123027099003|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 7OqmVVZb5j/E1pKlUtWEY8PLbCazQMcGm9wVbIyRCoDAHnqQ8qUisnXgba64PZg4RUQPUPR087XszwcKmSY32w2RcVzxCDCuKX7L5f261Y1eZrpHgkG1l4zvDYo/bgzKUulZys2/9tTCVNKMfEnBvw33OM+2ztcRU939sqjArhFjMPAk/aKlKmK/v6BfC9OP1FgkGiGiBCbeuRPO7GG41xadaDQH1lgBbKXFQgQkiQzXtrj3MLIT7Srx39Dr8WS/WIhU8KaUV8ZqRF/HQlVTxzCWKKoNA0Ifl8MhpovHWOBO2lUilEOCQ0f1PNEYZmz59FoCDSfcO+BObyUWJB2z6Uuwwm77fXK1MCQNByh4qGNbMqqwuH8xaL8v0jos4mV5xsvMR7iMLStnS6kC1mDMtWkr5jWVKcQ+0azf1keNGLNMhDzwUSuOLAEvN9ZkvIB+SneI/XACNUh33O5YSr1+1cGQzIGydIGjClOBghO3G4sZB6sHd4OKN+FWvPoL/vjJ8RHKWo9OKoHEOPbhqktNkOlPDJMJXwL4Vx07smynqx8jDC+8BaQIRAyzx0S9VMLwvaOIIU7tWoo+AV9dMMQNmn0DV/7wx5HQUUWD2o+PHsBqktvrebak5IIRtcjOK3cJi+JY04r68OvexPpYVtDqpYARF651AzyFD4cyBRH+zzH+FOqNxQ+pG5n2rthqYK7gBjxzMOfTwbXJrTDDuRgpsg==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(82310400026)(36860700016)(56012099006)(11063799006)(261021121427099003)(261021123027099003)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8RzIpdw4CQ0a+JyO8i5B7WbP0hKLBgACYqKlK0oBY2fTKlKklrO9t3ZmYsZQdyyW8P0Vq/i364g91TcKBlh3bM3EL9wIuVtNMFAJH5Px4znFD0mv2QPAq2osexv+lRcWLbUZU8xOLijxCQXLzwznTCwqVg85fhM+9vZfEvrbu/i0a5HaB1NIrcGidBe3f4uwUV96FSUltECxrff5eJ9xQXrBkhLXVqO5n3IKJ4zDhF1+FxfyYz/864TlHNOAYdl6yViBrsRbbC2TXKkTy2yxY3YcJkBol81uw1twIu3DPW2WP6dO3//G8qg2SYm6eyg8ZgOKJAlc20F9av9ET1Y/Q66Y5tk4ant9+oa3pGDbgnbeQ2XkWou7AgquOVXclrZ6yINP1yIe6dl/3XURnc7Q7tBFoAf0gx/TKt3OAL1oM3BSNey8SCVVcQTKvtHj75FY
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 16:43:27.0735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa451975-4ac5-4111-2bd6-08df3124c31d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR10MB9222
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_094334_127033_9C41C3CB 
X-CRM114-Status: GOOD (  14.74  )
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

The size of the clock provider is given by STM32MP25_LAST_CLK, defined in
the binding header. This is not part of the binding ABI: it has to be
updated each time an ID is added, and the number of clocks handled by a
given driver does not belong to a binding.

Define the number of clocks in the driver instead, as done for the
STM32MP21 driver, and drop it from the binding header. Both are done in
the same patch as the macro has the same name in the two places.

No functional change, the value is unchanged (344).

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/clk-stm32mp25.c            | 3 +++
 include/dt-bindings/clock/st,stm32mp25-rcc.h | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
index eb0bc918ecee..fa025a9f3f37 100644
--- a/drivers/clk/stm32/clk-stm32mp25.c
+++ b/drivers/clk/stm32/clk-stm32mp25.c
@@ -17,6 +17,9 @@
 #include <dt-bindings/clock/st,stm32mp25-rcc.h>
 #include <dt-bindings/reset/st,stm32mp25-rcc.h>
 
+/* Number of clock identifiers of the binding, SCMI ones excluded: highest ID + 1 */
+#define STM32MP25_LAST_CLK	(HSE_DIV2_CK + 1)
+
 /* Clock security definition */
 #define SECF_NONE		-1
 
diff --git a/include/dt-bindings/clock/st,stm32mp25-rcc.h b/include/dt-bindings/clock/st,stm32mp25-rcc.h
index b6cf05ad4be6..242f61205a9f 100644
--- a/include/dt-bindings/clock/st,stm32mp25-rcc.h
+++ b/include/dt-bindings/clock/st,stm32mp25-rcc.h
@@ -364,8 +364,6 @@
 #define CK_BUS_ETHSWACMMSG	342
 #define HSE_DIV2_CK		343
 
-#define STM32MP25_LAST_CLK	344
-
 #define CK_SCMI_ICN_HS_MCU	0
 #define CK_SCMI_ICN_SDMMC	1
 #define CK_SCMI_ICN_DDR		2

-- 
2.43.0


