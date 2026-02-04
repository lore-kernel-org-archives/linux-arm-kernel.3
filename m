Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C828E95380
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 11:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8JdjH56NTsmN3y5f/GT9p9IG7KeztPC1lY48JfYA0n0=; b=UYsRACAHFvgCipBuv8yCn064wn
	PZazUkxyAuGzZ6HFaM1URLYBMevirO3Ssl4wefYWGvSavI4tMkZqCiC1yY/zwYVtY2DpReANIOQpr
	VR3BLOXDxgTGvrr0pcOTDSKANSaJ2/OTAY5hr4Kn+OOk46FL2DIx4FBiHzPQ6mY8h5wH33v4ZiieB
	CmXAaWv2Ibl3b6204Hc1KvyBeJRs9EXpoAr5GCeHmtRoLKzfGrYbExHe0rK6LujZKjqvW0VvbPyh5
	F31VPngTWahtMux+JZRxQS9WdHaOtxYPB8phVnJwalG2b9wWYmZtOE6cyX/arVtUlZ7ilkXROCKaP
	oxInWzDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnajg-00000008Kn9-2i3G;
	Wed, 04 Feb 2026 11:07:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnajf-00000008Kn0-24Ln
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Feb 2026 11:07:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8JdjH56NTsmN3y5f/GT9p9IG7KeztPC1lY48JfYA0n0=; b=EqTxVkEz3A0GzoMq8BiIRh9QGE
	goW4+mzTCo7avPYqCh6Rt+46YmJ9uMewgiK3v00121aoVnEdvWQBTJw9v9cgYRVmJQ6thgrcoj/dt
	A9Q7GAhHxTThFuQocwMlCneD643Vz1i+cNi5UB0JuMc5LhO67QCy6pSplo2fyJK5RCm0UylEwJbyC
	96FgnLbBKnUiGnNn/5EddTvsU0/zrNoXrEUui/gTyk5AKYEGWghpG4bgYJbSXDJ1zNyN1YHjsPIRD
	8Bhl13heLcyILnYzXQEzj3djkzm+dlC7TdbB77suJnYytjTB3T8O2lgUn7YYdNLTzOTSHuoGjhZso
	QpiPlxkQ==;
Received: from mail-westeuropeazon11011002.outbound.protection.outlook.com ([52.101.70.2] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnajc-00000000Mpf-0e0o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 11:07:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgdHFGMl+2TJ/24c1Hg8RE4KWyiYTpjFIgwL0A9+xJ+rYG3N1CMm/Az2OALZZK57ZMvGYa4ckthcwt3hshaK7HbQYiQ0jGO2fv0qtqdAqPzGEtOdL+HVkl/1GGkfM/5KyeVWlYr+Mbd0gi4TrrK0Ox9Oxq+z7bQJ5K3II0RvIZ4VS802DDtaqHBKvUjPhO/GUM3CTWVPy643m2GXe1hWzgE+zMB7r9/yjKI9U4XXgW3LmxzycwO9zA7FxqdKhp98G75xlkcdDsckrRwGCfeWsQcIXiIpB7RV+1ZbdFNZfi80eRRX/60AjOrfLY/1zpZGNElgX3UZQIs9f+MDDSRyZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JdjH56NTsmN3y5f/GT9p9IG7KeztPC1lY48JfYA0n0=;
 b=PAyzSJThKQUJbGyxf6QWXBVSRPzNnqidfis97QDWOlYRjETViKMPz2Wr1O15KZcxwfdiwzaPxahS8VwjZyB8HggQDDSRsLfaAxqZsEFNbHck8LHfMSym06w/f6zOMUTRNZmOxZ2ELg/RFyWzanCpUB08AxBJZHrPpi1UF9Dr2EZx+pvmpOsQ0NFtC1wWcscoa003ixlgrr2Siwy4RSBFkFNLNbu7LJcfEKghMTzAdz54gfvxal15FOIOeHP6of9uh/7jJRrB6EnLOH14Z1lN2NRcbOf8AgoxDa/bx9PsClEImho0nnHbhvIDghZmE8bANZFBLWk6vS0trWwZrQ2rwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JdjH56NTsmN3y5f/GT9p9IG7KeztPC1lY48JfYA0n0=;
 b=lSCw1K5MAIR7t83E9XuIOZuBmEAdliV97DFBGpSKoKzlDZS3bcOZyMhq8L9XN6BI2VRdL2b6TtXYbkoTXDr91yTN6taD1666y1KFDD221eucYW9WXg7PZ/FQHVsdHVx5lkcQo4BesSV39RBD6sqa4+g95qZhP8/TsHD1Bvq952zPpdVejaSOZGkTQBFM0zg/RIt0eEHuQpspMNNsaLOmX4lIQjZHYq4QNq0LmCYwiruNEUULtiQry6sR3GDENzqOii3s7X7CTYMNavvvErzNQI1qbCLZ/pjlwJ98OjfQv+ucZJp9zfLcpupJvzcFPOYxyZYWF57V2CeY83+xLFSsZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by GVXPR04MB10110.eurprd04.prod.outlook.com
 (2603:10a6:150:1b2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 11:07:43 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 11:07:43 +0000
Message-ID: <71b57f1c-be22-46a2-89a2-5abae11e0436@nxp.com>
Date: Wed, 4 Feb 2026 12:07:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [RFC v1 01/11] media: uapi: v4l2-isp: Add v4l2 ISP extensible
 statistics definitions
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com,
 daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com,
 laurent.pinchart@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
 <20260123080938.3367348-2-antoine.bouyer@nxp.com> <aYIb8ZIZDfCJZEZ9@zed>
Content-Language: en-US
From: Antoine Bouyer <antoine.bouyer@nxp.com>
In-Reply-To: <aYIb8ZIZDfCJZEZ9@zed>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0156.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::23) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|GVXPR04MB10110:EE_
X-MS-Office365-Filtering-Correlation-Id: d8725d01-5668-48f9-1a8e-08de63dd9e61
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWVKd0c3WHJoWnNTaENoSlY5M3JpTDAyWk51bGVqa1AvbVdDWGp4MjZPTHBy?=
 =?utf-8?B?UitHWGlZK2FDRnIyTVVncDFHQWpyZllEelM4VG0zWGFrbnVnQWVWa0FkKzRG?=
 =?utf-8?B?YmRvMW9ZVmRoOW5vb3I4Mms4dDU3ZjdVWnRJUTFOUnJBQ3VWdHdMWklPcE1U?=
 =?utf-8?B?bzdPc1BEQW9pM0ZVMXhQOVJwbkxhc0xuQktvanc4SzZGelorMU9uYzVGMlVQ?=
 =?utf-8?B?WHFlYWZwRFhxVWExZmJ0MDFrOThURnBodkFTLzNaeDFqRkZNb1dRU1QwK0pX?=
 =?utf-8?B?Ui9CcktYWnJyaC9BUjdNS2FnTUVwSjU0OGUvaVovczhPN1VzanJWQmxDWTF3?=
 =?utf-8?B?MHZ4NCtWME5NMldNRjFXU2UwL3orSnVIRUc4bU1hY0piMVZsYXlHNmhxOFJT?=
 =?utf-8?B?eHRLbnh4R0hsUmd1c1RYSDd4WGYvTFNRRSsrdUFCUFJDbG4xWkt4eUY5S1Zn?=
 =?utf-8?B?ajZjWE9CdC9Jblg5eHc5RlFDcWdudDY5aThjdi9LZnE5bzVkaEpENjdZZzRm?=
 =?utf-8?B?MDJIbjRhU0J3eHF6aXNWT0RndCtlT1IxRUZSVWZ0d1EraDg1SDJ3dUw2TjEz?=
 =?utf-8?B?K0NHM2t2aUd2OXNHbW9kSk8wYzNaSUsvVXFTbHRncmhua21nZWM2WDdaMUx2?=
 =?utf-8?B?blZRajI5TkJmSDMvaTNodFI0WTcvSFYyVUNqMTJ4Z2NxNFFoS2t3TUlsOHFp?=
 =?utf-8?B?QWxZN1NvTFpsS0tVQThMRklMQ1RtT1BZLzdIZUxNQ1U3MlRra0dnZE9EaXMz?=
 =?utf-8?B?QkkrcHJwL28vdFVBemRENUxXWmZteEVicmxWL3lNNWVJZkNXVUZsUmgwT204?=
 =?utf-8?B?SFNzNU5CMFgzU1N1RFpkRHN2c2FBTnlVNWk3aHVrSTd1OXNkVjVKYmJTcklq?=
 =?utf-8?B?MHhDdFMrT0NNeTVvTHVBLzhBdmViMjFaQkJ6L21hRVFNU2hEdHliYldaanhR?=
 =?utf-8?B?czdQYkVvNmEwSURrczBvVEo3MUpDZkN6REwxTnl4Q1A1WUEvRDc3c24zRzBs?=
 =?utf-8?B?cHZmc3ZGbFUwRWF1MzhxSFlSU1E2WGZ4cUZwZ1RvV2lobUs3SXZ1TEpKUVJI?=
 =?utf-8?B?eHNzT20rdmFBZHlzK2pEYnpzbHF1eDRnbU5OcDNEazA5RkpteERNVGlGcVA0?=
 =?utf-8?B?bmdETjBBNWFGWjZ0dVZHNXZaS2pPRW11VE9CRXBXYWdSbXhKKzQ4QUFrRXhT?=
 =?utf-8?B?encyTUxYcHVadEpBVmprME9PZlZsZ1Q3VHRRa2czQzJwMWx1RVVUb05TOFhV?=
 =?utf-8?B?RFpuVjhGL0lUVUIwK2pDbnFraFYzbThoNGJ4cE9NSkZsNkk1OTBjSWE1LzlY?=
 =?utf-8?B?ellnWDF1aytTSjh2ZGIwRHlxMzlybVJrUmdYNHdxOU14SG13R21kbElXV3Vv?=
 =?utf-8?B?RHRJM3NBUHBWU3dvSmNPcE5jQk1QSWtlYWFVS3RDWnNaZ09JWGc3Mi9oakpB?=
 =?utf-8?B?OVg1clNhZEpDdTFGeEtOUWVZTGFjZGlENFVJdGxXaFZJRk82V1VIZ2VEMkdu?=
 =?utf-8?B?bDcvbzluZCs1VitqZllVdUQrQk1qWFhldCttQ1JueHRoRDc0MTM4aWZkVnhr?=
 =?utf-8?B?MHlIVkNwVHdEcGFVVE1Ma21hODAwbmhYMVlNaGtWSHNjSVdtdnNmOHh0UHJw?=
 =?utf-8?B?d1A1ajBTN0NWczVobFpPL0w1QVpSbFlzREpPdzE3QTF2UHpUeFhhUTlwN0VV?=
 =?utf-8?B?ZWNJL0piMFp1VEdmcE5LMHlZek5ZYUxxT3VUVy8wTWZ1Z3BvZzlRaFAvZW5x?=
 =?utf-8?B?OWpWMjBSclJzYlBzOVB0eURzMnBoNTA4bW1kTldZQXZFUDltZHBiWC9ubkV3?=
 =?utf-8?B?bC83VlVZTjBHa29rQllnWDd3VXYxc0ZmTWdvcDRhZ0hNRjcxQzZSMzF2SC8r?=
 =?utf-8?B?M3Z4Z1FiV2lrZjU0VjJFWVJ3c0F1dWxOeVBSaEdOcHAvc01WajZXWkdoOUVw?=
 =?utf-8?B?RXRrR3p6YjJ4cjZKNWxGN3gzTmI0U0pkajlaTEVydkNZQ09SZ1hmV2x3MXNH?=
 =?utf-8?B?QmV0RDloQW5tWXVhZjdVZVlRemYxeFE1YlFzOExGVlJ1WnhXQ0M5MlpyV3BQ?=
 =?utf-8?B?TndtQ2ZsZElnQW5TQUpXMUkySW9qSFV4c2kzdEYwNGZCd3hibUJLbmxKc0xY?=
 =?utf-8?Q?Bz2Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0xUMGNPOHlEUzlKYVREWUc4YTNUbzdCaHJMdStHSWphNGlYcW1DOFVYaHpp?=
 =?utf-8?B?ckJHYTNGR2FSRmx6azFUampNYmU3YXp0d3luakVrR0FmcHVEbVhMdFZVMEVr?=
 =?utf-8?B?OFo5cHdWRXpHZGdIOXp4OEtrWG5nekhtaGE3VHNpSjBVdURtZW5yVHYxbzZl?=
 =?utf-8?B?M2RDWndEMHZjaWVGdUhxN3ppUHVaZytDZTRZbjRseUVIN2lUWVRnMGwrUnRo?=
 =?utf-8?B?UTFXeDd5TU9wTlMxZmZlQWRIcG1EZzJSLzJyM2syZG5BTm1DQmIySVNpMHFi?=
 =?utf-8?B?ajhab2M2S051UU9pRGdiOEZ0UlI5WllwVDZwZXB3a3pEbCt4SDdsRGxyZ29O?=
 =?utf-8?B?bWhVSk54akovVXVudlAxb05rNEhKYlMyTENNbElTZlFjRTJzUTdHM0x1VjFX?=
 =?utf-8?B?R2YvM2J1dHVOUlZZZ3o2SG1ERkVDSHJRVjdJeGJOSmpTb1BXS094cERVZURq?=
 =?utf-8?B?NDlCR2dGQkhIN2ZhZHpQc1FsVlgva2JwVTVPaE4vNFBnZkdKUUpDUGVyT2dw?=
 =?utf-8?B?Wlhjd2hISitIU29NOHhRa2sxOWliOHF1Z00rRWRvMEJyZnArcDdVeGxyVzdX?=
 =?utf-8?B?ZkRLWC80YTVrRmpqcFB6cFFaMXVHVy9RTWU5MVJEdkpEdVhNR2lvbTlQRFRx?=
 =?utf-8?B?a3ZsRk5vMmpabVhpRitPTjRZeUlRU3BlTjI4eTQ5RlhFSGM2RnJkV2U1a0ZN?=
 =?utf-8?B?YjRBaExBWElMUyswN3hzcTY4QXlRcGU1RXdQbVVMNzJ2YVI2Rkd2NTRKZFdT?=
 =?utf-8?B?WExiQkcvKzRZQnU4b2FGSlIwYTQ4Vi9IS0tkbFFpS0FIcDYxS0xWMUQ4K1Rr?=
 =?utf-8?B?M05pUmhvdWVvd3dmdEljZVJ4eS9rTUdhbHpSK3dzNThYZE9OWWdEaW9kTWdi?=
 =?utf-8?B?SDE1RFc5NysrTTV2R1hpbFlPWjhPbll1Nm1PcXRraERSejI5N0JCWTBWOHpS?=
 =?utf-8?B?VE5ranR5RndRREVXamlQVnM4UzVpc0NyWjBuM3pjdXQrYmNOU0pGWlptYjNq?=
 =?utf-8?B?ajcrc1BQRlpYNXpMQUtmcnE0eDV3OEtOOTJsL21ENnMveWpaVjZMQlRsQXBH?=
 =?utf-8?B?Um1yWHpadVZLaU5vMnhJeW9JMnh2Y05CT0M0ak9iK1lZb2xPQmY0Mjc5QUhs?=
 =?utf-8?B?MGVrTm5kdkFXRm1ETkxwMyt0dVBGdzE4RkduZVB5RUhlMERvamRCQjRLcTdw?=
 =?utf-8?B?d1RPVldBT0ZZNmttQXBVaDdsN2lrWk43RWVrYm42VWFFZ2l2OVFoeEg3K01p?=
 =?utf-8?B?S2N3Y1ZSRHY4d01BZ3hpUXpUWTVRMXV2NEhPdFF2QzJzM0cycHVYQVpPQ3Vk?=
 =?utf-8?B?NEZndGl0TlZ6N0FpMkVTd2xGY3N0TmJvZUMrYkFibjR1Vyt4V1dkajJuSi9i?=
 =?utf-8?B?bDkyWEoyZUFCV2ovaUs5dlJ1UXRkdzZ0cEkyOGtHWUlnVDd6VHduT2MwNjJt?=
 =?utf-8?B?K2U3dzlZUy9QenlBRmpCRnpjb1l5SGJWRDJwRGRFdkVFeWl1Q3BTc29mZkR4?=
 =?utf-8?B?VTYyNE5CRHZzdi84MC84ZkJtaFhxbFNNQ1VqcnNCYnQ5MCtSYlNXVS9nQlhh?=
 =?utf-8?B?c0d2dnhZYlZEYndGSE9iZ2NXSmN4UXdYM1o3Q3FpUHF6SmF6ZWRaZVhhc29I?=
 =?utf-8?B?dmlXbEtEaTY0bmhXOFZMVGkvakEyM21QMFFURUN5SEVGZWRpQnBUajZJY2lP?=
 =?utf-8?B?ZzB2dzZYOENwaHFlbEJwYUZtME5hTDJzZVZvZVZlVGJOR0lNSTJ0MUVGRjRR?=
 =?utf-8?B?QVRxbG14V3R1LzFpalhMYndIeG9GaUI2UjJ4U21uQjNoN25yWVZoSkxoUFdq?=
 =?utf-8?B?b3FRbjFBWFFrODBmT1VZQ2NIeWh4emJqaG1GNmtza2M0K3k4ZXViUmVOdmhJ?=
 =?utf-8?B?VmZQZmhRWG5mZHJsMmJ3ZjFIVkthcDZ3K084L2lDQXhGSjNGZ2NaQk9KYjhB?=
 =?utf-8?B?enNkMFJySWdVSzVLQVBpMGVJNHNXajlYdStLTVpxTlFoditvcWFLSjlKYjRy?=
 =?utf-8?B?MWJBRFk4dm95bGdIeWVjNGUyYUxPTi8wblN0OVB2S3hGVjE0Ui9Hb1FqSEph?=
 =?utf-8?B?ZmtIWkVlT0cyZ3Q0bWR2eWk3ajFKRjhUYUp4WnZBU2s2U05SOVZSdnN5ZHNk?=
 =?utf-8?B?THNIcVJreCtmRjFtUktGdHo0UlcwTW5MTENKejREN0hsUVNxdEdHdjd1akZU?=
 =?utf-8?B?b3lsZGF6a2FuZ0Q2NzhDWHhlN0tQSFJzY2VmSG1RWWZlNDFkb0d1M3EzVUVq?=
 =?utf-8?B?Z1AyTUl1Z2U4dGkrcFdoMjFuYUsvU1JyV2x4ejZwaG1tUjRSbmplVVU0N3pF?=
 =?utf-8?B?MENHVGIvQWNBL3grdW5TK0pKRkxBQkRnTy9seHBlTExsclhHOGpEdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8725d01-5668-48f9-1a8e-08de63dd9e61
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 11:07:43.0813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DvgbVuNr87evGfjr3cCjvEh3zK0FkrC4UrLuL/y4hkVbmiXTnb+UiqP0SIrCGHVCYRozz79MmEXUsYvnCD5MHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_110748_466303_239740D2 
X-CRM114-Status: GOOD (  34.20  )
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

Hi Jacopo

On 2/3/26 5:15 PM, Jacopo Mondi wrote:
> 
> 
> Hi Antoine
>    thanks a lot for extendable stats
> 
> On Fri, Jan 23, 2026 at 09:09:28AM +0100, Antoine Bouyer wrote:
>> Extend the v4l2-isp extensible format introduced for isp parameters buffer
>> to the statistics buffer as well.
>>
>> Like for ISP configuration purpose, that will help supporting various ISP
>> hardware versions reporting different statistics data with less impact on
>> userspace.
>>
>> The `v4l2_isp_stats_buffer` reuses the `v4l2_isp_params_buffer` container
>> definitions, with similar header, versions and flags. V0 and V1 versions
> 
> Why do you need two flags ?
> 
> Params had to introduce two because we had two drivers already
> mainlined using the pre-v4l2-isp version of extensible params which
> had defined their version identifier as 1 and 0 and we didn't want to
> break existing userspace using those identifiers. So we had to accept
> both V0 and V1 as "first version of the v4l2-isp extensible parameters
> format".
> 
> For stats we don't have users, so I guess we can start with V1 == 0 ?

I wanted to keep it aligned with params, so that any driver/userspace 
can use the same API version value for both params and stats buffers, 
and limit headache.

> 
>> are provided to match with params versions. On the other side, ENABLE and
>> DISABLE flags are not really meaningfull for statistics purpose. So VALID
>> and INVALID flags are introduced. Purpose is to force ISP driver to
>> validate a statistics buffer, before it is consumed by userspace.
> 
> Interesting. What do you mean with "validate a statistics buffer" ?
> And if a driver has to do validation, why would it send upstream a
> non-validated buffer ?

Like for version, I wanted to keep same header structure, including 
flags. Since ENABLE/DISABLE is not relevant for statistics, I thought 
about using a "validation" flag, to force driver confirming statistics 
blocks are valid or not.

If you feel it is useless, I'm fine with removing it. Should I keep a 
flag field anyway to stay aligned with params then ?

> 
>>
>> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
>> ---
>>   include/uapi/linux/media/v4l2-isp.h | 85 +++++++++++++++++++++++++++++
>>   1 file changed, 85 insertions(+)
>>
>> diff --git a/include/uapi/linux/media/v4l2-isp.h b/include/uapi/linux/media/v4l2-isp.h
>> index 779168f9058e..ed1279b86694 100644
>> --- a/include/uapi/linux/media/v4l2-isp.h
>> +++ b/include/uapi/linux/media/v4l2-isp.h
>> @@ -99,4 +99,89 @@ struct v4l2_isp_params_buffer {
>>        __u8 data[] __counted_by(data_size);
>>   };
>>
>> +/**
>> + * enum v4l2_isp_stats_version - V4L2 ISP statistics versioning
>> + *
>> + * @V4L2_ISP_STATS_VERSION_V0: First version of the V4L2 ISP statistics format
>> + *                          (for compatibility)
>> + * @V4L2_ISP_STATS_VERSION_V1: First version of the V4L2 ISP statistics format
>> + *
>> + * V0 and V1 are identical, and comply with V4l2 ISP parameters versions. So
>> + * both V0 and V1 refers to the first version of the V4L2 ISP statistics
>> + * format.
>> + *
>> + * Future revisions of the V4L2 ISP statistics format should start from the
>> + * value of 2.
>> + */
>> +enum v4l2_isp_stats_version {
>> +     V4L2_ISP_STATS_VERSION_V0 = 0,
>> +     V4L2_ISP_STATS_VERSION_V1,
> 
> As suggested I would make V1 == 0
> 
>> +};
>> +
>> +#define V4L2_ISP_PARAMS_FL_BLOCK_VALID               (1U << 0)
>> +#define V4L2_ISP_PARAMS_FL_BLOCK_INVALID     (1U << 1)
>> +
>> +/*
>> + * Reserve the first 8 bits for V4L2_ISP_STATS_FL_* flag.
>> + *
>> + * Driver-specific flags should be defined as:
>> + * #define DRIVER_SPECIFIC_FLAG0     ((1U << V4L2_ISP_STATS_FL_DRIVER_FLAGS(0))
>> + * #define DRIVER_SPECIFIC_FLAG1     ((1U << V4L2_ISP_STATS_FL_DRIVER_FLAGS(1))
>> + */
>> +#define V4L2_ISP_STATS_FL_DRIVER_FLAGS(n)       ((n) + 8)
> 
> Currently we have no users of V4L2_ISP_PARAMS_FL_DRIVER_FLAGS so we
> could even consider making it a V4L2_ISP_FL_DRIVER_FLAGS
> 
> Or do you think it is worth creating a new symbol ?

To limit impact on potential on-going development, and future conflict, 
creating new symbol may be safer IMO. But I'm fine with using a single 
symbol if you prefer. Most probably this flag customization is not used 
yet by any driver.

> 
>> +
>> +/**
>> + * struct v4l2_isp_stats_block_header - V4L2 extensible statistics block header
>> + * @type: The statistics block type (driver-specific)
>> + * @flags: A bitmask of block flags (driver-specific)
>> + * @size: Size (in bytes) of the statistics block, including this header
>> + *
>> + * This structure represents the common part of all the ISP statistics blocks.
>> + * Each statistics block shall embed an instance of this structure type as its
>> + * first member, followed by the block-specific statistics data.
>> + *
>> + * The @type field is an ISP driver-specific value that identifies the block
>> + * type. The @size field specifies the size of the parameters block.
>> + *
>> + * The @flags field is a bitmask of per-block flags V4L2_STATS_ISP_FL_* and
>> + * driver-specific flags specified by the driver header.
>> + */
>> +struct v4l2_isp_stats_block_header {
>> +     __u16 type;
>> +     __u16 flags;
>> +     __u32 size;
>> +} __attribute__((aligned(8)));
>> +
> 
> This is currently identical to v4l2_isp_params_block_header.
> 
> Can we create a single header for both stats and params and provide a
> 
> #define v4l2_isp_params_block_header v4l2_isp_block_header
> 
> for maintaining compatibility with existing users ?
> 
> Or do you expect stats and params to eventually need different headers ?
> 

Current approach is to use same structure definitions as for params. So 
I'm fine with creating a single header as suggested, and provide symbols 
to keep compatibility.

>> +/**
>> + * struct v4l2_isp_stats_buffer - V4L2 extensible statistics data
>> + * @version: The statistics buffer version (driver-specific)
>> + * @data_size: The statistics data effective size, excluding this header
>> + * @data: The statistics data
>> + *
>> + * This structure contains the statistics information of the ISP hardware,
>> + * serialized for userspace into a data buffer. Each statistics block is
>> + * represented by a block-specific structure which contains a
>> + * :c:type:`v4l2_isp_stats_block_header` entry as first member. Driver
>> + * populates the @data buffer with statistics information of the ISP blocks it
>> + * intends to share to userspace. As a consequence, the data buffer effective
>> + * size changes according to the number of ISP blocks that driver intends to
>> + * provide and is set by the driver in the @data_size field.
>> + *
>> + * The statistics buffer is versioned by the @version field to allow modifying
>> + * and extending its definition. Driver shall populate the @version field to
>> + * inform the userpsace about the version it intends to use. The userspace will
>> + * parse and handle the @data buffer according to the data layout specific to
>> + * the indicated version.
>> + *
>> + * For each ISP block that driver wants to report, a block-specific structure
>> + * is appended to the @data buffer, one after the other without gaps in
>> + * between. Driver shall populate the @data_size field with the effective
>> + * size, in bytes, of the @data buffer.
>> + */
>> +struct v4l2_isp_stats_buffer {
>> +     __u32 version;
>> +     __u32 data_size;
>> +     __u8 data[] __counted_by(data_size);
>> +};
>> +
> 
> Same question. Should we introduce a struct v4l2_isp_buffer ?

Yes, sounds reasonable.

BR
Antoine

> 
> Thanks!
> 
>>   #endif /* _UAPI_V4L2_ISP_H_ */
>> --
>> 2.52.0
>>
>>


