Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBEACD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 18:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3v5i/VQzeZda8e72rOElvfNQ/7bY81p38PRQFqgFKzo=; b=o4WpuwTvuf8GVP5yJwx0sn4qfb
	0QdmFHsu9whpPKKPNbElHMl8VldQZ9/FIUiUxOlb+djVQqXtItMDUt7IvLON+AvGNjfk29JfK0iW7
	GIJ+N+Jmv7qlnwOrskbI+6EsSn84jnfjIqnCbuS+VrSWxp9r9h1vfY6/I0JdWQkx80veXEOSmhcM4
	rZnWij74t0Vo2GX18OV+2d3wK0bevpaPgohqZvSQuN5OKsv5elZgW+PKtEnlbwNlnMwWGVRViuODY
	RlWW91hxPTNxSHGHJ5AVLk+nV2VKlE9x3RrWwf3IsDZ4XiEkfzN0Rv1sRBbC5dviD6IZOIFEghQrh
	JGY6JUQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPPRF-00000002XAj-286Y;
	Tue, 19 May 2026 18:45:09 +0000
Received: from mail-francecentralazon11013006.outbound.protection.outlook.com ([40.107.162.6] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPPRC-00000002X9s-3vhl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 18:45:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SyR50rJ5d5KFtjVD+EjK/1qPAnjZwG4MEa8hHlpHjb7O+n4VZGlum3/eUluiwI8tuSmEcvCliGc1HdQ2k9BtSULjTG4FhVrtHz0n6x4EMR/iYHbvmUeyptoxYT0jsvMZC0my/f5dc5meOuCl8yT6VfFuO0NO5eSFQuYMhIy8rCKgP+55Rn0HbOaTwE3Sj0CbLINF5lnlglQBa0eZSsdDMTxUIEdiFlkQWk69yrniLPZ65haiHJN1Y+RqXjqCazEdzrf39/zZbSLvs3CnA92TW83f988EFIDrn1j4yEHqkn/C3PF/juhTWsHpWzw7L7z7BoB/xlMxjOCdNwZJUfkbLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3v5i/VQzeZda8e72rOElvfNQ/7bY81p38PRQFqgFKzo=;
 b=mnWNng6UtHWN4hzwvpmKmWV2uUeSthPXp7b0uUSYRqqOX6AXU3dnNHOr9NhYPMB2IUZrKZVZ22pcd80MuI39+vo9mhmYClEJUvB597jRMXF2wkzOgTgvrT8FV6grakIJihqgJt7l2x7kIDhPBhWdbkTzxZTOzGYNDc0a7Ir2NTBO9L63EwKCxuAYQkE4pBTzDRGZOXh1VPzr3q5uIDGFSC1osJoN55CoV3vqE8NYsPmbYEVRhk8C6O1qYR9R52oTJY0MC3UtZ333fyvNLmSBjPbCKvjGujG4iSz4oe8L6vvU/o5eaCG0yLRTxkF8YdjTDdHJOUBRz1DGEIhgdcmcRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3v5i/VQzeZda8e72rOElvfNQ/7bY81p38PRQFqgFKzo=;
 b=HH8i2N986LObiybkB7P4VDRj1jERzSJuYeg6ORqGSJK27VC2i6p0UD2KBP9LSnSgS7kKhdqBypsoKby0aysFIQVZmzDybV+Fi2WgWEQX5oBwyWW3jwcVuTrDYOLu2z0PCCE4dPBsJQHy8m7HzudZdalg9Acy3MKexsp0c5i7xR+2VzFNUWEtLD7kV/bTUFXevJayfeHPr3JWCFTALppk+5UkTOrfEPnrLdeA2/WUm0pvf7FgiP06xY7CIM8fkMz0wbkNVaBmZdTJ3niMCfxe0CLu0CVr7nWhB1pV1cPJs4z3WY6qHh5nmmznxomj7qDuLyXLKLMciAQqPsgdUpvh4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB10227.eurprd04.prod.outlook.com (2603:10a6:102:456::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 18:45:00 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 18:45:00 +0000
Date: Tue, 19 May 2026 14:44:49 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Paul Gerber <paul.gerber@tq-group.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add initial device tree for
 TQMa8MPQS with i.MX8MP
Message-ID: <agyvoSFG9IQxOpo3@lizhi-Precision-Tower-5810>
References: <20260505063346.1799500-1-alexander.stein@ew.tq-group.com>
 <20260505063346.1799500-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505063346.1799500-2-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: SJ0PR13CA0015.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::20) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB10227:EE_
X-MS-Office365-Filtering-Correlation-Id: beedb05b-e953-4731-5558-08deb5d6bb2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|52116014|3023799007|38350700014|11063799006|56012099003|22082099003|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info: bBwV6S8vFvg8+FJxI9jlcrpaVEauXwwHgVYCnu4RXtv9ChCG8NuA66nOfTug/iWW/nPjt3YHTvCGucTXchEOvIlX+tOutTqwTCnbBuIPmSvD5swgn5WVwb9lfox6mm4JZaPDHf+M+2z8MfFmtZo1UARQ/ixRxmxandGrgkgs41CWzI3NpMRAn8vdoSIYy3N/Odm+H0D1B3rqfWjnjFdtX3DnfEMVyYaMluxbk9fWBBJuH0k6Nv+5WJx4g0f/u492CTSwjTdzg8b2UCK/Yc8AoODFQdn48VRJRljHlG0r1dsFc+mP4a2sewYflbI9hbjQG3RNxIYeUlccdMEAcba7SCk7/IfzVN24HmL1s+QY8L9d3Ai8B2B9OfsFaI2/8Ct+KLh2altB80OfDRF9toCWHoZVXurXUuzjgka9KQbFAygBrxbxNIzWvNnv2pQ2Kq0VObdUC9RW7vbziLewJWG/IRqZXvUyR8z6CHMvx4Hnndvm6EQCU9XylvAxVfyrK9v8xTrBuIeWKadbNu/b4zSo5s3sMk8CvRL5IgBYX6MT7LUmatOdzzpdMumpm1XKesG202ZKKCRM5B5YEuWmhJjY+OzDPuqZ1C2XYhnL2I03/VqMwJiRfFpjTLKmNliJSpiTKsgmpYKnGKedbh8VKeofIg8Ww79B5VHMLxM9aSeCH60JJqaUT5yKhaaMXN7qo7wPDIQJ8LRgUxY+S6JEQr0+/wMqXt9YOG7+SKBrRnlKMxUPitME26H36znE+yD5ocXx
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(52116014)(3023799007)(38350700014)(11063799006)(56012099003)(22082099003)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JkRAJHulefbWZDFBf0kXw/vcaVVhbG0R4VPoe91f+rmSuUP9CpLKvIo0llvQ?=
 =?us-ascii?Q?IqiY6YlAmDxwPHfspoUTQH5Iq1TSVvWXOPAcNj0YXO/jOjPSmX/EzH1h6ANw?=
 =?us-ascii?Q?Ju/5CiFci7aiuthLM3W0IYSZKznNAimld1bjJAi/XjyvmII0jWZ1MPlm/W3y?=
 =?us-ascii?Q?F7d9vyiQNeQRpvZQufv9sYLGbT05vqGa7FXjJ/2xau6ZTszlIikgDR1OvhOp?=
 =?us-ascii?Q?sI1exVg+zinKnP1TZtUXIWELo5HYRy0uWgZCpVXgPWP/dysPIVCvkmlAfLVR?=
 =?us-ascii?Q?F3mXUofuaakrepw0CWF1bPFivy9ARvjga1y23OFpEfPZX+qbp+kGXQGPPejG?=
 =?us-ascii?Q?ZNXajjmdF1CQPRmzxAdERV4esKDiihPj2M2mbLvde6c/pXQ8DWBjMFXas71R?=
 =?us-ascii?Q?gxfnthV/+VnkRSBAX3VuCyGUA/eaNqJyzji0mMamlYS8HrkMttjQQlnamarf?=
 =?us-ascii?Q?dVAQ1IHpj4SNS3eIdXeqOmmh9tue0pnzvjnJBxA7THYFlXxtvMY++WNrS5Jj?=
 =?us-ascii?Q?DcjCHir3HWrYqdAxHE5cPYqX2mktHzg2pZQ/sm7se6L45DekjLX/52Qzl6L0?=
 =?us-ascii?Q?y7STvgqusJeZIGJsdSHDXfdj+HlD8We/p7cRm0X137JLp2wGXnadL1iVfEG1?=
 =?us-ascii?Q?7ME9kRTJTLghm3W6JidIe4C53DAAZ+cUQg9oylownZ8yVT1pPEXhI5Y6B9m3?=
 =?us-ascii?Q?hVxU1LgEIEENvYGDaH6FWhHijJONHhJuNyjwx2zcwCFWmBgWXVGfsf8Gm7LN?=
 =?us-ascii?Q?VlmyRXhU9COQmO0lUzzLso9/PiBwhhCiMO/srtx+Yo9k3pb/FQZ8MFMzGWDB?=
 =?us-ascii?Q?etdGyFvfDyL/QOWDRP1sxzDwbqB6UkL9IUrfIZCbEfwPmyGOOGeNbWChMm0y?=
 =?us-ascii?Q?L4Rbrvg3g0bO8U/FdYgxKwlkoMsMEX/JUbPplh4HgsnvxS4fcreoOAgE4nIh?=
 =?us-ascii?Q?xSVsjRtmgbB1sAGOKwFc4I70gvUVF/8rdoMtMhyQ8CQAL2lJqIQ9iN0PlXsi?=
 =?us-ascii?Q?GdTobL69kBsiRrzK6jQfJB21m5f9fHjCBSjCP4OTfSNGQtPxDy11otOOFdBJ?=
 =?us-ascii?Q?aMwK04b0P8fbMSNVwxzLx0x2GMrI4FSwDcCYgfQNWnZ6FxPKXDkN9eTrUhhR?=
 =?us-ascii?Q?SpvbJV2s8tPseWXx1MowZQAXwqhOxJ1VeyOaL/cwf4obikNeBlMwuvMcZJRv?=
 =?us-ascii?Q?+qi583v4rrZP3sGWuXjcs03hMB5d0bLxt8zJnkwcKI/INcSx+JjwfJtAOIX6?=
 =?us-ascii?Q?7xVZcc5AUUJBIuDxVSNvV601r3JQgbl5c5AbGbAYDuqbik2PLjuMmdPCO1vZ?=
 =?us-ascii?Q?KIOuM7vJw1c0UAuIm0a4iiZh0jUZ3lTpWWJojfL++dNIAqI12KxlhdYIH3jp?=
 =?us-ascii?Q?X9lZ0hXjnR3J3Znmu1MR2QL2eE60koUb/SWanq6WBkgIWF+O+kEGtXxsQ4ox?=
 =?us-ascii?Q?72Cm850u/YHTrxb3Q27dwqvTzpwfchyjc0LLAGTkZs4+sJH04CVqTk8fbyHD?=
 =?us-ascii?Q?RSFrQ+B4lb3tNFW2hyenK9pSD+XVIs5LGn+ZcyXKzk21VZBkNJub5RZaP6hn?=
 =?us-ascii?Q?S8ud8upLGZq7lGmzwV2Q/I+cC+EsIchn84TeSJ/LqRcHxXTLlbjs8Uz3Ich4?=
 =?us-ascii?Q?xTsqKWYz6K7Ogc6tvFRKmkg++an59Q77AKGxY59JomNND3iFJACF7mNLIYQR?=
 =?us-ascii?Q?2RJGYqStR2ohvmoRWqrmyP9OahMBmfxIZLZNqYF211bO2Sfh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beedb05b-e953-4731-5558-08deb5d6bb2a
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 18:45:00.7810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kUBZ8HV40zcPsT3AaP4Kv0HGYmtbs9q5QNibZUMWgNmydnKRP7aaO9SPBrKqQcN9PyilMP5kurlL8Z5EOrvUpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10227
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_114506_980713_52F921D9 
X-CRM114-Status: GOOD (  13.04  )
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

On Tue, May 05, 2026 at 08:33:44AM +0200, Alexander Stein wrote:
> From: Paul Gerber <paul.gerber@tq-group.com>
>
> This adds support for TQMa8MPQS module on MB-SMARC-2 board.
>
> Signed-off-by: Paul Gerber <paul.gerber@tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
...
> +
> +&usb3_0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_usb0>;
> +	fsl,over-current-active-low;
> +	maximum-speed = "high-speed";

arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2.dtb: usb@32f10100 (fsl,imx8mp-dwc3): 'maximum-speed' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/usb/fsl,imx8mp-dwc3.yaml

It will reduce review time if run CHECK_DTBS locally before post

Frank

