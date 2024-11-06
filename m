Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5654FD1CA17
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 03:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=plOxnqbPD1NCwbvYU0lII+Jply9KjGUN/29II4Z1Yz0=; b=uouqqlYBlYq8oNfJTxMO/ZwQV8
	jnrS/jq3mTR+26BfEmKtuGzav5eUJLlKsnXFG7py8Ql1JxV2w2D5WxYLX6srtwJOqkFCzjtW3R32e
	4JxBn0L+A99yTOaFkgqvaLzgPYTn+LowgjMzanqvca2u52fKPXmrLRfa897GLExyDnGEoqCp75UvU
	ZP3XsXLvPDrsEh8XVNfT7+E5A76nomOpADStjuyQgUPv1GzKd8fqAd0KcY9aBZl+j3b8Ec5j0lsHM
	HhM1HIhUwNmoy93AnHBE5bxeXEvD3DZ+6I9NuSE+6y/CIe2uk4vI/NAncTSdBYhso3AFios8m+hwf
	b04gbA4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8WTp-00000001fSw-0W5W;
	Wed, 06 Nov 2024 03:13:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8WS6-00000001fBG-155Y;
	Wed, 06 Nov 2024 03:11:27 +0000
X-UUID: ca2aecae9bec11ef9048ed6ed365623b-20241105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=plOxnqbPD1NCwbvYU0lII+Jply9KjGUN/29II4Z1Yz0=;
	b=LlPOso1khAGZVohQG0KkA4DScue4bE9zdA8NLgavbDYkyuZMulabcJWADOhlgqMThH1sKbsyzAZj3xOL+Rbd5W5aY4/vKstVn631GMDoi4x/DbbzZqSKQkdvJm3s3Mepd3Uw26isKB7MAIQeWomVsDVndMSjFy/G5CHugWXpPtQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:ae6279e0-5f5e-4073-8cec-bcdf0e870c51,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:a7ef9d06-6ce0-4172-9755-bd2287e50583,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ca2aecae9bec11ef9048ed6ed365623b-20241105
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jianjun.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2065316855; Tue, 05 Nov 2024 20:11:17 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 6 Nov 2024 11:11:14 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 6 Nov 2024 11:11:14 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mPB3N7Uz6+SjhsRBB/5UgebP5GnjcVx4z1/t0WPhu3DOmAPPQIcLLWVZrwvFxkLtGFwgrrXzJSxEzdtVD8IL+blXe0nxvdfqIrbyDnpTyhRMMvNfLZTsmHBv4z8NPs3tpPbMmyyQZ6ikLiDqALALR7MCQCk6qiEuZQBy76qC8cHClHwnMHQW44Yg6tIOXydiOiYE5eP7ZO4Hk+VEmkNNKhL7GIWG7SCOa9YoiINjHvZZtyCvxss3P482Si8vJUPFPOoL55Z0cgts53gSrSPZy+PtC1x/O7f1HuAH6EbdfMW+i0B0ZzZW0RuNEBPYlm6OI9xg48v9F9Lb1vq7Cp0WNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plOxnqbPD1NCwbvYU0lII+Jply9KjGUN/29II4Z1Yz0=;
 b=mfAD5n556zVljcQx1uaqSVBGTjVYOaCbMYb7pmIE5h0k9LxATKoa/+R5cSotJsmsbUB+UFHvEvUcKv8fH5Vr6buZ0v1QLk0Ah7E/AAKU+ncyHG25lAdA8R9Xxc8sWE9QNf6isy9whK9ykfCsRqPYNaeNtCZF73mMqlPcd6ijfNJlwqYipd6aGvyX0wsW1gXrvlMeuBSHjBDlYDBFLzaI+6sDwm5IsstmwkmYVOIdcHNXFFPPA0IffJeT0DCazwfPS3Cms74jNV87d99kZYwcNVGPW5oZvGTkK3QDPMQ9MjBbqVdedgd3LPl9gqzivU2ixIgKgY0v3EOqZlNw4xYiXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plOxnqbPD1NCwbvYU0lII+Jply9KjGUN/29II4Z1Yz0=;
 b=r2+CPwxAsceBr8gUpdECPQBWeWlAfQpeDKwOzLX1RYoNqmzurgz14jHRH3QFF6od7RCXenxQwIzRkuLR2/6s/PNXoJJbFXaIqwZ76I8WU/HxMCnohgByIez80LAVi4S0/TSXJ22HkLJ8QAjfkCnZz4SYPeE7TaGlVmNgBryx7Jk=
Received: from PSAPR03MB5365.apcprd03.prod.outlook.com (2603:1096:301:17::5)
 by SEZPR03MB6850.apcprd03.prod.outlook.com (2603:1096:101:95::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 03:11:10 +0000
Received: from PSAPR03MB5365.apcprd03.prod.outlook.com
 ([fe80::1c6e:6591:5151:27e6]) by PSAPR03MB5365.apcprd03.prod.outlook.com
 ([fe80::1c6e:6591:5151:27e6%4]) with mapi id 15.20.8114.031; Wed, 6 Nov 2024
 03:11:10 +0000
From: =?utf-8?B?Smlhbmp1biBXYW5nICjnjovlu7rlhpsp?= <Jianjun.Wang@mediatek.com>
To: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"kernel@collabora.com" <kernel@collabora.com>, "robh@kernel.org"
	<robh@kernel.org>, "kw@linux.com" <kw@linux.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, Ryder Lee
	<Ryder.Lee@mediatek.com>, "fshao@chromium.org" <fshao@chromium.org>
Subject: Re: [PATCH v3 1/2] PCI: mediatek-gen3: Add support for setting
 max-link-speed limit
Thread-Topic: [PATCH v3 1/2] PCI: mediatek-gen3: Add support for setting
 max-link-speed limit
Thread-Index: AQHbCaKv1aLjwpTY4UmFXBvK44HsHLKnEg0AgAA3/4CAApW7gA==
Date: Wed, 6 Nov 2024 03:11:10 +0000
Message-ID: <7e220693f076c84cc1bc3d91e797580b320b4598.camel@mediatek.com>
References: <20240918081307.51264-1-angelogioacchino.delregno@collabora.com>
	 <20240918081307.51264-2-angelogioacchino.delregno@collabora.com>
	 <744a8362065b0c75178c3e0d402ea4932cb1fc96.camel@mediatek.com>
	 <47154bc7-5e52-4d2c-ba30-730758bf1901@collabora.com>
In-Reply-To: <47154bc7-5e52-4d2c-ba30-730758bf1901@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5365:EE_|SEZPR03MB6850:EE_
x-ms-office365-filtering-correlation-id: 0182bf9c-f2c9-4e34-19a3-08dcfe10a9d3
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?K0lYOEdNOFY1K3lsRUJ3LzB4Z1BYZ3U3bkpKU1FVanV2WFFDSkZoNk5TOFVn?=
 =?utf-8?B?MUUwemdtblRkM1UwWGswWUJGQjlibEcvZnhnQ1VoaStaSnJjekFlYUgwRGp3?=
 =?utf-8?B?UEVYMHNCK2w0bFl1NXpPMGpRKzZiakgxWkFzaUdHYmhxYTBScXZJZVl0ZTZJ?=
 =?utf-8?B?TmxMQXRESkd2R3BnejJqQytwYllHYzVPaE9wU3lMVmFaSlM4ci90V3dHNHNK?=
 =?utf-8?B?S0lDS01ZdXRRd0hkeUlwRHRpMTNaUnphemhoYnQzNEc3aVU3WCtPWFNFNkRa?=
 =?utf-8?B?S3Z3eXhjZzlmdmI5VWxMNGpIeHFBLzVTL21rcXNRQnRRS2FUVXVqUjMrQ1pC?=
 =?utf-8?B?a3BacXZEcHpmNklDaVhLZS84dVhqS1VSZjN5bExKVVJKR210WVdoV2FpNTdj?=
 =?utf-8?B?MmRNN2d6enhGSHFYOE1SQzI5dlpYNG9McitJbFcxcVZVOC9YbDhqU3ZzUVl6?=
 =?utf-8?B?VXRnYm5Lb09QTVFMb1RuNXA5WEo3ODRoZ2RtR0FuL3h1RFp0T2wwdURteFU2?=
 =?utf-8?B?REo0L3NQWVl2cVY0RzhsUmdQQkNQWG5aeDgrVG5PbHhpbTQ1NWRIemR5QTBK?=
 =?utf-8?B?OWwxdzllQkIzN29mOTBzOU9XeC9YQWU1WkFVSElSWlRzeE8vWmZ4RkxDOVBQ?=
 =?utf-8?B?ZHpkbmZSSnh3anhNN2VoK0huVzVxZG5xWDNyVzM1eGcwa093L21RUXJmMDZi?=
 =?utf-8?B?cUdwclVEZzIyMzkzZ0pHdVRhY1FhTkdCMVh1eEJKZkF0WjBqMGxMZ3JEbmtk?=
 =?utf-8?B?L2xpSnVyTFpjQmxZN0IvY1NWOG02YnlvWjZGcnBoZG43NDhMU0tyUEI5QUdT?=
 =?utf-8?B?SUhrbXMwVHh4azRXTUw5bGxjakNCbnlxMnlMUFFCTTg2SjNuUHRadE01SnBx?=
 =?utf-8?B?akQxdnZxSlh2bjJaRUFYaGgwd3lDajlLU2pJczhCN3RhSDJlMVdsZGJyK3hw?=
 =?utf-8?B?ME1oRWVQVm1IWWxQUDIvTk1jQ0FEZkd2U0VLS2NWZ3JMcSsrRm9Mb1BhcUJH?=
 =?utf-8?B?K20xWHpRQXd4WENEWG1iYkoweWJqRWJlL2FxQ2wwd3FRSjJ4dkNsU3d4Z1JC?=
 =?utf-8?B?cXZBM0J2dFo5dHVqUlEwMzdXMGNoZWVvYnR5emYxZ3ZJR3VycHZReTQ4NmE0?=
 =?utf-8?B?dGxQbUp6Ykp6V0hWVmtJdjRGRU9TT1k5Q3pYNzdmbit3UC9KSHJ2TjRERThV?=
 =?utf-8?B?dXc1b0FvVVEyZDRYcDRodTJZRkpWYzVKemJtTFFIZWt3R3ZEamp5TXhtbXZ5?=
 =?utf-8?B?S2pmNTAvaUZnMmw1akhQM1loWkFBM1FtUmlCRGNNcnFWamNsai9LaTR0Y2pN?=
 =?utf-8?B?bkRjeENNUXY2bm9xN1NRNWQ3VGRPVzJBZkp0V2R5dFU5ZnEzZHBGSC9jVy96?=
 =?utf-8?B?N0xHU1dYOXhGdnQvZC8xVnZCdE1oc2VWVVlCclZUQUgrdy9uREpQSnozWWQ3?=
 =?utf-8?B?RnNKTTFBT3A3S2lCaFhyTXQ4L2J0QURZdU5YSEk0T0hsWUtNdE9RZTdBYm5J?=
 =?utf-8?B?Q3RJWGpCMFZlTHVOeGJUOWE1SVZReGdYTnlpRWUzUVVHbjlnOVFWcE55NWli?=
 =?utf-8?B?RGx6dzB3RXMwSTFWNTVpUjhtQkpibnJCRGN1ZlFKMjZYNlpSRVBSTk9jMnpn?=
 =?utf-8?B?S21na0xnV3Q1MS9XMGVubFJKNXJUbXZzakpXZitWOHJpZUp2UVFDV3BqS0xF?=
 =?utf-8?B?TE43ZEJvck9xYWdFRmdSQ1BjcjFBcWJUL2lLM1d0ZEU4SU5WOXlwMnA1TVpY?=
 =?utf-8?B?Mk16SkJGaTcxNHZCc0FQL3ZHRjlpTDR0L1FXRS9kS2haazRscmpjVGxGV1dG?=
 =?utf-8?Q?Ktxz9kEDidAr4mhJvziRDWEqM2pkTsUFfUPC0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5365.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZHlvdEt5dUZQb1EwS1JCTmFiNGlVNjBlNXBqY3hhd29lRm9YQlNRVjlHOXM0?=
 =?utf-8?B?b0RvRjZGaTFtcVdIU2d2NC83VTlKRmR5UjcwZGxPK2tIUTV2aW80Yk1OV2pv?=
 =?utf-8?B?cEJmdk5iY1FCS3pkb2FVdFNhZVRpUFdvc3o4UDFjeDRkWFhWYWxFQ3BqY2FP?=
 =?utf-8?B?ZDh3dDBOMWFGakpqOHA0Sk5JSmhQbEIrL2hrNEdHM2lNbGxIcVhqeWd2S1Jk?=
 =?utf-8?B?eFU1TzFxRmFmQ3FkbzlKTFZoMXZISTkzbVhTL1BmRFFZTEVNZnBOOENJZVBN?=
 =?utf-8?B?YzdSbFZDckZCSXEwaitVbjJpbzc1eFgzcUxZbFJUQ3NNTGIyZnQ1VVAyYjlE?=
 =?utf-8?B?d1kzTkI2M3VQbE5BTW1JSENWNHVBU2xheXJRcS96R05XaXVQZ2cvdjdCZHpN?=
 =?utf-8?B?dHVVMHZmRXRqNU9xRTlGejc1YUF6NzhkS0tCZndxNkRFOVVtelFuV3E3c3k0?=
 =?utf-8?B?SG0xOVljNEFVTDhhTGFUNk9mME4ySWNlNmhFYWJnTW1FZlVYOGMwTG1xQ0lG?=
 =?utf-8?B?T3owT09wakluYm91ODhVSlBGRHFnaWJEZS9XNE9KVWozSDg0TVRZZUlIVjlE?=
 =?utf-8?B?ZkRtL3dESlZERkVON28zSzc3Z2xGc2lzMzdiQTFsZ3VsUW9CcXc3SXVBMlor?=
 =?utf-8?B?UzMzd09xUWcyOTRoSzZHSWdsV1JyZDdiemgvVHpXb255UXlZdHlTa3ZQMi9N?=
 =?utf-8?B?cVhaSndpVjZLclNMR0dHOFh4SzBsSUEvVHEreGdVdnlreEEvNW5hZlFIbGhT?=
 =?utf-8?B?OFpkN1VaM3c4VG1veTYyanZhcVZZK1prelZIWmgxclFmOHIxZCs1K1lwWG5N?=
 =?utf-8?B?NGxUSGlWTjZMVWRIS3lWSGRnL2hBSWQ1SWRwc1RndVBmTTVkdTV1eTc1cHh2?=
 =?utf-8?B?eTA3MkM2ZHpwYU4xeUhwRk11cSsrQm45aWVpZ2l3UWYvKytIcE5WM1Nra0Y3?=
 =?utf-8?B?RHlacHoyVVZWTzVCb0VwelpRRW9ZSWFTd0dzS2FMQWdFNWNSUDVuL0gzQkpy?=
 =?utf-8?B?MVRlWGYzUUFnRHJTOTQ0S0R2UDhhWkNaNnZQOWhzM2xoNjlJRnVxcWovTitr?=
 =?utf-8?B?WDY1Q2VYUzJERndGcmF0c3BXWGgrZWdvci9LVTV4QkZTVW13R28wOXBGYWFC?=
 =?utf-8?B?Tkc0RFJJN3dRMDcvbkM5U3dRMlpvcDhDNElvY0Z0NEdua2J2TTZWcnNWOEpZ?=
 =?utf-8?B?Y3RkL2pSeDFTYlk0MG5MQzcwMEZ4cWVheGtIalBlVC81bFRaRDFwbmdIMEFC?=
 =?utf-8?B?b0VzMzZ5aEZSdmxvNXVPNXEzbXBKWVFXNWIvbzJtSm9ZT2oxWU1Zb21NVDN6?=
 =?utf-8?B?TEN2bFJzSkROajhINHcwV1ZMN2UxZEZ0bTNYU3h3ejV2dFVtNlBwWUt0TXR1?=
 =?utf-8?B?TTVuSUJ4L214cTBZdXoydi8vekZoallxdldic01wbDFmNzVsQ05qL0pMN21z?=
 =?utf-8?B?dkcyeHZ1eWgyQkZoOGl0Vnd0a2YycjJSOVJYVzdPN3dRVXpGV01GK005NS9h?=
 =?utf-8?B?RjJPemtLZjh3eWZJQUFsNVNWYkdVL0lhMnBRMEZ5clppOWI2cGE3Nk0zclB0?=
 =?utf-8?B?dFgrOWNpT1VVVHZ0T0VXZE1DMFVCSTdqd0pUaXM3ZEhNLzIrYU5rMVhkMzh2?=
 =?utf-8?B?TkNTQjBiQXVvQ0hxMUY3VVRqQmZJOHJqU0toa3dVbXBpM05RNWVXQUhRRjFK?=
 =?utf-8?B?RWdtSnZjazYvNDdpdEFhUHh5bTM4YzZTdFZueWs0ekd0eU1MUmgrbGZWb3Rk?=
 =?utf-8?B?VmNlUEZOeFhVajU5K2VNVGdhN0NTdXAxY1ZSNzNEZjcyTDVTYWxFNGxLeC8r?=
 =?utf-8?B?N3A3Qjg4STVxd3kzNEtaSDI3UERCdmhoWWhQbjlKKzNvMVAwYjBVVGNob0x4?=
 =?utf-8?B?eDg0TkFONDFDTkdzalZwWVNxcFhaMDNOdXU0aExMNFNZL29YUzB4c05majlS?=
 =?utf-8?B?TVlGdWs5ZmxpVzRuOWhKdDdBYWFybm9lZ0tQVHZ5dzlOOWJ1UnliN2xHZXZ2?=
 =?utf-8?B?cWRrcGZHY05YcnVuVjh2SVBIZlI0cjNsTHZzbi9zeGlIQTVvNmx3Z0hSTzFH?=
 =?utf-8?B?YzFjSjNUd2ZtaVJMMTRsVTBIdlVMZkhSUG44cFBmeGpFbUVIUlJyUDZZUHFa?=
 =?utf-8?B?WHFZWHRVODhMWlVmWHVzbU9LOVFsTzJMMkdQU1M4VUFQWlgyVVBRRWo5QXZo?=
 =?utf-8?B?OHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CCA3F66759E09B479466998DA1462158@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5365.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0182bf9c-f2c9-4e34-19a3-08dcfe10a9d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2024 03:11:10.1387
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d47FMr6E+jBHlskCb1+DqTIicQ5eOTiOkjF5y17RMbtfRC2j6RTIuEIK4x1Dy5vJ21gLg55pRhVhOsTwfaYUg0zqVzXomoffBB2OSLqGvHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6850
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--21.006400-8.000000
X-TMASE-MatchedRID: F3kdXSFZYkfUL3YCMmnG4t7SWiiWSV/1YefZ7F9kLgsNcckEPxfz2DEU
	xl1gE1bkfdd9BtGlLLzx1uczIHKx54/qvvWxLCnegOqr/r0d+Czhx6r2FaI7XVq4HI+0POd1uae
	sYH+TAYwk/TQmrPGEgMA03P8DYBHDbu8QqMQjwvJpR7+L0B6mE2rKm+ExW/wvgnL+Z5JyhjXaZ9
	6f5RUrKZUyVyqodZ3tlnOfNFmtUWQ0Z9sXcK7F6ZA6S0SjvcYUpfVcx39Kq+40TnKEqFpI6q1uN
	fgQaqvvs3IdULTjNBVgHnELoaUKtmc/On6gI+zzaK+MsTwM+1lo3Yq5PCwLAvHFoBcOsKezx55G
	0SDHJVvKJ/3rtJy1mVB2roGXS8i5LvzCdhAXs6GQ+gWwzffozu4Z3yke5WgSr5aAJxq+KoYsxFO
	VdwrYLUPOK8ZUwBxJH2OEcANBiaTlRxm3A2wKutIFVVzYGjNKcmfM3DjaQLHEQdG7H66TyOk/y0
	w7JiZo
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--21.006400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F4A1034D92FBF48F51D5F2C043EE98B1A57AB9902DBE22DD3C263D8AF70C7C592000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_191126_370602_7DA11390 
X-CRM114-Status: GOOD (  22.61  )
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

T24gTW9uLCAyMDI0LTExLTA0IGF0IDEyOjQyICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAwNC8xMS8yNCAwOToyMiwgSmlhbmp1biBX
YW5nICjnjovlu7rlhpspIGhhIHNjcml0dG86DQo+ID4gSGkgQW5nZWxvLA0KPiA+IA0KPiA+IFRo
YW5rcyBmb3IgeW91ciBwYXRjaC4NCj4gPiANCj4gPiBPbiBXZWQsIDIwMjQtMDktMTggYXQgMTA6
MTMgKzAyMDAsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vDQo+ID4gd3JvdGU6DQo+ID4gPiBB
ZGQgc3VwcG9ydCBmb3IgcmVzcGVjdGluZyB0aGUgbWF4LWxpbmstc3BlZWQgZGV2aWNldHJlZQ0K
PiA+ID4gcHJvcGVydHksDQo+ID4gPiBmb3JjaW5nIGEgbWF4aW11bSBzcGVlZCAoR2VuKSBmb3Ig
YSBQQ0ktRXhwcmVzcyBwb3J0Lg0KPiA+ID4gDQo+ID4gPiBTaW5jZSB0aGUgTWVkaWFUZWsgUENJ
ZSBHZW4zIGNvbnRyb2xsZXJzIGFsc28gZXhwb3NlIHRoZSBtYXhpbXVtDQo+ID4gPiBzdXBwb3J0
ZWQgbGluayBzcGVlZCBpbiB0aGUgUENJRV9CQVNFX0NGRyByZWdpc3RlciwgaWYgcHJvcGVydHkN
Cj4gPiA+IG1heC1saW5rLXNwZWVkIGlzIHNwZWNpZmllZCBpbiBkZXZpY2V0cmVlLCB2YWxpZGF0
ZSBpdCBhZ2FpbnN0DQo+ID4gPiB0aGUNCj4gPiA+IGNvbnRyb2xsZXIgY2FwYWJpbGl0aWVzIGFu
ZCBwcm9jZWVkIHNldHRpbmcgdGhlIGxpbWl0YXRpb25zIG9ubHkNCj4gPiA+IGlmIHRoZSB3YW50
ZWQgR2VuIGlzIGxvd2VyIHRoYW4gdGhlIG1heGltdW0gb25lIHRoYXQgaXMgc3VwcG9ydGVkDQo+
ID4gPiBieSB0aGUgY29udHJvbGxlciBpdHNlbGYgKG90aGVyd2lzZSBpdCBtYWtlcyBubyBzZW5z
ZSEpLg0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyA8DQo+ID4gPiBhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+
ID4gPiAtLS0NCj4gPiA+ICAgZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLW1lZGlhdGVrLWdl
bjMuYyB8IDU1DQo+ID4gPiArKysrKysrKysrKysrKysrKysrKy0NCj4gPiA+ICAgMSBmaWxlIGNo
YW5nZWQsIDUzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4gPiANCj4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbWVkaWF0ZWstZ2VuMy5jDQo+
ID4gPiBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1tZWRpYXRlay1nZW4zLmMNCj4gPiA+
IGluZGV4IDY2Y2U0YjVkMzA5Yi4uOGQ0YjA0NTYzM2RhIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJp
dmVycy9wY2kvY29udHJvbGxlci9wY2llLW1lZGlhdGVrLWdlbjMuYw0KPiA+ID4gKysrIGIvZHJp
dmVycy9wY2kvY29udHJvbGxlci9wY2llLW1lZGlhdGVrLWdlbjMuYw0KPiA+ID4gQEAgLTI4LDcg
KzI4LDExIEBADQo+ID4gPiANCj4gPiA+ICAgI2luY2x1ZGUgIi4uL3BjaS5oIg0KPiA+ID4gDQo+
ID4gPiArI2RlZmluZSBQQ0lFX0JBU0VfQ0ZHX1JFRyAgICAgICAgICAgMHgxNA0KPiA+ID4gKyNk
ZWZpbmUgUENJRV9CQVNFX0NGR19TUEVFRCAgICAgICAgIEdFTk1BU0soMTUsIDgpDQo+ID4gPiAr
DQo+ID4gPiAgICNkZWZpbmUgUENJRV9TRVRUSU5HX1JFRyAgICAgICAgICAgMHg4MA0KPiA+ID4g
KyNkZWZpbmUgUENJRV9TRVRUSU5HX0dFTl9TVVBQT1JUICAgIEdFTk1BU0soMTQsIDEyKQ0KPiA+
ID4gICAjZGVmaW5lIFBDSUVfUENJX0lEU18xICAgICAgICAgICAgICAgICAgICAgMHg5Yw0KPiA+
ID4gICAjZGVmaW5lIFBDSV9DTEFTUyhjbGFzcykgICAgICAgICAgIChjbGFzcyA8PCA4KQ0KPiA+
ID4gICAjZGVmaW5lIFBDSUVfUkNfTU9ERSAgICAgICAgICAgICAgICAgICAgICAgQklUKDApDQo+
ID4gPiBAQCAtMTI1LDYgKzEyOSw5IEBADQo+ID4gPiANCj4gPiA+ICAgc3RydWN0IG10a19nZW4z
X3BjaWU7DQo+ID4gPiANCj4gPiA+ICsjZGVmaW5lIFBDSUVfQ09ORl9MSU5LMl9DVExfU1RTICAg
ICAgICAgICAgIDB4MTBiMA0KPiA+IA0KPiA+IE1heWJlIGl0J3MgYmV0dGVyIHRvIHVzZTogKFBD
SUVfQ0ZHX09GRlNFVF9BRERSICsgMHhiMCkuDQo+ID4gDQo+IA0KPiBNYWtlcyBzZW5zZS4NCj4g
DQo+ID4gPiArI2RlZmluZSBQQ0lFX0NPTkZfTElOSzJfTENSMl9MSU5LX1NQRUVEICAgICBHRU5N
QVNLKDMsIDApDQo+ID4gPiArDQo+ID4gPiAgIC8qKg0KPiA+ID4gICAgKiBzdHJ1Y3QgbXRrX2dl
bjNfcGNpZV9wZGF0YSAtIGRpZmZlcmVudGlhdGUgYmV0d2VlbiBob3N0DQo+ID4gPiBnZW5lcmF0
aW9ucw0KPiA+ID4gICAgKiBAcG93ZXJfdXA6IHBjaWUgcG93ZXJfdXAgY2FsbGJhY2sNCj4gPiA+
IEBAIC0xNjAsNiArMTY3LDcgQEAgc3RydWN0IG10a19tc2lfc2V0IHsNCj4gPiA+ICAgICogQHBo
eTogUEhZIGNvbnRyb2xsZXIgYmxvY2sNCj4gPiA+ICAgICogQGNsa3M6IFBDSWUgY2xvY2tzDQo+
ID4gPiAgICAqIEBudW1fY2xrczogUENJZSBjbG9ja3MgY291bnQgZm9yIHRoaXMgcG9ydA0KPiA+
ID4gKyAqIEBtYXhfbGlua19zcGVlZDogTWF4aW11bSBsaW5rIHNwZWVkIChQQ0llIEdlbikgZm9y
IHRoaXMgcG9ydA0KPiA+ID4gICAgKiBAaXJxOiBQQ0llIGNvbnRyb2xsZXIgaW50ZXJydXB0IG51
bWJlcg0KPiA+ID4gICAgKiBAc2F2ZWRfaXJxX3N0YXRlOiBJUlEgZW5hYmxlIHN0YXRlIHNhdmVk
IGF0IHN1c3BlbmQgdGltZQ0KPiA+ID4gICAgKiBAaXJxX2xvY2s6IGxvY2sgcHJvdGVjdGluZyBJ
UlEgcmVnaXN0ZXIgYWNjZXNzDQo+ID4gPiBAQCAtMTgwLDYgKzE4OCw3IEBAIHN0cnVjdCBtdGtf
Z2VuM19wY2llIHsNCj4gPiA+ICAgICAgc3RydWN0IHBoeSAqcGh5Ow0KPiA+ID4gICAgICBzdHJ1
Y3QgY2xrX2J1bGtfZGF0YSAqY2xrczsNCj4gPiA+ICAgICAgaW50IG51bV9jbGtzOw0KPiA+ID4g
KyAgICB1OCBtYXhfbGlua19zcGVlZDsNCj4gPiA+IA0KPiA+ID4gICAgICBpbnQgaXJxOw0KPiA+
ID4gICAgICB1MzIgc2F2ZWRfaXJxX3N0YXRlOw0KPiA+ID4gQEAgLTM4MSwxMSArMzkwLDI3IEBA
IHN0YXRpYyBpbnQgbXRrX3BjaWVfc3RhcnR1cF9wb3J0KHN0cnVjdA0KPiA+ID4gbXRrX2dlbjNf
cGNpZSAqcGNpZSkNCj4gPiA+ICAgICAgaW50IGVycjsNCj4gPiA+ICAgICAgdTMyIHZhbDsNCj4g
PiA+IA0KPiA+ID4gLSAgICAvKiBTZXQgYXMgUkMgbW9kZSAqLw0KPiA+ID4gKyAgICAvKiBTZXQg
YXMgUkMgbW9kZSBhbmQgc2V0IGNvbnRyb2xsZXIgUENJZSBHZW4gc3BlZWQNCj4gPiA+IHJlc3Ry
aWN0aW9uLCBpZiBhbnkgKi8NCj4gPiA+ICAgICAgdmFsID0gcmVhZGxfcmVsYXhlZChwY2llLT5i
YXNlICsgUENJRV9TRVRUSU5HX1JFRyk7DQo+ID4gPiAgICAgIHZhbCB8PSBQQ0lFX1JDX01PREU7
DQo+ID4gPiArICAgIGlmIChwY2llLT5tYXhfbGlua19zcGVlZCkgew0KPiA+ID4gKyAgICAgICAg
ICAgIHZhbCAmPSB+UENJRV9TRVRUSU5HX0dFTl9TVVBQT1JUOw0KPiA+ID4gKw0KPiA+ID4gKyAg
ICAgICAgICAgIC8qIENhbiBlbmFibGUgbGluayBzcGVlZCBzdXBwb3J0IG9ubHkgZnJvbSBHZW4y
DQo+ID4gPiBvbndhcmRzDQo+ID4gPiAqLw0KPiA+ID4gKyAgICAgICAgICAgIGlmIChwY2llLT5t
YXhfbGlua19zcGVlZCA+PSAyKQ0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgdmFsIHw9IEZJ
RUxEX1BSRVAoUENJRV9TRVRUSU5HX0dFTl9TVVBQT1JULA0KPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgR0VOTUFTSyhwY2llLQ0KPiA+ID4gPm1heF9saW5rX3Nw
ZWVkDQo+ID4gPiAtIDIsIDApKTsNCj4gPiA+ICsgICAgfQ0KPiA+ID4gICAgICB3cml0ZWxfcmVs
YXhlZCh2YWwsIHBjaWUtPmJhc2UgKyBQQ0lFX1NFVFRJTkdfUkVHKTsNCj4gPiA+IA0KPiA+ID4g
KyAgICAvKiBTZXQgTGluayBDb250cm9sIDIgKExOS0NUTDIpIHNwZWVkIHJlc3RyaWN0aW9uLCBp
ZiBhbnkgKi8NCj4gPiA+ICsgICAgaWYgKHBjaWUtPm1heF9saW5rX3NwZWVkKSB7DQo+ID4gPiAr
ICAgICAgICAgICAgdmFsID0gcmVhZGxfcmVsYXhlZChwY2llLT5iYXNlICsNCj4gPiA+IFBDSUVf
Q09ORl9MSU5LMl9DVExfU1RTKTsNCj4gPiA+ICsgICAgICAgICAgICB2YWwgJj0gflBDSUVfQ09O
Rl9MSU5LMl9MQ1IyX0xJTktfU1BFRUQ7DQo+ID4gPiArICAgICAgICAgICAgdmFsIHw9IEZJRUxE
X1BSRVAoUENJRV9DT05GX0xJTksyX0xDUjJfTElOS19TUEVFRCwNCj4gPiA+IHBjaWUtPm1heF9s
aW5rX3NwZWVkKTsNCj4gPiA+ICsgICAgICAgICAgICB3cml0ZWxfcmVsYXhlZCh2YWwsIHBjaWUt
PmJhc2UgKw0KPiA+ID4gUENJRV9DT05GX0xJTksyX0NUTF9TVFMpOw0KPiA+ID4gKyAgICB9DQo+
ID4gPiArDQo+ID4gPiAgICAgIC8qIFNldCBjbGFzcyBjb2RlICovDQo+ID4gPiAgICAgIHZhbCA9
IHJlYWRsX3JlbGF4ZWQocGNpZS0+YmFzZSArIFBDSUVfUENJX0lEU18xKTsNCj4gPiA+ICAgICAg
dmFsICY9IH5HRU5NQVNLKDMxLCA4KTsNCj4gPiA+IEBAIC0xMDA0LDkgKzEwMjksMjEgQEAgc3Rh
dGljIHZvaWQgbXRrX3BjaWVfcG93ZXJfZG93bihzdHJ1Y3QNCj4gPiA+IG10a19nZW4zX3BjaWUg
KnBjaWUpDQo+ID4gPiAgICAgIHJlc2V0X2NvbnRyb2xfYnVsa19hc3NlcnQocGNpZS0+c29jLT5w
aHlfcmVzZXRzLm51bV9yZXNldHMsDQo+ID4gPiBwY2llLT5waHlfcmVzZXRzKTsNCj4gPiA+ICAg
fQ0KPiA+ID4gDQo+ID4gPiArc3RhdGljIGludCBtdGtfcGNpZV9nZXRfY29udHJvbGxlcl9tYXhf
bGlua19zcGVlZChzdHJ1Y3QNCj4gPiA+IG10a19nZW4zX3BjaWUgKnBjaWUpDQo+ID4gPiArew0K
PiA+ID4gKyAgICB1MzIgdmFsOw0KPiA+ID4gKyAgICBpbnQgcmV0Ow0KPiA+ID4gKw0KPiA+ID4g
KyAgICB2YWwgPSByZWFkbF9yZWxheGVkKHBjaWUtPmJhc2UgKyBQQ0lFX0JBU0VfQ0ZHX1JFRyk7
DQo+ID4gPiArICAgIHZhbCA9IEZJRUxEX0dFVChQQ0lFX0JBU0VfQ0ZHX1NQRUVELCB2YWwpOw0K
PiA+ID4gKyAgICByZXQgPSBmbHModmFsKTsNCj4gPiA+ICsNCj4gPiA+ICsgICAgcmV0dXJuIHJl
dCA+IDAgPyByZXQgOiAtRUlOVkFMOw0KPiA+ID4gK30NCj4gPiA+ICsNCj4gPiA+ICAgc3RhdGlj
IGludCBtdGtfcGNpZV9zZXR1cChzdHJ1Y3QgbXRrX2dlbjNfcGNpZSAqcGNpZSkNCj4gPiA+ICAg
ew0KPiA+ID4gLSAgICBpbnQgZXJyOw0KPiA+ID4gKyAgICBpbnQgZXJyLCBtYXhfc3BlZWQ7DQo+
ID4gPiANCj4gPiA+ICAgICAgZXJyID0gbXRrX3BjaWVfcGFyc2VfcG9ydChwY2llKTsNCj4gPiA+
ICAgICAgaWYgKGVycikNCj4gPiA+IEBAIC0xMDMxLDYgKzEwNjgsMjAgQEAgc3RhdGljIGludCBt
dGtfcGNpZV9zZXR1cChzdHJ1Y3QNCj4gPiA+IG10a19nZW4zX3BjaWUNCj4gPiA+ICpwY2llKQ0K
PiA+ID4gICAgICBpZiAoZXJyKQ0KPiA+ID4gICAgICAgICAgICAgIHJldHVybiBlcnI7DQo+ID4g
PiANCj4gPiA+ICsgICAgZXJyID0gb2ZfcGNpX2dldF9tYXhfbGlua19zcGVlZChwY2llLT5kZXYt
Pm9mX25vZGUpOw0KPiA+ID4gKyAgICBpZiAoZXJyID4gMCkgew0KPiA+ID4gKyAgICAgICAgICAg
IC8qIEdldCB0aGUgbWF4aW11bSBzcGVlZCBzdXBwb3J0ZWQgYnkgdGhlIGNvbnRyb2xsZXINCj4g
PiA+ICovDQo+ID4gPiArICAgICAgICAgICAgbWF4X3NwZWVkID0NCj4gPiA+IG10a19wY2llX2dl
dF9jb250cm9sbGVyX21heF9saW5rX3NwZWVkKHBjaWUpOw0KPiA+ID4gKw0KPiA+ID4gKyAgICAg
ICAgICAgIC8qIFNldCBtYXhfbGlua19zcGVlZCBvbmx5IGlmIHRoZSBjb250cm9sbGVyDQo+ID4g
PiBzdXBwb3J0cw0KPiA+ID4gaXQgKi8NCj4gPiA+ICsgICAgICAgICAgICBpZiAobWF4X3NwZWVk
ID49IDAgJiYgbWF4X3NwZWVkIDw9IGVycikgew0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
cGNpZS0+bWF4X2xpbmtfc3BlZWQgPSBlcnI7DQo+ID4gDQo+ID4gRG8gd2UgbmVlZCB0byBzZXQg
aXQgdG8gbWF4X3NwZWVkPyBTaW5jZSB0aGUgaGFyZHdhcmUgb25seSBzdXBwb3J0cw0KPiA+IHNw
ZWVkcyBsb3dlciB0aGFuIG1heF9zcGVlZC4NCj4gPiANCj4gDQo+IFRoZSBjb250cm9sbGVyJ3Mg
ZGVmYXVsdCB2YWx1ZSBpcyBhbHJlYWR5ICJtYXggc3BlZWQiIChhbGwgR2VuDQo+IHN1cHBvcnRl
ZCkNCj4gc28uLi4gbm8sIHdlIHRha2UgYWN0aW9uIG9ubHkgaWYgRFQgc2F5cyB0byBhcHBseSBh
IGxpbWl0Lg0KDQpIaSBBbmdlbG8sDQoNCkkgY29uZmlybWVkIHdpdGggb3VyIGRlc2lnbmVyIGFu
ZCBkaWQgc29tZSB0ZXN0cyBvbiB0aGUgTVQ4MTk1DQpwbGF0Zm9ybS4gV2UgY2Fubm90IG92ZXJy
aWRlIHRoZSBzcGVlZCBpZiBEVCBzZXRzIGl0IGhpZ2hlciB0aGFuIHdoYXQNCnRoZSBoYXJkd2Fy
ZSBzdXBwb3J0cy4NCg0KVGhlIG1heCBsaW5rIHNwZWVkIGluIHRoZSBQQ0lFX1NFVFRJTkdfUkVH
IHdpbGwgYmUgcmVmbGVjdGVkIGluIHRoZQ0KY29ycmVzcG9uZGluZyBmaWVsZCBvZiB0aGUgTGlu
ayBDYXBhYmlsaXRpZXMgUmVnaXN0ZXIuIElmIHdlIHNldCBpdA0KaGlnaGVyIHRoYW4gd2hhdCB0
aGUgaGFyZHdhcmUgc3VwcG9ydHMsIGl0IHdpbGwgc2hvdyB0aGUgd3JvbmcgdmFsdWUNCndoZW4g
dXNpbmcgImxzcGNpIC12diIsIGFuZCB0aGUgUENJZSBsaW5rIHdpbGwgZHJvcCB0byBHZW4xIHNp
bmNlIHRoZQ0KaGFyZHdhcmUgZG9lcyBub3Qgc3VwcG9ydCBzdWNoIGEgaGlnaCBzcGVlZC4NCg0K
VGhlIE1UODE5NSBQQ0llMCBvbmx5IHN1cHBvcnQgdXAgdG8gR2VuMyBzcGVlZC4gV2l0aCB0aGlz
IHBhdGNoLCBJIHNldA0KIm1heC1saW5rLXNwZWVkID0gPDQ+IiBpbiBEVCBhbmQgY29ubmVjdGVk
IGEgR2VuNCBzdXBwb3J0ZWQgZGV2aWNlLCB0aGUNCm91dHB1dCBvZiAibHNwY2kgLXZ2IiB3aWxs
IGJlIGFzIGZvbGxvd3M6DQouLi4NCkxua0NhcDogUG9ydCAjMSwgU3BlZWQgMTZHVC9zLCBXaWR0
aCB4MiwgQVNQTSBMMHMgTDEsIEV4aXQgTGF0ZW5jeSBMMHMNCjwydXMsIEwxIDw4dXMNCi4uLg0K
TG5rU3RhOiBTcGVlZCAyLjVHVC9zIChkb3duZ3JhZGVkKSwgV2lkdGggeDIgKG9rKQ0KLi4uDQoN
ClRoYW5rcy4NCg0KPiANCj4gQ2hlZXJzLA0KPiBBbmdlbG8NCj4gDQo+ID4gVGhhbmtzLg0KPiA+
IA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgZGV2X2RiZyhwY2llLT5kZXYsDQo+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICJNYXggY29udHJvbGxlciBsaW5rIHNwZWVkIEdl
biVkLA0KPiA+ID4gb3ZlcnJpZGUgdG8gR2VuJXUiLA0KPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBtYXhfc3BlZWQsIHBjaWUtPm1heF9saW5rX3NwZWVkKTsNCj4gPiA+ICsgICAg
ICAgICAgICB9DQo+ID4gPiArICAgIH0NCj4gPiA+ICsNCj4gPiA+ICAgICAgLyogVHJ5IGxpbmsg
dXAgKi8NCj4gPiA+ICAgICAgZXJyID0gbXRrX3BjaWVfc3RhcnR1cF9wb3J0KHBjaWUpOw0KPiA+
ID4gICAgICBpZiAoZXJyKQ0KPiANCj4gDQo=

