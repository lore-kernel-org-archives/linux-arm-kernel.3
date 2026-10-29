Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3088606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hQDNFGjz;
	dkim=pass (2048-bit key, unprotected) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amdcloud-onmicrosoft-com header.b=shglO6M8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9kSpXbIl7uyCbma4TQ7vyMsXR0GriMgKcxLGj6DB5k8=; b=hQDNFGjzKNhGgK
	OkczqLVHQ+cEilexM09SrNDa/wqukHCWHDe3QUyDhfqBIzDK+r6UFmt7gs7sTYmQTZh9kP3kKllC0
	hsUp3Oi8cMYvsjguxcqlbNpwIj9kE/P5XAFR2LN9wj3Vie9eaEdo15PGq7H9qatirmAU0r88g9ynm
	ziLCSj8TDXhPdC8C1cVYPYlWeT5jnsZH/WYcj+Qk29kMnfAEBHPcPffazlIgLQDNX8VxTo5wgjsZL
	vGUoyL/QemWDA4dUkV8wtJnPDKk90kDBCu+tYdZQpLUOekoxBrqyKPxn4yEpSxGRUNQL2RjtoJ5XR
	NZeuqEA11xn0imY1XXwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQOF-00000009NCH-23aA;
	Thu, 29 Oct 2026 13:41:59 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQO0-00000009N2F-3npz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:41:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xOkm54RDzH9PwkXIckRqLvywUrkGjHj2plqtyu8PBSf3VEVx+i0AKYePN3T+Ep57rRU8h/qtaAi2JfFoLKYbHcPfPf0g4GEoU6CWwpdV8TK1+i57aDP/tS2Llenr6j0fWCxLVQ4hC99Fj6hXeoYD4AC7XSwydX1PCt107EDWlkQkvHrYLboALAnkuGMBKHfU9aCcguUoue0YEyb+20KsuEMUvniLAXkDLZgexvGSnLDAGqJBVnd2f50bhkxC7cufvUJQaEtv7D25Ol0ctnmDjWSlcdi52/6ET4zB7RH0ZQJBLkr1CbuMNMbhVeV5LVl8AB9dQceraO2UT5SeM8foHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kSpXbIl7uyCbma4TQ7vyMsXR0GriMgKcxLGj6DB5k8=;
 b=YmCkCD5L/7iRBzdbRx7Jp+j54/t0mjrnpqdKwLo67AHapy5/v8vMKBGB4/0Iy6C5hu0mSveWSq1PLkKJ2UwTaQe5+hO7v2l0mDbOyYevHqB/funjxQYPhOkHcFcC2qxZq/VieRnGsemc6XCe8mJrp/16pp8WlsUt9eMzQkjRz19hmoqK0WSvuwoGjT2kkDy6uPHSZ5X2QS5TU4g3WVdx6SWENH0+Gr2bZcb+zlbh9o6QNS0T79jsSaT2+yxQ72YakWKAXaUZWl/McQjJ3PdL6x44+rBbtd4NWKu+i2vDRSZ6euQ1UgZ+p8xuH+UsGdVGGJISIBESUGzLgnpWGl6BsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=aspeedtech.com smtp.mailfrom=gmail.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kSpXbIl7uyCbma4TQ7vyMsXR0GriMgKcxLGj6DB5k8=;
 b=shglO6M8LcmZm4jhHn9ianrDTcm6oXIkSTGVceqpl+p/bJM2mXG85hb8oBQqazM39RCdTzAq3NyWwvD21M2kdJAAidqBIld2ic7XLw2lMRCM5M5ZVssyIb29DWdqhP+B5bLyB44jC8AeH4IyRQdB+MPRM9hqf77Wt1ksB6BGfOxKZ2FSJHlMr+BNn+A8CMpK2rObtfKuGBLdAvkVhxHU2B2H1DceOGDrc9Pb3FGoxM1fXBx1agzCqExZxsoYK+96iw/OdTszhSComA20mBMM8pVODk65ctjvrCXgWIm1qgOaVyh0jjxzSjurfYdjbocENU9a54wkQhyhFO5T3F2yaw==
Received: from CH0PR04CA0001.namprd04.prod.outlook.com (2603:10b6:610:76::6)
 by CH3PR12MB9429.namprd12.prod.outlook.com (2603:10b6:610:1c9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 13:41:34 +0000
Received: from DS2PEPF00006E26.namprd05.prod.outlook.com
 (2603:10b6:610:76:cafe::a6) by CH0PR04CA0001.outlook.office365.com
 (2603:10b6:610:76::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.7 via Frontend Transport; Thu, 29
 Oct 2026 13:41:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 165.204.84.17) smtp.mailfrom=gmail.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 165.204.84.17 as permitted sender)
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF00006E26.mail.protection.outlook.com (10.167.23.219) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 13:41:34 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 29 Oct
 2026 08:41:34 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 29 Oct
 2026 08:41:33 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 29 Oct 2026 08:41:31 -0500
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 29 Oct 2026 21:38:34 +0800
Subject: [PATCH v10 05/16] ARM: dts: aspeed: anacapa: Add eeprom device
 node for NFC adaptor board
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261029-anacapa-devlop-phase-devicetree-v10-5-26ee3cf9d9d0@gmail.com>
References: <20261029-anacapa-devlop-phase-devicetree-v10-0-26ee3cf9d9d0@gmail.com>
In-Reply-To: <20261029-anacapa-devlop-phase-devicetree-v10-0-26ee3cf9d9d0@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>, Carl Lee
	<carl.lee@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281119; l=833;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=pAsMpGEbYbQLqQx0xG8zEgHoAeRohruYjFh5hP58kBE=;
 b=vmdceVSFuhE4Ir5bz2Si+47F6kDNwtJhhfBX3ndlln57Bw99usIbrEQSNgxbZKs8q9AT9Mlxv
 JzZoIJ8sQlkD52CrG7w2j7DSTMUp71fCrXpOL5ZnEDxjfbBZalf3cCU
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00006E26:EE_|CH3PR12MB9429:EE_
X-MS-Office365-Filtering-Correlation-Id: 4887cef8-023a-4485-9451-08df35c2593b
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|48200799018|61400799027|35950700016|7416014|7093399015|11063799006|56012099006|261009223027099003|10067099003|261021121427099003|16102099003|18002099003|22082099003|4128699003;
X-Microsoft-Antispam-Message-Info: 0gTbvFaafa/vDQVsDGYIc60XxYD3aTDAwIbzn9KN1CIpbVlzspQaIbmoghIWK567I/usMaqnyjWDM0HVsmQe3HxQKAdP2llCrH6zoTUp30NAZ0h5Xzu52L8BHGQ52egNEb2ju/mSBRSzUUbzPs/W+ksDtLJXwtYLJ4regvPNV7wbW58FTf4cEqVu6+1wWWpuYCfsBtn2jS2mwhg4O18rQyQ7vfuRzDnJ5eVuRBSt9T1KJKDQ6eF06pvMeByDVkfTQevve+jwx1J/FJC6cuvTd2F8YZrIiGwR7GL5gOZxew1h7qNPZaDQnghI4PRZplV3q6h4hRIiIQgqJHn9ficLMCFXGjIbai4Ss5WdzSL/ElTf36GJYFqN/G/qJrJbqsclpp5d9kM16FevQRkVQwOyJ5wXIwV3a67wUIFmc9eipQUaio2YOA8FkXZGB40srUfCCz1i94wAiLrfZWJo9Szj5TM38n6e5+tZWd/D9nPty6tJi+zeoWL26jbGuw4U9P6jVn9utxI1LPn8+3Omu6oVjUMUvEGAcbRfuRFKby7UQBHkhedAqSvD6Pd5mhf2pswZirmd7p9+9Ns0NQe1hM2wedaSj/N0kqxX8W8lJohI20tbAKflEg2Q+OzxctZU4uORbGyb/qOAJxoaQh8VrixNqPBBpnkEou483HE/VJFDZa/MLDpJurfCVLORUbIlqtKvrTRIWjWHGCtHqp6Nj+nxmg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(48200799018)(61400799027)(35950700016)(7416014)(7093399015)(11063799006)(56012099006)(261009223027099003)(10067099003)(261021121427099003)(16102099003)(18002099003)(22082099003)(4128699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7WzxhhP7WKbBB0XKRIxeNRpTp4mXoJkW4PkJADnpg1IRfc7BXNj97QkwweWtmH2YnpjgsWK0s6Eau70KfEBxeNpvLHcmJRh2kwDpSP4/5/aLJVaLJtXWxIwncX2ksZs2Qh75MHycJ+ubydQU1QzoC1i2LkfqGaWKqIMODxs2hcb5i+SOo5jaBqi3Wm6ehLWs0mf5gz4MdGwoTxKrhQw0KwZYma7bW6M1A/C8mard4waD82jE8+pWAlHLv1OmgUOPKaeZ+delkWDimVrn/edX59W695ciPyRNGmkMzFLOMOdcmXu5rMUZUVYaMrabNbgPJau3ZauN0/uSdECoiWDE9R4Q3m7H1kNj8eUKXcU10SmIudfewIBs3/y+uKFzq+1D4b4ng9RFbbQjwo+wzMrrzdPW/bWkUcesg/PGw8n0xBDPp8LlR4CrOIcCtNF/oTiC
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 13:41:34.6012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4887cef8-023a-4485-9451-08df35c2593b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00006E26.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9429
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_064144_960561_FA86B2EE 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 1.1 (+)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Carl Lee <carl.lee@amd.com>

Add eeprom device node for NFC adaptor board FRU.

Signed-off-by: Carl Lee <carl.lee@amd.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
index 8c4a03a82d44..a2392f684b80 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
@@ -16,6 +16,19 @@ eeprom@51 {
 	};
 };
 
+// MB
+&i2c13 {
+	i2c-mux@70 {
+		i2c@7 {
+			// NFC adaptor board FRU
+			eeprom@50 {
+				compatible = "atmel,24c128";
+				reg = <0x50>;
+			};
+		};
+	};
+};
+
 &sgpiom0 {
 	gpio-line-names =
 	/*in - out */

-- 
2.34.1


