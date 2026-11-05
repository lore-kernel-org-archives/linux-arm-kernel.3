Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A630606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 01:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZuCEHRSX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7vse3ViezMmqsUhug81+NmUMYq7Dwq3ZzbN87KD60lk=; b=ZuCEHRSXCsXida43DxwFwvH7AL
	fwx3DjVEhVSL/jKwEQdiQKMxUHtqYPZs3YiKFW1CnM0U4r6DNP55cZXE+nAJkNxo2wMswnkR23ibE
	rNZgZgzeVXeHQGw3cV6+CZxxMea+Yp7YBovCUziOeMHHYXgdnQe7ERGBIrZME4DwrbftqeqV9qcjU
	W69vzs0A33uBb9fAgZ0XB/Hg+RDuHZlBrLaIJMokzAWgudZW7ornbeWzwRe3ZnXshHqhF4O9hIvrd
	Vwtvc00kNeD49QWfG4HrkJ+Fgc5jD3nWzJ5Llg5KiSN0sCLZ6/x6e+hNbAQJUmidi0aYTNtk6ZLV1
	kBa3Rzfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOm7y-00000007SEP-30bI;
	Thu, 05 Nov 2026 01:18:54 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOm7g-00000007RpZ-2ygW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 01:18:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hCO5tWf6EtCTbxpeCLtABvZHAunLwzNXBt3P1lhjEvMvbWCs8gJFMIVXCM7zGdNoQ58fME8CWBmiIDWi2O9G0h61BOAZIIYZFMcSyJygcq/MQfIzyLYVra/pQbpShnCJOysH08ihtxsn6SWb1kDfEcwKtKbDn+7pdEfknQm26rNbCkeeTuWNwA5WwLLflq4rlrJJoNLWi0ajfmsMDV+7GOF9nyTpT1I+v4Mq8STRvT2lJrRTkZ5Xp8vNr24JUDlIMrQxN95qmNYXKqpJqL+TYEQDk3BlSONqp2yPLmPhG64bB7pBewc/pZV6iYVoaRshDoa1wkdvjXUYbcgZlTHn6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7vse3ViezMmqsUhug81+NmUMYq7Dwq3ZzbN87KD60lk=;
 b=KWCd22y1rM6p0lwN4H3HWOC9ffdlISLuZNPkTQUS3ViSYmyXjKVYj5V0EH5P2kEPVmuEul0bkz49kYHKL2OFJxhvFwWEoobBhEq8GYFFZ4yB4JP9LItUyOBqzuLboC1Q2K69uXlYpXwm7Og7WgPS2O5UiJgAcdpAwh3eMUQqeTmiTgIt5I1oFz9bdLBogtjH50stcf57Zjvpr5MfEC/hzStM+8xg1Q6dfM/mbog9c6vw91uz+Z3+7kBZ2kX38wGjvseA+US2EKmqYAo3Elguit0oFfHlhxPUO8T9Wfj5ZG8XiDpwM4OpwUG6mAITjW90wToJUenL2/78M97sMhvKxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PSAPR06MB4439.apcprd06.prod.outlook.com (2603:1096:301:80::7)
 by TYSPR06MB6921.apcprd06.prod.outlook.com (2603:1096:400:468::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 01:18:19 +0000
Received: from PSAPR06MB4439.apcprd06.prod.outlook.com
 ([fe80::c772:e1f:2c48:f9ac]) by PSAPR06MB4439.apcprd06.prod.outlook.com
 ([fe80::c772:e1f:2c48:f9ac%3]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 01:18:19 +0000
From: =?utf-8?B?SG9uZ2xpYW5nIFlhbmcgKOadqOWuj+S6rik=?=
	<hongliang.yang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: =?utf-8?B?SG9uZ2xpYW5nIFlhbmcgKOadqOWuj+S6rik=?=
	<hongliang.yang@cixtech.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject: Re: [PATCH v5 0/3] usb: cdns3: Add CIX Sky1 USBSSP controller support
Thread-Topic: [PATCH v5 0/3] usb: cdns3: Add CIX Sky1 USBSSP controller
 support
Thread-Index: AQHda2fe/wkB55iUgkOIZj/rFCPKsbcdidKAgAEmbIA=
Date: Thu, 5 Nov 2026 01:18:19 +0000
Message-ID: <20261105011813.4058647-2-hongliang.yang@cixtech.com>
References: <20261103074929.1971195-1-hongliang.yang@cixtech.com>
 <25b75ddc-65d5-44e7-9a6e-861ed9c96f18@kernel.org>
In-Reply-To: <25b75ddc-65d5-44e7-9a6e-861ed9c96f18@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4439:EE_|TYSPR06MB6921:EE_
x-ms-office365-filtering-correlation-id: 1eac61fe-cab1-456d-32b6-08df3adaad2b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|18002099003|261102123227099003|22082099003|56012099006|38070700021|4143699003|5023799004|261021121427099003|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261021123027099003;
x-microsoft-antispam-message-info: WpGbCcd2pX3vFvaIkb/fZI6oQn+uLRZw5WliIrHHMmMD8iwdl2DwEjItJBs8y7EiXVxmmdUJIOAFNK6rMedfib5mcLX6L52NBWWd8QYQbkdnKbNI6fE7nFhQBWCLmTGO9FQvembcIHKatrwRZ46zNyUDwlOCYkI4SgGX6yNDQ0UZSfXJhIgr1DfaoHm2fKBPNzCwFQD8S+SlgOcLUSgu9QN6qeGtcx80qcjmnb7yfGGD7iLEMU574Vfjog2fx8QuMaRnkICz9kpnTvT1nxrOjYNTTmd9rhclFcBpiuOxvvbv6zB8UjMfYwtZMk874RvMpfj9by+JHkx4D7lB05bzilgAguJpOkV9eE6MQNHIkt85HovUv6Ox7KgWelSA6ORzzF8nJPaSQJgSB0d3HMASHSxL7DRkJgjSvjcwN3PaGrd0P21eNqHfwNeamnttcEcRrIeY287LKrzHfujehptTl/ze/O3HdJiEe19TsJIhLi77NxrxpbRfKsYUrxwBVAFSu3AaFuKh7qQrRJE3sWydNtxnbE079ysrBk+4snkqqVJnxAgI8OCJ/2dNx5wRtdIJcLiILYsShfnkTuQ/dBI8pDmR8+lDEmFJSjraHnx/+lff4g0GMYWTZaLve932tRS06Zju9AjyZHI4yeKD8IAbP/x+7qvks8i4NAJSqueO6J5r2JNe6AdRhnsAHen/B2pXM2UZTt2BgMoW96nh6nc85LzdiO8diGVTWAeoFIgKcqE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4439.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(18002099003)(261102123227099003)(22082099003)(56012099006)(38070700021)(4143699003)(5023799004)(261021121427099003)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021123027099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDk1VW5EalY1NThBUlFXRk1WVFRaL3lkQmNZMGNQTlZuMmc1TlE4WGg4azV6?=
 =?utf-8?B?ZzZPbWxJUXNhR25zMGR2M0N6VGI0VkcwRjlOT2pYRjF3Z3RqcEJNaDlBY3ZJ?=
 =?utf-8?B?clR3NU9PKzFjdXlXTFU0eU5uNGRCcU9qWWFtMUtNdGl4WFpway9BaENQZ2RX?=
 =?utf-8?B?V2ZVLzVpZDdkL0ZPTUVJUGxGM09lTzZkQmtlY2FiY0JyamJjRXVQdkNFWnZD?=
 =?utf-8?B?REtOOG8vSG5tZEhZYmgya1BzbUhSQ3VRa3NMdFNpZkxRS3I5MnRRL1AveTNm?=
 =?utf-8?B?TFpMQzlCa2pERHVzSlprK09uekovN3BUclMzVXBidkxkNGpZWjJLcG9PdG1l?=
 =?utf-8?B?U2N2YWcwTG1sWHg0cmJHV1NCdWp5UmUxZGE1TTBqYUFOZ1puUmpxTndSVDRn?=
 =?utf-8?B?VkVWODMzc0JicXNBZ214YWxIdlF0SjlkSmZHWUZPbGJ5dmpUNGtEZk1DT2VF?=
 =?utf-8?B?SDBlQlovaXF3Qm9rTTYxZWxFY1VJN2FWZUFLQjBFbjVHTmFCbHdQUW9YSUt3?=
 =?utf-8?B?Q3NUL2t0cEZlMzFMUkV0WWJEZXhQTHNyUklvdFBZYnFnajM4U2R1amM1N0Fp?=
 =?utf-8?B?T0hjVVpqdm15a2RQK0FCMi9DakJBdUdDN1MvVkNjSjhTZGJpUVFrRzRSSCs2?=
 =?utf-8?B?K3BHY3dNWmFQYm84TDZIeW9US01wUjVHSTJMb2craGRCTGhRVmY2OTJIWlJ2?=
 =?utf-8?B?d2tRbXZPUkMxWXBzOGpKSzdvY09PVkI4eVNPcmlDYjhWR1JkYndBcGwvS2ls?=
 =?utf-8?B?TDlNODdBMmhwSi9jTnBybVFZdURFVldmZXVsNTJTNVBQYVp3dDNEM21MbXg0?=
 =?utf-8?B?SkdjOWtPd3d2aEhnazdrc0ZVdmVTMzNvQ1pSNzNYc1F3cDhSKzlRWS8xYXJI?=
 =?utf-8?B?ZjRQMnFWeDcrYUJHcHEvd0MxYUYxSzY0SzJzckxUK3lIMGVLZ1lLNXc4MEhz?=
 =?utf-8?B?TzhXREJpUWtoSjBjTVJhcTJMTkNmRGtCME8yZUwvQlFqWVAxdzBFbFhsbkts?=
 =?utf-8?B?QkhxTUVDL3VuWmo1VW81NjhZOG9SMk9LZDMyelNxWUQ0NzNvRm9zL3VRZU5m?=
 =?utf-8?B?SUpUUXEzVnBudElRaHJFaWN4UEt5OTdIVUNqVFl1TkdNUTNaZkdpVXdkb0Ro?=
 =?utf-8?B?bDY2QWt1M3YzaDRYRGR2TG9mbG9xZ1VrdnJRSm16U0llaHhUeVVDNHc3SDIr?=
 =?utf-8?B?UndINmI5UHM0N2IwdWp6ZVkrVTNZTnBYTjdzNDNOL3krVUkvT3ByQ1FkMDBO?=
 =?utf-8?B?d243MjRVK2NXaU5kRU5oSWwvN0J1Ky95Y0YzR09CZVlCalpCSzVzTTFSZEl3?=
 =?utf-8?B?ODRpRG95ZW1YaWVKVk9TcmljOVJ0R2tMRDF5R3pTeEVITUhhUjNhNzlqelp3?=
 =?utf-8?B?bVJuMEt5K3VVK3dQUnFjTXVVREFGWUVhczhhNjM5SkErWktGWEZUTmxoWjly?=
 =?utf-8?B?RXR2NVN1aXl3MmxxVlZ2aWhFMWxZcFVNMWtjZ1VlSEIwNkZDQjJXakE2UFVq?=
 =?utf-8?B?ZVZxVjh5ZndRS1RZV2VCYUtUNDVCL0NLZXN2bnQ3WTFiU1U0VkhPck1QV0V6?=
 =?utf-8?B?Q0xGMWFKQklscWRxUWsyZkhSSzBhdGQ2NVNzM0o5U1dPQmQ4S0VEbEpzbUNJ?=
 =?utf-8?B?aTdWU0QwL01UTWdLaW1ZUzMrY292bjRiMnJWdklmTzg0cHpRdVNXSEVjY3FV?=
 =?utf-8?B?aFcyaytXLzcxK0RpMzVoT05jdjNkaURMRDg4ZGxQekxLVjJjZUU2SDh4STVh?=
 =?utf-8?B?SEQxTWwwV2d2NnRjYWRINmd6N1hBR2w4TExidjgzMi9BZWozMWJ0VlhyWW40?=
 =?utf-8?B?c2Z4S1JLVXk2QTZQSFR0WnZGSXJmZTlJb1N2L3Y5dWpSY2laMmlHZ1VGUHRo?=
 =?utf-8?B?aVlXKzFkOXU2SGpQdEJKLzJVTkh0aTE5RWozNnl2WDRoZGVIZDlKMGE1WjZi?=
 =?utf-8?B?YnZYRjJLTlNQb3lPUmNya2ZlNitHbVFTN2pudVIxaVhiRzNWTXNWcVREWHZI?=
 =?utf-8?B?ODVFa2k4QTR3WUo5Q3gwZnpHSnlMUm1PVG8vMUdEQWdLckVLK20vNDVGSmVa?=
 =?utf-8?B?WVd4RGI5bENqMXJjemI4QWlGM2NJQk1ZK29TcjRDb1l2ck5zSVJaVXZpSUMy?=
 =?utf-8?B?V2RVMGtDZWpvdk1Bb1huVW0zNkh4dTQ0cGMway9ycnZBYklGVUdFT1JmY1J3?=
 =?utf-8?B?emdQaTlPSzdpVlQ4MkErUTRWSHllaFU5MVIvRG9HRzgzRW5sdit2dHppTnhD?=
 =?utf-8?B?ZE9uVG51ZU03bUhiQnRSd1pnL1RXOWdjUHBNaXpTUlVQdmw5WlVvSUl1YmNN?=
 =?utf-8?B?Nll1dWpaSFd0T2w2QVZDZ2hIODJWKys4Z2JFOHh5aWF2RUxtWGZnWHp0Zmxt?=
 =?utf-8?Q?gCC1WUK/UYtnZEiE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <11636FFC4B2C6543AEE0B9FE837FDD2E@apcprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4439.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eac61fe-cab1-456d-32b6-08df3adaad2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 01:18:19.1490
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WTxNokZZxf19qhHQ7wbMyLR6Qz05OaLrZmqOu0DHF1ZhKEsumt2D+gdq2RPBpbCNzjWlZ8C6NWgJY3yORFh3yW0RB3wnhY8hxtvI6YC5BrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_171836_851927_B7019CF7 
X-CRM114-Status: UNSURE (   7.54  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

U29ycnkgZm9yIG5vdCByZXNwb25kaW5nIHRvIHRoZSBlYXJsaWVyIHJvdW5kcyBvZiBmZWVkYmFj
ayAtIHRoYXQgd2FzIG15DQptaXN0YWtlLg0KDQpUaGUgdjUgVVNCIGNvdmVyIHdhcyBtaXNzaW5n
IHRoZSBjaGFuZ2Vsb2cgZW50aXJlbHk7IHY2IGhhcyBhIGNvbXBsZXRlDQoiQ2hhbmdlcyBpbiB2
NiIgc2VjdGlvbiBjb3ZlcmluZyBlYWNoIHBhdGNoLg0KDQpPbiB0aGUgRFQgbW9kZWw6IHlvdSB3
ZXJlIHJpZ2h0IHRoYXQgYSBzaGFyZWQgcmVnaXN0ZXIgcmVnaW9uIGlzIG5vdCBhDQpzaW1wbGUt
YnVzIGFuZCB0aGF0IHRoZSByZXByZXNlbnRhdGlvbiB3YXMgZmFrZS4gdjYgZHJvcHMgdGhlIGNv
bnRhaW5lcjoNCmVhY2ggY29udHJvbGxlciBub2RlIG5vdyBzaXRzIGF0IHRoZSBhZGRyZXNzIG9m
IGl0cyBvd24gZ2x1ZSByZWdpc3RlcnMNCih1c2JAOTFjMDMxNCBhbmQgdXNiQDkxYzAzMjQpLCBz
byB0aGUgdW5pdCBhZGRyZXNzIG1hdGNoZXMgcmVhbCBoYXJkd2FyZSwNCmFuZCB0aGUgQ2FkZW5j
ZSBjb3JlIGlzIGEgY2hpbGQgYXQgaXRzIHJlYWwgYWRkcmVzcyAodXNiQDkxZDAwMDAgYW5kDQp1
c2JAOTFlMDAwMCkgd2l0aCBhbiBlbXB0eSByYW5nZXMgcHJvcGVydHkuDQoNCk9uIHRoZSBBQkk6
IHRoZSB1c2JOIGFsaWFzZXMgYW5kIHRoZSBpZCBwcm9wZXJ0eSBhcmUgZ29uZS4gVGhlIG1vZGUg
c3RyYXANCnJlZ2lzdGVyIG9mZnNldCBhbmQgYml0IHBvc2l0aW9uIGFyZSBwYXNzZWQgYXMgYXJn
dW1lbnRzIG9mIHRoZQ0KY2l4LHVzYi1zeXNjb24gcGhhbmRsZSAoMHg0MjQsIGJpdCA4IGZvciBV
U0I0IGFuZCBiaXQgMTAgZm9yIFVTQjUpLCBhbmQNCiNzeXNjb24tY2VsbHMgPSA8Mj4gaXMgZG9j
dW1lbnRlZCBpbiB0aGUgU2t5MSBzeXN0ZW0gY29udHJvbGxlciBiaW5kaW5nLg0KTm90aGluZyB1
bmRvY3VtZW50ZWQgaXMgcGFyc2VkIGFueW1vcmUuDQoNClRoYW5rcywNCkhvbmdsaWFuZw==

