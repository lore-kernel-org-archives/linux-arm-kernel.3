Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F6D606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 20:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HdA5UDJF;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Yf4yJI8/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=w1jpolbFkouvQq1f0pjIfh8z431CIkNLLWuvwJVtOlw=; b=HdA5UDJFI8B3Sc6xqNOcfMm+FJ
	DSZh0CbWckq513Ytu3SsUwQPv38Kur9KLa4hBCOZvtUIpyrtGNvLNzvpK4GvH8UEJjyqjs2JdKqko
	lUFpdVHg++g8IwB2DT1fXigrPTiN4Rzx1y4JNs/flqn/4t2242So0YSUhDGfOwIK/0lbN1hi1bMCj
	I/pGHjICOD2x9uJMEO8eR8wiO6YaoU9pgtvIOCExvn502B7ZADwMNKgrStPVXpkjudYP6+1l43J2v
	u/ECfv61L0B1mNUbfiMCWmmUO6z2V0WreVICj8Sw/riSZyqBFqD67FZpAymRk0kF0IBzCu2fSjRHq
	bByfFDwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3hU-0000000AUrg-39ck;
	Thu, 05 Nov 2026 20:04:44 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3hS-0000000AUql-09GK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 20:04:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8fcbRjW+AoF48A93WaYqxZv5B0oXwI/2z6rG2WjsEQ3hM+C1L7uTWfcesaBoC4FIqSS9yMZPNa6+Ev7cninDaVfmInKMxNmpJ1rlYQ2f7R1p1xvsdjnSZBgo1svXBQxl1gfnR9Zw0K2gZgkW0qZ5uvt1n7ZlzBvH6NjDVffqR3TFY3qK6Z+XIgKkJ8F+hTvSQYZRTSm8l0CXuSBi6yqCOr/JXOtDQJZ9FxfkmFqgiz7BuObRBa/az+Mup0b6fxRYp5WT/0aaVGrqG04vAroSr/vLOjU5OgQesEcTicMU7HD9neb8I+SuMsOi47KlpJaIRlnEXDHi9oiFFufsoJynQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1jpolbFkouvQq1f0pjIfh8z431CIkNLLWuvwJVtOlw=;
 b=YYlZ7bPkSmCQPXIdN4IC6MOsVLMtuyJ+9KNbUArYn9Uili9tnAZ/m1j4BCAdoO6+izdk6QjBKAtFoQdM5/4FkfcWlpZuPYqAJSDr9E+DBKsMcTu16U73hcgAfbkLEsbWW0af4bMdgovMr1IrxiUAmGZ2x5KzIsaroB6TJvAvVt+WveAz1SPAF+oysm9UJM//7/VoWhBF6fMKbEGfe5hq+90zkbwgPkC18Ax9V3IkmZ7lLbbsUhs8l6AVcpiotciCT0jy0HTiZSg9J/pkP/egB1r6h6pagPeTAJ0SV/Q97HMbq7ktvSP1g4BcOYy77QkqKrPlTkN73NHp0LP/jRbmNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1jpolbFkouvQq1f0pjIfh8z431CIkNLLWuvwJVtOlw=;
 b=Yf4yJI8/T0ff5MG00Ie4gQis2wHcPyYdXuYtLKTbvlfa98NJigTEhPkE4P5Ft7MJr0k9QUQ+gI7aPTk6sR6QtNosGA2kukqNTKUznqj6Kd5B+iJvTFEzpYTIGbooRI4yXunSV0PRVH91riOSL108Gzqra7fe73TGazBgrrt4JArTPxvxqkwFKXcouqzDS618qsMjECzoeYTwdjj4mrFPso2PpuPoq7Uox7tNnanUcbvptp0r+Mv9QZ45WrUWPd4r5sSqrf92yZ+pzVBUAvu0lzJksNYJrO//prohwkZWZo59f8DBR1LIssQluMXMrFCHgI22Oq9HdTixADJmyQt9Ow==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21) by AM9PR04MB8763.eurprd04.prod.outlook.com
 (2603:10a6:20b:40a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 20:04:38 +0000
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06]) by AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06%3]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 20:04:38 +0000
From: Frank.Li@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2] arm64: dts: imx952-frdm: support AONMIX MQS
Date: Thu,  5 Nov 2026 15:04:28 -0500
Message-ID: <179390906304.1682341.13745639199701882161.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028031608.4155958-1-shengjiu.wang@oss.nxp.com>
References: <20261028031608.4155958-1-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P222CA0015.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::28) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB12445:EE_|AM9PR04MB8763:EE_
X-MS-Office365-Filtering-Correlation-Id: afb789ca-13a2-4c70-bf28-08df3b78053f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|23010399003|376014|1800799024|7416014|18002099003|22082099003|10067099003|921020|56012099006|11063799006|261009223027099003|260925021911599003|260925021311599003|260925022911599003;
X-Microsoft-Antispam-Message-Info: z00et/0OruiOMWwUSwINdUqE+L8TGQM8a3zg12fqB2HBQBUgOwdZtgQkOYLKgqTpxk1DX8etc1OgkFZi7RGLTmLsm026xkrZr3rkd2sDbI9fdGMhVOTmFaSWkcUdcyViokLzF4Kft0atXp+sLobzk61OJGO39f74Vku25ornSKj3nyExGy9DuqqYiG9RuxgPADKqwIPnA8ih4WXuXghxMz2sS/sEH7y8NKnvvRt/DVtbO+nziwig2m9L748erH33ViVbbiGW5pPR8J6JnbYf5YJResFL9C01wuGfzSEhVFmgDPQeO78djkUiM/9/rk3gqXffGNmhb+p77GXW3CgyluxBYyo1T1ZiWgbuo1OaEgdkS6C5CGQKMJPTRpqihWwO1r1q6q6+psDqSqzgcxTkZ2S+KWgtMK7RKF60wP6XaIn8jUdJMbSypNaP5K7mneyquFeMcFUMORxZeOvuFlRXVKUU72vQ9AtHXV5K/S9AtNuz+P1k4hSpOfW4WDwDa0iCc88fw+3pI66a9n8GvD5CU/9MCuhqwx1WnmR8ySwEQ7K1QhOCXr+laObHu7RxTGk9u93M1Um0zGH94/bI2GTG6vFkyblreVznqetNNHVi1UHfP/c9wwXDmSv/G3IIqARZStIct5NAdCIJ5XEIiJA60kApdSUvITQS+TJypcYGjvxKl06HeEHleQharNWiy0FTGn/FAdO/U/UzYXYT96wA7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12445.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(376014)(1800799024)(7416014)(18002099003)(22082099003)(10067099003)(921020)(56012099006)(11063799006)(261009223027099003)(260925021911599003)(260925021311599003)(260925022911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0FNZC9hSERYaUxreDI4M25FSThmczdKcGlNUllHK3NuMHdEVTFGU1dCODB1?=
 =?utf-8?B?RWZheGhlV3liQXFqK3dyZGNHL05lS0kyRTNUODFoYVJZbnF5WmZaM0NqZDli?=
 =?utf-8?B?bGw1M1dLeGVMWFFKZFRRTUxOV1l2cEp3a1FaMGNKVzFPcjlVZTFIRVFaK1Vk?=
 =?utf-8?B?cEFoSkYxZXFMcmxjcVBraldVU3hpUWxObnZUVUw2aitMNTdZUmFUeCs5T1pl?=
 =?utf-8?B?bXFVQlNBenlTQWZVaTZ6YjduTWxSZ09oYW02aUlzcCtOUnM2QW5DdDIwSmZZ?=
 =?utf-8?B?RUxqQ2xqelh1WWNWL1ZXbVI0SVRkZjdSbW9wTUc1dThoUlRiVjFxQisvcDZ6?=
 =?utf-8?B?NVpWN1RVTmxiUURNM3ZhMkNTcTd0OTBuVTRVa3FST1lmQzVreG9xRC9FcmMx?=
 =?utf-8?B?Zks4ZlNSQ1pWSHhzTVBRRGF4ODJuTFJqRzY1QjhiK1hxdWFFKzZSdE9aeVd4?=
 =?utf-8?B?d3ViNXlJZTlwLzc4MTVBR2ZjTVFvYU5DVXlTclNoK1JXUjJvVldDWEZXbGo0?=
 =?utf-8?B?R21PWUZybFhNUXVGQmxpZVlSTTBEbFJqVGxjZzYwdzg3Z2NURmk3VzF6VERJ?=
 =?utf-8?B?NkJTWjFWTmtrY1JpaFNlL3FGUFExa09lRWRSNjE5SWRtRmYzWFNDTU1QMVB2?=
 =?utf-8?B?SVc4d0hJYlhoaHlCVm5pZ3JTMHNTSm44STM5SGxqUjdVdGJSaGh0R0xmKzla?=
 =?utf-8?B?dm5VNmsrNlErQ0hFZDFSNFFKZldpQUxtMGJCaEhqcHgyK0U5Tm8yOWRCT3h2?=
 =?utf-8?B?UVNkdXpNSGFpWmZKVmZIdHI3TGJ1ZEdva0lmaXFmUnVTcFY4NWp1aGhhWVNP?=
 =?utf-8?B?YjMyUkMzVlR4THRXWGI2eFlZVU51MnR3RkVuRWxhbGdQTWRlS0RWU2lsTU53?=
 =?utf-8?B?UE4rZzlpMWk2Z0tFZzN6L1MvTUR1RmNYSXNnS2tRT1RiWWVvNERjcE9WbUJu?=
 =?utf-8?B?VUxPMGRpTkE4SHY2SEZlczBiM3JHdlFBbUUyUUVZS3NzazVHRkc3L1BrVUFJ?=
 =?utf-8?B?R1VNbWFLUFNqWUpvMnhoWGY4WUZtQjhoY1dPZnNBSWFUQnNrTnpkcm85aWRu?=
 =?utf-8?B?d1BGck5HcnBWV0R2TFFPeUVyTXNPNGhFN2RpeEVpYmxoY1dxM0tNZkVDT0Ft?=
 =?utf-8?B?NXhDMXR4UFdiSittWFVNMnFxZzZ2VDhMS0xKK3BvK2RxaCtIUTlQZXcrVWwr?=
 =?utf-8?B?MFdVamx1TUltVFVma1dydlMrcW0zVGxIT2lNZDNBcUlERmpUbnlhTlhkbFBC?=
 =?utf-8?B?Y09wWEFPeW5oY05MZDFKeDdONG1MUG94c1d1RTZRNFJWczVLT3lyOEJQaWtE?=
 =?utf-8?B?dkJSUjZLWDNhWWdnREg5NFB1WEsranpBK090R2RCR21zblhxY2ZoQVY0QjFX?=
 =?utf-8?B?NmZ0TW9YajhXMUpUUmxHQ1BiZndUblJSQkxadmY0QWJ5U29oMFlZOVhNTWN5?=
 =?utf-8?B?dFh1SFNZNHZrNC92UkZtVWVRbXcyZDhPM0s0L3pLVkoyOVVaTUpKVDBFN3Yv?=
 =?utf-8?B?a0FMKzJyaFNYWTBMdlRxdk9wRHdBNWZ5djRwMnJFWEVXVE1tYktXQk0zeXRY?=
 =?utf-8?B?THFHOXhzbUM4Tk5ubHQyeGN5Zk1pS1JhNytVNjlYdVB1MW9XOFYrZnlCeURv?=
 =?utf-8?B?ZUJZOCtmZG1BcTR0ZHFWeXd3cDQ1RllKVlNJeFZxZERnaVpuWXB3WEsybWkw?=
 =?utf-8?B?WDJwdXNOVWlUbjZxUW9BQTUzSzN1MlJxZDNKUFY1V1ZHZHpJaFQzZW5tUWdH?=
 =?utf-8?B?MDNZMEltVkkwUmZPRjdUQmViaTlZaVJRM2JtMDdxOElxTG1BVGszL3AxMkM1?=
 =?utf-8?B?cUtUUWk2WDMyZDJSTGhYbGJOZ2ZabVhVQ3lSTGpZdW9BYWNSRm5qYXZ1R1VW?=
 =?utf-8?B?bnE0RlNKNmVyaGJJVXpCaHpiRDg5OEZaMzE0NVZRMlBDcUN4U1JiWFlVUFVR?=
 =?utf-8?B?elZpL0FPYXhDd3ptYUtzVGhRd0U5cGhPVlJid1VtTjBYMDVCRmhNaGlmdUZp?=
 =?utf-8?B?NTJOTjQzL2RTdUpqKys0M1U4M0xwNVBDODJWOXhNekVDUGxyYW9nNHBGMzdL?=
 =?utf-8?B?aHNIcjQyOXBMU0VqQ1BXMi9oRFJaOFdrSmkzOUozN1picDZPODBvaFFpTjQz?=
 =?utf-8?B?VGVMbVQwM3hrSXVoZy9NVjlyMlFQdytGdll1YmdSKzN5b1Y3cUR5L1M4YXhE?=
 =?utf-8?B?QUxBMDRScks2N3FmZ3VwMmEzZ1Y3VXdGbUhtTVZpczhyMGN5TEVZNElEOElG?=
 =?utf-8?B?NE44OGswV2hvUm9ETG4rMnJoeS9MTFdKYVBoWFpTazRJSjhJb3NTU0Z1MVF1?=
 =?utf-8?B?TUlaMVNpdFcvU3NveUFhYUMwWDdIelpWbGJOV3RaRDl1ZmpId3RqejUvTzlK?=
 =?utf-8?Q?1oR5yQeuB131NVljMe9BSehm+wZ2zI2VaMvbk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afb789ca-13a2-4c70-bf28-08df3b78053f
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 20:04:38.5577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 71tPvERwHPqi5eUZXRmClRsS2WTaucfGIYyG/UwSMljk4k6PafG8RObkttjkTDP+mjXJd98U7uQkqgX6eQN/biwSFQI4xVCEi1czta1YQJTuqiBCRn3Cj3WsvMPikyFT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8763
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_120442_253458_3465F2A3 
X-CRM114-Status: UNSURE (   5.63  )
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


On Wed, 28 Oct 2026 11:16:08 +0800, shengjiu.wang@oss.nxp.com wrote:
> Add support for AONMIX MQS (i.e. MQS1).

Applied, thanks!

[1/1] arm64: dts: imx952-frdm: support AONMIX MQS
      commit: de72ffdd52783e0324008016bd4791371130e83a

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

