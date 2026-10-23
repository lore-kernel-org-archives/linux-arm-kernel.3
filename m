Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7335C606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 19:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FTB0Ibwk;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=SQAKTTyd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=brypqxNwrka6KGLfZBzdqOsfq8rb/Dv3y7ViwKad5XQ=; b=FTB0Ibwk3MPJCxhbLCYlLQH8zG
	PZwi9EI+SixiNNPUUUAxibyNviMGPMS7YMUjzBok2FeG69x0SDvyJazQA4qiXvQdYmw8LONPgJwhl
	pEaurmqIgmwwgq+qjMaQ2qT/eQlfqhUSEquT2r5fcTJOiOoPyMfLiS2Ld7sTVHoWG0nnrdr8eJmTA
	NgyV+sJNTsMREEDG00mUJjU02yFAfONwpz87Z4GCXRdIW15CdiID2o6lFzST9HgKR7OvuFNHiYq6A
	aqoaDF1M2hu5AdiSnXu17MqHtyp4MBaFUqZUC7fCqsscWHgIF9H6ivH7f/FkmFHWb5LlmEfnpStza
	MGifkHGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKLCt-0000000Grti-1Qy0;
	Fri, 23 Oct 2026 19:45:39 +0000
Received: from mail-northeuropeazon11010060.outbound.protection.outlook.com ([52.101.84.60] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKLCk-0000000GrrY-2swR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 19:45:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1VCUZ10c2+BuMCGRB9Plrxzo4B0sGGuUR99TVwOUQZjh9AzA7yTilU/Yj7b5sH8mDBgrMW5C8YydgLvP7BDe345czW+LC3hoWIiWNptI1LS6+hrMCtCgFx5SW8kjU/BC71mXN84bcnT3OdaEsDTesCaLgnl7ZZSM3HU54vEb19UGnBUOaG2tLG5ubyH3xr6G/GawSEQZ+abIjLlQOFgctOwSPlAsZGqRA4GlzSQIrzaISCyk0g0Zq8QQLL826lABwcFfVe96FdKQrvHm7JvepoIWXvQrMud5yZ4/ABWxS3olWJgqgBbs/7d/1rp/HZvYYQKJaiLUfS177FysJZu2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brypqxNwrka6KGLfZBzdqOsfq8rb/Dv3y7ViwKad5XQ=;
 b=vBdItK+AObi5eEBTWbL5AmxQ7TRO5HA35Pi0fZcujHw3GTlGJVmFVbohwyZ6Mga+n5xXLp2is6HFBK35gRJJguY4ixSMyuGx8nXRylgWWNoSOeWXk3OrD5xMUDdBE2JufYcUJFbkumOf1Cy6QnfIIN0ts3ebbtzEfm8L7H4M2OYvgDtt0Z6fLD2aN3n4bTmQxlDng77Xi3Y29l3jF/bGvkcrudV5QxsVJent4Ryx2iPLA8LjkQ3Eh0Uky+RqdUEL2wYpuk9mqGeIJo22QoVpVTBDLwlS8Eo3SbCI5vBFXPlqtY3X5MFS0Dt+OPMbFIiRu644ikuqInLp4QMahWJCWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brypqxNwrka6KGLfZBzdqOsfq8rb/Dv3y7ViwKad5XQ=;
 b=SQAKTTyd3u4XeSfIiOvAk6nfiT7W+OI06kjH3CU/dPInTelw7tdioE0AtYF2vRB2vRavSUt7pzt736b/L/Seid1XZBlPHsjpXTHzojCfxnsy1A+5ngL6f8P2zirbOlUy2hu+IWXZ9ZkiQBUZSaThHTIryCDX0rC/bpd3CR2KOMowba226etjShsu6zcK7koR9mbYow6J1X5AXenIiS2cUxvMqu8IJauMEktWR1rPg+iXI2aoqkbrpvh7R4bMHYBg+B0r+uD4fJCDX4+oe/DplDTnTB44OPm3OnHTu4RSOoHyqc1crrLXSOB0ipt4Q2tFJcRUlPSLAgWt0827k3oBpw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS1PR04MB9238.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 19:45:24 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 19:45:22 +0000
From: Frank.Li@oss.nxp.com
Date: Fri, 23 Oct 2026 15:45:09 -0400
Subject: [PATCH v4 1/7] dt-bindings: lcdif: add compatible string for
 i.MX8QXP and i.MX8DXL
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-dxl_lcdif-v4-1-4ae8395a4b23@nxp.com>
References: <20261023-dxl_lcdif-v4-0-4ae8395a4b23@nxp.com>
In-Reply-To: <20261023-dxl_lcdif-v4-0-4ae8395a4b23@nxp.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Robert Chiras <robert.chiras@nxp.com>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792784713; l=1922;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Y5ktB+jnBb0dy3CF0268DAahnYcLBApZjFFC3OugfzU=;
 b=rSoOtJ3H7poD62DV0M2WHOSeefvlL7cY3tnzWR8WOY5BjhkxjT/BBBC1J9bFaLgLf4K8teWtx
 lKl3prpmXUGCZuCEWP+naRSsU1sntKA9/s5oANyCW9wa1fDuoYplNFx
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS7P221CA0041.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:8:25e::17) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS1PR04MB9238:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d7738ba-e61f-482b-3ecb-08df313e2d37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|19092799006|366016|921020|56012099006|11063799006|261009223027099003|261021121427099003|10067099003|22082099003|18002099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: GYEC1nPuw0oujiZqIeqfrlhnsdXuL5deXaE9sZPTYbaKYVIjDjL1yTCdJLF9Ufoe1BqnbVYXh4A4JcT0nmh4eVkMLfrbU2TqY7PThGHDHoqnK7+tk/p8VvHxnXaRMA3q17I6d7WYgdm85NSBM2EsKblMR3TzJgCBWb+HxaolQTut8DcCOFV4hnDpGmZCgD+3JQvgobFifha2P4JX1JJSOoZKYyMBbRiriJEGtaCAYTpkqdomTRiD8IiEF8uO35JB7lNOZP3QKxSu3FBMtAwCRbXN+VDWZ708utyKDmuPlzhkqgKQHQqTPGPzJmrQX0q022lPGtEHgtJ8gRNmBbis8bGCxNM1DoZpqtvUvXxtIwrd2YSswo299ZSHjmfdcx7g2rAcaTGaGWKty4qTkEGkZmA9AMibsP5dJIXD9pyqauh7YRceUHzeBtbAwqpLQuffu8Re72NzYY5e19kr/W/7+JXpdBL56c/vc+o/zCTHM5vAQJpqInNd9rKlKueKe1qniLTcXLdTjlgOCzpNLBSUT1rCcsdFarlhZVnjT4iX1dfi3k3L2yK8un16/v7gnM9TQVErJ2ZG6dOKEXPThVvgJv9IbAJ9NOkq+HSW7/sEZ8ng9C8N3AROQe4LVaYzAGOW1LpZtMJ2O2a3ISSRVQUNtFyTr6Rkn0Njzu8SUc0HQk86irT215eyYN2rcWwQ7EAgbUfNNBbDhH7NrTZZGWkKyw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(19092799006)(366016)(921020)(56012099006)(11063799006)(261009223027099003)(261021121427099003)(10067099003)(22082099003)(18002099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWdwdkloQ1VkbHdWczZBOUxRM1Jqd20vQ0UveGFWR2FqNnMvT1BHbm1rdkQ3?=
 =?utf-8?B?clY0SjJiWDJsTGtjT2kyNVJ6R0ovYkdodS9OMTJ2YW41cTQ2L0lXcS9zeHVs?=
 =?utf-8?B?ZlplZE9La1ZXTndCVnNUUFFsLzNUc0ppcTlIVm1xVUNhd1d0dUhPRGhFNS9Y?=
 =?utf-8?B?Qzk1T2IrK2tLTkoyWTdlK0ZMRUZRV09saUdoUnpzUVdIQy9aUnA0YzhGM2hR?=
 =?utf-8?B?WmcySjVIM2x0amdaa3UzMG5pakVCL3NVeHJmcm5FaUM1RFBBOHNDYnhLY2VV?=
 =?utf-8?B?NE13UFVRVytFYUx2alZXU1hDa3dycms1MVNMbnNmVmpweHg0QXF2K1U4N1ZM?=
 =?utf-8?B?YzhnTGJub1FIeFptTHI3cm9nb053MmdMN2ZSbWMvSUNHWGVlQmZaTVZMQlNp?=
 =?utf-8?B?YVZzamlBL0NldFphZ3ZFT0s5NUYwK3hCZDhzVTdnMkVJYkRJSjFVaFBPMDM0?=
 =?utf-8?B?Q3ZINjVLSEpnWjFpSm45TGw0ZXBST3k5MEhwMGp2Wlg5SHFVOExsdG5NVDdq?=
 =?utf-8?B?SndHdjZ1NlJxanl0YWNnREJCdnpOUWVIWlhDNFVwM0t2NFgyWEtxbDRyam0z?=
 =?utf-8?B?MG9mS1M2S1RpaTFLR0hjQWpXWW9hUUZIVnRCeXpyT1NIM1pIVG5ieXArVHJr?=
 =?utf-8?B?eGR0Y09mUk12cWd1VFliWU5wR21sRElGU0xuR292K0o4T0NDVzFjTWdHaDBM?=
 =?utf-8?B?UzMycUVKUCszWGRiL3hDY2pxNlFaU3pUOTg3ZlVnNTVQK0RKR1JtcjRKSXB1?=
 =?utf-8?B?NWU5U3UvUy9POXM2MUNmMkp6alVHQ2hiNlBTUzBIdCtZTTZtWDl6dkp5UFpT?=
 =?utf-8?B?ZVB5a2g5Q3VLcmJ3Q2s4TS9UOWVnR0NOL2sxbThjV3pTdzRpbTJaT3k2ZTRC?=
 =?utf-8?B?S0pRRTZ5T1hnZ3lmZ3BBdzB5MytYZElIWktCWFhUVW9yVkFFM1FmNk85S01h?=
 =?utf-8?B?Y3FQcWg0cXdZYnB4a2dYaUtUY2kyYkJLRDJ1UlA4MFV1RlJ5RTl3K3E1UXJ1?=
 =?utf-8?B?c3NuUFI3UVBqVDkzbnZEL3ZwVVlxTGU5dmJuRHcrOGJUaExobkx0RHloWFFM?=
 =?utf-8?B?T1FZbFJtZyszMkZCSHpCMWR0alpKakttWGNrREF2VDhNeHMyVVZPRmlkUHJB?=
 =?utf-8?B?VWkxbFhaQTBtWHZwemRGNkMyNjBsZ01POVBkMmIxQVBWRFpVTzhjeTNLYm5T?=
 =?utf-8?B?Q1gzRXc1UndYd0tFL1pkWEpqczl6bnl5UTVDK2ROV0d1WlJWVjFLZkt6SkRH?=
 =?utf-8?B?RU1BS05hWk9vSkk0cERhUWRsV0d5VnltZEJDallOQlZZUTZwRlpzbnduKzlw?=
 =?utf-8?B?bDUyUDZaZG1ESG5zQU0wUjN2cHQvWCtPY2tndENHQ0dQWTN1Tmw4eWFsL1Z3?=
 =?utf-8?B?Tm1EMDRYc0xrTDhMK0ZHdVZMOHFuMGdKMU16RFBWU0I3dnpad0I1a0MvYXhI?=
 =?utf-8?B?MjhaSXNDU0hhTnZPZUowSjlaSTlSTnBZbE9VZk9xRythVWFhYVExS2RwSU1C?=
 =?utf-8?B?L1lGYWJaTnB3cDZ1T01DUnozYkZTUmFuN01qeVVNNEJLR0FzeHJtMlEzK1lG?=
 =?utf-8?B?UW80VVVyQitFYVNWbUVwRDB1b1RpblhCMzN4R01JanNiOWVZQit2WUI5b01h?=
 =?utf-8?B?THdTbHNCQnZwZGJUenVnRVBzTUpPOWw0aDljRnNJQitFVmJJNklPR1Zha2dT?=
 =?utf-8?B?VnFmMmRKcjk3RS9Jd1E0dWU1L2EyLzZ6cnZJUXJUdUlQVjVtV3gwRUJuU3RS?=
 =?utf-8?B?Nnp2TmNibnFlQWxmOENsQkZQSXgwYmVxUFFZQlpJQUt6R1ZOWVkxYk9EVVR1?=
 =?utf-8?B?Ykh5NDhsY2JJUTIweWV3UFhkSU5ObW9HbXYvMEJyeDNlZnhSYWhQSUxQdHN2?=
 =?utf-8?B?UDZ0akJENk5mM3ZaWTV4dHhkZC92L1IyVVgwM05VWGZaMTd1TTI4ZHdUMXlv?=
 =?utf-8?B?YjFiWW4rZ0g4RkVSK1p1UVBWUm1JTU8vTnVTODRyc0FWczdyRHlxa1NTQUhC?=
 =?utf-8?B?ZElKK2VWV01UYTFoVTB0QU9LbUcybzdTWkRaaVVYbTk1OHhBQ0tCdmE2K25K?=
 =?utf-8?B?NGM0K1RLVWxuZGtoN0w3UEtEMkpVQUl1elVaNVM2RS8veEFxRHlpV0QrQUlh?=
 =?utf-8?B?eFlqbC95UnFwR2tCVnVFSjkrSXBWelBLL2Z4T28xYW5sd0R5ZUxueGlZdmhj?=
 =?utf-8?B?YjlEZTg3bi85UEh1VWNTQ2xZUi9OQnNQc21WT05icmdIajBUaDNUV3MxbFE2?=
 =?utf-8?B?YjVWU3hyV05wN3F1TzdtblFrMVlLM0ZsTGtDdVpFb1J0ekV2SmdDOUdta09F?=
 =?utf-8?B?U0ltRTNrblB2TVRHQUx6ck9qcnBUWW1rWE5HZnAxalJPUDgyT2hhckZCMDdx?=
 =?utf-8?Q?e4Kjqmn7mDkcDAHwqByyYtx2DMAfshAQQ87jC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7738ba-e61f-482b-3ecb-08df313e2d37
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 19:45:22.7015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HK9i4iEKd/SDnCrAyuEC5PHnWSSB6rT3+WG/P3vWcPPtdos2LvgN5QXO5jj69PAKpfinV/hLUPrO9mY9QZ8NV2Cg6ITaWw0DLWlnCBGd5Hhdh9VD9YoFpMgMcHIRuhj9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9238
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_124530_738384_82A18995 
X-CRM114-Status: UNSURE (   8.08  )
X-CRM114-Notice: Please train this message.
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

i.MX8QXP and i.MX8DXL have lcdif, which back compatible with i.MX6SX. Add
front compatible string "fsl,imx8dxl-lcdif" and "fsl,imx8qxp-lcdif", which
fallback to "fsl,imx6sx-lcdif".

Required power-domains for both. Required 3 clocks and clock-names.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3
- require 3 clocks ans clock-names
change in v2
- require power-domains (sashiko)
---
 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 5f56e733c4f7f..c986ac87fc2bf 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -28,9 +28,11 @@ properties:
               - fsl,imx6sll-lcdif
               - fsl,imx6ul-lcdif
               - fsl,imx7d-lcdif
+              - fsl,imx8dxl-lcdif
               - fsl,imx8mm-lcdif
               - fsl,imx8mn-lcdif
               - fsl,imx8mq-lcdif
+              - fsl,imx8qxp-lcdif
           - const: fsl,imx6sx-lcdif
 
   reg:
@@ -122,7 +124,9 @@ allOf:
         compatible:
           contains:
             enum:
+              - fsl,imx8dxl-lcdif
               - fsl,imx8mp-lcdif
+              - fsl,imx8qxp-lcdif
               - fsl,imx93-lcdif
     then:
       properties:
@@ -162,9 +166,11 @@ allOf:
           contains:
             enum:
               - fsl,imx6sl-lcdif
+              - fsl,imx8dxl-lcdif
               - fsl,imx8mm-lcdif
               - fsl,imx8mn-lcdif
               - fsl,imx8mp-lcdif
+              - fsl,imx8qxp-lcdif
               - fsl,imx93-lcdif
     then:
       required:

-- 
2.43.0


