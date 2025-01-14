Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EACC02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 03:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/SDz23OOH061YR4/h6wymCHTk7jYZPG28lAqT0TcPE=; b=O9+XMs2zm1+dld7r2R0OU3UET4
	bjXBUvtYhA5qo5fLrrUTjJQZHpX92LoR34+L4pZKNJ5zt6QgskNwFL0sEuThofOjcT3doS/uniJVa
	yLaNIpca0RsDeSvpYKZ53JuAIftUKqzppQZxv+TK0srd1ct4LDaIIRioeIekfpdbHdB92WMBiy3qF
	erfrgfE6MxhQd3wmMA/HcpR5aNYX12/JJDuWCJXdjV15NlfkRlZR0RNTnQUGK/ZjZsGnoX8Rw2ugV
	zK9gv7JjDKNt2VuFRpxgbB7T9hrmd+QjUtxlFFnzHcn90lmjhAKlxkX7bfKUyu/sTUapLTu41wM9v
	EelCXHjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXXMZ-00000007Jkt-2eBl;
	Tue, 14 Jan 2025 03:13:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXXLJ-00000007JbZ-3pFD;
	Tue, 14 Jan 2025 03:11:51 +0000
X-UUID: 46bf9a3ad22511ef82ff63e91e7eb18c-20250113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=9/SDz23OOH061YR4/h6wymCHTk7jYZPG28lAqT0TcPE=;
	b=bFtexnOjZbTEq5dlZV36fzH+Af9riAB//jdePNuDC4aTReNyAaD8j5aE6qj6O7luAVc8nhhm1qlaMCXXE0QOlse2Z3uIKs7JSwYT9fhsfQF2hs9FFz+pkWs3sEu1ZrdmPYG7D69QYJdWpmGOoQ2FdUE1150FLn2gElk/o9D2bGA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:5a4e969a-66bb-465a-9346-dd1a5afd4f7f,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:60aa074,CLOUDID:13c47413-8831-4185-8e40-f83b1917e828,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 46bf9a3ad22511ef82ff63e91e7eb18c-20250113
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <shiming.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 486801309; Mon, 13 Jan 2025 20:11:41 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 14 Jan 2025 11:11:38 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 14 Jan 2025 11:11:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jqzHfCa12e2JsXC8ny0htYQhRuFRaHnYQBlJYF5LAActDcSazvtEBcQ505JErnUrBermtpq8E42ljqRRM+dxQKBLUtDmYzsHPgs4bLpv38igYoYpwzvWSQZD8glGkYIJozMg5p1f1tIfxafIHmeKKsz+SJZYEgfaTdJmojWzlzk4iG3DHl5MlvOUNlCf9Sm8zzylGX3Pg4Kdeil+uHc2Dp2TVlrqYtoSsMk/OBe9uIdwXMOGs7G3cBNmpSVbBVxL1/caSpE75DfP26hjaRwHbmtI1XUddRb9V/4AUtgKL+zaZnb9wKsHmfHOqGUBkmv0Quifmpyz5xYnstw8gV4x6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/SDz23OOH061YR4/h6wymCHTk7jYZPG28lAqT0TcPE=;
 b=acRKx3NHWAC/7v4sFKUMu12n5jZ3r/2IqLPzxPQBIFXk4ji2/ImtdiYdWN5ih+Kd3HJjFguBBj7xpEzhtnoTwUPxdAWNpfnCXxp/E8UT+ssmwN8MrO9Ua+51rhpdz/bh4tL+4YtcbQo1z6e/55EjDSgix+hmEEEl/Uo9GIYrPA5gh3PBqVbCjbBvVxXpJlbWnxQ7hc1HHi9mnVDzmjGX6XsvuGxxpiQUZyRmzOMhgGCQEjWsopKmqn5fhbZjQPhEp5cXZPts9RMKaLYbrnDvE+ZLqlIAXIjPbALG0YevbGHNnysVOfZAJEHR4l2SnF0xkJra3ySllfGIttLi7OR9BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/SDz23OOH061YR4/h6wymCHTk7jYZPG28lAqT0TcPE=;
 b=daqUzKBagOkJdKe8LiOCP6EKQ1toXQ9wKrO+Kd1T6pE9YiEbUVCzdzMBZwrpjZesbavXpxVJHDdmCa4Hsp1cvrYGqQgT4qAtcKYaOSuCkqlfpyrollGuZt8+OKyMw/gT3gNn0wsOepgLIrWPKqtm3Fsu6YMUWYjJSQ5lawnZ1q4=
Received: from TYZPR03MB7963.apcprd03.prod.outlook.com (2603:1096:400:451::12)
 by TYSPR03MB8544.apcprd03.prod.outlook.com (2603:1096:405:53::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 03:11:36 +0000
Received: from TYZPR03MB7963.apcprd03.prod.outlook.com
 ([fe80::74b:1a26:a3e0:7d51]) by TYZPR03MB7963.apcprd03.prod.outlook.com
 ([fe80::74b:1a26:a3e0:7d51%3]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 03:11:34 +0000
From: =?utf-8?B?U2hpbWluZyBDaGVuZyAo5oiQ6K+X5piOKQ==?=
	<Shiming.Cheng@mediatek.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"dsahern@kernel.org" <dsahern@kernel.org>, "horms@kernel.org"
	<horms@kernel.org>, "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "edumazet@google.com" <edumazet@google.com>,
	"willemdebruijn.kernel@gmail.com" <willemdebruijn.kernel@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "davem@davemloft.net" <davem@davemloft.net>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	=?utf-8?B?TGVuYSBXYW5nICjnjovlqJwp?= <Lena.Wang@mediatek.com>
Subject: Re: [PATCH net v2] ipv6: socket SO_BINDTODEVICE lookup routing fail
 without IPv6 rule.
Thread-Topic: [PATCH net v2] ipv6: socket SO_BINDTODEVICE lookup routing fail
 without IPv6 rule.
Thread-Index: AQHbXaIcTtnwFPYChUWrZVTAQZ/kp7ME2d2AgABT5ICAEHvYgA==
Date: Tue, 14 Jan 2025 03:11:34 +0000
Message-ID: <5dbb7b8db7f4d31b620e5780e4716a9881252534.camel@mediatek.com>
References: <20250103054413.31581-1-shiming.cheng@mediatek.com>
	 <76edb53b44ba5f073206d70cee1839ecaabc7d2a.camel@mediatek.com>
	 <8645aa77-eb46-4d87-94ce-97cd812fd69e@kernel.org>
In-Reply-To: <8645aa77-eb46-4d87-94ce-97cd812fd69e@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB7963:EE_|TYSPR03MB8544:EE_
x-ms-office365-filtering-correlation-id: fa61d979-2106-407b-8a74-08dd34492708
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?SUZGQXlqOWNtU3lrZXJTNnliY0U3RlVBYy9LWEJOY0paRUF2TGFMK1hXWlRR?=
 =?utf-8?B?a3UvRTFSSzk5SVlnVWVneWt0eXdwa1RxVW9NRm9TRGFaNTBiWDVpR0g1NjZL?=
 =?utf-8?B?enJSejY0VnpkNVNBc05rV0lITHhOVEZDMVFmUkdZRmtJc1FZQXN2anc2YW1Z?=
 =?utf-8?B?aW1vWCtSUWhYRUUzN2hSRUxRZCtEQ1Q1WUxWRFVoN3VlSUJ4MHlWVGtJbUZa?=
 =?utf-8?B?NytQY3VNVkkwMTVIMUhISVdBTVJKS0xxZEUrWE81c05FWkFvbzBCVEQ3SDRx?=
 =?utf-8?B?QzdxUTBaV0xxWFI3ZGJsMWNWQm1WT0o5ZHpTZzEzckU3R3gycmwySFNhQ2dy?=
 =?utf-8?B?ZVFyd1dvSmdydUovb1ZQTTlXcWUzeHoyRXQ1ZWRRQUNIYko5OTJtT3d6cFo5?=
 =?utf-8?B?NGZUNUJrNUw4eEFZVEdnN3ZMWTFVbG5zNm5UbFI4YXdlL0cza0M3ckR2OTlE?=
 =?utf-8?B?MG9DdlhvbzdOdWJNRFNnTE02NWxCNHlObytIS2tvRCtXWGpRamN2d0t3S1g5?=
 =?utf-8?B?ckxVakIrWXhYTkxOUG1YdWpLd2RIM2xLMGVUZTdtNG1yRW9UVFVaREsvK2ZN?=
 =?utf-8?B?Z2gzdFp2VEVuNVZRcXg3TUhSVlhhSWt1MDE5WTNMVi9Ra3pZbjR6T0tRaVdq?=
 =?utf-8?B?U001dWx5RE4vZE1wQi9VQjk1SkJMWXpjaTYyb2lqTHRobHIzWHFIZ2JHQjQ1?=
 =?utf-8?B?a1ZWb1lWNmJPZnA0TCs5V3FCSm5wN2ZwT0ZnOHhibmZlRmhhRUVid3Z3REx2?=
 =?utf-8?B?YXNuZk8wdWw1ZC96UXg5Z3dITHRzK2kxUWRRZmxKd0VTNkZpaTdlMkZsdENE?=
 =?utf-8?B?MXdIY0ZVQXBsQUF0L0N3ck44N3RyOUlhVXBMOXhSMnpINERpQ1FaSG5hTFEz?=
 =?utf-8?B?c0hyK0ZZUkgyKzJPSDhiMzhUMHlTQWV5YjNEcUZKbVQ2K0ZsK2U3VW93YTBa?=
 =?utf-8?B?aWZxZ2ZmMTI5RC9iR2szeEc0eWVzTDVUSHM0eU1zV2g0UWJ2ek9QYkpaSnp4?=
 =?utf-8?B?bHFhVGpFcVFLcVJ5NDA5UkUvNnhvVUJvQ01IZUdMUjZtclZPNStwQ2N2MWh0?=
 =?utf-8?B?WWxYTVdJM1NTVWJWVUxudVBobUJZUVh0UzY1dlQ4enlmOWErVllMOG9RZ2tz?=
 =?utf-8?B?WTBidEllcHppbTZaWDUvSFN5QzJsbXluNTNVaWY2V05lNzA0bFZHcUhXNk5q?=
 =?utf-8?B?QXE3TjV5WkdBajlPWGZPWnFIaVBBWWZoaXNkRERXblRPZUVWVGtQWjVWa3Fj?=
 =?utf-8?B?SlBOMmgvdHZHZ1J1cHFqbE9RSVgzdWJhUGhVaXBpN0dVU2dxZ2lPYW8zUkV2?=
 =?utf-8?B?ckJNUE5aNVBOa20xQkV5Q0ZrNzJKTHBKbjkzb1JCWjJPcjRQSy8xbFdxSUd3?=
 =?utf-8?B?Y2NZeDEvajVCaURmNEpxTnp2a0MxYWx3bk1wYXZ4NnpwTVBYcnhpOXBEL3Bk?=
 =?utf-8?B?OFFwenl0aHNJcTk3YjhPYXAxUmZzOEx0QUZPUXhTYmVmV0h6QitCQUlVRkNh?=
 =?utf-8?B?Wm5IQTZwN0J5QXpjcStTQzB3SnU4VVhUeUtQdFhMUHdNSDR0ZXNEb29YOXhB?=
 =?utf-8?B?ckEvOVBtWlJiemZYc1ViNUhUR1dFUFdkd0hka1pKYUlma1VWQkxOVFRxTFNT?=
 =?utf-8?B?MUNqTnlXOXFMWmVZNjBaNzJSRHZrRVJqcGJvVlVXamxmSUhsc0tXNXNZZVBX?=
 =?utf-8?B?eFM5aDFwcVp4RXB3K0J0a2N2OHhPRU9LN2tWYisrdjFwZGx3Skoxc1p1eWhn?=
 =?utf-8?B?TjlpRnZmWDJQeDdtRjJHK1VPQlRWa1pxcmpjUW1RUUl6TGwzVFRsckRvbmo2?=
 =?utf-8?B?djJQNXhFN2p3UVdodjdSNEhtckJIRUFwS0ZON2NFbk55MnlZcWtydFZTVWMv?=
 =?utf-8?B?ZXN6WTZObWxiMElWS3hQUnlRTDNQVVZNUkFxT1gwbkJvOStiNUdzekhkTXRs?=
 =?utf-8?B?d05UUUJyaHF3ZXhtc21YcDdwR3cyN2EwYVFuTGxMWGxmYlhrdlZEUHRPOURP?=
 =?utf-8?B?ZDJqQzdSbWZBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB7963.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M1hkcndla2VjSEVLaXh4bGpEREVBTG1JNHRPODdkb1QzYU8xN1U3QjI0NjB4?=
 =?utf-8?B?Ukk0TzZYdzhWUGNWOGhwWkFPcHVsdGpSQXRNdXYzZUVFbmtFOTFCdlNXYUE3?=
 =?utf-8?B?VVhxSlp0b2l1ZkVldllzM3VTSC9Tc0xyeHhrTGVqbEJWb0hRdXRoaXhNenlo?=
 =?utf-8?B?SlB6cGpXbFVUWEhNQkhkNWV5MGhkY1pXSVU4UFVydStHQmk5UkdUSWQ3TGpM?=
 =?utf-8?B?UWIrc3g0Y1VlMGt5bEM1VGxVZHF4K0E2T0RDdmlyMTBwa2wrVU5MYmc3dk5H?=
 =?utf-8?B?TG00Tk9kVDkwMml3VFFRSUwyZElKUFhLQy85S2Fnc0EvMzNlTktVeE1KRUIy?=
 =?utf-8?B?QmdPNXF3eUxtMkJVVjNJWXR6Vk5uY2V1dVJHSHJHWXEvZkwwY2JXVUZIbTVQ?=
 =?utf-8?B?OFJ3d2duV3kvRDMvOUJzUU9aZzVnaFJSVEZyQVl5MnVzN1lYRW5vVkE1QjRP?=
 =?utf-8?B?Sjd1WmY3ZUljdy9hWlkxU2lPUTRGRGVRZkY1V2RoRitiZmxmaysrdXdtUHIw?=
 =?utf-8?B?Rm5mL1ZvQnduVE5zLzNnd3V4Y29VTUw1eHZSRUtRYmFCMHZhS3YwL3NjRlhR?=
 =?utf-8?B?QW9zTGxSdnJMNm1kRUptWHhLZFZabzYyWElDS3RoR0phR2x5U3ZkUEtjRGEr?=
 =?utf-8?B?TFVJa0p5WDlHMExmQ1dRejhPa3ZPUnF3Wm1KWlhZU2ZMUjQ1Z3hqN1JXUzdS?=
 =?utf-8?B?ZmFiVmlOTVJuRlBmUCtYbnM5SCt1V3dEUzJaeUtDNXNIY1RraUJhSFJBVldP?=
 =?utf-8?B?b0diUHZnK1NGcUtNSDF5bWZUWWVudnd1cXlSZmZnQkhZdjl3Nk04Y00yTDZH?=
 =?utf-8?B?aUo1S1RmRTFQNjJDNFBud2hXMG9pVy81WWVMY205UkRzMEE5aWQrVzZBVGIw?=
 =?utf-8?B?TjkrVFFUUm5rblJ3M3daQngzYmwzaWlHVkF3amVQMWovSnBnZjVHeGkrNjEv?=
 =?utf-8?B?SGZ5U2R3dm5sTnV4d3hTcTB1SzJseUlhVldMOHFFWlBibVJuUXZMNHgxUkRw?=
 =?utf-8?B?bzMzVzNLSFNRWGRsRVEzOVJPOW16ZW54amJHR2lpRldUNW5yN0dmb1J5cFI3?=
 =?utf-8?B?NlFVMEhsZmYrTGo5VjlQNmJ2QnAwSWhpRDBoMDY2TWpxd2poRUgrQzZNZnF5?=
 =?utf-8?B?OUpYcTRoVk01bytPM2hkeFM3N0RDa1U2akJrWHl1Ulp3RDRBbXBab3JxSDQv?=
 =?utf-8?B?RmZBRjMxaUNCVTVZTXhSZWlJaklNZmRqZUVDQW81dmFhRHhxLzRLMzBVbHJZ?=
 =?utf-8?B?SllaWktPZWRuMHh1bzNJV1RvV0ltZXZLVE4rQ3pJNkQzM2JBeVNvOHNXeGdK?=
 =?utf-8?B?d3ZNQ2ZkeTBLbndxNGFyRjBwblg1c2JWZmRQWUdVT05lUm5sWGFvaU0zdDQw?=
 =?utf-8?B?TVphMXBIeG90Rk9HcVN1VUhVcThoeExrVzJ0ZTU4VFBiVVNldTlRQ2c3TFRR?=
 =?utf-8?B?WXpsQlBHdGk3V1dhcUlONytPQkpNQmJHQzQxZUVHemFnQTBQSlc1MUkyNWh1?=
 =?utf-8?B?NDdiQzQ3YWp5OXJhaDB1cFVTQ1RpKzJldURkTU84SUdSdTFadE1mbjFGQ3Z3?=
 =?utf-8?B?QTViL1FxZzAwVlJTUGdyL3doa2FPQ21waTdHeksvZ0prRGRHSGhwQ3hObGwz?=
 =?utf-8?B?dk9oc1pUQ2NSN1dxTHlIVVJQM0R1d0tBNWVPMUVzR1lhcU1DRnM0akp2Qkto?=
 =?utf-8?B?VWJRclFyYlZ6L2xDUnRjV3Myayt4NDJFd1JDSWsyc1I3SkgwV2IxRGNKTWdR?=
 =?utf-8?B?NVlJSFpNYXBWajBUb05xZDdaQmlrcUExMkI4dlhsQnowNFNUWVRmbi9OaG1t?=
 =?utf-8?B?NXV4UFk1U0ZxME9DWDIrQlA3VTc3Sk1POXhQTzIvbGJST1JPTzdFMjZlUWVO?=
 =?utf-8?B?RU9sMm1VS0FyNk1CNEZydHcxS0tkbFhmaSs4Mis0MWNhZGdPNGZHRHk1RXVi?=
 =?utf-8?B?ZjFIZWRZQ0laWVJQQU5CK2JDZXYwVXNieEpqSUFESmdhUzFNYUxJSEhHTkFM?=
 =?utf-8?B?TjcxZktwZ1JUeDZyZmtHQ0Z4eHJScHhPd3JkS0lpSC85MTEwU0hBSlFjVGpN?=
 =?utf-8?B?cGlaYWxCSktURThDMld3OEUzeDdyc0tqSUtlWmhqNDFIVVZsS1o5OTFZOGhY?=
 =?utf-8?B?ZWthdWtyTThiNlBQYzFsbzVVMmppZ083cUNmQVVPS3lhSGpuS0xMdzdSc0gz?=
 =?utf-8?B?OVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F63B46AB7C43BC4EBBE76CC4D9F1381A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB7963.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa61d979-2106-407b-8a74-08dd34492708
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2025 03:11:34.8226
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x3bF7AZNc4k/8SJNtm9spJJ3RbEb/KBgzCNITN4/R8Sz2Q5lDFQZWVUl/5qFh5pI9UcIusCOFTvCXwF/v7cSbLNthyRz3uOKXj0wsvWCsUY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8544
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_191149_959762_1FF270AD 
X-CRM114-Status: UNSURE (   8.62  )
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

RGVhciBEYXZpZA0KDQpBdHRhY2hlZCBhcmUgdGhlIHRlc3Qgc2NyaXB0IGNvbW1hbmRzIGFuZCB0
ZXN0IHJlc3VsdHMuDQpQbGVhc2UgcmV2aWV3Lg0KDQpUaGFua3MNCg0KIyEvYmluL2Jhc2gNCg0K
ICBpcCBuZXRucyBhZGQgdGVzdDENCiAgaXAgbmV0bnMgYWRkIHRlc3QyDQoNCiAgaXAgbGluayBh
ZGQgZGV2IHZldGgwIG5ldG5zIHRlc3QxIHR5cGUgdmV0aCBwZWVyIG5hbWUgdmV0aDAgbmV0bnMN
CnRlc3QyDQogIGlwIGxpbmsgYWRkIGRldiB2ZXRoMSBuZXRucyB0ZXN0MiB0eXBlIGR1bW15DQoN
CiAgaXAgbmV0bnMgZXhlYyB0ZXN0MSBpcCBsaW5rIHNldCBkZXYgdmV0aDAgdXANCiAgaXAgbmV0
bnMgZXhlYyB0ZXN0MiBpcCBsaW5rIHNldCBkZXYgdmV0aDAgdXANCiAgaXAgbmV0bnMgZXhlYyB0
ZXN0MiBpcCBsaW5rIHNldCBkZXYgdmV0aDEgdXANCg0KICBpcCBuZXRucyBleGVjIHRlc3QxIGlw
IGFkZHIgYWRkIDEwLjAuOC4xLzI0IGRldiB2ZXRoMA0KICBpcCBuZXRucyBleGVjIHRlc3QyIGlw
IGFkZHIgYWRkIDEwLjAuOC4yLzI0IGRldiB2ZXRoMA0KICBpcCBuZXRucyBleGVjIHRlc3QyIGlw
IGFkZHIgYWRkIDEwLjAuOS4yLzI0IGRldiB2ZXRoMQ0KDQogIGlwIC02IC1uZXRucyB0ZXN0MSBh
ZGRyIGFkZCBmZGFhOjoxIGRldiB2ZXRoMA0KICBpcCAtNiAtbmV0bnMgdGVzdDIgYWRkciBhZGQg
ZmRhYTo6MiBkZXYgdmV0aDANCiAgaXAgLTYgLW5ldG5zIHRlc3QyIGFkZHIgYWRkIGZkYWI6OjIg
ZGV2IHZldGgxDQoNCiAgaXAgLW5ldG5zIHRlc3QxIHJvdXRlIGFkZCBkZWZhdWx0IHZpYSAxMC4w
LjguMg0KICBpcCAtbmV0bnMgdGVzdDIgcm91dGUgYWRkIGRlZmF1bHQgdmlhIDEwLjAuOC4xDQoN
CiAgaXAgLTYgLW5ldG5zIHRlc3QxIHJvdXRlIGFkZCBmZGFhOjoyIGRldiB2ZXRoMA0KICBpcCAt
NiAtbmV0bnMgdGVzdDIgcm91dGUgYWRkIGZkYWE6OjEgZGV2IHZldGgwDQogIGlwIC02IC1uZXRu
cyB0ZXN0MSByb3V0ZSBhZGQgZGVmYXVsdCB2aWEgZmRhYTo6Mg0KICBpcCAtNiAtbmV0bnMgdGVz
dDIgcm91dGUgYWRkIGRlZmF1bHQgdmlhIGZkYWE6OjENCg0KICBpcCAtNiAtbmV0bnMgdGVzdDEg
cnVsZSBhZGQgZnJvbSBhbGwgdW5yZWFjaGFibGUgcHJpIDENCiAgaXAgLW5ldG5zIHRlc3QxIHJ1
bGUgYWRkIGZyb20gYWxsIHVucmVhY2hhYmxlIHByaSAxDQoNCnRlc3QgcmVzdWx0cyBhcyBiZWxv
dzoNCjEudGVzdCBpcHY0IHBhc3MNCnh4eDovICMgaXAgbmV0bnMgZXhlYyB0ZXN0MSAgcGluZyAt
SSB2ZXRoMCAxMC4wLjkuMg0KUElORyAxMC4wLjkuMiAoMTAuMC45LjIpIGZyb20gMTAuMC44LjEg
dmV0aDA6IDU2KDg0KSBieXRlcyBvZiBkYXRhLg0KNjQgYnl0ZXMgZnJvbSAxMC4wLjkuMjogaWNt
cF9zZXE9MSB0dGw9NjQgdGltZT0wLjE2NCBtcw0KNjQgYnl0ZXMgZnJvbSAxMC4wLjkuMjogaWNt
cF9zZXE9MiB0dGw9NjQgdGltZT0wLjE1NCBtcw0KNjQgYnl0ZXMgZnJvbSAxMC4wLjkuMjogaWNt
cF9zZXE9MyB0dGw9NjQgdGltZT0wLjE0OCBtcw0KNjQgYnl0ZXMgZnJvbSAxMC4wLjkuMjogaWNt
cF9zZXE9NCB0dGw9NjQgdGltZT0wLjE1MCBtcw0KDQoNCjIudGVzdCBpcHY2IGZhaWwNCnh4eDov
ICMgaXAgbmV0bnMgZXhlYyB0ZXN0MSAgcGluZzYgLUkgdmV0aDAgZmRhYjo6Mg0KY29ubmVjdDog
TmV0d29yayBpcyB1bnJlYWNoYWJsZQ0KDQozLnRlc3QgaXB2NiBwYXNzIHdpdGhvdXQgdW5yZWFj
aGFibGUgcnVsZQ0KeHh4Oi8gIyAgaXAgLTYgLW5ldG5zIHRlc3QxIHJ1bGUgZGVsIGZyb20gYWxs
IHVucmVhY2hhYmxlIHByaSAxDQp4eHg6LyAjIGlwIG5ldG5zIGV4ZWMgdGVzdDEgIHBpbmc2IC1J
IHZldGgwIGZkYWI6OjINClBJTkcgZmRhYjo6MihmZGFiOjoyKSBmcm9tIGZkYWE6OjEgdmV0aDA6
IDU2IGRhdGEgYnl0ZXMNCjY0IGJ5dGVzIGZyb20gZmRhYjo6MjogaWNtcF9zZXE9MSB0dGw9NjQg
dGltZT0wLjA5OCBtcw0KNjQgYnl0ZXMgZnJvbSBmZGFiOjoyOiBpY21wX3NlcT0yIHR0bD02NCB0
aW1lPTAuMjAxIG1zDQo2NCBieXRlcyBmcm9tIGZkYWI6OjI6IGljbXBfc2VxPTMgdHRsPTY0IHRp
bWU9MC4yMTUgbXMNCg0KDQpPbiBGcmksIDIwMjUtMDEtMDMgYXQgMDg6MzEgLTA3MDAsIERhdmlk
IEFoZXJuIHdyb3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlu
a3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2Vu
ZGVyIG9yIHRoZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDEvMy8yNSAzOjI3IEFNLCBTaGltaW5n
IENoZW5nICjmiJDor5fmmI4pIHdyb3RlOg0KPiA+IFRlc3QgY2FzZXMgd2lsbCBiZSBwcm92aWRl
ZCBsYXRlciwgYmVsb3cgYXJlIHRoZSBjb3JyZXNwb25kaW5nIElQDQo+ID4gcnVsZQ0KPiA+IGNv
bmZpZ3VyYXRpb25zIGZvciBJUHY0IGFuZCBJUHY2IHRoYXQgaSBwcm92aWRlZCwgYXMgd2VsbCBh
cyB0aGUNCj4gPiBkaWZmZXJlbmNlcyBpbiBwaW5nIHJlc3VsdHMsIHRoZSBJUHY0IHJlc3VsdCBw
YXNzZWQsIGJ1dCB0aGUgSVB2Ng0KPiA+IHJlc3VsdA0KPiA+IGZhaWxlZCwgYWZ0ZXIgYWRkaW5n
IHRoaXMgcGF0Y2gsIHRoZSBJUHY2IHJlc3VsdCBwYXNzZWQuDQo+IA0KPiBJIGRvIG5vdCB3YW50
IHRoZSBvdXRwdXQgb2YgYSBjb21wbGljYXRlZCBzdGFjayBvZiBpcCBydWxlcyB3aXRoIGENCj4g
cGluZw0KPiBhIGNvbW1hbmQuDQo+IA0KPiBQcm92aWRlIGEgc2ltcGxpc3RpYyBzZXQgb2YgY29t
bWFuZHMgdGhhdCBjb25maWd1cmUgdGhlIHN0YWNrIGFuZA0KPiBzaG93DQo+IHdoYXQgeW91IGJl
bGlldmUgaXMgYSBwcm9ibGVtLiBBbnlvbmUgb24gdGhpcyBsaXN0IHNob3VsZCBiZSBhYmxlIHRv
DQo+IHF1aWNrbHkgcmVwcm9kdWNlIHRoZSBzZXR1cCB0byB2ZXJpZnkgaXQgaXMgYSBwcm9ibGVt
IGFuZCBpbnZlc3RpZ2F0ZQ0KPiB3aGF0IGlzIGhhcHBlbmluZy4NCg==

