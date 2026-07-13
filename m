Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D222CC44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 15:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IN4Pizp4MdPfV97hbDQzbTYZv9p7XZBSOQ5DVRyEqeM=; b=jlqy7V7FYcYO86QVmzWsK58IfL
	SjQZ4Vl0np2f700VuEcmj2m+69GtwV35abu2C/ujCl6TbWvShOk+JGQ9igpVzk3DyI2EsJrnv5Cuk
	wiBGukRse+tE0FcawFaaXGpDp9VjOiAjjN5CrfwK3AgZxjti9hUM5ZvpeFJC2pzTflNnF36KV9BvZ
	9p4H7jHkPtBzJILPl1KC1k69mk/y+sfKiIfiv+Ov01x6Bd81PdV/pObQm4YMIw69PqlPfWxSc/k8l
	wWKRyOg7n4uiXf7guPe/lE9De3OAg2DaHTJRJumyqP4SToqzfcuB57nEky1UIW0tYidYSFtOmKXD3
	K2A78HJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIDM-00000009ipv-1xjs;
	Mon, 13 Jul 2026 15:05:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIDL-00000009ipZ-1MjF
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 15:04:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IN4Pizp4MdPfV97hbDQzbTYZv9p7XZBSOQ5DVRyEqeM=; b=AtCaKFoeitwJfoqK8zS9cTH9w/
	unX38nZh4leagohoGAV9Xb37wECy/SjdmvRG7InedeuWWMnhKoQpyjjQ+WaCXOnh2NZVYjHEHbrTa
	HCoN9zHR/nFM1QTkJWxd+n8xe54NP5itdpQ82oiLlJ6sHTM/hjNpAw1Ujy2vA+JSxUD3W7Q066nr0
	obZcIMVVUl1YV2PQtvRp04RS+OEFuSEWKztUOSSwLEMYchNtHLTDiIhR+qbTA3ZTHpxoHLga1y5vH
	bkyqBsPzUPr3KIXYiOVCYdpHhAzvuNbFkl3MHlbuHAyMKKA4ru1xUck21o+ecKJPUFne8xWWIUAPE
	T7J3+tjQ==;
Received: from mail-northeuropeazon11010047.outbound.protection.outlook.com ([52.101.84.47] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjIDG-0000000BkoO-3eWN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 15:04:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wLKN0BTEdgD5E7Qxjy25d1jnMdW3mBSUumcPKt0Wjfi1BBEnBDGPWSBP3YTbmaMGLNgEvep14E9h9tjK9Ar6MF21UCBWu/ZZbE/WAOGK3BGNnX1fot01Lyjs267+YcetdzzVbKDqdY1kO0jEI7kE+5Ohe5HRO80kaDPEF3lxNMrhqaWN327c4lZccTz4H6gVxpTZnd4fz7x9r/aChB7N8iqHnl3tgd82V6wQVTg0Yc+GlxiYV/PAgUMKfNij+RLuXyILKh/XC2chyF4WGQG6/wIF0hDVensiQTyO5awAuw56FrnR8wbxcmzzUb70q7/Os74tWItUlxuV7udisDUdWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IN4Pizp4MdPfV97hbDQzbTYZv9p7XZBSOQ5DVRyEqeM=;
 b=oYkfU90kdL5BrnUEW9a/w47zUXfG82aDO/FgBXTIe+vUFL4jBhZMGkOEjKcmRg8kPpSnX6JyBTpFduU84MOvZJbmLQPyqUvwVfLxtCEdY1pzREgQVk9qxZyjVkb5S6Hp7iVPN03mtLmmvqVuO5a7dO1MQt1EhXp5993JzkyMMJ6gmxWL/6Or8nCs1WyNgUZfSC9lcc6MS3MdXOcP65XfGBY0Wq5RmuxrhqcvdEhxssIKj5Gp84kQru9BKLfmPYS3wAcFdUxsG19E6JTc23VyMtVIp78qM8u/cULP1MDYH1EiZo8J+CET2+XOalHLp23ZSDdIig56ShiJ/0EKjNhz6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IN4Pizp4MdPfV97hbDQzbTYZv9p7XZBSOQ5DVRyEqeM=;
 b=LRMwoE2Uy6e96ba6kt7ep2zPxrin5Uooiv8wpPlj/m1pLD8LY+xdfIVEYwAqwiJqQCHiVYGcgOvLHEUb3OFjO+hMi8+yxNJ2ckczjGndUnYG0hu3z2L6QrWIwPvZgDcd02Yhp/d90zmJ3ghCfmMaOi5LRtmkcL8rR52EgfzFsOVAhSd6+XR51qO1virmGsmVeEkyZJBUa1EAU8Mjg0HZO+ZyWMnO88DHAqmGnhgpCx+Tgd1fVJ7Tm7ZmzsLe/Ot2bR2qramIM09jLe7PmEFPflluho6kYYal/QEniwYMG+sQPX7DP/0vloCd5HsO4tQEqx1Wy7sJjtA4vmNBW5T8vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB11388.eurprd04.prod.outlook.com (2603:10a6:10:5ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 13 Jul
 2026 15:04:51 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0181.019; Mon, 13 Jul 2026
 15:04:51 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: freescale: imx9-var-dart-sonata: fix Ethernet PHY configuration
Date: Mon, 13 Jul 2026 11:04:42 -0400
Message-ID: <178395507556.391275.8082719222277583308.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703152731.236793-1-stefano.r@variscite.com>
References: <20260703152731.236793-1-stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0PR07CA0036.namprd07.prod.outlook.com
 (2603:10b6:510:e::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB11388:EE_
X-MS-Office365-Filtering-Correlation-Id: b46b2848-d15f-49b1-16dd-08dee0f0169c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|1800799024|366016|7416014|376014|11063799006|6133799003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: H5UM84NaKd7hAW+4TPGX9J+mNwOQPZpp2kkkBtlKDxDXAOfV6RqS4nunagT83sWMOARb8N7dKdA6wNLoPEZrGbbQR0U0uJHRovw0QVRlW4/mQrLW0cM2Y0zorprM7lLf7wQy+VZX6OMvr7rg+r48ksnV0IxfEl8wqriwv3gtFXy4WtbjcEP28g1Fnyasdtr5WdbxhU6KFx8SQWX1rSGrS07BTpto1gHVLCxv/Xi274QH7diCkGhXWYk3e2xoyOMjRxfPa0BFXd6liMEnzWhiEwQqm+1+zJX5hziZd0ymaOp92VfrGgn2bdZEv8ql/171rTlufLxwRzmz4GhkMYiMWA8lsdpjF/UEhKo7Pw3CHjCjhKtiAEyjmPVc6eZU4R8PtoaMuweWBP7uF7JY3ZYaX+XYM1RBT0ZstA+o0mf8BlfcBXdKTuIeRzFxUgK+9s96nz5CgAtbKwo2qr+x+1L6mA2twsfmc2JLsmPVo0K3EM/EYzvF8vUbDjr8s0OR8THXTR8b1CI23TGfsD7CtFbV4Cy5QdXB6Y1YIcCh08jeY8xHZ/qp39C++9yhfUitVUNC76cMxLibdF7FBmE7FjFvNc7GKM1nz2cj0k6KCM9mAbbcCZkSorgQkjzt3bf/Ko5CB6a6lcNS39aL1K/T6jD421WzzaUmpp2bIchqOwB/9LA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(366016)(7416014)(376014)(11063799006)(6133799003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTZqU1MxRzlyanplNlBRcU1WQ0dVNDk5SlJ4azhFYUxXUjJLK0Y1SkxDZzdD?=
 =?utf-8?B?Zi9kZEhHUmllWE96NHRSdUtHTGM4Yk9IUTNXZ2NqOXVtcGtVUkpnQ2RFNmRT?=
 =?utf-8?B?NCt0YnF1cWpaa3FVelkyMUpUVzVHUWlMdzZLZWdza0hKUllnakVXVjNNeVE5?=
 =?utf-8?B?aCtBRldtMzIyS0NON0VVNEdGQzM5UE9pWjNuUGhEUUJXc0lmTDhEdlpxemRW?=
 =?utf-8?B?b2VrWmt0WUtZeHptQWNEd0djTFFSeFBNVUE4R05XMVc5UFcrc2FEQjFuWTJm?=
 =?utf-8?B?LzI0dGlwSW9aeWtsSHNzQkUvQStQdDRpQlRJNy9YZ1RVZldTTkdUY2duekpq?=
 =?utf-8?B?S29ONVIwek1ZVWNKM3hTZVRENDN2aGNnd09ybUJQbEFFckJFUXZpT084WTBy?=
 =?utf-8?B?dGU3bE85WDZqTUE1a0VmUjVPcUFTZksrM28zUUFUVWd6YXoxTHJrWkh0bkJL?=
 =?utf-8?B?YmpXdy85bS9hbjNycFZFeTI1UWpIaEU2MUpaRnduMUZocjZCNUlKd2ZnRllT?=
 =?utf-8?B?VFFqMTJ2ZDBodzJVUjAvTGVQN3NxMTYrR1ZEWm1kclVlNkZXNTNVdU92RHEw?=
 =?utf-8?B?Yi84N1lkOTFMRVhKNE5JbUZabVBtVzY0L3grOWZOSkd4L0xwUWdFVHJSdXVm?=
 =?utf-8?B?WUZmZnBDcndBWGYvdzdTTTBkekpwQVJJbXRYckpLb09mVktUM1ZKdVREb3dZ?=
 =?utf-8?B?d2tPdytOdWdWSnczTXFzUldncTNKWFB3bWZVVUE0NUEvc3pMSUNsa2x6NmxU?=
 =?utf-8?B?NkJOQWZjUHNsMTlWdmZjRnJkemY2WWhxYnVGSVdna3ZqVUdzd1VnWWxPMVVW?=
 =?utf-8?B?UzVlYkhUU0pRWFpxMFZjUi9melRXQWZTUHk4UzUxSFBVOGtWQjQvQkVTeTFm?=
 =?utf-8?B?TFRPQzl6Q0FqUGNyTWI5Z2UxTENGbzlFRkZkNncvM0dSdW9QZUpnRVBHWU5P?=
 =?utf-8?B?RE9VdmZmUGl2M20yZ1ZUbjhjQVVvWWFTLzNMREcxZGpERUlFQ2RLakVBUkxT?=
 =?utf-8?B?bkc2dVBZemFhNUNVajNvVWxqdHRtWm4zNk5rc1VUcW5HeU9kdDdFWS9xVGlK?=
 =?utf-8?B?T3dzV3RGUWdodHdCa3Y3UHZFcWFIYWEramRmOU81dStPL25XMkhmaU1ZeGFN?=
 =?utf-8?B?cXl4ZGpmbXRmOG5QTkFKRlJlWlNYekRqMFZ3N0pCSFdhYzFCSmpWL2VTa3pY?=
 =?utf-8?B?T2ZLSG03Y2dSWnh2RXNxZHFiZUJucTk0djZidU14YTVkSVJZV0dqVXVrK09X?=
 =?utf-8?B?WE44dzVxZU9OUG5Gc3ZXN0lXS2xJTitMNGFpQ3pqd3pXcjhTQ1RYczlQZnpE?=
 =?utf-8?B?dmJLcFMyTkhZSzJDMW1aeXFpMUt2dURBWXI5U05ZclFzc1JZbVBZT1VpV1dY?=
 =?utf-8?B?b0k4Nnd3TFVHN2JVNFF2UGsrU3VGbHc5bFhiRDcwRkpnWjcvU3pQQ25jRE1S?=
 =?utf-8?B?Zy9iTHFBaXlNRlliaEdhM0RUaU90Z1hxSXB2dHlNK1NsTXZCMWNwdWRZb2FF?=
 =?utf-8?B?aDBHU2dFWGlEdnRtVkZVN1V2c3pVNFdoZkthelFZSytnT0I4UFJJRW5ka2NT?=
 =?utf-8?B?a2JUcUVjVWRCNUdSWUxYRGZjYkd6WUFXRUhRa0NDYTB0aFFVMmhtaGpOV2lZ?=
 =?utf-8?B?TGRwaGw4RTR6NituTit0cGVkSVRrQXprTVduQ1I1aUFiR1habk5IWVpJUmha?=
 =?utf-8?B?QllzZkJSSlBQQTlUQXF0OFVObE1WbWdONzhuU3EvY3AwOEl5d3VBSHY1RWJX?=
 =?utf-8?B?SCtoaFdoZ042VlRRUFRiakNRa1pDejBDWnFDYnNkU3hoRm9SQktkSmZrdnA0?=
 =?utf-8?B?MzUzL21GTk9YYWRzVEpzR0tLaElLU1o0UGFiSm9nSkQ2U1ZEeFB3Q2l6dVZE?=
 =?utf-8?B?aEJ6aThpTk96cEM2RWRYcXVZVmdQbWtaYjFnY0RxdHVPN3UrVlZEOTR2QnFo?=
 =?utf-8?B?NE1rb1hBU1FPMW5jamVMb0czSjdTZ2dybFpmaXpUWEF6TFNkTVhGTlp5RWVr?=
 =?utf-8?B?b2dOcENPdFZSSnRua2FLSXhTaDFVRDRIN2pqYS9WWE9MajU3Tldpd3U0ZnJS?=
 =?utf-8?B?Q1ZvdFZFenR3a2ZOSHJsU05hMkV3L0wra2h5bkQreWFZNFJ6TDBPQ0NTVk9u?=
 =?utf-8?B?dHpkalVoMlJLTnAvdmVZbU5ITXRBR1BlSzZ2OEdnQVMvcnRWb1ZaTFkvTldH?=
 =?utf-8?B?ekIxT3loa3VUcmtjdUdwYUw0QTlsdGFQaDlSYWVWM1ZsVnhlYWVYOHRucTM1?=
 =?utf-8?B?Q2NlVVNqUEw5MEZ6YkZRQXh1MW0wMWtrM3RJMGxML1NkcFZBQnhzTjBLNGxk?=
 =?utf-8?B?cWs4RGt1VU5mbzRlOFptNDFUM1kxa1hXTEsrZXpXRWorQXV5dnFRUm45RGp4?=
 =?utf-8?Q?2ncohogMOZGAEoU4=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b46b2848-d15f-49b1-16dd-08dee0f0169c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 15:04:51.1277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZS7XzpGUtyik07JAI5S0akCnmdJXVIbLYK20qud/e6N6sa2yGq0zDVkTVvLG5rH8d8MuavLkQmYTs0yq3sEklIM0dcKNZX0hQl5VLZMYMCZ1x7NUGBGA1DTNj8sk3iC+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11388
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_160454_978864_F5DB6E9A 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
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

From: Frank Li <Frank.Li@nxp.com>


On Fri, 03 Jul 2026 17:27:31 +0200, Stefano Radaelli wrote:
> Fix the Ethernet PHY description on the DART-MX9 Sonata boards.
> 
> The GPIO previously described as the PHY reset line is actually a
> board-level enable signal required by the PHY. Model it accordingly and
> remove the incorrect reset GPIO description from the PHY nodes.
> 
> On i.MX91 and i.MX93 the signal is described as a fixed regulator,
> whereas the existing regulator description on i.MX95 is reused.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: freescale: imx9-var-dart-sonata: fix Ethernet PHY configuration
      commit: 43c17d862977492ea7c4a21e4c8f22582c603508

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

