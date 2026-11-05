Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848E4606B9D3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 19:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lU/StxgG;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=tPo1XaVL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+x/mepePPF2MrqTVLqRo4ZUvfYti5CeyvZn8wNeKnaY=; b=lU/StxgGm/bcRQ+xioAIMplK9l
	RuGqSm35CH1q8Ip3OFtKofMJzaSj3eUodv5IRNzEuhiAUndvZ2vKYgBCkO0f0QHVh+/PXhHjYpXfK
	VXxSeNFr+6a7YcG3/lfjJIaOW/9iyh6ks06gaq87WM9perYKozeZ6tWwkRI+YAdNudo1pvZ46cSSA
	X4SRIBA28y8zsmpSOxfbGF6NDcJ+yO1wrpHnr78QHM5jB6x44lpABsHobE7EVzPNrIGSNsJlOeUWQ
	vG7FDDyNDsbsj9ZUYkE4uGBRu+E0LxGo+9Y9TUkFVt55tiw/kpcqcLwA2Bd0WLCV3pVfbLPLktOvC
	YeiaprOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3WT-0000000AR6M-1Qkg;
	Thu, 05 Nov 2026 19:53:21 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3WJ-0000000AR3u-2XO2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 19:53:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BgSIDegPcWQlk+doR0WGdRecYu8cTJcLboKfLKsJjZBlolK68aExS25bUpR4UlIoPrHpdM8lx1DrN7a/ycXIi7GW5xem9mqRd3DuD2BG6fRhtGzAr2McCXRHZFmuXKDTvIXkfmlpjfui5c3xl+9WuF6cV44FAfKBWvybr3XcrxzWBybATYeukmh3JN9OQlSHBy1RZnHziZi4mvZnQF4hPBN+T16fium+713JAbrOlBDz6rLWOEh6NyzXq3U1Y3Eh+0SdVdrGdYbxetYZaBa2UGEAkgB4wHzA7MsziSF38rJehvi4rGcwGmy+eG6D7JUtRjAF0+equ5qh8g0jEYoRpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+x/mepePPF2MrqTVLqRo4ZUvfYti5CeyvZn8wNeKnaY=;
 b=aAVilq0hSVARglyAP4V8d9/+3uTqhc4VkaGtBo3TFvEbrB9C/B8Sf5OnL85zVvLVm+DR3AhHuvGzseNtSoBRzT0I1TIReipeHIIx+qOQJ3Qg+qh31sZG8IliWa4j9sz2MUrj82KaQXWl0E3FaIfwz8biRcvcuICZvoOepJJckOGKBpynoHigGsaauN7vt+i6duUQRHgigS7qi1opmXp+iPS9Z2HczrNXTvy9dN15bgaynVVFMYf24CWriPwqc4I2efpuv7UQwTqWkVWergXmf8YIlWSGZxLwmGl6uGgbD0TBDlTsSCzb2kIephSsnZ4y6Q29IvzEMLmiNu3sqJq5Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+x/mepePPF2MrqTVLqRo4ZUvfYti5CeyvZn8wNeKnaY=;
 b=tPo1XaVLexNPQ8ua7k6YQhYr8v07MwUc+r85nRYT9ZsLsrRVv3aiyEvJ2tmgpkwgy3v0+dnSsPIvISGCDxtTTrxhNqksHO4b2ma82YZFiyJViODg0jqvguqyPJ12xIQ8eXCySoRm+QRBdTJBrY4nJzu8U4Xjk0Pmymx4gf2leiVxXvLTU+m+oizlIq+lWp3qG2wlg3GjF5mhaCXYNVLz7nMW9SRomvdNHmZ/XZFd4csB0u/9SyGC8EBl7UOE3F8ON3muizvxirX3LE1D41LgqNNHdLVNr5WGDakNkc4Im9ry6+CG7y+JiFnXe0LdsgdiVNsVecDRY9pO6ygu6DX2wA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21) by FRWPR04MB11199.eurprd04.prod.outlook.com
 (2603:10a6:d10:172::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 19:53:07 +0000
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06]) by AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06%3]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 19:53:07 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Frank Li <Frank.Li@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: freescale: imx952: Add GPIO5 lines 18 to 20
Date: Thu,  5 Nov 2026 14:53:00 -0500
Message-ID: <179390837687.1654031.13234650905983591985.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005172622.135725-1-francesco@dolcini.it>
References: <20261005172622.135725-1-francesco@dolcini.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0066.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::21) To AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB12445:EE_|FRWPR04MB11199:EE_
X-MS-Office365-Filtering-Correlation-Id: 816a0cd9-f515-4040-a626-08df3b766993
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|23010399003|7416014|376014|22082099003|18002099003|10067099003|56012099006|11063799006|261026121527099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: frmJGWnTC8+ffeKMsxAxPbDv66EFi9QRN8D9oNFCYAbfz8PejTSwfxks5Zjo32OY0oeNrDmYnvGAvOILumc0iExlMgaX3TVsfgv5BRAXnHGF6j6GClizBO8uMhQyFx979jV1I5c6Q7hY98rMI29XHcsA5c6ALNDHzokJuexWdnqAzm92FvztocJ4nyKRP19lKC7d/sM4UzDrhXwzk/YMJuu6CCz9LvxWD/SJuTnRqUi8X/G6pNqIkHblM1OPH6WNY05GQRJjE0WzBegWVQPlMej/sYxnFONM9GN66/UJE15u7kYIKElZiDOzS1g4t6nSP6JEj4E/hOy72bAh6uL0jr/MgtfWpyrWvw46puC0cK4gkuwdAyRp7vIQxv19My1U7YsvLBuHq29Cxtei10ftWXUoAIx3sOMcmSwMiaus4R4vsYKyMbk36HxQ9lw8Jt9hPf5ESMAfGBChT1sCYHvPxtTdX4UOA8I/fWLB+vAfRekYeF1YsXzkZ8wMOOMpZH/Xd+gEjAW59y9fQmm0O6FUSQ39TIOkpUgqBZiolhRN1uo/b0DSamQ1iEDv2JTz3XUJozj15bbQ8a9bu+8S6j24YZSG/RokS99oC2+R/6KmygyNhH9VOl2iJiHvMYMcTq2pVkaV+pKzAf2N9GsetYJldljID2DVwF6PWBEObS1jZOo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12445.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(23010399003)(7416014)(376014)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(261026121527099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHd2ZVBpcWdpUmFJMEN3Q1l1MWNHdkRsUHFQdndPNGp3c0xRVG9hckV0TVFE?=
 =?utf-8?B?Lys0bDA0cDA2MFhHSmRyMVI4eENNTkgvOW5QY3phZnB5dm1OQ1ltVjZHZG41?=
 =?utf-8?B?WmgzQzFkUXZqZTMxZVRTbjhuK0M3ZXNTNjIwRkVKWnkwV3NkOEZHeXBkM0Rl?=
 =?utf-8?B?aDY2ekhVeEtNamVMdm53MjhjYS9VWS9uemVMVDBnQVE2c00vZUdUaG9wdkhT?=
 =?utf-8?B?c2c4RWlIVHlBc2NTVVBwcGhHQlNIVHhUK0JCNlZqNVp3Zi9yUDM1Z2NJVk52?=
 =?utf-8?B?akRkcUlCcy8rdU1SN1g0ZldLWmJmRm84OEJmM2JtNm5TcHpDb05HU1RqWWZV?=
 =?utf-8?B?RlFKVHZ0TjNCbUg0NGMzQ2pEeTZHQkg4VjlQYnI5N0MvSXlFaVFORTN6RnhT?=
 =?utf-8?B?eGJMRjVjRVhRU3ArdEpxc05Sa3VJVHZ5Y1NOUnZXT3IyZG4rNHFXVU1venJK?=
 =?utf-8?B?KytiQ2kxMEljeHNnWVE4c2V2VmpyQnNIaHZXaFhXZWJ3U042YWIzTjF6M3pN?=
 =?utf-8?B?d0NGeklDRmtwcEhLa3hyRVRjajAyR0xkalhFYnVGK01RbkhOTFJCMzhoZnhP?=
 =?utf-8?B?dktaZEhWYmtVTVdrbHVYcWM1OUhjVnY5YzAwLzkwRCtUM1hLa0NQemNOK0NH?=
 =?utf-8?B?U1FWbUZLN3FQeE5LR2xUWDJHV1hVTk5SZGhYcEVRNTJjbXIydzlFRmRHV00r?=
 =?utf-8?B?TjhObTlDdEVqQ2k0T3JYQjBFaGQxRnBvVXk0NzIvUnpra1UwM1JHc2ZNdHBp?=
 =?utf-8?B?UitkYTRHOVVhczFJQ243YlFIQ1VPZThpaElVQWRnK3lBMU90T2xyRHB5MUpm?=
 =?utf-8?B?OVFHUEtXSThWN0taY3NadGpIZy83VFp4UHZoRFR6RFZyQWZsR0F6OHVaRS8x?=
 =?utf-8?B?T1ZKMHg3eEZZNDRTQ3FQVTN0NSs4UDA0ZzJpWVVtRzhIbTFVeVdJRllHVjZX?=
 =?utf-8?B?OFBVR0l6cmUwSDNNbGYrazN5M1JxMnVndGZLTVg4bi9pUTlDaGFiT2JnVEQr?=
 =?utf-8?B?SEdqQ2gyaFNqVzloSEJSSENla2dTUlNrck1WbG1yVzU3T3RZY2FRMlRpb0pu?=
 =?utf-8?B?b21EL05wYk12UVJVaEdIMUdPQi93cGtjc3dtdEVySk4xbWNJWVN1S1ZBQWJT?=
 =?utf-8?B?aVE2a0wrQStqMVFiclI5WXIyaDRtWnE2Ui9aMy9FMDRzaTk2Y1JJMVNHT1Zw?=
 =?utf-8?B?bVBPK0o3SkEwZ2tTRUpCZmVnMkNFMU1rMTJsVVVwbTBLNU14S1dhb2FTSXFJ?=
 =?utf-8?B?MkdXUE85OE8yZ21IWExxQ0JuNGFHVUlhZXJBa0JPUmUrcDZxbGRLWEd1S1ZO?=
 =?utf-8?B?Qmt4T1Z2OG9HdG5pYzJCTjRJcVdjZW9wNGpRZEx2MnBndXUrcGhPQ2I3aVhs?=
 =?utf-8?B?YWFqTDJEZWh5VU81WG9zR3g5ZnVvNDM5R0MwV1BaMGJpdTlINWhNTyt3VXBJ?=
 =?utf-8?B?bEJQZXozWjNxYkc0cTNrUEN4ZWgzb09YNzFQWEdjdklMNllhc0kyK1RJY05m?=
 =?utf-8?B?OUxycldZc25ZdWJ2YmViZFZQQzgzcEcrQ0xRUnQyMUc1QXRjZHozZnRGYktH?=
 =?utf-8?B?YmU2MUFMNmJmbmExcytCS1lOV3ViV0ExQ1V2N1JHN1JPVGpmVDhZOTBoQ2tt?=
 =?utf-8?B?Sm9iRzVVU1lQVTVEbm0yQlF2WllMQ3BaRkhQZzZvR3p0YytCK2c2RW5RZmts?=
 =?utf-8?B?RWlHV2doYVJtZ0x3VFd4ZXRLVnV3L3ZZRmgwNzIyR0ZjM0Jvd2xQQzAxRHYz?=
 =?utf-8?B?N3NlRUplUHRVUXpVODhJR3pkQVQ2M0RGN0QwSUpXRm51dmdkOWhWMkVWM3Ba?=
 =?utf-8?B?aVF4c1Mzd1dyL1lIODI1dHJld2krN3B0U2pLWDBWdVJLTUd4Vy90VkREdG4x?=
 =?utf-8?B?bDVtK0VHU3BFc1lQZWx1ZXlxMkRZNkhvSGYybFh3bHA5dVNnL1l2UE9IYWdU?=
 =?utf-8?B?M0M3YzhvdUM2SjgxM3RYa2h5bG5VTUpINFBRN0hYbWVJQUZob21McHFFLy81?=
 =?utf-8?B?clVua3FNQ2h6SnhUVDFLN3RpMlBXYVhHTmFSMkpxL3laVlF1TCtaeFRDYUxr?=
 =?utf-8?B?cWlpNVZTRVBGRVMxcDhvYkY3QVFuVGhGYUVoWVpyY25nRnZkM3h4dExJYVFt?=
 =?utf-8?B?ZEhLN1JzQ0lsQWVJQ29WdTRiRFJ0c1oyRWM4d1hYWGp3UnRyVWd5cmhIdHlP?=
 =?utf-8?B?dUk4aXZCUGtxMCthM3QwTVdxdStXOGMrUmRBR3ZqSG1UMXNGd28wNlE2d1FI?=
 =?utf-8?B?RXB5SEtXYlJudUkzWUEreHdrL1BUOEdYMUk0LzM1VVMxNGZiV1JIcHJUZGdK?=
 =?utf-8?B?VkR2dlQ0bTZVUkZJN2h0Uy9Wcnd5VVJMaUxwMUhTRUgyYVdqWllFdDF6RXdl?=
 =?utf-8?Q?eqRtk8u9DeKHovLOr3S6+u1HxcBHPyR0cU+ch?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 816a0cd9-f515-4040-a626-08df3b766993
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB12445.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 19:53:07.4242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Ha8RPP+4lZMo6UP/zpoQPCyLA4hxwTErR+CEXxV1rUiTAwZuw285N0+pUat6KilISjpitxgS8ZZiZVZAqeiWoe7Gox9SjX0LtF8Yd7/c6zyS4CiwspeZL5CIszjdqHN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_115312_493065_58DF22F3 
X-CRM114-Status: UNSURE (   7.46  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Frank Li <Frank.Li@nxp.com>


On Mon, 05 Oct 2026 19:26:21 +0200, Francesco Dolcini wrote:
> Add missing GPIO5 lines, GPIO_IO38, GPIO_IO39 and GPIO_IO40 are
> GPIO-only pads fixed to GPIO5[18:20], their SW_MUX_CTL registers have no
> MUX_MODE field (IMX952RM Rev.1, 2026-07-08, sections 33.3.2.44-46 and
> 33.3.2.184-186).

Applied, thanks!

[1/1] arm64: dts: freescale: imx952: Add GPIO5 lines 18 to 20
      commit: 62c2671594cec8ef17d70d876753dff4f78e5ce6

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

