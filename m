Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603B4CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 07:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dkJwm6Q94fbm1hhFfNT0bKtzIbfhRDVxslOvl7N6SUY=; b=xbBjvF3c2oxJa4eDZ0GH4H9PYe
	7wqFHD5Ml5/+fDoHdUsNgh+gpQH43Dmd4Z/yTlQ13nCY3lNelNOSsB1aTWOwMvweEJH5Omq7HI5F3
	ibAD7RxjONoc/gLIrXcNpukw1+COVDZHg6oF4IqHyfEzf0v5f6jqYy+OZiLNs1H15S8dJnpQLywzt
	a4GC/ITdVKDMz/nwhJNnuVSse3y18rdHGTPk5YILNW2bXXjZJZ+F5h2ns+diZfpFoJCZjI1+N9qOb
	x3VTRjKOAMz0riIY12JtBA3ajPwAJevDzM+qWM72JmPdS41Nva09yTdur0CxGx4CHxA1jcMXwy3Ga
	XzBM0l6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsAk-0000000EXcm-1Dsh;
	Mon, 18 May 2026 07:13:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsAi-0000000EXcW-1l7Z;
	Mon, 18 May 2026 07:13:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To
	:From:Sender:Reply-To:Content-Description;
	bh=dkJwm6Q94fbm1hhFfNT0bKtzIbfhRDVxslOvl7N6SUY=; b=NNg18y+cL2ZU/7us8+VGu6HaxK
	nfoa/3Ngs5WxrvSWkidp2QXhmuErI0Aeo2y/7HdjvjEM6YNtbQLMVcYpyrMk1H38R3XkhJcPLU4rU
	K/2Y2Wv3eJxS8qj6/co+EVm/5sAL7ULG+LnSw/lanX3GdDUrq24UY0qbn20EtOAM8Duz6yxwlNwsH
	xE+L09xEFyf/YJj9P5yqVlUfcj1ZmAA5qdSulplMi90zLFdMuJ3MXa69AuZs4JNnsQBzPcM/cYp4l
	aKp1HpcFS3WglBn+cSKYnm6Ww36qFeJxcsXLAsxHJV2xGQii3ZRc4zIxDoIwaE4yUY/2p33k2n8xu
	qvpcR3SA==;
Received: from [216.200.240.185] (helo=mailgw02.mediatek.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsAc-0000000A7ty-49OI;
	Mon, 18 May 2026 07:13:51 +0000
X-UUID: 17454c60528911f1acbe4559397dec65-20260518
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=dkJwm6Q94fbm1hhFfNT0bKtzIbfhRDVxslOvl7N6SUY=;
	b=VmW7yPs4I4IARhiiqPYAhB1VClMkzm4MivzDQj4Gmmi7/o0u4XCESJDkiOsqCakWYHmdGaCVHMuDIQ4escZ9Qp1cx1yIA4Gmo+in1VDLVAzfiZRO2JpyNwam3cKqcO9ZBoPIBTpWVN0wWfE4SIuO+YpX8d091is5N5VOcrxFDjo=;
X-CID-CACHE: Type:Local,Time:202605172351-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14,REQID:14e0b5ca-3edc-405b-9a01-1c85ebaea457,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:9091e75,CLOUDID:1d8681a4-a669-48ac-a1cb-3b38a93be682,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
	l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 17454c60528911f1acbe4559397dec65-20260518
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <xueqi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1858710266; Mon, 18 May 2026 00:13:37 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 18 May 2026 15:13:35 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 18 May 2026 15:13:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6maJ6WUdk3n7cCWcyDAK6DH0Jd+SgKcThDnu2Cs6d2wS77dwnpOnXiqkO3hEwc998sATiOm0T5INL8pP70pnxghNtxBrsOFyumC+BY0QrwhQQU8yHPJEAQXSkQwNlE1UvVr0e0JSzL0pJpqSL/7TLnxqQ18sshCT0qamWgH+dKNQspXf2qovTXwpDHxoWVZXIpelP/v/QJIaqgqeZFeR846gt97CxKyuJaGFfjAsOpaOt+ViWlRbd1T7gMCWydCtrmgHHVPQ2a/OOD1XcHJjDiUjVIwpIWceLZh7mApbzcS2AGUXjnuTbGw80K9EbM6l+PThb6jL7VoVTjGQjTpTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkJwm6Q94fbm1hhFfNT0bKtzIbfhRDVxslOvl7N6SUY=;
 b=MPK/Y4uQqd9/5PzPMPi3HOm9wavxgFo+lHGkrmk0roZ3WQQwlWJoCiFaAR3ZgnBkX7Nr0qs7Q18a+oFKbt9Qq6l/6BJjx9LGkRWLLtWjMKTmZzckroyYrkAfEjy/gnOKhEPS+K1eY/OsxMUCLstGJpcryM3NCnB7Ufc/k7Qrz5LG6ZAiaSehBchXbCxGNYx/OEHOvp0IyEcNyAHhU9nuB2pyvWPgHoNDFQnQFyk+cgoW9PytOp5GeXeAXxK/10IH1p1vtdCxCmQzjnRIWMgvcJSGL/1PyXHac6UOW4MH7M7QjAQpakNNGc8JCjL23W2tLAscrcoZDQCwnz0fGtHVyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dkJwm6Q94fbm1hhFfNT0bKtzIbfhRDVxslOvl7N6SUY=;
 b=YPhURV38CS3VV26VXNvV9WJE8QBUOrSpoWQN06hdsDHNUzq8mMG2Vy5+MIfqBzouaMhgLYU1FlkYt+OZpwCVCsD98qFkG6gG1NKduOYtNuNHZ54OlznBHJX3sFveAjly2pNM5vkSmEy0BdmsSiT9lotYSiXjA6SwbeMTmDmCPCg=
Received: from TYZPR03MB6471.apcprd03.prod.outlook.com (2603:1096:400:1c9::8)
 by SI2PR03MB6438.apcprd03.prod.outlook.com (2603:1096:4:1a1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.13; Mon, 18 May
 2026 07:13:28 +0000
Received: from TYZPR03MB6471.apcprd03.prod.outlook.com
 ([fe80::6c05:f611:5357:7326]) by TYZPR03MB6471.apcprd03.prod.outlook.com
 ([fe80::6c05:f611:5357:7326%5]) with mapi id 15.21.0048.010; Mon, 18 May 2026
 07:13:28 +0000
From: =?utf-8?B?WHVlcWkgWmhhbmcgKOW8oOmbqueQpik=?= <Xueqi.Zhang@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?=
	<Yong.Wu@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "krzk@kernel.org"
	<krzk@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: =?utf-8?B?V2VuZHktU1QgTGluICjmnpfoqanluq0p?= <Wendy-ST.Lin@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/3] memory: mtk-smi: Add a flag skip_rpm
Thread-Topic: [PATCH 2/3] memory: mtk-smi: Add a flag skip_rpm
Thread-Index: AQHbmWr+ThkPYzLV/EeJKX653FeCxLN777UAgpoJGYA=
Date: Mon, 18 May 2026 07:13:28 +0000
Message-ID: <9ee5aadad0f74e61cf19336542ce7e60274e7a20.camel@mediatek.com>
References: <20250320073625.25225-1-xueqi.zhang@mediatek.com>
	 <20250320073625.25225-3-xueqi.zhang@mediatek.com>
	 <46e0e1f1-e094-40f9-99f9-22678bb40d39@collabora.com>
In-Reply-To: <46e0e1f1-e094-40f9-99f9-22678bb40d39@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6471:EE_|SI2PR03MB6438:EE_
x-ms-office365-filtering-correlation-id: a4c42ec9-6a2b-4607-70f9-08deb4acf5d2
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021|18002099003|22082099003|56012099003|4143699003|11063799003;
x-microsoft-antispam-message-info: Hlxc4PYx1v7kWLfcDMuHRRNP9V4snLyqixxTwhBGON5nhJVgcblfFbJyv+AERSTNWeq2/4JAYKeD7CfblAEmCZCg36hwtvtpf7yjJUIpQJmnZYbeTAaXg6pAlemV0RRgrZum6vWVZcl+/HaSe2Hx9HTuEGKMmgrBwHWwSuL+taajAYWtNnNsy/fK2fLEhQdMgifqmUdH2q26BNUJbYFtzknIltb4XMLcX2vzNXvlqeipBeooIM+X+vb+IcOBVQXWndtqdJZkv6SAep29wLvBTgoBSPh2/vz+xinFze263sQyma9u5gu6wa+SfIpDA/xzoh0+whFpvFpisMlB1N2ICFrkclw6Jrp60HXMgdnkZjfFePXcMh2jbV5ngFwTQYCyzucy5LUjDoTkS8e0ArxGPU/8elClynLl7sHwNLhMNVbuMYGY+8plK2KSrvWbYQgNRSsEIAUnCTLdOJO9YUDcd/rj7ms8USvqQZ89cbbYYr5OYnJX/hsVn+MWVTaNAQrFs1gcravFuzi4UylZkSDAxAVYFQjWxwY95qVRXpwK7BSVSTvqMwl0mhJd/IJ/WMkI8pjoeDy86KBLDxV3UL65RlCw7v+ktn2uNmQiH7nzJMTpOtg2jGiQM8j3unFwjuxY25mMIzv4GBUYs6x4y5CgPS8j0+pW3yLWh0iJ/CrmPGZaPSfKjnEGIROKCigd9rE571IN0to3E9g9v7t02EfaCJmstC28Em4crGIYfMSWXculDh74RLJ0DBuCb571WsrL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6471.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021)(18002099003)(22082099003)(56012099003)(4143699003)(11063799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N3FPTHJMc1FWOW11Mk83M3l4RjB3dk1RYUdUVzRCbE5jZTFkR1crMmpaWFRQ?=
 =?utf-8?B?TWRoeWc3RGt1a0Y5alNxSm9tc051SWRHNGQrRnAvc0pWM3FvbWlkVXdSVUN3?=
 =?utf-8?B?eEZKY25COVdmTDN0a3lUdGpGTnBvQm84L0tjV1lNc0YwOGFBcjAzVVZiaGZL?=
 =?utf-8?B?N09EM2NUbUF5ME9NcjhVZ3NVa1pjaWRwTUptWmI5THBWWXBKc0ZpRjRRU0h4?=
 =?utf-8?B?WHo2NGFnbkxHL0FQSnRqUVQrL2xuOERneFBSSTJMaUdCWU5JSjZUMXFwY2Fw?=
 =?utf-8?B?TW5BTVY3YUxrdnFUSlhpWG56dFovRzVBbmtYVEI4VjVsYUxpaWEyVkpKTmhT?=
 =?utf-8?B?OFo5b1piQUUycWxOT05DZU9IOVpjNW1RYnJZUHBYWjFlVHRpOVA3ekFJbjJs?=
 =?utf-8?B?NTdwSndJNk1nVXYwQUNZUWdMRjdIdFlXelA3WFcyYkVkNUtJZnRHSmloTjM4?=
 =?utf-8?B?YjZDcGZCb3VwTFVGc0s4NjNBMGtJUW9NTlpVd3dNYjlCRmwySVBaL0RCdkNI?=
 =?utf-8?B?NmM4M3kwRHpqYnkvVExlTENDVmZQc0d5UlAvcU1LTFJ6WDd5UGNUYUNwdTBu?=
 =?utf-8?B?aml5L1kyMUZLUStCREVOOWk1WHUwb29udXo2MXNMT3NOT1VLQTdEcS9rdlVD?=
 =?utf-8?B?UHN1dTJLYnlBVzZnUHJoRFc2L05CdVJMRGx0a3VIY3NjVWRlN1E4TXpsbXdS?=
 =?utf-8?B?d2cyU1UwLytFWTN4ZDZhMGVBZFp3VDJRcENRcndtdkZRckgraDE5OVlvL3R5?=
 =?utf-8?B?ZHQ2SnRYSGwzZzFOZ2dNWkJwa3diMlk0QUtRcXJvY2tCYWR4SG1wR0RWTko1?=
 =?utf-8?B?cmZTMXZ2T1FyNTJYVVJreDZCWlg4QUxQTEdjc2IvNm45a3lENVUzeEZsbG9z?=
 =?utf-8?B?dmwwS1psVlJKTitQVEZVamFOTFp5RG80dy9PUEQza1lGclZ3ZXlGbVMvM0VD?=
 =?utf-8?B?YVVZVk92RGlhdThmbHV6aC9kMTcrUXNESndOZFBTMVhmYVFqZ0hIY2UwUGNt?=
 =?utf-8?B?UUVCbWl6M2Y0YUlFU1g0cGY5SzVTUW5RWnlMSWlmSlVlOFprT3puMWY0ZGpp?=
 =?utf-8?B?TmlqdXlhU3pON2VNdEU4TlVnaDhUSHR6TWYvNG8xSGFKZHNBQzJpcjdJWnYw?=
 =?utf-8?B?MzlTOGtTdGlaaEpNSENRMVQ1d0tzdWFZYXluOEJsaXNxNGJ0ckErc09ORkZI?=
 =?utf-8?B?N0R3dFFRSUdIQlBEYnU3cS81bWJ6K0RXaTNGclBoN0hVWUZkb1NlN0poTFlP?=
 =?utf-8?B?cDNJeTY5NXZtVlVVcyt0RSt5d0VjMWhkZlM3cExJbXczNUhaVVhScmc0R3pW?=
 =?utf-8?B?TUdyUWVERHRDbVE2TkRWdU1BaFJyL0t3Wk0yT3p4MithT3pBWGkrbXl4ZWd1?=
 =?utf-8?B?NXFXZEh6TjRXSU5BR0Z4dlVpY09MVDEvRmJ5U1IvWUMwT2RKbnVyQVBiOEJt?=
 =?utf-8?B?MTQ4R05GcEozb2FZb3UvbXlyaHlic3A3U3VuQzNrcnlnaENUU0grS3RRYTJI?=
 =?utf-8?B?WHJKcDh3RE1CSW8xU2VNMmNQMTlKR2N0bGdOc2h1QXBiUjBJaWtxMWdqeXFT?=
 =?utf-8?B?aEtSclR2ejJBYmwxald0N3NwWUJIYXpNaG1IUEplNkZZeFhCZndOSWNydW5C?=
 =?utf-8?B?VWVIUzJvdVpNTWh6SkpRdjgvc0ZyVVl1a00rZ1lwaUE5eWhqbURRVFQ5Ujky?=
 =?utf-8?B?OE4vdnVOaDFTei9zbXJGajJRREtnRzRUQk5yaDk3WkttdDE5Qm0ra2RoSVRS?=
 =?utf-8?B?ZStsUHBTckdoM21IVTBvV2dEQWJ2T1hwdzBGODBMNDFGMU1DRFI1WWVUcENW?=
 =?utf-8?B?dXlSeFhWMXhYa1FtSmZ4b0NFVXNRQUhReVYxZm9RYUdieGVVS0xYMnhVKzBh?=
 =?utf-8?B?SzZ2UklYa2h2ZnpqU1RVOWJZSmZMVEZkN29tRmRyckFnVHkwZ0JUdGp5TVoy?=
 =?utf-8?B?YUhLWE1WL014dG5VVHFJWWxOTW0yL0VwV09pT210cllHcEZiY3JIYkRKeGky?=
 =?utf-8?B?N2c2WWVGQW1uSk1ZU2JON0Z0ZXdIVTFoOE5oNlVMdS9RZEFmR2xxc3dIRzhN?=
 =?utf-8?B?cGl2cEFtQXkwQ0QwYWIxNWdWd0xST2VyT05yVmVnOGJSVGVsdStEVzZnc3l6?=
 =?utf-8?B?YUdwckNRZTQxU1RvYnV0RW4xcFZ1ZnI4SmlMM01qZmVCSlRjS0FFZWJXSGg4?=
 =?utf-8?B?SEdtNkk0M0hZUHhWTm9XN3FVNU5pcmNCRHdBZlJQZE9HelBnOUZnNGJPcFM3?=
 =?utf-8?B?bWRPTDBhUzFtS25DOFBtSDVUaGZkYVpNSDJ5WnU5MjFsSGVXaCtLWDlRdHBp?=
 =?utf-8?B?ZzhmUTlJQzJsZ0hjWExpSm5CVmFNWkNiMnBYT2pwRnVvQ0FwSXZLQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <90CB56DEA25D37409AF9560541394A94@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: NjlKjZ5ew6+b+dGSfvCNiD+INHql/nWAE0wVdue4FvWqfM97q9NtNZk+k3mb74TnybW9IZ5/DfYIi6sU7sKs6+lr67R2YcUVKEA9EbsqQx3Ho8PoC+IZqqtW1TLoepRDMMwLLmVkXzyqN15JTRb15G1W6LSvGLRqJtRdgz023hZpQg+IQTz7rzrqKUg+rrkFB1VKrZeGflX1fN8lpWICbwrBwnp6re9aezivROTziTbiolwHwPFxYOvoOyUPPdkV+P02k2xEQ/j6mojfHWPdDqYHH6fE5Zzs8PlwkWHgZshouSxPxzQ5FbqD7XDSL6ouOqSw0lYxxL/vp6IKbzV40g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6471.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4c42ec9-6a2b-4607-70f9-08deb4acf5d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2026 07:13:28.4366
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6bcn/xr4czZuZwRvXUZIM1WPNX6FKvGvNrO0S2NgBJdlXmCH5k2LMm0IrFpnhwFsDFmWgyw+NmGjgJ4qwLvZZ+nyqUIzXiUkmxC7OaofCUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6438
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_081348_361946_D5637DAD 
X-CRM114-Status: GOOD (  28.35  )
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

SGkgQW5nZWxvLA0KDQpGaXJzdCBvZiBhbGwsIHBsZWFzZSBhY2NlcHQgbXkgYXBvbG9naWVzIGZv
ciB0aGUgZGVsYXllZCByZXNwb25zZS4gSSANCmhhdmUgYmVlbiBkZWVwbHkgb2NjdXBpZWQgd2l0
aCBNVDgxOTYgQWx1bWluaXVtIHBLVk0gU01NVSBhbmQgU01JIA0KcmVsYXRlZCB0YXNrcyByZWNl
bnRseS4NCg0KUmVnYXJkaW5nIHlvdXIgcXVlc3Rpb24sIG15IHByZXZpb3VzIGRlc2NyaXB0aW9u
IGluIHRoZSBwYXRjaCB3YXMgbm90IA0KYWNjdXJhdGUgZW5vdWdoIGFuZCBtYXkgaGF2ZSBjYXVz
ZWQgc29tZSBjb25mdXNpb24uIEluIGZhY3QsIG5vdCANCmFsbCBTTUkgY29tbW9ucyBoYXZlIHRo
ZWlyIGJhY2t1cC9yZXN0b3JlIGhhbmRsZWQgYnkgdGhlIFJURkYgDQpoYXJkd2FyZS4gVGhlIFNN
SSBjb21tb25zIGFyZSBkaXN0cmlidXRlZCBhY3Jvc3MgdmFyaW91cyBzdWJzeXN0ZW1zIA0KKGUu
Zy4sIG1taW5mcmEsIHZlbmMsIGRpc3BsYXksIGNhbSwgZXRjLikuIEN1cnJlbnRseSwgb25seSB0
aGUgU01JIA0KY29tbW9uIHVuZGVyIHRoZSBtbWluZnJhIHN1YnN5c3RlbSBpcyBiYWNrZWQgdXAg
YW5kIHJlc3RvcmVkIGJ5IA0KdGhlIFJURkYgaGFyZHdhcmUuDQoNClRoZXJlZm9yZSwgSSBiZWxp
ZXZlIGFkZGluZyBhIHNwZWNpZmljICdza2lwX3JwbScgZmxhZyBpcyBtb3JlIA0KYXBwcm9wcmlh
dGUgaGVyZS4gSWYgd2Ugd2VyZSB0byBkaWZmZXJlbnRpYXRlIHRoaXMgYmFzZWQgb24gYSBuZXcg
DQpNVEtfU01JX0dFTjMgdHlwZSwgaXQgd291bGQgaW1wbHkgdGhhdCBhbGwgU01JIGNvbW1vbiBt
b2R1bGVzIG9mIA0KdGhhdCBnZW5lcmF0aW9uIHdvdWxkIHNraXAgdGhlIFJQTSBvcGVyYXRpb25z
LCB3aGljaCBpcyBub3QgdGhlIA0KaW50ZW5kZWQgYmVoYXZpb3IuDQoNClRvIG1ha2UgdGhpcyBj
bGVhcmVyLCBJIHBsYW4gdG8gdXBkYXRlIHRoZSBjb21taXQgbWVzc2FnZSBpbiB0aGUgDQpuZXh0
IHZlcnNpb24gYXMgZm9sbG93czoNCg0KU3ViamVjdDogbWVtb3J5OiBtdGstc21pOiBBZGQgc2tp
cF9ycG0gZmxhZyBmb3IgY2VydGFpbiBNVDgxOTYgU01JDQpjb21tb25zDQoNCkJvZHk6DQpPbiBN
VDgxOTYsIGNlcnRhaW4gU01JIGNvbW1vbnMgYXJlIGJhY2tlZCB1cCBhbmQgcmVzdG9yZWQgYnkg
dGhlIFJURkYgDQpoYXJkd2FyZSByYXRoZXIgdGhhbiBieSBzb2Z0d2FyZS4gDQoNCkZvciB0aGVz
ZSBzcGVjaWZpYyBTTUkgY29tbW9ucywgc29mdHdhcmUtY29udHJvbGxlZCByZWdpc3RlciBiYWNr
dXAgDQphbmQgcmVzdG9yZSBpbiB0aGUgcnVudGltZSBjYWxsYmFjayBpcyBubyBsb25nZXIgbmVj
ZXNzYXJ5LiBUaGVyZWZvcmUsIA0KaW50cm9kdWNlIGEgJ3NraXBfcnBtJyBmbGFnIHRvIGJ5cGFz
cyB0aGVzZSByZWR1bmRhbnQgUlBNb3BlcmF0aW9ucw0KZm9yIHRoZXNlIFNNSSBjb21tb25zLg0K
DQpXaGF0IGRvIHlvdSB0aGluayBhYm91dCB0aGlzIGFwcHJvYWNoPw0KDQpGb3IgcmVmZXJlbmNl
LCBoZXJlIGlzIHRoZSBsaW5rIHRvIHRoZSBwYXRjaCBzZXJpZXMgb24gUGF0Y2h3b3JrOg0KDQpo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvbGlzdC8/
c2VyaWVzPTk0NTgxMSZhcmNoaXZlPWJvdGgNCg0KVGhhbmtzLA0KWHVlcWkNCg0KT24gVGh1LCAy
MDI1LTAzLTIwIGF0IDEzOjExICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyB3cm90
ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4g
YXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUg
Y29udGVudC4NCj4gDQo+IA0KPiBJbCAyMC8wMy8yNSAwODozNiwgWHVlcWkgWmhhbmcgaGEgc2Ny
aXR0bzoNCj4gPiBNVDgxOTYgU01JIGNvbW1vbnMgaXMgYmFja2VkIHVwL3Jlc3RvcmVkIGJ5IFJU
RkYgSFcuDQo+ID4gSXQgZG9lc24ndCBuZWVkIFNXIGNvbnRyb2wgdGhlIHJlZ2lzdGVyIGJhY2t1
cC9zdG9yZQ0KPiA+IGluIHRoZSBydW50aW1lIGNhbGxiYWNrLlRoZXJlZm9yZSwgYWRkIGEgZmxh
ZyBza2lwX3JwbQ0KPiA+IHRvIGhlbHAgc2tpcCBSUE0gb3BlcmF0aW9ucyBmb3IgU01JIGNvbW1v
bnMuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogWHVlcWkgWmhhbmcgPHh1ZXFpLnpoYW5nQG1l
ZGlhdGVrLmNvbT4NCj4gDQo+IFNvIHRoZSBNVDgxOTYgU01JIGNvbW1vbiBkb2Vzbid0IHJlcXVp
cmUgYW55IGNsb2Nrcz8NCj4gDQo+IFRoYXQncyBmaW5lIGZvciBtZSwgYnV0IHRoaXMgbG9va3Mg
Ymxvb2R5IHNpbWlsYXIgdG8gTVQ2OTg5J3MgU01JDQo+IGNvbW1vbiwgd2hpY2gNCj4gaXMgU01J
IEdFTjMgYW5kIG5vdCBHRU4yLi4uLg0KPiANCj4gLi4uLnNvLCBhcmUgeW91IHN1cmUgdGhhdCB5
b3UgbmVlZCBhIGBza2lwX3JwbWAgZmxhZyBhbmQgbm90IG5ldw0KPiBNVEtfU01JX0dFTjMgYW5k
DQo+IE1US19TTUlfR0VOM19TVUJfQ09NTSB0eXBlcz8gOi0pDQo+IA0KPiBSZWdhcmRzLA0KPiBB
bmdlbG8NCj4gDQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL21lbW9yeS9tdGstc21pLmMgfCAxMSAr
KysrKysrKy0tLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZW1vcnkvbXRrLXNtaS5j
IGIvZHJpdmVycy9tZW1vcnkvbXRrLXNtaS5jDQo+ID4gaW5kZXggYThmNTQ2N2Q2YjMxLi5iOWFm
ZmEzYzMxODUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZW1vcnkvbXRrLXNtaS5jDQo+ID4g
KysrIGIvZHJpdmVycy9tZW1vcnkvbXRrLXNtaS5jDQo+ID4gQEAgLTEyMyw2ICsxMjMsNyBAQCBz
dGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IG10a19zbWlfY29tbW9uX2Nsa3NbXQ0KPiA+ID0geyJh
cGIiLCAic21pIiwgImdhbHMwIiwgImdhbHMxDQo+ID4gICBzdHJ1Y3QgbXRrX3NtaV9jb21tb25f
cGxhdCB7DQo+ID4gICAgICAgZW51bSBtdGtfc21pX3R5cGUgICAgICAgdHlwZTsNCj4gPiAgICAg
ICBib29sICAgICAgICAgICAgICAgICAgICBoYXNfZ2FsczsNCj4gPiArICAgICBib29sICAgICAg
ICAgICAgICAgICAgICBza2lwX3JwbTsNCj4gPiAgICAgICB1MzIgICAgICAgICAgICAgICAgICAg
ICBidXNfc2VsOyAvKiBCYWxhbmNlIHNvbWUgbGFyYnMgdG8NCj4gPiBlbnRlciBtbXUwIG9yIG1t
dTEgKi8NCj4gPiANCj4gPiAgICAgICBjb25zdCBzdHJ1Y3QgbXRrX3NtaV9yZWdfcGFpciAgICpp
bml0Ow0KPiA+IEBAIC01NDcsNiArNTQ4LDkgQEAgc3RhdGljIGludCBtdGtfc21pX2R0c19jbGtf
aW5pdChzdHJ1Y3QgZGV2aWNlDQo+ID4gKmRldiwgc3RydWN0IG10a19zbWkgKnNtaSwNCj4gPiAg
IHsNCj4gPiAgICAgICBpbnQgaSwgcmV0Ow0KPiA+IA0KPiA+ICsgICAgIGlmIChzbWktPnBsYXQt
PnNraXBfcnBtKQ0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuIDA7DQo+ID4gKw0KPiA+ICAgICAg
IGZvciAoaSA9IDA7IGkgPCBjbGtfbnJfcmVxdWlyZWQ7IGkrKykNCj4gPiAgICAgICAgICAgICAg
IHNtaS0+Y2xrc1tpXS5pZCA9IGNsa3NbaV07DQo+ID4gICAgICAgcmV0ID0gZGV2bV9jbGtfYnVs
a19nZXQoZGV2LCBjbGtfbnJfcmVxdWlyZWQsIHNtaS0+Y2xrcyk7DQo+ID4gQEAgLTc4Myw3ICs3
ODcsNyBAQCBzdGF0aWMgaW50IG10a19zbWlfY29tbW9uX3Byb2JlKHN0cnVjdA0KPiA+IHBsYXRm
b3JtX2RldmljZSAqcGRldikNCj4gPiAgICAgICBjb21tb24tPmRldiA9IGRldjsNCj4gPiAgICAg
ICBjb21tb24tPnBsYXQgPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsNCj4gPiANCj4g
PiAtICAgICBpZiAoY29tbW9uLT5wbGF0LT5oYXNfZ2Fscykgew0KPiA+ICsgICAgIGlmICghY29t
bW9uLT5wbGF0LT5za2lwX3JwbSAmJiBjb21tb24tPnBsYXQtPmhhc19nYWxzKSB7DQo+ID4gICAg
ICAgICAgICAgICBpZiAoY29tbW9uLT5wbGF0LT50eXBlID09IE1US19TTUlfR0VOMikNCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgY2xrX3JlcXVpcmVkID0gTVRLX1NNSV9DT01fR0FMU19SRVFf
Q0xLX05SOw0KPiA+ICAgICAgICAgICAgICAgZWxzZSBpZiAoY29tbW9uLT5wbGF0LT50eXBlID09
IE1US19TTUlfR0VOMl9TVUJfQ09NTSkNCj4gPiBAQCAtODE0LDEzICs4MTgsMTQgQEAgc3RhdGlj
IGludCBtdGtfc21pX2NvbW1vbl9wcm9iZShzdHJ1Y3QNCj4gPiBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpDQo+ID4gICAgICAgfQ0KPiA+IA0KPiA+ICAgICAgIC8qIGxpbmsgaXRzIHNtaS1jb21tb24g
aWYgdGhpcyBpcyBzbWktc3ViLWNvbW1vbiAqLw0KPiA+IC0gICAgIGlmIChjb21tb24tPnBsYXQt
PnR5cGUgPT0gTVRLX1NNSV9HRU4yX1NVQl9DT01NKSB7DQo+ID4gKyAgICAgaWYgKGNvbW1vbi0+
cGxhdC0+dHlwZSA9PSBNVEtfU01JX0dFTjJfU1VCX0NPTU0gJiYgIWNvbW1vbi0NCj4gPiA+cGxh
dC0+c2tpcF9ycG0pIHsNCj4gPiAgICAgICAgICAgICAgIHJldCA9IG10a19zbWlfZGV2aWNlX2xp
bmtfY29tbW9uKGRldiwgJmNvbW1vbi0NCj4gPiA+c21pX2NvbW1vbl9kZXYpOw0KPiA+ICAgICAg
ICAgICAgICAgaWYgKHJldCA8IDApDQo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBy
ZXQ7DQo+ID4gICAgICAgfQ0KPiA+IA0KPiA+IC0gICAgIHBtX3J1bnRpbWVfZW5hYmxlKGRldik7
DQo+ID4gKyAgICAgaWYgKCFjb21tb24tPnBsYXQtPnNraXBfcnBtKQ0KPiA+ICsgICAgICAgICAg
ICAgcG1fcnVudGltZV9lbmFibGUoZGV2KTsNCj4gPiAgICAgICBwbGF0Zm9ybV9zZXRfZHJ2ZGF0
YShwZGV2LCBjb21tb24pOw0KPiA+ICAgICAgIHJldHVybiAwOw0KPiA+ICAgfQ0KPiANCj4gDQo=

