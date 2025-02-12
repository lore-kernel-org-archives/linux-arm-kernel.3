Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C2A7C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 03:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tkLnQyUNhOAmlnFbB4SXu2GVuwfLceD+a65k/ZbNI8=; b=swGLXW3KK/ooIS9hPux9gc7SQw
	LCuKJVy0N+ofoL7ONMrtA21k9tr5eVDvEmjBYmA/OQ7whl9tQUxxe8jnkZ4r6XEPh9EEAulWkhwG6
	xpy0EoRt9F6FdKx7gYHePbgBMMswK0uLopLDGnuGRef4/audjexLV4T1W1c8/+soxcQbS0fAPpYO9
	XjjnRRyKtcyVQYGyb+WnxamC3g5H++hmaJZAERMpSCbRHZOW1MdUgZ3t1UxfKtHUEBIHu4CJxpZSm
	0DaaQXAvT/24TQPJc3+DywnppnXrgyFw8mi3HG+ZSd0gBjYPhdIKA157VN9Oi7bg6396pJfXZcEEJ
	kFmetl+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti3Lr-000000062vy-36do;
	Wed, 12 Feb 2025 03:23:51 +0000
Received: from [216.200.240.184] (helo=mailgw01.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti3JM-000000062Dc-1KgU;
	Wed, 12 Feb 2025 03:21:27 +0000
X-UUID: 69a4d04ce8f011ef82ff63e91e7eb18c-20250211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=+tkLnQyUNhOAmlnFbB4SXu2GVuwfLceD+a65k/ZbNI8=;
	b=JQaLoi2kP77AmUjw/JH5BJ+Re79zVHmmqDB93LT3zJYiMalOlBf1lRyM6lG6b6vvPX5L+mxAUQmIKE1hJWoOY2UgSomfNE3BFkyNSuXofYqONCaNe+DmAUw+Rrrl1UVdBuycWKLR4leXh85lus2j7lTWobyINzR2JqZj8l3P4V8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:637806fe-b8b3-4864-9e35-70f274987eb9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:bab054a1-97df-4c26-9c83-d31de0c9db26,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 69a4d04ce8f011ef82ff63e91e7eb18c-20250211
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <crystal.guo@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1846652009; Tue, 11 Feb 2025 20:21:13 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 12 Feb 2025 11:21:10 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Wed, 12 Feb 2025 11:21:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYUz2tmY0PDLqjxcPD0RPxxOQvTTREGVn1Zv0bpE9xI+qTKG/fCIRhkEkDnaqMH4NEsTIT9DpRN1dH9OgEXeb0xC2Yx7f9rFadVA1yXl8b/FgcdZ50m9Mb2e2inOgAbPnd2/lUicLrevDhhi2rIt8id31gbgkrYjIf3FWglHpbDsJNbcfZROQ0LqNng/xqIqaBml43nd4kyuKzHo//x+oCXmr//shr5B022/oeemXeVCb8nKdg3dWnguJsc8fkPjdWEfDz0UE1Ijgsi8eiC+h20QAHdbcG7mi4AZKq44+b1e27MUzqrKNKx6UZtQMx7hGuI+TRhQ5vLYRtr/7Woy2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+tkLnQyUNhOAmlnFbB4SXu2GVuwfLceD+a65k/ZbNI8=;
 b=f5DjMwvEyrd3GdmT92BU/FPrcu7+xqCMlgcDq7fVuEimZHFYBZ08O99JiJJmx3H6GOhN7fA581HSNzycYfKAbWOmsyhPN0Ax7nCXGVinLVpbXqKTdrrvwfeJo590WQm+omgnf5NwKlarwmh/iucDIzoi97V6oXa9Gu1NdyAny+n8+pIh2cYWEDhyqu/1xgYvZJopdoAlYO4iQjoChApu5JFDnej8nZ8eE5kWXgjlb1+PQmSlFkfdaQ2Jz8WOxIhQO7bbpGGUBKwemK7vOd0ASMpH0htlvnNHxQimOQP/aR3s09xpmg16hP61qK+7aB0n+dZc3BQAl9rFPscUQZHB+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+tkLnQyUNhOAmlnFbB4SXu2GVuwfLceD+a65k/ZbNI8=;
 b=pw/5lwJoavwmCnyZc89B1SWv+McTLly//oqkfvfBdgzyo55cBtklEgDwKoGg3R4kAr0fhBqja/pLBz3EnuGpsE+5UB4JgZeznelYRnn/wIF/kgjZmSufwaGzwrJFjuBCEl1jLZRNILwixF3d6wl66qcWerMiU9xygctIwXbfkco=
Received: from SI2PR03MB5468.apcprd03.prod.outlook.com (2603:1096:4:104::5) by
 TYZPR03MB7153.apcprd03.prod.outlook.com (2603:1096:400:33c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.12; Wed, 12 Feb 2025 03:21:06 +0000
Received: from SI2PR03MB5468.apcprd03.prod.outlook.com
 ([fe80::28b5:41ba:aefd:a96f]) by SI2PR03MB5468.apcprd03.prod.outlook.com
 ([fe80::28b5:41ba:aefd:a96f%7]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 03:21:06 +0000
From: =?utf-8?B?Q3J5c3RhbCBHdW8gKOmDreaZtik=?= <Crystal.Guo@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"krzk@kernel.org" <krzk@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH 2/2] dt-bindings: memory-controllers: Add mediatek
 common-dramc dt-bindings
Thread-Topic: [PATCH 2/2] dt-bindings: memory-controllers: Add mediatek
 common-dramc dt-bindings
Thread-Index: AQHbTHR51IFImiRpQE6zUN4tmCVA0LLicIEAgFq9ooCAAfpyAIADSB8AgAAxoICAAL8PgA==
Date: Wed, 12 Feb 2025 03:21:06 +0000
Message-ID: <88cb93d2dcf9db1aad5e5641bda0cb9ba73875fa.camel@mediatek.com>
References: <20241212090029.13692-1-crystal.guo@mediatek.com>
	 <20241212090029.13692-3-crystal.guo@mediatek.com>
	 <c978937a-e589-4e9a-ba37-265dbfc1b252@kernel.org>
	 <82cf93733dd14abfbcd17b100d1b3c40c6aed916.camel@mediatek.com>
	 <9302b338-9905-4720-ae41-c1e2713528f2@kernel.org>
	 <d54b010491c1c77a5be92920f8da4ba98722b180.camel@mediatek.com>
	 <57c789ba-1f61-4966-96ea-7a374094173a@kernel.org>
In-Reply-To: <57c789ba-1f61-4966-96ea-7a374094173a@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5468:EE_|TYZPR03MB7153:EE_
x-ms-office365-filtering-correlation-id: e1d978ce-653b-49e0-c68d-08dd4b1449aa
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?c2NkNUJPb0REL3FySVVGWEtnNjBRZDBxci9zazU2VStGZUliSFc0SG9jYmpJ?=
 =?utf-8?B?alVCT0FMTmRDdGFuc0VZTFFkdzRTY1RDTXEyOS9jWmU3SzlucEJ6eFQxYXpp?=
 =?utf-8?B?YUkrQjBZQ0VoS2FLeWlRTVdaMEdTR0Z5TE1KQVkyT2FaV2t1d2lIZHp4WGtP?=
 =?utf-8?B?amFBU3Z4d3RvRzl4M0dOakdldlJNMkE0RXNDcFRJS1hyK21ieDMyZmowUHBQ?=
 =?utf-8?B?d21UbG1FdnFCQ3RlY2dsZk9pNXR0M3JkMUUvL2RpR0ovd1BmUnROVWlGTUJQ?=
 =?utf-8?B?UlA4OWlObjJRdnlOMmw2SEs1Zm1LaFRuUi9acEx2TFdYK0FJRjF4b1dtR2l6?=
 =?utf-8?B?RXdodXhHQU9GNHArRE93bzg4ZDRlak1FV0N0cnBMVERzdlRJcjhoL2lIZUFT?=
 =?utf-8?B?Wk9rVGQvQUYxQUwzU0VyZTMyRmw2bG15Sm1tMTZhOStZdERiYmZYWVhnSHB0?=
 =?utf-8?B?V0h3VnExSlRXREpNKzJNTWxyVHl5dmZjbC9MaXhTZ2lpUTNySUdwdnowVkt2?=
 =?utf-8?B?VFpSaEFwN3Eycm5OZ3d1WUFSZW1DdFhjLzlmdXFRYjZGdTlOYlg1eUlNbzlO?=
 =?utf-8?B?YzVuNnlnd0x1Q1VXRldjMjNNMnJDM09PL2JDODNkSXFiUExVNUZ4aWxrb3J4?=
 =?utf-8?B?bW5ZWElZd3htZHpXSGhlOEZ0eUljQXFOSFA4aFkvYWRscEFNS3VxUHNHYmx5?=
 =?utf-8?B?cC9Id2UxNGV0VlJJWW0xMGNnT1BlNlZwMG1lUFl2MFArL1d0dk9CRnNHQjFz?=
 =?utf-8?B?TnhERW9Jb2x1bUl6V09kZUNxem9hWXlQL21LWUd0S256N20xalRpRk1mUVUy?=
 =?utf-8?B?U0llbXUvNmc2SHEwM1V5cjFFOThuejNwdXNwS1kyOTN2NjdLL0V6Nyt0MFQ0?=
 =?utf-8?B?NTZQcXhFdEpqMmxzSnZsZHMzeklrVTB4eXlrNm5vcUFGZWZKZy9SKzg4dE9j?=
 =?utf-8?B?Ukxpb0xPNGpkV3NTVmw4SHFpdlN2TkNaT2ZsRkFvRGtCQmwxWXh0RWVNM1gx?=
 =?utf-8?B?dG1KSlFyb05kL0dtNktGekErZE9TTXdZbFBvNE9WUTZHOUF0d2l6dnM2a3E0?=
 =?utf-8?B?eU4zRWM5ekxBVGRvMnF4ekd0V2RsNFBWL1h3aDhPVDBXbk9xeFdiNy9HZkZv?=
 =?utf-8?B?S3hhMVdjS3lsbGRrbjhyVGRIelpXVDJtUUFtVU04SlMxMlJKNG1XQVdRdVJP?=
 =?utf-8?B?WDQ5RUl0Q1dsMTVMaW8xQjkrbDhDYlllLzJYSndGd0J1V2tIOVdCSlk4OFdN?=
 =?utf-8?B?YUdZNWtRSHhxMHYyUVZmVXY1QjZGWG5UVWpWNkI2WlpKK1Eya29OazE4WHlE?=
 =?utf-8?B?NWtpelVnMk5OZGZzRjdGL2FiUk85cnpWM3l5dlp4ZE02L1dtejNiR2RQcHJp?=
 =?utf-8?B?SG9nMFNraGVjQXhvbmh0S0FITkl6RXdNZ1l4S2VadlhWQngyT09GbDQzbUVt?=
 =?utf-8?B?NEQ0NUNqYkN5RWJ5VTFNSmpDRlNUVGxHNS8xejlVMmZIdTdja1hhRnpuV2ZO?=
 =?utf-8?B?U1M1SCt3a0hiRXZLUENzNzZVY3hQb0VMeXlFU0RPOGZxSGJVazV6Ync4N1Er?=
 =?utf-8?B?K0lLNmY3Ui9kZStSbTcwbm91OTFncWtrelJCUzhOQmdxVzBqN1N4aCtoR0cw?=
 =?utf-8?B?OGM5Q1pFV01RcE5sL2UxdjlURVRqcTI0K00xQndNc2FRbjNmaDY3ZVlGSjhF?=
 =?utf-8?B?SHRTUFVKWlFoN3pZa0paaUFrVElIQmFtUDdNOVpITzBHQ0dlSnZCc1pibGI2?=
 =?utf-8?B?UC93bk0raktlQzFUeCtFWXFEb3RlcGlOdFpBekhTbmdGZTQzSnVMRXlYNDRl?=
 =?utf-8?B?RW1vOXc3d3VwY3NzRVA2ME1RYisxK0FNZG05YlV4TEE3SUkxblQrMXV6SWZm?=
 =?utf-8?B?RUpIOVVkSlc4d2h3NUwySTNnSEZScXlMdG5sLzRFMk43a2dNK0E5TkVnLzh0?=
 =?utf-8?Q?vfapYAl/UAHMB0XK6VLKfkQtKWhQ9Mqm?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5468.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UnFwMzVlNGIxdkdPZkd5UWRaendzZFE2WmhET0tzS3FJTFJNOHpvZFhyNzdv?=
 =?utf-8?B?WW8xZUVNYmFXdTRDTWhjRFBQOVczZThFeFV5MzRYekRlRGVHV25SRUxjaEM1?=
 =?utf-8?B?eGhFN0x0UCswMDFqaXBWRk1iaGxTUDlndTlvbXZnbnBGRlVsbWpxZ0c2a0Z6?=
 =?utf-8?B?SFd4cE5HeUJrT0Y2SndVcnhIaUI0Q3NXNkhYTll2OFNqL2l1Z0JBaklRTisy?=
 =?utf-8?B?bGFyWTQ4R012QnUycm1YSDdrbmNSNG5zbzZUcnFoMTl4a0JpYU8rQ05QY2Vy?=
 =?utf-8?B?cldCcWhaS0hYYm1aK1BuMVQ3cUZRVGhiaFlWR01ydG85SENXcXdKUndpa2xj?=
 =?utf-8?B?OW5POGtlMm55SW1oSEJNVUlrTm9KUjVySHh5Qi9XNmlkSVVhdjBheDRmYW0r?=
 =?utf-8?B?NldYVVRrdlZXbXhhLzdKVmppK0NWYWVWYlNoMUdibzFYVWowd1lnWktETkxH?=
 =?utf-8?B?c1NKUDRadDg2bmN0K2RuWUJNNDNoeG0xRmV0M3JCUUZGM2E3L3ExYitqUGQ5?=
 =?utf-8?B?bis1YkpCdHFVRWdwSkUxdUhMUllaWVJMS2RMYkE5SHJQUmVuUzFFb3ZGUHFo?=
 =?utf-8?B?MXJQZVMzSWxwdGRyNkZtVWQ3djRCOHhja09GS2UyVkV6YVhmelc4QmJQTUVo?=
 =?utf-8?B?VDIrWEFTVzVaK1NSUmZPQURvdzkveE9BeHpFQWxVbm83eFdjTHF2SkZNSmFo?=
 =?utf-8?B?MVRKL0RRblYrYkkzb0lBRG1NL2xvazNjNHZWWWovdTdWQlRGUmJFOTJlalNm?=
 =?utf-8?B?L1FkbE1iZ2xWazZVZjdVYnlNMFp0ZHNyZUErY1FVQzNRdHJQamNwWW0xbXRH?=
 =?utf-8?B?K2V3cXpPQ1ZhVWNpWVNDeUNBekdiOGVzRHB4VktSMWcrYkJhQm9YVVdvaUE3?=
 =?utf-8?B?bDZRamp5N0VSbkJWQm5HblRFMkN3OXdUT1lnYWhid3hsejV5cXU2QlJ3UUJp?=
 =?utf-8?B?bXhYRFpOTi9PaWlIUkVpZG1GdTVMam9zSkczUHZVSEhXK211MGtxMkpnS1Q4?=
 =?utf-8?B?d3p1Y1JqYjFCZUQ0VUFVcEtjc1hMNnJveHU1dEZmRmo0YWY5V2tsQ1p6b0dC?=
 =?utf-8?B?QjhGOEttQTZPcjF6ODYvUkpBUHdvaGtKV0MzL0czalRLRUluRGc3dXZOTmtN?=
 =?utf-8?B?d2tOQzB1WG1odDM1L0tFUFlrMkt6bDRlUXlyWExZMTVhejc0WEd0RFpZTjJo?=
 =?utf-8?B?NTMrV3EzUFo0bThiR2NnUDRrNFdtbDZjUDA0SlFTa0o1M3RNbVN6Rkk3K0VO?=
 =?utf-8?B?QUJxRWxhZ0J3Rm1xS0FyZHFNVm12SkNZbXNsUGwzNy9IYm5RZzhXZUQvalgy?=
 =?utf-8?B?c2VSVjA3YUFqZ0FJSmhJWU9rMDFQTnE3S2RBcklDUjhlWFdkWlhjVXZiQy9V?=
 =?utf-8?B?eHROd05lajdIeWRmUmFXYXpoY2t6ZjNoVm9OcWtQVG0yUVVKcGFnaFd3b3hr?=
 =?utf-8?B?c2ttRE1wWFl6YnJTRzRXc3FUS2RqSUlxN2M5ajB3Skg1OURRZ3pJaGxvb1VV?=
 =?utf-8?B?VFJVaCtVVjdTbXNSTklsMWF0am5iZzhlR2E4QkoxTVE5RGwrbTh1bTBiYjQ0?=
 =?utf-8?B?OFZ2SnluZkNMWkV6LzFYWmI1dGRiTGdVbnpPd3hyV3IvWFIzS0lkNnB1SmI1?=
 =?utf-8?B?U3ZtSkxaS1FnYUNjWEpaMmRUYjBkc2U1TC9YamIwK2RkbTRhSkRxWUJGdkNh?=
 =?utf-8?B?MDM1ek1QUlJwMlF2WkFHYmYySDh2cHNKcmpGRjNaRWJwRk5Cb0NYLy9Gc0JO?=
 =?utf-8?B?NkwraTFlTDhaZ0tIcHFYQmQ3UDh2ZVE3eCsvU1ZXeXNURDJ1RlU1TmQvazRI?=
 =?utf-8?B?ZkQ0MmxqVTIxMDRtL1kzZ09IYit3V0Z1UTIzMUpSTkEzbEo3VTNqSXZwOGRi?=
 =?utf-8?B?c3pIL0pGajcvS0lDbldmb2RNM0dDNWZBbFgzTUw1eC9yS2dQWFpudktvWXF1?=
 =?utf-8?B?cVZkaEZ0U0xkSkQyd29EM1hEVUVCRGRnUGg5cHhNdnVQSDV1WTdoQ1BFMFNV?=
 =?utf-8?B?Z0NoNGZON3o3dHN3eEJxSEdTOWhoSklOblJTcVFuRSszWjV5Y2FOZmhwUmNx?=
 =?utf-8?B?Vlo5YW1QMWU3VGlWQTZTSTBkRENKdUQ4VWpObHgxQzQxYlYwWkFyaVhZZjYr?=
 =?utf-8?B?eTkwWng2UHB6TjBzRzJYT2NJcnc3clB2TUpKZStIUXBDc1FzaE4vc2d2T1N4?=
 =?utf-8?B?K2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D98E8D058A2FF4F8F50EC399D0973B9@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5468.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1d978ce-653b-49e0-c68d-08dd4b1449aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 03:21:06.3563
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aUvcDKRBV0tGRSIQd+Ajoxkb0dPDI7Y8PAS2pT4BZ8AjT+2tnOg0rmqdj2TL/5Efdo6Huv6RcbR5WBRFv8tzLVtU8yQUPaQttn3CerAPLeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_192116_374593_8980863B 
X-CRM114-Status: GOOD (  20.70  )
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

T24gVHVlLCAyMDI1LTAyLTExIGF0IDE2OjU3ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDExLzAyLzIwMjUgMTM6NTksIENyeXN0YWwgR3VvICjp
g63mmbYpIHdyb3RlOg0KPiA+IE9uIFN1biwgMjAyNS0wMi0wOSBhdCAxMTo1MiArMDEwMCwgS3J6
eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gPiA+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRv
IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzDQo+ID4gPiB1bnRpbA0KPiA+ID4g
eW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gPiA+IA0KPiA+
ID4gDQo+ID4gPiBPbiAwOC8wMi8yMDI1IDA1OjQwLCBDcnlzdGFsIEd1byAo6YOt5pm2KSB3cm90
ZToNCj4gPiA+ID4gT24gVGh1LCAyMDI0LTEyLTEyIGF0IDExOjU4ICswMTAwLCBLcnp5c3p0b2Yg
S296bG93c2tpIHdyb3RlOg0KPiA+ID4gPiA+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5v
dCBjbGljayBsaW5rcyBvciBvcGVuDQo+ID4gPiA+ID4gYXR0YWNobWVudHMNCj4gPiA+ID4gPiB1
bnRpbA0KPiA+ID4gPiA+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRl
bnQuDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gT24gMTIvMTIvMjAyNCAwOTo1
OSwgQ3J5c3RhbCBHdW8gd3JvdGU6DQo+ID4gPiA+ID4gPiBBZGQgZGV2aWNldHJlZSBiaW5kaW5n
IGZvciBtZWRpYXRlayBjb21tb24tZHJhbWMgZHJpdmVyLg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+
ID4gPiBUaGUgRFJBTSBjb250cm9sbGVyIG9mIE1lZGlhVGVrIFNvQyBwcm92aWRlcyBhbiBpbnRl
cmZhY2UNCj4gPiA+ID4gPiA+IHRvDQo+ID4gPiA+ID4gPiBnZXQgdGhlIGN1cnJlbnQgZGF0YSBy
YXRlIG9mIERSQU0uDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gQmluZGluZ3MgYXJlIGJlZm9yZSB1
c2Vycy4NCj4gPiA+IA0KPiA+ID4gRG8gbm90IGlnbm9yZSBjb21tZW50cyBidXQgaW1wbGVtZW50
IHRoZW0gb3Iga2VlcCBkaXNjdXNzaW5nLg0KPiA+ID4gDQo+ID4gPiBCZXN0IHJlZ2FyZHMsDQo+
ID4gPiBLcnp5c3p0b2YNCj4gPiANCj4gPiBHb3QgaXQsIEkgaGF2ZSByZXBsaWVkIHRvIHRoZSBw
cmV2aW91cyBjb21tZW50cy4gVGhhbmtzIGZvciB0aGUNCj4gPiByZW1pbmRlci4NCj4gDQo+IA0K
PiBBaCwgc28gdGhlc2UgcmVwbGllcyB3ZXJlIGJlY2F1c2Ugb2YgdGhpcy4gVGhhbmtzLCB0aGF0
IG1ha2VzIHNlbnNlLA0KPiBhbHRob3VnaCBzdGlsbCB0d28gbW9udGhzIGFmdGVyIGluaXRpYWwg
cmV2aWV3LCBzbyBJIGFtIG91dCBvZiB0aGUNCj4gY29udGV4dC4NCj4gDQo+IEkgYXNzdW1lIGFi
b3ZlIGFsc28gbWVhbnMgeW91IGltcGxlbWVudCB0aGUgZmVlZGJhY2sgOikNCj4gDQo+IEJlc3Qg
cmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNClllcywgSSBoYXZlIHB1c2hlZCB0aGUgdjIgcGF0Y2gg
YmFzZWQgb24gdGhlc2UgY29tbWVudHM6DQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3By
b2plY3QvbGludXgtbWVkaWF0ZWsvbGlzdC8/c2VyaWVzPTkzMTQxMA0KDQpDaGFuZ2VzIGluIHYy
Og0KLSBSZW1vdmUgcHJfaW5mbyBhbmQgcHJfZXJyLCB1c2UgZGV2X2VyciBvciBkZXZfZXJyX3By
b2JlIHRvIHByaW50DQogIGVycm9yIG1lc3NhZ2U7DQotIFJlcGxhY2UgbW9kdWxlX2luaXQgYnkg
bW9kdWxlX3BsYXRmb3JtX2RyaXZlcjsNCi0gUmVtb3ZlIHVubmVjZXNzYXJ5IGdsb2JhbCB2YXJp
YWJsZXM7DQotIENoYW5nZSBmbWV0ZXItdmVyaXNvbiB0byBwbGF0Zm9ybSBkYXRhOw0KLSBSZW1v
dmUgbXRrLWRyYW1jLmg7DQotIFJlZmluZSBjb21wYXRpYmxlIHRvICJtZWRpYXRlayxtdDgxOTYt
ZHJhbWMiOw0KLSBSZWZpbmUgQ09ORklHIG5hbWUgdG8gTUVESUFURUtfTUM7DQotIEZpeCB5YW1s
IGJ1aWxkIGVycm9ycywgcmVtb3ZlIHVubmVjZXNzYXJ5IHByb3BlcnRpZXMgb24geWFtbCBmaWxl
Lg0KDQpQbGVhc2UgaGVscCByZXZpZXcgdGhpcyBuZXcgdmVyc2lvbiwgdGhhbmtzLg0KDQpCZXN0
IHJlZ2FyZHMNCkNyeXN0YWwNCg0KDQo=

