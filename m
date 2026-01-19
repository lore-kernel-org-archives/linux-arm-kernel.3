Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E833CCF2D4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 10:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZwOh2aK3kpm2bPtUm2XpFngtmcBai61RVoDm06OWEkI=; b=5FeDgNRqQae5m8beQyuXglvIy9
	7A9+3RWJD9iXFwlRoydzFKxgOPxET3iyV5Uv6I/vb4fKkiH8ut17oI4KUliFXWlOT5lbSs1XhEmNp
	zxBSlqfwFOZjHlD/P/eJ380PeFIvMFXukh2pFR63zZOjvy4eKvkCoRpL8F9CANb7FMR8+O+rCMyNa
	B8mC+xx20HGgj8WGYI+0fJbb4pIo+TDiAATpIK1XS2jIWU27EpNmA02VbImeFTLUdslyQsLhOANPp
	U/oo97SBZMZYEbU28YdIbh2orSMhhMcXix5gzQ7gflsronoUHmRM+9uWQwvC1X9cogW855ucPzkKt
	msKXLHqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhm7v-00000001hxH-2lx6;
	Mon, 19 Jan 2026 10:04:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhm7m-00000001htK-1l1Y
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 Jan 2026 10:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZwOh2aK3kpm2bPtUm2XpFngtmcBai61RVoDm06OWEkI=; b=FvZXA0rkeq8QvhcJRxa/Pa3pL1
	eYUd+kj5ogRkEjGZXTqh5/n9NwjxoY3JeTUCSWqJ9i7XYL/knjN6Nna+ak51/izaPfv+wnD3JDEgU
	gJkfQkwlnL2zz/F7bMDN4FB7etfC/JbHayGruCP7JIXb26AXAr0FtUHOdLkDwg5dXs8Th+Fufo8sp
	WBj+1yMsv4TOdZrDcwqR47Ej+PnhEmqZbk9/lTar4XQDUZ2SqmkWMwMFcazfQmhgToVBeydWIgwZj
	HGPKMKKTugKA1xz9fKqSGOoEpaH6ePaCo62kQDqNaR4EQ4ErFgYobZvmJlYSe8PcegUhj+J3dZMs/
	p+9vKJ8w==;
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhm7j-0000000Bnxt-2R6u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 10:04:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TCqAyae/FXVSqjbAzjW5SgcIeL6437VfjjC64g7yOuVI8+gQSGJIDrFZqZ+GAGK0fVaqN9/CZjnnKw9oJjDqWhNMuptZeBSxShXLq79BR+8eNQ16XnjGyRSy6sLXNGaUnkNz5XeNXHPSX/VrziIjYn7jK1gwIoUe5K9/LIt+Dw1h855tWhUw9tHoX71ZVeEtQXaotXW75isUlb1lz/N9DNkKrMKbBuuXRNikFnloj2a1z1S9LRshEn5xSeuHdc275uUEejevFFzcQJn7WUAmeOdEEZK+4B0nlZQktjiqNIwZWMmZf6qwhn42SExWoqYqCWcy8y3SxSH33iYW20V0Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZwOh2aK3kpm2bPtUm2XpFngtmcBai61RVoDm06OWEkI=;
 b=sDU/Aq8x4ms3FJwyeEkPZcrfm9gwO5Br1LW+cnIF3Bf1iwV+8EA1uW/Bhy3wjDeEgehQWYY7lbuakxhfVE2HpAR2h5tqUCZab2LeLnoXLPyiXMvan9e2rbUwzF3SkHd5cXKG2vzZUukicU7XmSe5ytNoj5EUsXyFfTqiBv/EE0Kk3wfFyZah0cNWrvLasnp59xFo8uvIZhsQPm8gyY2ToqFoOFmfF9xeB9FwUceXHokBEEql0LlmaNzBw7z30DI8tgKKcWF6ZJbgSRA0rRTsHrCI8vXfsR7xyzIKr/SkpIpJIoSeOi5efmn8PaFs6xr34UKx35/rTXpU6vjzFXmFug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZwOh2aK3kpm2bPtUm2XpFngtmcBai61RVoDm06OWEkI=;
 b=CIqA5h7d+HRRF32rpzyUCxKCYv48nTvgh2R77xSfEOu4PbfvHVRcEBSBdaca0C12r6A3xZnytmWZTONXN1J6cptfAbXwCiQGcrq/7b2piFarJVj9BjNzoudelChymI2Yo4ETozmCmhYWcieuDFyEreZ4e7ljzOv5xMNmQZ6hp4uKYncUCNSxfqX0Q6k5nYaMMUicEAzV3yn7oMmW5fVgmGMk6nkMZMu2gcgHwUNVb6NoEAtC3vk5oZsPtKE77q/RCi+agZQB1EvYP2N5kNkTZclAl0d93RYsCXWWK1lVsc+bfcfgeP6kK/MPlkxgqMAjB4TFZLaaUDyGNSUBRTy3bQ==
Received: from VE1PR04MB7213.eurprd04.prod.outlook.com (2603:10a6:800:1b3::8)
 by DU4PR04MB10387.eurprd04.prod.outlook.com (2603:10a6:10:568::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 10:04:35 +0000
Received: from VE1PR04MB7213.eurprd04.prod.outlook.com
 ([fe80::93cb:5423:e3b:9a0d]) by VE1PR04MB7213.eurprd04.prod.outlook.com
 ([fe80::93cb:5423:e3b:9a0d%7]) with mapi id 15.20.9520.009; Mon, 19 Jan 2026
 10:04:35 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Ulf Hansson
	<ulf.hansson@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH 1/2] Fix the imx8mm gpu hang due to adb400 reset wrongly
Thread-Topic: [PATCH 1/2] Fix the imx8mm gpu hang due to adb400 reset wrongly
Thread-Index: AQHciSElqb8eMfYnlUy8S2i6O2x6bLVZN4WAgAAAaAA=
Date: Mon, 19 Jan 2026 10:04:35 +0000
Message-ID: <VE1PR04MB7213F68C050F5E9486FCE2FB8788A@VE1PR04MB7213.eurprd04.prod.outlook.com>
References: <20260119-imx8mm_gpu_power_domain-v1-0-34d81c766916@nxp.com>
 <20260119-imx8mm_gpu_power_domain-v1-1-34d81c766916@nxp.com>
 <295b7b13-b44e-429a-b410-f1e80bb46e95@kernel.org>
In-Reply-To: <295b7b13-b44e-429a-b410-f1e80bb46e95@kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR04MB7213:EE_|DU4PR04MB10387:EE_
x-ms-office365-filtering-correlation-id: 04144bfb-d164-437f-2df2-08de5742263c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|19092799006|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?VyWEXMfMLDrQQ7z5RwusEQ6pexJrYop+1MI8k3TF5+ODYhKK5gTA09gVCYxL?=
 =?us-ascii?Q?Q9yFjroUdoMGKECI8mr/xxPgIrIpnuLZ2GkLj6uvbVwQ/F9cMyO9cLuCIqhR?=
 =?us-ascii?Q?lcdQmMURu2f0QzL/QDtCEP+sZM22QNXkIDV1FoBUscM5RqJuOdWS17MyvNx1?=
 =?us-ascii?Q?1jmT8xMqjvqbv0we9dF7vE5xf4fCO33Robu0JwdzNOoEx2LUUsJTan7ctmwh?=
 =?us-ascii?Q?AAwn241IsiSRhv7cYb+d1d8WUhsRTPmfiH8OkdEifqNrnKkmQjyQkkODYKqo?=
 =?us-ascii?Q?DBSdNcscHo5k+oCZMNPZJibJHl6fNjsOhBwXrzmJIqk+Lnn7Lm4qIf00HhEP?=
 =?us-ascii?Q?804Oj9q/EbSIz9l+DAVzfs2vgOQhfmsxB91pwJyC+DXebP4LIpu60lIiXwH4?=
 =?us-ascii?Q?2oVST6hSFULsvQiBmj23HTN0Fj7pQAJk23TVTlyBuRi2QY63h81VzTbYHZ+F?=
 =?us-ascii?Q?nVf/KfzRpHLhaBKPwBMRWdnWseXZtuqrGfb5qO9XUvI+369Aznd7p7NXTJAI?=
 =?us-ascii?Q?N8obxciK4OG9UrXRgNGaekIkEuk06B7yOJaUV0bRDOzankW8y8/2LGN5YczE?=
 =?us-ascii?Q?2cIGvIFrArE6ZCRrW6/YCotO0fJc2D66wjQFC5tum5MqAFnhvYFzLZqq6VHd?=
 =?us-ascii?Q?2H4GXlPqb5IfxzsdrEyqbXbi6xSVjCPh9M1ob0eMYnMYdQCwFI7YZshePGOK?=
 =?us-ascii?Q?T7jzMGRTJlbIdU7P0FSN92YxGbd1awRKK8uyLypAkjT5TTB5R2p/UcZ40Hh5?=
 =?us-ascii?Q?8E+HVpRZHr1q6bwwS+m4Mcp6Qdd1HDCpQiIOwQYyxU4w3W5+fjUZEj8JJSER?=
 =?us-ascii?Q?iipwJM1AUN38NnTrc8HZx2OVQRKQAH3iC3nIWgnP/Ax0ZbBgbfIo9iSQuwwT?=
 =?us-ascii?Q?+5eTVQw9LQGIFRd9B1t9fpwYFWXsTWAhxfBO6XQ+2bJIVq546HvMzXohHptk?=
 =?us-ascii?Q?/PmBFQOnaxV1ii6CjbhlVkar5a0B7tpEkZbLgqsE38smG/EMt+hSaKGFfNJV?=
 =?us-ascii?Q?/z01+f52kFjNOCcdJ6sXR0h3em8ISjN8qqbFNgxD5azLxamxl+iM4m/t1RFE?=
 =?us-ascii?Q?rHuVo+1ICoYEbNbaYGGmV7JqoUHJmZHz8qjd3IGLN55xVgCwH3X4375l5I/M?=
 =?us-ascii?Q?J0PRw7Gr8VSESdGgo+EjOqZVI/6A4RvCy32mRWoC018HmCArGyjfJ6lvDOY0?=
 =?us-ascii?Q?ZmQBJzAmx15ToN/R5Xm83EnvxbyFQ/PQHbCDGao05yZlRGPBEhZ93GqRCXtr?=
 =?us-ascii?Q?s4H65smNoNUUw1IBK8JILtOPQkQ7HnP5Oi8AvQX+c5ZtglMNtwvZIiuxgylC?=
 =?us-ascii?Q?t8GCD1Y8jJmIAqBmpm3seODrQ5NtfaUn6WJDKMI0sIPcL5h0DXSorlYvt+px?=
 =?us-ascii?Q?Hv2jFaeTaGnKSxQq6vT0ie/D75iiKYcR/2wgWqFBYQ6Y85+0bo8hZwLy1QlU?=
 =?us-ascii?Q?5Dxtudob865BY2+I+DOE0800TURUviGapn03p3XhTnyM/56jnTtIE82DU17H?=
 =?us-ascii?Q?tIMO/Cg+hAEBpU1pAM+oCpIwCDQJ0QSKtBRe3OLZw0lXXw83PLWcgHyOcKdy?=
 =?us-ascii?Q?aHHVEiagqrc+4QmPDGU9v/WpP5t3LoIRRmY1FWtLdU9LlX7550fuCXazmQ3W?=
 =?us-ascii?Q?vI7CpT2v6jFGaAAoXgkHXQE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7213.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hNiR0bGpc5a/nZfz7mEZAbP1SZrLfoHXYHJ2cYZ5AeQ1SizZ2RuNuPCsq3pJ?=
 =?us-ascii?Q?HNL1JjTgwGivvWDMFWK9mZ04xMU6cv9c0WcNu2gmxrCEXV3KtRGPOg5z4Ww9?=
 =?us-ascii?Q?xGeLDp2Ws0BS67kA+2CFK72lSWiCmD3637HERVjxophICFptEGiu8aE6pGGS?=
 =?us-ascii?Q?OrtCcmabDItMwtz9RrSb/Ym0qVj6BAUjHjZfeHInQr/FTfxAsOLTn8iqsBZi?=
 =?us-ascii?Q?B941KZHiJB4NeQhh/S5EBwzv/FqudK2r/pkKBvwrtEQ6ZsLxk7U1UOqmOJa3?=
 =?us-ascii?Q?HBvPDl9+vbpBuxEJknbIvcBRTGg2QqSMD/3zmLBOgjmmSryq69itR0EMQAvP?=
 =?us-ascii?Q?6I2oLQLrtjdZh+T3m6Taiv8bbdv5T3e/oSV1IQ4a+ptWN/gW/ENs2gpOKnbT?=
 =?us-ascii?Q?6gJMuWnW496GPnStHtxaw/2TxTK4M2GrBeO35+Yhsvct3GBCkxjX2QWMbRb3?=
 =?us-ascii?Q?5Yt4/RCNRQ0/wtrOeqjcYwHMO55qunSkOB76a6yyVJUX9mNeqovinBMdPcgk?=
 =?us-ascii?Q?3pBwqDfDOGlDd4ygTMYdlC0mEPiQzyQL6ocNn83OVzwLtyBS5ih3IxgwEKFB?=
 =?us-ascii?Q?oxVfuqYJy1x9UaDnbZF3tLhJDSQ2/E6o5Sqkfsh+eLzHyY9f8OonDrzvljMr?=
 =?us-ascii?Q?uqVoB66zhGSPmJXpM5s6HixeQb1YlFMYuiYgHzeXJoTL9u3GKDJadpix2rNc?=
 =?us-ascii?Q?TslXdSXsempNH3HvWFDWNWwE9dKjaoCWNR3C5jj2rh4on96qqvWd2+1/U3ka?=
 =?us-ascii?Q?+kIQ0vAaOqnzCmnIKL5pyNzCizCUpT17kIAKvaVWrfNdJ8bc/33e2n6ge833?=
 =?us-ascii?Q?9eSNgLU1DShO4kjZ4J52YSW/kO0fdJYNiECmXHobBRU2TpRn1y5G/xDKY2H1?=
 =?us-ascii?Q?HjfnDVrPgAB845lnRgyHJ16ZWzs3ct7JZ81Nd58DD7AWffgInbktlpaKuXt3?=
 =?us-ascii?Q?ME2MTPh9ouONAcvdStbTNN9bk8a9DJ5TQqnYRMfrEdrgJcZMopoerQUAW8B+?=
 =?us-ascii?Q?n1fA6C64R1LgNEZdUauoDGjpxbcIeWne7sXlIG1MszDpC7nHLalA6a8NTc90?=
 =?us-ascii?Q?ScJj0POqymBLRbidktmY9WzhL+ZgqCCnKKYt7HOAWAkaCrabT9nzFOOgZqr3?=
 =?us-ascii?Q?t9v3m/SG7as6o5X6graNBU8V/GR77Sb6F3yn8acI5IgjvYsI0qGR0WXGX01H?=
 =?us-ascii?Q?CKi5qh5OErlyDCJkZCF62QeIJExOFQvZeBgwC6MyZTBraSRihoDVMhYYgjpK?=
 =?us-ascii?Q?/UzxJTx5k2DIE0vBNbjZnaxhqwhUHt6bz40MTwOzuyVktBq0d9cUEnUwJtFg?=
 =?us-ascii?Q?79kdnKUhYCiLpQwGUp1c+FPZlLtMItkezo5K0z9hQvnroM6X62EXSqqLMvRG?=
 =?us-ascii?Q?gXimVD7ruhgL9iAfIVWE9wfxoa2/GCL84fozjG2vS98kl3+DZIyxzGmgUXgB?=
 =?us-ascii?Q?CzNhyO9vddGI+9gx9Grtwptrh8sGqXLT+kqo+vXKxclDsTMcExEeakalTRXG?=
 =?us-ascii?Q?orAgnYNM+MSkOC3GerfRsMDwqxPUMhbZ/xkOAFOaWI2W3z7AF/u4Eeeb4iVk?=
 =?us-ascii?Q?C78bs+3IkX7fA2j6uVsPb8JE50JHWUvDBHUHgxbGiLZVRIuoJ/48Pci4VNo4?=
 =?us-ascii?Q?2N//6YxD13qExmxWnbY+7NBuzSuIm09xCcEh0odbeVqXf1bdw3SJej/SSHxN?=
 =?us-ascii?Q?yWKX4bAaYXIlbXhEvfCPQO+zLemJtBkyqFzmy8pUd+9C36n2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7213.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04144bfb-d164-437f-2df2-08de5742263c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2026 10:04:35.4005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RdBLWJEQuRMgiUACsjMDGqB+3HDEnM8c2PDUMrSBRXHxBnntcbcTRvC+VP0U2VXFe+tmMeOMDMBmgXkLygb1/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10387
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_100439_718358_8765F631 
X-CRM114-Status: GOOD (  19.04  )
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

> Subject: Re: [PATCH 1/2] Fix the imx8mm gpu hang due to adb400 reset
> wrongly
>=20
> On 19/01/2026 09:53, Jacky Bai wrote:
> > Due to the HW limitation on i.MX8MM, the gpumix, gpu2d and gpu3d share
> > the same reset domain, that means when gpu2d/3d go through the power
> > off/on cycle, the gpu2d/3d reset will also reset the gpumix domain,
> > The GPUMIX ADB400 port also be reset. But the ADB400 must be put into
> > power down before reset it.
> >
> > currently, gpumix, gpu2d/3d power domain use the pm runtime_pm to
> > handle these power domain dependency, but in some corner case, the
> > gpumix power off will be skipped, then the ADB400 port will be in
> > active while gpu2d/3d doing the reset. The GPUMIX the ADB400 port will
> > be reset wrongly, so lead to unpredictable bus behavior.
> >
> > To simplify these domain on/off order & dependency, refine the code to
> > directly handle GPUMIX domain on/off along with the gpu2d/3d power
> > on/off flow.
> >
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > ---
>=20
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory yo=
ur
> patch is touching. For bindings, the preferred subjects are explained her=
e:

Yes, the prefix should be added. Thank you to point out this problem. Misse=
d when cleanup the patch, will fix it in V2.=20

BR
Jacky Bai
>=20
> Best regards,
> Krzysztof

