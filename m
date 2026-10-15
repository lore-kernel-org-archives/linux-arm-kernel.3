Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46EE5CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 13:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKpLDzSNj2ty/TEicbd1k3dPrQGIQWonMqA4CW04yQE=; b=W4/Yo7XbdcwBXLJ4Ngz3IgLUSU
	2lCLga7Ax1BGTbHA6rBk8noSkocACaA6oHZiARj11Kmn49NdYAZjr8DNLV//RoQfA3nQcfcKk5/p+
	mPbCVWLALpQkpsfCpMP5zoJY8E5/6rrQxzBnqwUkRGCRdPK4iiYeFZV5nwx0N7oi8vvkvm2SFRYLk
	3Ezz2oaosBqnYCh8vOhf1/tKu4YeBlVUQNMg3lPEFUKzDE0FTIoxfxoGJ7Ik2pZu2dMd7EW5ar0m+
	FPIf2ViRcLDKQzfEVY6jodeNE0mkQFS2EfQ301FQPi66A8WwqW8litEgpSvdO6C7wFqfz3fguk1cV
	WIlATlmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHLVW-00000000FuJ-3wvd;
	Thu, 15 Oct 2026 13:28:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHLVU-00000000Fto-3zsB
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 13:28:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YKpLDzSNj2ty/TEicbd1k3dPrQGIQWonMqA4CW04yQE=; b=Lx47XftamaBNY6s+lU8CkvhqPR
	C6O19AFC8GSkwGLMZkUkcZLpdA60QKHibAMuLsdbjxmfQnL8zP8g5RxsBNLoxYnx/5+8dz4LFhdE+
	XXZpjk0K20Qj1oTLiglm6dxV5EcGkHewbw4BZLs73ZhfLNt1AO0XMOyPJ2IN7l/gmGvfeVDxXuKfg
	CYhnytGTt+BBBEaznzyayoVBdsYBCbGr2UxBoJ3CPZKXiTbo3VQqqp6/sU8Hpw86fUK6J1ewXVtIa
	r0ZzU4kPxqpEq0STqJ8SnTI8aDgApwrx3zdtmAGKeRaP8EhSyEu4KSlm5WaZTsGL2qCD78frr+m5c
	ijrmOkLw==;
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHLVR-00000000PrS-3pQc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 13:28:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CT0d9G8HjTKLN+zj79l/g3Hgev+z32lcxpdjphzeroyrbEE3C15eL4OGq4bAZFvjKcshBk8Z6MeGQtZF0Ebj2wIGXHFLmWF8DExOh6rUO/oj8+dgkEBrIPGb58AdlSBU4pQjoeCdLn7+ggu86KlVCEtMia6i7i7lZMYC9DhyOhxUDeVsA9P3Wg9a0VeYLPdUrTgzkG7VW8XjvPi7sRYCswlDoAo6nBOpvCB03GNN4H9GJDJecyIlw2A1e+uRYRaiAF6mDdz6HhzF6mPYI6B9Ljr9cbqEEuTRywkB8co2hTfMbNQ29VtWI787mQGy2Lr3cuSere9UiEOjxVgK8mSnzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKpLDzSNj2ty/TEicbd1k3dPrQGIQWonMqA4CW04yQE=;
 b=BgLs6gGsoqJ04OvP4L5EhIOda45v0BE469gYFWU2v19FuhosgvV7h8nuZGTbmie4gZapXGJt6TPf/oVPZEa1PwYQqu3Su8YO6n5A9c1ycBoVlyLYyNt9GPwqqO8A0usKnFWXwtsV6NwiTpa9nWDjtuSgZ0SNo6hi0LrZukcbW2t/k1h62mxIXDxcOe+DnbhkQCLUy9eXGExbq4465dSUrisYLJ2W07PVzsUOAYjfyKbuujMYrJI/IkzuSCeYIREf+wCigR6GfFAAyEjnt0brArCmD3tVFitk8iAw+xW1yxAgUasyEJXybOx++fFmVAGYHPDVYzbPcp0YHLKKZhTIjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKpLDzSNj2ty/TEicbd1k3dPrQGIQWonMqA4CW04yQE=;
 b=QuMExJhW9//tDDzuy5iOuUhU2jznPy0rVBpTO7zbMjQY7dvoqgy5bmCV9HL1SU/o/hRwm6jzfXXHTRjw0/f1GKW2ES2UJWTun9m1FgYLRyg/CI76A52IGyWgPfZ7snX4/7E5/1ql63DPiDYmMYg0IUZCzmLBqB1I42raKbHCUrEAccvuBliyMeVCBPgsrXj2//mBr1rsJ64HwGdFKCxDsgGe++THm6937WhlHX569HiRrsRqVnpm3E2z/ZFUtDVBFlkL6gdTjiNyRx78ckIkZd50TbXt6elGmfcKRB3oO9BDtoM6Ac/L2u57EWDEMOST2ivpcWFYHCiPE/VkW0rMjw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DBBPR04MB8057.eurprd04.prod.outlook.com (2603:10a6:10:1f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 13:28:20 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 13:28:20 +0000
Date: Thu, 15 Oct 2026 21:32:57 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx8mn-evk: Pass GPIO_OPEN_DRAIN flag
 on i2c3 GPIOs
Message-ID: <atDWCV5jkJPAhV3E@shlinux89>
References: <20261015081149.5919-1-stefano.r@variscite.com>
 <atCy2Li2wrPHhW8K@shlinux89>
 <atC1KAbaRwnrn-mR@Lord-Beerus.station>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atC1KAbaRwnrn-mR@Lord-Beerus.station>
X-ClientProxiedBy: MA5P287CA0212.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::9) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DBBPR04MB8057:EE_
X-MS-Office365-Filtering-Correlation-Id: 734718f7-f149-4313-06d0-08df2ac02dd0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|19092799006|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003|261009223027099003|6133799003;
X-Microsoft-Antispam-Message-Info: e0//bLTvVcSfGuFgqMBmr3JLHDEYP4ZW282GbnYD3xackXSgP+wlbDSvxJVesEPphNVV20JpviFfj7BfpuFZPjhnRICuuh2byWGqZtv+5ouPIPnfm5Vf+VT6AZsF86GSnYfPIxsRK2vHvOWqPUW0A4huhuq8xF/GisZdx0J7SuhQhBX6Zzr0fp9g58Ks/tyR0AM6PW2BHzHRp9Y0tlD0pjFXTUqiqDhmEs7e1l7Jr9V/tteSJDEUbiA5Ij1JqA7K8g+8SzNywGRK0Br0fUxHeku1sYpl8z6pcpBTZaNt1N4m+NOTlB88Qxy0yXyd2GXC1bbo+Ksfx9trihKTp0yLVovpzTbylpmEg7Af3LIR7xYA10r3WiRTrcCRJzEpNBVWDr4mW6dCQz424Smfh3sjDfgxAlPEcjsZst8xwMj5+RJJzr/VucxvfRWC9IKrg4y6cR5UAPSFXskTWCVTrh3BUVjMBAcgIMc7OaOuRT1L1pFRkhWbbjgyyO3C5+QNZ/dDutzXuiTIZZVvSNMG1yTUVzyO4zivC55Otw4RLmf184X/TY3/UTq5OQE1tRY4/c8VxDM4q6mSrnuZ0YPKJCrS4Fid8wllK5Ru0pe8ElkN0wT+tCo+M+VUBhC42POpCjbOfiBeATKwuTayWR3KkrUla9wFyFSnr9LgR3DlMmEKQrY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(19092799006)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003)(261009223027099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8+/N1dZEZZxdKvjNp+PwADpPFo+El0CgI8MpiJcA+7rr8XMrrWNIhFF7EQOP?=
 =?us-ascii?Q?+EOZJ5pbnoRbYExqWCVfggSvFWnfXk1pRo1TGKovXAPUBv6uhT27LmbEoBs+?=
 =?us-ascii?Q?UVLCw8qwutFAsKZ4JjUAFDXcF23lQRfo2yuilSdHd+H0TBNlKWH+XDY4cye6?=
 =?us-ascii?Q?tXs5jzAl4SsjCWZYJQsBvTpSAH3VtW7HLcW3xI+xmDteMm5fZTL6CqTscB4z?=
 =?us-ascii?Q?SKv54G597pX/LP0qw0spKoQZJxQiNS3uo6+wYUoV8+ZM/MOzxzt/XcvmF1iY?=
 =?us-ascii?Q?EZQENgbXyEDob6Shg5Ksj7MKvCJFmA2b/Cn055rqlbgULWzuTDpp5i/c6lEY?=
 =?us-ascii?Q?IWKtS1EQ0ZiaRG9E1vFB5EXGuKkOmAuZEFt6MhpC6ERnP7hOgTaFWc+1WeQi?=
 =?us-ascii?Q?W70Wa28X7oisSgpWC3xG8fyfLO2gIzgvVT1v7DE7fMeTj2DmDgPo4xY2c086?=
 =?us-ascii?Q?2aMuBZjRK0fyPKQKB1V+6MUfA9M9y1FfNS5+XvXWdV+pjtkAk03ELcU5JTo/?=
 =?us-ascii?Q?8daOZgMuBSC/pLqzYWABMw6t9yFg2f8igqa37Pd2FMaRPo/2BqADVLN0lR5s?=
 =?us-ascii?Q?bbmfUPGih/QN7TMava7btOTcVbF4QvnsyC7EDrXFzuyswfu9bZWouiFBqaHn?=
 =?us-ascii?Q?cv6pUtLVl5KSWnnwk29NfCy/vRItbnvghXLiwXNrwagJSro4sTivNimdkOxy?=
 =?us-ascii?Q?btCM7ILS/eJ+TO2MPI+NL/33OERO3XQ7nociTeYtJmSmIHrTvJ4uZ+EAljy0?=
 =?us-ascii?Q?QpfQSOayX8REfko9bZN7FiMRO2D+IjaSvK9Zsuka1muAPgnOMXTzWK562eeI?=
 =?us-ascii?Q?2q5xOzbdI3g4+tDUbaYqoQwaOpvXNAmvcAoH92wT8cKZkIyw7YVtW+Wi+BCl?=
 =?us-ascii?Q?COpvU6iwD97jszeCEIRnX29e62S6LZOK6uv2GkGqcgqBg4d7LkGmKVVubAQj?=
 =?us-ascii?Q?5OR6gxxjgP5U/n4xCsOhLnimuIQDAayufIrqTtC+TDgfccD0UNLnLO3WfXS0?=
 =?us-ascii?Q?JqdJsyRFTfIeGycC8wFCx6UCpzjL5bPfn6WRAfhy8oBdI7U68o9f+/dGICqo?=
 =?us-ascii?Q?S9lLDM3vrTuWRjnBVusAYgLNuge6WPFdbU3HMYebJX4MtpAdfxcADJeBdEV5?=
 =?us-ascii?Q?pftVahR0NtzKW72hdEJdVdo5NLqMc9f7oka8CBaSz3mFVowR/82v+eWVon8w?=
 =?us-ascii?Q?LlkKTAJdNtabRsRGYh9BLvscE/e8bFmkGkrXwGTwdTUY+cGTHJ5sOBneCup8?=
 =?us-ascii?Q?UIrP20jRK2Hq93l/52BgHq1j9Pg/RT8UNPb0jIWBZB3EYNCZaKzNxZAo9Wou?=
 =?us-ascii?Q?O6eAb3y/RGcE3vonf/G3HPNOkSqff6M1+nsEXHSsa9g+eRavtFJP/70x3iEe?=
 =?us-ascii?Q?/hWHh/bAnXY/kzBD5PwBPck5vOWnoBiVc/4ZGlgEBiT7mCE4eMk/wULlnih2?=
 =?us-ascii?Q?d4G96xDGjz/mO13PfkHt2LRDeIJFlw46Wz3+JZeZNnuBxYgLmSiJkvJinDEU?=
 =?us-ascii?Q?GcvXjeEHiAEV7bLDLdC4GknEq0UJ/Arb/Hi3p4bAtGZPzRYnUcW4GQhvxivO?=
 =?us-ascii?Q?er6b67l7xHMT2mJkX3ibIUhhgINeNU132ASEekPPZUrNxC6WKZ0czr+tPA5d?=
 =?us-ascii?Q?9s4uLYpEYz3o3kxY3OujxuQeeu9HFFWqSusfJMBu0C7tbpdZN63VRXr91FOB?=
 =?us-ascii?Q?cmIyUhDFoQwbjgQ/4WisiRC6k1yP08IZYqevKa2JKU98wFGk3w9UljbX1fZV?=
 =?us-ascii?Q?ODIiZmUYDBMM8v/VUiILg5VINc75z+klT4FQaqyWSvGDwy1jkM+z?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 734718f7-f149-4313-06d0-08df2ac02dd0
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 13:28:20.2033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zn6XIhMWJZkmMX/Phf8dMkp4gLGoSUeTJJI35p5ZZOZr4zej0qfeisf58L37r1gbBJL9bcQy0bUzmmEBCpV18qWXPPgEa9Yo3YKdTlxThs+pOzA6y3yiEjbZ7PEH3rH9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_142826_094823_86E50D92 
X-CRM114-Status: GOOD (  20.07  )
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

On Thu, Oct 15, 2026 at 01:12:40PM +0200, Stefano Radaelli wrote:
>On Thu, Oct 15, 2026 at 07:02:48PM +0800, Peng Fan wrote:
>> On Thu, Oct 15, 2026 at 10:11:49AM +0200, Stefano Radaelli wrote:
>> >From: Stefano Radaelli <stefano.r@variscite.com>
>> >
>> >scl-gpios and sda-gpios need GPIO_OPEN_DRAIN flag, otherwise the
>> >following run-time warning is seen:
>> >
>> >gpio-146 (scl): enforced open drain please flag it properly in DT/ACPI DSDT/board file
>> >
>> >Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
>> >---
>> > arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi | 4 ++--
>> > 1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> >diff --git a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
>> >index 3e590afa4fab..036afa0f6990 100644
>> >--- a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
>> >+++ b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
>> >@@ -287,8 +287,8 @@ &i2c3 {
>> > 	pinctrl-names = "default", "gpio";
>> > 	pinctrl-0 = <&pinctrl_i2c3>;
>> > 	pinctrl-1 = <&pinctrl_i2c3_gpio>;
>> >-	scl-gpios = <&gpio5 18 GPIO_ACTIVE_HIGH>;
>> >-	sda-gpios = <&gpio5 19 GPIO_ACTIVE_HIGH>;
>> >+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>> >+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>> 
>> I think ODE should be configured for pinctrl_i2c3_gpio.
>> 
>> Regards
>> Peng
>
>Hi Peng,
>
>I followed the same approach used in commit
>2b1d5d054d29e08926f05cfa30e34d149644585e, as well as in the other i.MX
>DTS files that use GPIO_OPEN_DRAIN for I2C bus recovery.
>
>Even in imx8mn-evk.dtsi itself, I2C2 uses the same configuration,
>with GPIO_OPEN_DRAIN specified in the GPIO properties and without
>ODE enabled in the pinctrl.
>
>Wouldn't introducing a different configuration for I2C3 create some
>inconsistency and potentially cause confusion?
>
>If enabling ODE in the pinctrl is the preferred approach, wouldn't it
>make more sense to address this in a separate follow-up patch, updating
>the existing I2C recovery pinctrl configurations consistently across the
>affected DTS files?
>
>What do you think?

w/o GPIO_OPEN_DRAIN, there is risk that GPIO emulated I2C is not using
open drain mode.

Enabling ODE in pad will not make the warning disappear (:, so still need
the flag.

It is fine to add the flag in your path.

I will fixes all the wrong usage for the GPIO I2C pad settings.

Regards
Peng

>
>Best Regards,
>Stefano
>
>

