Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54B4606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 13:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bPEAtsWq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bs1oIb6aDTspS4uvIBaiO23IXXb4ylVRM2mzZYwF3NY=; b=bPEAtsWqeKzschHQvGj/T2bnxJ
	ibAsOflMBRsX8T5uuSWVVyATj/mtIqwB32WBmDyQ06+Iojint0XkahaTVJICor2FuBzsJMIKXJf75
	7uICiq4RR6H8/yEeeY9szLGcNAW+U4nBq9yCkTCoilRKxTwl6xCa9WuNZM+PD1QLB4EA1qZAgb8pM
	tJhffLnM7/QS8qXUda5F5oAaEaLLnRJeyFIQBspFpou0FXoyWgEXfE1u1iBNGDHVz9lkOahc2Vbbm
	6NpWPbky+y8KI7tWpoMPU6EovAqwhJy0qbea+tqq51r3e/6NSrK6Qt/i/5A8qRcL5TEc1lXqthme9
	yg5eVWog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPJay-0000000CNor-0B3G;
	Fri, 06 Nov 2026 13:03:04 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPJav-0000000CNoQ-3a0G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 13:03:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TweaWU/+cfPGJbaf42N0/kzSe4oTDNu8LZtONQLW7ZyMWmA+pNcdss+xzJFFV8csUQYcRfFh0CtvW+AFcyinDUcvVP0FUgGevpim908rFfprGncuab81yUEJhkaeFkC3ywTFukFniZgvPHNU4PuoaJD0P4n3o6RKkaMQE90PlYGNJ9Jx0fUUJXrjC4cJ7ShcZta0R6/V1Xj8H/iPd/BHxwpungqIf8n+A9P+gLiPgMrpz2WLm+m3Qcb1UPv3OcUU+HDL1qDImZGVTgkqE5P6NhyD+R0vy5jQxYTbb4nH8GvOIhEgBkRfL1T+1wfp/TrkEVtpwvC/cusFIgWevBkP/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bs1oIb6aDTspS4uvIBaiO23IXXb4ylVRM2mzZYwF3NY=;
 b=IRAcJpADSR/DrAUz1f5vsIs/OCXzgl19ylUf+hIVaysjMODtqsb3nsC5SLbhx6W4SSLl39+kpYXMfhrdZxwnnl0UjCh+77T3VBF7nbfHnDuwHLe7j4cuFzXZKygCtRANDYL6HfK+FWX9herGwLkF1BJHuwzgIN00GyrKaJiSzu2/6FvfV0yWklAi26eXfWuYAk7SDPmflU3vVyciJgt8MdgnCtXXHx540QZIaRk0JYXxu3RBwe+whsiOa9AjTJZhsOOVNCvFpuhTwH4pGb/14EmhJXyORfwZpbtTdDkF2cs3MvyUARGr/ngfXMuvEjTAB3Qpi3KBIDnJayPen5RU7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from TYZPR06MB7334.apcprd06.prod.outlook.com (2603:1096:405:a4::9)
 by TY0PR06MB6803.apcprd06.prod.outlook.com (2603:1096:405:10::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 6 Nov 2026
 13:02:54 +0000
Received: from TYZPR06MB7334.apcprd06.prod.outlook.com
 ([fe80::6400:f7b:8514:1154]) by TYZPR06MB7334.apcprd06.prod.outlook.com
 ([fe80::6400:f7b:8514:1154%4]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 13:02:54 +0000
From: =?utf-8?B?Q3VueXVhbiBMaXUgKOWImOWtmOWOnyk=?= <cunyuan.liu@cixtech.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, "boris.brezillon@collabora.com"
	<boris.brezillon@collabora.com>, "steven.price@arm.com"
	<steven.price@arm.com>, "liviu.dudau@arm.com" <liviu.dudau@arm.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?R2FyeSBZYW5nICjmnajmlrDkvJ8p?= <Gary.Yang@cixtech.com>,
	=?utf-8?B?RnVnYW5nIER1YW4gKOauteWvjOWImik=?= <fugang.duan@cixtech.com>
CC: "daniel.almeida@collabora.com" <daniel.almeida@collabora.com>,
	"aliceryhl@google.com" <aliceryhl@google.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>, =?utf-8?B?Um9iaW4gV2FuZyAo546L5paMKQ==?=
	<robin.wang@cixtech.com>
Subject: RE: [PATCH 2/3] drm/panthor: Add initial support for CIX Sky1
Thread-Topic: [PATCH 2/3] drm/panthor: Add initial support for CIX Sky1
Thread-Index: AQHdbdw+ckJM8aT+pk+oVQoM0CXn17cg8kMAgAAML9A=
Date: Fri, 6 Nov 2026 13:02:54 +0000
Message-ID: <TYZPR06MB733426B11A7B6E0904E86893F8762@TYZPR06MB7334.apcprd06.prod.outlook.com>
References: <20261106104735.1651267-1-cunyuan.liu@cixtech.com>
	 <20261106104735.1651267-3-cunyuan.liu@cixtech.com>
 <aa7385b6f373cd6467b772bf0a9941618b35c5ba.camel@pengutronix.de>
In-Reply-To: <aa7385b6f373cd6467b772bf0a9941618b35c5ba.camel@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB7334:EE_|TY0PR06MB6803:EE_
x-ms-office365-filtering-correlation-id: adb01729-0a85-49d3-26bc-08df3c06456b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|22082099003|18002099003|38070700021|4143699003|56012099006|261009223027099003|261022105027099003|261021121427099003|261026140227099003|261028144727099003|261102123227099003;
x-microsoft-antispam-message-info: wfPXjMIj6eXxWWaZpcxKrGAUbstkdUdiJj/osOWkafClKsuy+Mk5hSSFcLARGxSYY3JIcGi1M+DHn3lOfaKWJiihGWr1aaQ5h8YgYbtUeP+CSY8o37sHwUsFlV9aL4kcWFqlOhcMb8ubyXvRJ/5wq/sU/YlCrwtkDbnBooYMJGce7FVuZie7iQGOcz5EgDsFTx/lUuibf3a41ruD6CfG1tzZVXP2y1NhcT0Pqg6PiPxgg+zdibtLZDBtB48V9RYxA02im/iDVBzHBSDlObSxeN4IeY1h8kI64Rrm6KooWLDUFy1muQE/IC94P961Mwgd3ZelV+FWBHXrVjI0VDLkBJULUZnCqOQXs2MEeAcjKb0d3CNl+owrRYpJL/5kN6iEM0Zr0Z00/4UH4wnJwaWS7L5iAxqTMeG3HXUuPnGNKfkFbOxcktNyc4Ozjt9QSaabUPxMR8ZTLhzeMcHrXrm3xBTyuL/dQD0Li0IU2HDJ+ZU8mDP1iKGEv8czL83STwEpSYySFaINI7yXimLUEOkeOibYqUviTMQuxVryegiEo4vy6rfh7inEvg4yDjFpmC9f5d04tHiiiOmcFQt8WYoIq02RGtc0rQbcO8FvUuQBsA2Dfy9kL7rJ/3QNRDIrPPyQgL22w8713N5pn0+NWfUDJzHZFDFeBRHv6ymPC6L+8aqRfKNdWHpiLjPddFgrPcJcNlIwMtbNyNytYpkQONosmwTkwyL6gVdYyFq9gws6KLg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB7334.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(22082099003)(18002099003)(38070700021)(4143699003)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(261026140227099003)(261028144727099003)(261102123227099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjRBNlh4RGt4SjFPQ3diNVJOSVZYY1YzUWJrdEhaeS9od21nT1FKaCs4NVNO?=
 =?utf-8?B?UmF2cEVWcW5aOGNzdTBCR3FvTndVdzZKWDNDK1lRS2hCTk5zSTAwc3JXeHNG?=
 =?utf-8?B?cXBNNmcxcW1nYlVLM05wZzlSWFdkMHBlZXFpamZNVkhaZjhFcTF6a09OZ3I0?=
 =?utf-8?B?RDN0YUdxVmNrckN3bWR2UFhNL2RnRVk3R0FrWmczZ2hrN2xGTjJvS0dJZlBk?=
 =?utf-8?B?OWdYcFJrSmtNaEsxc0N0bDAvb2lzcXdoZUxTR1BiQ0Nwc3NrTTV3eTdXblcx?=
 =?utf-8?B?MDh2RXRrUjYvRU9RQjUvQjhodGQreXFWUlJyaE5CZWdOTlVrdklWU3BSUmow?=
 =?utf-8?B?RnZkdFF6WjliNnY2ZlN6bk1IaytGcU9PbFRzdFFDTzlLbjdSdUQ1eVBqSkRI?=
 =?utf-8?B?Qk1EM3ZrRkRjRUdiVHJuOTU3N0lEQzVFZVlnV2puZFdGMm92cG93VkE5eTB0?=
 =?utf-8?B?VG9tUUJqc0RHTUVIUzk0Nk9RcUNPcU51Yyt3bTA2RHhUM2FIc3pmQkRVUVBX?=
 =?utf-8?B?SHdzZkkrWlJaY2xTUEFJYXZsa08vS1o3alNlQmZFNDlVSEF1bFExM00zekc3?=
 =?utf-8?B?N3BZdDJWaDBDekJDSXlZUkdrbWpIQ1dBVkNkWVVUNFF6cHlWSW9rR3o2RVdu?=
 =?utf-8?B?SnUram5lbEc1M2lmY0dzaVpRdzhoZ0NSRzVMQVRucEtVZXcyWmRwS053ZVdS?=
 =?utf-8?B?SWR2UnJZZU11VHpqUWE2cVNmMGwwMnF5NmxGMi9XY3Q0WGc2YTRLLzdZUCtJ?=
 =?utf-8?B?STV6ZUZuRlpPSTE3S213UGJoQjFsZm44KzZsMnFTeU5vUjRlSkNyVFJIVXRR?=
 =?utf-8?B?WXZ6Nzg0RDZ3VWtzem93MXpPYzJiNnhvS0FnVTFOYmtNeXU5YkI1YWZlc3pP?=
 =?utf-8?B?MDBaMlBjZFZmMW5oU1NkTFNJRnhTQkVMTVlMeVZZQ2k4a3lzLzhZcG1IRm9t?=
 =?utf-8?B?Y2xDMmEwNWVRK1ZmN0NGQnBsbHBQRkZQaXU4UE1IK25MUG1tOW5SQ1V5c1lV?=
 =?utf-8?B?cGlGREYvcWpmV1YzQUlkWEdadCs1bEdzZ0dIZFdKYTZpazBtWU1kcW5KcXN3?=
 =?utf-8?B?clVkeXIybnZLM0xLUTNRSGtXNk9OMHBnVXcvV0VZMmZaSFRDR01mYmxIYkJV?=
 =?utf-8?B?K1Nwd3QvUEdoRlYwZFl2S1RpODA5VHdHQVdOaVZuWHl5aWpjeUlCalo3L01t?=
 =?utf-8?B?Z01EYjVma2RRK1diRlB0SVhQQVN4VEVwUTlqdC9yellZYVIrZjZJbXNhbEQw?=
 =?utf-8?B?Z01vcVpLeUFYTm5YVHQ3YlpMTy81QlFUcGd3Qk1ERHN2VlA4VXdvYXByQzlC?=
 =?utf-8?B?c1o3c3J5NXhtYlZEQmF5UURVczg5SUZtVWpYUWdrcFZiQnVITTlKaEhaNUU5?=
 =?utf-8?B?VlozYVFGM2FrV3NESTVzNU5Bb01icm9UY0JCcFBzZm1yZnJmZ2d1MEVUM3RX?=
 =?utf-8?B?QlpFcU9TOFlnbXhLKzhEdlZySFc1K1BWSGpkYnk1eDNRUkhiYnY3cCtCdkRG?=
 =?utf-8?B?NWVvdng0TmpuckF4YXNUbGcvc3VSMkNacStDMHp3L2kyaFhsejdPRDhaSG04?=
 =?utf-8?B?UkdrbTcxUXVoUm1ZWkMzVzNLWnhwNzA1QlVTSE8zK0pJV08xemdHN1NZYThD?=
 =?utf-8?B?OW0vZGVFZWhpMFJIWE1ZUFhDL2laNHpTeXlYazVlbnFDblZnQ3pVTDg4TUc1?=
 =?utf-8?B?bXRXOHlHYVpYMkpCdjZMNVU4bHIxRFdpVzhBWXhhZVFNWnI4ZzYrSWNvaXFw?=
 =?utf-8?B?dk9YOUwyTjlnZFRoNFkydmViM0R6Y1prcmJLbFdVTG8vNHc3QXRtSXJOQzB6?=
 =?utf-8?B?TFFYTldZYU1qSXFaTnFqaWVxUFN2U1RPR0NiV3dIYUIzOFhiWXlJbUgySjNI?=
 =?utf-8?B?MVlkcmFzUlhsWE1TUUNPbTZ5cFRZV3BoZC91Y2xNNTdlZ2xyUEtGcTJIZXlO?=
 =?utf-8?B?bkdqL3R5T3NaOFJyVjdSTGFDS0xGM1h0aEpydTBmbzNoOW80dFoxalNyOWM2?=
 =?utf-8?B?TWFjUU04SnpFb0M3VTJ2RmdUNExpN2ZMTkhFdjJTMFF3anJGSXVLcWRuOTE4?=
 =?utf-8?B?STBya2dweDFTbFJrSEdlbk5Xa0hBcGpsZEt0SEVkVnZKRzRQTkkwa1VhS01w?=
 =?utf-8?B?VnBYZStuVVVna0JlM3lOc0hRNlFKSnF4QWVwTEk1Q0RqSm50TmtCQWtYblBO?=
 =?utf-8?B?SVpVdi83ajRIOEx6VzhYdTUwMXY1L3loU3l3QUF3UUVkS2JBWkxsSEszbVFh?=
 =?utf-8?B?MW11bytBNDlMUVI1MkFuWWtUN0hRU2E1aXFuVUFWUkRrZmFsTnhrREh2YStm?=
 =?utf-8?B?cUZISFhsdGlneGpWSU1tOGZJbU00emZiR1Y2NnpNMWlrclUrOHBJQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB7334.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adb01729-0a85-49d3-26bc-08df3c06456b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2026 13:02:54.1867
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BMmwIsxJOBDgIhEg62nI8CedUMjO1cqQt2oqw0q6gSIWievohVTb9m1SmwS/0W8tdLJGAFBpOjm0nE+AP++9Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB6803
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_050301_899792_253D8A57 
X-CRM114-Status: GOOD (  11.30  )
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

SGkgUGhpbGlwcCwNCg0KT24gRnJpLCBOb3YgMDYsIDIwMjYsIFBoaWxpcHAgWmFiZWwgd3JvdGU6
DQo+IFlvdSBjYW4ganVzdCB1c2UgZGV2bV9yZXNldF9jb250cm9sX2dldF9vcHRpb25hbF9leGNs
dXNpdmUoKQ0KPiB1bmNvbmRpdGlvbmFsbHkuIERldmljZSB0cmVlIHZhbGlkYXRpb24gbWFrZXMg
c3VyZSB0aGUgcmVxdWlyZWQgcmVzZXQNCj4gd2lsbCBiZSBzcGVjaWZpZWQuDQoNClRoYW5rcyBm
b3IgdGhlIHJldmlldy4gSSBoYXZlIHN3aXRjaGVkIHRvDQpkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0
X29wdGlvbmFsX2V4Y2x1c2l2ZSgpIHVuY29uZGl0aW9uYWxseS4NCg0KPiByZXNldF9jb250cm9s
X3Jlc2V0KCkgYWxyZWFkeSBjaGVja3MgdGhhdCBwdGRldi0+cmVzZXRfY29udHJvbCAhPSBOVUxM
LA0KPiBzbyB0aGUgZmlyc3QgY2hlY2sgaXMgc3VwZXJmbHVvdXMuDQoNCkkgaGF2ZSByZW1vdmVk
IHRoZSBOVUxMIGNoZWNrIGFuZCBrZXB0IHRoZQ0KIXBhbnRob3JfZGV2aWNlX2lzX2luaXRpYWxp
emVkKCkgY29uZGl0aW9uLg0KDQo+ICsgICAgICAgYm9vbCBuZWVkc19leHRlcm5hbF9yZXNldDsN
Cj4NCj4gTm90IG5lZWRlZC4NCg0KSSBoYXZlIHJlbW92ZWQgdGhpcyBmaWVsZCBmcm9tIHRoZSBT
a3kxIFNvQyBkYXRhLg0KDQpJIGhhdmUgdGVzdGVkIHRoZXNlIGNoYW5nZXMgbG9jYWxseSBhbmQg
dGhleSB3b3JrLiBJIHBsYW4gdG8gaW5jbHVkZQ0KdGhlc2UgY2hhbmdlcyBpbiB2MiBhZnRlciB3
YWl0aW5nIGZvciBhbnkgb3RoZXIgcmV2aWV3IGNvbW1lbnRzLg0KDQpCZXN0IHJlZ2FyZHMsDQpD
dW55dWFuDQo=

