Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407686070AB5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 21:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e8ecQBOz;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=IPeNFHaU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OHGf7IqENvPrkEk4YZi66AyMV7TjBRvkcJFbNB8NSic=; b=e8ecQBOz1UrWudzZRNeUAnoWVX
	kv7w70I9Rs3CChhYiJORalfCr4Q7YPYapHB1eViEcMeVgImGqzJ+1mqPAy+RoAXqss24YQ1bV76Sa
	LtbW16hzgqkgTd/HHJGLj65hWWtn3/ELg+c/Dxra0fEZICla4fLH5wIgF9ZjkrOB/G6O8To3PM0V2
	VGggz7eEk6m6yfubHkOE+C9PkplrGSew9l0T+voHv4RX2fQa1w79zTUjrCW+q3qx9espwgFHcLUCT
	Wrk1i9JDjyH0maGZrTA3qQZmCLfI5+wPu9yopBZb1u4E0Y+2i1c+L1/QBsc7Vrye0848IfaWGLCrc
	4Os1R16Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOiwa-000000076AG-3xGm;
	Wed, 04 Nov 2026 21:54:56 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOiwZ-0000000769t-0yBu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 21:54:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zW4CaZUMZLy9kyvGr4ji2uEIwHKJUSDmC9Dakkk3Gsn+v2lgn5L2rCYxeyGjQa8is7c+NRYdxwuDMHhvECCr7NvLBkXOFT5XSA2c4X0d5GnKlu1G/RVlp3VdY2AYJJTPHKdcK8Y8vad9PRaOsvuzYkGbvU4byulF0y4KvEgU/+zBK7jd59TDPLL9+wTev7KfIR/87w+sbGeQy2VgaFhPTxlfmvEpC1XhYt/XVybIxvjNlw2IHpw1Wsg8QjOJkrvnBFufeGunZ3eocHCmH0YVNUEM7o0ewt51UNd7KHAumxyhj0Nqkj3FPU1BYSPf6qZMPLbz5GsiMl+HWyuTE312Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHGf7IqENvPrkEk4YZi66AyMV7TjBRvkcJFbNB8NSic=;
 b=dPkVVHIies/+YYDxNkWa2CgF2I0dTx+vCHTH8F0ddS1CSSPE463s1OfN6Qt65oCnOjCYEbGMWWlXzPM96QRETGQQYcVvbj31dtq6xyDRXeeb9prUlmq2Je1OxllMkbieaIuNWhXTExLIAC4Q1ZVDhfnjmWnU73Imf+/wbFm/s37/V0LVZGaELXmVOeT5zltKBxlFXK7QeK6cGq8aCtbQ0hXZlIsu19nEFkmvYrcYDclQ9Z9MEdAOh/hcM4Hy05W0Xhd1zxpPPtY27vLc9MCiAITK3VRcn57BgSkXfAZ4F6tQlkRXOoYvmPZF8PHSeEAMvtSqty7OLKurUUp6gek5hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHGf7IqENvPrkEk4YZi66AyMV7TjBRvkcJFbNB8NSic=;
 b=IPeNFHaUMLPeoYX3PXV3xTQbs6IBpGf1ZaBeUrTxBmRzKJ4y6nVanEOSIJHDSZdy4xumPVsqMvUGJMXT5U+I+Fn/pmmSkChv8/DKne8ojSGsF78S7Pwopim+7DvXz629ZMLb/RaqRXWy+vXNSwUqu2EIGatepq2J0zVCInZAVL7SZs6uNFj0kkGqPUxVZprUjgcbjq8EXbs+wiRelBwCU2GoSCKvseeKVwMtLT7Hb2a7cXqz9Trb8dwp2oKBcswlWXk+zVtNJslCDARgY6/8evCsd0NWKJifmJOQyrpuc1VetOnapr95dE7Dt0cAN6V85vqIr3Kx2Oq0XoqZajyJ8w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MRWPR04MB12045.eurprd04.prod.outlook.com (2603:10a6:501:94::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 21:54:49 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 21:54:48 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	Petko Manolov <petko.manolov@konsulko.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com
Subject: Re: [PATCH v4 0/2] arm: dts: nxp: imx: add Draeger M48 CPU board
Date: Wed,  4 Nov 2026 16:54:41 -0500
Message-ID: <179382927262.3881641.8024842964445968880.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022140244.3476844-1-petko.manolov@konsulko.com>
References: <20261022140244.3476844-1-petko.manolov@konsulko.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR02CA0008.namprd02.prod.outlook.com
 (2603:10b6:510:33d::27) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MRWPR04MB12045:EE_
X-MS-Office365-Filtering-Correlation-Id: 78297aa8-3653-4bbb-69ec-08df3abe3f2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|19092799006|261009223027099003|56012099006|11063799006|261022075727099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: xAjPpQFQEsCCbhuvR7CI6/XzM7yj3lAkYmLWYh8LxVyco9semnI93cxhLD/iUZmZPc3x3vzpmNpa4xz2mHj+KWxESQU5SrkVFY9h8Y3LWAh+Krn5epEhxmtxRzVrGr9Xm0aCMjFNXZ1IPdda2IoivEUGYJIvK583GYUKoawkUZ3G+QIiNRY/yyEpHk+jnE799beC15DNu6Vlw4Uc0qUTay8BknH+birTn0Q8Yx36nt0U21E7UU2qAx04qXi+YOClzJHm4hEMsRxQBZ1lRScEsCrXx35K5d5xwy/Q4b8RRZ858FsJ4xssP33Q70/XNjR6AYIe/j2fwU0tOX8NXGS3GoH/KCmB2+mg4wRevIFF+k/dLc8gL0Aqq5R6/1joj7hjD9Cgi10ZHFfpVDESc0VMQPkpmRGzsiQDgNln3hYsU8pO6LNFqM+Sa0rIsnOaAJVBBDbwMt24J+3gTtclYUvKbWJtv6tckrPWvhCjHN9cvWIUN/d3huo7i3IV3Zyxc3i+urDLF5OOL+mwu/WgbvEubX1PqqjrswGNTFy4Yxl+4ISJiGUwmlbO+Udh/gw7Xey4CfXN/mvjq3wXs8jILvS8Pz+Zvl0gu7kaceHkwzezsg0DrATdjQq0LwQfiW8iREsIEz53oxgy4jORIUNK5dvyd5dhJiy8d4BFWSjL2eBGFrI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(19092799006)(261009223027099003)(56012099006)(11063799006)(261022075727099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjlFTXlzRTU3eDdMSE94SFF3aGZKR2t6SkNlMUtXWWJmZEJianlQaTV4aVJ3?=
 =?utf-8?B?ZnFMU21BRDRPanNXOE1IaXhNa0U2a2UrMk9YaGlqQWw4MjVId25JUFk0aTlz?=
 =?utf-8?B?MWR4K2w3ZHJuUUV5UjB3TUF2MDhxM2RTREIxVGVkdVVkUTNqNWJWTFp3MmJj?=
 =?utf-8?B?ODJPNXlrUm43cnlPeEdZT1pKUFNOMWdzYXQ4ckNNYWpueEQxRm1GVmNwZ3FG?=
 =?utf-8?B?NEMwNmlLYmJteWs0bnRYVHFQczBMN2x1NEtTTHZFeTdKa1BGeFBhbW5wb1BN?=
 =?utf-8?B?U2lKZDBPanY5eHVXNDQ4a2RBcWtoM0xtZ20vdHpRZW5pZUZHQ3EyQ2tOeUZT?=
 =?utf-8?B?R3hib0s3SUYyQ1h0R0NPVmRqUEkxVm1mY3hMUGRhUjNBdmtGVTkzTFNnbHp6?=
 =?utf-8?B?TUszQnVwdHlHV1lWa0N1TEhBSzZmZHBCRnkwOU1kWXRnQkc4aWFMNVNkN2lN?=
 =?utf-8?B?TE5MMjU3OExGNStlbXh1WWl2RFlkbk05WUR6c1QyZ29pcmxWTTUwUHk0OGdn?=
 =?utf-8?B?b0M0eGVMcStVZFQ2bjlHMmZ2elRHdDJiT0NoY25YS2hvTUJTL1orWmZ2ZE91?=
 =?utf-8?B?cTNRMEM2N3VUbHdUUE1XeHBjODZYNXZVNDZxY1hkS3d4L0JIOXhucExvUzFr?=
 =?utf-8?B?cnpuUmwzSWtLYlNSRWZ3Tk1mVlpNemdPOWNSa1BxanFQSGVDVVplSG15QzY2?=
 =?utf-8?B?Ni9hNTZ5anFFUnZvYmR5c3hja2dqaVFuamk4M3JiRWZYRXhmaWxlOHh5ZHRr?=
 =?utf-8?B?Z0dkL3lKTzRJSiszV3E5VEV0ZGtkd1p0cmU1OWltOVRRNHArTS9UU2dNbnhn?=
 =?utf-8?B?WTNzcjBVZU1vVi9jNDM5cyttZVZrRDJPM04xZXd4NVRtWjhmR2NlQVJJclo3?=
 =?utf-8?B?K3VuL0ttS2JnUFFGRXNhUkt1QVkxQThhNmRzMkllNENTSkhOMERhMElVczJ2?=
 =?utf-8?B?Y3F6cU8yakNzdGFBbEFxVFN5cm1kZjV4Ym44dEhkTm9DcGphTFo0THR3aStR?=
 =?utf-8?B?STl2VThRZ0ZhMm9WN1ZadktCcGdqU0VrbFMxRUFJNkVCc3MzKzg0eVJvZ3hW?=
 =?utf-8?B?UklKN3FtOVIzMlZsbzVSTTdXTFZhOW9ncnR6RlhQMXM2RDB3eGpib1gzMFlY?=
 =?utf-8?B?emZtRjJGd1JBd0xLekthSzduYjFpekxoOEZnL1BWaG9HSDhLbXJUd0s1TUNM?=
 =?utf-8?B?UFdaZU1Qb01FZDZyQzRNUDBGcjE1V2QrTThiSjNuUVhWanVWbk0xd3QrNkVI?=
 =?utf-8?B?Wlg1UHFUVUE3N0R1YUdYc0pQZFd1K09RQlE1SEpSTmF6S1RHUTlISitjeHcv?=
 =?utf-8?B?aXhLUFNGOEt5QS9vaG0ydWZvN1lqTXVuNUpVeWdLNlNTMXRJYUprdXBOeXkx?=
 =?utf-8?B?RWNqeFFreXNjV3RQNGJxdHUvV3FBSVlzUU10UzFmbkNnZ09HTzBBdjdLc21D?=
 =?utf-8?B?VnI5aFVUN2hTSVdxR05rRDh5UnNtalZLQU03TU9kTmtxbDVLR0F1VnU0OXVP?=
 =?utf-8?B?WmMzdjJZWHV5QWl2SDRlYzMvT1N0OVVvNnk3c3JlWEp4NTJGWEN0dXN0eGhR?=
 =?utf-8?B?bFpFVTFrbkxQZHU5Z3lzWUhFSTBFODZoZzQxUU9KWnN2clJoWFpPOU42Tkkz?=
 =?utf-8?B?eUZCejlLTDNVMTVtTjdaRjFxeGJKZGw3S1N0c2VERXBGM01Ham1EY0RqcjJj?=
 =?utf-8?B?WEN2WXVHYmwyWDFOcUtoeWJyRjFSc29xTHpXYzNhT0o4dHkwd0FmZjZ0UllP?=
 =?utf-8?B?QzhKbEcxWURXcnhmWWZLdDJmWWJHN2oxRHBYVzVnNlNpWGJaMUZ4SWs1OThs?=
 =?utf-8?B?UERkcjY5V2FWajlyb0NuNlhwNnBNZS9XSFRXUTZzaTVKcENTVk0zbDBZNSt2?=
 =?utf-8?B?U2p0Z0N1UnEwUE5EMlpaZmxLVjMrYTB0RGNFd0VNYmJwV3QyNXVVNEZaZFkv?=
 =?utf-8?B?VjFiNFJFVUdFeG5aVml4dTQzb2xheExCVnRSczFGZ1hDaUMyeTN5cWpIVGNp?=
 =?utf-8?B?V2U4N2RwZ252T3g5WHBId3ZsaHdvek14STFZdjJ4ZmQza2FDY1AwWWFMWFRN?=
 =?utf-8?B?Ymc4T3FxcGY2V1ZZSllIN0ZJSEh0WXFhdnhMNThlWHR5K1JpNzEvK0pSZU1B?=
 =?utf-8?B?TlR6N1JlRHB3RjJjVDZrZ0lMS0tveW1yTTJXWHR3VHVHenlscTdIckZjakRM?=
 =?utf-8?B?bWRUejg1U3Q4eitLWEJ2ek5XTi9OekhtdEwrT3M5eExLclBHbjdBaHEwWENN?=
 =?utf-8?B?VER5bHY0Tk42U3UzbThBRklrVGxVeTBKOU1oZmNFWGJ1b0dvREZoYkY3dkxt?=
 =?utf-8?B?d2gydzFEMG9tWHhFeURmWnJCQjVMKzB2RTFNeXJCTXFZNzdIT0JLa0o5cmJx?=
 =?utf-8?Q?p5xq6EccjrcRpXUcGIG47MDDMccACv1X6sX+X?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78297aa8-3653-4bbb-69ec-08df3abe3f2b
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 21:54:48.8794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cpjiRY7UXlMNFQIjO9dr/UhvwufksWRFW9h4FQWkYTyCwG+P/G/i1DZysTUDw+Hl/lgWRajQGxfYinEd/KEaAr3kzAiR1ocMSR8pd+xp7drhCxDCFbBAnWuiQtcPNR0y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_135455_271934_ECEBD827 
X-CRM114-Status: UNSURE (   9.81  )
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


On Thu, 22 Oct 2026 17:02:41 +0300, Petko Manolov wrote:
> Adds the device trees for “Dräger M48 on NXP i.MX6 (Q|DL) and Intel/Altera
> SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the
> same carrier and they are cross-monitoring each other.  The SoCFPGA boots
> independently off qspi flash.
> 
> This is the imx6 devicetree part.  There are two bindings as well as device
> trees, since M48 is using two parts: imx6q and imx6dl.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
      commit: 2d55436d91d2ef118ec989d225797bd48f07b919
[2/2] arm: dts: nxp: imx: Add devicetree files for M48
      commit: ce0d969c74ab6cb10f7cc1f8473beb0a400c79fe

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

