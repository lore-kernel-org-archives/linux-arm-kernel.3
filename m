Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411A0606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 23:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ypJZhVNW;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=FJWZI7aV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9iRvSuwf6mJVTWpR529GutK7+dWh/wKMGBnvBidJn0k=; b=ypJZhVNWFYcNcnVe7MQyXF61wb
	j4GhqtpMOfynyZA5cZAVGOKpxata/zCjPxA5Hj+H65dSZEWGP0olSnQCbalVwDzVtLbHhSr+d51c1
	F1rLhLvF6zLLO+G71ualQC7Bt2GDs2qzQcXGXZQQaKl8iWI+1NIS0OqZRKTtW82eJ32/fuXHi0Vlh
	papBlyIazl2k6qDwoz4+Fr07pg9lfCXLoIejULhgsj46vNGHSbutfXez7A5OuQ3vxWFAwChB7V3rZ
	IJhXPI0UeMADwGVXUiHV53DqjHFRRAfqRHIgeOXzAG97nL/xjVbEVfYMNeEde3+MF/jtV/d5gK8ht
	68FfwmqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1ld-00000000hE5-2px4;
	Mon, 02 Nov 2026 23:48:45 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1la-00000000h9D-33MH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 23:48:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c1u3vs0biVL5ID0JmHgDx2CehX5l2vzCKD/0x0QEq49SMrTP+d6C6Y8UPvB3JlzK6TsmTrjWPLYmFPkJDaEVWW9h9bLSd1RLT7Kdf2Fll/8My099nMm7+eeycZQDXa8U4kgN92pWhZI2X7PDNEYA9WtuRCoIcHAsSA0XXiPXDpUFmUoubTjVBRoWGl7qGaMA+PvovuNtNFFsDX+diOS5ipZlrUbWtuiH5pqnm87fQC1Y77teokX4iXCWKRbRg7rGT/LLv1hydGpu8poVLbC1PEDoMiXEwVpKsZc14oshEyMD6d72wJJCl/ViDfhby52GnbRvJD58PE79LbFnGIlHWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9iRvSuwf6mJVTWpR529GutK7+dWh/wKMGBnvBidJn0k=;
 b=VYAxKuppaOPhRK+xAvNP+5G+WeTNCro4pAc97zV518TXSAD+KSpQQyW6aCow2x/mvSWJ4aWwmc5y+1d9/CqBjaSDpY3cPEBj+SkbI6vtd1/3+vf0SGY7Uel8d+ehL578wZXTMQANnqIyADbwj49Hl9N1B8QC4ZyyZWBMRzdWvMA/9uBGDcT8uqKjxvOX1nkxILmP4wrTkzzkG4yakkEtvi6ZAWdOKZNgB/hinJsM1DeNTuDPPHFe7L2sFkVfBSLeY+bg1ovD55wKtCjNoE1+TCukZRAdxQaFMwkmGMKgd3axdiIkQR6NSP+tAgqXmpRgwVXef4pOoPcqy1kMyEwGGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9iRvSuwf6mJVTWpR529GutK7+dWh/wKMGBnvBidJn0k=;
 b=FJWZI7aVRS5Fx4OwOct9vtJ13RbkZM+mhMyFj7cHWaSaQ2Pecpi+kQ/6gbb7S05xaBOYl4onQPbDuPhQE6gvVp/x9xpTlTr4FiQiy06nCH6QZS+dPCFYfye8OnkrrzdvN4gjqtQ15vvoBB49eukESXy+owoSgSlKshs8tPF5QvFkg/NKwCalDUJMoUD0NeBZkq81ZmNEENHuyGg7HPF7sgTvz4/rRr68RfGBhLFMiO3nln0df0yEjAjIvMa4iLqj+ayJTvlWQ3Hpxp6wlYNaRJrNo98wMXv9SEouRBeJf2qrzQjadg3XbPjsNzLy8kGiPDcMB1IIw4MuXHxkd3CAWw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by FRWPR04MB11103.eurprd04.prod.outlook.com (2603:10a6:d10:172::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 23:48:18 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 23:48:18 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Nov 2026 07:44:12 +0800
Subject: [PATCH v2 08/11] arm64: dts: imx93: fix gpio clocks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-gpio-vf610-fixes-v2-8-7c71fb36e184@nxp.com>
References: <20261103-gpio-vf610-fixes-v2-0-7c71fb36e184@nxp.com>
In-Reply-To: <20261103-gpio-vf610-fixes-v2-0-7c71fb36e184@nxp.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI3PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::7) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|FRWPR04MB11103:EE_
X-MS-Office365-Filtering-Correlation-Id: d10cf5d9-4ec6-43df-2906-08df393bc522
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014|23010399003|19092799006|18002099003|22082099003|56012099006|261102123227099003|10067099003|261009223027099003|921020|261021121427099003|261021123027099003|11063799006|261026121527099003;
X-Microsoft-Antispam-Message-Info: LiQ+OWcaYzazr20bPqjpuHpo1JleqWTPIHhnFc8eaAjSM4i4axxsPuHqBGnPph8bPLyN9Oz7ksnHnnBewTfVw/6YclB19nEfqzwr3IUZzJgv4jYcnr4Als1jB1RS+go30eCZ71mZtnb2P4cRN8ffBESWRNFzGCIMXT/kqqHmSCN7U5sXJHcuE3fwwkIfTmAV+qLGpfL7xWy0suuoRzt4ZeVIL4Cw+rvokKjjGb3W9YlgcI9c2ZuIsdaIqIdcGsXIc05grDJvSF7Lk6sJ/uSkn58Cj+Ueh+4NGYezrAy4w4gZG1yVNHoehbjsbH48gWcosawi6Z1Lf81T6tREehlwtaCOw+rZtL842QiP+RJTDP521kWzAh0uufha0i2NuSvBvXKoMYF6LK0bsxrORJQtTOFMLmP0Y/5IgkrB+uTJ0a3+kPjIC97TYtI01b7u9TvKufzERhv7e89gkvMSzoB02YUe5oSSswQJzjJVvCCjboPIiOfYDMBzbRGaZRsa6k0lSEHyz+NB15CJbZ3BqNK335LXTgUEATctUVowWpKAkt0Q6FDifMPW2IAT86GZbtZXcxYDecUkJVUwWPSxGjr+e5vH74Ff3ZU3ZyS8M8MFk//HJUB/n0lVzQOFzERY93YZpJPbRx6VaKHKoVDG8NgIHBPRyXUibyOIDDaYWBHSefwHz1SVoK3VT4qQRKFriVHqCoNpufRY/nTPIb8ie9g2RQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(23010399003)(19092799006)(18002099003)(22082099003)(56012099006)(261102123227099003)(10067099003)(261009223027099003)(921020)(261021121427099003)(261021123027099003)(11063799006)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2p2b1ZHMzdoaGN1VGs2d21OdXl5T252S3ZwTkdCaCtZc3EvWjNXUlNMdXdM?=
 =?utf-8?B?VXNmT1A3Wi8vNWNabU9QUkNoTzBCS1MwUDNORXN5UUNqZktmMEtNdHZ2enBB?=
 =?utf-8?B?d2U0ZGRJeWZicWhnOE41TU5uUDI2ZzBIZ0o0RzRXUUF0UjVGaFhCUDNmSDV1?=
 =?utf-8?B?ZUU2WmlEaXV1dU41QndGZ0NMcU5yL0ZjU3pHVnQ0SXp0L013NHNxdS9ielNU?=
 =?utf-8?B?Q0FHT2tjOVFHTnY1bHdDMUxZdUpnam9NdUYvZVFoSVpjYnl3dEYxT2x2UzVJ?=
 =?utf-8?B?VVpXN0FtTnMrdHdsb3RrWnkrQzVwM24ySHkxU0lBK01EaGhBZUtjaWE3NGZC?=
 =?utf-8?B?UnFlbFhhSGp2ZWhDb1RmcUlHK1gzMHZHWDFMMUFjYkpJU2FySEJXN2pQSWRx?=
 =?utf-8?B?Z1VSTTA3ZFBRT3c5enN5YWgyYTdQVGwwaURqVjR2OFArQTFyUHdZOHg4L082?=
 =?utf-8?B?bzJoYng0UFBidEw0TmV4eFE5M3B0SjBaOVBzeTBjRHBlb05hQ05PSHNLczB2?=
 =?utf-8?B?UE1VR3ZRbUh0RFhKcGEwQSs5RlZ3SFcrL1ZDSnpTaVpOTjJwb1R4YVU3UDl3?=
 =?utf-8?B?M3N1bXFJdW5zNVdkTk1uaUZ0a2lLNjlaNU1oaWNyTEZQaTY3Q295KzFMMkxV?=
 =?utf-8?B?RWxQbW9VTys0V0VIVS83dUhtL0dwRjlBblY0VXE5MFlQV1FaemtSSG9BYXFh?=
 =?utf-8?B?UFNRRHBUWHQvR292WmV0Uit5MmNsaXRtMHhqNjZ1SEkrQ2V1V1IyVVZoVmVk?=
 =?utf-8?B?U215a2RneHJNdGZ2Z1p1K0lyMGRlTHN0ZDNzanVqaWYzV3hUYkZPdTV0WW02?=
 =?utf-8?B?eS9xMC9aYzJYK2xKZ1hjWFRqbTZya25kQk42ME1HSldkeTZqS1JLRGhKZG1L?=
 =?utf-8?B?dm11bDB6bmRPRkxoTzdQZUtpRGQ1YU04bEg4cEUxM2hVemNHMHp2WUkyaTdt?=
 =?utf-8?B?S096Ym9COUFJbGV1NjYxVGN0MmcvOFRzQmtOSUJENkNhM1dvUHBuWmVVYlYx?=
 =?utf-8?B?OEozQjNTQUttSDcrZEpKZ0JHaUc2RzNSOWVFZlYrSG1jamZqaGdzejZwVTlw?=
 =?utf-8?B?RjhEazF4ODg2WmpvMm1rL1cvdFpWWmZ6RjBIWVhXa2hINWMzai9ONXk4YmxY?=
 =?utf-8?B?Mm44dksxVU1YTWRIb3A4VVJ3MHpvcFB6Z0V0QTBEaFdSdzNKOVk1WFB4WTZx?=
 =?utf-8?B?ZTFHT3kxKzRsZUovSVF3aEE3MyszcXlwL3ppUmhlenhudXhRd2o4NzgzQnh0?=
 =?utf-8?B?cThOVXM0VGxVYThOZjB0WFZYSE1zWDFiTThMWGJmTXNZUitNcTl0QXRzeGVN?=
 =?utf-8?B?dFcxbmVmVW1wZGFPaWVmeG9Ma1E4WUNVVzRQTk9LQ2lrNmVBTXA0YXU0WDVH?=
 =?utf-8?B?disveGNza0t0ckVVNHpXUExrUmJaNTkrUCtGVkNWNEUrN2pqL2ZEZC9vMEFU?=
 =?utf-8?B?U1ZHY1VSMkRqb0lZcEFGWXNEcUxWVWdsaVZnYUtHb2ZPeWVSZUFQTzhaSisx?=
 =?utf-8?B?SEI5Sy9UTG5uM0tlUFF2amM2dFZEZHp2Y3VRQ1RoOXZtbW5DU0NLTzdIVXA5?=
 =?utf-8?B?YVkyRnRrOEtodDBnNDM1d0JlOUNrV1dQOTc2WmxHbnIyWkZDS3poaHVxNkhh?=
 =?utf-8?B?Z3VROFFwa0hoM2dBMnI5WGdlUnNDVjJZaWVFU05wWDBsS2JjNWJQNG4yeGRN?=
 =?utf-8?B?WFpWTW5OZFp0c2c5UXZUazhySE5adjRMclpNYXBIVHI4WjFDd3ZsMFBGVTFG?=
 =?utf-8?B?cVJ0OHQrYjc2bko0MFgwVm5hSUZVK29TdnNqeXA4NWF5YTgyZXRwcUVPZ29L?=
 =?utf-8?B?RzVuUGM0eDZaWVZPTldyOGRpWHRJRXJXV0doTnMwbGdwV2poTitUVHV6dU9L?=
 =?utf-8?B?cWlEdmUvaktIVTZRODRZdXBIZ2c3YWlNaTFweUVhT2JFL3BkdzVVejVqWGt3?=
 =?utf-8?B?ZndsSlpDQlNZeVdxNE1HVUpkV293UmJudnlBdi85VjNWTTBaaFRqZThadUhl?=
 =?utf-8?B?VjQ5ZEF0SmRTR1VybVRYQTRja1hiRFMwVHY3a0trVGk5MXA1NlhBTUQrSS9O?=
 =?utf-8?B?S0MzKzd0cVpCd1VaaThENFhxK05laTMxZmFURHMzNFRscmNTNjExaDFsbGpz?=
 =?utf-8?B?dTJzWmJDK1FaRjhnR2Rjem5OeENUMStlTWN5MjF5MExxTEZKTWNBOTE4aldo?=
 =?utf-8?B?RXc3SGo3bEZZSkNrOWgvSEppaGUvOXNUQjFNY0dzTFY3MXcyWjBodDFTWGI2?=
 =?utf-8?B?TmRuSzJ3SUlWMGwzcXRKVUorc28zUm8rRGFPekFtS3VMSmdMczRXaTRxMW9H?=
 =?utf-8?B?U1ZvbGtBWjNaWGJ2Sjg4b3JNdGdxS0pTN05hWGdLeWpOMk1hQ3JBVFJ2OFhU?=
 =?utf-8?Q?zzn5BaT/z+4hfm/nB9l6IiUeZFojnDqZ21ewR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d10cf5d9-4ec6-43df-2906-08df393bc522
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 23:48:18.6050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ho5/v3LCkW+Gp03H4Ll1mNKPo697UDL4dyOymxH1BeJOxt+8w0Db+ZdzG++rQkVO9p3Te3BvqGN+CxwMYnMuR9VlATdyj+nExkdX6XEeunHuP1IoRhjw/P7QkGNHurV4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_154842_811538_DF8C2238 
X-CRM114-Status: GOOD (  10.16  )
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

From: Peng Fan <peng.fan@nxp.com>

Per reference mannual [1], 28.3.5 Clocking:
GPIO receives a single clock, which is used for register access and
synchronization with external pin inputs. So drop the 'port' clock.

[1] https://www.nxp.com/docs/en/reference-manual/IMX93RM.pdf

Fixes: e41ba6957139 ("arm64: dts: imx93: add gpio clk")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
index a68ffd04ee08..cf73dab17637 100644
--- a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
@@ -1034,9 +1034,8 @@ gpio2: gpio@43810000 {
 				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&clk IMX93_CLK_GPIO2_GATE>,
-				 <&clk IMX93_CLK_GPIO2_GATE>;
-			clock-names = "gpio", "port";
+			clocks = <&clk IMX93_CLK_GPIO2_GATE>;
+			clock-names = "gpio";
 			gpio-ranges = <&iomuxc 0 4 30>;
 			ngpios = <30>;
 		};
@@ -1050,9 +1049,8 @@ gpio3: gpio@43820000 {
 				     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&clk IMX93_CLK_GPIO3_GATE>,
-				 <&clk IMX93_CLK_GPIO3_GATE>;
-			clock-names = "gpio", "port";
+			clocks = <&clk IMX93_CLK_GPIO3_GATE>;
+			clock-names = "gpio";
 			gpio-ranges = <&iomuxc 0 84 8>, <&iomuxc 8 66 18>,
 				      <&iomuxc 26 34 2>, <&iomuxc 28 0 4>;
 			ngpios = <32>;
@@ -1067,9 +1065,8 @@ gpio4: gpio@43830000 {
 				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&clk IMX93_CLK_GPIO4_GATE>,
-				 <&clk IMX93_CLK_GPIO4_GATE>;
-			clock-names = "gpio", "port";
+			clocks = <&clk IMX93_CLK_GPIO4_GATE>;
+			clock-names = "gpio";
 			gpio-ranges = <&iomuxc 0 38 28>, <&iomuxc 28 36 2>;
 			ngpios = <30>;
 		};
@@ -1083,9 +1080,8 @@ gpio1: gpio@47400000 {
 				     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&clk IMX93_CLK_GPIO1_GATE>,
-				 <&clk IMX93_CLK_GPIO1_GATE>;
-			clock-names = "gpio", "port";
+			clocks = <&clk IMX93_CLK_GPIO1_GATE>;
+			clock-names = "gpio";
 			gpio-ranges = <&iomuxc 0 92 16>;
 			ngpios = <16>;
 		};

-- 
2.51.0


