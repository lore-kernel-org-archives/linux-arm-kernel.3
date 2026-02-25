Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B174F4BB9C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 10:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJJphNjDzUi7vgwXnLNPRLGuf0LA4pJcgBbhDE8nsPQ=; b=DLYC6CtWa+CgBNWL22xcmzeaHb
	Rl3N6daR3IVpp2fHXy75EfhcA6001H1LzzktCrju0Upx7e5s5SNZhU1/rqeq2BMe5jua+Evv4bgRE
	zjKjvJKMHyU9BBskM3+6Hz0LlHJtruF9jjvhdnT6J7XljzTyfSPQqxFKpKSdu93KsWqgdtPzjI5Fi
	yfHiSAxsiB8RS1I9dJ6rmO0294QXkaFP5FeVtFed65DGUtxGjP6OUdE9w045xYr0hWzCmh1wUWoFX
	sJFyIuyA/I1SOsew3mtKfr12LesgrNwcVj7TiUCiVFj/bzvon3laxqF3CK0gtEiYuujJqmbuTE9f8
	z0YMlEyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCY2-00000003r6P-0WDl;
	Wed, 25 Feb 2026 10:55:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCY0-00000003r5A-3SE2
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Feb 2026 10:55:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=VJJphNjDzUi7vgwXnLNPRLGuf0LA4pJcgBbhDE8nsPQ=; b=jNi1TJm3j/QDVV+JOnjOACPju1
	kPqfjazrEynVqEBzthmceTivJQxPf72uplc7viRcLxafVriCslJ/Z+7Iyi8oMNTLpzeZ7hDhck8y5
	B+6lpMq4EHbOXuZ/p2/aMbMmKvGHLyAn1FlAUd3Vv9VuEOz19huXKr2lGqbQDk2d0JsKrjZGIKJLw
	lsUkjYXG8NcwNuJEx48GsNtz+sSwF/Y9YLFlddnDHi1cODXc7tRF1gxgFKbe6dXVneJFLaS+d0XOP
	c72AyYhhNFQDPgBLudze+sG4syA5jwODQYa96jaoOA3JDzSnGUEvs46NdNdWC5Gu1yT+KTt6zgTkF
	Obrs2xBw==;
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCXx-00000008pcb-3XZL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 10:55:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UBa1NprGidwBwHVLaK7Z2PIwRbE5zvJzee2cNLlBdGVSZG3q343YoZHnltbT/ZGTvYPSBdXuMI4IYScfVJvIKFeldV6M1y4gFj6qVEVbT5r0iBhT+BjeU/FsTASIUj0sMcYKnFScRTagoDM9YX5sF6UKvhME/9urEvEU3lIzNEuJIqIwUrJ3CFpQpWOh3Fltq8lmWefNa6QuL7liS7HPvI3gMrsbXBQBwifdDc86q86+Qv2DPLhbroGCjBYp9oizf8MTokBvPHck+gFgiySAYLw3qIT+z+odGwhtJavjMeQTF6FJX+wueuGj8UefVFqtKASpsjz+TtJVB3r8QoF8+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJJphNjDzUi7vgwXnLNPRLGuf0LA4pJcgBbhDE8nsPQ=;
 b=ueYg+6pxIJ85hBcwsOsD/MjqM7yzr5/vggbADKmSI+CYOFXruZPCKlV2a4ycAFT8rRf7MdjJ/7Hvor6FUwS+Yp4eywJB+6EZ1SK3fAnA6EGSy9d867ZfqovycjvQr7MpZ0uQyTK4/RVGb5cVbUN+1ZLhwnnZN0S7FNn+XHEGNBs96evP//fDf2BAK3Kw1PnD/Ytl7gLKNoD1cYl65WTXrgnHHMZ3bt0X4BA9UZZN/BCzqI5E5e+KFFutI3zg95U+H/rcvBUI205dSFPpeLs2thBld8tbUSH/kMf2Ajg4U5hF04EHbB2YhoAJR4NrUD2X+yRXtmJn7YPHf/QKZ3aF4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJJphNjDzUi7vgwXnLNPRLGuf0LA4pJcgBbhDE8nsPQ=;
 b=gXbBP5dVK2xnai8eHS8NCA78OFL2IQcy+pmEDyA1d/DKlSvYuEFR1QL28eGBrjByGtPfIuGz3M64/hiGO71rB4JB33UBosKpnxAQKKyk9S/6NCmw+eJCuCK4kxWlinDs2oE/wy5GckaqTxoqa1sOypjmNXrPLGpajcuKkkotWTIH+7fW21184RP0xHkxQ9AEQGJ6UIRcAY/pRc9gB7SHYdWGa2e9QFvhZ1LLFImiuaSBUghMQJadTlJQ4YDQX6MrMXOaNWr6FolhpaUaa+Fn3YtGoupF5YOXrIkgYuWEH/08Rp+A8aoJyRkhyToCL72y7qpzk4v1e9GFYHq4yezZ7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PA1PR04MB12224.eurprd04.prod.outlook.com
 (2603:10a6:102:561::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 10:55:09 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 10:55:09 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	Frank.Li@nxp.com,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V6 09/12] arm64: dts: imx8mp: Add Root Port node and PERST property
Date: Wed, 25 Feb 2026 18:55:20 +0800
Message-Id: <20260225105523.748775-10-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260225105523.748775-1-sherry.sun@nxp.com>
References: <20260225105523.748775-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0104.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::12) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|PA1PR04MB12224:EE_
X-MS-Office365-Filtering-Correlation-Id: 605bd2f6-fc95-486c-afb6-08de745c57d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 9FPdS/++FMzIAP9EVvkcXTFPY21chqnc/7QPBwnaOK0RlaQQ5k9NezXeKOwfCfiMWBp8Za6h5fm3GViIPel/IiFdohHVqJ/VqRKQynOsJbmyXPRbGaFvbCJ726Sn0iNSUJmIYRSBb7LNfDO5XCAg1qci3FKvFlSUk9CNm5E56VQY2cQo8V6De4pDygXcMG9iNU9lqhvTCYUYUm6kS1HvMBogcYPnevQqhuxRWryt7A62lnK8VD5nGtxRkxG3p3HQFqrcpf8hbrntZ0bP3dwwlqaEsCYu/2hvrDYmobHkr32ikgozEKElY8kBGmhSr6s+66YsvPZNIIXCan808uH87XEuA64hmPUR9wodPTwY3mbEQCm5tJYasraYLih2EPrZKhVqrGSqehGsdMBRFNIP2pXfMPJVcWlECQ33gFmpUiisvYGDl7BZ1mbKRkKkWfwhGMLgPxFuxwdqoBlExpvAw1mAD4HATFCMbqgESRjvoDs98qrasANH0ZjcSJUYuDxoGMXVMy1s8UUrBf4w7xMc3FYXkmQG1XQZ0d1L/FPrfokZ7SgK00nEK3jngMON061h0KH64ROLSNoRASTrkFaO1zhLnlc7+7L4HhnaqglkJ82lpYftd/swjURpDRwr4v04QWoZrEfY6/p8ECpyQNH0wTgz/Czr/I7g86E7SRXBxyWqTE8ytYrqY41QMFZDWsFZD7YVFG3VODQjAPxWD2oVkEPDZzmenNpV6G/vXMVlx2nuYf+PQY8ygseUUag7/yClL18cqs0UkRwtWjg/hImqjIXnZGMAAgUCAn6Bzb6sXgMhlBbHPyxDHvMvkAFPpWUv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/czrrahxJVeO1LBovQEOQwM9m+48uQZ6kUauISjUEDt6Y0IBNZQV4wtO+lO7?=
 =?us-ascii?Q?f3Tc1LUdEudctYj/fxmlLoyixsprZ8XoMgDTei+yD+Utu1mWRkNIv/YgiWa7?=
 =?us-ascii?Q?JlC55bHOvrJIZ9zov2JCHhU7LQn/mlYPmFpFev9BKEHC8SlToOHV9q9Q1uZp?=
 =?us-ascii?Q?gbQV6dqCoDQTmyL83g4g0JIpiqnufG5Y4mfwHjipUpMmIfXk8cz2Rb+UaA0u?=
 =?us-ascii?Q?gAtLWpJCahsVRXYxPan7RQazjcWGWlxV5Zcj2Q+hvsqbgQ3sDKuWHGMFsRCN?=
 =?us-ascii?Q?y8umBAuoiF2AopOV8ssABlO/s0GfSQ1Y5rGVC2BSzsV4tL9NBIZHqZJIik77?=
 =?us-ascii?Q?/emvj7vY8h1PHz1yc/AxxPPpd8ihlwrAz8ZQJAxUrWayzp0dMCkP79hrPeiB?=
 =?us-ascii?Q?htIMoX7RK4MmwBdUBxoDIxUpa69vJ6ETKI+T/rcYzH8U2SiOkwAYeP2ey0OR?=
 =?us-ascii?Q?9Q05J1NzH3m2v0EiH9FO9HCsEzLitfYBIS9kKVMJAQuI8m/rJJ+qBhZEk02o?=
 =?us-ascii?Q?VVKfiDs4AtnFdAliB0Oa7EZnF0NohQRiiQvyPdx7QMdHyN8wRZSpAvTNIgKg?=
 =?us-ascii?Q?RZE1B20giojcoZsL42kGjuBvxz66AIH0PHj0ZlZXoRHWLTuQd4dM2pqe+OJc?=
 =?us-ascii?Q?2A7LZVe7u3QALXawlRWuZPYxLDfhsT1WZ1K3xcs0iDnYyWIloWED+cnYGg7t?=
 =?us-ascii?Q?XZKuG+md9TKoYDBH6/AHR0+aKg7ekO5iSqwq1shQwP8l10mzQPndYFzU+MQh?=
 =?us-ascii?Q?y/NZmbZe+j31/7edkrIgZXAhVLve6ZrodtoVs9n1Gu7lRllkVLQXiNbsRreU?=
 =?us-ascii?Q?d57Wjcv/UhKPA44XqPiy5BUXTlubDI8iEu83KwaBv2z3ti75GCCNqLuTFfB6?=
 =?us-ascii?Q?7DGSPM+OG+SB/G9xoRZ+oRlqafX5BK8u4NnZcj2HteUH9IOsyA0ev23GvYw5?=
 =?us-ascii?Q?tmOa8r2msaNHOe+GXvCTEWChTxldgKmFrU+RRYLcjfVeq14bZ+/kCkZCEMUX?=
 =?us-ascii?Q?TiYyiBqAdvtsEZXSuf3qoyqtygO/cfvditcRBte5jU6YF53xJbEFNLmEGPBC?=
 =?us-ascii?Q?3lK1OxtbH1hnD1tE52husByZxfz63KBkWx12AYFfdmwP5ltoQfXUhxP31Mkb?=
 =?us-ascii?Q?CGm4uDi5T1Pf/hc9Z8Ct4gKc5fAee+/PeZDfE+rUKMXQq/f35H+NmSW5/rNo?=
 =?us-ascii?Q?LdDMB7Wv6lYEU3DeqYjER8ERhJyQo5lES/dXi40b5KnGM3o55a9r8D0rKzoL?=
 =?us-ascii?Q?YHqASSjA8SN1i6ech6a/TrT4oGusNFxU9APaoOT/hgPSOyebjqiDWjnYTSPu?=
 =?us-ascii?Q?H2c/VqEgeKCt4TsMUuXXF+9OPsaJ8IhS016pV9ne7VCNKV+zyKW++4eCCN9j?=
 =?us-ascii?Q?NvyZZNkrsrtLIImRtRzAk780q31bXpRaqL6UKmuzCYdK/yhpN4HlC7ayfxc8?=
 =?us-ascii?Q?6WEYJFltQbFfd7Z3lCkwj3RMwsDkjmD78b7Bw6Hkh2s119GqVLg2oV2A6vrf?=
 =?us-ascii?Q?HB0T1PU/17XJB8IpBSlLpdFzREWt0cCfeHCzb8red/Rne3XwXr8gyw2W7gDP?=
 =?us-ascii?Q?avPwCxI3ZHdUO95PUjv+iKz3uoSw/8vBhLYGxldbJ1LU8DQ9BBT1F68NGE7E?=
 =?us-ascii?Q?mJ5LuxQ5G5uZMLlaA16Pz3LYzANEqHjdwONTVYc25EkfESwP6GRW/Y0QioNl?=
 =?us-ascii?Q?F6iL3gmCZc33mthd8lggtMxwkMUpzvDN/UCWOItzHDh05VvDXrng+2Z6QOJW?=
 =?us-ascii?Q?J6w0etFMfQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 605bd2f6-fc95-486c-afb6-08de745c57d0
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 10:55:09.4669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ex7iY0o1d9v4c/qdCSjymkYn+0rzvr3HII8bIAhAjOpAbVkNmz0aq+jcqMxt7B+7mRr5lMTCfQQ5xHV0qzAGxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB12224
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_105513_996366_FE497296 
X-CRM114-Status: GOOD (  10.96  )
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

Since describing the PCIe PERST# property under Host Bridge node is now
deprecated, it is recommended to add it to the Root Port node, so
creating the Root Port node and add the reset-gpios property in Root
Port.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts |  5 +++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi    | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index 50850cb6d287..dfcdcc739ec6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -769,6 +769,7 @@ &pcie_phy {
 &pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie0>;
+	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&gpio2 7 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie0>;
 	vpcie3v3aux-supply = <&reg_pcie0>;
@@ -782,6 +783,10 @@ &pcie0_ep {
 	status = "disabled";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&gpio2 7 GPIO_ACTIVE_LOW>;
+};
+
 &pwm1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm1>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 9b2b3a9bf9e8..f66667735a02 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2266,6 +2266,17 @@ pcie0: pcie: pcie@33800000 {
 			phys = <&pcie_phy>;
 			phy-names = "pcie-phy";
 			status = "disabled";
+
+			pcie0_port0: pcie@0 {
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie0_ep: pcie_ep: pcie-ep@33800000 {
-- 
2.37.1


