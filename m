Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9232DC4453F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 09:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O2rvoAhSPr4dOKkrmKXd5JtIgwVquaidIxigxyrrPkM=; b=3TC51+ERP03pxE7bV2qAQ8/U0X
	jsvTTYJX60cRVZzwYD0kVJxxTrhUvDuE75Zl8H2kBCwfgtmIwpBY5ldguMxgzlyo0gDyPrezbDjlW
	tsi+klFkkFafkh5ddrsyUxALeM4vhh9V3vzVjcFPI5SCJct267gZ5rr+dzASPWrzs/uPuAsQrGUC5
	qGXUw1xVVzztU2GoOsJytIsGyJMQIeRx0N/vu00WGNp/v2xa/4kBQ9CMlDOWsjM0zCt2TlqspKHuv
	9GRQrZyK68ejHvlsHknZ9KXehRl0hRo7zkyLk6vsc4/zpMWR+e2LcOAthHERY5B0vmwWR4C2f4Atx
	xSaERdWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmT4F-0000000BN0u-1amU;
	Wed, 22 Jul 2026 09:16:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmT4D-0000000BMz2-0JmG
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 22 Jul 2026 09:16:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=O2rvoAhSPr4dOKkrmKXd5JtIgwVquaidIxigxyrrPkM=; b=LyuvRoBk4SNHh/5WqCV2W7nmgI
	jmUhplzkLZoRpPzn1GnrrEghbBQ8xoGwrEDRaEsp0bCqCsh1CTJlK+69HLsHphhzXnoi1mnz3L6gV
	/Ad2v0RuDhaYauAEqwWaGLpzIvx6uTvNsUjXpotZuNXV6cLgXmIAcus2uwq1CgB5sqrO7m0kqNo7R
	5xcRI5nquJs+2zpkKtFiaLKp8NRSC7mbaF7dIY3qQPnTD46l337mDzM6gNb3RKOeeTGOocUW9tyMU
	5FG/LtjmZSTyaDhEdFGTSYByPEuiRMw0jbrl41eN1jQBU6Ov74J3tp+fC6fUem9WZneJugaOVVRea
	s2oDtPjA==;
Received: from mail-norwayeastazon11013027.outbound.protection.outlook.com ([40.107.159.27] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmT49-00000000ezW-0bf0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 09:16:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=stMlhhEO+jkNzEzZAquz8TEyEsTESkt0qEtW6KLcjAAzeVmHHbsbBmTLR6kTi4CDyzt76lpnHI0MTnIJIy0Rjz/rK/8g32OJMOCDcHghTbXFaG0jhz2icRYX6ga6zp/N0zsizgMPqtz9y77ZSiCeM6DZfqPfJWU6KHgFrTmE0m+PBa/JtqRzoMDLlwkwBhJuO3NLpuM1YgicLeqKWpl82Rh5gr0NpUtZC6H4Jd8C1JklgxhSG8kSe5QtELqQQEpZFyKxT70tslraatQ/DLkcn2RSem6cQvCn4rFQC23vYot05LA0BYmhFVnXjxSu93aPrqpR/e7apsRAv4QdPLX38g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2rvoAhSPr4dOKkrmKXd5JtIgwVquaidIxigxyrrPkM=;
 b=BCBHQQoF0seSD3ijsGTAjMW92N0+dJ7ef6VO6lj3Wl3WIsQvJm72/yvuT/NM9kqNE1iX9ml4ivv84dWmY/asjxOf3PcvAZjd2ME55lXC1Z8tJ1O379lQTvYCsdpXyJCyJ13YL5GuMrvZSzn4GxaQSUUQ8ZZ4LUhVEOrKRG/2TYtdK5vUIorVQ/8GBEw7hIPd+yKMQ7tHS0Kk/0QEaPfqKJrwrrzl8NARTw46mCgLkcOgcR1eSTdFc1n4FDd3QFbIWqv4+45bqaFXkEg2p1jGME52zVXT0u2YXl5uqiWKZtxWYymfXylQ7c9IK3gesYopUfqZSkagj7T+yHpVK9Abxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2rvoAhSPr4dOKkrmKXd5JtIgwVquaidIxigxyrrPkM=;
 b=A4NBjjpVquYShBxU952SHO0Squv/+G5bK2o9jYGZfc0GPML+q4l9MTUkDwZhlxSns5GhTcq6/KIknhXOqc4JFf1sMKjts2SYNBZ3pHG7NoLhP00wxHN1sUqCPiyvYIWeQWfBYl7FklhGrILUt52s98qqCVJZJehewnivKwgf7meDz0V4QvsWAdsrp2fX4JlteQMUJ81q8ynhP5u+6svz26wvoi+aI5hvjSlxcFZLsswI1Z10AOQNzD7l0BW4E1oI5lQqBbnZi+XM7FwQdgLeHwwBCBgVimft5XfOw0ydV/Ab7ExLqogEwFVmwcC2a5G9R3PucfXsLKOZYfI+3n2u9g==
Received: from DU7PR01CA0016.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::11) by VI0PR10MB9606.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:310::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 09:16:32 +0000
Received: from DB3PEPF0000885F.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::7d) by DU7PR01CA0016.outlook.office365.com
 (2603:10a6:10:50f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 09:16:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB3PEPF0000885F.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 09:16:32 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 22 Jul
 2026 11:21:08 +0200
Received: from localhost (10.130.77.105) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 22 Jul
 2026 11:16:30 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Wed, 22 Jul 2026 11:16:16 +0200
Subject: [PATCH 6/6] ARM: dts: stm32: add sram pool to spi5 for DMA-MDMA
 chaining on MP13 DK
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260722-spi_arm_stm32_dt-v1-6-6ef611523232@foss.st.com>
References: <20260722-spi_arm_stm32_dt-v1-0-6ef611523232@foss.st.com>
In-Reply-To: <20260722-spi_arm_stm32_dt-v1-0-6ef611523232@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<clegoffic@baylibre.com>, Alain Volmat <alain.volmat@foss.st.com>,
	=?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15.2
X-Originating-IP: [10.130.77.105]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885F:EE_|VI0PR10MB9606:EE_
X-MS-Office365-Filtering-Correlation-Id: ff87855a-ec2f-443f-f1f4-08dee7d1ebe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|82310400026|1800799024|36860700016|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: haeakRo51UyPxDjMt4hNCG9WmqkI5yoWg/dpwTyPXl2ZkAzEzLumI6Y/iPPFSc6N63qz+LLpGQnxtU2WIeEB1s0KMZo13fnyo+sajL46p1M4Hj+6VnCv3LmpuQM2+qKdp01mUNPj4KQoSitu5g7UdKVoHX/IFPVQwLoXmUg2zdgHUdUeuUJFdZNvbX33mB2XXUB10ttLsxubJe/ALxNzOU/uKU2Tj8E8bqZtUNp4320ZQVrqxin2Y+MLiWfeXtR7imByVTXMbfDGDjPf5qk4E5giVe/TjKYML5a7Jde0i5Orxu59Z/qRAfYGDKnhQT5Ix0B51+MdOak0UpszXT5UT6FajnjYHtyN3KVIbKNaiN7qUH4bwzbQz1qIW6GCy1G2hgWzyyUq/nRS+1wDzxFxJT2jqkTHgSMEfSEUJ0jj/XJqFnOHk3w7gvZrxURnG/prlRjvUAdjs/5WDmhOIjIlLTTpOGCuujbn7R+7Mz/dIP9vtZ6SXqinruyFhbaPqOkJ0cs8ZKBN5w5poDtSWS2z4TzrYRhbPOxO52gGxIc+VWd74QPSATMl7nYLOwy85Bkh/+RDztb1E1OOBDaTGCoSsZWDZZoO3iYb+IQ0ee+PlD7fNAXAv1BqUr2eAGXmgBFNZP43GSRBxGL14rGM08PIkNwdA8xUoDWK1QAX/pErQDIveTrpHjRFPSXgYWA8D1+HTkG0dXFbfslUKV6St+b3XA==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: M7xl7kGg2JQXwjkPSLqGAOgcxUiGYgj2q5+pFhEIVhDzGQcYFHChK4psMs65YwE3b4uaIxU5sXAT3QB/KLl4K+hiZBk1plluCjP3Q0nCseiqXKghVLfN6aR49J6vGi+UQ/er9HTK3PUPQF9zS+GICh00VcRSQu9v7IcWj0SN93D+q52tJNqt6C/fwK0oxl3SaC/BJllX8Y1GiGu7Zbam4YRZPf943rodt3GoXnFaxiToTKO63w5s67v7zv1iGVEwn8DsoHM6yFujDDJZYK9AtblMIzN1GeY/RwPzUfRQ0y4CVjsPYTnxr8BU8BTF2kY8Ge+fjljpSw6Kjlysi5HZYYGyFZ3KAmY1R1V3s+rEblUXdtsbQ/G6kHjsosBzvMnKle468Mukl+zE/nYtMdrupbXTVms+nkcJLGH7h+1/K5NkvwWHclC85X3Y7J/pYBTi
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 09:16:32.3724
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff87855a-ec2f-443f-f1f4-08dee7d1ebe9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9606
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_101637_286602_6EB05806 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

The sram pool is used as a buffer area during a spi transfer using
DMA-MDMA chaining.
The pool size depends on the SPI framework that creates sg up to
4096 bytes.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp135f-dk.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 6022e73f58afd..35509b5c3872a 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -479,9 +479,21 @@ &spi5 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&spi5_pins_a>;
 	pinctrl-1 = <&spi5_sleep_pins_a>;
+	dmas = <&dmamux1 85 0x400 0x01>,
+	       <&dmamux1 86 0x400 0x01>,
+	       <&mdma 0 0x3 0x1200000a 0 0>;
+	dma-names = "rx", "tx", "rxm2m";
+	sram = <&spi5_dma_pool>;
 	status = "disabled";
 };
 
+&sram2 {
+	spi5_dma_pool: dma-sram@1000 {
+		reg = <0x1000 0x1000>;
+		pool;
+	};
+};
+
 &timers3 {
 	/delete-property/dmas;
 	/delete-property/dma-names;

-- 
2.34.1


