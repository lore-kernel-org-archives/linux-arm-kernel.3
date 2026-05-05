Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C121FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 11:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BD5N0btH1cf6wfiHbxvxG5xUT8OpVUAUfde85QkRyV0=; b=uX/k/TdV2NINvk4YH8I0QGCgcS
	iQoJlKXwh0pH9Oj42n299MiMx9rZEcjQLmxD4JNy4sgmgbw8GeWS9QQ7PZVjJLCYWLjigrASj8Xjp
	vf8Icy4IpDhKaD8way12Olfn4681VuA8UIKksaZce8DUiW+yIEuvr+siCtIIBy6l7EIQM4psNkg9o
	FVDmjgyGnEFRTTev3a/RXt04eq3PsNoUdUlCX462Pi9IUzib+9UCkktU4uyG8TL6wiCskHfv6i1AW
	7PEIhSw321m78MiMQLoZKJ6Rp5UQMA8bNneM8VNmRXgjLUsvxQpOE4KoAphmseb24gzW0cgwR8V2u
	9zd7p74w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDam-0000000FzrG-0hfQ;
	Tue, 05 May 2026 11:05:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDak-0000000Fzq5-3EnQ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 11:05:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BD5N0btH1cf6wfiHbxvxG5xUT8OpVUAUfde85QkRyV0=; b=oaIILbSVlRUYLX/adiLwei0Tiq
	Ar52viZoTnYk/JnUM99V/fTZsR7nX2+Etv6nWaopSEdewsXSRwJfTsRKMlcGeaaL61FP0pWyeOQ3b
	GJ3M3+C96J9u+lW2rM5wgo+zY2Wrk00xv/3+m63PsHn8xvf3btD5rux6OBAxqQ7pPbBWteEuINHTF
	8XLM1ehMYJ9wwACNcddclvbFfF2XGik/ZlbL9Hurz6vy4eN+tID/N81eeBpAPtG1/ffDrSHN4d3jf
	sCYN9CzR5RzWwy/mUjAhFyLsIQDpJbaXLxMfTzlNcyOIPMz7xpW7DYkpohEuN+/JYK/TtWZAh8cUC
	8NucESDw==;
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDah-0000000DJ0R-2iDS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 11:05:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQf+R9WzFmWKbE991qgLvUw9biM3IqT9KWald2uWjStZX+l2UO3d0mHFPFolxEnVzRQoeSRpaNbhcyaWd522mbvTlxV7rBDSOP7OfJPMRQioSeIkbWtqRuEbUiPvElj1an8m6iJP5PfkmX7LR3QJif+BsNcg7eyAbp4OIWfwBaG2E5oIPH6xdIbDF9EHfen4hCGbfHMH+iEPWspE5F88I6xdZSt3qiGyT+Lm//th2Jgrk1kdYi6RGftzGq5+PCZCrx7A+DhVE7ecKet307CKxu2DQlgBJV1uWMgnTjHz3lKw8DH798QPT6vX8wJ90hBhm0L8uq1rW8aDARU/ps0ACQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BD5N0btH1cf6wfiHbxvxG5xUT8OpVUAUfde85QkRyV0=;
 b=fw27ZEQQcDOA0kOWLjzhjEfvyBzSOafoY1szgIDDICnIuhYbWLPRGuAqHwlkCUUx5aA/s3EUwMKuewLDF+/FU5HTOZoVej49tf3tL6vYNpL820XM7ehYqreRqtsYChxAN2aGoZZL6UPCgi6UnEPoGT+e+D9zCeNHgDv+ODmU+5qPqmAN5+eQ9y2xUe0vza/xcri+BG9m1fnXMoDu8ylKMBgRZueQF0s/IoDHhMEIM8p46NhF6PxKosS5PFvVYKPPzHUpGUP3tZUElhbblxfs3ZQjl1aGNSMsw51zPZ2j/xGYyjRoPqorJxjSnnwZJMkuxeNUXJEzhTqHntmV8HYQcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BD5N0btH1cf6wfiHbxvxG5xUT8OpVUAUfde85QkRyV0=;
 b=hyK5tr9bMyszrqf7rAyd8IFAls0Y/m8ATseobHMAzqHwoSiD6pNHzWxbfbBcDO6mYLjJIueigOpUdZdTTumse3Cd/QKhpnbxRKaf3zv4Kzj788WdDlcqpN3xpLRYnkJ2ED30hCBo1WFpCgnSf5Mq5MqMbdd46W9MoYPIwTjra3U=
Received: from DS7PR03CA0012.namprd03.prod.outlook.com (2603:10b6:5:3b8::17)
 by PH7PR10MB6625.namprd10.prod.outlook.com (2603:10b6:510:208::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 11:05:20 +0000
Received: from DS2PEPF00003441.namprd04.prod.outlook.com
 (2603:10b6:5:3b8:cafe::39) by DS7PR03CA0012.outlook.office365.com
 (2603:10b6:5:3b8::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 11:05:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF00003441.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 11:05:18 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:05:18 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 06:05:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 06:05:17 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645B49h82831834;
	Tue, 5 May 2026 06:05:11 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <josua@solid-run.com>,
	<w.egorov@phytec.de>, <matthias.schiffer@ew.tq-group.com>,
	<d.haller@phytec.de>, <francesco.dolcini@toradex.com>,
	<joao.goncalves@toradex.com>, <emanuele.ghidoli@toradex.com>,
	<ernest.vanhoecke@toradex.com>, <rogerq@kernel.org>, <eballetb@redhat.com>,
	<robertcnelson@gmail.com>, <afd@ti.com>, <u-kumar1@ti.com>
CC: <stable@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<luis.parga@ti.com>, <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH 09/13] arm64: dts: ti: k3-j721e-beagleboneai64: fix USB clocking for compliance
Date: Tue, 5 May 2026 16:36:10 +0530
Message-ID: <20260505110631.1144200-10-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260505110631.1144200-1-s-vadapalli@ti.com>
References: <20260505110631.1144200-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003441:EE_|PH7PR10MB6625:EE_
X-MS-Office365-Filtering-Correlation-Id: 74286c15-6a4d-4101-16ef-08deaa9631a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|7416014|36860700016|376014|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 8bsCOnlMqrlTVrIgZpZT5/9TGPkm8LwrAxte9k1SdIpatuxAIoYJWNPyg9cCc9me/paMs4gaDb6UwXhNjZ76ga3Upv6R6DGLADzPP+OLtZpjsnm2MJZRxHR95etC7g6Wnf54zabjGMicQswek9ILtc4Z5L+5ECVRfxV5ZrUn6zE4TLQ8lqsRQdvQXcBZ+EfirxbK4vw75qbV9NNep8RttnnTr9yJ2ldkQLaAD0I7OqGc+pD7sM0WCkbADWJya5xWbo5EcSLegNalu2l2alD0HxlOMKpW+ttaKsoOFv+Fb50pPNPelr19kJ1ocA282mZAnGHMYmzm69smTxZi5dsMXkWUXRbpB6P1VZX+AyEal1H+E8wx37IyR3kAs7dn+IcnhbYt5QP/ofG7NrFzGOhXKHs46b5CHnHX8sA5SnAnALlWQIqP5PqPJB305vaWyHQiLuQ9n1rXo2ouA/bJfteclG0GyJUvbSKuyKcJzpUjcan/pvtXryzMADDEt0HQta9G8g2pqEQP9xD52B451Wm/sFW+fWE3xjrCWsWXYGw3k5veDv/LvHHzIchuSPM+tDvGIyWXOMg9bU8vpWrZy4bg2Apy5gNDjGqzFqWRMqHBAu0a27edBBBWAGbWRwDTbTI6F/CSEkzBgJr4XWgr1zpjZ8pY8vOV7u7AQAouZt8WXbMp6RJ2R1C6JPEdZIvAgHOVR+StkHPkiBxhI4V+uFy8OhJxzmOnPTL8Frde2kmUzT5Gq+/Z6Ya9Q5zPlghcL/gPYvAlgJHe9La31c9wCoxvUg==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(36860700016)(376014)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tVjAfJsCDOrcXsIQfwerL7bubogZUeydOLleM+4GrxKlGyvPAGnE5RJaAkuL3kjGNEk6kWefyax1aKWP1RCUuwwA28bYIFpAQpXuEq2EpqWrXzDB3sDsHlyx0znmNIGaB58XMSg5XT8Wz6Dx2We6PhTaFkYofS+/nqDoGB1aMjp/cVJa1R/gDM0bDzSpIB34b8ChHUvKPnBwxJsQwYuWvrJlBu0M53ck5zQx2205rdkZxRPsljLTJF64IYYQ3HtRfXjpZ8KOQMhZdaFL+WDy3DfXZFI7f/3egnBm2nP9VMjwuhHiamvXunrY2khxeeysmvATaFDynrf0da1xxHx3MtQFm2EsZUshMttpOxBGIop0eVsNQWH9BelEuq/vJLLqTyl0kG1UGFtGGAiJ/dk4Ci4tcszE7S3blkgPCJXgB2ush/X0ga1CyFLsuk/XUlBx
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 11:05:18.7125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74286c15-6a4d-4101-16ef-08deaa9631a9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003441.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6625
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_120527_774625_20696835 
X-CRM114-Status: UNSURE (   9.78  )
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

According to section "6.5.3 Normative Spread Spectrum Clocking (SSC)" of
the USB 3.2 Specification, SSC should be enabled by default. This protects
against EMI violations. Hence, enable internal SSC for USB SuperSpeed.

Fixes: fae14a1cb8dd ("arm64: dts: ti: Add k3-j721e-beagleboneai64")
Cc: <stable@vger.kernel.org>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
 .../arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
index 8040b6528c18..1e87c6cf146a 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
@@ -578,6 +578,11 @@ &serdes_ln_ctrl {
 &serdes_wiz3 {
 	typec-dir-gpios = <&main_gpio1 3 GPIO_ACTIVE_LOW>;
 	typec-dir-debounce-ms = <700>;	/* TUSB321, tCCB_DEFAULT 133 ms */
+	ti,core-clk-sel = <1>;  /* Select internal reference clock */
+	ti,ssc-enable; /* Enable SSC */
+	ti,ssc-type = <1>; /* 1 for Downspread */
+	ti,ssc-frequency-hz = <33000>; /* 33 KHz */
+	ti,ssc-depth-per-mil = <5>; /* 0.5% depth */
 };
 
 &serdes3 {
@@ -586,6 +591,7 @@ serdes3_usb_link: phy@0 {
 		cdns,num-lanes = <2>;
 		#phy-cells = <0>;
 		cdns,phy-type = <PHY_TYPE_USB3>;
+		cdns,ssc-mode = <2>; /* 2 for internal SSC */
 		resets = <&serdes_wiz3 1>, <&serdes_wiz3 2>;
 	};
 };
@@ -621,12 +627,21 @@ &usb0 {
 	phy-names = "cdns3,usb3-phy";
 };
 
+&serdes_wiz2 {
+	ti,core-clk-sel = <1>;  /* Select internal reference clock */
+	ti,ssc-enable; /* Enable SSC */
+	ti,ssc-type = <1>; /* 1 for Downspread */
+	ti,ssc-frequency-hz = <33000>; /* 33 KHz */
+	ti,ssc-depth-per-mil = <5>; /* 0.5% depth */
+};
+
 &serdes2 {
 	serdes2_usb_link: phy@1 {
 		reg = <1>;
 		cdns,num-lanes = <1>;
 		#phy-cells = <0>;
 		cdns,phy-type = <PHY_TYPE_USB3>;
+		cdns,ssc-mode = <2>; /* 2 for internal SSC */
 		resets = <&serdes_wiz2 2>;
 	};
 };
-- 
2.51.1


