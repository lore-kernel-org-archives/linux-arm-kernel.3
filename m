Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EDBCA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 15:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oFhKysmbnO1Va4Zn5vHKkoH6qm/CFrrfJ3nuDf+cUvo=; b=pyJMIcVFfdGz8CR7m7Fm6lfsM5
	F+R0n9njkmA9SsrXLSs+54xLWuzZ8CYK3BGcMuD2pqH69AY9/l6MjX37V1+1eTIHLIYsH6bT/3kBy
	y17fT/SdAHKI5sVuLSTLK0/stz5JQNbjYNLJ1KKIZEDNsDim/jMKUMMx/HinIHF9zW4ah58+xbk1Y
	pPo0/rX5wB74FvqOT7xSoo91s2uW7FbxptatWuv0rTmMCGxMSkb+U7oe3T9WNvNnw/kBQz7Xof1Iz
	Wc83zwxaB7jRGtnV/B0ZlpRzm5Mi0L3gVshcvoKTgGA8RgfoRq7iLow1vzFzOw43t5IYflRhgG5SA
	1lz5yw0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwa0-00000006aOK-1EOe;
	Wed, 30 Sep 2026 15:50:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwZz-00000006aNk-1Alt
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 15:50:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oFhKysmbnO1Va4Zn5vHKkoH6qm/CFrrfJ3nuDf+cUvo=; b=fwmOKbBmGkrlRHpBYBHV2zoXtL
	ME2sXDbL3P9mRGLFPx372gZBCEiyk9JIs0hD/eGD5j+EYHzA7GB7xtcd63AdPs6eLZGsegeWbC+af
	Tbz+36VN7mkbawS9A5tcB7eTVDt5dImByHuHxbuY9u2CjBY6y3oSEYw5Yuk5PqAnu+Y8ZsP5RDpDP
	G4E6+CzVGAULywgPAN2YTMOkA1bYE6GwUVQGMJbyqElCZmqIq199YI9Qv/2c06WBokSfRUIG5+W4q
	HtYXwghq9hbASqqDOMj2FPokcOzefWutyVxozlE8h2W4A+7dnpFFepZAz2PRFEhKZR6xze1xDPqPG
	IrZ+r93g==;
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBwZw-000000041j8-208I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 15:50:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f9/jlqdSre7ATGP/Hnt1cBBkOWyitqu692w+PAUKDRLdeoVHr7/WRGJezVut9w8oCu4ZCk1kLWRBXJT9uKtrZVW1FMpCwqmtZZYbdqUraCXYHrPppsr9TQsXhA6sSxSmrF0pCkuNECRSt3JeMMSU84eVGpHO/YcBIuCH36J176hyrtlAhnA2qvQa7/Ximi5ES97D9EP2PIrdtvPCBVuI3VtmwnWh+ygJ+t8AN/YXPHCK1tpib5Twdea7uNRoYAcc5LitrS2pWy+CecThz+JVm2C0IEottsL84XWnHZhRqdGN4XkK3Bb/5bN5DuuIn9qJ7ucsjpgl2DXOFYEabIGfIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFhKysmbnO1Va4Zn5vHKkoH6qm/CFrrfJ3nuDf+cUvo=;
 b=DAzUvly8OTtk7tN1Tm8MNy600LbXaQuBgdn2tSYdfPv9kcMo6y2mw18x10PgBIyLKb6GOgSeOilrxt22oysN4UY+0iSDy8EE2QAnUaUpW7pLTadyHkR0FK3TOEuFMR/tocfQ2rAoxW6RwaeetDoj0ilwS/bPfnnywLxSzEcjPT2KRyvYeMnZrT0gbnBiKuirrDG5Gh4KU9ZjnzlzAA+u8s1gVI8eb1S3Phv90px4EdQdc1+4huXNGfySEB/iVonB3n9c5QLaTW70mhOB9CJwgMhManYnrcEBYiD/LlCpTHW4UlQiC1nTMuvcFthAraKc5aEk+XIneu4ZqCOxELCfHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFhKysmbnO1Va4Zn5vHKkoH6qm/CFrrfJ3nuDf+cUvo=;
 b=w1sg0wORAgWu6BviOBdMhq4tSpxKwPsm3CL3maFuVeJ3eaarcSMa3odd9xynxzIqf3LbP3Ycx85Uy4rouEqqnir6QAvxJxvJJUOUCYb262c72Xbf6C9NeEreYA51Ko1ZQQxrImXhAZ7AcBbcABvZz1ISbmLfrc76xKGm2DTL/3GiOcudvY7dKrEMGYzMXZpNlJWQQdlUsROaEH1uLXvIuokrI5TSC6cgfZ8+ev/GeyIgs1QsurqWsZU89HbqWARei3QADf9PV0snu0ebMuVP0wfmLcflHIANztSXNvgXjh0yIJInrAtMOjxUnOBkPhLFz7SnPgxmTOu7v21ov/VLRg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB8PR04MB6874.eurprd04.prod.outlook.com (2603:10a6:10:11d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 15:50:40 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 15:50:40 +0000
Date: Wed, 30 Sep 2026 10:50:29 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH 3/4] ARM: dts: imx6: phycore-som: Convert to generic PHY
 reset binding
Message-ID: <ar0vxTCkxOg00jhn@SMW015318>
References: <20260930102532.2262700-1-primoz.fiser@norik.com>
 <20260930102532.2262700-4-primoz.fiser@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930102532.2262700-4-primoz.fiser@norik.com>
X-ClientProxiedBy: CYXPR02CA0044.namprd02.prod.outlook.com
 (2603:10b6:930:cc::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB8PR04MB6874:EE_
X-MS-Office365-Filtering-Correlation-Id: debbd80f-504e-4e72-c6d4-08df1f0a93e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|19092799006|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: Rj53XlMO+JoWH5HbNEcHXxTQmScteDmWcHNr8QsYZ4DHUVJkCtPQ5Wb6KkYiJv1pF/8fSd3ppoFdDnLrBts2Mwk0lFlDAWcKgNPQh/UtoJ0N1PVU4DbRqJX3xSzHMD4bt1b7I8zRUmaJIiSTTJbd6GRmAR8+Jv6OSC36w/x0QM8Npe7YeW1lLHjJxg2qnvmAIxvHjpHgiMkSzDm6kJ/hbbpn6VDklme+SMO6XYprtHLOEwjiMuybvqgsoeIlSX2x/2KBc8xItm3aJeSLDjsxl5NeCEnX1IAAWr8xqWQo2KnudbAKEwuc2oqVkf2qRdOij6S82+22Zo61mfuaGB2x0WRTgw5lNkKscAf8W2j668ufjdqHDb4sQaYXe6MYYVN+EaZOsM+v7VoR1/y59I/fK7lXElLxd7owBXeaBJX98iqgmyr6IHmtXtL/02NP/0/G+PiqeU2p9hQXifDZPCny1Gv46BO8EGBuGUW9thaVnvG2vQ33ZKraeeDM+dcMRppZ4cbpMNydPQj72CHqkshn1ODfUhQCEuAuryrLeuq8bL1izGW7utRGsf0hEQt7/IwmOANneC49g7pCIrIlVDBCUchk5BlXwvQIW/gWe6PZwM2GIeAMXB/2UjmtC797pM9I0A1TDsVJErE90aF9GTBewC9jPkmRmJi9CIpqsMtyQrQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(19092799006)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A+oRPrkn25+/gIr/5GmWz2xsUWk924tqz3PvmKdpOi627mcS/xufeiK0fipS?=
 =?us-ascii?Q?XkDsxvzHIHhf6XU95M8ozvI1MhlXi6Zxwo60D8qb13YgUdfW75mc27XsQ/Cc?=
 =?us-ascii?Q?sLpQcVQP9PUosELsnx2JCVY6/8RJH5BdAHkOlMOfId4c+ICdVEUF7HLzQwHl?=
 =?us-ascii?Q?vCaAXR8GDarzuKupJIPUJSbZNkAwbr9dAGn6YkSDahOFUK7Ck8nrxDsmtQqx?=
 =?us-ascii?Q?Wvkt2S1R3wsh9mGX7cJ0FWhKu+erdM9ntBIA+IFQ7I3ShsGI5yhXWKAfP/aK?=
 =?us-ascii?Q?4mpkDGEnhS+OC1omHAGqP4hMhk5Nb0PPYhF2mLsnwzxmlj9UQ8raz6VCzs1s?=
 =?us-ascii?Q?wv1Vyig0144/mYIYCye2mZ93v1s7wmawNPBDs4E5nSTDR92B5wfD1AhPefDp?=
 =?us-ascii?Q?Wlz8OW+xdTwZR/mDfeXPBRlY/JRc7HsSaUTCXFT+oGn5lpK48+yevNaL2Ai0?=
 =?us-ascii?Q?qUpgiX820OR+Ztg/GEfcfwsRxSfOmda/xks1i8b2TuuuHKLZM6hAGW0nA5HB?=
 =?us-ascii?Q?7I26dj4aqN5BBWoE6mqugflZownGj4chF5WT0ikfGftBt2u70bpDcKAMIxh1?=
 =?us-ascii?Q?19PeErLarVW/s7kDEibSC57fH+WdyvvLv7jUCR2rZ4CNOnR64jnSjaLr4LCx?=
 =?us-ascii?Q?Cp6k14Yeu5JojdxENSiyblbHFIAzSJqAvFHbPsNEnjIzvT24m8+ibS9EdK4a?=
 =?us-ascii?Q?0CdxrQidPkW7z33IDozkem9a0Cp6q8VqgAD+9XrFN+OJoSVpXksqc41z2s1x?=
 =?us-ascii?Q?1xV5gKw+jmpDEq5D4rfkAfZ31qcauQ5ZLBIgOPd+pZw2U3dnCDLvkpCKiEWE?=
 =?us-ascii?Q?2yBxIgFqkvhw4v1H1lcbiER0x+Ad0s87l9ZJ40XPDliKzQ6QJIsH7x0G2Zm0?=
 =?us-ascii?Q?k7H0/RMHbHt2wVYAqWeZK6eHVKQdWeFTcAh4twgAq9GQbY3S243rISSC//qG?=
 =?us-ascii?Q?afpiyUWubjeAXLsL7QXV9jOsY1iKzfwOZ0q2kRV/fZaPBWoBdWxElmHJ2xdj?=
 =?us-ascii?Q?fiiArxaa3+irWuUrwKCFJWIxDDkusoTOPUnR8FXFswTIT5MIF/TX10rr0sVk?=
 =?us-ascii?Q?ELLKfTKm3mldUuDJtyQXagw/axzzeqZvna+r5t0mHgXLn/708Gx5v/Dtprik?=
 =?us-ascii?Q?zTvycm4A3KGQTQUxaEGkVdwURMOfWY4q18PPlgcWtQmsmG8ZNPP0+tz5G7cA?=
 =?us-ascii?Q?nIk2E1uwwkkU0GwxnmECgD4d3WnIG28vj2vsJDb0oKmXAHMoIVeVqROJAoV9?=
 =?us-ascii?Q?8pL+ISeq3U+rE2kZq7pyEBCKIueM2/Rj/z1RliYxsGTqeSBOUVJYomciFjjG?=
 =?us-ascii?Q?Bc0a7+Pz0FX1uDNkpopJ7wvV57oLLAI0JO5oS/HcPqWryTsCps0ttJGBBlJW?=
 =?us-ascii?Q?QXKg6MSZbWFXn3xMSu2/2/wZfY+cTeYIVMnyllWYny82gyHiC0Sc0WKmeXvr?=
 =?us-ascii?Q?z4198EW0I90X/kLkNkH5jYiEQcmEFUIpNboq5AFkiSMDXyEdDolOYYmnaemv?=
 =?us-ascii?Q?U3LUUiVrshcSwH0jrwdrqTUxE9IZ4ov/OPMR8zEcTyJFtaupD+PYVJOa3r9j?=
 =?us-ascii?Q?6e1uDMA2oRbzEUzL1GLQ3+J0Lu8RUkXUrl1uK9wUTO5DQUbsuBmvS4UeZwsS?=
 =?us-ascii?Q?M7KehXwxGiSWtYbY3qLcBFmilHaMt7v6u8y2J733DI8fQh6w76XbOPJ/pOP6?=
 =?us-ascii?Q?ngScw2zNSuzddLa57i/8A+vGN7ohud/idlgiKI0gQfjCoWZx+QJSy30s5a9b?=
 =?us-ascii?Q?zQNR9cJLqZ7F0waE0gy3i7RKMoCLmZLtzBsPBV3Y84dPLVpjyZLt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: debbd80f-504e-4e72-c6d4-08df1f0a93e0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 15:50:40.4930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mykG3f0iqs1mICrkgusCsauYkSZrXDqKhd2WQLa9+Lple4hnLBND2my5Jskr/W1mGzFGQYSGhvP9hjYMSTAfJWp04UXcgwPapUIbZnLaFIs/b1ffTGC/gdHrQnsCtIDl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6874
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_165044_643932_E65F50AC 
X-CRM114-Status: GOOD (  19.51  )
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

On Wed, Sep 30, 2026 at 12:25:31PM +0200, Primoz Fiser wrote:
> The phy-reset-gpios property on the FEC node is deprecated by the
> Documentation/devicetree/bindings/net/fsl,fec.yaml in favour of the
> generic reset binding on the PHY node itself, described by the
> Documentation/devicetree/bindings/net/ethernet-phy.yaml.
>
> Move the reset GPIO from &fec to the ethphy child node as reset-gpios.

This movement may impact back compatiblity. Any other user use
phy-reset-gpios under $fec?

Frank

>
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> index 9070388eecb0..88eabc7af6b7 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> @@ -56,7 +56,6 @@ &fec {
>  	phy-handle = <&ethphy>;
>  	phy-mode = "rgmii";
>  	phy-supply = <&vdd_eth_io>;
> -	phy-reset-gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
>  	status = "disabled";
>
>  	mdio {
> @@ -65,6 +64,7 @@ mdio {
>
>  		ethphy: ethernet-phy@3 {
>  			reg = <3>;
> +			reset-gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
>  			txc-skew-ps = <1680>;
>  			rxc-skew-ps = <1860>;
>  		};
> --
> 2.34.1
>
>

