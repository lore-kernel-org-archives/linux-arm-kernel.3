Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBA6106ACE3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 19:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RC93O/9B2LylJvMbACxtTRweB3sixPckboUTpa+OTAc=; b=Z5csKxYxv6ZbPsYkrJdyijIwp7
	9Gn0PVaP4Up4TMTkNyh2yMjbalAJU3ExSeSfOC1KSVaNQQsiA+FbI3nnjSZArH7S5s1CxkU5JCHLy
	RI0H+GuwdAZYIX2eA2a7gIl8fyCPkKprYAATjeK9XM/QM6Nj8jDi9F61IRddI6aAnDAL6msVUbafj
	qAdjN24Xglivy2CbJrcwDtm18YGVGkkROKVbA+jqZ9x0c6M/eDwPBoatIWY9zNPUkZMuCrxGyX1fs
	nKBFsPzOgwRYu+gJTlgkvNDaGZ4MHbTN540ppEE6cti1cRw8xvNPcKD2ONoo1PKFI293WLdaZrffh
	ILDN9+vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lkG-0000000F6rS-05Cm;
	Thu, 12 Mar 2026 19:30:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lkE-0000000F6oT-2HOx
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Mar 2026 19:30:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=RC93O/9B2LylJvMbACxtTRweB3sixPckboUTpa+OTAc=; b=H7MGv+mPYEP0Ufq9HQy+JP4mLl
	Lj3+kgUPOKHkKyVtssjnXPycDIzItWtwQa3b4jcG6b9SGLveFtvMBdjDKzUBav4/sSdjJEhFKZ1dG
	6c7r/h1sASg00TlGVWlNzb7lcPyh4ukna4QdMJ1qaIs6mEQPehhWY6bXxJ1F88wkPMwDHg/VS/PZF
	qDNaoHO13yXjivgHS7HXaMLuC/PgDPJc0umZphKhSuwLlilg1YOB6Zna5V4bl8PWRlY2Zmg8u85Pi
	HRFgetRWmupR2fW29Ga+MdjLWDrw68kW/Cqd5N6JJiL+zI0EUiR+og4t0ucEWPY6sIkitcpYEjhyM
	ogcoPFNw==;
Received: from mail-northeuropeazon11012014.outbound.protection.outlook.com ([52.101.66.14] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lk9-00000001tgw-1VS2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 19:30:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S+Z0e0dkJhqRgJwf1eazTDlSbPP5IwbD4zBHl1N49MPN2C48Zwmz+XaYaTiTbeWGcSdF1HOgpoCt2Y6MqpZ+RHn2Fuoih57nkXYfGTY2WTL8eEKN53HrQaWBHKCa0gvzgn8/cHjfRJieT3Xh7epl/tsSlG6+gm7P0MNA+C5/G5TGswGuAHeE9NLrEyFZpDJvM2OJfBoJzia1Tv8zZy0IpFRAm5XRBgWS/wzqYiuW2WuV79YZEy9GKDgnPQulhnxZlf0L8veGkOtOaN4WYU4mckUvDGrwNseVJc/Brf7MzmiR88NjAEQ4GR1v6WHT468YVLAVbV3gRKhgNKyvlsYkPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RC93O/9B2LylJvMbACxtTRweB3sixPckboUTpa+OTAc=;
 b=UG+zr3Hp4Wq0E67ZF9Mwlp7L/2bmX+cBY4+VDzvgB9gMVb4rcAdWJhtJFYvg5xvGcmPwxwQKhe8S0mczWaor+qFl7vIwaU6J/vNC8Xfsi4c3Y0Yzn1u9jm99SOajXp9Gm8vTVfYqif6hTmPl57QH9NUH1Q88LRwIcJDljKqK8N5BE00wHd4A/MT4AoR6EQLIlFqq1Xd9+oxe+f2E1+HHxv12tCPQrUX2plz+lwO70pf/8oXESMSkxsLj+U4zps01jyFPSE9RnsjOmdLbm3EQkcpTOkRza/AkCmz+zP5/PLLGQ59kkSdNJJUt1tlxbpjEnNz986DTunGyECI0uIKkmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RC93O/9B2LylJvMbACxtTRweB3sixPckboUTpa+OTAc=;
 b=NZKWVSh1G2mioTwpjSPQCeM2tWbV6samELiBE1yCaz4vN/r3AK7ZwLDBtJ+KWBIiCh+RQVgCsRzAmmpupTlMEWN1bR2lfd3SwlIVx42QvkxziGsV50Qx4IGfPXE32BQyzx/O36mgrHVgNDKHkmzaqyBH8I37d9q31Q8YWnNo1jwGoYJun0sYm4fdJJp+pispucSVjr/ovcDma/ED4+C4gjNdedbxRTZqn4acdhYmFluPbiVpcaHGwEyu1ZoV7zFmNImLcLKjElACXJLpijLtKgSmzdhmmO249zbTbcoW5hoZn0J4Uv3dZRlVatQPRAPWPfvCB7Yh8XtwLCTgfiNgSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PR3PR04MB7468.eurprd04.prod.outlook.com (2603:10a6:102:8d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 19:30:40 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 19:30:43 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	arnaud.pouliquen@foss.st.com
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com
Subject: [PATCH v11 5/5] arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
Date: Thu, 12 Mar 2026 14:29:57 -0500
Message-ID: <20260312192957.1978329-6-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312192957.1978329-1-shenwei.wang@nxp.com>
References: <20260312192957.1978329-1-shenwei.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0038.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::19) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|PR3PR04MB7468:EE_
X-MS-Office365-Filtering-Correlation-Id: e4995294-14f9-4eef-3a59-08de806dda34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|921020|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 7+0lDCbUTdh73wYEIybHVYHqXyOGGGlLY/gYOD22VUejIGwbgtL5jRi+PmH5hGPoGl32HXRFpnDqwC6D0C+ct3aNw/JIDh5BZjIwTVidPOfpQKyk1fVCS/F2OMxGDescHbqqp2srFKkonhkcul+4EJojMlF12VHc0H5oJTaSw/+huaWHbzqCIcJ9rEETPnwUPncaSMcBTHzOuQyJLzQ8ugoosy5EvJ5sCf/QyYs6dwwIF8vSZkwJWMKU927iVEcj5xnD6h40O6Id594OAx+U8MZ3RC4UFPTCRBHFIwW47Q5dovRdEMxOSbdies81V6TCW72FLmFqgkO5O8xnynRGPyseEiZrSKz+zIW38DXr8H4FUECuEF6pl2xvppN4dQOCa/QHcu8AFXpvDVpDb5qf3i7NbQEKqKkFE2uTfizCBwkS2dNo7n+8bA8Rg7BNaLz4D2eM5IOz4RKhntJBpqVzJGGM8cCIYtWklem8QvtYY/U3DW66au93d9GPeAooY7y39eQXBTgBECBnLtSmdvmkcpa4trl9x6TopLpY5/O89y+BK+tnmZjbMGAQIic6C8wJYm2r6Ol1EMP6knq6FXZRtmvoGhRIUyDq2IKStpzmk5zo5BnvdDwXKApb3gkdyaKx6MfC6oYNmWuE+wijVMpTOCFs5HT5F8z7Qhltp5G4sospViLGhy4H8rutJ1/S6htUkA+db51C7cmwQp43MZcY1r+sejmHjvQ2qO2OR+JMhN3+7Ti1Rgbi0LHCTFetGk39hY5JKtH1R3TMgfszy4XzGUkE79xOjDRXnwBFJYBNSuLUMIDMS8+LAcfa8GcENbxe
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(921020)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?egsyxkDlaofvfz49IZrjQ2DToaOP1pKznFQMNMv9RQ8su80OO3oNAXSLD6pM?=
 =?us-ascii?Q?zkrcQQkBgXbZspNHjlNQmUr5LnpHXGFMXjZ2ii6/Eor6NgevDhUjI25IAIDM?=
 =?us-ascii?Q?VqXJfblxKpTQA0Q4bMss6MjIhB5+PzK2SPADdYT8ar4tTkFs/SovQYBql2oR?=
 =?us-ascii?Q?pHVtyQprGPzPQT3q1rcE+DjtxSpf1P9eWPivtl4uwlk+2as9FUcIdm9MdNay?=
 =?us-ascii?Q?KjXcOuH2LulFOznJwfGKRni97aBFObm0CCeKWyQnaXEkRUfnXplxI7WwQpeZ?=
 =?us-ascii?Q?rlztN37bL3/6tzu5r29HKGBSYmOQWbeSFmMi1k8UInb/TV2w6HfWyXNYTzu+?=
 =?us-ascii?Q?xrwZBqLeoc6gI09dooaVK6bJbezjCf2/SgMk0u10gvFV8wdnYtS+6gQrVz7s?=
 =?us-ascii?Q?EFNwVMSEb/lmew2O7Gf/MwkBEMsSD6HRvCfV+ex0G6lQm/4OsATKeO/IvYwk?=
 =?us-ascii?Q?4OsNyu/5OAubM0Zbi6LA1Cm4LJ+TDce8P/zjNSuVvI7mDEKyoDctB9eq8kbF?=
 =?us-ascii?Q?Ym8HW3w8im11sTkz431i8G9NI911Jwq9sC3Q+HYFJLQN1YJsQKHn/zgiVSYE?=
 =?us-ascii?Q?/Aqj4FQwJpQdO97enFs28sdaJcc7tnbhs3hW9u6dOF8c+uyeInyz+zCv2kEg?=
 =?us-ascii?Q?700x1zhF1Uxgz83/LVkvm7oGuWhlTmzCnPBuX4GTL5CMmyQattP/kRm+2uoZ?=
 =?us-ascii?Q?B40PF0/6mtixJtzNzxxfrjBIgvI74zqBg8SW/FMK6DWuUwJROtPbAlqpD/8w?=
 =?us-ascii?Q?gK7KLXCkxPeRE7pFAyNPMxWxaULl8T9vQs9j4V7PCRFqA4t4l3NKEsQuSOkF?=
 =?us-ascii?Q?E+A9RMRnoyJ/O7MFsLzEssXVZwRF42zTlwvdHeXRoP9D02fJ3GND0mnxVoXh?=
 =?us-ascii?Q?1AlJwOgKUkkkbei/hI/uFQY8M0aOn8J7sVGhg6ISEoymh/621xnlaH8vo1zC?=
 =?us-ascii?Q?J3e3ujMmkhYmvxxB+/CIYDLF6yipoyFfr744YWsn635W8KLXYPyafTBNnAcR?=
 =?us-ascii?Q?kuYEr2qN+UPGQpMGzl3Zs8uPp4OOp34j91Eam8Ut+kaWfKYofucB54aqKUhC?=
 =?us-ascii?Q?VzMgzI2ksX5dVSBPf6kl6El4WOZ+x2NvvjErstKQbMHLEG/SeqqVW5YNtYSZ?=
 =?us-ascii?Q?1mueSXPKV68geBK7t6B1rm3q78Q2Drev2dIH/TeH7RR0nHbV1hGepJIbmi1b?=
 =?us-ascii?Q?ExGsaQRA3PsMArvEFJYhqCvH5E7MisKzEj8yLnUT7U3iGYzmPagiBUq0IX1o?=
 =?us-ascii?Q?YfXX02q62BOCCzAJElhG++wI+mAA4eNr7T3fpbjL1XO7NRbzAwfbLSwZ+Tlk?=
 =?us-ascii?Q?5fO1Ep7JifKpFvDFqzEOte8RKTSKXLUxmiXfoH/d46r4DHpPEAg4wZ2iJhdw?=
 =?us-ascii?Q?y04ZQIvtTNQAcwAkT6p4cooC7ZneTo+CkhpRA8zeMmEvMv+3HnfyEkiW9RnY?=
 =?us-ascii?Q?WKkTPOXkxrRAyGwbepeipDvTXTKxG7H6yR5eyrZmUvP2AJoAbfuH2FacDfoY?=
 =?us-ascii?Q?Y5eZsC8OHBXkHpR6Zmo2YEEadNrvkGy72pdKzJdlXcitxwJbLxtLG2XqwN2k?=
 =?us-ascii?Q?Jhv8UjbgPrsX75XJlD2pCHlNpYsR3CmOymHc9AOanbCQ+9ensxuV9Zx1Bp8B?=
 =?us-ascii?Q?Hkk14OJarnjzGkkltav1z1yOuZHJuIeMbznZEk46sv2UsMmy0PbS7sez0Hh+?=
 =?us-ascii?Q?4ZkBA3Y2v7yu8vfQV5aolOSU27/jTlGxAnHZCccfdh0zQ4CYMpdiKaSwAWFo?=
 =?us-ascii?Q?P9wVxLoOfQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4995294-14f9-4eef-3a59-08de806dda34
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 19:30:43.6446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XqpUemrsH8obSTsG5rE3rjsEog91dshYy6RtGuS6iHG9e3paJGKzWqs1X5Pz18Zy72V0MMnAERFPLK5OJYsp6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7468
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_193049_472983_106CA29A 
X-CRM114-Status: GOOD (  11.64  )
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

Add the RPMSG bus node along with its GPIO subnodes to the device
tree.

Enable remote device communication and GPIO control via RPMSG on
the i.MX platform.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 9b5d98766512..ad1ef00a1e3d 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -191,6 +191,31 @@ scmi_sensor: protocol@15 {
 	cm33: remoteproc-cm33 {
 		compatible = "fsl,imx8ulp-cm33";
 		status = "disabled";
+
+		rpmsg {
+			rpmsg-io-channel {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				rpmsg_gpioa: gpio@0 {
+					compatible = "rpmsg-gpio";
+					reg = <0>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					#interrupt-cells = <2>;
+					interrupt-controller;
+				};
+
+				rpmsg_gpiob: gpio@1 {
+					compatible = "rpmsg-gpio";
+					reg = <1>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					#interrupt-cells = <2>;
+					interrupt-controller;
+				};
+			};
+		};
 	};
 
 	soc: soc@0 {
-- 
2.43.0


