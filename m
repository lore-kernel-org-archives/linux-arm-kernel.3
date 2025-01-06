Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD61E77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 09:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QOMOlutyVvt+a/WEQFGjtWWkxrrzE9YrzyfWQSka2dw=; b=JUFTXOrRRolWYXvpKlFQUnlTZC
	Cjhyjxa6gm1+5rnHRnmRwPYjOc2gam0bW/xWFltTThKW+UPdHPqDb6OIbvJl+QHqO1rbj/KrYjZiN
	t96N+b8BxPE9BbpFH6g9e41bXN2Q21f+ZtMBtZRp1ZkNF0xM9G/mVAZ9ucdkcJ0lksKn7c6or7rnk
	F8t5Ilw0vQFu/O3fEWSzgqKd0XbYfrmZWDS+1P7yHvOXqSJCxU9L6kXWcKIvJ4ArsnRRAWotDjgLS
	GwOfMONWSkOzsSCcXHqFszTdhsGt2jTbtX9VMUtsDSNhpR9F+2LGMHGdafFH2ZpmB0NUYwzei+3Fp
	tIvLg53Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjTt-00000000heR-1fzW;
	Mon, 06 Jan 2025 09:33:05 +0000
Received: from [216.200.240.184] (helo=mailgw01.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjSg-00000000hSm-1kHF;
	Mon, 06 Jan 2025 09:31:52 +0000
X-UUID: 0bbeb91ccc1111ef82ff63e91e7eb18c-20250106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=QOMOlutyVvt+a/WEQFGjtWWkxrrzE9YrzyfWQSka2dw=;
	b=rknfRNUzSp/O8tC0yDMogZjXu9/MTDs1LtdL5Iptveu0igMlOszwQPYM/KJJxEoiesMQSALGU8v+1jFv+pJV4TG05cTSAduM4Q1d8pNNGzm/FIOpu8s4sAIwY+AMQJYvc1lyZtgC9hK5Ocq2TO1tViPcNI80gg0dFvgerHUadAw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:df6fb0ff-54cd-4f19-a3a1-f598a0544472,IP:0,U
	RL:0,TC:0,Content:3,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:3
X-CID-META: VersionHash:60aa074,CLOUDID:d0ab6719-ec44-4348-86ee-ebcff634972b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:4|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 0bbeb91ccc1111ef82ff63e91e7eb18c-20250106
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <jianjun.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1211944282; Mon, 06 Jan 2025 02:31:45 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 6 Jan 2025 17:31:42 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 6 Jan 2025 17:31:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xIbA7OxbonBsg8U1poPBr4SrWh1uXG7RLVIW2XTyD/IK5De569+WOFfif0X3tGGQy7VJjrB5DCw8o3kZstl2iW7iwxUVjZH9PhHg6wL+KgvaRVszJlURHmXPF+41x9/I+clmHdyonu3Ed8CvUkpc1wphhqbp//pjglyg30MJ0IZtApSHCo1RpMdojOZ7juFKCIQk4QlGZD56wZcpkuaDjs8N/FzGcYOpqqI2ANwKN8X35LJ115rpd6eM5st70nROhaQyGOFf1F3l6Vhwt/skuQWqs95PG3sfPIsnZ+EmibnA3ZHjwOGMDdpZisxrwrNsejMSkoXvZGzhhJ3/ln5V5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOMOlutyVvt+a/WEQFGjtWWkxrrzE9YrzyfWQSka2dw=;
 b=b9h86tDKrLG48YEtiG3GBbh8CNyOs4xGOtMDYd5b3254pqISS2wub85A9NF1BX+hevnDDUS5JgqlKIMc4vLuvsMAoG8b5eU8SVdkFR7rXV8LdNo91EW0JALkwX6d/vcKYnS62U6ksy1Ewu47jjHj0ASDRW/qoGgxH4fPq2WAWuDiTkA8H9pW5kVAORAutGapByG0fYwEO53/zhslZv2hNCMTs4kUlSvKbwIslfuXjQXzz5+bX8NW13FmdG1ypDbQci4zFLuJ0vh2VTVM6WXFA3a6YFnv9pI/ZoZSNMhN8vTPye0R9XsFxlKpi0eeuVckISwPV2myvpUiUvVSLUt48A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOMOlutyVvt+a/WEQFGjtWWkxrrzE9YrzyfWQSka2dw=;
 b=XGBWJKgkAfpqrdcmsQM452SJApwmQ5c5+S5z+rkHFtUl8chnkSAma7a7BJxdqNGgU0Uz4Jhe+1LWzF6vL+79X4gSDJXhqz+wcPHfAiYwfvrrCkA6VxXoWKKmj+qdf9Nwfmq5/52r0vrGE4INXncwlrUVY2hpJvX55thFqDEgyOI=
Received: from PSAPR03MB5365.apcprd03.prod.outlook.com (2603:1096:301:17::5)
 by SEZPR03MB7169.apcprd03.prod.outlook.com (2603:1096:101:e5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Mon, 6 Jan
 2025 09:31:40 +0000
Received: from PSAPR03MB5365.apcprd03.prod.outlook.com
 ([fe80::1c6e:6591:5151:27e6]) by PSAPR03MB5365.apcprd03.prod.outlook.com
 ([fe80::1c6e:6591:5151:27e6%3]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 09:31:40 +0000
From: =?utf-8?B?Smlhbmp1biBXYW5nICjnjovlu7rlhpsp?= <Jianjun.Wang@mediatek.com>
To: "helgaas@kernel.org" <helgaas@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "kw@linux.com" <kw@linux.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Ryder Lee <Ryder.Lee@mediatek.com>
Subject: Re: [PATCH 4/5] PCI: mediatek-gen3: Don't reply AXI slave error
Thread-Topic: [PATCH 4/5] PCI: mediatek-gen3: Don't reply AXI slave error
Thread-Index: AQHbXaTudx8xtE3Nc0iENJOHrgCzn7MFbZ4AgAQSswA=
Date: Mon, 6 Jan 2025 09:31:40 +0000
Message-ID: <ad4ecda30ac5ad59edfbe95b5c09edc6ccf11db0.camel@mediatek.com>
References: <20250103191948.GA4190995@bhelgaas>
In-Reply-To: <20250103191948.GA4190995@bhelgaas>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5365:EE_|SEZPR03MB7169:EE_
x-ms-office365-filtering-correlation-id: 0bfaa58f-581c-4605-2890-08dd2e34ecb7
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7055299003|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ajdVL3R3K0FQK0JvbUo2RmRvalp2dHFTVjBLaGp3REQ3WGVvYWN0bzRJME1T?=
 =?utf-8?B?NndoL3VDZWQ1U29UUWNRaUJ6VFh4NXBCQ3FYWDgyZDRSK3J0TDVQdTZTTklj?=
 =?utf-8?B?VjlxdVQrQ2xRRVlWcjhiWTNmbEIvRjRnRm05VGlaVnV0bi9NQjRxVXAwNmF3?=
 =?utf-8?B?ak0zajNQQXBBdGZhb042MVRQMnhOc29VWjR0WWd2WlBldVBSODF4NGw4dWlt?=
 =?utf-8?B?dXBIWjZJNFpzam55U2FGaDZFUjl6QmFwMzJHYm5aZHcyNnpuVWxJUTFqMyta?=
 =?utf-8?B?YWZKUEJHL3dGSHBhUmdRWFIyOE12NGRxWEFMWC8wQUwrT0YveXpMSk92dGlv?=
 =?utf-8?B?a2dicGFVam1odUoxeW85aVd6SmFvdDFKbVBnODdUSHpFdlNSbUtGT0JpYzBG?=
 =?utf-8?B?Rkc1VWQwMTdJaWlDOVVjRUF3bzE3M29zbkdRblhvTXBScng2QTNIcFNCUUxJ?=
 =?utf-8?B?c2ZnZHVpbTdSTjRCbkhUZ2NsK3JhMEtnYnBvZytpZ29uQkk5TFVHSmhIM21E?=
 =?utf-8?B?a3orNmJsTWxUcU1iY2lVWk1GcjdEMFJpRU5BdTVXWGZnaE5PekFEUVU0MU9D?=
 =?utf-8?B?TW9WamFZS25CUThDM2NPMm9qellQZnNaMHluakJENHc4ZEZmZTJQQ1d5TGhF?=
 =?utf-8?B?bVJCcUtOcFVmLzV1VEwzTExvMHpzUEZja0ZoYXVBNGEvMmNndzdkWU12cGRD?=
 =?utf-8?B?M2l0aVY3UTk4VzFjdGd0aW1wVFZYbWM0YzNYeFh3U0FaSy9YN3ljK3RMT1NG?=
 =?utf-8?B?QURLbFdONVoxcGJYZnNkN3NnUFdKQmkwbE1vckFWc1pQRnJGb0dpenFqMWRQ?=
 =?utf-8?B?ZVRLaHYraGpUVzZNMnVPZDlDY2p2WFc0cE9oNFdxdGJqVHR0RlgzWGxSTXN2?=
 =?utf-8?B?T1FQL1ZxMlZxcHNQZDYwMkhYVVpEWjlXWjNmNVY1Y1pOQXlzcUtJM2RMWGZx?=
 =?utf-8?B?a0ZyRGJIYitvY2hkL0dpRTBqZ0t3a1ZKanFrdm51OERzTHZMZ1o3NXBPSEZR?=
 =?utf-8?B?dHUwZk5IWXNUWUNpSjJ0Vm5NM1Y0RUl2UVBwVWhValpsZHNha2VZVzBZOGhD?=
 =?utf-8?B?YmhJKy9HYStCL1FWYXkvcUpUc3hjbHJyVGtRZ3FpRk0wTTVwak8rb2JITVFz?=
 =?utf-8?B?MFI5RDlJcVUya3FEZGk2blFoek5uVlB4d2FqSS9uMUdnVy9EWnZUeGxDb2Zo?=
 =?utf-8?B?WHpJVDdRK29lNC96NjUwMmJrYUswOFdhZlF0Yzl4WXdaQ2tzY0N6TklOdGEv?=
 =?utf-8?B?MEdOcE1lTC9wTnFHSjlQUGdwdEhTRW5qWHZ2UVVYZG5icWsvT000ZmFmMXk3?=
 =?utf-8?B?RUpsemZYNEZiRXRaSEpqK3RtWjgwMCtJYjVwNmNkZ0JHZndRNFJwTVJ4QmJi?=
 =?utf-8?B?MDQrZnZOelNmVjBzeUNZY0ZBMmlvSDFTeDBrWWxCR09KdU0xMDh1dHhGNStn?=
 =?utf-8?B?Uk9hN0NGREh2ZWlmNUw1RGhtZVlJaVk3dXZRSWt4YmtRQXFRbExYUEs0Yzhl?=
 =?utf-8?B?NmVPQUUrWDZxWitzb2ZTeXJvWEhwN0NoRzhFYklrMllPWHEwOGVyd1QzTXg5?=
 =?utf-8?B?OE1HbkgrZFRGSHZKREVHMS9UODhMSVBZeGZCbHQ0b2ZWYVE5UU5VNTIyU0RW?=
 =?utf-8?B?cnc2V1FDL3VhTzBIWWZmekJ5S0pHSW1uUGJhVVZCQlJockdmT2hJN3BmQWtL?=
 =?utf-8?B?R3RPcFU1T3N6SnNsejhVeURTeDl4VDlTcWxMMzhUMlNYRXFrbE15WHFibWNw?=
 =?utf-8?B?K3EwTWEyWjlBRk9jOTV1SXFEbXJ1QWFHWStsOC9TOFArVS9nODlDTG4rK3Rt?=
 =?utf-8?B?Zk1nOXhtenVFVEtjUjY4NkZhWFhmeGl4bkxiWXZTZjQvclJ6UGZJN0hmZE9x?=
 =?utf-8?B?aDNrKzg2eXBRUlNaWitkMzY3NE5OS2VqNWdSK3NSN25hUmk3Ky9Kb2F1ZWs1?=
 =?utf-8?B?ZFB1dy8ySXRRenRLbW0vWmpiOHViTzJMNm1DTHRtVGh1L2dsR0pYSkptNHB0?=
 =?utf-8?B?VGpDWGV2VTFRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5365.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7055299003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K09ZY2F1YmhFc0RBVEJWeTdnUnAyMHk4OTVPbzdKcUE4MHFZR0pzdnQxSk5W?=
 =?utf-8?B?UkplVGowR0hwNWJMTUZndXl4b3FnRWdWYmp1TU1CT2lmMVVhSU9lOGlTQ2Nt?=
 =?utf-8?B?SFZkbHNaK0djMXhlMk8zTytOaEJSWjdmSWlEaFplMVVKaE4rOE9HanpNT0pC?=
 =?utf-8?B?SmtmQ3pYa20wQWw2b1BzZTZndWVOZFRIOTVXOTNyNGdLQjRvVnlZOWtweWhL?=
 =?utf-8?B?ZmMzTGZwWEdJeDFWNllVWC9MeHJaMXpiMDNCOWE3UE9BbFdYeUVhUng5R1JX?=
 =?utf-8?B?SDd1SzNsOHh0QkZGazQ4RlVMM2ZHWmZYdjE2UWgyLzRxYUpMNmlRRlc5S3kw?=
 =?utf-8?B?aXEweS9YUlgxbmJtVjdaTFJPVXpaZHkzY2h1VTl1dVpQWStrMDZQbHloZE0r?=
 =?utf-8?B?dTVkMzZ3Y0hHTVFnalNqOHRwTC8yMHoyWkc5cDdveUhWT1BINDZNTHNXRk5M?=
 =?utf-8?B?OUFkM0FxWTNIUFkyY2xncDJZT3lhSFJVVUQvR1RwYzVINTVHcW5hd25HeE5F?=
 =?utf-8?B?eG4vUHlPSW1NUXU3MUZlU2pXL2RkakdLQkg3c1dROFZZZVdUWlBWWFduaXVY?=
 =?utf-8?B?bVN4bG5UbHQzcU05YVhDUC9wZVRsa21DUDNPMUhFK25iQ1J3WEdmaTNXc3Aw?=
 =?utf-8?B?QVRHdVVrRllmV0xJd0w2SFBKcUdGekxrK0dFWktZaERQaThlZTVISGhWNm5E?=
 =?utf-8?B?YWYzRFhQbzROalByUEplTkluLzJXNGxEY095YXZWS2tjWXJCT1pSWE5xQlBa?=
 =?utf-8?B?YzZld0NUcCs1cUR2aEJ1dGNrczJJdll6YWV2Y1JLd3BaWS9odGlxUXZ4ZzJu?=
 =?utf-8?B?bmdrcWdrSEpZYUtybENhWUdEeG9GVEU4U1ZEVGgvUGxWK3JwMzdtTzMwSk9O?=
 =?utf-8?B?V0VZQTVCcUYxK3oxVTNLa3IxZm55Y2t4N0JuUXZFNGlrVmZaS2ZtZXdGMUE5?=
 =?utf-8?B?azhIblU4dmYrR0RDZGtlNDdCSDNXZ2tjaTJldVAwQzA5aGJZeDNIY1VZbzVL?=
 =?utf-8?B?Z2lva3FWV1o5eEN5ejdWRE5ORURTZ2FObm93ZEdpYmZ4aERJU0IzM3Uvd0V0?=
 =?utf-8?B?LzZVOEkzdTh2WDhGV2crd3cvZ1R3aTQ1bFBoSDY4ZXF4MHZEYjZlUXc2UmdJ?=
 =?utf-8?B?NGFKTkp3b0JCcjFwbHFkbzRNQWczRDlJdFN5SkhtN2MvVDV2RXJnNFEzUjZw?=
 =?utf-8?B?dkMzR0QwOWFjaXJ2Rk5PYXNhbzQ5V3Y5SkkzVlUrbzBMT2RXKzh3anFObE1P?=
 =?utf-8?B?dXpUYTJRclFac2d0Z3RQSFhDMkVwRGVsaHMzcGFjTjVUS29kUVNzTXk2WDRv?=
 =?utf-8?B?U0xtd3Z0am83OExGNk5MMmhMTTBZS0o3VWJLM203UUVxYTIycEFhRXpYM1l5?=
 =?utf-8?B?S3FPbW9tRVBOR2RmaGVmUWQ0YzU3eGRoako3OWJyekR4VDliejRqMXNUREQ3?=
 =?utf-8?B?TkpENVp0cG1EUGgyTWZ2TEJzdEU3VXpYNEVHK0t6TnZUcE92dVN6dDU0Zy9w?=
 =?utf-8?B?RGpUU09lZ2JGZWsxbVRGTlJYcXBxdzhsRk5iQ1YzZWNFNnZmVWpTeWFuazFP?=
 =?utf-8?B?ak8yY0N6Uk9FWXVIcXZ0LzNCL2hrWWlya0J5RVQ4Q2t3cndPY3Y2QnUxSmg2?=
 =?utf-8?B?TWdHMXd4SnhqMy9ycEZXeDZ1Z1VMaFAvQks5eUVWcXRySGd6KzcyNno4Qk5v?=
 =?utf-8?B?ckVRMTN2VUdtblBaMXNqOXhrOWxjU1d0M2N4MjRPV3ZZV3poUHVZb1d2L01Z?=
 =?utf-8?B?RWcvVTY4d1lsTndvSzIrUURSaDk4QitVR2NsUVdHVUdMRkczMkF5VkJZMU8v?=
 =?utf-8?B?M05mc0FiQUZCSWR1bnhMcUtlQlFVS1N4U0swUWJ3VXJaUjYza0xpeTdaS050?=
 =?utf-8?B?VWtGQ25XQ0NrU2pxd3FydlFjd2NReFVjZTBDZ3RyNXVGRkdXMmxsb1c1RmIz?=
 =?utf-8?B?T1N4WnZYRUlqU2pyZjZmOEI4VjZBQVlRRXowMzZDdnFpcWo5cGR4SVdrTjNK?=
 =?utf-8?B?c1pKaFF5c2ZyRVZwQVJrYm5NeS9XMzUwZjl2SlJPc2plU0N4VzBSMld1ODBn?=
 =?utf-8?B?UFlESTBNWnpCT2RVbkZ0QWorZ1dkY3AvUk91NVRhWkZoZDVidFNDb0FOSEZF?=
 =?utf-8?B?RjhHaWJacTZRRVd0cyt1TUN4R2Y3Ky96dVFINk9IQVo3UDRMemduZWJRVTBF?=
 =?utf-8?B?Rnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B9E2D2D3CEC76D42B9745F7605F92ABC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5365.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bfaa58f-581c-4605-2890-08dd2e34ecb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 09:31:40.0541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I+ns/rALH4hwaujIrtlIVN2IWAj3Y2y7bm9CdPMcOokqcJ2+O5B15eRISQ4d3rCg7WTk1wk8al8Ja54deAdgJyfPlL65wrx69iugWHP4+JI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_013150_481637_D8060F4C 
X-CRM114-Status: GOOD (  24.67  )
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

T24gRnJpLCAyMDI1LTAxLTAzIGF0IDEzOjE5IC0wNjAwLCBCam9ybiBIZWxnYWFzIHdyb3RlOg0K
PiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250
ZW50Lg0KPiANCj4gDQo+IE9uIEZyaSwgSmFuIDAzLCAyMDI1IGF0IDAyOjAwOjE0UE0gKzA4MDAs
IEppYW5qdW4gV2FuZyB3cm90ZToNCj4gPiBUaGVyZSBhcmUgc29tZSBjaXJjdW1zdGFuY2VzIHdo
ZXJlIHRoZSBFUCBkZXZpY2Ugd2lsbCBub3QgcmVzcG9uZA0KPiA+IHRvDQo+ID4gbm9uLXBvc3Rl
ZCBhY2Nlc3MgZnJvbSB0aGUgcm9vdCBwb3J0IChlLmcuLCBNTUlPIHJlYWQpLiBJbiBzdWNoDQo+
ID4gY2FzZXMsDQo+ID4gdGhlIHJvb3QgcG9ydCB3aWxsIHJlcGx5IHdpdGggYW4gQVhJIHNsYXZl
IGVycm9yLCB3aGljaCB3aWxsIGJlDQo+ID4gdHJlYXRlZA0KPiA+IGFzIGEgU3lzdGVtIEVycm9y
IChTRXJyb3IpLCBjYXVzaW5nIGEga2VybmVsIHBhbmljIGFuZCBwcmV2ZW50aW5nDQo+ID4gdXMN
Cj4gPiBmcm9tIG9idGFpbmluZyBhbnkgdXNlZnVsIGluZm9ybWF0aW9uIGZvciBmdXJ0aGVyIGRl
YnVnZ2luZy4NCj4gPiANCj4gPiBXZSBoYXZlIGFkZGVkIGEgbmV3IGJpdCBpbiB0aGUgUENJRV9B
WElfSUZfQ1RSTF9SRUcgcmVnaXN0ZXIgdG8NCj4gPiBwcmV2ZW50DQo+ID4gUENJZSBBWEkwIGZy
b20gcmVwbHlpbmcgd2l0aCBhIHNsYXZlIGVycm9yLiBTZXR0aW5nIHRoaXMgYml0IG9uIGFuDQo+
ID4gb2xkZXINCj4gPiBwbGF0Zm9ybSB0aGF0IGRvZXMgbm90IHN1cHBvcnQgdGhpcyBmZWF0dXJl
IHdpbGwgaGF2ZSBubyBlZmZlY3QuDQo+ID4gDQo+ID4gQnkgcHJldmVudGluZyBBWEkwIGZyb20g
cmVwbHlpbmcgd2l0aCBhIHNsYXZlIGVycm9yLCB3ZSBjYW4ga2VlcA0KPiA+IHRoZQ0KPiA+IGtl
cm5lbCBhbGl2ZSBhbmQgZGVidWcgdXNpbmcgdGhlIGluZm9ybWF0aW9uIGZyb20gQUVSLg0KPiA+
IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEppYW5qdW4gV2FuZyA8amlhbmp1bi53YW5nQG1lZGlhdGVr
LmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLW1lZGlhdGVr
LWdlbjMuYyB8IDEyICsrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3Bj
aWUtbWVkaWF0ZWstZ2VuMy5jDQo+ID4gYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbWVk
aWF0ZWstZ2VuMy5jDQo+ID4gaW5kZXggNGJkM2IzOWVlYmUyLi40OGY4M2MyZDkxZjcgMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLW1lZGlhdGVrLWdlbjMuYw0K
PiA+ICsrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tZWRpYXRlay1nZW4zLmMNCj4g
PiBAQCAtODcsNiArODcsOSBAQA0KPiA+ICAjZGVmaW5lIFBDSUVfTE9XX1BPV0VSX0NUUkxfUkVH
ICAgICAgICAgICAgICAweDE5NA0KPiA+ICAjZGVmaW5lIFBDSUVfRk9SQ0VfRElTX0wwUyAgICAg
ICAgICAgQklUKDgpDQo+ID4gDQo+ID4gKyNkZWZpbmUgUENJRV9BWElfSUZfQ1RSTF9SRUcgICAg
ICAgICAweDFhOA0KPiA+ICsjZGVmaW5lIFBDSUVfQVhJMF9TTFZfUkVTUF9NQVNLICAgICAgICAg
ICAgICBCSVQoMTIpDQo+ID4gKw0KPiA+ICAjZGVmaW5lIFBDSUVfUElQRTRfUElFOF9SRUcgICAg
ICAgICAgMHgzMzgNCj4gPiAgI2RlZmluZSBQQ0lFX0tfRklORVRVTkVfTUFYICAgICAgICAgIEdF
Tk1BU0soNSwgMCkNCj4gPiAgI2RlZmluZSBQQ0lFX0tfRklORVRVTkVfRVJSICAgICAgICAgIEdF
Tk1BU0soNywgNikNCj4gPiBAQCAtNDY5LDYgKzQ3MiwxNSBAQCBzdGF0aWMgaW50IG10a19wY2ll
X3N0YXJ0dXBfcG9ydChzdHJ1Y3QNCj4gPiBtdGtfZ2VuM19wY2llICpwY2llKQ0KPiA+ICAgICAg
IHZhbCB8PSBQQ0lFX0ZPUkNFX0RJU19MMFM7DQo+ID4gICAgICAgd3JpdGVsX3JlbGF4ZWQodmFs
LCBwY2llLT5iYXNlICsgUENJRV9MT1dfUE9XRVJfQ1RSTF9SRUcpOw0KPiA+IA0KPiA+ICsgICAg
IC8qDQo+ID4gKyAgICAgICogUHJldmVudCBQQ0llIEFYSTAgZnJvbSByZXBseWluZyBhIHNsYXZl
IGVycm9yLCBhcyBpdCB3aWxsDQo+ID4gY2F1c2Uga2VybmVsIHBhbmljDQo+ID4gKyAgICAgICog
YW5kIHByZXZlbnQgdXMgZnJvbSBnZXR0aW5nIHVzZWZ1bCBpbmZvcm1hdGlvbi4NCj4gPiArICAg
ICAgKiBLZWVwIHRoZSBrZXJuZWwgYWxpdmUgYW5kIGRlYnVnIHVzaW5nIHRoZSBpbmZvcm1hdGlv
biBmcm9tDQo+ID4gQUVSLg0KPiANCj4gV3JhcCB0byBmaXQgaW4gODAgY29sdW1ucyBsaWtlIHRo
ZSByZXN0IG9mIHRoZSBmaWxlDQo+IA0KPiBBZGQgYmxhbmsgbGluZXMgYmV0d2VlbiBwYXJhZ3Jh
cGhzLg0KPiANCj4gQUVSIGlzIGFuIGFzeW5jaHJvbm91cyBtZWNoYW5pc20sIHNvIGlmIHlvdSBk
aXNhYmxlIHRoZSBTRXJyb3IsDQo+IHdob2V2ZXIgaXNzdWVkIHRoZSBNTUlPIHJlYWQgdG8gdGhl
IFBDSWUgZGV2aWNlIHdpbGwgcmVjZWl2ZSBzb21lDQo+IGtpbmQNCj4gb2YgZGF0YS4NCj4gDQo+
IEkgaG9wZS9hc3N1bWUgdGhhdCBkYXRhIGlzIH4wIGFzIG9uIG90aGVyIHBsYXRmb3Jtcz8gIElm
IHNvLCBwbGVhc2UNCj4gY29uZmlybSB0aGlzIGluIHRoZSBjb21tZW50IGFuZCBjb21taXQgbG9n
LiAgT3RoZXJ3aXNlLCB0aGUgY2FsbGVyDQo+IHdpbGwgcmVjZWl2ZWQgY29ycnVwdGVkIGRhdGEg
d2l0aCBubyB3YXkgdG8ga25vdyB0aGF0IGl0J3MgY29ycnVwdGVkLg0KDQpZZXMsIHdpdGggdGhp
cyBiaXQgc2V0LCB0aGUgY2FsbGVyIHdpbGwgcmVjZWl2ZSB+MCBkYXRhIGlmIHRoZSBFUCBkb2Vz
DQpub3QgcmVzcG9uZC4gSSdsbCBhZGQgdGhpcyB0byB0aGUgY29tbWVudCBhbmQgY29tbWl0IGxv
Zy4NCg0KVGhhbmtzLg0KDQo+IA0KPiA+ICsgICAgICAqLw0KPiA+ICsgICAgIHZhbCA9IHJlYWRs
X3JlbGF4ZWQocGNpZS0+YmFzZSArIFBDSUVfQVhJX0lGX0NUUkxfUkVHKTsNCj4gPiArICAgICB2
YWwgfD0gUENJRV9BWEkwX1NMVl9SRVNQX01BU0s7DQo+ID4gKyAgICAgd3JpdGVsX3JlbGF4ZWQo
dmFsLCBwY2llLT5iYXNlICsgUENJRV9BWElfSUZfQ1RSTF9SRUcpOw0KPiA+ICsNCj4gPiAgICAg
ICAvKiBEaXNhYmxlIERWRlNSQyB2b2x0YWdlIHJlcXVlc3QgKi8NCj4gPiAgICAgICB2YWwgPSBy
ZWFkbF9yZWxheGVkKHBjaWUtPmJhc2UgKyBQQ0lFX01JU0NfQ1RSTF9SRUcpOw0KPiA+ICAgICAg
IHZhbCB8PSBQQ0lFX0RJU0FCTEVfRFZGU1JDX1ZMVF9SRVE7DQo+ID4gLS0NCj4gPiAyLjQ2LjAN
Cj4gPiANCg==

