Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4A9606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 09:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gt1YIKf1;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=PuXWdcUV;
	dkim=pass (1024-bit key, unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=hP77CxKl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=x66jJCF4pqOBPNxrwT4Pntqoy6Dp+hRbh9syGVodyHI=; b=Gt1YIKf140+HRk44H5XZoMxd4J
	Sj3yHnQ8sM8lD9+BN0DuwdrfVARWxFqAVfZzMfT/uuLyPKJas2yswYoABBhQzqfHrick2cUF4DH+1
	uN/WBWxTiorMOWU8g9R52P84Bm3Twy4U0KZy8FiI/FmbPD2goZusJmq5b3ugBtoPGHX0SI2d2On0Q
	CfxJkaRZfujF6kJImCCFAEw1P8qK+6g3ph3YlamPc1K3Jy67VxUbBA1UI1p5dWWI3JAKiIyNhUY8F
	FLyX4KllWJ2EEvY4Vj9VcASJtTpVx735gg91v29Xf7coCgpkR3VpjuJXzfuJUL/TPtc6FTkuOx3tl
	0uIngOeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOASr-00000001gpB-3M8P;
	Tue, 03 Nov 2026 09:05:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOASo-00000001go1-2Pkz;
	Tue, 03 Nov 2026 09:05:55 +0000
X-UUID: c467198ad76511f1acbe4559397dec65-20261103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=x66jJCF4pqOBPNxrwT4Pntqoy6Dp+hRbh9syGVodyHI=;
	b=PuXWdcUV4oCndHn2NhQnxK0U9m0u6rtln6VkeomZ85kq41y5Cxcqw37F+91rbLs9Yv3nlifeJBJAeZoExhM9EWotpjYqxAbS9Fvg7yIfl2WD1fz34YCmtEyNp7J0EqTSxmZW69aL79I9WSYVFLwBkzZlLz6VDvuBUMGzHsZ/Stk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:4bd67efa-38fb-4bf1-9e77-85d381d36249,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:63f256bb-4006-44bb-949c-6e25a7b8dad4,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|136|836|865|888|898,TC
	:-5,Content:0|15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:
	nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
	C:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c467198ad76511f1acbe4559397dec65-20261103
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 738834895; Tue, 03 Nov 2026 02:05:51 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 3 Nov 2026 17:05:48 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 3 Nov 2026 17:05:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ycTdcRBTjS+W08vdRATx1fQL5YLVi4RmXCQJalw5uJMn3zd/+u1ljBGV8ZqV85ivf0yr5ry1zRNjpmxLRs6PMcQcyu+NGWiYw9L8gq4t9A9ubRAkPf+xIyItHBSmYmqqHFAu+KoZPXVe1yh0wd548LgkAYaUUjbsWJ5nc0WXOip8yn276hqBCtDOr26y96yboobK6KG4NAUb0z85NejS2vPVfPF8av+dxu7ddbeqbTlDrBL6QNCSiQw/kH4sdRCpIWpMUexdNRQ+xJ+o7Ab+We+n3iTkVzyrjRB1dOlKTy68Zc1CX26kgGhmfdDud7NKqIaKtUO1TfcGWfGd7HLJTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x66jJCF4pqOBPNxrwT4Pntqoy6Dp+hRbh9syGVodyHI=;
 b=c1uW9Ynyn07p2Hk3p/ziyKq0Ymew7xU062FB0afUXu9ddFzI8Wa1HlSWkr91HGppRc9eJJHkKnG+mhw14njnQIr9xZ7ie/0JeAEgdd0GFkJ0VIMTnRpm2IXhuqd3NwMAcO3kuQsAiv5l94GCYiuqLd/EWENFbGE8tuJ0WgFFcyxahx/+fAIoen05ZXmk0c8G3pWPz3jXTPgzeG4Dq5luAQfE4JKelnmrj8TKriG+1xPQeacz5c8rkdPKIV3D316A/X+lj04VJvOdxu2ePS1Y7OKJM7PUiE2URPkjAd5KLTGezyrC0cavlJ/7dtz0GIZmaIZzyG+6GVjLCSvqjqKYvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x66jJCF4pqOBPNxrwT4Pntqoy6Dp+hRbh9syGVodyHI=;
 b=hP77CxKlpPjhCqA0STEDgce3LQxEVEcUIU5H2v06DO0w5PpU1t0RqwmJLyEK0QG1FDSqcCGn1KZjbVyHh58VqNFt1fKD9h0eemeDq1spByA1KY3y3Hkc5b797RxZLDVH88DiRoL/Cgzu6ALVucFg0w24ggzl7ryPFggWWuyi/V4=
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com (2603:1096:604:471::11)
 by KUZPR03MB9357.apcprd03.prod.outlook.com (2603:1096:d10:2c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 09:05:45 +0000
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02]) by OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 09:05:45 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"westeri@kernel.org" <westeri@kernel.org>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "YehezkelShB@gmail.com"
	<YehezkelShB@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "andreas.noever@gmail.com"
	<andreas.noever@gmail.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 2/4] thunderbolt: add support optional dedicated wakeup
 irq
Thread-Topic: [PATCH 2/4] thunderbolt: add support optional dedicated wakeup
 irq
Thread-Index: AQHdaEhMvwQ7X9y2/U+m6TxIF+UpZrcVxmsAgAZOCAA=
Date: Tue, 3 Nov 2026 09:05:45 +0000
Message-ID: <34de87bb4da20626d440346f9aa0cf7873ef85d1.camel@mediatek.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
	 <20261030082539.1208733-3-chunfeng.yun@mediatek.com>
	 <20261030084854.GQ158991@black.igk.intel.com>
In-Reply-To: <20261030084854.GQ158991@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSNPR03MB9677:EE_|KUZPR03MB9357:EE_
x-ms-office365-filtering-correlation-id: cf03f711-d23a-4d26-50e1-08df3989a548
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|261021121427099003|261022105027099003|261022075727099003|261009223027099003|38070700021|261026140227099003|261026121527099003|261028144727099003|4143699003|11063799006|56012099006|22082099003|18002099003|261102123227099003|6133799003|10067099003;
x-microsoft-antispam-message-info: 383WZlw98cH5coaOkjqDwM31y3cM6lTqf8dKjl3M+bq2DH+gybXBQNY0houQMl0TcUjdjwjN3O7N+KLzPVnq7yauK9Zdlt1CQpnjy06wz2bPdcyLPSkBhZ1wu93PWYtUN5jr6xbkrPuNyyhR+d143G2/kyTFeI66YnQ7PQMU8iPxA0RKOfUtvqCNI01Mi5ZJAoIGIkxQg7TdXPYyhCMXf9Ww/O2tX+DkhsEsDl6nZKAqyopDeBVFaq9RkSXHUZXwFDxrwFxJzP8jN7vp0o+5AqpDkAVb+2bvO8olS6Xu4OyG0dQ4q1QfyNkBCh00NBFM2THB1kkRRSSB2UCH/Vfh4WHKebFaV0cDPSih01lLokJL28m5DZ6QF+VvRYgWGxRgiMvL16bHN3iPPTi5aXmW7IwEdhkVVu1knOdHBwggWv5Pois4PgJIpNNa54reb/cJZ9fTRAknP+ULGfPGo9cPRTfrQh7+fTkIi785w8Fsr9XL6ywmoCF0IRUNTD4w/6EnroflV22/hpvPRu4mrTe0K5NuU7nwJDEH8/NGcaAqCZ7j39V6l6FB4flgp9/lkt1PUXWdmahIX0BiBRkVJqTZF+gDY3CyxRNdRfRJVTApOyBQBq68vd/P9t/AQTD16H4IsDR5OthIgWj8eSTUNiuP+k6KmsUREwuC+o8iajqOEVUE1swHchf6vvBoFm4XUnI46/nVFpyiMba0n+cMgcWsg65J6QvHrSkVNsSSSmJ//kI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSNPR03MB9677.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(38070700021)(261026140227099003)(261026121527099003)(261028144727099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(261102123227099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXRrVEx3RE9JL0k4M3RhOXpZSS8ybUdSMHNweGpuMk1NQmRQeXh6OWVjcStI?=
 =?utf-8?B?T1ZrVDRiNVZweE1tTGl2cElkQ3RXRVBHNzBjaTVSekhGL2hVVHd0dWF3d1R0?=
 =?utf-8?B?MzdtWU1rWXpzSHpuV0V3TktwdGU5VCtwcjlyT1BkYkVnTmQ2aEhjWWh1MkIz?=
 =?utf-8?B?SVdXbzE3dUdCRDRFTEwrUEhaVktBT0tKWnR2MHFiUkFVQzd2V2hETm51MHlH?=
 =?utf-8?B?S2FWak50QUJFZ21vdWRkZWZEd3JaOXFRMWQzRzRHUCsxNldISThpV2Rtd1NZ?=
 =?utf-8?B?dWxDcFN4Q2dVenAwek1BTW51MkU1QUhQRzloQ3owNm9iL1NLQXpzajVWR3Fw?=
 =?utf-8?B?SkxXRS9xaFMrV2wwQVJ5OXNDbWhjVVZGd3Q0b25qNjk2WW5STXJxOVlUVWhH?=
 =?utf-8?B?a2RoYjRUZGdqNWZsOGNkelJ5Y3FRZWZWRW9oSFFybFdWcXZhRkdpVEZCOGJM?=
 =?utf-8?B?TlMzM0Iyai9XTHQvUTNVUUtOMFp2K3lCSEQvZHZDS1JybnEzQnNkOXZXcXND?=
 =?utf-8?B?QzVISklqZURQTDlMMFZFWTNXUWEvYzBSOHFTRzZvQWs1SUYvd0ZzUEw4dFND?=
 =?utf-8?B?Tjc2Z3diNGJ0UGgya3ZRaHZ6WDVJQ2VuTzJnZ1Fxc3BqYXFDbzhrVVJSMzVv?=
 =?utf-8?B?RjU5WEFKb3M4WThwN2dUSUxUbDYzSjlCb3hORW11WmNLazA0UEJVRmVwZVc5?=
 =?utf-8?B?NENMcHcrRWRlQ2VCcUh2YW1GeTdBaUhDcTZManF1eFR2QjBqMWR6YWpieklO?=
 =?utf-8?B?K0tMRGJieWs3eVpwRHR1NWhpSFQxeVFIdUNHWUF6K1orSkx4Y2M2amJlTDNQ?=
 =?utf-8?B?WXI1d1RZYXJ5d1dVbm1NU21TdXkweElSTXpsaFNyeUp2cUxCWTRxWVN4aDBk?=
 =?utf-8?B?d0dic0N0UGF0Z3pQS3k1OFNlUE9PcmkxdWpDWlg4cDl4SkZLWFpTS0ZubEp5?=
 =?utf-8?B?bU9DZnFpZ1pQdVIwalRYQy91MFRER01lK0gyOU5BVUlxZTJNVUN0NVA5RUhv?=
 =?utf-8?B?Qk92eWxMNHROMGVKK215V0lJYjVpMHVQYWg3Z205NTRnNjFnbzBwMklQREF4?=
 =?utf-8?B?bytXaVliT3dpK29FdDkvcVpjUnVVL1RTVUE3alphemdvcHpuaXAzU3orQ2FD?=
 =?utf-8?B?d3l4c3BoTW5FOU1yQkpGTllpQ2trT1ROK0FnMXFubUJMR01qcENOZWpyQXBB?=
 =?utf-8?B?ZGxwVDhqb1BMK1FsS3VkenI3cnhWa0xUNW85MlpXakJBYkV6RUQyMGVzYndo?=
 =?utf-8?B?WkFZNGJnZU1YeFMxNHdGU1RnM0FLWUY2aEtkbHVaekZ3blBJL2d0L3JTMWh3?=
 =?utf-8?B?VzA3ZFRIVEhzVSt1bmlac293WXZIZ0x5dzBIY3cvdmQ3S1BxMnVCdmtjQlEw?=
 =?utf-8?B?S1lNR1BCcDI4K2lHM2p6TWdaeXlPOUNVeXd3QUxCbmxjRS9KdzNUdWZadWpY?=
 =?utf-8?B?eHIxOVRoUUdRK0d4M0NTMTYwZ2NySUU5ZWs1TjVZZHIzdVdLOXpEZjNPdjhW?=
 =?utf-8?B?VHRLakJZZWJaZFFsZkhqN3NvZFBpejFqZmpjTWVtQXVLV3IzbmluZ3c2RzBy?=
 =?utf-8?B?TVJJTFFMQ1ExanJXbDBFYVJIUEQ5L1YzWWdQWWZrQWVWUWhta0YvcWpNeVFR?=
 =?utf-8?B?M2tsaUgvU0tGK0xsTWVsY0pkUFFUK1JRYUlsdGk5L2NYbmRYQ2I4dE5yR2Z0?=
 =?utf-8?B?SzRFbjRmQ2I3Rzg3TkhSVXUvbU0zQmZiZ2tFME9BenlIcmM5bFIzZDBTeHVk?=
 =?utf-8?B?bjNOUWxFMUs1STZtcm1pM3FqUkZEejhHVGNZblNVY0pJTjRjQVlSUmFhZkgx?=
 =?utf-8?B?NkN2UythYnRSNktjb0h6S0JOWG1yc3ZpRnNwTE94eHZyTGwxSDdaZ3dRd1VF?=
 =?utf-8?B?amdHV3o5RVR4ak85TFc1U0FSODZIYWNPaEU1dXVRT1hGeUxoM2V3OHROb3dM?=
 =?utf-8?B?RC9OQjloWTFudUF4MGNrZUd1Yy9HREhhZlFwMFlhL0VEaGprTGZPY3dZbnJE?=
 =?utf-8?B?b0p0ZnVFajNWdkp2R3prSGdMZ280c2I2dVprMEpxbjU4NEVmZjBidWZyY3RR?=
 =?utf-8?B?Zy9RU0ZiYW5qdnV1WTMwck9MMnorcWZCYXFWYS8zOTFjR0ZLNHVrc2doSHI5?=
 =?utf-8?B?dllKMTQzTTNGYm1IenJVZDZJazZ2VTQ4MDN4aklNV0hnMUxrNlhKa2FRUDZO?=
 =?utf-8?B?YytNYjBwRzVBUi92MFh2OTY5VVBGYlNsV0ZmLytpbVE0K1JtbmNzbEY3c0lu?=
 =?utf-8?B?TUZVb28rSkFlTmNEdGU2T21naWtGalpZZUxjSUthbjVuU3lXQ0pCZ0pLUWJw?=
 =?utf-8?B?MSt0cWt3TzNYZ2VzMDF4VWtpbERWeitzdDh1bTdzQjFlM2FZTTdaQzNyditJ?=
 =?utf-8?Q?3dMZ2P/E7vy0KP60=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <630E0D23A343EE43830CD6D7CA67CA0A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: llRpg6k2GRvesj36vRYMmYK1dHvw3Uo+qQoYrkHxAhiX/00WjC2AFlhOp86tJhwwR9ONAOxf8BdggRBdtHt/7XmjTMKOFCE8jY6BUItSWWMhVFjaz9bROsyARBP9Oje29wCcmHgr3fyxaU+KhtfbcrMRp5XKacvfLXdPqU4F5QsjBfBVQm+JI+p6m9GZqnh5nczlauN2Zhrp72TELDdj0oZkafxSQ/OXiVOPjAukSvnrx3fBzUOVRH7z7O5IikQCY96SF4H2SVRlrMNeJxaz4ycCmuq9jkiq3jEKBtT6ZKZCFk3laDmSk9J18kxbgwEosOqNXEeAntMHKOX5Y8NISg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSNPR03MB9677.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf03f711-d23a-4d26-50e1-08df3989a548
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 09:05:45.5707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q8IezFRgDj+0ey9faSZDZnEZd1mjQnaVk8pgvOEHCvOUXinH0IAxORCJhKBjnuisKGIBMPVcY2/P0FUwSGPw/GsfMwNSvUMtzDR+3mzbSgA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR03MB9357
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_010554_646168_4A0EA890 
X-CRM114-Status: GOOD (  24.52  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCAyMDI2LTEwLTMwIGF0IDA5OjQ4ICswMTAwLCBNaWthIFdlc3RlcmJlcmcgd3JvdGU6
DQo+IE9uIEZyaSwgT2N0IDMwLCAyMDI2IGF0IDA0OjI1OjM3UE0gKzA4MDAsIENodW5mZW5nIFl1
biB3cm90ZToNCj4gPiBUaGVyZSBpcyBhIGRlZGljYXRlZCB3YWtldXAgaXJxIG9uIG52aWRpYSBu
MS9uMiBTb0NzLg0KPiANCj4gT2theSBidXQgd2h5IGl0IGlzIG5lZWRlZD8NCmR1ZSB0byBtYWMv
cGh5IGlzIGluIHBvd2VyIGRvbWFpbiB3aGljaCBpdHMgcG93ZXIvY2xvY2sgd2lsbCBiZSB0dXJu
DQpvZmYgd2hlbiBlbnRlciBpbnRvIHNsZWVwIG1vZGUsIHNvIGNhbiBub3QgdXNlIHRoZSBtYWMn
cyBpcnEgdG8gdHJpZ2dlcg0Kd2FrZXVwIHNpZ25hbCwgaW5zdGVhZCBhZGQgYSBkZWRpY2F0ZWQg
aXJxIHRvIHNlbmQgd2FrZSBzaWduYWwgd2hpY2gNCnN0YXkgaW4gYWx3YXlzLW9uIHBvd2VyIGRv
bWFpbi4NCg0KPiAgQ2FuIHlvdSBhZGQgdGhpcyB0byB0aGUgY29tbWl0IG1lc3NhZ2U/DQpPSywg
d2lsbCBhZGQgbW9yZSBpbmZvDQoNCj4gDQo+IEFuZCB3aHkgeW91IGRpZCBub3QgYWRkIGl0IGFs
cmVhZHkgaW4gdGhlIGZpcnN0IGNvbW1pdCB0aGF0IGFkZGVkIHRoZQ0KPiBwbGF0Zm9ybSBkcml2
ZXIgdGhlcmUgYW55d2F5Pw0KT0suDQpiZWNhdXNlIEkgdGVzdCBiYXNlIGZ1bnRpb24gZmlyc3Qs
IHRoZW4gc3VwcG9ydCBzdXNwZW5kL3Jlc3VtZQ0KDQpUaGFuayB5b3UNCg0KPiANCj4gPiANCj4g
PiBTaWduZWQtb2ZmLWJ5OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+
DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL3RodW5kZXJib2x0L3BsYXQuY8KgIHwgMTYgKysrKysr
KysrKysrKysrKw0KPiA+IMKgaW5jbHVkZS9saW51eC90aHVuZGVyYm9sdC5oIHzCoCAxICsNCj4g
PiDCoDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3RodW5kZXJib2x0L3BsYXQuYw0KPiA+IGIvZHJpdmVycy90aHVuZGVyYm9s
dC9wbGF0LmMNCj4gPiBpbmRleCA4NWEwMGNkMzkxZDQuLjhkODNiNDg0ZDk0MiAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL3RodW5kZXJib2x0L3BsYXQuYw0KPiA+ICsrKyBiL2RyaXZlcnMvdGh1
bmRlcmJvbHQvcGxhdC5jDQo+ID4gQEAgLTExLDYgKzExLDcgQEANCj4gPiDCoCNpbmNsdWRlIDxs
aW51eC9vZi5oPg0KPiA+IMKgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KPiA+
IMKgI2luY2x1ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3Bt
X3dha2VpcnEuaD4NCj4gPiDCoCNpbmNsdWRlIDxsaW51eC9zbGFiLmg+DQo+ID4gwqANCj4gPiDC
oCNpbmNsdWRlICJuaGkuaCINCj4gPiBAQCAtNDYsNiArNDcsMTUgQEAgc3RhdGljIGludCBuaGlf
cGxhdF9pbml0X2lycShzdHJ1Y3QgdGJfbmhpICpuaGkpDQo+ID4gwqAJaWYgKHJldCkNCj4gPiDC
oAkJcmV0dXJuIGRldl9lcnJfcHJvYmUobmhpLT5kZXYsIHJldCwgInJlcXVlc3QgaXJxDQo+ID4g
ZmFpbGVkXG4iKTsNCj4gPiDCoA0KPiA+ICsJaWYgKG5oaS0+d2FrZV9pcnEpIHsNCj4gPiArCQly
ZXQgPSBkZXZfcG1fc2V0X2RlZGljYXRlZF93YWtlX2lycShuaGktPmRldiwgbmhpLQ0KPiA+ID53
YWtlX2lycSk7DQo+ID4gKwkJaWYgKHJldCkgew0KPiA+ICsJCQlkZXZfZXJyX3Byb2JlKG5oaS0+
ZGV2LCByZXQsICJzZXQgd2FrZSBpcnENCj4gPiAlZCBmYWlsZWRcbiIsIG5oaS0+d2FrZV9pcnEp
Ow0KPiA+ICsJCQlyZXR1cm4gcmV0Ow0KPiA+ICsJCX0NCj4gPiArCQlkZXZfaW5mbyhuaGktPmRl
diwgIndha2UgaXJxICVkXG4iLCBuaGktDQo+ID4gPndha2VfaXJxKTsNCj4gPiArCX0NCj4gPiAr
DQo+ID4gwqAJcmV0dXJuIDA7DQo+ID4gwqB9DQo+ID4gwqANCj4gPiBAQCAtNTMsNiArNjMsNyBA
QCBzdGF0aWMgdm9pZCBuaGlfcGxhdF9leGl0KHN0cnVjdCB0Yl9uaGkgKm5oaSkNCj4gPiDCoHsN
Cj4gPiDCoAlkZXZtX2ZyZWVfaXJxKG5oaS0+ZGV2LCBuaGktPmlycSwgbmhpKTsNCj4gPiDCoAlm
bHVzaF93b3JrKCZuaGktPmludGVycnVwdF93b3JrKTsNCj4gPiArCWRldl9wbV9jbGVhcl93YWtl
X2lycShuaGktPmRldik7DQo+ID4gwqANCj4gPiDCoAlwbV9ydW50aW1lX3B1dF9ub2lkbGUobmhp
LT5kZXYpOw0KPiA+IMKgCXBtX3J1bnRpbWVfZGlzYWJsZShuaGktPmRldik7DQo+ID4gQEAgLTg1
LDYgKzk2LDExIEBAIHN0YXRpYyBpbnQgbmhpX3BsYXRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZQ0KPiA+ICpwZGV2KQ0KPiA+IMKgCWlmIChuaGktPmlycSA8IDApDQo+ID4gwqAJCXJldHVy
biBkZXZfZXJyX3Byb2JlKGRldiwgbmhpLT5pcnEsICJnZXQgaXJxDQo+ID4gZmFpbGVkXG4iKTsN
Cj4gPiDCoA0KPiA+ICsJLyogaWdub3JlIGVycm9yICovDQo+ID4gKwluaGktPndha2VfaXJxID0g
cGxhdGZvcm1fZ2V0X2lycV9vcHRpb25hbChwZGV2LCAxKTsNCj4gPiArCWlmIChuaGktPndha2Vf
aXJxIDwgMCkNCj4gPiArCQluaGktPndha2VfaXJxID0gMDsNCj4gPiArDQo+ID4gwqAJcmV0dXJu
IG5oaV9wcm9iZShuaGkpOw0KPiA+IMKgfQ0KPiA+IMKgDQo+ID4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvdGh1bmRlcmJvbHQuaA0KPiA+IGIvaW5jbHVkZS9saW51eC90aHVuZGVyYm9sdC5o
DQo+ID4gaW5kZXggMjEyYzhmZWE2NTcxLi4wNmI5MGQ0NTJlZTIgMTAwNjQ0DQo+ID4gLS0tIGEv
aW5jbHVkZS9saW51eC90aHVuZGVyYm9sdC5oDQo+ID4gKysrIGIvaW5jbHVkZS9saW51eC90aHVu
ZGVyYm9sdC5oDQo+ID4gQEAgLTUzMyw2ICs1MzMsNyBAQCBzdHJ1Y3QgdGJfbmhpIHsNCj4gPiDC
oAlib29sIGdvaW5nX2F3YXk7DQo+ID4gwqAJYm9vbCBpb21tdV9kbWFfcHJvdGVjdGlvbjsNCj4g
PiDCoAlpbnQgaXJxOw0KPiA+ICsJaW50IHdha2VfaXJxOw0KPiA+IMKgCXN0cnVjdCB3b3JrX3N0
cnVjdCBpbnRlcnJ1cHRfd29yazsNCj4gPiDCoAl1MzIgaG9wX2NvdW50Ow0KPiA+IMKgCXVuc2ln
bmVkIGxvbmcgcXVpcmtzOw0KPiA+IC0tIA0KPiA+IDIuNDMuMA0KDQo=

