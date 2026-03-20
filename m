Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F241099B40
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 21:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vyShTBAvT7/nddGD2A/ZSH0OoPuj0AQCqUrdY7p3qA=; b=emhWlYYd1qAfotVGBiPr6bC41F
	W0iWfNHLWcxJrS48L3heJEdSa5j2kKakddAmQ/Nah3dLPVmueEHjMEnX1WaNqJq7r1p85grenPIUo
	B9djoJCQ+VEkLsYaJyRQmdJQl+Z4LYTgEMJ62o+61+DelgrOpUEiODw/p6Q2oG2iuTg98TikcW8+b
	Nag4OZBopGpYX6AMVhGI6gR4fKR1HyBhJbj3084coUL+t9xlZBtsT/OqVyBsTPEyQoiATtoWTWIwr
	c9IGS2/mQEduAMetpuKNzzj51Ep98ZGr8M82j3bIs0UflTTycywJQnxWydMfgK6sXJnktbu2Kx964
	HIOcDRQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hM0-0000000DczS-3qn6;
	Fri, 20 Mar 2026 21:26:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hLz-0000000DczG-3nxJ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 21:26:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4vyShTBAvT7/nddGD2A/ZSH0OoPuj0AQCqUrdY7p3qA=; b=ZLuI2c7y+XoCW7WqLYyW+grEw1
	CcqlAW3g2Gd8F40ZoNRUveOe1ezHBxNKN2UZbjGNQHkWOSVwRQNL4Dbi3HcYZ29eBY1G6tPEjDRNJ
	lDSlzifF3Yl8LjkXgg/85hF7zw4aWPAb8fZI8DrRw7OYY5GbGfxBfBTE5tBT3N9Gqx0FPMGZsIAW0
	orhQVSwM+aD7M+b8c5AXKE+LHw0nU6n0ISxP4zRmQ9OiVS6da0pQPYoBupR2T8JfUo9clf/OyvpOj
	K+GP/pfhEmu33T2dFcUtCCzp6QjwFj4G5DegqlZXHAochvaWrZtI3rziSMBeCIa3vt801HdhmBx5J
	eAfta84Q==;
Received: from mail-swedencentralazon11023113.outbound.protection.outlook.com ([52.101.83.113] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3hKS-0000000GVPY-1x7V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 21:25:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zt/MoxjofnDFIDQHEBbTpVpbrKGjj+SzGqXREVKWzHTa85EO8oxCJO8GmtZ6HjufXaYxj+aMCEZMvvr0ITeAcfnovoOut27N7jPDjzUHQQblWsiuG4bem7ZMg2xs8k44MhPH4EXhkz7QwGPtUa627kAMV58aGf1jXFl/+ctSw9st6tp2xhrkZDnGb578Uv7Z6ljfGEWXJ72lvcbN2DX7UZvyt0/sGvENzs76gpBjZThIz+GRABUt9hH0ySR00b7ppLJCXtN13Z6+hXxmieXhJh1+hyVaKPWc+aapTzbql+Btr0nib2TWobQHSiiGsgH6xV+wvZhU3WrRqiGBdlPnuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vyShTBAvT7/nddGD2A/ZSH0OoPuj0AQCqUrdY7p3qA=;
 b=h4wmWLwiuDqaz15jXwOki/msOqzKZLEzZKc5oW0L5k7uhFeTkqGid5iMhXdW7/Vu1XlouHYIXjSyz0y3z7DTzOpwRcj6jhyLWFiEsE0WAtHJe2IHqPIgEwRziP3yBH1+yEqloHSYNnyRKNpSHevVfgkUX8Xwp6Qd4P286LX1yNEy0T/I7EzTN0MnK45FLZ6ySTr+p1/Oo2QDsvggE128HgwxspSLjs6CvpPe7qdsvRUTasiIfxsVewWbmV9Bo/PGlqvMOmemme6vTOJSff3f/bZFT1QLcT0M8eYvs85QEiU0fdpki6qmw/E2cXf/tGWiVOPeRM2mVm8cohra//aMUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vyShTBAvT7/nddGD2A/ZSH0OoPuj0AQCqUrdY7p3qA=;
 b=D+X2KT9/u1VPMukRlIJhKKLGopTKHxqlhNJNyQlx574VYARnQHoHeDN/UGMfhNbF+pXcQ7ImWb5ObHzOABbBIPbpImn1feWIIfpbMvvOkp7q+iNa4dmyiMO3Pj6bsQVaNyTtamtrcDI0uGkRJuqk/jPAUZpG9OQwgoXM83O3qSFXte3jwvJfV2I3nc1mFAJ9QaHNFQ/Pf+1TtA/Ezhw8D77Uf3qkp5bQHxnN8TS+TaJLgVetUdYdOIz8r6Y5k1GQQLlAqi3QlFnPMTqGHYeSVvt8I6MeXmIl94KqW33LWciUTiUkako/v7wvDI4/84kAsI0wGzvxx+cpemK2w+x5iw==
Received: from AM5PR1001CA0017.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::30)
 by PR3P195MB1023.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:97::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.13; Fri, 20 Mar
 2026 21:24:17 +0000
Received: from AMS0EPF00000194.eurprd05.prod.outlook.com
 (2603:10a6:206:2:cafe::7e) by AM5PR1001CA0017.outlook.office365.com
 (2603:10a6:206:2::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.22 via Frontend Transport; Fri,
 20 Mar 2026 21:24:16 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF00000194.mail.protection.outlook.com (10.167.16.214) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 21:24:16 +0000
Received: from lws-haller-privat.attlocal.net (172.25.39.212) by
 Postix.phytec.de (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 20 Mar
 2026 22:24:11 +0100
From: Dominik Haller <d.haller@phytec.de>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>, "Dominik
 Haller" <d.haller@phytec.de>
Subject: [PATCH v4 2/5] arm64: dts: ti: k3-am68-phycore-som: Add DSI->LVDS bridge
Date: Fri, 20 Mar 2026 14:23:43 -0700
Message-ID: <20260320212349.420951-3-d.haller@phytec.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320212349.420951-1-d.haller@phytec.de>
References: <20260320212349.420951-1-d.haller@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.212]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000194:EE_|PR3P195MB1023:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b47f567-656c-424c-533f-08de86c70aaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: /4s7CZWwRPj46bHsqicS9e5ncglkFnG6cB9t6GZGgSybo4ArdVX4Dk6BquyOglXaOrsZC05ksWCtrpxzwu3Op6sqCQ7Jkh+ruqDx/uEDEgztcx89+lpuW34nu2nIdMjJvATHth0vc5vD4eEhMH+Uu05U5tBp9Wup+JqIK1wWlGLk/Hb9RApuT1OmN01G3HtNYpox3dFena7a57XID9SkXq8B+j/q/NKzFJ0oF7IqUxF+m04dehK4dzWZLPLPgLjLSkotkD1O4PbjSLH3kNLgw1GYeKNxN0CqYOQ1iQgBPKeYwJ8yNuV1peShu690i3Enn1xXzSacDTD18sjZ51fYb1msMM60Hx5wNAtzucxn0oGTihs2KaokCVV+JMyKRq58P2uECRiTb16Ii9pGi0P7OWhunh+4LGLIlUZdsQ/+pcM7dXg6MZv9HRRo/BPYCstLCIaLP+90Hs7OdD3U/3TQ+ZCGjX1JJZ2NOco+2DOdDNG8rwo+0nqag9A5g1qvr1Ac7N/mp7ySaWZ2ptIKk3XuX5z2E2J5kYCSuSE4es5w22dGm29FCBERXUFsE+/3XDq+Q47KrA02XRHnohnW5siOw4Df+PQAky7yYBop6yWNufSupTcZUVvQ6Boso4FpgylZsEyt6y78tI81RZNYQRr4YAdE7iaILvKYqaI6/76L2QDQVKthKEUR4TU/h3S3G5kxV/VV6t+DzqWjAeqTxfIVvV7ut7IuhH5FbKgYcP82Kf53HJJMv8Z1u3Sp8WxRvM9ShCrAhnMfLB9KVSFccwPEgA==
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0P0kV22l+eUiMkfIZBb6WRm1SUeYpAmPOZl/4fXVZzkSrG0ye5gNbdn7f/1C0qRnAuHbq9lNTXfhin4ZfwtY6fgG9dm+iLMoXZhKE72R+nC4pv/Ib+ppSM6kP1eP+EcZ3G0ayS1loCGNZ+UhSTpuhQUT+cba3jgfBpyukMjUpU9PIaifelU5p5TmdtRgySTOPV/o0xhhiRQ7Oe2kZYQmKZhI5PYlXJkj0PfrlzYrS2uJHbm7YiaeRhAINbGvkVgzCeKo0hTwUJg0twdmoE6RjGlwj7ZaAytYqpafbRVr1QDPh1calnJjtbGsGCrV2vgw2ig8QoeggW8IYWSxjb5ltYz0q6c8T0UvJ0/g1I+AFiVjrXP1AUIf5JOUV/9xoA13XDkJa9JkGYwFsBtH7XWOcnPDW69X1dNgFMG2WCTEsHmc66+VB+h+2Jc+RzCegpX0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 21:24:16.8639
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b47f567-656c-424c-533f-08de86c70aaf
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P195MB1023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_212430_150855_F4BAAF0F 
X-CRM114-Status: UNSURE (   8.94  )
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

Add the TI SN65DSI83 MIPI-DSI->LVDS bridge that can be populated on the
phyCORE-AM68x/TDA4x.

Signed-off-by: Dominik Haller <d.haller@phytec.de>
---
 arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi
index 0ff511028f81..ab87767419fe 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi
@@ -151,6 +151,12 @@ J721S2_WKUP_IOPAD(0x09c, PIN_INPUT_PULLUP, 0) /* (H27) WKUP_I2C0_SDA */
 		>;
 		bootph-all;
 	};
+
+	wkup_sn65dsi83_pins_default: wkup-sn65dsi83-default-pins {
+		pinctrl-single,pins = <
+			J721S2_WKUP_IOPAD(0x084, PIN_OUTPUT, 7) /* (F25) WKUP_GPIO0_11 */
+		>;
+	};
 };
 
 &main_cpsw {
@@ -183,6 +189,17 @@ &main_i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_i2c0_pins_default>;
 
+	sn65dsi83: bridge@2d {
+		compatible = "ti,sn65dsi83";
+		reg = <0x2d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&wkup_sn65dsi83_pins_default>;
+		enable-gpios = <&wkup_gpio0 11 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&bucka4>;
+		/* enabled in panel overlay */
+		status = "disabled";
+	};
+
 	temperature-sensor@48 {
 		compatible = "ti,tmp102";
 		reg = <0x48>;
-- 
2.43.0


