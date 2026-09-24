Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DB1C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 08:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2kxQqh1b0NRYpxLrq1q06hzYDYdPUDG9Q2F8zUH+lsM=; b=ozbW8kdZO6ARinvA2rcD9EQgAw
	eJEbJSeuoxdEV/IMf4/vSAEUBtwIZuDD92TKIh/w3xQ6PCBPfcLyX5uaiglZgmxEhALX3EwOPjxhi
	GzRQqNjFVmxntPexDKQ2BtXO6KAQWotXND8OXQ2ZO5zVDlzmMiDVPeMsm5bs9P8tqSjeVcUnxRKP/
	Qg49J+KoJ9nM62PKaCeGeO6E0f2b92coS0PzSon4nE+VpIJfjLx/0gBbdZH7QRCYDRjhBtorwE5l+
	z0nAAefJaLSbr8QAPIRBHrfK5jUHySQIsH4t3hePSSq17KoPivgcaQBf3SSJlss5qJ4yLvPWTsnZj
	nm8gCyNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fHx-0000000AWa3-3EIF;
	Thu, 24 Sep 2026 08:58:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fHw-0000000AWZq-0Zfe
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Sep 2026 08:58:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To
	:From:Sender:Reply-To:Content-Description;
	bh=2kxQqh1b0NRYpxLrq1q06hzYDYdPUDG9Q2F8zUH+lsM=; b=U4+oCD4DzLl456N3MI0EE2TOjD
	eT+EGdB/RTwBLJTJU+6Prm7ORPc6jck0mQAKS0Toq8InWMBsk3zbZT9/DxgswE9Ty7TWh3dKOhQrh
	rAt/0v6wcF7ha3TJLoyTkUmQ90vg9OZPblBcZzYMFaZM2fcfKKEz+CC4VW/o5jOglxMs+kumedpED
	ZyJ0PB7mqZnObSrNTc20I3+GXpnTMAJcM6pdogfOeYmqaplJSmpCZSk4wiyGemDtbGgRIVJ70OzlD
	PmQXXK3GdtPtUXjBMrlGB5s8F78DHwenrnMvO/lMr2CXz3ZS+ECHheyCORXGov4kgIbE4BTufN6Dp
	4BzOEAyQ==;
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9fHk-0000000FlES-1rJG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 08:58:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HdqLNd6zZ3J5IFcE4s+dczAbGxD7aaHDK4ubQQ3yze8IIIc77SVW3dw0AyBvR6XBtkJrv2DS7cf6xoj0HauT2YXa/8BP2p03YLzB4YAEjeAsYXrNZNlilbZ+R5PvlPQlngsLRsAv1NIAeMwa9dYMEN/mdtc7Rjo3dQpaU9w2jQLUZoFHCJn4n8qr/EkgKo5oBJUBF4rq0wn3igK3coxkrUakoLwS/iz8uzf4w9ClvUB2m7kd2lqJqQDhq7pkBzwXfZC22Ut+rqY02ldsOQ8kvH8yjTH0ELNsF7bU02nDkwE7KR2qYtfRiPujF0ebfyoVahYZN56RE0yDmAB/uxEBHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kxQqh1b0NRYpxLrq1q06hzYDYdPUDG9Q2F8zUH+lsM=;
 b=r4A19IkyXfrxcg2iFRFL9Omh5E17ZPBORnqhVdw+5daUKozR3+fiydsAyAmdOlr89IRrRmppmsuxQE8/G8aN6ZfOIaYlOq4ykzCAi4WV5AbrEQBM700xkDYHEiRMAfibUCsrzW1zOWwixrCG9gd4qlbZ0OdGjJj1lbwFA2CnosHMfwomAwjLHlWcWLMkI3grNmc5S9a5bwBL5AiOhcgYJH1nnMnIcG+5rHcNp5wisYTIHh+eTzQ/rd3PwshcplCOFS2A3jzUSVc6R5f/8hNc5iOKzjuPdJ11n/+TZOe2va7Zah4eUl0dzz6LQO+DgpvcBgfEWy3Hx1k1Gff0yAb9Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kxQqh1b0NRYpxLrq1q06hzYDYdPUDG9Q2F8zUH+lsM=;
 b=W3P8q+3RmHjclxsM4FYxhP9gjuUCL+58XoWOw92jSV1WAJnTtvolCuhG74kHtpq9Bm+1yrCtEwOSxZ3rpoxHAQadkzNn7qdxirT2/kNLOAi9Vv1AwzV6FFhbJoMrfuu89ohEN9YAiWLDFE+J6Zw/bOjFqB7+cDTvOII5GjiJ8NKT1obO3eM+1NOilKdmNMiuN8iQqX/gLovoX6xGSQQHillKV+FhM4ycwuposCcfRiKRPBfSqcCTpUBTtyUz+nGpUNj7dKfUZDRwU7KU7pyfSRUU7EtOwIyAKlDwMcT8cmdXkycjC+a5Ue0WiuvvLiwL3ZcKT4ZKLgICUk78xU2+ew==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by AS4PR10MB5870.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:515::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Thu, 24 Sep
 2026 08:58:21 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f%3]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 08:58:21 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
	"arnd@arndb.de" <arnd@arndb.de>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "bruce.ashfield@gmail.com"
	<bruce.ashfield@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] tools: use basename to identify file in
 gen-mach-types
Thread-Topic: [PATCH 1/1] tools: use basename to identify file in
 gen-mach-types
Thread-Index: AQHdTALZcxa3Xvv9JUy0iAgPsNVeaQ==
Date: Thu, 24 Sep 2026 08:58:21 +0000
Message-ID: <1fd21bb7bbb09e1566c090dad29710765c24bbd2.camel@siemens.com>
References: <20250826142518.2583999-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20250826142518.2583999-1-alexander.stein@ew.tq-group.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|AS4PR10MB5870:EE_
x-ms-office365-filtering-correlation-id: 20d9ae88-1f5a-4625-5a9a-08df1a19fbf7
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|3023799007|6133799003|10067099003|56012099006|11063799006|22082099003|55112099003|18002099003;
x-microsoft-antispam-message-info: obsQWeCXAgHwB/PHqwmq4DzTi0Jz6cNnWtcAzWJbKCREuxlv/xkA/A7cQsJf6Hho33e8OXfpFdD4bxYvjvXDJnpWK2gWS3jfz9DbN1hFtrpimxKNAZHHGdD0zr5XQ5LQsKEvWOfHVnUKhQgoQ31AeXEYrAcAgnu/3ckKSXJjbYgOn39IV8Gf2GQkIYC2JkzXZoUNwKqavcrz9jKHZ3+Kc5OseTbvRP9VFJ+DfOtl86ggQpHfgTqIoK+XVGVPDqFmOxmh2boQFORUcglQLPaRTriiHJECySRnkwEQ2g/8DMl9KFUCdtPvJEStvD5p7Vo2x6k7SLmETjWIpisFJqR5heyNwwaLv/2Ok9VYnHItr4mzuo4k/7ruwYo1+ze3Wevp1P6Si+qnJNK5xfWG1c+YrEKzffmjQPdCz3Fw3+HhE08M7UCmuD5I+b3xooy3Q+7qS0hPhRHykpTGIcvn4cN7LXyjUyjBMbpi1b3YRqYpNzo/qBHZusrr6e3frFQimbJ7pDWc05HPmChyX7RIxHDhztefGVobuOz3DAmhmzUlJslQmc7h4ZbtZW6aCaT6Xl1Y/9vIMNNjjPTJ4muEHT10pXanMmJ3X+mqQOSiZcGi9IT6t/6R8kP567sSCbHrgTC44MI3n7fQOlKsYQ+sow/8mNDqvIoeY5B40uN7bUJKL0Q=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(3023799007)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(55112099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZXY1WGRzSElYVWNlUkJHVW9LYjFmQ3RDK2VQdnk3bzBML1dBMnJSdE9JNWJ5?=
 =?utf-8?B?aGF6aW01dFZtK3ZhejgzeUJVQ2ZqTUJxY1kvdzd3TXZ5T3Zxb3NXRkN4Y3k3?=
 =?utf-8?B?SzVFWkp3TlRpWms1T1Bwb0lvT3VBY3pEd1FEUVNISVZIWTFkTEZrdXJmSFZp?=
 =?utf-8?B?azY5K2lnR3FaNDhJOC9ueVhIK2dKVmVoQkVadVRxZjdrQlBJYTM4MllndVFO?=
 =?utf-8?B?bnBBYVRWbHY0dzNIVXFoNldEd3Bld1RDeG5wS0VOQ3kyVjV4YUNEemxIZnYv?=
 =?utf-8?B?NWVVVWwybU54MzdzUjhBZW00WFlKYUQ2RkFuSFBtUm5Hd2lORlNXUnhoeFNL?=
 =?utf-8?B?RGtwczQxRVpud2xJcDZNWHAzbzIxYlhDVmRObmRmMHo5QTJ2V3pGeC9jN0Yr?=
 =?utf-8?B?NFBaNSszZVd0Unh6c2xUanFRZDZVN016NldsVXYwZzdrV2MvRzg5OVNkbWdw?=
 =?utf-8?B?ZFo1NlFHWldtUVhTQmFoWmUveGJ4MDNvNHhHWkgwT1Nub21TZ0FCVXZsaXZ4?=
 =?utf-8?B?S2tLK3FYQlpQWnhZSVdkTHhKNnpoVGoxRk51SU5TOVhmeFFHajJjcVUzL2JX?=
 =?utf-8?B?eWtQOVkvbjlsY0lRMDY2UVArMUk1YTFkblBKWUpZczJtUWVmcW5mM2tiZG94?=
 =?utf-8?B?Zk1SQWh4NjlReTlFSDRRS2NPVm5DaGFHVERQc29zeHpDZllyMUU3R2RTRnk2?=
 =?utf-8?B?Y1I0UnVuYjBHUU9OV01JWVNCdkkzckJZOXZvNEdmVmE5aVNabmsyRE54OFpY?=
 =?utf-8?B?d3JTeEM2dG1EVkxpRzRZNEphUGFYdlhFclhBb21ocElMaUluVFlMVVJ3N3pB?=
 =?utf-8?B?cGVIQVVwc1NoY0ZmZjJYZUE1Y3d0TVpnc0VCTTU2Y3pva1dpVTdsY0ZFOVR0?=
 =?utf-8?B?M0t6Q2wyM3l0cU1OZ1F1UTZJNkVxb2U3OStQc2l4MEIyL1B5VndpV3JzMHFB?=
 =?utf-8?B?cXVLOXJuZmJqWmRHdzZRb1ZCNS9NU2kzdkFGcDRhKytwYmVxem45RFpLdURo?=
 =?utf-8?B?QzRUK2dqWmlEWEVLai92QjFsWWszZFlGbU5rUGt3c0s4THM3cU90VFVQZ0FJ?=
 =?utf-8?B?bnN4N3QrdS9lRjhEajZmdEIxUDdQcFhUSURBbWZ0M2NYRFhZQUpIMTl6MEhX?=
 =?utf-8?B?ZXJ2Y0xQTDFBa2V5S1lHZVBFK0JoTmxzVC8yZ2RvaVo1eU9rZUJtcy9yaFgy?=
 =?utf-8?B?TERWclMwa3lCaVhnL0Vyc081NEwvemZ0c0pPMjZjSWIxUlZ5dTNPNEdneDFK?=
 =?utf-8?B?WXhoVEJlaDJxVGtiUVNDeW5MbGNQQXBQY1NEYzQxSzljUTdNM05tMk5MbTgz?=
 =?utf-8?B?enBFWU43a3crc1FDUjFTTVM4VGVnYmdLMmpOL2Z4NnprUWFLbS8zWk1JL0Fh?=
 =?utf-8?B?VDFaK21wcjJhUlcvTVZsNlBKUnFVanMxL21DVzhiZEFJd3lDcnM1ZHp5bVg0?=
 =?utf-8?B?YjNoei9ueW96UzE0Y2VzZ0lKTDFjR2dkb1JMUVhiNTFhR3NiOXk4djZQeU5t?=
 =?utf-8?B?SUlYeUp4S0NOL3d5YmNZa3BQRUdtdm8rWWl2WWUvTEt2MEVVMVdHRFJaUXF0?=
 =?utf-8?B?cE5ZRE1wcjltblpBQlRQRUxiZU5ROFdpYUdjZGJMUTYxdjZKd0xVUUlzakZG?=
 =?utf-8?B?UE5zZmRmbVRJNVRQYjVDWHp5M3FQa2xPcjEyVjFNVnloOWxUZm5HWGVUNXBx?=
 =?utf-8?B?ejUyckkwYVh1UzIwaURNTk5HK0F1R1ZUaUV1TmZXN2ZWeVB5Mll4MXZjWHhw?=
 =?utf-8?B?cExPNUZRcXhtK25rMEhzMlRMZmlEbUV1bGpMSFlyb1BMcTRpNDlldmluL3Y3?=
 =?utf-8?B?cWY2U21xcjFIRHFlMEFvTTVQODBTWFF1SGlSclVXUVQrZGNvMGVqSk1aTkRC?=
 =?utf-8?B?WGJxem5nWk9DdVQ3ME01VVN3M1ByWHpsUnViRkx2QjRSajVSZGNHZk9aZGlJ?=
 =?utf-8?B?ZkZHcHVpTmMvS0JxcjZRb1FOM0J0Mkhiajl4bHhiMVpiV0lmNW05Sys1cGVJ?=
 =?utf-8?B?VWNjK1RKNTBSQ0RTRTFjendvRHlBQXVRRTIzWmZmbTgwdnRNQ3p1WkN2WVhV?=
 =?utf-8?B?aDN1T28zVXA2eG5hbzBpNWh1UXh0RkVhNk9iYmpUM3NWNGpZVFlKQUhJZHBL?=
 =?utf-8?B?c1BEYUFuM1IwVUpqWkNvVjJZd0NCR0Erbjc5bU5sTGd3TFhJbk1MNS92ejlM?=
 =?utf-8?B?WXFHQm0rOUlrbW12d0ZsSWd3YWFJR2FSNlFDSm5FV3NieGNoSHgvcGJoK3pm?=
 =?utf-8?B?WlBnZTYxczJOeW5lV3NhR0xtQm92NHZSL0VRSy94WTNDcTNQQi9mS2lnU25y?=
 =?utf-8?B?ZUxKMDkzeDdCMGtPcFFjWU0rS1g2WjRJQzNwbkZjYkZYQnFQbWQxR2xkMFBr?=
 =?utf-8?Q?Drsj3qnUEkOQta5A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <590ED16EAD97FE458A53F55BEEA31A71@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d9ae88-1f5a-4625-5a9a-08df1a19fbf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2026 08:58:21.3336
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rJMl9R6B5/d0E987rQEi459BpXtlGwvlMhwI+e1us6zHsLtpzMRW5ur4dmWtT0nRVn94AtJo3wpfCf4Axb2qHE2aTqLExxeBIwv0H7ep2MY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5870
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_095839_558988_E3A39BCD 
X-CRM114-Status: GOOD (  25.77  )
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

SGkgYWxsLA0KDQpPbiBUdWUsIDIwMjUtMDgtMjYgYXQgMTY6MjUgKzAyMDAsIEFsZXhhbmRlciBT
dGVpbiB3cm90ZToNCj4gRnJvbTogQnJ1Y2UgQXNoZmllbGQgPGJydWNlLmFzaGZpZWxkQGdtYWls
LmNvbT4NCj4gDQo+IEZJTEVOQU1FIGlzIHJlcGxhY2VkIGJ5IHRoZSBmdWxsIHBhdGggdG8gdGhl
IGV4ZWN1dGluZyBzY3JpcHQuIElmDQo+IHRoZSBzY3JpcHQgaXMgZXhlY3V0ZWQgdmlhIGEgZnVs
bHkgc3BlY2lmaWVkIHBhdGgsIHRoYXQgaXMgY2FwdHVyZWQNCj4gaW4gdGhlIG91dHB1dC4gQWx0
aG91Z2ggaXQgZG9lc24ndCBpbXBhY3QgdGhlIG91dHB1dCwgaXQgZG9lcyB0cmlnZ2VyDQo+IHJl
cHJvZHVjaWJpbGl0eSB3YXJuaW5ncy9lcnJvcnMuDQo+IA0KPiBTbyB3ZSBpbnRyb2R1Y2UgYSBi
YXNlbmFtZSgpIGZ1bmN0aW9uIGluIHRoZSBzY3JpcHQgYW5kIHVzZSBpdCB0bw0KPiBtYWtlIHN1
cmUgdGhlIG91dHB1dCBmaWxlIGNvbnRhaW5zIG9ubHkgdGhlIG5hbWUgb2YgdGhlIGF3ayBzY3Jp
cHQuDQo+IFRoZSBtb3RpdmF0aW9uIGZvciB0aGlzIGNoYW5nZSBpcyBZb2N0byBlbWl0dGluZyBh
IGJ1aWxkIHdhcm5pbmcNCj4gwqAgV0FSTklORzogbGludXgtdHEtNi4xMi40MStnaXQtcjAgZG9f
cGFja2FnZV9xYTogUUEgSXNzdWU6IEZpbGUgL3Vzci9zcmMvZGVidWcvbGludXgtdHEvNi4xMi40
MStnaXQvYXJjaC9hcm0vaW5jbHVkZS9nZW5lcmF0ZWQvYXNtL21hY2gtdHlwZXMuaCBpbiBwYWNr
YWdlIGxpbnV4LXRxLXNyYyBjb250YWlucyByZWZlcmVuY2UgdG8gVE1QRElSIFtidWlsZHBhdGhz
XQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogQnJ1Y2UgQXNoZmllbGQgPGJydWNlLmFzaGZpZWxkQGdt
YWlsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIFN0ZWluIDxhbGV4YW5kZXIuc3Rl
aW5AZXcudHEtZ3JvdXAuY29tPg0KDQp3ZSB1c2UgaXQgZm9yIHF1aXRlIHNvbWUgdGltZSBmb3Ig
VEkgQU0zMzV4IGJ1aWxkcywgc28gdGhlIGlzc3VlIGlzDQpyZWFsIGFuZCBsb25nLXN0YW5kaW5n
LiBUaGUgZml4IGFsc28gbWFrZXMgc2Vuc2UgdG8gbWUuDQoNClJldmlld2VkLWJ5OiBBbGV4YW5k
ZXIgU3ZlcmRsaW4gPGFsZXhhbmRlci5zdmVyZGxpbkBzaWVtZW5zLmNvbT4NClRlc3RlZC1ieTog
QWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5Ac2llbWVucy5jb20+DQoNCkFy
bmQsIHdvdWxkIHlvdSBjb25zaWRlciB0aGUgcGF0Y2ggZm9yIHRoZSBzb2MgdHJlZT8NCk9yIHNo
b3VsZCBJIHJhdGhlciBhZGQgdGhlIHBhdGNoIHRvIFJ1c3NlbGwncyBwYXRjaCBzeXN0ZW0/DQoN
Cj4gLS0tDQo+IMKgYXJjaC9hcm0vdG9vbHMvZ2VuLW1hY2gtdHlwZXMgfCA2ICsrKysrLQ0KPiDC
oDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybS90b29scy9nZW4tbWFjaC10eXBlcyBiL2FyY2gvYXJtL3Rvb2xz
L2dlbi1tYWNoLXR5cGVzDQo+IGluZGV4IGNiZTFjMzNiYjg3MTAuLmFiNjlkNDA4ZjllMTIgMTAw
NjQ0DQo+IC0tLSBhL2FyY2gvYXJtL3Rvb2xzL2dlbi1tYWNoLXR5cGVzDQo+ICsrKyBiL2FyY2gv
YXJtL3Rvb2xzL2dlbi1tYWNoLXR5cGVzDQo+IEBAIC0yMSwxMCArMjEsMTQgQEAgTkYgPT0gMyB7
DQo+IMKgCcKgIG51bVtucl0gPSAiIjsgbnIrKw0KPiDCoAl9DQo+IMKgDQo+ICsJZnVuY3Rpb24g
YmFzZW5hbWUoZmlsZSkgew0KPiArCcKgwqAgc3ViKCIuKi8iLCAiIiwgZmlsZSkNCj4gKwnCoMKg
IHJldHVybiBmaWxlDQo+ICsJfQ0KPiDCoA0KPiDCoEVORAl7DQo+IMKgCcKgIHByaW50ZigiLypc
biIpOw0KPiAtCcKgIHByaW50ZigiICogVGhpcyB3YXMgYXV0b21hZ2ljYWxseSBnZW5lcmF0ZWQg
ZnJvbSAlcyFcbiIsIEZJTEVOQU1FKTsNCj4gKwnCoCBwcmludGYoIiAqIFRoaXMgd2FzIGF1dG9t
YWdpY2FsbHkgZ2VuZXJhdGVkIGZyb20gJXMhXG4iLCBiYXNlbmFtZShGSUxFTkFNRSkpOw0KPiDC
oAnCoCBwcmludGYoIiAqIERvIE5PVCBlZGl0XG4iKTsNCj4gwqAJwqAgcHJpbnRmKCIgKi9cblxu
Iik7DQo+IMKgCcKgIHByaW50ZigiI2lmbmRlZiBfX0FTTV9BUk1fTUFDSF9UWVBFX0hcbiIpOw0K
DQotLSANCkFsZXhhbmRlciBTdmVyZGxpbg0KU2llbWVucyBBRw0Kd3d3LnNpZW1lbnMuY29tDQo=

