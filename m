Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62595C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 01:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zm1nn9n3z5aEBokHscllkQ2IxfhOmi9VkO6UMrYqWkc=; b=0ATHc+8jFLF4TmB60+SLJXNxGe
	VafVLwB8HKCUd386cAIiGoZp90uEcia8Ce6nl24N0vZhR8/bD6CGGoZknnUiUVFbnsNK40nKhWfHy
	VyuAem0tEdxnD8L1RN2dx82i19K5ZGIu7Kc6zHEm/RHW/06ZWUdP0N6TKGRClMmUHoTy11sKLHFuk
	0caosoCmm6d1YogCMxGQ2W8NlPtdhz4bUUE386fXJJakoh+GpsB6vhT8qW+F1/5AkxM7hTZTn+MFs
	onYxgpzS3XSP7M/quV2Qa8gWmC5klNfmtv6nr6SpFst6ZT2iGrVFtpbOXNGnNDmwHuaDhDLUN1fbL
	J8/5SNMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv4jg-0000000Afie-3iEZ;
	Thu, 20 Mar 2025 01:30:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv4hy-0000000AfMn-3r5b;
	Thu, 20 Mar 2025 01:28:32 +0000
X-UUID: 9e8a452a052a11f083f2a1c9db70dae0-20250319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Zm1nn9n3z5aEBokHscllkQ2IxfhOmi9VkO6UMrYqWkc=;
	b=ldeO1Frhs/LgrAL0SujfXTLkB7JfPLkm76n42qmWt74kqRGOXVPm4+Xr5XSo5Ltl9u/ybXiLult3rZyGvfOtPaMHubi3ydvKOsdbXUn78ikrie1uMuS7DwvlhmRB0PlAMtRULP7EOtlPQ2ZMOT7AbHoIX3ADtzw5d6Yd0pFHQEE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:f69d1e55-76db-4a42-8ae3-1e4f7376361f,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:82a88fc6-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 9e8a452a052a11f083f2a1c9db70dae0-20250319
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1426395568; Wed, 19 Mar 2025 18:28:25 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 20 Mar 2025 09:28:22 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 20 Mar 2025 09:28:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KewJE+wt+DqNr9O9deImWHK7YFLhOkqTmuua0V/NhHscflmrbvK4yO3QAFAZf9NsI8FCTADmxQcU2n38f4B3g9+OnXxmExwMC+UDpL0ZvsBxn/Lsacq03kRYCD8JAH+RpVfr7y3ujPMuLfxqfVn/kZVJAEk+E6kg7OOgwPTMGSmrG6XGYaUkEA5rslnlEHVihVXR98tozG1BVqLeZN15XRiItbtd9srjwA8PV1Sk/ylzdgLmsWGkQg9HfvRDX/mo1Rp1dEVN3YLHKL0N/DmyXKGU6xVhOXYpKPY8O5Co2r2mdtjmIsfU7lTkGjN6yL5oLzYL2m+b/eVrPcyfnPMQgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zm1nn9n3z5aEBokHscllkQ2IxfhOmi9VkO6UMrYqWkc=;
 b=UnNQGc7EjWSet6cSs3B4ww9HwpjloRJdVHC3o23v6FHuLUf2MPx7POo0ucb6zGb4D0X0xUXF3+MXM/cD1w0qM0sEtxwzSi453vua4vcp4NeGTvDMr1EVtUV85QczjVPbMaWvTJnhwIuUfiTzaZJN3ZgOAqrUfP7qrzh7PxHp0x3dTYI5wF+ORt8oHWB+YPrblm4WQ0eIdzh1j/2PNarSQQgRciPISn+J8R8VVMtVHaJzJfX46toAGkL1oC0fd4171BX9zHk/Kp1Zr3XvkdcT3deSvgdm8uB9+dkhBm1IWE74HUBMznWdv9xhqWoXPbNjWa3sq44GxFOYxqVW6B4cww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zm1nn9n3z5aEBokHscllkQ2IxfhOmi9VkO6UMrYqWkc=;
 b=f+CoYwx4M4tpS4gp9BkZm3nP4L89s7FRX6kVDFHIKUqOvMmHEiezFMaTJ76qbZ7YCFhkcT75im/siHiZleX0gOlfinjpDPHJkgiX2KvphgZtWZKQbLWwfJ8imIdNQsEIXykKGJfPh1G/K4Li5HVi1+pAgcjPix9TKkBG7AbQtww=
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com (2603:1096:400:14c::9)
 by SI2PR03MB6712.apcprd03.prod.outlook.com (2603:1096:4:1ec::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 01:28:19 +0000
Received: from TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::cb39:b94b:1fd9:2f84]) by TY0PR03MB6356.apcprd03.prod.outlook.com
 ([fe80::cb39:b94b:1fd9:2f84%4]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 01:28:17 +0000
From: =?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"robh@kernel.org" <robh@kernel.org>, "andersson@kernel.org"
	<andersson@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	=?utf-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= <TingHan.Shen@mediatek.com>,
	"mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, Nicolas Prado
	<nfraprado@collabora.com>, =?utf-8?B?T2xpdmlhIFdlbiAo5rip5YCp6IuTKQ==?=
	<Olivia.Wen@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "kernel@collabora.com" <kernel@collabora.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/4] dt-bindings: remoteproc: mediatek: Remove l1tcm for
 dual-core MT8188 SCP
Thread-Topic: [PATCH 2/4] dt-bindings: remoteproc: mediatek: Remove l1tcm for
 dual-core MT8188 SCP
Thread-Index: AQHbmLJAQD9gev5akE2En8awTnJyebN7PVGA
Date: Thu, 20 Mar 2025 01:28:17 +0000
Message-ID: <b0872ee008c3c6a2731f949d8c2be77aa49341f7.camel@mediatek.com>
References: <20250318-scp-dual-core-mt8390-v1-0-8733e192cc73@collabora.com>
	 <20250318-scp-dual-core-mt8390-v1-2-8733e192cc73@collabora.com>
	 <70c10764-121b-43f5-931e-84ffd666c594@collabora.com>
In-Reply-To: <70c10764-121b-43f5-931e-84ffd666c594@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6356:EE_|SI2PR03MB6712:EE_
x-ms-office365-filtering-correlation-id: 4d1362a8-068e-448a-ed16-08dd674e7e20
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?akVwT2hCMmJLZGNwQ08zM1FYanEzczZ5OVlXd1RkRnpzQTFTZVYzbElBam9t?=
 =?utf-8?B?VFBFVXJZQU1FTThpSzQ0ZEVlOTl3YzArUFVTMUNnenE3aEZmbFNZOWd2N2Zu?=
 =?utf-8?B?a3RRajFmUmdzUWZsTHBCT2RjRnlSSCtoMXJibU1DVEtzY21ZWUR0UzFJUExk?=
 =?utf-8?B?NndjSzJkTzhLUlN4bHl1S2w4QnZQdFY0SC9yMHVHdG1BUUk5SDR6d0dQakN3?=
 =?utf-8?B?WjBPMUVXemU4aVFrSWxWczd4K0NYMDdBRkdWV3RWUk5EWVNEMkhEYlB5V29N?=
 =?utf-8?B?Q0pjcnp3RC92UEljekpxaUxVZjViWndsSVRjMmpEcnUvZGhicmp3ZjV2czBs?=
 =?utf-8?B?bDVOK0UzMXh3WWZ0UXNIWVoyRWJreFArT3B4SUtXbWlueW1pVDhsOHZCL0VM?=
 =?utf-8?B?N2hBSGhRYnVzMlpSYndrTDJwREkvMmdYdzVYSG4xZ3hadlFKOW1DM3cvY1pp?=
 =?utf-8?B?K2JoazBiZDFNckxkY0grSlNVMFpzWTJ4N1ltQ0xBU0dxUFlxQVhjL0h6Tm5E?=
 =?utf-8?B?cUowRHk3cHVZMyswdE82QzkvNXBHMVB3QytSRE1IRHJ1RkFOWlhqLzhDOGw2?=
 =?utf-8?B?NWJoZ0IxMklaMlZaQWtmQ1JqMGdMWUJEYk1MbU9Bc2FYcVNhVS9vdXlSSmpt?=
 =?utf-8?B?SG9icit4bUZvOTZycWtTTnpkdmFaKzg3bmhEZmFDY211KzdpbHg2cG5Ib2xB?=
 =?utf-8?B?N3pOd24vOW1acTBicmhIdnMvV3o1djRZZk44TEtJeTdyaHVWTTRzTkVBWjdU?=
 =?utf-8?B?QVF4YmlIR3dWaW1oc0hkOGtTaE53OUtGdEtZcXRGbDJtQzVZTXRVenBmVU9v?=
 =?utf-8?B?OTNuREljaTBCaG5MZ3pZdU9wZzFtdm8zSlV2eDZyVDlYNWhUZmRGYWpKMEl0?=
 =?utf-8?B?UDVBdnlvRDhWbzhJZlpiTGVMaERPWnM5RjRxNWRiZHdvWXpPbGpsUnI1NVRW?=
 =?utf-8?B?MkJNd1c1VjJ1Tm41NjE2ZXhuQnJ4eS82YWtJSGxuTHJiZVBEbW00anZVbzZU?=
 =?utf-8?B?d3hlMlpybE5EdkpoS2FlQkd6dWtMU0pQNzZScFlJUTFIaUV5L1dkdEJUajh4?=
 =?utf-8?B?NVMvbUE5S0VSNy9yMndkRHpiU1lRV29jZlNuY2x3dE5ib2UrWC9PVWEzNVAx?=
 =?utf-8?B?Vkl5RVBlcm1uYzc5VUt5d05pY2xUMDczeUdPTDc1QTgzZzgraGFWeXYwNHEr?=
 =?utf-8?B?aUJ4ZTN6RzRBN3ZPdDJTVGRKR3NyOEI2ZHpFQlh5VTR4dGpzRjdGS1ZJSEdh?=
 =?utf-8?B?ODYxL0J4YTh2TSs3Lzg3T3F3R0lRZlRWN1dwaHo2cm4xRkZQT3RIK1NGODJG?=
 =?utf-8?B?RGpDQ1dNWWVqNUw5ampRRXh3YzdaMHZ6US9acm9DV1l5QXZCeUp6U3NINTJM?=
 =?utf-8?B?NHp5cEtWU29qK2dIY1dLd00veTV1SldvTGY3bTZLYVB3UzZpT3hGNkNuRUhZ?=
 =?utf-8?B?T1h2ckdXbjdRVmJ4L012b1VLOUdlK2RlUjZ5NGtWelYvM25DS09VL1Y3d1dt?=
 =?utf-8?B?bkRMQnhjZXd3dG5VRW9vUkdNSGFVUFhpWWc3UWRIamJENVJ4YUpWZUtubnIr?=
 =?utf-8?B?V1VjV0s4cmVPQmlPdkJ4eUxlcWZHcFdvbEQxNHhpc1EwaVNzSHZzNlRhUmxS?=
 =?utf-8?B?eFdVUVRsNW8wSm8vZHhkNm9hREU1MVdGYlZxb3BXUFNyTXRTMnN6ZzN6eEJJ?=
 =?utf-8?B?YnNrYWdKUjI2TGpFeWloeEt3Yit5ODhDbVd0NG9UVkFDWjRVSTJHQTFpcXdH?=
 =?utf-8?B?NmxoeXdraGdCRkNEQWJMN3l0cXZPRUo5RWgxT3VoQkQ2UUJVYjJGcTFuQlFC?=
 =?utf-8?B?QncxdDRUQ3VkTis2TkRTK2krMjBvNXViSS80cWc5SUNHTGlmQ1l2U3IzL085?=
 =?utf-8?B?VHNKNkx1QUVxdWRZOEJvOGpLTmtodHNpNHlPL3A3cGdPWEI4anhaRDBkNlZF?=
 =?utf-8?B?ZmtBenNWMGM1bmhoRk9aUU1BUXlTWkxHKzBSNGdzNFg5aURQbGorV2s2d1JS?=
 =?utf-8?B?dkxqb05RdzVyNWQxSllRRi83ZktiaVVBMk82TDVMdDI2S1M5MEhhYkY2VUgz?=
 =?utf-8?Q?1sjBmb?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR03MB6356.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rmkza0ZBczJlUVNnWllNaGxFRE9rbFh6YWpqS2FYNGRrTG9qNHFFRXl6NEdV?=
 =?utf-8?B?ZzhYV2NVZUV2TkZ1bitQbk04MXRHNUpQalR4WnVOZVVhRnpWU05NN25tZVB5?=
 =?utf-8?B?ZkF0TmFOTWpWbnkwYThQakd6U05xSnlyQTVXMjg5ZHhXOXMvcHRhU1pnZXpV?=
 =?utf-8?B?ODRoQm1JdEkrU3NCTDljays3QmlEb0JOc0c4cWhLNTJiWUpoY2s3cFhldjdC?=
 =?utf-8?B?bTFkZE9RMDFZYUpKb2NIMkdkOWhvc21WaFEwZW9La21hNHFYaXp2MEM0UTN3?=
 =?utf-8?B?TmkzQm12UENxbkJiTCtNUzQvTURndTR4NGdZeWZXbDN6SmxyRFBmc0M0dCtl?=
 =?utf-8?B?VTJGSUxvTlZBVjAvMUZmSGxBNXNSaWhGdExkQTZwaytuSDBQeC8rT3hsUnBa?=
 =?utf-8?B?em1ZTWVqcUZPVFY1OVo4Sy9ucWZwU1FFajU5NkxYU25CeTV0U2dxYnFWWDly?=
 =?utf-8?B?bTBYYldDZ3cxd3ZiMTRYanZKb3E0Z3hYdFEweC9tc0NyRllFeHVvb1AxREYy?=
 =?utf-8?B?c21xR2xldkw3aEU3R2pneXNNa2thM1ZsY25YTlh1aVpCVmp3eFEwQ0ZqTTlI?=
 =?utf-8?B?TXZ4TUVCT1FFSW56eDdvSW1ody83bTZOUmsxSDE2M2Jtd2hyQTlmK1hjU2Rm?=
 =?utf-8?B?ZlFoV0NLMjFXVDgwRWthcXNkOWF3M09acW0rUThrMzQ3cEJ0VE9DZkhLYWIz?=
 =?utf-8?B?aE1GYUVQQVZCRnFxOTFkNFdNKzNkQ0ZRRjRaOHFqa09JTHRaWjE1QkNhcDFl?=
 =?utf-8?B?SXp5SkRYQzVoNlVoY3RldjNXUWt1eVE3N1J0dHVIMEZCMit4MmFmSlFocE1z?=
 =?utf-8?B?Qlg5TlVmdkFNZ2lvZSs2eURrTklrR0s1RGF2bTZraGNCNkRxaEUxNVNZZkda?=
 =?utf-8?B?ZmdiQURoZWFKYzlvbGV5M3laOG1rdXlqd1lmTXlyalBJQTA4VDU2Ri9wRGRx?=
 =?utf-8?B?elFoNE91aHY0eGlNcTlzVjhBei9OeGxZNEw2TGdiOGFaYWMzVTBOTlZrZDZL?=
 =?utf-8?B?YVhYWjZvN1V5SzFlc0dBUFMzMk1yMzgxSjlDeXN2VXRQVEdvOTJLY2xJQ3VL?=
 =?utf-8?B?REx3cjVSeHpZOHdEY1dOeFFkc2M1b042N1g3cnp2US8wWmN0WGVub3c2eVd3?=
 =?utf-8?B?YW5paUFWU0tSR0lIOXhvc0lvbWdTVm1UdU13Mlk3cVBBR2tVYWE3Ni8zMzVR?=
 =?utf-8?B?TzZ2MklEWUtRTDkxQzVtbDBjY1JOMmVGeWY4d1RNa2tZejk2anNkVS9JcjFj?=
 =?utf-8?B?NlptS0dNdU1senZTbGRqS0RvaEhFcld6dGVwRGpmakxVakd1M3lmK00yaFl3?=
 =?utf-8?B?R2p4cE5tT1hhWjJHdlIwakl1SE00Qm1Ic0tWQWREcGdPeWJuVXM3UHkrZ0cv?=
 =?utf-8?B?bHF3WnZuaWhkczEyM3pCbUsrdXd1OUdmaVNxT2tFVHFjT0N5WnFEeGx2bFNl?=
 =?utf-8?B?TTFzVTl0S2QvUWRmUEV5QVljeFgvSTlhL3ZpSGN4by9QUnAzUkZTenR6WDNL?=
 =?utf-8?B?MllLWElGdzd1TGFmZkJtck5KODgxYkNVOVNDclJzeUpzWi9yQjZHSjZGRFBY?=
 =?utf-8?B?UitydndTRVNIY0NrWG1GcFh6SENFOXJCT1E4dWoxZWdKVmNabDM4Y2hmR2hO?=
 =?utf-8?B?OEFOL3BPOHczRUdNZW5mMTdCbkdNQ3NLT3dXQ1JSTm4vK1lTNDM5WGN1bGlF?=
 =?utf-8?B?YUExZzMrRXhJSjdNcDlxUlBISk9xcG9EalNMUjM0bnY3UmNPOCsvbGZ5aFVl?=
 =?utf-8?B?czI4SXUxeTNsTWRnb2cybkxhN0F1M3lpN2ZUTXNCTjJLV3RVV1JpdGFIdzlR?=
 =?utf-8?B?N3Bxd2xyd3NsSlhRZmQyZXhxbStzMUY1MDB1TWhlS2ZtSW54V3F5SU5RZmVV?=
 =?utf-8?B?MnNnQ05TdFJoRHVyUkJaV0RoaUJza0NnMVlEdmRrY0hHZ0dSUzA4dFYvRVZD?=
 =?utf-8?B?L2JDRVVtYVdKV1M3UEp2VUhNS3JoWlJYRlQ3WXBRK2t3MEFxRENEUk5hakYx?=
 =?utf-8?B?TFFmci81NzMvdnFTd0ZyRU1YOXBJM1k1N2FZM3I4YjZ1b0o5SG05VDB5d3pD?=
 =?utf-8?B?SGpJYUNkdGVqTEVoWWZCSWdUZTY1Ui9EQURqU3U4U0JZT2tXdjg2MmhxY1hO?=
 =?utf-8?B?UmdlL3VTR0ZLNDZXaDkvZEdMN1VRa1BBTW52ay9tWm5tdFZMTVN5aW5KNUNC?=
 =?utf-8?B?Zmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0FBE6547CD52EA46B47182408F4C7661@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6356.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d1362a8-068e-448a-ed16-08dd674e7e20
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2025 01:28:17.7614
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sWNo+xFe1K6+H4aHZLBMeBz3nWYQC1gU4ZXs5YcJ4aNhmcrNxqDRwhIKwreWpqyLX600Gfyz7Fo2IsdsQX/Hug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6712
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_182830_975011_ED397453 
X-CRM114-Status: GOOD (  15.56  )
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

T24gV2VkLCAyMDI1LTAzLTE5IGF0IDEwOjM0ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBs
aW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBz
ZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+IA0KPiANCj4gSWwgMTgvMDMvMjUgMjM6MjIsIE7DrWNv
bGFzIEYuIFIuIEEuIFByYWRvIGhhIHNjcml0dG86DQo+ID4gVGhlIFNDUCBwcmVzZW50IG9uIE1U
ODE4OCBkb2VzIG5vdCBoYXZlIGFuIEwxVENNIG1lbW9yeSByZWdpb24sIGJ1dA0KPiA+IHRoZQ0K
PiA+IGJpbmRpbmcgaW5jb3JyZWN0bHkgcmVxdWlyZXMgb25lIGZvciB0aGUgZHVhbC1jb3JlIGRl
c2NyaXB0aW9uIG9mDQo+ID4gdGhlDQo+ID4gTVQ4MTg4IFNDUC4gUmVtb3ZlIHRoYXQgcmVxdWly
ZW1lbnQuIEFsc28gdXBkYXRlIHRoZSBtaW5pbXVtIG51bWJlcg0KPiA+IG9mDQo+ID4gcmVnIGFu
ZCByZWctbmFtZXMgdG8gMSwgc2luY2UgYXMgdGhpcyBpcyBhIG11bHRpLWNvcmUgU0NQIHdpdGgg
bm8NCj4gPiBMMVRDTSBtZW1vcnksIG9ubHkgdGhlIENGRyBtZW1vcnkgcmVnaW9uIGlzIHByZXNl
bnQgaW4gdGhlIHBhcmVudA0KPiA+IG5vZGUuDQo+ID4gDQo+ID4gRml4ZXM6IDkxZTBkNTYwYjlm
ZCAoImR0LWJpbmRpbmdzOiByZW1vdGVwcm9jOiBtZWRpYXRlazogU3VwcG9ydA0KPiA+IE1UODE4
OCBkdWFsLWNvcmUgU0NQIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQ
cmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+DQo+IA0KPiBBcyBmYXIgYXMgSSBrbm93LCB0
aGUgTDFUQ00gaXMgcHJlc2VudCBvbiBNVDgxODgsIGFuZCBpdCdzIGF0DQo+IDB4MTA3MDAwMCBs
ZW4gMHg4MDAwDQo+IGV4YWN0bHkgbGlrZSBNVDgxOTUuDQo+IA0KPiBNb3VkeSwgYXJlIHlvdSBh
YmxlIHRvIHBsZWFzZSBjb25maXJtIG9yIGRlbnkgdGhhdD8NCj4gDQo+IENoZWVycywNCj4gQW5n
ZWxvDQo+IA0KPiANCg0KSGkgQW5nZWxvLA0KDQpVbmZvcnR1bmF0ZWx5LCBkdXJpbmcgdGhlIHRy
YW5zaXRpb24gZnJvbSBNVDgxOTUgdG8gTVQ4MTg4LCB0aGUgU0NQDQpyZW1vdmVkIHRoZSBMMVRD
TSwgcmV0YWluaW5nIG9ubHkgdGhlIFNSQU0gYW5kIGNvbmZpZyByZWdpc3Rlci4NCkZvciBkZXRh
aWxlZCBoYXJkd2FyZSBjaGFuZ2VzLCB5b3UgY2FuIHJlZmVyIHRvIFRpbmdoYW4ncyBwcmV2aW91
cw0KZGVzY3JpcHRpb24gYXQgdGhlIGZvbGxvd2luZyBsaW5rLg0KDQpyZWY6DQpodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyMjA3MTUwNTE4MjEuMzA3MDctMy10aW5naGFuLnNoZW5AbWVk
aWF0ZWsuY29tLw0KDQpTaW5jZXJlbHksDQpNb3VkeSBIbw0KDQo=

