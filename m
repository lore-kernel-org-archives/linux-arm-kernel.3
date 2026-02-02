Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E27D172CC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 06:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3SlKBMIG89Try07ilabad3tX2iJkKZqBA5/u+/Qi0Y=; b=Iue303aOhkkkglGS+6/2gHhsyy
	Iok3HxbIJaplRqu3zM6TnpOCHc4sbvUSDQGgPYCObVzrR5yQy19jGsEIIqkPfQVdlB68k3SbLbso7
	3TBN1LPHaH93LVUnbxlrjCrSTcW/5mXx7tzazHKKNJWnSyAt4q4d6EAN98HxcGd8Xd/PIyPa3q+XF
	xgcP3+1WJ2nS2G62nU4zYvyX+ARemKR8hsUvubQkHR/trhQdf1YtVbt+my6Ghkaov0K5L6nwKwPty
	OZELDipbeRBT0E9rU7/ABAMyPsGVQXgGa6cYUEWPlWtPp9Fnk5DGNw/bpRSC8nBeH68u7Ic5v3Szr
	4T/oOd3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmnQ1-00000004VYa-1Nvf;
	Mon, 02 Feb 2026 06:28:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmnPx-00000004VXx-3xSh;
	Mon, 02 Feb 2026 06:28:15 +0000
X-UUID: 57eabd26000011f1a16f0188aa809bee-20260201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=z3SlKBMIG89Try07ilabad3tX2iJkKZqBA5/u+/Qi0Y=;
	b=QG2gV7n5bFYKZRpXjuZBbc9xYwmjNJ+h+V4ABWREKGUcsdyq8BtqijaKMcSg4s5nQHcd0w34eWuMy6Jn99JyvHILRi37rPLb4WYWOEIWR1mU3rjm5/noJ/zl7HKrNjf+CIbGAvFmGjCifKqtJt8xruH2BM6bafqAMrwbpfZjf7g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:0316622d-2ae7-4fac-ad5a-ff06ff650bbe,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:a442d25a-a957-4259-bcca-d3af718d7034,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:99|80|1,File:130,RT:0,Bulk:nil,QS:
	nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
	:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 57eabd26000011f1a16f0188aa809bee-20260201
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1930581803; Sun, 01 Feb 2026 23:28:10 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 2 Feb 2026 14:28:07 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 2 Feb 2026 14:28:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GVv81cadB0aCx4jMsuoHXjEsyJKvfkaI/4004Lnxykw4pGlyEcawoWECkWImukksQIseGei/JAAk7uSJ9xmHssSesHeXBfjJlCxnmXS02RwZ1Tvy6NICt5288PMkLo1yz91M0QQVv8/oSJm4b93cin7ik33z7e0DSzF77KVMUzOLG7d8tolZbDRg0Iw32/Jf1VeqRGmWERhS4RbJJ7P83YFxKOZ9sYB8DnWBzhkOvsFJDMJtYrT2m3tLz43i0WTP9eq4IGG/i0hmHM88ZgI7283K8DlMrqwx+dqwnfC+nhVU9j45gT1Z5+HXHqR5f+gGKx4sIeq2RoUjxCahApKzIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3SlKBMIG89Try07ilabad3tX2iJkKZqBA5/u+/Qi0Y=;
 b=V3Z1qYrebqnhUXKXBfIJRRMnQc15E8o4NwOi2JfWqohN1qL4Rcj4B633KJAGkmGNBsUwNvPApPV2Z6h79sW0qkt3orJMvxKWJkwqGOf0PDo4tbPhHNR6xHpgc5GlHHnbuWKx4Hv9T781qPGMNPEyKTxNvyWV3II0gFrn38N+sNMGisw2Y7LzYPq5QqE/YfFb0V4CZBIVCifJPfTdcNaRVyRwLcK/J6bMBBRmKIht94mBAFcSkTKcZkSQsAWLUpagxPb0N4hc1eDwx9WaCmMgIQOeEoopk0aH3jSpsAVxKqwb5MgxqLRLQ+Ot1aUFyt+KfsM5LQdKbhVexNqy+6B0Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3SlKBMIG89Try07ilabad3tX2iJkKZqBA5/u+/Qi0Y=;
 b=Bxmx0Ajhwzo0oz7uWeRL9rY5OKmqnVbBHtGhzWEAhjlEXI+54cdrri0QMFvo5n7/77JkUKJsNX4trXFRo68Jn+RJffD0aUOwYeBB04ikfr//xN7J2pNoE8qZ7XCAeRRDmJvKG4s+ovppIvOrPFewBjrPCbNTNyVzTOysaAu9lno=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB8781.apcprd03.prod.outlook.com (2603:1096:405:6b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 06:28:03 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 06:28:03 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "simona@ffwll.ch"
	<simona@ffwll.ch>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "greenjustin@chromium.org" <greenjustin@chromium.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, Nicolas Prado <nfraprado@collabora.com>
CC: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Daniel Stone <daniels@collabora.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [PATCH RFC 2/6] drm/mediatek: plane: Correct AFBC alignment
 definition to 128
Thread-Topic: [PATCH RFC 2/6] drm/mediatek: plane: Correct AFBC alignment
 definition to 128
Thread-Index: AQHceZUoaj6YPXSdI0mhk2aBEp1JL7VvJwCA
Date: Mon, 2 Feb 2026 06:28:03 +0000
Message-ID: <454a9215a5202c681bca1f38650bb9a8b8ce7393.camel@mediatek.com>
References: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
	 <20251230-mtk-afbc-fixes-v1-2-6c0247b66e32@collabora.com>
In-Reply-To: <20251230-mtk-afbc-fixes-v1-2-6c0247b66e32@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB8781:EE_
x-ms-office365-filtering-correlation-id: 13313243-18a6-410f-3915-08de62243847
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|42112799006|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?U0NDRkZtUFZ4VTN1Z0Z4L0xTUm54YXN5NGMzc0hDZzFQRGo1TnN1NFloOHNM?=
 =?utf-8?B?Mno4OEp4ZEJ5VDZUWHhsQ0JnaHBrWktsWVpJZUI3cTVMdm81SEJ5blZaeWc1?=
 =?utf-8?B?emRmNS8vaGpzWXZYelU4b1c1bFlLWnN1MUU2WHVUd01ReExPUGZDVEkzd2Z5?=
 =?utf-8?B?QktTckVnWFY0UC9JMjJEekVlTkZjNzFFZjRVLzZtcTB1T1ZYU3N0VCs1cWxM?=
 =?utf-8?B?NmZqWVZKUDUzeVVGUDhUbm5aNEpIczhlekh4cGJPU2lvNVlGQURTZEFZVDM4?=
 =?utf-8?B?VlhzdTlYSFdBYWx2QWpqd3YvVHA4SDUrbkRxeUpnQzcrSGVja0hlRjUwZWdi?=
 =?utf-8?B?WHdHMmJ2dmNaVmllMWRna3RaTTRJUVdSVWNTbWdGL25LOWR5V29SY1VURnpt?=
 =?utf-8?B?dDFhMEhOTXZ2Zy9hTnhETEg2b0tjemJodHM1R3ZVNkRxNXJUc3cwUkcxbnJY?=
 =?utf-8?B?bXIxS0JtWWZPQUVGMmNYeHV2djdQblBOSDJvTTA4dWFOdnBkQnd0emFxNjBs?=
 =?utf-8?B?T0o5aXFUUHBqVlBra3dlL3gyUjFrbWZzZFRYdUluK2pHNGJYTzdzSy9OTW5q?=
 =?utf-8?B?aW9pZHdLa2tiWHh4S3NtdWRVaEFJQ2JLWHJteVZkbDNqNThkNEFtQ2g3bGNQ?=
 =?utf-8?B?OTRib2tPdGpiNXY4Y1BSUitEOEFpMXpLUUxnYk51NlhzZ0MrUzFvNmNQU0Ny?=
 =?utf-8?B?TTNBWDNkZUdpR1pVVktZREVtY1NQRDhQYW1UaDNxcXRBWU1lTEpTNnltSm9W?=
 =?utf-8?B?QWJsY3FMRW5qYUtYMS9YUXNxU0w5MTZRcm1HRkpOeW1lM05oNS9WdHN1RGVM?=
 =?utf-8?B?WG51ZHVNSEpLUURBTG9oMVBOeHdJb0NiTGc5ZVM3UjB4aXBQMUM4ZExEWGJw?=
 =?utf-8?B?Rmk0WDU5YnErZkNOQkVCK2lTQUJhcXhQK2NZSncwYkd6VnM1UmVvdElkMW4r?=
 =?utf-8?B?TDNKcm9FNGo0VkN3UVhsS1Vxci9UTStySCs0dW9hc09XcXdCQ0NNenhFbHhD?=
 =?utf-8?B?cmdTNktZczFESUpTZFJ4ZU5zSC8zTDJpcHBOMXZFWldtWlliWm1va3ZCcWhP?=
 =?utf-8?B?QlFEaVZWTHZuRlJUY2J0Q21SNGI3aUloRlZCWWhLWkRJNWlSMzN5ZGlHd2Fq?=
 =?utf-8?B?blk2UHJ6M2FKc2hIREFRbzZVWWZ5cXF1K1gvYzNuWm1ubzZPaisrcWdxTFg0?=
 =?utf-8?B?b2JZWk8rVzNYbFZIdEpheUsrSmg4VTlTSkRLdTQ1R3RqQXBNVVc1ZHR3YVFI?=
 =?utf-8?B?VzJrQlJvWWVWVkFiOFdvU0E0RVBnVlRoTjErcFNiNFh2V3MxNi9uWCtwUytD?=
 =?utf-8?B?bnZ2b0ZCOHBZNUxZZXpCejMyNS9TWHNPY0Y5em5FUHFlTEpWZVphalRrTUVU?=
 =?utf-8?B?b3NRYnZNT2d6YitsS1B3enllVEhLREdzNDlxcllwd3k1SVpDVXp6MWRHTXVR?=
 =?utf-8?B?dDJrLzA0eDJ0eUVTdVA3bGovTU9jOStZc0EySnpSSFJHVTB5YndqL3IvcG5v?=
 =?utf-8?B?UlZ2dDJYUi9zQ21ISEc5Y1JrU1lRQ3VlL0p1WVVib0VvaTJ5QmFnbzhmZUFi?=
 =?utf-8?B?NDN2SlN3dEFnbWVSZkFzT01LT3pEMStTcExkenVFSU9kT1Vtb2NBTXNSZyt5?=
 =?utf-8?B?TnVmYkEwL2NuUXAwWkZNWTNnTXBaU2lOV0VDeWt2eVNMc0JDSWxLU0xyS3Vp?=
 =?utf-8?B?Sk82WTJJNndzY2J1ZUlRWTdJQ0Y3ZkRkc2ZEUDRXVnRLalF1Q3VmQnAzaXIy?=
 =?utf-8?B?Ri9ZQnk3YkxDUmd1dUZSUTFVN2Q5OXlKeVRRSmd5azJhMkhhQitBdm9hQlBV?=
 =?utf-8?B?MW9sUFhkeVREQWlKRzFRNHc0Qkx0dXlNRmx0ak9WcldxZk9vT2xKQ2E3amI3?=
 =?utf-8?B?cFFPY2loTHhKWEwrWnhwTkZ6QUpOcXpLRUFuUnJ1c2tsVEoxWHJwc2I5RnAv?=
 =?utf-8?B?VWtDT3VPNjhuTnhTMzRXUkJqQUtrNFo4Q0ExRWNUYzcxMmJZbWU0WGJGb2xq?=
 =?utf-8?B?VFVVVUxDeGtMUHB3dktkTy9tQWNPQ1NzZUNpckI2Uzd5ekpDK3BhZnZRVVZP?=
 =?utf-8?B?Y0pBQll5Vmx0d2tlamFaRkNaTy9LWFRPUWtVM28waXZBUmdnZ2FtcUlPTUVJ?=
 =?utf-8?Q?QuCp8aZTV151oKiOEi7E3Izda?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(42112799006)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWE4blNmaDNUM0hNVStxSUhxT05YSkQzOUNndmtRVnZ3VXBmNlJOVll2amRp?=
 =?utf-8?B?TkFBaHBrWk5ZQ0ZLOFY4bFRaYXRTRUsyclh6MkpTZWtXWkZwMFlOMFE1NUsz?=
 =?utf-8?B?aFFCRTEvU2Yxc1hLZGxFdDQ3TldZU1BpLzN4S05uYUpGYjBHbDcvVkYxMWJt?=
 =?utf-8?B?SG0rVERkQkxRZ3VZUTNPempOM1hBMHFHb3NIL0RKZVhmNUp2NzZXNURueTBs?=
 =?utf-8?B?NXNyOGl6akcxLzMxeVJOaE1sbndtQkg4b0dTLytJR3VYQllQRERadTNMV0FW?=
 =?utf-8?B?VHpjUURrSzBGNWlDNXhNd2txSkJwcDRsME1NbnZaZTNyc0pKZTFQcHRRbTdF?=
 =?utf-8?B?cGpRdXM4TDE0clAwYUdhVmFzazkwYldOd2VHeDBaeFltd0Q3dnhrZFVOZVJI?=
 =?utf-8?B?TXZBNzVMZ1R2MTYwemtnVVV6bUlCSHorQ1lud0daczlUaGc0c1l5djY0M2ND?=
 =?utf-8?B?SnBlTEdWMi92UndFR1hvMmNrQ0RFZ0d6b2M5ak9GakgyYnZVdTNvNHc3YUxR?=
 =?utf-8?B?TG1pOWhQbU8vNU1ybEJ3cDdvSHk4REgyU0tkSVdLd29FNTIyWFdRZDFWTFVm?=
 =?utf-8?B?VFNiRkR5bmR5ZDBuVnZUeXZFcnk2TFhLaGkwWHh3SFpwbDViUVViRW5ZdXFM?=
 =?utf-8?B?YVpEYlA4bWpobEFFbFZpQXJVWmtUOXArcjRVb1cvc1J3Wnh0aDVidmw4Rm5L?=
 =?utf-8?B?aTZYOExkK2V1OC9tczBRemEvNXNKSU5oZ3hDU1ZGQUZEVFQvYmZJN0k5NGwv?=
 =?utf-8?B?REc5amd4ZXlFKzRLSU5wWFFEL0IzOTJ2am0veXBkUVRneGJ6NXI5UFB4NGVv?=
 =?utf-8?B?UFJYOTUzcnZlWStJdm82b09vZXZvVWR5NEpsMUdiY3FRNXhUalBYeHRYQ0R3?=
 =?utf-8?B?QTlUZllyMC9KZnNqNDFFenZUTDMydVppVEpjTFlhSGtrMzVjVzljbkw3ZHEz?=
 =?utf-8?B?SU0zRGlKdE9aWVdsWSt5M2sySEdhSzJEOGU0a2FYL1pBL0ZrZHpOL1huTW0v?=
 =?utf-8?B?MEl2czdqVnA0TXQ4SCtnd1lSck8rYzhocTFoVm5HMXd5K2RuQjRyb3p1Mnpw?=
 =?utf-8?B?YmFvanBCRUMyWnR0QjYwU1h3M1EzNG9sNllIUVNUWVErbVUyZkJmRjRWMFVD?=
 =?utf-8?B?ckFaZ2NOS3N0YkNBVFZmRmJMTEU2dGZJWExPZ0FCS3JSOE5aY21WMHRqOVZK?=
 =?utf-8?B?akpCUDJhY1lrclVSWEFJWUU0dkF6ZzgxWFVZMlVpb1lFY2x3VlhOQ0JOa0lu?=
 =?utf-8?B?eHNzVDNkSWU1T0NCWGVaZ090MzNyMTdyQVBPdCtyLzhaeWloSmpBWUhiR3ZZ?=
 =?utf-8?B?QXBWYnRMYnFYVStjamdReWpha0R5V3hMSGRTc2xzU2pLTmxqb0pWYnpDWlNH?=
 =?utf-8?B?WCtDMHgzaW10b3psRkNmeEQzRWIrc2YrUWpNb2xDWEtuNWV2TGdnZjJ1QW1y?=
 =?utf-8?B?b0lXN0h1Y3VKcmxqTlVFOThWS2lWL1EwdnNaNmFoMEQvMGFGR2xTRTF3bHBs?=
 =?utf-8?B?b0dvcUk2cU5TbUg0bFVEcnJmSm1lVS9LMXR0L2FKQWU1NC92Wi9Vci9oRllQ?=
 =?utf-8?B?ZE1kNjQ5NlBEaWFvcWY1cDJ4eWU4YkNqRWV0QVFLRlpFY0liMXJnUGt1RjdN?=
 =?utf-8?B?Vjd3L3lBVGlIbjY2YkNwSmY3QzRZOGxOV2Z4YlF2M3BZbE1aMm1XYkxDNlhP?=
 =?utf-8?B?YXBPdlhvSXhKNEgyT0NaSGlLZEc2MUplUVFKdDIzSHlHTkIvSnV1WDc3M1FF?=
 =?utf-8?B?T1RxRlIwc3FRY0JmbmptSVBpRENpZHhZTTgrY3ZCVmUrMUdtVWMydVVPdUV2?=
 =?utf-8?B?SEEySUYvaVFicUwydkhCSjBPdktEQnF1Vm9FcUZFclJPQU0zY2djcTF3Nkg0?=
 =?utf-8?B?VGxCUXJsSDJsbTFxZUxnc3JlK1IyMGtYM2NhV2RmSUw1aG9pNXFPcWVXZjBN?=
 =?utf-8?B?SVh1ai9VcTNVbHV6cTRTeTZQMkRudmlFd0lNbTdtVnl3QXFVTE5VV01MZ1l2?=
 =?utf-8?B?T2RWeS9idW5sZVIxU2ZxeXRyNFZoNnFyM1VXL3RDeVIrNnpJT3pUSlNUcW43?=
 =?utf-8?B?dlhpaVc4cllUTHd1QW9TdVh6S1JvZDRlZldyOWZSUi9SbHoreXZtcFVXbVNu?=
 =?utf-8?B?RlNuT2dITFRaVUlsR21sYmhvb0Y1MVoveTVHR3hOT1hHWjB3UkNaOXhhaDFN?=
 =?utf-8?B?YVlsdmRzd1R4VXAreWJFM2s1VmJYd3dGMGNIanpUajhLOXFha1N2L1ZLcDky?=
 =?utf-8?B?WXVpWklwcDgvejBDV0R0MTJYTmtkLy9CTHUzZkg2TEtveUFvV0Qrd3hjaEtV?=
 =?utf-8?B?MmtEb1p0MkNFQTF1WmxtcjhKL3ZZNU9Ga3gwbDJwbEo1Z2NxVzJpUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <036491F738FCED499AE240920DF1D935@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13313243-18a6-410f-3915-08de62243847
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 06:28:03.5025
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0lt3ICpLChQFNXBPaAxv5oXH/Rxd0Zc1lHFYixNUyHfWe4/TOokL9SQ9TxwS5Ta0xuqfB2kS4vDqDe40mJ/gJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8781
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_222814_040229_A8306B30 
X-CRM114-Status: GOOD (  19.32  )
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

SGksIE5pY29sYXM6DQoNCk9uIFR1ZSwgMjAyNS0xMi0zMCBhdCAxMTowMyAtMDMwMCwgTsOtY29s
YXMgRi4gUi4gQS4gUHJhZG8gd3JvdGU6DQo+IFRoZSBtaW5pbXVtIGFsaWdubWVudCBmb3IgYm90
aCB0aGUgaGVhZGVyIGFuZCBkYXRhIGJ1ZmZlcnMgaW4gdGhlIEFGQkMNCj4gZm9ybWF0IGZvciBN
YWxpIEdQVXMgd2l0aCBhcmNoaWN0dXJlIHZlcnNpb24gNiBhbmQgaGlnaGVyICh3aGljaA0KPiBp
bmNsdWRlcyBNVDgxOTUncyBHNTcgKHY5KSkgaXMgMTI4LCBub3QgMTAyNCBhcyB0aGUgTWVkaWFU
ZWsgRFJNIGRyaXZlcg0KPiBjdXJyZW50bHkgZGVmaW5lcy4NCj4gDQo+IFNpbmNlIE1lc2EgZGVm
aW5lcyBpdCBhcyB0aGUgY29ycmVjdCB2YWx1ZSBvZiAxMjggWzFdLCB3aGVuIGRpc3BsYXlpbmcN
Cj4gQUZCQyBidWZmZXJzLCBzb21lIHJlc29sdXRpb25zIHdpbGwgY2F1c2UgdGhlIE9WTCBjb21w
b25lbnQgdG8gYmUNCj4gY29uZmlndXJlZCBieSB0aGUgZHJpdmVyIHdpdGggYSBkYXRhIGFkZHJl
c3MgdGhhdCBpcyBkaWZmZXJlbnQgZnJvbSB0aGUNCj4gYWRkcmVzcyB0aGF0IGFjdHVhbGx5IGNv
bnRhaW5zIHRoZSBkYXRhIGFzIHNldCBieSBNZXNhLCByZXN1bHRpbmcgaW4NCj4gY29ycnVwdGVk
IG91dHB1dCBvbiBkaXNwbGF5Lg0KDQpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVr
LmNvbT4NCg0KPiANCj4gRml4IHRoZSBBRkJDIGFsaWdubWVudCBkZWZpbml0aW9uIGZvciB0aGUg
TWVkaWFUZWsgRFJNIGRyaXZlci4NCj4gDQo+IFsxXSBodHRwczovL3VybGRlZmVuc2UuY29tL3Yz
L19faHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL2Jsb2IvMzg0OGEw
ODA1MzRhMTdjYTA3NWU5ZTk1ZGQzYTE0YWJiODAxMzlhYS9zcmMvcGFuZnJvc3QvbGliL3Bhbl9h
ZmJjLmgqTDM2NF9fO0l3ISFDVFJOS0E5d01nMEFSYnchaHg2Vkk2cGJJTmNVT1JkbFYxaVRpNy10
aUFYVXlRUFJQREF2TmpxNWVhQktsU2M4SlNlLXpRZTdXZG5XTy1HU2dMWl9fOUt4YjZWSGhBTDFG
eGckIA0KPiANCj4gRml4ZXM6IGM0MTBmYTliMDdjMyAoImRybS9tZWRpYXRlazogQWRkIEFGQkMg
c3VwcG9ydCB0byBNZWRpYXRlayBEUk0gZHJpdmVyIikNCj4gU2lnbmVkLW9mZi1ieTogTsOtY29s
YXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPg0KPiAtLS0NCj4gIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfcGxhbmUuaCB8IDIgKy0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfcGxhbmUuaCBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfcGxhbmUuaA0KPiBpbmRleCA5NWM1ZmE1Mjk1ZDguLjQ2YmU0NDU0YmM5MiAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19wbGFuZS5oDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfcGxhbmUuaA0KPiBAQCAtMTMsNyArMTMsNyBA
QA0KPiAgI2RlZmluZSBBRkJDX0RBVEFfQkxPQ0tfV0lEVEggMzINCj4gICNkZWZpbmUgQUZCQ19E
QVRBX0JMT0NLX0hFSUdIVCA4DQo+ICAjZGVmaW5lIEFGQkNfSEVBREVSX0JMT0NLX1NJWkUgMTYN
Cj4gLSNkZWZpbmUgQUZCQ19IRUFERVJfQUxJR05NRU5UIDEwMjQNCj4gKyNkZWZpbmUgQUZCQ19I
RUFERVJfQUxJR05NRU5UIDEyOA0KPiAgDQo+ICBzdHJ1Y3QgbXRrX3BsYW5lX3BlbmRpbmdfc3Rh
dGUgew0KPiAgCWJvb2wJCQkJY29uZmlnOw0KPiANCg0K

