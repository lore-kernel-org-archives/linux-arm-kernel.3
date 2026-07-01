Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FF7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DFsQDb2xtrQQv0exzeYaMq3CsjbQs9Q2hZ96oskW8W4=; b=LfjMpYmzt5gEuOzDrvi+d969FY
	F/RPTCPZ8zA8XCdDQObYFzAqwSBQplM2sUplP3qBxqr0JJSpBswoiENSemk7CZbYg/xQ7NvwVzKAk
	Eh7LIagk/dO5m9/uOJE+p76H6H2wvLE2laUHJMqBp+jGy5PrlDpV77FDrTVDymgxsWStkXTCFFak3
	Dw3DR4WCaeO+SrNwO/wQrMSrQPJUqpBamJ65yIUWCg88NCQoQhYxa7sk4fXBC/QpFxBCxN7/Tr/st
	gOnfslnPIlVkILq5lEw7ptKeEntOOMGS8XjWh/Fngpo0ny6qxhdePMjiG5QE3/LlQ21s4z1pSx8G6
	ui2Kynfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetTY-00000001U53-0pTy;
	Wed, 01 Jul 2026 11:51:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetTW-00000001U4e-3glW
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Jul 2026 11:51:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=DFsQDb2xtrQQv0exzeYaMq3CsjbQs9Q2hZ96oskW8W4=; b=WJob3CMxWL++qvcLBF6wXdVhLX
	Uo6ty5wlOIvaDVVoAGMQB67YzD2zNIoicQ0WrQGZZADikEizFruR5XWHjCJOblNanOEWS+T7aTsGe
	R81OUPe/nVIuuBys/2rt1fYKTVnZ6IAkNjUXbqni4v+RVZOH7RnVCAz18ntmKDQHCbv/PEHzOEyiS
	Rq9uL4r2zq6mLybNNgdqxiYfU5h7Ibe6Rc1zUr2hLibk4y+kBmaVBxlN0yvO57CJImygdPTFExGQy
	VieRTLH/+vPdu5oUeuAdIGkxg5WwunTCOEuJqxtSjD8d8tnHAHTEWLIcYIGCbUfedHNg20vNuxIWE
	Rqf1z4Ng==;
Received: from mail-westeuropeazon11013069.outbound.protection.outlook.com ([52.101.72.69] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wetTT-00000002hdS-2m7t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 11:51:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZN+qTmjo5qUGCq2lDB2Z+3zoMQ00NA/i1X/UXZwft8CUsySHYCyNE8aZpfLb3Dp6OxmoyODO41p+2n52PacmSC/drQMpYW4NRej0m3o3ndFND1mEykNcVb58+/mGjsq16Q4sCXBLKu/jL4twTh5aN1TCrkLqxAolwcN2692xZQSm/UunUsiE3QGz4TJIS49zwKRY807uZDiSKk2SrL9S2Jg5iGyRQXFFC2NMwCYhUGFs0x/WTqfNWbU7ccaNVIwXqVBihj9oCH7f8S9wK00QabbZlFRkkZxl3prsGToHpw4iyTFYH88folzq8G3AkBwqRlvnr4NojbVCkLnWybPMwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFsQDb2xtrQQv0exzeYaMq3CsjbQs9Q2hZ96oskW8W4=;
 b=IkRBNGAZj+ZkXH+epLB1kt9DnNuIRTPuX/3w2SX1n9F5voX2Db6deF3mBF/V1DOVeKAHj3AsHUr1DpZ4QuVp2gxNIIqmmdHFpp8JpTVRlxmw0AXRPmux6CttoFS4tlEnFQ1KJnmuj5hH0IpTxg38AvcYggli+J8pXd7yRXZAlbuD3GnrR5lr/CF8j6/m56PjYx0vC5E2dh7iCi+mrbpjkGJwMJvlzzUpcBQapV5UNc7edZAFMiKE9cANkvqE7/YULQwH+cuTOSGbxX03E3CljHkW8q1FRbZUQISqtzC2qXFVEmI75SSq0K4tebDOsj8sOQgI0mLQuofARmd+LYjDvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFsQDb2xtrQQv0exzeYaMq3CsjbQs9Q2hZ96oskW8W4=;
 b=BC8dPSrxmn30cI7nH0Z+KTIGfJMbeRRb429HZ8TXI9KaC3eMcxKPcCJYqci3WF9X8yIZXAVKm1z6PX8A6RmfzGvF9g96bPyXjEue1NQZ0DKPSUf2epHVEXkqzXLg83L1pH6TVYFc9L+R81qcz+kBucwMWTCB7e+N3WIwwsWw4ko0lzzeZtYOX4r2BXNOGWfN7vZ4xwMEOQ5AaJW7z1jc72CTUKeNK7foZtI7NlO1uXhqtI9FlEERijRX/izB0VGgOgI/GzHxqr/VXuwCBTaMU6yH8GvBQMnl5szCktEGJblsN2nHnaJ/5BikDTDVrH5aHe9y7IX1ow18x4O9gsscTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by DBBPR04MB8012.eurprd04.prod.outlook.com (2603:10a6:10:1e6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 11:51:22 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 11:51:22 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: [PATCH 0/1] describe GPIO and EIRQ resources in SIUL2 pinctrl node for S32G2/S32G3 SoCs
Date: Wed,  1 Jul 2026 13:51:19 +0200
Message-Id: <20260701115120.1115494-1-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P192CA0012.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5da::20) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|DBBPR04MB8012:EE_
X-MS-Office365-Filtering-Correlation-Id: f5bb882c-55cf-47e5-45d2-08ded7671249
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|19092799006|1800799024|366016|376014|7416014|921020|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: lxJl6Gp1CE5h4YGTFTmP31yxdm6OvasV7LNOJycWb0GdEC2W+dtvHuR3iHj0vqBvluPGBxaeYIWAczsbSWHW3234EjOYMikT9oiKjY622xJVPl7zm4oqCrljG2rOEkXubfxMqWT0kRCg6/Sk2m49CRVWp7mfvOK7NRsT+gJQXQqQ1H0CK7H2VXrcMKw0XOVmgCCTOpGe3YcZiXzt9/UQa4sFac8bhh9Nl4CCI5hxlPUY8OuCZPjGfaZuuDKW2ZYQhKmzugfyfa5SNvcb6K9TcJCAm7hznL4LnZ6QqtbFtqJIl7egkoCzIZiC8bA/b6vEQ0ImOLVfPSw9fhsquLVd5XpgDYoG3BRYOoCIFdMFTUkKLojYFBgE5L1hhCq4KxzQaVh7LL6aoDfj6dhcnYTCk2HP9ABeB13UnMgn0g4aVR9+/o6B2ESAJ7jE9C4onoxjZ9Moi2NYJkUFK8wVWuhw0YXmUxrfgKOo7Zkqq38fkQFGasvErCochlQhf08vuZ2NGUWecDNlYl/fw82OF/Dd3jfjvIdqSGXeLVDtJDj4xJPm9vBTOV6QRglYXOgCXr3n/ZpfN987iHiafnogSwLmkyAi+1cWc7vF3Cf5r5d0ejFwKCKc24b5Z3drijrE/fpJufAz9KsVblhZkMW6mkqaSBJAcgw8fgUL+XU0FVi/C+vSqB5xGHKW5o+Gbl8GFEgZr9VIrEcmYs1rxC0KoygxQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(366016)(376014)(7416014)(921020)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amdsZUlIcFhUM0tGQ0Z0Qkc4am1YenpsY2NRTVhyQ2lqQ3lBYXBsOUtab3pO?=
 =?utf-8?B?dGY4UUZZM0ZVd1BsRWFsZjIrZU9pZEZCUVZxQ2Nna3o4bzloSDlMdlZZTm1o?=
 =?utf-8?B?bnBmWGhiRW1taFVPbkxEa1RtYXZkZ01RVXFSZXNXTTM1Z05IWllhRDJlMUxa?=
 =?utf-8?B?S1h1LzF4eEkzNGpabjNOVHgwaldMTDhQZmRTMTlzWUdlREhPWnFaVzVjSWQ0?=
 =?utf-8?B?aU1xd3NQRDJhUzlCdFRYK3B3OW9SdUdiYnVxSEd6emx0YVplM25UZVdTTkUv?=
 =?utf-8?B?NmZOeXVtVHpIS1R3MXh5UjJtY2tEdzgvVEVFVU9IVHQyMjJLZ01iYlZqdjNt?=
 =?utf-8?B?UXNXQjVXdU16QXBwR2F1VjJFN3ZxU3pINEx3RjJ3d0NmK0hVNm14UU40dWQ1?=
 =?utf-8?B?eUhzQ0dneDBKWFdjaDFGdmtYZDdJWlhKN1ErSHd6aTBiUU51VXV1SFpSeStj?=
 =?utf-8?B?cmk4RUN2dkVvR2tIdWRvZmdPeHRmZXJhUk5VeTdwaDBrYU1VeTRKaUUxZDQ0?=
 =?utf-8?B?d0dQQTIyNEVDejBySUhsM21nWmgzaGhZTWxheU5OSmJyc0E5SmhZZER3djJR?=
 =?utf-8?B?MWwrT2xGcTBDSnJMTkFESzN3ZmFQMStoajhKVE12OHhBamt5UzlycDRWZ0g4?=
 =?utf-8?B?OHh6VTZ0c2pOMFlObWdvNkRtdFlva1VjSGdVTXNoRkNiYzlKVmhlTjR4VW1Q?=
 =?utf-8?B?QzM3SVRkV29qb0orRkpmL0ZRNnpGcS9JRTlFYnIrL1AzOFFJeXRWYzR6ZEJL?=
 =?utf-8?B?Rm1wdDJQOGx4TnQrUDdUdTdOdkduNTNGMzZKN1pmQjhVMldIaEdJSTQrZ0xt?=
 =?utf-8?B?cUZTSHJsMDFIVUtBUlJHa1k1dTJKRkpTRWthZVRxV1VsWVdDaUJFeWRNeDg0?=
 =?utf-8?B?YjgvWUVNbzQ4OTExMDZaZllzV0xVb1VIYkFvR3ZqaG0zZUVNR1QxcmxsOTZL?=
 =?utf-8?B?T1FWNXRHdGFUOGtPdnkvS1FPdnVtZW1xT0VKVXdOK2k0OFcwdzB4WmZicjAv?=
 =?utf-8?B?NXJ2dklhYXpGUmVTYmVpN3FIWlQ3dmRqNklhTXZRcWZodmV0RWlYZ2FqekVw?=
 =?utf-8?B?cWY5RkV4cFJmb2Z4QVZ5SFdwYWh4MFhyNW5Bb0srUnV0QnVlQnRObWhWVndN?=
 =?utf-8?B?QWxhWEI4eS9FWHZiQ1gxVkFxOENLblJid0ptaUNwTDlRcFhsTFJxd0RLY01G?=
 =?utf-8?B?N1JoRDBZZWgwb2RqdlR4WVZCblVUQlNIQzc3Z3pnWHJYdEVOZ1REbmdiMGlF?=
 =?utf-8?B?aWRkWVZtQlR6VWlwc0lUVFZsei85ZEk0ZUtuWFNuM0FzcjYwK3JUbzRTOFhU?=
 =?utf-8?B?ZSsyRG5ITGtCZURrMXF0VDNVSHhwaXBtVjhJaVhvYkZTTi9VOU1YQXFVMm9j?=
 =?utf-8?B?dFFYTEhDOVpWckFTOXl2YzErM3pLTElpdlliWEhOV0ZtOUVONTNuUi9aN2hV?=
 =?utf-8?B?RE84TFZib0JCQVZWVkZlN050ZVpBYmxOeUZSVFg4NG5BYjF5RWRMWWkxZE81?=
 =?utf-8?B?YUtFUEl1M1I1UU9BWFZnQ1dCNjk1amtMcnUyT3dIMExTVTZ3eDFqUGdQRkxO?=
 =?utf-8?B?LzloR2dJcUdxamE1NTB3WXkwOVpYNDRpYUkycnNNdlVmc0FhTll6cW0wVzRp?=
 =?utf-8?B?N21QTHFXWE0vdVovcStBdkNkRllOWDJSN0gvbGM5UmM4TWVIYVQ3T3M1OG1l?=
 =?utf-8?B?d1FlT1ZDbThVK0VYa1cxUnVsU1ZHOUlJa1lXVXZaRFZkS2hGeXVYV2N1OU5o?=
 =?utf-8?B?Qm1PK3lxT1FrRnI3RDVuMXlqUFJYZE5CUGQ1Qll5cW1EQ04zTE4xNDRlaExm?=
 =?utf-8?B?b2NaSC9DNmhUY1dRTXN6a0hJdEhQOVU1UTFNM2x6Tnp3dUdWTkJ4QlNaRjZX?=
 =?utf-8?B?SWRXVkxqTzBaSXdIV3duQnhkTjJGZ25Od01Ba2NvTnJsOHhuZEdSVkpWUnk4?=
 =?utf-8?B?Rzk4dU0xUTNrM3YwZ3VQRXlGKzhYSHJUY2k0dTNGNFRPdFVRazRZV1hYUUR6?=
 =?utf-8?B?L3QrRlZoVHNIbEU2cWduRnFKbksrZUFlNVpsQWJMV01iQ1o0eXB6RkNpK0RG?=
 =?utf-8?B?Zk1hb2ljdjZpMDBYZWlEOFZzbHZJQUVHYVVad3FOcFBHa1dGVnFGbDVHNHBC?=
 =?utf-8?B?V1VRSWdGTWdUYUluRXYwTzByb2Foa0xSVnc1NFZPNkg0R1Z6dDlGS1RUUEdR?=
 =?utf-8?B?ZkNtMHRlU1FWWlVtWnpKcXZYdkIwTHF6ekYwMWt2aFdpMFBtVE9VS05OT1Fi?=
 =?utf-8?B?YWJTd1NabWk4WlREaFJjbzcrTkltdVh3NVFmQ0FpbVJ3Ty9PN3dyd3gzNUVo?=
 =?utf-8?B?ZlJyRTFrUCt2Vm1kakprNGhMZlZLT3R3dHBXakRvNGtzSHpIV0NWYmY2dkNO?=
 =?utf-8?Q?1mihEXi7uf93H7ssxQ636wcTDST4CC9nuMLI7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5bb882c-55cf-47e5-45d2-08ded7671249
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 11:51:22.3723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZINn8tRziHCcGPQq8g1+mV3QQ1dUEdKSEk+aHCQTeW7Dh535pOXPXHqaeAGe56KERzz0i4OTH7PLhGM+sHPRb9yu69p+HoUmZd39OV9ankwWl4Dh0SzXUKLgly6pS9y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_125127_854160_AB88D7EE 
X-CRM114-Status: UNSURE (   9.05  )
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

This patch describes the GPIO and EIRQ resources in the SIUL2 pinctrl
node for the S32G2 and S32G3 SoCs.

The rest of the changes from the series - the device tree bindings and
the pinctrl driver changes adding GPIO support - have been applied to
the pin control tree. This patch contains the remaining device tree changes.

Khristine Andreea Barbulescu (1):
  arm64: dts: s32g: describe GPIO and EIRQ resources in SIUL2 pinctrl
    node

 arch/arm64/boot/dts/freescale/s32g2.dtsi | 21 ++++++++++++++++++++-
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 21 ++++++++++++++++++++-
 2 files changed, 40 insertions(+), 2 deletions(-)

-- 
2.34.1


