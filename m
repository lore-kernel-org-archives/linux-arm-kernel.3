Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787C3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 10:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJqD4jYQSuf7eHPRADE947ccBt7tQyNghDeuCp7Bo5Y=; b=qVcnc1ptdLz0BVf1FviqujhkBf
	RkehWh8Lkz9/68/eA5bWtFK259KO4v8+grseoSC5+amNd1+ssrheaAMiWCYF1O3xOclUqc5dm3U3b
	U1iJW7ZAK3OzH1P/HXTBkKfggSDHlTdd5tBRQ04B5av3G0n0V4dGA9C+t6uNRkgDfL4M4qwQRJUZ8
	Q3x5yxfJTJ1mU59cODmE5udwaYG6cq86WTqLlHmLWnlp8IKe3v4jbJAfylTzd4G6LTt/ySc9MDWba
	NeTNOjBZd+qEzdTu4sf/vCJLLWIXmfEvNqAcmfpsca+CufbEgURrCur2PJ6pGY9dKkJnGHQzvN0ns
	MbuY3mcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesX2-00000001MB6-0jm5;
	Wed, 01 Jul 2026 10:51:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesX0-00000001M9v-0qr4
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Jul 2026 10:51:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CJqD4jYQSuf7eHPRADE947ccBt7tQyNghDeuCp7Bo5Y=; b=Jw9beFJiXMXhjj080wPrrQOrxA
	DjIKkBmylvZXHCGHRcoHP4Vjks1uDk+w5pKamTAHGSmqPw1HD3edlcoeUAafqqrHDviwvmZrzxKnH
	O6fy7q4a1r19pSpK/dr3jAlIbyg6N9yEcIEcrQRF65l65Dtw/nGr69LKDRBH83X4kmRQsvDFPPuiZ
	KucgSLVVnWFPQDrL8/kFqD1afBXQP6zHaeC3s/1dmv4FGtu8L20x0zVb82xcbAI4iA5tqW2JVvKyg
	pLMn7JX9Os4QJ4UkigXVDap11BZYeVNTeAuq0zD+W+nhnZs1lqBnhiLmztu1hT4IoDMhqMDdZUzHj
	KaCWkNOA==;
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wesWx-00000002dxm-1VVZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 10:51:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JEvkBjyviDXPcJYPunP7B848WDcXo0WTFe395zkvtVxtKybNbdlK/PZHfRE4opccxwEmJ2UMvb0+wEv7xjgt37ME3vVfI35gQZOtMRLznSgx98cDXivDtDptlvyj2ijxGBCrq4uxUp1rMG03iV6zReCrIP60AiW8LU9/9lUtEIiGy0f5m9hARdqAwq/RubjFQiK8tAaeq+UeBeQDjLsoicxrlta/ZkWO1h+K0D54waQlZB/UVVp8uV6kz8l79FpDmdSohGwX/dXXfrtv8Lnt3Gf7nNgUaIHQKVTary/4weIGx3bS+rOhowqAxwZnmyD+F+wQhWyoUo9wbC4bPT/W/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJqD4jYQSuf7eHPRADE947ccBt7tQyNghDeuCp7Bo5Y=;
 b=FXuTu12l5o0qTGV2odvT8OBiGHioFq3DT4L5pn+EPKUxTmPVW+vDmAzMC9zIjH8pxHbXoh68KikH4LDSDKyQQdu53lJXqlMeTCmpQOVKevYKeCDrjas9WKcD5py16gSMMBgBf+otZfb12J3XP6RW9TbfXVTHtO4pL1DchpUpb/xvqIXxEBybMTJqL5jlnOsc0NGeuFRzss9jqvHefVkBdll7isWLF8vaVVGPfnXNkDLLDjHg8u1O3WkJhiGke1a6lPV7bkBtVZ/f9tIzLux1EyxXEtzCjEtJydxefKsMrTarNqPGe/xqiOHB1Jk7B7wNWJC/7vsdOusWN+qSwXhkNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJqD4jYQSuf7eHPRADE947ccBt7tQyNghDeuCp7Bo5Y=;
 b=PWxbReERCBXRSVfwpbLvkAXgIVP228vUHjqTZfvSxn0onde577IoqF0gU/WEJeqg/OhAX2PBCyL2h1tTvVATY9sk3YxHh9tAgXP4VYScQeWpP/PXBxgSUaamj+WQD2XHirZ8zkL94iMcFpt6VFJvHMEP3LtriBQXrjslJCzha+71vAZC8+wrBEyjN64WZoYOsE+Deh8rYce45NjoObFbZmaS1MX+s6uOawlwq5OkqWrsCk2B9eUnuIvz/l1eVHk32YPmEaL2RQTl9sr/s6gHWmM0Mf4NEIQK6SkmXbBaXQjaUsz3FDdFUMzzmy9APqP0XAxDrTpyAWkHK4xyun4B+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com (2603:10a6:800:296::7)
 by DU6PR04MB11229.eurprd04.prod.outlook.com (2603:10a6:10:5c4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 10:50:56 +0000
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be]) by VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 10:50:56 +0000
From: "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	hongxing.zhu@nxp.com,
	l.stach@pengutronix.de
Cc: imx@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sherry.sun@nxp.com
Subject: [PATCH V5 3/7] arm64: dts: imx8mm-evk: Add power supply property to Root Port node
Date: Wed,  1 Jul 2026 18:52:30 +0800
Message-ID: <20260701105234.198987-4-sherry.sun@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260701105234.198987-1-sherry.sun@oss.nxp.com>
References: <20260701105234.198987-1-sherry.sun@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:196::14) To VI2PR04MB11276.eurprd04.prod.outlook.com
 (2603:10a6:800:296::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11276:EE_|DU6PR04MB11229:EE_
X-MS-Office365-Filtering-Correlation-Id: b62959bc-a52d-4a74-ef8f-08ded75ea117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|19092799006|376014|7416014|1800799024|921020|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: UhlfE15nJ6e90eeJFHeuy5t4ESKp7yxIW8dWpLodqf09PUbaU+1QZjEF/o9y5HDnco8Cur5xVDGhltpqIFXRe1+CSPhr2Z4J6wKL3X0RIrH6I/1+nyrRWt1PSef/nIGubPwnip9aiRTuG9HC3zVxCQV1c5ugUE6Emz19xzpZXDfU9lxMX6h+z3B5dCkyqmXG3bl/iPUchVQ2zVJMcubtLFY4/WUsKvQEV5Jj/ezVfeXBoNrRtlKRNTRh6qFMXHI0TAqIaKi/p3p48jEG6QjS5X6YjSazuFF5h/iqiXMTbRsaeo55DT7DzEXrrskPMNctjb8Y8DHeqOdi7/bjaBCIpTVcqIBtfHn6EkwkpKb0e27t7Y3Wu0R/sykXDaFDPolXZdIvxNBMqG+GGRulrs1VzvfoHabD+zuUXcA2GCPUCJBow7wHxOIkNjvO2p8MruJPMagPdtih8/GlnQrdSWaJBVnifvg9JjrbTC/q1ic7t89xML8AqJEybXuric8sK1VMcQvuqDg2MRLf3kW/969L9qb79iTPjGDLjZhA2qWAoY2pi0qJCqrWX1YJmEnyaUA3/4I31hmPUpW02PgHMh2VxHHxST//UFX+OFFqPJ/ea0WJnqE6wITCugzm+Lhqy6s9I7nYfpHIvVGlbFDqsTO/zFak/Om+D/9fFLCxwPawQFDzv/f5LgCx0FbNX8R2XRO/73dxSKeEeU6hH5353ZQoTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11276.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(376014)(7416014)(1800799024)(921020)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5nkF/2pI3RitzjNpcF8jmxasrOZWqS9a0kBbNfq6wNBpw/cWOv65zkibB5NQ?=
 =?us-ascii?Q?/YU7jMBvDoQvsjgpHMi/6Za4KNxkfJ0CXPiIpL5TPGcJjLJk6d4hppUFhyIY?=
 =?us-ascii?Q?SrkXzinjUY9lfAKiFsZIG9F3d+mwEOmy6C2EdQ9Ni2wMEu2OgSk6UGE5Xn5r?=
 =?us-ascii?Q?7cJWxABcbowcgIu05/klQFj3jKJcyLd1ISxYoExElCh84vi65lUpZb1AXzHt?=
 =?us-ascii?Q?dWyMnfYUVkUsO5Nirh52pV62nD8Ewf4n1BdoIQhKoekN1nTaHCFo9AvKHS+7?=
 =?us-ascii?Q?Hp0o6bcPWBdOq2Cwm3Kmqfz+Q2BoXivTs8p1NE9zINjXp02MBFUNCSSHLWxG?=
 =?us-ascii?Q?s8z02PwU1WgMqx2m0wHZjzprSsbyErOgbWvxQq2ZVdWRZ0VJ+xccMACIfigg?=
 =?us-ascii?Q?KYuxTp6O+4eVmnFd3abkcpFkHnNcRgJKRfvx3NurWJ9ZW5BXvRaUNtrnPvqV?=
 =?us-ascii?Q?sKZlQZ7jEnhEhUjPOa0tsGvmOwtqrQV4GzeyzV3h7SQH9uqO+fKSPJQeI5Pi?=
 =?us-ascii?Q?v8sC+gRZr6leSlx8HcYf+0jMrIMztdLJT8QK8ZlV2VxeGG1TPMepB/IJTavP?=
 =?us-ascii?Q?rfXm8aGYrP6pl7CchYY4hrzkNzdjx9pCcy+TLfyhtZBP2/HbXpg6oYlZE4XU?=
 =?us-ascii?Q?WV8TAgV7aMFb/XBNsjPV3exWlPY4BK0HZN3LROVMDsaDiYIGp8+U2q+hrBPh?=
 =?us-ascii?Q?dy1p4HkTyc1zDIYmLD+7tq6L03xDFnLdxz15BkNDkrWE36DhIqn0nzxfJbo7?=
 =?us-ascii?Q?X02p93LNJVsGvpZS9bSu/WmQjN201i++sSeDvGVOlg8bpOc3gSjfFwwKk+du?=
 =?us-ascii?Q?x7d4AUhWwqKfB+HEzY2fH3opbaFoL6DcZJWiQhu8S+UaRxhtodeQpOWfdXl/?=
 =?us-ascii?Q?mQZYOXdhaUX75Wsvr/jZGqfKDC7m+QEpb4E2flwWznugo6QWprgoP/llXwys?=
 =?us-ascii?Q?xK2goXTdHKRu9PL2iArTR+4jhxmL2wR5esLnA31bQI/RY52CumpSJvOva+to?=
 =?us-ascii?Q?DmSwDc/NSiBr+tjS8FTaSwQZENWHB49Nqib825GgkglP4SshuQz2DfY71Eeb?=
 =?us-ascii?Q?29jU9H+HVzRdWa9L3rT/SqQT/oQ1oWA0j+9kMvytDI8Wam3EGCiycRwtx/1g?=
 =?us-ascii?Q?lLRq4q38WUoXxO2jSDDQkFcsVKJWVUXgpzv3FYaSJLmX077mxj+kmxUx6gYB?=
 =?us-ascii?Q?/EuqUdXVrdWPDj9+Ig6V+iUBDF52hbRepLTyl5rayEfwxCMkZWHTZOdCuEsj?=
 =?us-ascii?Q?Q8h0FZtp4eWP4weTgTCOm3jCyoEslMGAcbk8NBhnHzcTregXS+MCXbo1HXS5?=
 =?us-ascii?Q?rBUALUPdy1ZbJr8m4sJarcnslPrg9gG5snP1LDDlu/MhBXCmhuvNnhqTidHk?=
 =?us-ascii?Q?jbcd6YibU9/YIghpTP3yAGznDsaHI+abKKDoGMWhnuTAkctAXJdma+zRCtl/?=
 =?us-ascii?Q?UqaHvYxDxRkFc/bvRJ5iJocNS8Ph/ZDdFSEHFriMeKnz81PD86+Y3UIiUYsU?=
 =?us-ascii?Q?1RDWjrsA4rsmsg8PbHEkRBb4/rHMNfWX6nP9mkat8g0BJgrjRgLjO2f1uTXn?=
 =?us-ascii?Q?nRC3PlFVvjpfWDzgr6qPwd01+vkWbu4tnQ7e956kDcI6lAnn7TaLlWJK76fF?=
 =?us-ascii?Q?9673U64Fv1t5G7TY+LTajmmW34Uj4rh7YT8ROquY2H+rxj/8kIQ6t9sbb/t8?=
 =?us-ascii?Q?/9HAqjwMSCU0UuaPsfF51zFJbpnSE9X0UyX0pqC2Axrfn0yFxY65sPpWtoEe?=
 =?us-ascii?Q?oMsJbj2GlAxrE+ODWh+YwdXFL0XVccsHa6Me+Xp8q2Ur5ik1vzcx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b62959bc-a52d-4a74-ef8f-08ded75ea117
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11276.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 10:50:56.6155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hYPyRHv8nN9XAzCQvqUgjGfDZdi38AUkO1drWUJyTO21/SS7dWSxquQZ6b9ABbJ2dbA5YQxHVN9HrHipe5O3OvcK7hQRwMco4/32KdbD/ZIc1We3GwivnnbMYn/TY+eu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11229
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_115059_545082_357417B7 
X-CRM114-Status: UNSURE (   9.75  )
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

From: Sherry Sun <sherry.sun@nxp.com>

Add the power supply property to the Root Port child node to support the
new PCI pwrctrl framework.

Legacy power supply property is retained for backward compatibility with
existing kernels. New device trees should specify power supply at the
Root Port level to utilize the pwrctrl framework.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
index e03aba825c18..ec49cbbfd9ce 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
@@ -542,6 +542,7 @@ &pcie0 {
 	assigned-clock-rates = <10000000>, <250000000>;
 	assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_50M>,
 				 <&clk IMX8MM_SYS_PLL2_250M>;
+	/* This property is deprecated, use power supply from the Root Port node. */
 	vpcie-supply = <&reg_pcie0>;
 	supports-clkreq;
 	status = "okay";
@@ -562,6 +563,7 @@ &pcie0_ep {
 
 &pcie0_port0 {
 	reset-gpios = <&gpio4 21 GPIO_ACTIVE_LOW>;
+	vpcie3v3-supply = <&reg_pcie0>;
 };
 
 &sai2 {
-- 
2.50.1


