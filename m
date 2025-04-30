Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D164C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 08:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33ScwPulUItjdBS3kJdCZCqiQGOjSSM+knQGo3A/SLE=; b=gNrxDAJDiJKnZJV75UdDbVPKU9
	u3IgJzX/E881y3SfHcQCsYQ7arFthVRTG+F2lHQZOOTsJdIVGDXV8HEWxnHLoge22hn+tZss51NhQ
	90RttdassL+MdinZ1lzjJW2we9hsVl1eXCqfZBLUwxdIhlz1pqtsfOhXGCi3+CrdzuzTHoKsF/Htd
	AK1xMlf6M+Wr6ffU7Wbfwag9pJGMa0yoIcJjTQ+k2eMiIc2nfqn43Zo+Hm9aafs+Q3ihFcswjwMLE
	fYU6KXrVstVGmkODzN3hfB5cc0FJaYO3oBOn73BvYIpEi3hbgaoE3u9zuRjSL1hx7UC1CiJYahQZ1
	B2NUL1yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA34b-0000000CCZ2-0T3K;
	Wed, 30 Apr 2025 08:45:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA30X-0000000CBlR-3TWo;
	Wed, 30 Apr 2025 08:41:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To
	:From:Sender:Reply-To:Content-Description;
	bh=33ScwPulUItjdBS3kJdCZCqiQGOjSSM+knQGo3A/SLE=; b=m1ARuo9BlApxpnDH13Sw3A+3dd
	UzZe1vHpN23TFyjxRKwTs1GkZ32VUSrCjOioNwWfg+5FhQti/zt+KuVX2Ihqh0s/BtubnPLzaXUkd
	869diO+2M1+oMF3wupmQ8pQy5Jmk3sDYSyeoksZyaIjT3wts89yCU0V43X0EN5XZ6afIo3hXJLfRI
	3OSftnz9Ws+l+fO1dSwm9XLHTyA/tKciTPKlJkgrlwGwPBOIcZJvBCb5vRq3PnOMjDxkYGGsuIEpE
	haslm+8dUsqySqZxNLlO6cLiY7IIIGq7EGFaCq1dPWv//Kewwk1hyDtfwQPCkkTO1n0rdl2C00/9s
	S2F/T0vQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uA30T-0000000Dk7Z-3hVJ;
	Wed, 30 Apr 2025 08:41:32 +0000
X-UUID: c1340fa6259c11f08d385d50fb11b32d-20250430
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=33ScwPulUItjdBS3kJdCZCqiQGOjSSM+knQGo3A/SLE=;
	b=BrIq/nui+9OPGNlflucaYinu+RThjPmiXCm1ejSUUkjWkQsv0zDQeNWTpctYNZ03vWWBFDfHbRGRS3TKQxzJKceo5n3YJBKhomQtJVm0a4zLoI0pytCEknlwlgg2kLUR+GopDVPkPC1kkzZAejScFpfpaP7b55tCvB0B9hdrTr4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:6c700082-eef5-42ff-a6f0-da2cb9b9f62f,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:73600970-e08c-41ab-89e8-3ba0a33da853,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c1340fa6259c11f08d385d50fb11b32d-20250430
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <ds_chang-yi.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 465187973; Wed, 30 Apr 2025 01:26:03 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 30 Apr 2025 16:26:00 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 30 Apr 2025 16:26:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NxwB+YYFeQwTRaqMl9quqVr9KGVkhYFu46FSMq8e7k72dfGff1QK3q0qXVHl8WEOsfZInzWDNXm3ZgD6JmWBmXot1WE7R1yMs+mUK+aNIgEmjHHmLoP8fH245UawAxQd0AoJ8w4eKsw/WI+dnspDlFYQunK2NIN+s78eFFZdFrl1j9wke3uhMHf+ERm2aF1T+mgayY+Ho0KFa8XKpgMrxbvbtNWhTtZYvjK3KA2h0T51T0ZYURr81KtzWl32wIBV1MEa1hajriaG8BMXfwBmL3IjPQucWa5sPT3wrAsOaaYph5G3sL+Tgrz5/nQvcpOt1242gZeQ6OA856Ri6jxbzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=33ScwPulUItjdBS3kJdCZCqiQGOjSSM+knQGo3A/SLE=;
 b=YgpTAw1Caz+G2htF4P1pGd4NRrH0n7L0saKbAzTgep/OpCZy2IIALem5uDy3J8VHBXokzwZyoCO0DKXLWOX7L14kPYysUkrgjd6SXtDa9mEJUPN4M/GSHSF5YHJ+ejLeC8HrbHCYiDT1nHryUOUgZOBeYb60runl+IEiDCg8nJdSkUegDUFnoDJkdLmEHIsfs6zwn83rx+vSO1CGWEEt5mLhYvZeNDPvh99XD4sdsSiF5EGxZHtEf8f/aV6wwuAwYIVx9D3iYJR6AkgIpTIdcWLkX5PhXajJnndSDaL2mi4D9gqpx1+G1T6DLWZrq6SnUjS0ZITkij/Op2BjXJHkyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33ScwPulUItjdBS3kJdCZCqiQGOjSSM+knQGo3A/SLE=;
 b=NSYU5h79gAYlUaba1rjh8+7jq6fSjsaTiXatGPBD4QaDtNi/k2zVB7RP2rbFaa8bu6rzZC3IzqFTg5dYpoiyIXCAzhj0l9AIk66BVsOCZ7QV4hDDTzw6Rw6pGdioBO0MHwF5pCbrlywKMLcQAyKOS+KyZVDoGNhGdq9p2iy1G78=
Received: from SEZPR03MB7146.apcprd03.prod.outlook.com (2603:1096:101:ee::14)
 by SEYPR03MB8302.apcprd03.prod.outlook.com (2603:1096:101:1a7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 08:25:58 +0000
Received: from SEZPR03MB7146.apcprd03.prod.outlook.com
 ([fe80::f608:5d7a:df6:35f8]) by SEZPR03MB7146.apcprd03.prod.outlook.com
 ([fe80::f608:5d7a:df6:35f8%5]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 08:25:57 +0000
From: =?utf-8?B?Q2hhbmctWWkgTGluICjmnpfplbflhIQp?=
	<ds_chang-yi.lin@mediatek.com>
To: "treapking@chromium.org" <treapking@chromium.org>,
	"daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "nico@fluxnic.net"
	<nico@fluxnic.net>, "rafael@kernel.org" <rafael@kernel.org>,
	"AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
	"rui.zhang@intel.com" <rui.zhang@intel.com>, "lukasz.luba@arm.com"
	<lukasz.luba@arm.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
CC: "duminjie@vivo.com" <duminjie@vivo.com>, Alexandre Mergnat
	<amergnat@baylibre.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "bchihi@baylibre.com"
	<bchihi@baylibre.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	Nicolas Prado <nfraprado@collabora.com>
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: Remove redundant
 code in lvts_ctrl_configure
Thread-Topic: [PATCH] thermal/drivers/mediatek/lvts_thermal: Remove redundant
 code in lvts_ctrl_configure
Thread-Index: AQHbuAe9MGYw7cwlwEeeD4M+2hOyN7O74u0A
Date: Wed, 30 Apr 2025 08:25:57 +0000
Message-ID: <77c4437f2643475de495733d7840421198b78f49.camel@mediatek.com>
References: <20240410000730.628043-1-treapking@chromium.org>
	 <9c5aa4fb-a83c-470e-acf8-dd31303e50c2@collabora.com>
In-Reply-To: <9c5aa4fb-a83c-470e-acf8-dd31303e50c2@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7146:EE_|SEYPR03MB8302:EE_
x-ms-office365-filtering-correlation-id: 28e6efbb-1464-4bb8-5811-08dd87c0a1f5
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dEJzeUlvTlhrM1RCbS9XTlhrNjk0ckhxR3kzZkdMbUtpZU9LQjJ1OWd4T3RQ?=
 =?utf-8?B?WDlnTTF1MzhBU0lCRyt2STFsR3lZcUJqS3NuL21HMnJNRTV2OFR4L3grN0ZG?=
 =?utf-8?B?aCsyNys5MVgrdlJPZzFWdGJKZXN6ZERySlJtdm1Yd2RnVEZ3RUtFdU9MbmRS?=
 =?utf-8?B?cTRvT2hPVi9yblpLOHhFWStBTHFUODBtL2VpT2RGeUI1VS9rZEVTNnhhTTZZ?=
 =?utf-8?B?d3BjVDFOSXhxOEpyaWNxamEzM1JWTkRBV3dTVktrZmNYUTduVVRlZHkwaklm?=
 =?utf-8?B?R0dZYk5ENTNlM3BNUkFJUXlMZ1FjZytpQjJIVjdPL3BaUDQwc2lKb0RWMGhw?=
 =?utf-8?B?Umg4S3RVVjl2UlZBYjl2WHl3ZXFjM1VqeVZ6K2ZnWWcyNEl3WFpjRzVOUWcz?=
 =?utf-8?B?bFlxMzY1bHdHKy9aL3lUSU1RQzExQUpOSVdDUytudUF3S0hCeVE2WGp6UnJ0?=
 =?utf-8?B?eUFvM25kNDJDYnhkTDBNbzRYVVlTUUtjRVZmcFo0aUQwZUhoNnFlUzRiMzNS?=
 =?utf-8?B?VXJwM052dTVDZ25aK0QwcnFWMFdvaXdZM1RrTU5vc3VvcmhWdlcvbnRJa2Z0?=
 =?utf-8?B?aUJHZXJuTndMTDl3NWFVcEtHeGhDdTZsWDhKT0dzM2cva1NyV3p0bUdqZWpT?=
 =?utf-8?B?MHNPMFJHUjhIUmZJWUhkcUZNSU4zSlVHcG1oNS85SVpLanlpYnZjbEwxbVNo?=
 =?utf-8?B?aUdLeFVPY0xOZEQvWmtQdlluNzUwQmFzaFZWeTREMDduUjNMaEh3U0NjaW43?=
 =?utf-8?B?MDZjOHE4M010aFpyU2hieCtEblpNWXJvT2RaWUYzY0I1aG9XeUhjTE84dkNI?=
 =?utf-8?B?NnBhR0s3bW5DOCswTms3VzdpNFJwc2h5bnI3MWJ2cE1Ibm8wTnNadXlTQldK?=
 =?utf-8?B?NUhYbzRQbGV6Q1lYaUZFZ3ZRSmlvTW5YZ3hWR3hTY1RHUUh4eWlRdGQzd0ZP?=
 =?utf-8?B?djZiZHh2MnNNNEJqUXZ3N2NwODJoTjhOQXk5Tk9QYVZDc0x3WnpQL0hpRHNI?=
 =?utf-8?B?Z1JHTE9jcWtoZHU5aHlEekJIbGxlTnl2anpmU0wyWm1uVEdhL0hxTG8rOVgz?=
 =?utf-8?B?Y2xvZXJQU3BBZXJZb2xRbG9vN3JJemxVbmhWSWhiNTNrQ2V1ZkgrclN5ZTd3?=
 =?utf-8?B?NXQ2aDI4bkxHblNFRDR3am82SVFVMHVPa3oxbW9PejRudGZIM0RkRFNiTklo?=
 =?utf-8?B?YWtJck0yODN6MWNMZnNjUVpONkdieUlzdVFSRUVPeEs4eHF2eXpabHp2R0pi?=
 =?utf-8?B?Y3dUcDgwR3haVWJaQWJZUFYzQVVnTUpiWllmM0xKUnNDV2dkdmZEZmtvdXBB?=
 =?utf-8?B?dDNpRlRYVWV5VzRYUUowcnNJSkp1TDU0cVNpN1FFNjZRZHlIZDFJQUN3UTh4?=
 =?utf-8?B?eVFzUkpYU2sxTVRWTXg4Ynh3aC9OeE5OeDhlS0d3MVptd21EZ3Y0N2FMbzBQ?=
 =?utf-8?B?VExpZndtbGhIL1F0RlJkZ1RqWU1FMVEySUJMbzdRZXVhS0d6b0xEbnNZTWhL?=
 =?utf-8?B?ejVyM0Q4OVBWMm12eTQ0TkRRUTR3RWNWMnJFbThkazkvZHF4NTZwUG0vWCtS?=
 =?utf-8?B?TW01ODVicEY0RllKV3ROam44TDZkRDVjblJZV08ycDNJK2JtdnF1V281c2cw?=
 =?utf-8?B?MEtlVnp2QWlNWmZ6OXg5WXZWK0pVWUxDTWozWEZ2TVVrN3RHbHJaREFTRnBM?=
 =?utf-8?B?ZTkvVEdrdENsTlFRd0JLVENKOVlla1VlUlF5SzgzZjJSRTlaV1lwd2oxcDN2?=
 =?utf-8?B?RU4raEFEaGowc0lSUFQ0UWQrWWRQcndzQitLY0JwSVZpNzFwcU5WWDlMNEQv?=
 =?utf-8?B?YnJ3RWNQZTliY1h5ZE16dnJQaFJjOFJ4eUNwVDRjc3ZkS0N0MHVicXh6akRx?=
 =?utf-8?B?YVY0ZXJVeGFIeUFBYVdJWjdjSnlDY25jNUsySnQybDRNYkw5aDlBUmlPOWxT?=
 =?utf-8?B?RnNVMXFsSjRuWVcwVG9VSFNvQ2tkZ0thM1lUTTNUaWM2cWVwcEIwMnhRUHFY?=
 =?utf-8?B?UEM2Q2VwY0ZnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7146.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y0FWMlAxUlFxM0FCVW9hZGlkeWxwTEpNbVM5RlYvcVFHN2xhTW5VNHp5ODdL?=
 =?utf-8?B?RGtOZGZ2MDV3NXhBQVhDazJ4c05qSHJjWU5XMy9EQTFGYkRwUmRyenZ2TytK?=
 =?utf-8?B?RHI0TGYyK1NabnRST1NtZGJBRGlIaTRKZ2dZV2xlTnVtSFNUOVArNytUNmdh?=
 =?utf-8?B?RWtjaGNOc2VuMmQydnVPdGVFS0xBNEtVcmYzZ2RROTJDRWhFRkY2M09WdStl?=
 =?utf-8?B?OWZXMmw4RGk1MTg0QVIrUXJkUENtMHVIWHkvV1F0VGZZMlkrencxMGVaa3Bu?=
 =?utf-8?B?WnozaVVDMmR6MnZ1R2lMenEyWG52Z2ZmNzdtazZXOG15djRvZTh3eEpCMWlN?=
 =?utf-8?B?U1pac25oUlBhUVB3OFdUSzFDZEhEcCtEVEkrNUoySGpDQ1BNZWJNNnNMQ1pW?=
 =?utf-8?B?RDZuRUVmbnBmd0NlTHJYLy9xTHJRQ2x6OGdXYXMwM3Z1bCtvcTRTeGZJUzZH?=
 =?utf-8?B?UHZHL1hUOVRhUldlQTh0bVBEaml6eFVFY2d0eUJlYm9LaGdudTAveDJINkkx?=
 =?utf-8?B?WG5YSk9tWkhLWjBZMnUxZGJHUEkwWU9sRGREaWNVWFI4SlZYbkZ4a0pjZkp6?=
 =?utf-8?B?Q3I3WGFUSFkvdTlFUE5XRnFnSm1uanpxU0h1ay9yR2RCM09WMHlVMGNWek1x?=
 =?utf-8?B?M0VWaTdqZFRLaWJHeHRodkV5ZExhOXpjck5ENnVzeHY2T0c2b0MzSmY2K0M3?=
 =?utf-8?B?OFRLcXkwK2gvaS9uclQwUjdhL1ZhTWloUCs4TnpJK2FhMyt3MDJvYXZ4N0ZH?=
 =?utf-8?B?TjZKb3k1UXFobXRLU2FjbmpUcm1tVldmMFduLzgycVE2MmVjR0xRbHpOSzVQ?=
 =?utf-8?B?Wlo1bHhwV2FieVpqeUtiRHBOalZKWG9KTVIrd2MzVm1XVDVhSUlUZFFWWHBk?=
 =?utf-8?B?R0Z1a3pDcFVGNEtpV0FUNStUanZwWTFTdEUxMVFSeXlGLzBzZEw0dXFuVE9Y?=
 =?utf-8?B?Vml4ekNDbjhpL0pCRDhFOVRrQlkzam56bXloMjJsYXZRZ2xZRnpoeVJ1aTdz?=
 =?utf-8?B?RmZKUzBMUzhZYWt4ckxwbUFUNCtJZm5MbmJaTmNEWDVZc0xmNWdWUTRPRitW?=
 =?utf-8?B?dUN1SG9NTi9IRDljWnR5TVJ5VWVRemtRZXk2Q29jVy9sK2MrVmtnQ0NkdHAv?=
 =?utf-8?B?RVlQNVJudGtMR0NBLzB3N1c2a2UyZG5vSDRLUU41SEtrQWdkQUVadndXNEt1?=
 =?utf-8?B?a1lndWpkK2hxOW9DOUEvRVZ0Zll5OS9UWFE5TjVjTENyM2U1K2VvTVYvRlRt?=
 =?utf-8?B?N01Zc0J0bXczbThKOTd5c01sTUQwMExWd3JUbWVLSXVPLzB0VkJ0bWNTalla?=
 =?utf-8?B?UlBoVHk1czBRRE5rZS9pYTdjSXFlemdDMjZTUzlPcS9pblNvZmltR2ZXWW8w?=
 =?utf-8?B?S2UrUEtRWllid0Z4ZFZNVW52b2dLTC9mYjJjRVJWZ2lSVDZzVWhpMjZjU2Z1?=
 =?utf-8?B?dzUxM1g5K2RWLzEzMFFXa1ozampBMFVkMXJDeWFVYTIxNE5yZ1FwK2pXckVV?=
 =?utf-8?B?YlltdkVnb1JtOTJrank1Qkg4Y3ZVeCtJcUxvSzV3M1VGSjlOZE5xYnVPaHEw?=
 =?utf-8?B?U0J1b3Y5eitjOE81ZkdhUisyMUJ5Y0xhaE94dkVSbEZQbE10Z1RwZi82RkdF?=
 =?utf-8?B?OFRIQm41VkE2NWMrVU1LNWNYM1FETG0yK2d3Mjk3LytkSmpIM21QREhUNlNs?=
 =?utf-8?B?VTJid2hSYWZxVmlyS1E1RjQ3Y25iT05JcTdSemZ1WDdmdG1BMWFlSkxEcElQ?=
 =?utf-8?B?TnVPTnNISWRCNVY1T1lla1lHS0YxZk9hdVQvMFY4RlpHRE91MFNQdlNyTENi?=
 =?utf-8?B?dWhKTTNoNzhiYmNCejV3cjhRY1oyOGZ2V0Nnd1Fxd3hCa1BjaGRDM0tzRVlW?=
 =?utf-8?B?L1dVMlk3MnJoTU1hNlBiajVkaEN3NkJRMzlXbjdnbTlHSTVuUURCeG1HVzBx?=
 =?utf-8?B?cGQxREJTcWFGalIrSHNoZ3FvazdhdXpHVjVOeFFqNFhFY1VnbDNBSVJST1V6?=
 =?utf-8?B?RGRyNURkWGZaa25VTFEzQWwwaEhadjJ1ek5GWWo5bXNNaTZqNDFSMXFKZS9W?=
 =?utf-8?B?aWxEVzRMWFlybldaelRKb3czYkY5VExlVC9WWEJlc0lJaFY1RGxpWG5FRmRU?=
 =?utf-8?B?a1k0RlJ3d2wyeEQwak00WndSSDRUNlAvV1JSSTc3VUVOWE9KMVNMa3lEdFI1?=
 =?utf-8?B?QkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <31FAB87E351E8946B054F64CDF12C691@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7146.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28e6efbb-1464-4bb8-5811-08dd87c0a1f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2025 08:25:57.6891
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vcHRi34z+xNRpCMGKgcGGjgSCM87ntsLWlKsGYnlDkV4BFSYVPxvk4AOsTYjgdJgSNKX27K4Z80lIvJHlx9uFgrf7OnSBDIHx6pNcWL7+BI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8302
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_094130_709784_96C92578 
X-CRM114-Status: GOOD (  26.81  )
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

T24gV2VkLCAyMDI0LTA0LTEwIGF0IDExOjU1ICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMTAvMDQvMjQgMDI6MDcsIFBpbi15ZW4gTGluIGhhIHNjcml0dG86
DQo+ID4gVGhlIHJlbW92ZWQgdmFyaWFibGUgYXNzaWdubWVudCBpcyBuZXZlciB3cml0dGVuIHRv
IHRoZSByZWdpc3RlciwNCj4gPiBzbyBpdA0KPiA+IGhhcyBubyBlZmZlY3Qgb24gdGhlIGRldmlj
ZSBiZWhhdmlvci7CoCBNZWRpYXRlayBoYXMgY29uZmlybWVkIHRoYXQNCj4gPiBpdA0KPiA+IGlz
IG5vdCByZXF1aXJlZCB0byBpbml0aWFsaXplIHRoaXMgcmVnaXN0ZXIgZm9yIGN1cnJlbnQgcGxh
dGZvcm1zLA0KPiA+IHNvDQo+ID4gcmVtb3ZlIHRoaXMgc2VnbWVudCB0byBhdm9pZCBjb25mdXNp
b24uDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogUGluLXllbiBMaW4gPHRyZWFwa2luZ0BjaHJv
bWl1bS5vcmc+DQo+ID4gDQo+IA0KPiBBZGRlZCBOaWNvbGFzIFBpdHJlIHRvIHRoZSBsb29wOw0K
PiANCj4gTmljb2xhcywgc2luY2UgeW91J3JlIHB1c2hpbmcgc3VwcG9ydCBmb3IgdGhvc2UsIGNh
biB5b3UgcGxlYXNlIGNoZWNrDQo+IGlmIENBTFNDQUxFDQo+IGlzIHVzZWQvdXNlZnVsL25lY2Vz
c2FyeSBvbiBNVDgxODYvODggYmVmb3JlIEkgZ2l2ZSBhIFItYiB0byB0aGlzDQo+IGNvbW1pdD8N
Cj4gDQo+IFAuUy46IENhbiBhbnlvbmUgZnJvbSBNZWRpYVRlayBwbGVhc2UgY29uZmlybSBpZiB0
aGUgMHgzMDAgdmFsdWUgaXMNCj4gcmlnaHQgZm9yIHRoaXMNCj4gwqDCoMKgwqDCoMKgIHJlZ2lz
dGVyPyBJJ2Qgc3RpbGwgbGlrZSBMaW51eCB0byBwcm9wZXJseSBpbml0aWFsaXplIHRoZQ0KPiBy
ZWdpc3RlcnMsIGV2ZW4gaWYNCj4gwqDCoMKgwqDCoMKgIHRoaXMgY291bGQgdGVjaG5pY2FsbHkg
YmUgYSBkZWZhdWx0IHZhbHVlLg0KPiANCj4gDQo+ID4gLS0tDQo+ID4gDQo+ID4gwqAgZHJpdmVy
cy90aGVybWFsL21lZGlhdGVrL2x2dHNfdGhlcm1hbC5jIHwgNiAtLS0tLS0NCj4gPiDCoCAxIGZp
bGUgY2hhbmdlZCwgNiBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy90aGVybWFsL21lZGlhdGVrL2x2dHNfdGhlcm1hbC5jDQo+ID4gYi9kcml2ZXJzL3RoZXJtYWwv
bWVkaWF0ZWsvbHZ0c190aGVybWFsLmMNCj4gPiBpbmRleCBmZDRiZDY1MGM3N2EuLjQ4ZDJmOGJh
M2YxOCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3RoZXJtYWwvbWVkaWF0ZWsvbHZ0c190aGVy
bWFsLmMNCj4gPiArKysgYi9kcml2ZXJzL3RoZXJtYWwvbWVkaWF0ZWsvbHZ0c190aGVybWFsLmMN
Cj4gPiBAQCAtOTg1LDEyICs5ODUsNiBAQCBzdGF0aWMgaW50IGx2dHNfY3RybF9jb25maWd1cmUo
c3RydWN0IGRldmljZQ0KPiA+ICpkZXYsIHN0cnVjdCBsdnRzX2N0cmwgKmx2dHNfY3RybCkNCj4g
PiDCoMKgCXZhbHVlID0gTFZUU19UU1NFTF9DT05GOw0KPiA+IMKgwqAJd3JpdGVsKHZhbHVlLCBM
VlRTX1RTU0VMKGx2dHNfY3RybC0+YmFzZSkpOw0KPiA+IMKgIA0KPiA+IC0JLyoNCj4gPiAtCSAq
IExWVFNfQ0FMU0NBTEUgOiBBREMgdm9sdGFnZSByb3VuZA0KPiA+IC0JICovDQo+ID4gLQl2YWx1
ZSA9IDB4MzAwOw0KPiA+IC0JdmFsdWUgPSBMVlRTX0NBTFNDQUxFX0NPTkY7DQo+IA0KPiBBcyBh
IHNpZGUgbm90ZSwgSSBiZWxpZXZlIHRoYXQgdGhlIG9yaWdpbmFsIGF1dGhvciB3YW50ZWQgdG8g
d3JpdGUsDQo+IGluc3RlYWQuLi4NCj4gDQo+IAl2YWx1ZSA9IExWVFNfQ0FMU0NBTEVfQ09ORjsN
Cj4gCXdyaXRlbCh2YWx1ZSwgTFZUU19DQUxTQ0FMRShsdnRzX2N0cmwtPmJhc2UpOw0KPiANCj4g
Q2hlZXJzLA0KPiBBbmdlbG8NCj4gDQo+ID4gLQ0KPiA+IMKgwqAJLyoNCj4gPiDCoMKgCSAqIExW
VFNfTVNSQ1RMMCA6IFNlbnNvciBmaWx0ZXJpbmcgc3RyYXRlZ3kNCj4gPiDCoMKgCSAqDQo+IA0K
PiANCkJhc2Ugb24geGlhb2p1bi56aGVuZw0KICAgICBUaGUgcmVnaXN0ZXIgaXMgZm9yIFBUUCBm
dW5jdGlvbiwgYW5kIGluIE1UODE5MiBpdCdzIG5vdCByZXF1aXJlZA0KdG8gZG8gc3VjaCBzZXR0
aW5nIGFueSBtb3JlDQoNCg==

