Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B62B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SA9bKXRi;
	dkim=pass (2048-bit key, unprotected) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amdcloud-onmicrosoft-com header.b=nlGkGwfe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8JHpVGvvc0BxDXqHE+ko9RQSlW/vc4sxkXIPPE0SgRE=; b=SA9bKXRi+WnoIr
	H4FaAmftbCQXQ7qhdnHQaQ2ZYtrkR2PyMymNZn4bFGAyPEyZ1B/10olhP1nzQm4zMNkDfFzdJ8pWw
	+lUSngqn8EAGqMMY3OmOR9U5UGyxjz6jrmg9QCeuJWMCHxt0S3t8yt7sb+qgAtcUJkgHnqDyIq7NV
	ut02XrTxLYbM3G7gmbmhHUae7eP6gZvadF4u5In80vxat2DXZTLSsBJ/Rl92fUqwctf4i2zLWWczd
	joKHTP9zsyq8zQIMwAc2BkrccFBI7Wnufn7S5QwcmdzhgqyDePx2w+KdsbKpMQPt6Yd6jNR1OtUM9
	FRyvBrDPFu0681kZJO2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQOF-00000009ND4-32ne;
	Thu, 29 Oct 2026 13:41:59 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQO8-00000009N6x-0T2Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:41:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nO6wLn6VT+NQVaqH7zfb57R2soDHPJzoK/ZrCeDM9EWVgB3gN5ODhgpgxTrnknKDuLZ5xdBC6k6oV5z0Mb1Q97hj/E0zQQrdQtveKRe0R8moPqJ5p+hfcB4kXURwjlUXyjyjNMb/ugPHMzeqsaM1Fw8pvqCCmMMhlo0DXGGrY50/cd7nxaGb9fWHxZoIksa+Pvhimkhde1ofsuId1R4cE89HlBg9KEV2Vv8ULfMsDinlDyrEmUzetz6ilpG9v43A6jr+9wCNDKXjkCgSEiu8QopxE3ESsTZHx2d2U5HeJmr9GQshefLSDw0Qg65BfrwvEf3efF0v84p4bEjYOuOgMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JHpVGvvc0BxDXqHE+ko9RQSlW/vc4sxkXIPPE0SgRE=;
 b=tbntSr2F+T3UImq6fxYxDfODfxWlg9kfN8u4OaXmZDcbIgLc+xPje1iasUyGbpEQt5lZaDZGR8c27f2Yt+pxNfz6gK109USdwV380n7F9srJ9xJ8b6SVmVJS2kllfoGURPHtUl3op8KLQ//3hK+KC43JiXFG0Nxq6dAQz/1oAX3/2b/WxjU986nysAzXVCrJWz7ArABPWoIxnXWpVrr2oAQMKKokwLMtSQBoEaHaPMpFUa1GPruyQvy3gT7+NWih405PqB46y3O4W+Sv+ePbeM/gV5VwDIsHfn6U3IuLwFWNrBtoPxvR9s62NHVzKpCiOdb11Y47XDpZmG3TBDm+BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=aspeedtech.com smtp.mailfrom=gmail.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JHpVGvvc0BxDXqHE+ko9RQSlW/vc4sxkXIPPE0SgRE=;
 b=nlGkGwfeph8eupapx5QkXOlNdMO1uVs5GZolx/QDJx7N8koS6HMvql/QVvKJvbScAs9K5Udv2ZIPsluI3Gk06HXslNFRD1HsfH30AjvPypKk/hsM4UbFLMVyS9AbyXP/hzu3yWXvJ8ZniY/uUSbossvXHdhkje3s4FGQ0SwyOS8WB8CTPmsHbBJHtEeTHe7+kil0nhLKAmWph/pIOfqbJUW7BBBXExwta1mIuxByiroMRAEghj0RNa2zNj7ugicW6rIf0cszGrjaw/a+2ylMfPCwK2HPw7T/kC2gLwHlIdCC5hTRAbwUS4BZ3H9aY9zwBiGIro9sQQBTDx+VzqgpiQ==
Received: from DSZP220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:5:280::10) by
 PH7PR12MB5999.namprd12.prod.outlook.com (2603:10b6:510:1db::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 13:41:41 +0000
Received: from DS2PEPF00006E25.namprd05.prod.outlook.com
 (2603:10b6:5:280:cafe::8a) by DSZP220CA0012.outlook.office365.com
 (2603:10b6:5:280::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.9 via Frontend Transport; Thu, 29
 Oct 2026 13:41:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 165.204.84.17) smtp.mailfrom=gmail.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 165.204.84.17 as permitted sender)
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF00006E25.mail.protection.outlook.com (10.167.23.218) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 13:41:41 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 29 Oct
 2026 08:41:40 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 29 Oct
 2026 08:41:40 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 29 Oct 2026 08:41:37 -0500
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 29 Oct 2026 21:38:36 +0800
Subject: [PATCH v10 07/16] ARM: dts: aspeed: anacapa: Enable MCTP and FRU
 for NIC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261029-anacapa-devlop-phase-devicetree-v10-7-26ee3cf9d9d0@gmail.com>
References: <20261029-anacapa-devlop-phase-devicetree-v10-0-26ee3cf9d9d0@gmail.com>
In-Reply-To: <20261029-anacapa-devlop-phase-devicetree-v10-0-26ee3cf9d9d0@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>, Andy Chung
	<Andy.Chung@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281119; l=3254;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=xSybis4WnZ0wCCi5yNlS7U3ZxSjvjItq7krEUM0miaU=;
 b=w7oawQe3osJip1nZGfAiwO7tM76jjAAlz9M4TpQ2QArkPLE/H9h7G5L6SS31+eGsw0oFaQBhE
 r2e4hoV8jjfAHVR7ol/YoKHXHr31oodcxOrGOZ2PWb1Gm++WzhCJnkG
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00006E25:EE_|PH7PR12MB5999:EE_
X-MS-Office365-Filtering-Correlation-Id: c84c89e3-cf96-4a9c-29e5-08df35c25d10
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|35950700016|61400799027|48200799018|82310400026|376014|7416014|7093399015|11063799006|56012099006|261021123027099003|261021135927099003|261009223027099003|10067099003|261021121427099003|18002099003|22082099003|16102099003|20046099003|4128699003;
X-Microsoft-Antispam-Message-Info: tOLCYXpuNz21Wskh2+pBno8Vuh7p9RUgo1cV47eGUW6gGT5S+kMMl4K09v2ZqU8qnk+ynR85S7RJ/gwB75fR9FweCeBlshdhKy/+GWOcqTARK8oOqkDdcSzWepSzd0Pf2RSlcZAAcaMHv2Y7iEo8RkoMt4yyMNlCDFn3b/oJXpHTYry2hAo44+FNIA6SLg7rbHNbZGrurx3K6rG+hqRbLoZ9AvIjd+t665IM3HFEYSVwHiOG2Q0/akhAwQ0dm0W7WbJOCZXu+c3QwPL7T7S06G9YW0d4v8oFhcDFARpgGVkJG8Q7S3RgdgHQDuOhg8tTzE1dGQnAWEZQ+KV9Q31ddINtJZVIVtnWk1ES+i8DLIX2DWW4UVS9pswdtpeGqLE7aIPeoyYVhnUjrvy8Oz+JH+YU8YHPlngkAFSP/QNDU4akFnl/QuCo8g3n9e1eKtJWKDrspocJCarHgF4KyjkI6dQAxuXpcF2obsYPmMkTBXCBNtiucJe7pRFBmNVme/Hah5ueWkHzbm1PPRikjaxPkgceyL7cQzMVKH3C7czyKy+8aMw7AIsRZG0vwutGOSrkmf5eclW520J4l1iLZJJrwacVDNQ6bvEPSCLejwH4VYN1Lo/92v5+QANXixpXlVtfzl0CUZEt4YagXAzhmtCJUvIzt0oyNMQCZ8W2exOfWK2ytgnbRSd46wOPGiixQu5CEGvfxhgzMxuCCZ+7mGPM3w==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35950700016)(61400799027)(48200799018)(82310400026)(376014)(7416014)(7093399015)(11063799006)(56012099006)(261021123027099003)(261021135927099003)(261009223027099003)(10067099003)(261021121427099003)(18002099003)(22082099003)(16102099003)(20046099003)(4128699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wiYaEp+ZXSOeyiS9arLv4MWej6VnWqQ+j+G2xCTCb8kt49+gaDbduLRSBTKXMqSWrfNEGriJZseFfC21SLvhwnfJD1Jh9ODr2BG+HuIUUDF+Gr/u38BNcTLs5/Rz2sM0ySeBbsw9dSyLWnK+7s2029Ja7P3V6VjK2G+ZnFIxd0klOfwczIdrpxf1wg74nC7PZ+pw5AYYQIKBbpSw+XBKvkFXPWM5aG3PF2DtqHok185xGjNE6whgxdDDJw9fPq9aZGWHgn7dy6JtDPhehPOCd4uuGguXRQ4J11Z3s1mw3YxA1sioUBg8tC7DytaVZL/5qo0Zns/SVL2MdHfxA8Blbbu+wwM2khwSfKCbNg/0CZFYPkpbPROrNlFXGLTq1+B3gf+8V3zMq/7GllQUcPQ/cfpGzyO4SW4JGydPzdL4RmGfQsvkI/G0kTk33Qpw3qwv
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 13:41:41.0362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c84c89e3-cf96-4a9c-29e5-08df35c25d10
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00006E25.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5999
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_064152_162957_2A1B9CE6 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 1.0 (+)
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Andy Chung <Andy.Chung@amd.com>

Add the mctp-controller property to enable frontend NIC management
via PLDM over MCTP.
Also add EEPROM device for NIC FRU and reorder the I2C virtual bus
index accroding to the system silkscreen index.

Signed-off-by: Andy Chung <Andy.Chung@amd.com>
---
 .../aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi   | 137 +++++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
index 3ea5d67865d4..ab16e5ad5871 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
@@ -2,6 +2,25 @@
 
 #include "aspeed-bmc-facebook-anacapa-evt1.dtsi"
 
+&{/aliases} {
+	i2c36 = &i2c11mux0ch5;
+	i2c37 = &i2c11mux0ch6;
+	i2c38 = &i2c11mux0ch7;
+	i2c39 = &i2c11mux0ch0;
+	i2c40 = &i2c11mux0ch1;
+	i2c41 = &i2c11mux0ch2;
+	i2c42 = &i2c11mux0ch3;
+	i2c43 = &i2c11mux0ch4;
+	i2c44 = &i2c10mux0ch1;
+	i2c45 = &i2c10mux0ch2;
+	i2c46 = &i2c10mux0ch3;
+	i2c47 = &i2c10mux0ch4;
+	i2c48 = &i2c10mux0ch5;
+	i2c49 = &i2c10mux0ch6;
+	i2c50 = &i2c10mux0ch7;
+	i2c51 = &i2c10mux0ch0;
+};
+
 // MB - PDB
 &i2c8 {
 	i2c-mux@72 {
@@ -50,6 +69,124 @@ eeprom@51 {
 	};
 };
 
+// R Bridge Board
+&i2c10 {
+	multi-master;
+
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
+	i2c-mux@71 {
+		/delete-property/ i2c-mux-idle-disconnect;
+
+		i2c10mux0ch1: i2c@1 {
+			mctp-controller;
+			// BE NIC FRU
+
+			eeprom@50 {
+				compatible = "atmel,24c32";
+				reg = <0x50>;
+			};
+		};
+
+		i2c10mux0ch2: i2c@2 {
+			mctp-controller;
+			// BE NIC FRU
+
+			eeprom@50 {
+				compatible = "atmel,24c32";
+				reg = <0x50>;
+			};
+		};
+
+		i2c10mux0ch3: i2c@3 {
+			mctp-controller;
+			// BE NIC FRU
+
+			eeprom@50 {
+				compatible = "atmel,24c32";
+				reg = <0x50>;
+			};
+		};
+
+		i2c10mux0ch4: i2c@4 {
+			mctp-controller;
+			// BE NIC FRU
+
+			eeprom@50 {
+				compatible = "atmel,24c32";
+				reg = <0x50>;
+			};
+		};
+	};
+};
+
+// L Bridge Board
+&i2c11 {
+	multi-master;
+
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
+
+	i2c-mux@71 {
+		/delete-property/ i2c-mux-idle-disconnect;
+
+		i2c11mux0ch0: i2c@0 {
+			mctp-controller;
+			// FE NIC FRU
+
+			eeprom@50 {
+				compatible = "atmel,24c32";
+				reg = <0x50>;
+			};
+		};
+
+		i2c11mux0ch1: i2c@1 {
+			mctp-controller;
+			// BE NIC FRU
+
+			eeprom@50 {
+				compatible = "atmel,24c32";
+				reg = <0x50>;
+			};
+		};
+
+		i2c11mux0ch2: i2c@2 {
+			mctp-controller;
+			// BE NIC FRU
+
+			eeprom@50 {
+				compatible = "atmel,24c32";
+				reg = <0x50>;
+			};
+		};
+
+		i2c11mux0ch3: i2c@3 {
+			mctp-controller;
+			// BE NIC FRU
+
+			eeprom@50 {
+				compatible = "atmel,24c32";
+				reg = <0x50>;
+			};
+		};
+
+		i2c11mux0ch4: i2c@4 {
+			mctp-controller;
+			// BE NIC FRU
+
+			eeprom@50 {
+				compatible = "atmel,24c32";
+				reg = <0x50>;
+			};
+		};
+	};
+};
+
 // MB
 &i2c13 {
 	i2c-mux@70 {

-- 
2.34.1


