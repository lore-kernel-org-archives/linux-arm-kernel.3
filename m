Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A38606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JwISTAoj;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=gOKPUIP0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9BrcxytyD1fBRsOxbYY1hfJi8RVeUmOsQjuHDWWcvRo=; b=JwISTAojy5pQO/CqkoFnQkiGi1
	Is7AcFgb3ftRD77EOLdZjobW0Q9A+LX7uvgIlBZBbgDwU3zHg/GTye3N3Vs7EAoSRDCSvjtO5LOOE
	YtyYRMHVcv+GjkaUBRHGu3zRBM0GXun3aOE8ot0OiJ4HKLJ3w9HXf4EThOGlKKzOGaO8r5gSgmSJD
	/nCwHCBn4ijSsLFHrvYsRYWQNTUpG8mQpu5V3wF+Gm73kUc1xXW/uEVZHJlgjVMJl6F3HeWC1CeX2
	eaSWjx1+QaWZoCfQhSh++mDiiP4EDWFm9itIXTJaXqzHhtkFRcX1YjH2UUoNI35dZvkCM6oX+NRVc
	pZ8hdtlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsrR-000000089tW-3Z8Z;
	Thu, 05 Nov 2026 08:30:18 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsrN-000000089tA-16DE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 08:30:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=njnpzJsNwEnonTZHRIkkudFrNn3imV6U5Eo2+AMGpK9gZkogpiLFyXB+XGDSDwjnIBGPSHAi41b/0f4ksJfKUyVLF67e+DZsGbioEHJuC1f0nLM8muk6+O7Bz53MRNedKBbQxH2Y2x6j1K2pPr/0OFdo51arDWZtsYxxdjM7m9lOWVDDyQ4eY65+M9qKsRPOcw8wD0Ec9E/RMBvfHl9HCWNeEJDv8hQm8UbwimO4hpwaZfeeOmzGqby8CxGIE74AmYBtz1rq00JAm42vNQ5HkDEyCNDdYEAAjdMu72S7C5JY741sRxHKZmqzXtudAvblzxZVjgac/bfarAIMvSh7HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9BrcxytyD1fBRsOxbYY1hfJi8RVeUmOsQjuHDWWcvRo=;
 b=ZzoS4TKBi7rwujDorQhoqHTEqDTMFYKaBwncGOZN/u4If7aXufrkApXH8e83iGUzuLqbpE7zRFAaA61c6Py8RCZPrXAvJhBV/F/rW/mqCUOVL5InKviSgDktjovMmfPb0zT1xHCve+/0PBsy4C+w8T/ArtLB8qv3qSxu1zulyHh/x3uFGAciRtXEqXdPji6EDw3xIwgN+6YzwTOxeEUnNz1SDp7KjXPMXl0YFMvkK5BDrWBN14wMiue2kBGVJJzZGWhRoLWFsW96jUdtt1c6IRL+wZE5rSviQitKQreef21H7ZBkMw/ReGpnxp9/OhsVuz9oS2Ix0qGhH2bwCIoBqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9BrcxytyD1fBRsOxbYY1hfJi8RVeUmOsQjuHDWWcvRo=;
 b=gOKPUIP0VJGC7TdqcFmojxbIxVEgKsph26HCkyymVRxS5ib/Bt2w0+t2pztGh0HPV6yOiIz3FI4QRWwJ1yIAKVUewmzj8/3eEkzclquakD33gvv18ddk3Ew+WJ2mnEgZPBRwhbpAE0tEN7JzOJAr/s+De5yQbNqhMgIw8wdNcvc8/1lRqjf5ssdwgxgjR6SZsxhj9/fgPFD1MRxHTYiazWh4WXEH0KWp8N3KPHC4wY72pQoGFQYedJCMnI58E0/t/jLfeqewaDKQNFF3etBW7rZEsCHqwcGfPwNF4eOW7nagvAroPMVlGnVJaSVUCyMIj/KjudS8HR+FRPvLkTQ7/g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB6802.eurprd04.prod.outlook.com (2603:10a6:208:184::17)
 by AM0PR04MB7107.eurprd04.prod.outlook.com (2603:10a6:208:1a0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 08:30:02 +0000
Received: from AM0PR04MB6802.eurprd04.prod.outlook.com
 ([fe80::dc36:17b6:e5b1:fa51]) by AM0PR04MB6802.eurprd04.prod.outlook.com
 ([fe80::dc36:17b6:e5b1:fa51%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 08:30:02 +0000
Message-ID: <e0094b33-f73d-43f5-bd07-19bc0e88aaa5@oss.nxp.com>
Date: Thu, 5 Nov 2026 16:29:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i2c: imx-lpi2c: fix SMBus block read with PEC
To: Michael Walle <mwalle@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Andi Shyti <andi.shyti@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Carlos Song <carlos.song@nxp.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261104121108.659820-1-mwalle@kernel.org>
From: Carlos Song <carlos.song@oss.nxp.com>
In-Reply-To: <20261104121108.659820-1-mwalle@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI3PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:295::10) To AM0PR04MB6802.eurprd04.prod.outlook.com
 (2603:10a6:208:184::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6802:EE_|AM0PR04MB7107:EE_
X-MS-Office365-Filtering-Correlation-Id: 80473dd2-9bd0-4691-c8b8-08df3b16fc4e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|19092799006|11063799006|56012099006|261102123227099003|261022105027099003|261021123027099003|261021121427099003|261009223027099003|261028144727099003|261026140227099003|18002099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info: +7JKUDIjDBqdAysVCZbYG1AOe1IBeZ35KXX+UqTiiqj9/J2iUFd/eoSsxBodBN3cHVcOvy2x+dNXCl53dSYz81Qeku/1v/z1J7eLgF07KvKU4FJZq9yo2ngZLmYfTKTH+IdZwvhAo+WHo+xkS9LdOiyalgqwuf4y87PUWLnTQoebNRUjw2bkp1jBS8ArwtYQD1QXRuKewnM8UxH8C/3mBJPboIsj36DxFJQX0KjtQX4JL51HYljZaDC6ogMcvATv+ek3qtNeJlVmc+2aRFxunvQDZisHwe+243hX+rJc5+QyP+t6rm2yjTPFRqKpYA5piZoYjNAw4UPQy+iAjzfIDfyrOHwic1GBPQxux8waRlIbQ/aC2VyYRukVT0kbCOcLuqkaN2GrNjkwumlv0FKGeaVvuqIhzqW+z59Q6HnlRrbKDFaqtAn6GMnwePgVjeDMbxO4fI+XJQ/svvtrVroiIf1OA4f3eVT0rUJbMxRQBpOzUJSffY0pWDGwKW257NUzdfcTemjQzANEaGfg+q9RzuouaiCm0UD0vobRRgMY7n2en3QWPDFtXSHz2pBtWuwyT/lmTxJWPQckKSj//2xjnxehSAKPIPDQTaU4L9+E+jsJl/xheTPbfeGY2fS08m9AJa7MKON8GIIxveG3cv+HfqJ871OJZ1SDbvzKIb7PlRg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6802.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(19092799006)(11063799006)(56012099006)(261102123227099003)(261022105027099003)(261021123027099003)(261021121427099003)(261009223027099003)(261028144727099003)(261026140227099003)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3dYaXBMbURJODJJTHRpUTFWUkNhbysyZStrdnk4bTZVR1puRWFOQVRjaXRh?=
 =?utf-8?B?UWtSVllNRTAwVmF2QVJMNGlLSWxmb2hBaW9vTXlnYzRPNnhxYUpab0hVTGRq?=
 =?utf-8?B?QWU2cy9XT213U3hLVHVWT1llRGxVbmRtN3pSUTJkamRXbmR3MXZIS0UvK25Z?=
 =?utf-8?B?YVFNS0lGM0hBb0tzd2M0TlRMc2tWVDBmSGZ5RmdyWWZBemZBSjFlcU1lZUVO?=
 =?utf-8?B?VXVPS1J4SWo3L3RDTmc4MHZjQ3VxYmNRRG43bXJNV3A2NTNZWTNYRTdKMkVj?=
 =?utf-8?B?MEZWOElEUzc4cmpNdEI0OTBBSlFSaWhxTnlXT3FHcGZCNVgyWEthSEJ2NjdI?=
 =?utf-8?B?a21QTlp0OUJDd1B2ejRhRnNnQ0c3NEs0OFdzd28zeWNSYzBwalFGU08xejgw?=
 =?utf-8?B?YjZYY2RjOTNaSTVIQnJQb2FrV1ZRVnA5ZmxNUG1xckNTNWhwemI1MTFSREc5?=
 =?utf-8?B?UkZJZEt1eCtDbEtLR3NjSGtNNE5XY2dWb20xTHMrV2RBNXNOS1pCR2lrWEd3?=
 =?utf-8?B?ZzlFcWcwelIrRmJJSDdackMrVE15Qi95b0NyZmhXQysxQWJHblNxYVM5SW1D?=
 =?utf-8?B?cUR0bXJ3bVNDTXh3UllPVTIzMlhZQXpZQlVRQjFBVEwyc2NDMnNWSVB5S1Vq?=
 =?utf-8?B?ZWg1eWtRUkhXTW0wNHNSZUQvSjliMXFnVGtvRWErSGlBSi93SXNMQTUySmF2?=
 =?utf-8?B?ZWFQRU5lNi9lRU4ySk9IbzAyNXVsNU1mUXc3NEd6ejVtSmRXbzcrakZZNTBp?=
 =?utf-8?B?Q05Na3Zza1pyWWdtQVYrUDh2cE9PaEdYNHhOWU10Y21zRkFJMnIyeFJ6WUZt?=
 =?utf-8?B?dGRCV2o3MDdHVVd4ejJTb0ZISDhiQnZ0QkNFaUFGbW4xekFnQktVbk5vTWxF?=
 =?utf-8?B?MWZOQUI4VEhQWFlXaWQrNmZhbldTK0p5ODM1ajRnRGJROHFXN096cWExKzAy?=
 =?utf-8?B?WE0wRlBzemRuRHlNdUJscFQ5YlhkdUZRUDc4UkRRNXNmMUp3bGI4aklHMVhE?=
 =?utf-8?B?UllGaTY3UlJqT1ZvWEU0V2RKa1ZvUW1jQ3R3aFhidU12UVh3Y0NWSGlYY0lG?=
 =?utf-8?B?OThiam8rUzlQV29TM2lLSXpPakFwTElFbm1Wa0dDSWhuZ2dDTFdVSzZvOGts?=
 =?utf-8?B?VERvd2ZQTlNEWDBBZElUUmxzaHJoLzRuL0ZWa2RUSVptTmZTRzVtTXhHdnoz?=
 =?utf-8?B?eXFjWUdLUER1ZjUwMkgzWS9SR0ZqTXEyc1lqNlRHcWltOG54UEg5WGpXNVVF?=
 =?utf-8?B?dHFlNEJFYlg0NDhkR0lhWUhIUVNUd1ZRVmFUb1ZMa0ZGamQ4TmpidUphQlZj?=
 =?utf-8?B?b2JsR2x2SlY3RnI4aDhBT2p4M0F3UnBDSGhkbmQzcUhXdm1nU3VlQ25ZTEVj?=
 =?utf-8?B?azN5ano0TDY3Z2thRGJOeHlOMGNrdXZDZnJMR3BkNTZtb1RTUHE5dkgvcWta?=
 =?utf-8?B?U0lKdSt5aHRlWmZpczArbDFRYndPTFBINGFnU1N2cWFhWm9ENm4xc0MzZFk2?=
 =?utf-8?B?K2oxR0o5Q2s2Y0xyRE9YSnI0b3RkdzFRMHYvODNHMGdpdkY3QkZ2WjBEcEgy?=
 =?utf-8?B?WHdSSTY4cE5SaDBNaXc2Y0Z6c3I1ajJ1QzdJTmgycHBHSWpCai9wa3RVUm5r?=
 =?utf-8?B?OVh0cW9rOXowL0xSY3RvRUZQQ29MZ0t1Rk8rV3Q4RnErWFc5cGYybitHODU3?=
 =?utf-8?B?c1VjcXEyZng1WVRvelRBa2NDeUdIMGkvY1RLWGE0YktIYTJGeDd5WGZpTWZ6?=
 =?utf-8?B?Q3lPZnJwMXgzZVFPV2xNT2QvYmVOTWJMTjNESWdDSWtWTkszNkdoSit2VGpH?=
 =?utf-8?B?UXNpNWlhL3F1SmxDSWhxa1U3bDg5cEwxbjdySy92RVVDREVadjNwenFnRTRI?=
 =?utf-8?B?OS9EbVpkMzRxczNaNW9Zbi9ja0o4dFBiZ283bSt2S3VUb0xnOFM3SW8xWkVN?=
 =?utf-8?B?dWhsVWx2dzI4U2V0K0hOaHowSDY3cUVuRzdMYXFsWVhzWVBJQzVMcTJPcXNu?=
 =?utf-8?B?aUt6bkZpVFdVUVVKeW9BYkVteDMvNDNwRitRdFc2MTU0L3paMDZZdUJkZllS?=
 =?utf-8?B?MzdrYlBkODhsN1ltN3Y4a01laCttY2F6bUJHbnZQbGphdFNpd1FmQlFpUjM2?=
 =?utf-8?B?elRQU3IxS0ZlUGVnSTYvZFcveWxCN044TTRBQ3lXQTZ3MC9mSUtmSm43aXB6?=
 =?utf-8?B?STcxOVFlT2dDOHRRaENJTXZhQTVkRFg0ajVwR1hjU2FpY0xESFRrc3oySnZW?=
 =?utf-8?B?YzZDZE10RmxCUWlNeGh3aFRzd2hjb0N1S1ZuVFdjRWdUekRraTMyWFVKazJr?=
 =?utf-8?B?a0ttaXh1aDd6cWtpRGt6WUttaGMvd1IrT3VXazVrYk5sYVdlTmpmUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80473dd2-9bd0-4691-c8b8-08df3b16fc4e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6802.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 08:30:02.2060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mKqloiiVdvpdtGkJO36vv50pFc1eMjjH3JvBVZ7W1vNSBO34Oh/7Yz2sRcCT/3A0T/f4zeDM7954AgzQhfycrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_003014_118805_23AAA8CF 
X-CRM114-Status: GOOD (  22.97  )
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> If PEC is enabled, the I2C core sets msgs->len to 2 instead of 1. The
> length calculation for the second receive command assumes it's always
> 1. This will lead to a short read and eventually a timeout because the
> PEC byte is never received.
> 
> Take msgs->len into account when calculating the remaining bytes.
> 
> This was tested on a board which uses an IPMI SSIF BMC.
> 
> Fixes: efdc383d1cc2 ("i2c: imx-lpi2c: fix SMBus block read NACK after byte count")
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
> index 7302464c371a..f57e800ac3b5 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -563,7 +563,7 @@ static unsigned int lpi2c_SMBus_block_read_length_byte(struct lpi2c_imx_struct *
>  static int lpi2c_imx_read_init(struct lpi2c_imx_struct *lpi2c_imx,
>  			       struct i2c_msg *msgs)
>  {
> -	unsigned int temp, val, block_len;
> +	unsigned int temp, val, block_len, remaining;
>  	int ret;
>  
>  	lpi2c_imx->rx_buf = msgs->buf;
> @@ -612,9 +612,13 @@ static int lpi2c_imx_read_init(struct lpi2c_imx_struct *lpi2c_imx,
>  		 * keep MTDR non-empty and ensuring continuous ACKs. Only update command register
>  		 * here. All block bytes will be read out at IRQ handler or lpi2c_imx_read_atomic()
>  		 * function.
> +		 *
> +		 * msgs->len is 1 - or if PEC enabled msgs->len is 2. Two bytes
> +		 * have already been requested.
>  		 */
> -		if (block_len > 1)
> -			writel((RECV_DATA << 8) | (block_len - 2), lpi2c_imx->base + LPI2C_MTDR);
> +		remaining = msgs->len + block_len - 2;
> +		if (remaining)
> +			writel((RECV_DATA << 8) | (remaining - 1), lpi2c_imx->base + LPI2C_MTDR);

Hi Michael,

Just to confirm my understanding:

For SMBus block read with PEC enabled, the PEC (CRC-8) byte is appended
at the end of the transfer. In that case the I2C core sets msgs->len to
2 instead of 1.

The previous code still calculated the remaining receive count assuming
msgs->len == 1, which means the PEC byte was not included in the total
number of bytes requested from the controller.

As a result, the last PEC byte was never read out, leading to a short
read and eventually a timeout.

Is that the issue this patch is fixing?

>  
>  		lpi2c_imx->msglen += block_len;
>  		msgs->len += block_len;

-- 
Best Regards,
Carlos


