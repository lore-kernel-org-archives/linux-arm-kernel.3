Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF02CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 08:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtVI4ELe1wm0FzTkP87LI5l+CRp7QNykVseRSmBdZYE=; b=4Z4BDcydx5HFbL6KoLuPEOYs4E
	AeU2VXXzlWVKlD1MfIcZ9d+9mbS1FfimXgzv6zHDTgny5cAlOJ7pebdn7TGCkWBDpH/2qi9NGCOFJ
	ZnHPYbXXUx3eIBG9xM463RYEVvEZyWsCmqHKlbuhbRPhpxth7jB9do6geMrfJsrVlAa7MJSW+26t+
	10tt59iScMIryM6afxrUx73Fd9nw3hNQq5uL5q3ZP+wxJnSnjT+C0AkkWdePh8vqfYxuKN5MnKqth
	o1LO3AU5MSou46/1JkO/HCIxzeRMRM4L7tXZOU/3k3KgnH5z7mrunySp6DCJJQz+ok4qUygXt3uCA
	+qR/G8mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPcap-000000040dk-0ymU;
	Wed, 20 May 2026 08:47:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPcam-000000040br-1Qhx
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 May 2026 08:47:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=xtVI4ELe1wm0FzTkP87LI5l+CRp7QNykVseRSmBdZYE=; b=ENC/mop16VpMi0/jsmVS9XJO1f
	46hPx0QwWT1UdrthoYjdoVBUscoXB/MitZ2p4/xqcffGTNhP/yLnyDPcL1yox1AUt8uGi5y4U1GhG
	/ZvfLvZnERB5JypeUJWliEVp1n/nlWAZ4l4X+2Ve3BKcDqO8llEoN3KZxDAFy20R3cyy5hPshfU1O
	hFDRkWa2ZvEV+xCW++3xKc0aoDBPAG2mIepf+NjJM5P077iRRbIsnJHWwXpFf0N6Ode7soYn8Ajs1
	dvOesZfYC3Xu45jgltZxZOFWG1Jv3DVlFdT8oJFWl5S+vBqEhe3iiOiiWePbNBVufukoXfO2XKxxY
	/P58yBig==;
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPcaj-00000006vB4-1xEd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 08:47:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q4QEc8bl+u27wr6ubqZsy+W2Vx1iDtcaR3m1Y6dMbGiJyy+JEx5ltI1B2CExI58LlItHVRsSkvsjOS6rGZnS4Y/AU5uo0ceKCvqhYG+dR7E05a6XeQsOwVJdf+80dvYRaK20kqqN/gl/ahF4bHRwFdHMLVI3uDHU9jykse9o79jAyHsWn6p744OWb0Zr66cGEb3AI7kMwXr6aZBw9g6jPkN8rnfAuVLUZwHv696k2gXSmsEjPkys9KiQHekBWFJNE2ma3ImqoWGOj83G3hlXCQqaZvE2KIJey2jZRoPkFWjoczBO8ywH2iPBHIqHOkes9y9JdYua74d9O5QfHvAXPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtVI4ELe1wm0FzTkP87LI5l+CRp7QNykVseRSmBdZYE=;
 b=q/P+mFfXFGm+YIG2DqAXuoY5cU0txmVkADhZ8NB2gMi9A2bjDBBCEUyYVECTr9zv6ixc5DBPzQiqORQDT7T2fOirjaNX+mcdTrENP4LTE06g/TByvf1Mf3fglDSAej1o+7gV9hVUi1Nww6iY9QR65JbvifshuI9XhTgqo3PtXMPd/ixWsYUjjuvOgrvgBlTAXDMlRFn9NarN2BP/WGh5clLVC8hZeopM/d7uw+KFNMOVGdicV99cziWpIclqlchbujCW5JiP6xbCUOAwXVUEDE2WsV5D8xx0Cpe1PplKrjlRks7pNZS25+D02SxsckjPLFKNKOI+ucESDOhz6hXm/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtVI4ELe1wm0FzTkP87LI5l+CRp7QNykVseRSmBdZYE=;
 b=Hf+ExymzKKux6bctqygvxGv10qazxhPivY56ykwl1kjsZRz/QYW/7DM5tz4ft+FBNzjJ5kAT2Y4vRqyYU6gy0BhP1XTewMEcbwMfPgZDeeKTlTmEawT4Ame4Y7erKAnAGNvvG9kpU4y3jc158HTocZKM5dB4Ozl2xtrky9ItIwsDlZigMhYQwBJaQJaio3ns6edNhcnrG/olc9SsZlHu9YIIeW7ppoADyjWI8m0tqrASOPfji3tWbGkfrGgHCAMF5B22qLEGfZnCUA2xCkBaIfKB6/FA6ZAmrz7rWaCQA5kV3rmwHZnY7ytdoWUvb9PLjeAR2xKbCAs7KqJh2dH0iQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com (2603:10a6:800:296::7)
 by AM8PR04MB7442.eurprd04.prod.outlook.com (2603:10a6:20b:1d8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Wed, 20 May
 2026 08:47:44 +0000
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be]) by VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be%2]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 08:47:44 +0000
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
Subject: [PATCH V3 4/8] arm64: dts: imx8mm-evk: Move power supply property to Root Port node
Date: Wed, 20 May 2026 16:49:00 +0800
Message-Id: <20260520084904.2424253-5-sherry.sun@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260520084904.2424253-1-sherry.sun@oss.nxp.com>
References: <20260520084904.2424253-1-sherry.sun@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0127.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::12) To VI2PR04MB11276.eurprd04.prod.outlook.com
 (2603:10a6:800:296::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11276:EE_|AM8PR04MB7442:EE_
X-MS-Office365-Filtering-Correlation-Id: a1000148-d14f-4c15-e1f1-08deb64c75e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|376014|7416014|366016|921020|56012099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: d3+8J72/P6qhgmKJn1qtf2D803iu3w+EhOo7bMeSap3CLftIChk1bSHq5LYFwrv15cQDVlXs8Obis5h3ezoJ1v7nnvu/cGyqyMMGoITDhJkCLYc29XT2PEJCZGxOszUWOoE4peE7yn0FCgVt/LJP0MobG3iOnDtST8k0n8jUFixHK/FzGstMeMSw44jPcW18t1ySazcKkRMsBMspJTic6xcb9E1/9kuzPtq25VmW3iV+F8MBJ+lpbyD4zUAB+bVoxKz9OUJV4LQFdDNshqhla5SCcT7wOCa4w5wsisHwP3ERY3L4eKzf2sTMsflg91Xf9Sbk+MKWjkGNiUlsXOJ5yiLm5PNWGibhI61IryONDEbenwauS5/D/CkO3lwH48gFN+BOqrk9winjj5k6Nmev+MnYJqbAwoWOX7tVsLp6Z7u9Nkvb6TAXI+ACK6EWoZuTfP+4YNorctumS/9rS1zrimdopmb+lCRT2jdXiqRchCf/I4lcgaSPYxfSetWJa3Lya37z3F+ayvQB7VEnMaZVEKlRjaL60pdGbcDLHGlzI0sS8HqWgCBqioMtbN8xKVBK/D+px6rkd4QNqyIBDkU5WcGbSHgVwIiuJqmP1a5aEvu11rA/5Q7fM4IT9F4YrXGBoTp+FSCL/3BPfQ4WL/fLC40elon/+XKavKINPG6nGVsQFdcLOUW7cm0R/WB3KvWQkAznAnQcR57o78PyCQmQsSzD1S7bzfIxnG0k5DDr34Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11276.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(366016)(921020)(56012099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X/UDhVI7A/3iy197100Mos1OznYRawHE/zjMEYNdAlODA+jsoWcf0vHHzsdN?=
 =?us-ascii?Q?ZUgXJBE8hZkHmK9UjL5J0y/Ag3HrE0QSeS93XOW24hMfxdIsS2bgL2XxEHTF?=
 =?us-ascii?Q?9C1slQ/9kBFI2OgRn7HcbzjvrUbFWPh0y90vRGknfPUZiCvwHX2mBlyCgZmh?=
 =?us-ascii?Q?Q5FTfLJBr9jhBwFEpBPj2E52jDzm0jrhaiexvY5GkUS+B1KugBUZ4nPEcE5C?=
 =?us-ascii?Q?rnJtDJyTa30GEFeK1pTxS+XUVhYtWwNCwCyXQzgtMfBXFCD6b0lOIP9pFxxw?=
 =?us-ascii?Q?NDyM2aCic1yfz8pbnhyNQZoIdFvriwNhBd0UMB2NIpGCQr7QOY5VbOeL3oDu?=
 =?us-ascii?Q?M7WHVpJoIQsGc4qJ5V/DrmcqBEmOK+7VJElAFPlir0efdD8X4CNK2GxlImLX?=
 =?us-ascii?Q?SAGvCpDGMpwrasy4SVnRwf8wJIXeOOwF0OtAe10T8fgi/07JtOKYOwDzrjla?=
 =?us-ascii?Q?GzkU3arno/1VrFs+QGdZPJn59K936d3S3OUGp4716JNSvNxCErY6mzuUF+3W?=
 =?us-ascii?Q?YfREVNwFItySUC3qzwN7UKGM/JbRlp3UPkrFCvmJ/c9eSabCPd3fbru/xRBB?=
 =?us-ascii?Q?QUf4A9f1ZMj0WCQWjem7bC/JGk1AYZo2wYALx3s3bE6EDKut8ZMbln4StPYx?=
 =?us-ascii?Q?lgbGzSNYPd5T3gGXM4jzG6sFBHuH/PpqnUCOnQmDLcLXmefalnlOhKONtNc4?=
 =?us-ascii?Q?oankKVe28OiAkMRCV26MGfioRMzvUJc/WyCGD4OpKmGpvd9Qp5E5GVaJNTW0?=
 =?us-ascii?Q?yt+5mzsvtl/miY/rhaL73SjNsfkXbwyC/1Of0MRhs8WJwUnaPfNIhu9y40/b?=
 =?us-ascii?Q?ZMe7T29D1ZOzRgdqWVamOG0x2f4lEMOeN3MhZs8Bgq4akQguEmhEldPu7nh0?=
 =?us-ascii?Q?QpgEAyWyXR0YnpjQhsLsFVBedAxQCcLmktz15vDoxx4YLprYp6t35L0H/cBa?=
 =?us-ascii?Q?eOY5RbwYilghrTyr+7XCUfZvaT6nA4aQ72VZeKtvagWY/8gXTKfulnQ7/+ld?=
 =?us-ascii?Q?2I6dlICzpWpJXvMl3sJjjTrTvRgHxhxM66poBUdY+4Max92Z0Oh+vjmtrpMM?=
 =?us-ascii?Q?M9t899Ro6bwV4BnWGKAvTe0qK/peFmtC+wI9wpIHuEw6jm9qXpwpR1KXh4x2?=
 =?us-ascii?Q?Gt7RtDz9x/NmjKgJjso9TMocYPuxIXn09P7iKZ1lyKmc0pEIam6voGYH+4ho?=
 =?us-ascii?Q?7rnaavBuUTK0M1ASLM9E2CXgGNopi/hmxh/BA6iXlm5vH7GJWrw8RPlXROG4?=
 =?us-ascii?Q?jgNiIYGHDgR5WI781oBN9LaczSXr5wMCWaBMDgomMsF0Q0vYdOd+z3fnXNbc?=
 =?us-ascii?Q?JBoL4gpn5JpdT7raXWfi78bzs2BGrWKlr4p1or5ul3cCssg5QeT9tbFDQR7W?=
 =?us-ascii?Q?ZYCluYTfJnsSvdao5iQ+473Rg6O9NGrgTRtgOTeqxPNv3OluZm4cBXv1k+GG?=
 =?us-ascii?Q?FUpHAewaKEO04dvcNajfb2513D86h8Uf7A+mVIXtcxrfuR/6VAaImc5qf9Of?=
 =?us-ascii?Q?OHWhqY1Z7UL1C11TDOoP+KwAnA/WOeQtLNEFv866ADOK1m/FypKrAfo/mCYm?=
 =?us-ascii?Q?RBrUaLaN++vYvitM4WzjIKS3W90FUnA83R+59Wb86LlVXgXB0ASQArR+SvzX?=
 =?us-ascii?Q?3XiLXcuV/Qf0d3KkLrdelgyI8k1dWY07M9KOxuMfNOR9+cs7ug92nXAj4i2O?=
 =?us-ascii?Q?yoD/fKpKEssgax5JW7Vs2szjPMSXCaM7e1kHyMO+XnhHVZLQ+5Ux3mn8elNP?=
 =?us-ascii?Q?jrd4aiL4QVax6cmcw0gHXnPsNs1V1W4UMnddZYxxKzHOqHTIXqhx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1000148-d14f-4c15-e1f1-08deb64c75e3
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11276.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 08:47:44.6904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iXK61iiuclFuH8D6VVUVI7dm++rwTq4IUSwlea/3RyBphQ2AzTx3fzwOru34B1qKsntZMtuWpV42ffg1ZIsFTChyyZa4rJmX7CxQXuoLzixanGAd9nL+bGu/ZJu0vlyM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7442
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_094749_629438_01D4AA1C 
X-CRM114-Status: GOOD (  10.91  )
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

Move the vpcie-supply property from the PCIe controller node to the Root
Port child node to support the new PCI pwrctrl framework.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
index e03aba825c18..ba7fa0815d13 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
@@ -542,7 +542,6 @@ &pcie0 {
 	assigned-clock-rates = <10000000>, <250000000>;
 	assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_50M>,
 				 <&clk IMX8MM_SYS_PLL2_250M>;
-	vpcie-supply = <&reg_pcie0>;
 	supports-clkreq;
 	status = "okay";
 };
@@ -562,6 +561,7 @@ &pcie0_ep {
 
 &pcie0_port0 {
 	reset-gpios = <&gpio4 21 GPIO_ACTIVE_LOW>;
+	vpcie-supply = <&reg_pcie0>;
 };
 
 &sai2 {
-- 
2.37.1


