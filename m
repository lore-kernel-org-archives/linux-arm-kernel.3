Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626D2606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 13:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iwDlJotO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=bdTTGjaD;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=P5cQ/Q8a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3YqBPQqJjkaJeg5zLnNQ0QyAaMGyiY4PEOi6qnBqfLE=; b=iwDlJotOSi4TdQ
	r+7qxtImwvNJ81iG8I70CvOxyztvhWiPIBZUzD+XTEHlDo7ZzKx5NSeBKv5WLGKheoE2aGROFcZAd
	QkBVz0MZaWXPto02RyG66PdQO/sIMx8X+5AYfMVaG62XvDR/N2IkS/4N4Ftgn7uWGc5v01F3VXuiJ
	11/j+V4ps12t4A1ZrqGv6AiweExRULHaHmHOm7lwPxFddtHFUe4WQ86PZMGFKnmfIQFjOvraFDsx3
	POhfmTCY184nF+ZT3Rs6VzKrGydMaW0wh124PWLfhk5g1tgJqzL4tP392ErGaKgqxM8YSftdfZQRe
	x2RhT0H97UdqzdOTkhTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFJq-0000000GNJY-1vDE;
	Fri, 23 Oct 2026 13:28:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFJn-0000000GNGr-0QjN
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 Oct 2026 13:28:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3YqBPQqJjkaJeg5zLnNQ0QyAaMGyiY4PEOi6qnBqfLE=; b=bdTTGjaDmQSzgIxwfnp++MdTTd
	One/227wC5Hpa2DxWrGTRpHA43lYb1TwTY7DLYCdfXXRxwu9S96IA3GyMvvd1r38EsgUavyvrpis0
	aCsy9EahL8kg0ZvHYlGzbx8nRXvJGaxPl26b06ujVA6jHNDxwSKN6PAdMy4NqeB6JwYCQZ4mXS0sQ
	uwuJcuRiaBTj314cCNMxcyV9xVAq4hra2RKdo0p2UQGiaTEGUl41DT5nV4NLihPPhGdopX4Vq/bUw
	jdXmSDysGgB2TE15DuVyanAhDq1r5A62Jys5Iq9UWmme26sX3GFku06ijhE5GbUNbQnBFwtWkfcl7
	1nWV59hA==;
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFJj-00000009hE5-0Z51
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 13:28:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gtwa8vfhCJgc6tpAMysXko6FW51uDnQ2EbyfVG5M2Rw6nz/N4nxueFk9dtydvWRNd5nyv4GLHRYokE7101cMnDr99eNDAxZ09/ekVuOyxPmnwEy3P4MWjtTY+WHsQLGNCMdYwTJkYSCDPl44SwpMZ0+YwaqzKz00PJfWVRzubT2uU7hbletY68Dxot64cez1aaCpw1LZpC3vHHSZCo0OHyUAMjxGenAittYXtF5iEGABCKeRxDaE2Zl8eZxPKOs7ImgNy6F9kZXDYI2MbTVm0458vkpdbsYpWrmGkgIdHATkQj6/OVN6yaZ080qDF5kpmlvJhEc1E/D7Yp08t5m8zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3YqBPQqJjkaJeg5zLnNQ0QyAaMGyiY4PEOi6qnBqfLE=;
 b=h6T99Qh4thOedw7H+ZgrdZSUKgjp4oTsICnQ2k5ZFG16I9EqK+C6MiCmqXeB8qmpZB/ENQG5W2POtOTqW2LzNn4L5dVBvaZfOE70uor9F5E/orO7iL4dahibrj1PINmO2uq/Mn2/obbHg9mlgQTv6zS08o8Bx+PY/LY2WDV0qFo2OpyQpi8bixJnYorw1Dt27CbhOAJu7AufLbN48z81p3WVcQBmjuqkCr9oYYnx+Dw8NjmFt6E6QjlbuXiS5cIT6XXJuD6R7LBjmjx2w6rbLP89q5IXvkcSC4D5t/H+IPavZerqiEmDR9bsSE+4bgw7kjKt2YeocMu3sM7xVWrPhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YqBPQqJjkaJeg5zLnNQ0QyAaMGyiY4PEOi6qnBqfLE=;
 b=P5cQ/Q8aty+xsD7Or0JalgpGCBVCb/oJoaBFuVOyjwL9PCPKliUKAqAcJb0fgzm0ISKpO6kFZDn87XCBlB7zqX3UuuGwOHeN4ffHEIqcmAO9Dmsb1HS1DxGhI3Qd70TMqHzYgrZZS67lW5HKQWpfveJjFoyH4FMMXREpGuKcoEI6W/xg/IiVPTD6vMCh+kCrO3y0SbcFwbPwsAQhQhTq3ekXE58InZYvS8A7oIcRlvdYIRuuCETVOqz+H1dCOPjo1UTFuxEnYl+UpNdYSovV9/SK2zX7M2OjqdRvH2z9UndO13NZlKypGg4CuAVlwkNjOA62xMVvXxxtDI5uJ2S69g==
Received: from PAZP264CA0016.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:21::21)
 by AS8PR10MB7158.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:61e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 13:28:12 +0000
Received: from ZR1PEPF0000E6B6.eurprd07.prod.outlook.com
 (2603:10a6:102:21:cafe::31) by PAZP264CA0016.outlook.office365.com
 (2603:10a6:102:21::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Fri,
 23 Oct 2026 13:28:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 ZR1PEPF0000E6B6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 13:28:11 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 15:28:43 +0200
Received: from localhost (10.252.9.175) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 15:28:11 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 23 Oct 2026 15:28:09 +0200
Subject: [PATCH 4/7] dt-bindings: stm32: add clock binding for Cortex-CM0
 on stm32mp25 platform
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261023-ups_mp25_clk_update-v1-4-e906e7a38cb3@foss.st.com>
References: <20261023-ups_mp25_clk_update-v1-0-e906e7a38cb3@foss.st.com>
In-Reply-To: <20261023-ups_mp25_clk_update-v1-0-e906e7a38cb3@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Gwenael Treuveur
	<gwenael.treuveur@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792762086; l=4216;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=ihfuoPdN8mbPb8Kg/gwynWIfED3T6eWjZ6ZI4XBY7qQ=;
 b=DaMZvLzNoupEI0J+16cHrQ8M4Te99f6/nT2nET6q9xQhUoMW91On5o/Vq7ZbE9vj7sJqax20E
 +PcNJKCZdWBBdIA2gWheiXiw0v+grRRzJF3/Z1v7EnXEcPGvxUhCCYw
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6B6:EE_|AS8PR10MB7158:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ae9d1a7-71d7-4ab7-8a79-08df31097c41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|23010399003|36860700016|261021121427099003|11063799006|56012099006|261021123027099003|261009223027099003|10067099003|18002099003|22082099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: yWwgkXiN1G1h3pB8nsVNzbueKZkDttEzYwC2KiSYrKHZ9de+WLHtSSAJ/xioEkjPp711aDaHm3zElfM1zRpi5HXkypiCkeWXBt5Sd8/O+7WHPWol0uCRrML5mdB+peP5GYrgHMyimajM/djeRGEOjoFfoXkEsTbgl/iB6cl6Ye3VR5ihwKBLjs3TLw+870BYDfsWni/B1lX10pURW95y7TY6JwCoXBk/9B/iYoRc3kOVfJ28Af/mTcydKsI1Z2ZV4Ig1yH4Q4h4RGD4hGmvT9dPdqbrSgmvfI2+BBwZnggS2xtuNpiPc9+5utPazgeXHvQQqq5jLfsik4uEFt/4syan3dp3HA00+PXpV4L9hEUomCB5pI3+iWol70UqxOJMmPT8gkaKdPrOqO+v6VRfnmhXcMwJCvw61xlmvK1Xp9N3D4zKFGIj6fUxF8UiYowYdBHllvdfNgnMVbnXlp96cloO10b5EzmSsQInY5XePOebiXYzgBchIeLRF/IDD37vQVT5P65T9r1zy+XrQG8PMJ2HV7uOd6AejOWzgxc1PZ5qvwUvIOyOjpnZW4vmcc2A8oUZXTuWY229yEdtRo9/0i536EtZACVlihCekbbLY9IJSgPIkcmyGyS0lRV3S+qdiPYEuoj6FG5JhHW4UssrA01jvylh9AEgHkEe/Yi0pwrPlk7uRTe2khcX4zAvzH5dKsHPGxxteS9RhpfW6DPIvMQ==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(261021121427099003)(11063799006)(56012099006)(261021123027099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6gNdFaoUvervg9j7DTGiRceZpDj1MHSA9P0OuCsgA/l6bpPc46AwA675AQO5g1nrOyzEtg13ScHCwMpCfFhoP534LcmqO3kZI5MAWRXT3Of33wF6lF0O2XyX/9EVuWNL3RDrNHYVlvl7L7A2+Gc1Vn5TwI9YjSfkOELuixTt+2Lefy7FL3YfEz+kIuFU5QDSNWII6NZi2An0Vu03YVlxP2ZrDz8japz15OM/z6tKrL545As9/aD15unyZ2GxO2m/xTi63R/BrV1WgBidTFf2cOLkp9+Ge8AjyuCv/+im0mSLkAnWAb9DP0xBfs/kZhbyYweU1e1ES4QWslnJ5jhazrrODJahufJGcXj4/fyZavvChumfbU2iINj292tVnftTJw/t09iOnWALRk271vRZCE5gFo7LToxnR3W4LyBJkHEFIJL2kBuMBb8vjNA77gzM
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 13:28:11.8782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae9d1a7-71d7-4ab7-8a79-08df31097c41
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: ZR1PEPF0000E6B6.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_142819_689269_900177D4 
X-CRM114-Status: GOOD (  12.30  )
X-Spam-Score: -0.2 (/)
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

From: Gwenael Treuveur <gwenael.treuveur@foss.st.com>

Add the clock identifiers needed to allocate the D3 peripherals to the
Cortex-M0 (CPU3 domain) and to enable their autonomous mode:

 - CK_CPU3 and CK_<IP>_C3: allocation of the CPU3 domain and of the D3
   peripherals to CPU3
 - CK_CPU3_AM and CK_<IP>_AM: autonomous mode of the CPU3 domain and of
   the D3 peripherals
 - CK_HSI_KER_ON, CK_HSE_KER_ON and CK_MSI_KER_ON: kernel clocks of the
   HSI, HSE and MSI oscillators

Add the matching SCMI clocks: CK_SCMI_HSI_KER_ON, CK_SCMI_HSE_KER_ON,
CK_SCMI_MSI_KER_ON and the autonomous mode clocks owned by the SCMI
server (CK_SCMI_GPIOZ_AM, CK_SCMI_IPCC2_AM, CK_SCMI_LPDMA_AM and
CK_SCMI_RTC_AM).

The three kernel clocks of the HSI, HSE and MSI oscillators are also
added at the end of the RCC input clocks. They are optional, so that
the existing device trees remain valid.

Signed-off-by: Gwenael Treuveur <gwenael.treuveur@foss.st.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 .../bindings/clock/st,stm32mp25-rcc.yaml           |  9 +++++-
 include/dt-bindings/clock/st,stm32mp25-rcc.h       | 35 ++++++++++++++++++++++
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
index 3b7925d2c175..423016ecb602 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32mp25-rcc.yaml
@@ -32,6 +32,7 @@ properties:
     const: 1
 
   clocks:
+    minItems: 80
     items:
       - description: CK_SCMI_HSE High Speed External oscillator (8 to 48 MHz)
       - description: CK_SCMI_HSI High Speed Internal oscillator (~ 64 MHz)
@@ -113,6 +114,9 @@ properties:
       - description: CK_SCMI_TIMG2 Peripheral bridge for timer2
       - description: CK_SCMI_PLL3 PLL3 clock
       - description: clk_dsi_txbyte DSI byte clock
+      - description: CK_SCMI_HSI_KER_ON Kernel High Speed Internal oscillator
+      - description: CK_SCMI_HSE_KER_ON Kernel High Speed External oscillator
+      - description: CK_SCMI_MSI_KER_ON Kernel Low Power Internal oscillator
 
   access-controllers:
     maxItems: 1
@@ -214,6 +218,9 @@ examples:
                  <&scmi_clk CK_SCMI_TIMG1>,
                  <&scmi_clk CK_SCMI_TIMG2>,
                  <&scmi_clk CK_SCMI_PLL3>,
-                 <&clk_dsi_txbyte>;
+                 <&clk_dsi_txbyte>,
+                 <&scmi_clk CK_SCMI_HSI_KER_ON>,
+                 <&scmi_clk CK_SCMI_HSE_KER_ON>,
+                 <&scmi_clk CK_SCMI_MSI_KER_ON>;
     };
 ...
diff --git a/include/dt-bindings/clock/st,stm32mp25-rcc.h b/include/dt-bindings/clock/st,stm32mp25-rcc.h
index cef997508b56..53c65e9a12f6 100644
--- a/include/dt-bindings/clock/st,stm32mp25-rcc.h
+++ b/include/dt-bindings/clock/st,stm32mp25-rcc.h
@@ -365,6 +365,34 @@
 #define HSE_DIV2_CK		343
 #define CK_KER_ETR		344
 #define CK_KER_STM		345
+#define CK_HSI_KER_ON		346
+#define CK_HSE_KER_ON		347
+#define CK_MSI_KER_ON		348
+#define CK_CPU3			349
+#define CK_ADF1_C3		350
+#define CK_GPIOZ_C3		351
+#define CK_I2C8_C3		352
+#define CK_I3C4_C3		353
+#define CK_LPDMA_C3		354
+#define CK_LPTIM3_C3		355
+#define CK_LPTIM4_C3		356
+#define CK_LPTIM5_C3		357
+#define CK_LPUART1_C3		358
+#define CK_RTC_C3		359
+#define CK_SPI8_C3		360
+#define CK_ADF1_AM		361
+#define CK_CPU3_AM		362
+#define CK_GPIOZ_AM		363
+#define CK_I2C8_AM		364
+#define CK_I3C4_AM		365
+#define CK_IPCC2_AM		366
+#define CK_LPDMA_AM		367
+#define CK_LPTIM3_AM		368
+#define CK_LPTIM4_AM		369
+#define CK_LPTIM5_AM		370
+#define CK_LPUART1_AM		371
+#define CK_RTC_AM		372
+#define CK_SPI8_AM		373
 
 #define CK_SCMI_ICN_HS_MCU	0
 #define CK_SCMI_ICN_SDMMC	1
@@ -490,5 +518,12 @@
 #define CK_SCMI_BUS_STM		122
 #define CK_SCMI_KER_STM		123
 #define CK_SCMI_KER_ETR		124
+#define CK_SCMI_HSI_KER_ON	125
+#define CK_SCMI_HSE_KER_ON	126
+#define CK_SCMI_MSI_KER_ON	127
+#define CK_SCMI_GPIOZ_AM	128
+#define CK_SCMI_IPCC2_AM	129
+#define CK_SCMI_LPDMA_AM	130
+#define CK_SCMI_RTC_AM		131
 
 #endif /* _DT_BINDINGS_STM32MP25_CLKS_H_ */

-- 
2.43.0


