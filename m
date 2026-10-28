Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE3E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 03:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gW2f2F0p;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=jgzn/oje
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ixh2GWrjU6Xyi7B5jCbgk3cftCY2sDEicu/QdGnYfu0=; b=gW2f2F0phWUHY6YfVlHnY0Pawq
	HaCcjk7GLsy0B+F011A/rxdG5nvUAdB4u+T5DIaSDGa1Jf//BIL1PbF6sUjtsjpKewaVWPANMdnze
	8eB7PUNFocIpeZ/Aoa2YCysSMLBHmExZOU5LxkFHyBk5sy2XH1jeG58Gk2GuPYKWwKqVSEhCWxRR3
	SlhYHkADFrEP69lyZ4uDnHj0a23fXuUeFIisqxDLOzl9dCw/H7lA2X2vNZYxUGrArysv+eny3wHFY
	i7kldhLhmTXeh1710CTNZQVQnh6dIsmF3khUc64ncB4NYtjaevlmmM0L69w9d1Ja7e2dGmlGCHG/o
	B0AcuyIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLu5r-00000006BzS-0X9o;
	Wed, 28 Oct 2026 03:12:51 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLu5n-00000006Bxa-3N5E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 03:12:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ha+aOlCYVIc4fCzySyxTdmm+ko2tL5JYNTpktWOYbtlKyPS63Eml8Oo+c4DG1TuKGFdFCYPql/8CdkDHunJU0vskn/ZTUFrUOTBTQBEaGProp9TYSJVmnhoZ7gzQBb+i4OADpu9ZFwtM2WskQwGBl6xqZSckFkj9SxeDjiPGlJlLwnyFZCeRW1yebcxL3xd5jpfHqao6FTnkKxHOiD7b7Pld7ryvBjK7eKK5TKMeHy5h06LxjDsIJYm1wblhSKhCB4cQDmXPzkmwN/bFZU44uBrt8n4ZrFyQYabTO5J6Z/142WLW+Wf7VeCtZr/Vdjw/7wWvjS5LgRnTmEufQgVXdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ixh2GWrjU6Xyi7B5jCbgk3cftCY2sDEicu/QdGnYfu0=;
 b=FgAcEDEcAJ7MKnI47Dth6HMY8gvzkPYe3Y4joA220FbRyRzuZ63Kd/F+jM1u8nSFakmDcpX32jXWgdc/g5RKERtRxyqDENqBTVV+y0a6GwltMkiE78L4/Nez1hISy1tOtXyPqJiDPuFG4anpCYPnXD5liHna1MFOVmSY6JdL2bs3f8eVK7sFbs5WfTAyFyg8BfKHtXHstTWx3gRssaTzDu5WxlIh3vRNeEsci0bF1WMVxEtJjrA2LbNyEeUKSsl/ga3OVrZwvfjnbmGpkVcLeVKxoN1DHOnzktuDxCFGUHwJZZM5X7j19Oh0q7TTxdjzsCN2YrfK6hPoxOzivR/gEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixh2GWrjU6Xyi7B5jCbgk3cftCY2sDEicu/QdGnYfu0=;
 b=jgzn/oje81iB7O03DwAYEmpBrNeXGoysjKU3886eRgpq41dxCgm4LJ9b2rY61e/IEf8QkUv7XUimRsflNXxjowqxnevuXeKO2977dy8tx6Q8rdaMk6zRxufkHxQLC+PZV7PgqNYEIK6pcCkPEWLRglTQjWYcHjTOslfNT3s1AXcCRZPK6l2fAC/as//8b0jO6/tBArYgLOO3CK/NIHbMrYgthfYwSV5MwwuaM85gHUFgSDr9tnKsTPpKT+3AeFfGZII06p7UGCAbJsAXGK8cPR3HfMtbuhdQ2rzvpgR1tVthV7VYB/gM9e1NukoPPBopkaTWA1QrUvW5RCodl0GF0A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by VI0PR04MB11575.eurprd04.prod.outlook.com (2603:10a6:800:2fd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 03:12:37 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 03:12:36 +0000
From: shengjiu.wang@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: imx952-frdm: support AONMIX MQS
Date: Wed, 28 Oct 2026 11:16:08 +0800
Message-Id: <20261028031608.4155958-1-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0065.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::7) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|VI0PR04MB11575:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eeda5c5-3712-4dc8-daf0-08df34a15143
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|366016|376014|23010399003|1800799024|921020|261026140227099003|11063799006|56012099006|261021121427099003|260925021911599003|261009223027099003|261022105027099003|260925022911599003|260925021311599003|10067099003|261022075727099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 4PyMwPuD8+YxLux5WyHRLlXX2Stulq2bY1nxTAbS++sUuxf5UfaTQ819WtbM9RPtrQTGIKexUD2cOijlpnzti0RulierJhDd5bZvaD42kuVQ3zsxur91Mvm/vsYBoaCrqPtOltSQa4c2bEAxohKu2L0kXz72FgURb3T6pv9Sfa1z9F0N2m8sT5wUugYuLRMFjDv4MHm+LqXU5u46FSvXPs/SK7GHxDHsfbh1wUZq7fI6Ciq1Vt6HGU8sI4P9y5x+QmULxAvDO7zaIWiGpSexHvPHHpYXoL2PF4sSe344LiBXqSgRq70PDB6xtgN6NFAtnQbOsRe4KBv3QbTkswn9jlUPknVAQsOr2OaN/2f2y7ADwwYPrlxebW6PIhu4MJCwS8zdQ7cJmmc0vxlWs4K1ooyU8AypwMynhhT5CNHamYkfqpO+iextLXZbUTvLqT7ZkTMUBblUDFOb7cdRqZvNrAef0LZ+tvq0BzQdOpJ8c1Xh28M76ay1H2rfOI5y7EIPm1aSWS+osjOHJQvJEOVl5tHWWRXlqqNZrZVqynwvmKG9zlqn4gLonhDl6Kv3Va13Du+56gSIK+DMUcIAwiDAkPcawH2a8kLCy3zoo9zVFYNTLGRMmdEHG3yKm2sILuj8u/piKYzlNtVGKAPMCdmi3221UMkUVqtzf4+nkssYJHSQgey9TegTS1jNjFIwwQfq9Tz8DYx4Fuav1e02jIgNLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(366016)(376014)(23010399003)(1800799024)(921020)(261026140227099003)(11063799006)(56012099006)(261021121427099003)(260925021911599003)(261009223027099003)(261022105027099003)(260925022911599003)(260925021311599003)(10067099003)(261022075727099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FFf51E6UCNxlXHWox32+sV2SF3K/dVVMIvVSu2iErxcfO7u6H/RQS5ceMiTK?=
 =?us-ascii?Q?THs1lRHq9PhFsvUQA18TRZbP195UIT6+PYV19rnGnnrJ+b0u4JFoTZu0a9Ls?=
 =?us-ascii?Q?7+r7NGJ/H+2dW7HMwjPIDydbvaxl9V8ZiCjVEtwsEOeh02J9l4qrB6urzfVF?=
 =?us-ascii?Q?qI8uTUUXoKgbgefBsPni4UXxwFwPQMUCIROVNx2AYCGc+blRAah12DqloHwj?=
 =?us-ascii?Q?Fkxe1Rgpmj+BnvsR+jalUfScGqr6It3cx6ZO6i28GhrPpOKUi3PLEvvYi4rw?=
 =?us-ascii?Q?PHaH44L/KwoIZ8z7APQEgzmc5Uleiazxv4aowTibIqbNhNg+T29/rdG+M/zR?=
 =?us-ascii?Q?wPcxC8lvgCiTjyxyBrxuaqR+PN+MJnCVbsmggzyeKcSR/a/+tW5y2ruLM74m?=
 =?us-ascii?Q?PmmO1yQdqsxO3LKLTxb7qPRlMIOTKtkw3CKjHXE5oS+AdWlbawdXC4F4gS/B?=
 =?us-ascii?Q?WnLvgiJyf/Ukya46uZmADlgSFZyKLrEomIkuhXIyahVTaEwbzstjBZL7RzVM?=
 =?us-ascii?Q?yA8Xpn/sr8iZLEnNGac33FMQ12XP+rNNZNsujkJWgOf74YhFXIyjRf4HcmBo?=
 =?us-ascii?Q?RUajmMuV56G3wHB1+fiZY9wDVfKXZciulciObucp7bKPzPcE965HNRnyIkBa?=
 =?us-ascii?Q?BGBrIgSnDOiXxanmobWMc19NvKJ7jzQTebpXSqpBjKIADxLcGAp3JbqgtmH2?=
 =?us-ascii?Q?fyNjOjLIlRwGTz2NHThz8u8y3MY0nLeteuFiF+frsbZJrDk+xt/+lWI6q/OJ?=
 =?us-ascii?Q?1cqtUepQ5yPZ8y3S5Q+LB+yQrxQI1txS7xEkQTfxvRZomMnj1f2YljnCKJqd?=
 =?us-ascii?Q?uA3n+8znc/VJwDo55JP1b6dAI9bppGnEbjJ/oxI2TRE1AJmUcMesY5mVXbLK?=
 =?us-ascii?Q?SZyY9P9XDINlKUPd1I1HQm1F19kHpCzP9aEBqboY1db/UWVWNTruafcRmEYz?=
 =?us-ascii?Q?GlMqqEPimgTwg6m6LATjD7VA2/3v5IjDpEoMubkkQ0wV6OZywyHe3BGf40CM?=
 =?us-ascii?Q?ulfGsm91KxVU4ljobHK6UD4cWh3tDEo0iI/CKg+DvHc8UhOtyW/+fwb5K9hD?=
 =?us-ascii?Q?yFjsXEBncV9rT0dbLArzCiepOPLPeujUe7/fwQ8cvVZ4pE8RTWByrLz4ixzo?=
 =?us-ascii?Q?ue3BGIcCvxu+XE+/IveOKyswGJ2XbccDGI8fLu/di2Jz6w8N7mDXWpKMZ2Wp?=
 =?us-ascii?Q?v5tvMhO/abykkPKr7BOZl2P84zKZi6NBp2UR47CHyMn4mS4ONJ2sSiV7jkw8?=
 =?us-ascii?Q?rH8vu0AVbtJMQubnICVxAPU36WaBJzCwsGsh8d2a+wvuxeWqrpPeQktQqkdk?=
 =?us-ascii?Q?hb0NDe+Xwa9OqXYm4g61CkoNxbVN5GTmyZSO5dQU5hBJ9duAgV7p1o9Od/Js?=
 =?us-ascii?Q?iwJ4/4i4YKprbS8fF1foH0R8KU0ADAC+MHql1GMh2x6vYWmyTMexGSULjXjM?=
 =?us-ascii?Q?ytux98gaRBTGsLxLgtLj2zsBGwt/dgRNY/Itoew761SYXHZYikJRgQp0DFmc?=
 =?us-ascii?Q?4Gv39nMXQMHO+ObGc4GB7+0+P/05vazWluqkGU/3FdnIkpNodkNBdVXCXYyp?=
 =?us-ascii?Q?pArmWihgmHcKBh6ufsC5KABL0I0/vMlF9S+Vf74b3vKsypPjoNERQlF+8ZGI?=
 =?us-ascii?Q?eMtINo3RiRUQSOMcs55iS8JiJrPT/MeYw77Z3/NMbG+XYzkoDx0r5KjhMMDO?=
 =?us-ascii?Q?imZqNFxbZk8ztQM5a9Msbm9c+mrA9hW39B5MdZzU/rNXK2i8mtxfZXM9xIIu?=
 =?us-ascii?Q?hTGHDMPBcZC0aBicCh7LXi5L6dHLNR+v6cHLNPnKlvijmSonGXkK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eeda5c5-3712-4dc8-daf0-08df34a15143
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 03:12:36.8900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zz0g+S6u27xn6pjnqe8hB6v0ha1Jxzp42HziDKnswCFn0PKmnPYdhaBCrJ8A+ZdfmZ7bAh9qwltNcuwd9y9DOZeVY/O7VQNAYl4r6K+ZpF2/uxlwjxUdf/4FSfnh5jUl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11575
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_201248_107707_6444A5BD 
X-CRM114-Status: GOOD (  10.71  )
X-Spam-Score: 0.0 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Shengjiu Wang <shengjiu.wang@nxp.com>

Add support for AONMIX MQS (i.e. MQS1).

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
Changes in v2:
- remove the duplicate properties with dtsi for mqs1 node

 .../arm64/boot/dts/freescale/imx952-frdm.dtsi | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi b/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
index 7785eb1a68fc..4d325e848aa8 100644
--- a/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
@@ -222,6 +222,12 @@ cpu {
 		};
 	};
 
+	sound-mqs {
+		compatible = "audio-graph-card2";
+		label = "mqs-audio";
+		links = <&sai1_port1>;
+	};
+
 	usdhc3_pwrseq: usdhc3-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&pcal6416 8 GPIO_ACTIVE_LOW>;
@@ -390,6 +396,67 @@ &micfil {
 	status = "okay";
 };
 
+&mqs1 {
+	pinctrl-0 = <&pinctrl_mqs1>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	mqs1_port: port {
+		playback-only;
+
+		mqs1_endpoint: endpoint {
+			dai-format = "left_j";
+			remote-endpoint = <&sai1_endpoint1>;
+		};
+	};
+};
+
+&sai1 {
+	clocks = <&scmi_clk IMX952_CLK_BUSAON>, <&clk_dummy>,
+		 <&scmi_clk IMX952_CLK_SAI1>, <&clk_dummy>,
+		 <&clk_dummy>, <&scmi_clk IMX952_CLK_AUDIOPLL1>,
+		 <&scmi_clk IMX952_CLK_AUDIOPLL2>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll11k";
+	assigned-clocks = <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX952_CLK_SAI1>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				 <&scmi_clk IMX952_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>, <3612672000>,
+			       <393216000>, <361267200>, <24576000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* leave unconnected - no RX in the context of MQS */
+		port@0 {
+			reg = <0>;
+
+			endpoint {
+			};
+		};
+
+		sai1_port1: port@1 {
+			reg = <1>;
+			mclk-fs = <512>;
+			playback-only;
+
+			sai1_endpoint1: endpoint {
+				bitclock-master;
+				dai-format = "left_j";
+				frame-master;
+				remote-endpoint = <&mqs1_endpoint>;
+				system-clock-direction-out;
+			};
+		};
+	};
+};
+
 &sai5 {
 	assigned-clocks = <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
 			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
@@ -443,6 +510,13 @@ IMX952_PAD_GPIO_IO11__WAKEUPMIX_TOP_LPSPI3_SCK		0x39e
 		>;
 	};
 
+	pinctrl_mqs1: mqs1grp {
+		fsl,pins = <
+			IMX952_PAD_SAI1_TXFS__AONMIX_TOP_MQS1_LEFT		0x31e
+			IMX952_PAD_SAI1_RXD0__AONMIX_TOP_MQS1_RIGHT		0x31e
+		>;
+	};
+
 	pinctrl_pcal6416: pcal6416grp {
 		fsl,pins = <
 			IMX952_PAD_GPIO_IO34__WAKEUPMIX_TOP_GPIO5_IO_14		0x31e
-- 
2.34.1


