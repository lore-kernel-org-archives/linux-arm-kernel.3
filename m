Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A3E60A2602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 18:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=koa0XojH;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=DRpHcKxD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+hVhEoiSqteEkiSm3cS0ymHw8ozIc/n7XL2vc9JVMyU=; b=koa0XojHMREUJmP0K3Hdeupw2j
	oF4u6tYjjH3/mz53AHF4eECqbDwZCEtwbcvKmLrmtk/mmFWaA6+/vMUVPE5YPIF4u/6udun7yi2Zy
	qa2ZR03I5X8se8dSx+BMLwLuvIzlnd2XcxtWI3jKNVPu7U4BfTlgbBLHM+oWEuaq2Rt208ZgPIoPv
	yJkYLSIfbtG51QzncrGrwZ/J2K514eQjQ7QINv35IUgSo3IakF5lx+T2+lYvj/67iBlOdqmpCmb1H
	tl/cSVPBDiCaUNuxEOV0OR5yU3kHqoe8OI6PQ0zgN7vBAehh6N+imNV2UzwyYahfEPKZa7g3Qy4I/
	BOw58M2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIs4z-000000089jl-2c2Q;
	Mon, 19 Oct 2026 18:27:25 +0000
Received: from mail-norwayeastazon11013019.outbound.protection.outlook.com ([40.107.159.19] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIs4v-000000089bH-111k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 18:27:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sXOzqaUfY6f+dZgQ38ac6SFNYLqEbyZV2w7YNx4uAq2ssmJqrO75K3WK7/EnqQO1zOI/jall6O5JTmZlP1Hf5vb7lTHleKBt4CPV7qk9szPw4d/PZiZNjaHU1prAnMP3cxmAmu8G3v/dM8cSZZ64456rKvlbLiNlHkRQMIbgXTNpHoxv9ABCrGw5NAf6fTPxfnTtRslAyaWgdyrBnrERqZGAGdEb9dAUKh7VXEGJx8P5rE9CwY8/hwXPlroDUizcLkTXJt8sJf8FSOPl8PI/ESNl5Qu3iPqdw7rpDHJ/+vcIqJ5ZkOCCWNKpP+p6Mm7Vs7LA7u8K5KhLXr5keXCnQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hVhEoiSqteEkiSm3cS0ymHw8ozIc/n7XL2vc9JVMyU=;
 b=NHm8kG2bA4ArNd5JvkFq+u06YFzoSwY/FHtY8SW7PPTUw4vzYR2+ZJ5p+7JoClWhVSjGFoCqZEvykj16r9H2FxL7uBvgCkCTwcb/z4m/9PraB24F5uJb1WFGS26LpNzYsBfxfZjimXMO/LxgOVSfi1scs6yTz+JbpjmmEY1oNctp6tAINGYZ6B3VYgSFugAcmoO4+txcPdyBaYijv/ScU7vx8Rwgw5G47oROb3U5m6lv4W78o6f614/JNwK1kF5qHVQzRwU34d3Om3H/U9bcWzMacKQwQLE+5XiUfBbW5JepkLGXDb1aUxACGFNofBrRcK5bKA1CEZvkO2kIaxlunw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+hVhEoiSqteEkiSm3cS0ymHw8ozIc/n7XL2vc9JVMyU=;
 b=DRpHcKxDxo6ibNUBd9ZGbov5DPZsb3J7D5gsbgTGdv740V84+VU3+9hgoZYceSAZ/5U2LC1czw31Ych2PBBfM+zjHSX8w1H2b8WRlxQt6avcrOnoWRa2hTt+mYCfAJ/tSy0wB6KYHX2GGX9dR0V0KAJ90HCGvp/rr/Iy74ZNSLEcBeHIPbKv2+LOQ5CLmswx5c5fnNT15vMfVNerVBTB6FRTdO4ssaymHlB7ubV0u10cNMYhLSgUGAvUFB4YEW8XWzK0VruK+RpKNfIauXxVzTmzwtrf0yJxbjWVuYcfCxFIk5ZDSV54PiAs0ZfeqFlPS351RSXXSTlhc8zCNnqbsA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM0PR04MB6817.eurprd04.prod.outlook.com (2603:10a6:208:17e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 18:27:18 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 18:27:18 +0000
From: Frank.Li@oss.nxp.com
Date: Mon, 19 Oct 2026 14:26:27 -0400
Subject: [PATCH v2 12/13] ARM: dts: imx6q-novena: use interrupts replace
 irq-gpio
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-arm_dts_cleanup2-v2-12-dcdcbe6389c1@nxp.com>
References: <20261019-arm_dts_cleanup2-v2-0-dcdcbe6389c1@nxp.com>
In-Reply-To: <20261019-arm_dts_cleanup2-v2-0-dcdcbe6389c1@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792434379; l=1087;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=r4pVtKH7blADh45NSSJUFbkWtxK51doD3ejg+xVQmPc=;
 b=TMd1mBTrZOHzPrn33+kmzALeN3CErC0vPe4Opp9vW24EbEupPzyzHTrCRFqiDO8pjMqRboC30
 eqbguCIfuYZBLzRBxbhQ9voPDfrWmD4Wx2Ac3uTtZ980qLp1wRBfKQM
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS3P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:45f::13) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM0PR04MB6817:EE_
X-MS-Office365-Filtering-Correlation-Id: 93bf041c-ec00-4d1e-b181-08df2e0e9baa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|19092799006|366016|23010399003|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: cDRDxuq7+b+tk+R1YwAbEVgZiMfWp+2kOXD1hq48dR3QhV74NapyhU5gWlDuZ9wlLvRmK7LholPg7pqdS6WZD+Iz4aeTHXOxBXQK4iHvvzSJYi0C24mdO+iNPuXJ+vGMnHZ/eIDGLxLo//eK/+q9KPugTcEiENPTOpNI6KsZMgc1YAM19JxYs2pEvzw/kHBx2ak28QNbIePgsz+gFOGD1WJOuEqeSNx2Uq5jrGd86pes2wGXUWIGg6YXZc5YePJqfaVjzjPgsMSH8KaNCTBOAvZ4VOKw9v+6LieVPFG29yBUZ6MF6l5BFIXajxOYblS8S4RLnKi9E6AxM+SD1tFSo9mDwo4p/KRp7g8x9YvrVcFxKTM18I1cHDNHyWLt0zDlccdUviZXyQ7nDTsuMbNY4X+kOyFWbPfxmHu8C1ssyl7iiVEX+M7zS56fzBTeLA47RA5tfn9GXwCcTIE81xMXFkaHtobW6TCKGWBnsMCAu6ymGM6oBnXtjjgeEkK+GzF/5XlvF6iGb3zUJ2HfBD2v+Z+B46RNwrV7+0i+XjluBKhQtXPsoYprcRmZe8fsdLnLKmoUIB9ugXsHufXB7Usymp2j/5KVe8XRaDW3GRBWnTe1wAO1SfxNJo/RPv4KrjCV
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(19092799006)(366016)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3pSWnZjd2xOZlFiSEsxNkxlUno1ZUptQS9XWXU3OTlhajkzZ3g4TWZYTnNF?=
 =?utf-8?B?a290VVl2UEppbFV2aE84QTlYYVVyL0MvL2dCdW1wTFRXV0ZFanNHWUY2SmRF?=
 =?utf-8?B?b2xaM0dXbzcxYVNaa0xOT1RYUFZqZC9EMUxleGEzNEVTbzc0NXFjeXNUVFNl?=
 =?utf-8?B?M1BDK1lMQXZmR056OEkySlpZaU5kUXl0SkhBZGNCZDFLOU50QlVVb24xVkxn?=
 =?utf-8?B?b1hiTmUwNk1xdkVSTWVSU29vYTBpcG5TendIL0ZYbEJicnFGSUdnK0dTSHI5?=
 =?utf-8?B?RHl3Y3lWUzk1cmhEL2NHbVlyQWtrMkt2V0ZIM0JOcDVqcVNiM1RHRC9sTnlM?=
 =?utf-8?B?ZkVPZW5GUUwrZ0puZWZIRlR1cU5McXJaNjZ5WjRzYnhZNjNuTXRBQXliWXFq?=
 =?utf-8?B?MisrS3Rid091QWJJMHp3Tktqa2t5NHZCS3NXSVY3dnJuYzdzZFFReUp5Y0FI?=
 =?utf-8?B?UHV2aUIwVVRhS1JPS0FmaEVleEJVS29sS0owS0VFZnRjaGRiV1lSN0VRNld3?=
 =?utf-8?B?djdReUo4VUtEeExVSEFqSk5jcmphQ1dDeTBEVlJETWxPRkJWQUpBZHRPRFow?=
 =?utf-8?B?RzNUK25uN3RNaTlXa0xsZHRLM2Z1dXA5NnJEL0VJek5BdmhWeU10dExzZ29t?=
 =?utf-8?B?MlhmMkk3Vko3bmdTTkpxOXZjWGhONHN2TWp6K25UMWM3OVdOQ041YUxsdnl1?=
 =?utf-8?B?STUrRkxkN2s2bzBMZ1pCa00wYjRTaHdnT0EwVndOK3I3QzVqU0lxemt0M2Zo?=
 =?utf-8?B?NUdaUlAvZEtqTDgwajlvdm9CQVozR20wWDBteUlRWEV6SWQvRkE5SWtDcUZv?=
 =?utf-8?B?Q0EyTnhnMkYrRFVHREF3MXhrdW85RERNc3pNcEVCdEpaYlhsUEYrb3Zwa2tO?=
 =?utf-8?B?YlpvWEY4L1UzTWJFd3lFOWV0cTh6YzhQYUlZaXVwVkZzRUU0bWRrbXdYNStW?=
 =?utf-8?B?czJQSDMvTkZQaCsyM1M5YXFpbE1nUW5iMGRRWWNBbE1kQitYMXorVUZ6SXUr?=
 =?utf-8?B?cTBPQmZpdDcvcGR2M3RGRzh1QVYyRmFHZVl3ZVNGc0ZjNE5WV1c3NTErM3VS?=
 =?utf-8?B?NjgwUmMrOXBZSU4xNEN2Y2xhZ1cvMWlDdHhYcDR6ZnhFSFZKTGdFclR5ZlNv?=
 =?utf-8?B?aDA2akNQRE5ha0pmUkx3cnlucXpZaFd1cGlrMnE4ZUxyNGFUN0k2U1ZhYi9T?=
 =?utf-8?B?bWx3TGRxOVpVV3lxTis1UFpRekc3TjdXemlyUnJUMWdwUE1ySytBcFpJSTk5?=
 =?utf-8?B?UXI2SGpTLzY3NTJPcy9WbG5UVUovVFkreU81N2VTZVMzZE0rQmRKQU1tTnlX?=
 =?utf-8?B?U1NvZFY5WXJuOXRidCtWV0h4VEdtbWlIS3ZYSTZ3SnIxb0NQR1BwYXdUOUEv?=
 =?utf-8?B?RmFsSTh5QzR2cllkZlRuYW5ocXdNd3RuRDdhdWZrcmJacjZPM2p2MmhjTDBJ?=
 =?utf-8?B?SndpVUdHQXcrSUlQb3dmZmFJcmlRaHlQclF4SURRekJKSFhubmpOWlJmb0xS?=
 =?utf-8?B?ZmtoRnQ3SjZ3TStZaDluWW55eHRvK0dNL0NCb1FzZDVDMThQUytYVERPejRI?=
 =?utf-8?B?L2VXVCtMR0p0dVdTSStEZ0NzSSt4VnpWeDE0WG8vQnUwNXNqWUE0Zk8xVStr?=
 =?utf-8?B?MWVIdEVJMjJEcUhZdUduL3p3L2IwVlVtdjZPZHQvcEY0TXdPdmx0Y29OeHVY?=
 =?utf-8?B?YjNHTFB5VmdFUDJ4RXlybTVpYnhIQmxPMUxQbTV2bzMrem5ZbFBkQkFIVWtj?=
 =?utf-8?B?RjdaUHo1ZnlZRDRTL01mS3kvcEhURTE4d0ZGTzY5c0RWaEpxL3k4RFdLWTVh?=
 =?utf-8?B?RTFGREUweEc5aU1SN0RuT3FBVTBTZExLZGFxU044d0F0Q3ZEZzlzNXZNZzdL?=
 =?utf-8?B?UysyQXVUc2NVakdsREVnck11Z0pkRW8xUmNCcENYWTVCMzR2d2txdjBqdzB3?=
 =?utf-8?B?SEVrbG1PbWtkYW5KbE5RRUdKQ1FDSHJ2emc2N2IyeGNrOXUxMUZURkVpWUdB?=
 =?utf-8?B?cHZwOW9IWVc2bHJORUZVYkJpMllDWVU0OVpseERGRlMxb3JUdWxLRDNEUkpP?=
 =?utf-8?B?NGYwMUQraXNDN29CZVovRWJ2cnNMYVd1VExTdTRvK3pRbHYwMUx6NklwazhG?=
 =?utf-8?B?eFpFT2NnYWYwSTFubDA1aWJSY05wSUhKRWRDL1hjbThuaVhEaVNDK2JEUjFC?=
 =?utf-8?B?L3A3Wk4zczdPTHhKbG1uUGpmYVFTTGt6dTVHMjhKTFVRN3QzOFprZjdFcmlt?=
 =?utf-8?B?YytEMEhMS1BQNCsrTXhXbTdtcVNrSTRnaXhOK2x6eGQxYTBMK2c3UStJdmMz?=
 =?utf-8?B?Y2VYeVNBRXd2bWp0TzVSdXhjQWFjUzEzNFY0Z1oxN1dmYnp2Ym1LSzFkdk0w?=
 =?utf-8?Q?0sN+32oScCBNSovYIWduKOi4MSfjvdyjTc5ry?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93bf041c-ec00-4d1e-b181-08df2e0e9baa
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 18:27:18.6697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t300VCeqgmeJhiPp9o3Gq4ZUTOyQ+DpWSHzzBqCB3+mjZ4r3PdHTFxm/aTt59b4l01ktKblJQiDX5V9EMIzo3EQOfwVi2vAmKDSa0MdHbpQmSIRCoRkPgNMT9EUGg+Lf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6817
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_112721_324048_08FFA59D 
X-CRM114-Status: GOOD (  10.10  )
X-Spam-Score: -1.9 (-)
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

From: Frank Li <Frank.Li@nxp.com>

irq-gpio is not existing property, which should use interrupts and
interrupt-parent.

Fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: stmpe811@44 (st,stmpe811): 'irq-gpio' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts b/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
index 9938a63b5110c..fce04448d932e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
@@ -280,7 +280,8 @@ sbs_battery: bq20z75@b {
 	touch: stmpe811@44 {
 		compatible = "st,stmpe811";
 		reg = <0x44>;
-		irq-gpio = <&gpio5 13 GPIO_ACTIVE_HIGH>;
+		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-parent = <&gpio5>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_stmpe_novena>;
 		vio-supply = <&reg_3p3v>;

-- 
2.43.0


