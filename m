Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DA4606D80B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 01:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zInp/sNf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ym25RqOfmNUzylVLDzBjMmFgS5SYPxjXOJDHuTZgrjc=; b=zInp/sNfdXyTdVW86mWMNAqN17
	bKJYaAyhVTV6Ms+oUx/6sW9dnb+bmWYaiXV4ncs0j2fyjz4IK0I078+p5cJCcjBXEZcydiUD0erpe
	zccOYog5978gaB79yRXiNSJW8OBBHlGzHo9Xjxbs2dCBcah0Smb8laG2c3Q0BxN70OvaDdFXC1cnd
	se1Efz9n/zHGq1B212NcuIUMP1AgOGZkJDbJQCxAQcBS0y8MSCG3iPrB7bSUQExgg80x17IAP72E2
	6qkJrm9l76CwZ69DnIqGna32tX7jfsNb3rzCnTMoYFAMOA6VqXtcQIsRSLaqfrAUnOQzP7SWzIcuv
	AQLHvH5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOm7y-00000007SDm-1ifR;
	Thu, 05 Nov 2026 01:18:54 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOm7g-00000007RqI-1c16;
	Thu, 05 Nov 2026 01:18:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=saYMTyTZSsfFjLJ3GBLNKfT7FMoN9ec+F6mJDTwc49n+e3X7cZ0OWv/pYC7YlwgL0jCpwPvGA307ZkZuhqRvG8FJzY96TJBvTW4IzM6dT6Fn/2/Otko/Q9oRYSQ3MItvO2jCUaGbPrrDuvwcIbDG+xsKg3HP5jQyoEHMtFcm0z84unVMPgue+9vT6xTORIR8NwlqM8Hh0Tjug2+UfKIdx+vIOLYaG59s2r5mCYI8X7Bp8zhesDY2tUaqEdXr42pMwG/OsBe6tBNBvwnWQ0xGHweegqOFXjKkiSwGe/aYpitYdEDfzu0XK2EzQii+GZtsxjB36jUhBwlRu/lgPnm1lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ym25RqOfmNUzylVLDzBjMmFgS5SYPxjXOJDHuTZgrjc=;
 b=DcZh00e5yVlrxcVbMzoQgyv1TPmIiFpO+mAD3cFeG1Pbd4o54VTqwcerVx8j4Bk8E1DXXB7Eh0DzwOVZvfogwCZF2yKyDB73E+gnc3jENnNPzK1PrDyfJuJhwTtm4VskcFICAF1a5WyLu+l9CdE1MD7yyxBHojwjeEjIiwbUAm4b2F0lC6BzG11/t6mCOY1RQ6rcggH434R2RVO3mQmdhKOBbpPtEYTwsevRnJx+FR/5E35T2/qmkRmfFVur8VLQ/mTkpOUkyDiuTEB9CKOHB0xVZqkLGxzVnQn+aaJikluRR0uaBT5Ni4EOEkQ+Afc1yWkK/MaMZxEVIBdTVpsClw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PSAPR06MB4439.apcprd06.prod.outlook.com (2603:1096:301:80::7)
 by TYSPR06MB6921.apcprd06.prod.outlook.com (2603:1096:400:468::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 01:18:17 +0000
Received: from PSAPR06MB4439.apcprd06.prod.outlook.com
 ([fe80::c772:e1f:2c48:f9ac]) by PSAPR06MB4439.apcprd06.prod.outlook.com
 ([fe80::c772:e1f:2c48:f9ac%3]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 01:18:17 +0000
From: =?utf-8?B?SG9uZ2xpYW5nIFlhbmcgKOadqOWuj+S6rik=?=
	<hongliang.yang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: =?utf-8?B?SG9uZ2xpYW5nIFlhbmcgKOadqOWuj+S6rik=?=
	<hongliang.yang@cixtech.com>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: phy: Add CIX Sky1 USB3 PHY
Thread-Topic: [PATCH v5 1/3] dt-bindings: phy: Add CIX Sky1 USB3 PHY
Thread-Index: AQHda2fVjAFAnVdLW0KPatOpefM98rcduPqAgAD3QwA=
Date: Thu, 5 Nov 2026 01:18:17 +0000
Message-ID: <20261105011813.4058647-1-hongliang.yang@cixtech.com>
References: <20261103074913.1971025-1-hongliang.yang@cixtech.com>
 <20261103074913.1971025-2-hongliang.yang@cixtech.com>
 <20261104-grateful-chivalrous-cougar-ebe4ff@quoll>
 <20261104-ethereal-cassowary-of-revolution-ecdda2@quoll>
In-Reply-To: <20261104-grateful-chivalrous-cougar-ebe4ff@quoll>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4439:EE_|TYSPR06MB6921:EE_
x-ms-office365-filtering-correlation-id: 3146de78-a960-48bc-33aa-08df3adaac50
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|18002099003|22082099003|261102130727099003|56012099006|38070700021|4143699003|261022075727099003|261026121527099003|261026140227099003|261022113327099003|261028144727099003|261022105027099003|261102124527099003;
x-microsoft-antispam-message-info: qD6Kt0W8kcsM0JpMoR7F7gMnccyciqwgXup1YpcQ/Oyjy1tT2ZWDYG5/yXyRwCI/0XG2k6SDraDeiA5sW4WMQ1cjEg0DQFr9t41JiQuFLCCC4+h5QvoIA8q1oHvgdFhudBSOnyAuc+yjVGRrPm3A7V23XR6eE4E0gEpPDNwQfLdj+Vr6Px1EzWPn/YuTQ2U7CN8MmHryiP198odhoGYlGC8pdZjtFa69k60zD7pKPXPLnHW43z74bvxUKYAPZPidyC/kP3KxdChtowpV4kfj1afBqIXlbemNYU2aBGjPIh6IAKlphqyaahL+UwJr0CfQnimR5MywpkSM0cDgycWtK802c5JPwKtxmg2nCpgWJmFA1+dN/UpicQi8Zm4hi3S9Zk7cI3MlfWG75n+MYJq0DyikqFC2UIB5V/xmHn66JF5LJgeTiIq2KKXkNqR/8IQSyE1XFbdhsjF7cKAzog2p0gOMDgWjOjpioIU5fOjvwIBPdAkS4Ns3VqLPWVqtnugB8siG9SeGOovy4Zz16egGTk5QTCyAbP7jTeREuhuaJUjj2jH9vcu3ep1aDS4wH4Tikrqqw/Etg4zMniH/4anEf6HlScVRy+3dgp+CsPKM1d7SIeJTAm7zh7K4D5F438hSHMI8jQTxXo8VT7X8Y1qQyYu0rfb9me2T29nXN3LsWw9qtEPHlEIOQGOu1lvK1CCmESDroVnbMD6cdgQlOpp/c6nGFo6cueuzYtxc/12SrRk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4439.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(18002099003)(22082099003)(261102130727099003)(56012099006)(38070700021)(4143699003)(261022075727099003)(261026121527099003)(261026140227099003)(261022113327099003)(261028144727099003)(261022105027099003)(261102124527099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGJ6TEU4cnNuTllFcUw5bjFKaUQzbFNkdW9zWnh2cHVORmpBVnhWazFFbzE1?=
 =?utf-8?B?TVpNb25KcE9tVFprUndMVS9DUjZjTExmSTViVjQwcmkwMlpUbFNjUHBUQy80?=
 =?utf-8?B?cHE3cVVEOGVhUVAzOS9zd2wya09QYUYzcjdpZExYbEZlaUpUWUMyNWxYTUZm?=
 =?utf-8?B?a0srVzQ4VzhNZ2hqOFdzTEZiSTRPaExaMUJwOFVOOXBiVEhGaVBuNlArekdH?=
 =?utf-8?B?MTFBYXhlQWZjeG9qUFJUcFprN204MkxJdWtxVkZmT254eU1qazJuV05ySis4?=
 =?utf-8?B?aFpuVG9MYXNiL2lIaUtHUVVLZm55ckwrWHE1dFEvLzVObVFhRUZweCtscTFV?=
 =?utf-8?B?UnN1MmNkRi9pOG9ENnI1WU9RcklMcHY5QWRIS2x6WGZvalR2S28rV0J5U2JL?=
 =?utf-8?B?TUhxR1IrRzRyaDBRc2lVWGhlWFdMUFdoMjQ2OGV3NFprcHFUSVdJVXBoTkRT?=
 =?utf-8?B?YnlKWkp0TVovcUJaSThIZFhITWc5YVcrQm84Q3hNdlc5ZmJUN2h1TnQ2dUZK?=
 =?utf-8?B?dW9ieVFTZnZ0bnA4bU9Ua0RCVHZIbjhpV00xaGJWMHAyQW9hdUEvbHYxemlv?=
 =?utf-8?B?V01xQnhUTlNlcHBWNVlEWXh6RFlvWUx6YTF2OEZVMjE0UlRJMGJHQytrOHB4?=
 =?utf-8?B?T00xN2YxZFBhUmlCVzVIclFRRDNxdURtZzE3bTNrVEVzdGtaT0h4Nkl0Wjhi?=
 =?utf-8?B?OEpidlRDb0lrbXEvU3JpbEhyMHMvV1d0eFVIcXpWWng2b0xDVk1WSHgvZjZ3?=
 =?utf-8?B?WDFGTXFxY0Z5NjR5RnVNaEFoZzJ6ZkkyWVZDMTkzYktqWnhyNzdUcTBRSnll?=
 =?utf-8?B?cGpJUjVraGxsdnBzdGNSbEx1d3lUV0RhRGE0YzJ2WWhxWGo2Z2NLbXhnNmV6?=
 =?utf-8?B?R2I4ZnRXRTV4S09ma1hxOTZFSk9Za2JJYXZYUlBXVFlFalE1NjVVS1dYMGxT?=
 =?utf-8?B?YVZKOEpxTTJ2ZGZDMzArM1RabEN4N2tYUUNncXBSSnNPQzg0Zkx0VFRNM3FO?=
 =?utf-8?B?WmxROXcrL2o1TU90c1JjUGhIbTVJZHkwWnB5clZWOCtIL0h3bTlpRjQxWEpw?=
 =?utf-8?B?dzBjNXVTSFdnTlFQT2RCNTlyTmk3UEtrSEw2ZjUxUHRnajhabit4QjR5RzRF?=
 =?utf-8?B?RWd5TkFqY05xcWVtM0U2WjMwcUVzZE5rKzRGeGFKZ2ZqM1E0N01PekZuRkl1?=
 =?utf-8?B?b0hWWUx5M05qd2luT09OUkR4VEM0Mmw0ajFjdmJrZUJTS2dMaGw2Q0RmcGlJ?=
 =?utf-8?B?dmNMTVJzYzYrSHZxUEJBL3l2dWdZSnZabG9QRWNVNStRMUJFeEphT0l1ZEht?=
 =?utf-8?B?YnF3ZXFzbHJNdVdHK0thWmlQQkllODBiRTBFVGVMUEhhTjQ5YVpLdzF2b0tj?=
 =?utf-8?B?OXgxOUpFdjNJbnVOQlVWaTRqR0t6NnJjeXlNbk5admFycCtVZUdCZDVHT2dq?=
 =?utf-8?B?NCtKNWtoZnI1cFc5VzBWanVzREJvalgyQkczQXpjbkxyMkVybDhrZGJ0Vlpw?=
 =?utf-8?B?K0ZxaWs2ZE5YdlIzN2dqQkJKWUJ2TEtiQWhmMGlnbDJ4UlFVUUx0aExyNnRz?=
 =?utf-8?B?alZwVElqNi9idzRDWlNLdFBGb3dHTkpWQWRGUUFrOTZlZ3hyeUtiaVpSbyts?=
 =?utf-8?B?NXBXeHFDdnRmd3JFU2tyaVNoZGZnbk9lamFndlJWUVpHNGU4WjFrY0FQeGN5?=
 =?utf-8?B?bGJiT0lYTko4OWRubVRtakRmUWxvREw1YUlxN2huc3FIcm8rSllZMHVRUW1l?=
 =?utf-8?B?d1dDYys0RE5SSSsrdUdpWHNzN25KbGcxOXY5dU1vaDY2ZW9FOXJFQnR4b0xL?=
 =?utf-8?B?ejdMUWU4c01qSFlmZ1gzbnBFRmRReVlHRVV0bHNzWGpvZCs5dnhmZERjYW1l?=
 =?utf-8?B?bXJTclY5anpUTGFueUVxRUY4c2JtaklGOU1hbExtbzBlMVd0ME9zOWVIeGhG?=
 =?utf-8?B?cThnMWQ3NmtTOEhzQVhXdVlBbEUzVUJHdDFUSHViZStHaWxmUkcvNFVaRGNO?=
 =?utf-8?B?cjdQbzkzRm56dzE4YlcvdGwwbHdza2FMR2ZYVVBtOE5VUFl3QzE5U285YzlT?=
 =?utf-8?B?S3NDbUNvQjArL3JJQTY4VWxQaFlwajNjeDF2OWwxcnZvOVR5b1BWM2FQUUpS?=
 =?utf-8?B?OEhRQWdDQis2R2h3STdNS3dHQlRhSzg5UkxXbURGZkhIUnNqVTRCVDJHYkRt?=
 =?utf-8?B?cFFtZWlibGlzU29uNG9tMVh6cmpQaXJiaTR5ZUh1VmlXRXYxSU02dEVCQzBj?=
 =?utf-8?B?SUNyNGlIejRYeVlqUExTRVlBZHUrZXluV2RtZG11azljKzJ0RkpCMGt2cSs3?=
 =?utf-8?B?RW50ZThJQ2VhRURPVVU0NjFsdHVvZWJ0OTE0bXpQR3ZTcWgvaFF1ZkdlM3NS?=
 =?utf-8?Q?4phK5VxcULs8ikpk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <37DF81AD5391644D84D896566E7FDC2E@apcprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4439.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3146de78-a960-48bc-33aa-08df3adaac50
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 01:18:17.7120
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3qjhCBBD3P4ErrGR1WTpiYxGOF6K35zs8o+EEWTOK1EL2uBLCWdXshDH+nuD8U8iB+RcQnv4GcyMSSfmbKuBZFAKf1bKeFh1K+aOByBbLjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_171836_614759_BD751E28 
X-CRM114-Status: UNSURE (   7.17  )
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

WW91IGFyZSByaWdodCwgdGhlIGNoaWxkIG5vZGUgaXMgbm90IG5lZWRlZC4gVGhlIFBIWSBibG9j
ayBkcml2ZXMgYm90aA0KVVNCMyBsYW5lcyB3aXRoIGEgc2luZ2xlIGluaXRpYWxpc2F0aW9uIHNl
cXVlbmNlLCBzbyB0aGVyZSBpcyBubyBwZXItcG9ydA0Kc3RhdGUgdG8gZGVzY3JpYmUuIHY2IGRy
b3BzIHRoZSB1c2ItcG9ydCBjaGlsZCBub2RlczogdGhlIHBhcmVudCBub2RlIGlzDQp0aGUgcHJv
dmlkZXIgd2l0aCAjcGh5LWNlbGxzID0gPDA+LCBhbmQgdGhlIGRyaXZlciBleHBvcnRzIG9uZSBQ
SFkNCmluc3RhbmNlIHRoYXQgYm90aCBjb250cm9sbGVycyBzaGFyZSwgd2l0aCBpbml0L2V4aXQg
cmVmZXJlbmNlIGNvdW50ZWQuDQoNCk9uIHRoZSBGcm9tIGZpZWxkOiB0aGUgZGlzcGxheSBuYW1l
IHdhcyBub24tQVNDSUkgKCJIb25nbGlhbmcgWWFuZw0KKOadqOWuj+S6rikiKSB3aGlsZSB0aGUg
U2lnbmVkLW9mZi1ieSB1c2VkIHRoZSBwbGFpbiBBU0NJSSBuYW1lLiBUaGUgbWVzc2FnZQ0Kd2Fz
IHN1Ym1pdHRlZCB0aHJvdWdoIHRoZSBjb3Jwb3JhdGUgbWFpbCBnYXRld2F5LCB3aGljaCByZXBs
YWNlZCB0aGUNCmRpc3BsYXkgbmFtZSBhZnRlciBnaXQgaGFkIGdlbmVyYXRlZCBpdC4gdjYgaXMg
c2VudCBkaXJlY3RseSB3aXRoIGdpdA0Kc2VuZC1lbWFpbCBhbmQgdGhlIEZyb20gaGVhZGVyIGlz
IG5vdyBpZGVudGljYWwgdG8gdGhlIFNpZ25lZC1vZmYtYnkuDQoNClRoYW5rcywNCkhvbmdsaWFu
Zw==

