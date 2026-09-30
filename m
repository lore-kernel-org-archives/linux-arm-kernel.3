Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D431CA5FC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 14:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kkjkwOkeHSZfXOGPL92V8g1PGNM8S2IzaMhySLNkPI0=; b=VITL+ZtC1tg31hzpWQ/PI9cSvz
	4vXie2g86yFo4l5X6YZ/E+5DFnVUV9aR0Hne0PgjMD03/SVnKLzgkDeRADv1kR5IL1lbebTvjl79y
	9NyIcHz0prWvETZKn0kd7KzLmmVChBVP523nNoMcJSA716K68lXnf7EvkA1E7/7YN5gh8VaamUgyp
	rfR5p6o6SpsCDy4cA58jv1RPIyPYoOhxVTElKydDCtwc/rdRC3bW/bs/7R/CFPDTgnud8GjXLFtIV
	I6VEjDz+sKwWz7M1+NkgM5xpn5BIvSX9dYngAjSOz+IOIpKYQYeEGAh2HVL3LV9Kt32mu4bYDNsYO
	JZSrR4gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvA3-00000006HiK-08AP;
	Wed, 30 Sep 2026 14:20:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv9c-00000006HUx-3da1
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 14:19:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=kkjkwOkeHSZfXOGPL92V8g1PGNM8S2IzaMhySLNkPI0=; b=jlnR2l1W8Ocoai33hzx9AwPVmX
	qTL7ryP4Bf/OmqtM6i3+FcuFLPwVuU7r72wim/GK1nEr/pclLxDB9lL5eC5jb7BZPutyslBVj46aE
	LFGvngi+DmJ7s6Di8wNBOLbxz6aXneTOet01POgZglCnlMU8WExI0LwAUeCWGaUpbo/GmaMs5H6tI
	fvJRxTq6IIaQIQ+q7ggWThg+1GEulBbG0Sgno5jQZ91cC0x9tqGRJTTJGboOj6OETGUGTgmUYOqdH
	DlWnXS8SA5edlt+APR4AUlupOAfMQo3SS5dc3PB09f974k3DjYRCfHBFV+eaT/YRU8dqqiZJjSiJi
	fUmR5+jQ==;
Received: from mail-northeuropeazon11010004.outbound.protection.outlook.com ([52.101.84.4] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBv9Z-00000003ub0-2yVb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 14:19:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xle54+QjZHjA2hi15oKTN9u3M3yl6R2dY0ruL+auFEuokwwWMa4VFpAoCWZm1yJWBGXTZ6SeP7n+G4Zmrg5MLnt7RTD4JqGO5UuDWPMAWXc+JSd2tMho0Br8qcxk26s+7FAcBoXShhM/Wcz1VuhLCwsPDF7ukMEF0pCmi+y4XKeX2vYzF56xHVqojJXM/uPljHmh2wIKeYn39aZBZC9af/rnjyw7gqjq7T2j/vIyB2Q6jPwUI/nHwJpqaZt8xJFJx2BQGL78g/HHcBNHIDS7lgzAjnZml3wLxZSSWi2Ip4diqifPYhKXpeC5zIYybJ0RtY+tFYGjIAfzzltoB4WZpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkjkwOkeHSZfXOGPL92V8g1PGNM8S2IzaMhySLNkPI0=;
 b=EiHhWxaYK57mRe9w2uRBqCFqiE35buB+ObkysUQj2VsShBne+VAdqKeqtB1Bt+an22O1s/oRypAkFeb5r2IL4ggpLsf/C1+fjEdJtwfH0qwboT2h1BC2mt9JWQbQX0XKsS8KVGGhQ9t8lLq6OPHliRmdDHPwoZ7YHAIF9AuougbsIoo0b9GFcv5hw2YBj+MqQIE701rbWOWmu0Ri19DkjbsOEYq8YD98auK/1AlNNkcrfYDhQxH/pQtxFpJuFrWMCtFAqHd+KWYvyY/TY7BbOo99fZh2vXr073XwTZCCNTC8AlgWa6gcA0qm9nc7zyGR3m5+g4bbXoLzMuiMyD//ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=baylibre.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkjkwOkeHSZfXOGPL92V8g1PGNM8S2IzaMhySLNkPI0=;
 b=SasB2msqcwGAYcI2DicBnXZQpuJN2Am5CPnHtso7qMHRXxQu5S9pUaUWAeutHTn3AObqpM+SrMoIeHSWJSB5SZYc2ZMOacT0XON6VhFv3Eb+KgknhglrXE/SvVEyelpsJYqyipvRNaHLsqlMKPK22TrIWmoiz23dBJluPlBs3ZaUB6/E/Sowt13jrss9zom2PnlIhv3DR3FdeIEk9vjiIgwbK/WIQt8Fcym7IHd7bgiPmzfQwmLRf9QNYcp8TKqsRhOiqbJpmf6XO2c3jHihJ0k4QuYKonbgsrSpu8rSiNvRSBJeUS9R+8uePRUXvKcIOJDXFXDRVraqjk0M55KHqA==
Received: from DUZP191CA0048.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::8) by
 AM7PR10MB3349.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:10b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 14:19:20 +0000
Received: from DU6PEPF0000A7E3.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::57) by DUZP191CA0048.outlook.office365.com
 (2603:10a6:10:4f8::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 14:19:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000A7E3.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 14:19:19 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 16:25:52 +0200
Received: from localhost (10.252.17.140) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 16:19:19 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Wed, 30 Sep 2026 16:18:32 +0200
Subject: [PATCH v3 11/15] arm64: dts: st: add vrefint calibration on
 stm32mp23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260930-adc-stm32mp25-v1-v3-11-406834430d72@foss.st.com>
References: <20260930-adc-stm32mp25-v1-v3-0-406834430d72@foss.st.com>
In-Reply-To: <20260930-adc-stm32mp25-v1-v3-0-406834430d72@foss.st.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy
 Shevchenko" <andy@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: Marek Vasut <marex@nabladev.com>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Patrice Chotard
	<patrice.chotard@foss.st.com>, Olivier Moysan <olivier.moysan@foss.st.com>
X-Mailer: b4 0.16.0
X-Originating-IP: [10.252.17.140]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E3:EE_|AM7PR10MB3349:EE_
X-MS-Office365-Filtering-Correlation-Id: 3614f2a2-3bb0-4ae2-09e5-08df1efdd178
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|23010399003|376014|7416014|36860700016|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: F18vvqKrNcuCatznrHdtv73WkAsNaqRYXTfW7YEgqh9e+zDqDTCa6NeG3AejJr5kaBn51MyqQwkFSlngIgiYR8N/Omlt/f55h++0WWfvvJ/nFLOvcL2n1uVbC7byTeZau3cM7jd/gIDgLD1vhtMA3f6VrYiwMVHywCnWHGb866CWAKbpcI5NaXwVEu/pzm3+QTyASN7BT7FaqQcbVEIYzKw35IvplSDwDPaOxco1Pitiu0hTQvCNKg9dWz8muWkaxPst8A0Zu+By5mNxKqlRI5knahsdi3DUV4CQ0OdbfAsx1D9zY1F6MYOEqAf7dspCezwC2gY02z1TJ8IcGhAg/Ak/RSCcQXuO7F52tjIRmebk6GfFPtnLg8j5qLNp31M9mlBnm1Rqfa0ZBOJch743R+Kl2RfSt+L9oaZdyVXc4BU60ucdheSWvXx1cii4dfqyuKxDNhv0RpOCC0m6cHn7IQjZUl5aTEH0H16rfpG6ewYF9bnsvKdOBjFf4q479H9ZWhLqW8DsHUQtE8wavQuLodVoC5MBswhpMDKTkqNhPpdKamPZzJ3k6BlSKjKhENNi0KMS0UDWBzjM6X5i5ELghmFil1614Av/Ksgglb551JeXZc40Ud7sGDT+dZCYBDIiPWxzDWuqukihJADrehkSHXmc4FahEnp8nz4cCeZj1iV3azsE3toYsQi0OkB+VNtHMrrKXE2mwvPBeIWekdsdJg==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(376014)(7416014)(36860700016)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mt23XvYbF8O3bNpO353/zMQvh2sL/edA7ztGWDQwo6qhAnOfQyh2JnSt/FcQEzDNYA9cwkMzK2TXY2/COnzVs7ORzcsgKwYXpnTpMHcMlL8AVrLjxU2R0inmB+yJWuh4pbZ1jGplGl3Cjd+q8l+bGn4rl31lNoAq+0zVdCeNPABnGoLWLSDX1pnrcqd4t278g0v3IYj8V3UwtLt6ZSJ0DZ5k0Lgln0h+FTRmxh14XjYg99M6jiaIxjGwlFx+KVlL/7P5n2y1DH9bZflP1bfDsrTkEnhO0XzxLxwlttttBke3lQyuSoCBAu1jfgtA7mKx4avhPYgjVksbHiJlHAa+QeLPzHMYUz+aOorZfuypGg/TKk8i9Ul06ycMYDi7fBXQaGknZ5EZ6jq/eLUBEz4WFoVDp73xazx9wnXzZfL7VFGwOHWh9YP2+hHLX3pmoFwl
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 14:19:19.8640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3614f2a2-3bb0-4ae2-09e5-08df1efdd178
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3349
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_151925_794856_31E8D45D 
X-CRM114-Status: GOOD (  11.08  )
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

Describe vrefint calibration cell to be retrieved by ADCs through bsec,
on STM32MP23.

Co-developed-by: Olivier Moysan <olivier.moysan@foss.st.com>
Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 9e1d240888ff..938d6f0098ac 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -790,6 +790,10 @@ part-number-otp@24 {
 				reg = <0x24 0x4>;
 			};
 
+			vrefint: vrefin-cal@1b8 {
+				reg = <0x1b8 0x2>;
+			};
+
 			package-otp@1e8 {
 				reg = <0x1e8 0x1>;
 				bits = <0 3>;

-- 
2.43.0


