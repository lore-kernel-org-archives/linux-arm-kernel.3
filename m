Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC11D35162
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 11:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CLqsjdzmuooo7CLedHC7AqpuPSTNFUGZmAR0YC8RY7s=; b=knHIEHTP908MuK434D22ZYxSE3
	u4yZrR2PTlFHIKkZogeVXwVVyWtcgh1Gi6Ffzkx1T5UjMPJ1VtFtOXEbBZCkALXU3jP3E3vLEpZBQ
	IpcK9AxujHELg42frsJCeFtLF2hoGePfMW0NnVW3Wn0r1e/WwzxSM7r/KtlOsQzz6J33sDuAYT8Hz
	H5UtuDoNNHZon0mxt4wZGYmtujibqReHUYIjuLUlWyh7Y1E05F3nXj++wOTMP33OTX7FVPFcfXA0e
	K+JahEqQeNKFQZ8/5NWrjAhxi3cWutmysFhpQAlf1TygfmBe42roevqml1gVaIGrv6DnZ+O5RaME0
	Fw+7TgqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tfR-0000000EdEw-0IV6;
	Wed, 01 Apr 2026 11:23:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tfQ-0000000EdEe-35sc
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 11:23:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CLqsjdzmuooo7CLedHC7AqpuPSTNFUGZmAR0YC8RY7s=; b=gFC8WRzfiV4el4dFIO5KY54I1d
	7iWeG1VbomfUAMsA8ncn0RqWOEnxOvKPNEI6K0R+8vEG3iJtARN1ltuU/360X3tfCUVJoGcGu4f/B
	UNJXrTOF3CNzofZV0zitjDDaJ3P+uczHkTno06QKQD1wBGp5J2Zh8reZCnrVGBhgSe5oxYb7jka8S
	i0P972vsT77gtFgD7nKNyCBnZqBoj+ZfutGEwXU77VzxQekKk5+qycngD24jh2c+df+ziT5PljQ/w
	pCbp7HLVojAnmDLWokPv5JwGX15czjFPz7/xyH9mzA0SDKRnaB9HD1X5awXPFcOsZyXDgaLXHjmjN
	lTXdf06Q==;
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tfN-00000000BOR-11m4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 11:23:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X6YEIYN0np7M4zv1hwdWl2WbTZK1nu4QiM7nMQKdd5IkYqSuMltfqzBYK0AWfYMNqdCvwHvkvCICbLGM5XfkmI71tlfY0raA4AVbmVA+3KyixNOU5RH8CTtWi7R47BvOfUHwD2CGbmtmgS/SZaH4h+0atoK2t7O6wsHBUk7lTDyXdemaZjq7WRugfIss5OJsoHT6lO2KFRu6PGAmDk2686p+FYuWVfAyEpFLss9cMf9yEDsmrfKjQJNfhLqBSlA01CeLAjvy26aHNxJVVYLbnoAfdJiHHjUicEzsdmLuOFwa4zlKWW47qpQ91vaasVj1G1oDBHWsOlVYPKjQZVR3pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLqsjdzmuooo7CLedHC7AqpuPSTNFUGZmAR0YC8RY7s=;
 b=b4lbvLZHqxI+Wo7yUnzp8afpUuYsPBL1XwqvsOc/mtQZPhL1+Z1/i/hsJ9cGQdv+7S0ILBszJZbuHd3mRZWfAHhC8gz9NYs0LbsRWT2Ojvvib7FPWRQqf5JBoW1HkaKJo4sXALmMbBGH+upPtEElNdB7ZBK3yAXtItzfKA5MrC3xN4JY3Kz7wtz3MStLWYnnWrIQyaI0uLWgHSzJOdT31g2dQqtmYCyxFzjNXgXlYGL2eH+hkMo9dB4GEQwN4WMZ42kXbfnw2ROKFM+r/IrOONxJLHOvOIcGy/0NISz4kC/ekLckT66MmlXS9kBUOe66Ay+6CyScINAh9YFXLyjhfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CLqsjdzmuooo7CLedHC7AqpuPSTNFUGZmAR0YC8RY7s=;
 b=cJJw3huQ5gG3r33kQ228wsULnDp4MXy71kDtzmoeTE9qvUiv1Fve7zgPheLimPz1HFwDkNdxDeshZdryDSCf2qiHvomE+8dWkt0m8LqFYKa3G10M2OqMzyQ2qG+jO7QbZjjMBiyTvcZOkJGkOzHeiyhhSkE8v9w2HZGIjwuzGdE=
Received: from PH8P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::8)
 by SA2PR10MB4810.namprd10.prod.outlook.com (2603:10b6:806:11c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 1 Apr
 2026 11:23:15 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:510:348:cafe::c4) by PH8P220CA0027.outlook.office365.com
 (2603:10b6:510:348::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.30 via Frontend Transport; Wed,
 1 Apr 2026 11:23:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 1 Apr 2026 11:23:14 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 06:23:13 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Apr
 2026 06:23:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 1 Apr 2026 06:23:13 -0500
Received: from akashdeep-HP-Z2-Tower-G5-Workstation.dhcp.ti.com (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.91])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 631BMxFF4170925;
	Wed, 1 Apr 2026 06:23:07 -0500
From: Akashdeep Kaur <a-kaur@ti.com>
To: <lee@kernel.org>, <praneeth@ti.com>, <nm@ti.com>, <afd@ti.com>,
	<vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aaro.koskinen@iki.fi>,
	<andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
	<tony@atomide.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-omap@vger.kernel.org>, <s-ramamoorthy@ti.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>, <d-gole@ti.com>,
	<k-willis@ti.com>, <a-kaur@ti.com>
Subject: [PATCH v3 1/2] arm64: dts: ti: k3-am62-lp-sk: Add system-power-controller
Date: Wed, 1 Apr 2026 16:52:56 +0530
Message-ID: <20260401112257.1248437-2-a-kaur@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260401112257.1248437-1-a-kaur@ti.com>
References: <20260401112257.1248437-1-a-kaur@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|SA2PR10MB4810:EE_
X-MS-Office365-Filtering-Correlation-Id: 2768c8cc-1451-4288-c25e-08de8fe1109a
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|7416014|82310400026|1800799024|22082099003|921020|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: jFplZudBKYdfg/1e0+ciRGQCThEQ21TFEkykxmZYYunayLxNrIOZxjbHAtGOLVuK9ORclqMUS1vjE06BmwAPKkGWMDdJ8Pk/u3euDlpv0t3DlB0eUKgqGBYdnpZmLaBU9kV0o/Yt87alAzFBHRW2l+FjKOEks6rD9n2Bn683wWw+tkrmbuXkwpjMQh+hxlrjnAwLgFBtxSelk8Ikp+yjqruikMbZTMFSf2+h4TkjKh/iRR+/7JFiu20tb27pm3diy6yfnYogiv+r2xmhACmf0yCZ+/aobmXZksyeQR/A6vPh+eCCfp/kWKWLBT+q5R8dp9QIHLd1EHoEDXijQWARuEnQl0fA1NVwDAb1HzAXSMvPpA+EegpRXF9KTqPLheEj6GYwKEc1F3KYcIqLKsEFV5/NgYXLXLjNWOCqgr+XrqxGd+jYikpAwhQsLI9GkcKCPvZop8MDLAl+KrLxU+pauodfbxhpktVClWWeYvKs1hoAxcUlLuZVtfFiE4pfCE0kKLo3MP3+j6gQyu+Dr7spHV7x5QOLtl5UiWeX8Uph9ooq69+lX3NXNOeKwduzfRHPBsOT5LmZFz6OxM11nr6txqPM+BXU5xwi/Vm3StjRIRrjUtXWxO/AjRj0tKPp7xwCI8E+RP0Mtv+U/rV4bzq14B0/Sdd1qHG6LyCMW+5SvplW7rX0dNLtHOpWaq5v0Pg4ePzzEhI9f+ITsrHz2Y+/Vo610v750ZD+E3Ym9yBAphLfneZGasXlzxyWEZttIH6YYYWcgHq2QRMcTMpdy0GezX2fx5hYasY/+63PDhZtd9fGmltM9EIBR16iufbvBQfb
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(7416014)(82310400026)(1800799024)(22082099003)(921020)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zRLzdTGH67JDARXMHwbRR6pNsq4I5IFbme+hyiKoRwYT45NV4dSal/o1og+FGweL0eMZWFM18ejlddLsBwJLux28ZVH6JiSESBo6loazB5pqOIg7lU7DeLNJCZfaTJqVmq2Hin/7GpeytIGwKdZ4aFptLengYtrEPVZupaLghznvjzDsEVfm0WW8B7Tt9/D9NhpFgslNCh9iWRZ6rEFkhwrsLlVTtNb6GaVn3RfNdWRkiO3Ql8YupeJEesv22LtDNHYcEGUDQeG9vZ3wc3NMGBdBXq3Y/djfXpX1gH9WFYl/0adwHHAFVwZP3ylR0SKTrg3JmrkbrzBQdSxR9wJdW8TDhpeQ19k2v72y3qQCri2k3awmfziHJjCybkx3hZRjmmgscvSp1YWYB14k2zlUxJfrtS4+TJOXMpcs4bOvMKSxpS8StIATNzuK1qdOHWq9
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 11:23:14.1277
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2768c8cc-1451-4288-c25e-08de8fe1109a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4810
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_122321_354412_4B5C8C38 
X-CRM114-Status: GOOD (  10.73  )
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

On AM62-LP-SK, the TPS65219 PMIC is the system power controller
responsible for handling system poweroff. Add the "system-power-controller"
property to the PMIC node to explicitly designate it as such.

Among all in-tree device trees using the TPS65219 PMIC (verified via
compatible string), AM62-LP-SK was the only one missing this property.
This patch corrects that omission.

This property will be used by the PMIC driver to conditionally register
the poweroff handler, ensuring only the designated power controller
registers for system poweroff operations.

Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
index 3e2d8f669535..786a7d695b33 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
@@ -206,6 +206,7 @@ tps65219: pmic@30 {
 
 		interrupt-parent = <&gic500>;
 		interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
+		system-power-controller;
 
 		regulators {
 			buck1_reg: buck1 {
-- 
2.34.1


