Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB28CA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 08:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAkAZ8ndel02TQoRIPgHibq0KUSxLRnSZ/0zMDyF9qI=; b=w3xT/WftsoZiMSAq8O5SXmvq19
	s/yDXPN1bE1T1XsSKwAb7Eo5BfkK3jOHRKUIV09wTZ+H2ADD7RM6QIz56MQxcORAiHBXWgs0xdMZF
	JUiBxa8Ap1zAHs0Ek0KwHQ20XKCkIGMd10nwMavKHiE2Mm/W5ZIxJIOUaPzyw8Ym7k+1AumM0IxSO
	b5rK8dvG9CUs5WRX7xajjtzCCZZ+RwnsMOBvsGZrWCFUPg7sfoTjNttEImeVtoeX7Z9V/jlM5FG5x
	zIrjyn0L+qz7tL/qsRj5AvtLKS6oxS+YqY3a2maf/V2rxeAb4ey/+yoRPP5SbrGzE7xk8BPaOYc9F
	2+1MyV/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGYE7-0000000CNQv-3hm1;
	Tue, 13 Oct 2026 08:51:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGYE3-0000000CNQX-3g4Q;
	Tue, 13 Oct 2026 08:51:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sAkAZ8ndel02TQoRIPgHibq0KUSxLRnSZ/0zMDyF9qI=; b=h/crZQWSnMJMn/cTwr+mUnHz+T
	kaCQ6daIg3HM8h/jknPYKIK39HZoSBDi3jg47PiJnRPEUVHRiQmL9B40zWnlWwyhgaaYn/OKeL5w/
	zUTYGWUUlxydWbpa5KHpdOvpOtqdL9/yPVEa6v0cx5gRJTwBj/UyzsdSjWsDiT57kK+ITpaJuogsS
	ZQ8AvL9vIaZ5XC/oKyHaglg3/aLY5iHr3mn9ywBrvI1rehfWJoXrLJ+YMYOTaGgQj0zbyXzo2GKel
	QkaZD1s9e92BZNHQk6zGWk2fYXyH6jtptIzPupGWuI7stO4Xk4RanOENJ0CQZPJdZiJlGpszZLobX
	SRMk1/1g==;
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGYDz-0000000FIXq-0ePn;
	Tue, 13 Oct 2026 08:51:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lNmLxAH55ePJgQaXG5Rlubhhv2TwaYhyvU/5XEeIG+rdOA8uVDi2/ed5Mrpg1upLXI8AA0oRpk729FyYME/+V+NZYAkpsif7YRb8CIbSGNCvaLGg64GWFyi6ctWqnqj7erR/HzLXxa3sK/cQf5BIPMKsJqk2TbMQBkw1mfg+WuDZabYHCVaFmaTD5xNk3BiIKZ58GyIicP37BhyVcLOPn/cdKc6Gn68I4YsFNVwfwymDhNhsQFk1FJx4OHL/V4ZmGWqWYDVkbKxaFemXMLz5+eRy3wVQbbQzycuymwBOKA/aLZinHnHWMn1jiIKZZRS1lblcAwmKbz3DDHfWKyn0Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAkAZ8ndel02TQoRIPgHibq0KUSxLRnSZ/0zMDyF9qI=;
 b=xEYEjP6uQEQ4SmzgTa7mzgnL3/c3Fr6OV/JmiVQtxTiJ/UjJmoR0js9PICePcUvQOX2nWTO2VxNU66Qvxhw0waeYx9jewIXLMkuhusXNe24s4XMGG79vqg5xXEvK0ILoze8Btwxj6/GYZ1rTvXnvj/asf4GwuA//VzGpC/+lUrG9zyQMMEJdVSAtDODZaIKxuIxzp+/T0K8jznvh0ZhgToazH1ttFy1TdB0VpF1U0i6UDEAlDWf9bECIbSIICMsFVxx5Ti2BZerj0l9EVRNscZuqYqHOKNGbNyIi1kzV4IEIpxRlAJlwbTjCZ62ISItYGnibE0neSPlovgyMMtwrOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from JH0SPRMB0074.apcprd06.prod.outlook.com (2603:1096:990:63::5) by
 TY0PR06MB5472.apcprd06.prod.outlook.com (2603:1096:400:266::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.23; Tue, 13 Oct 2026 08:50:48 +0000
Received: from JH0SPRMB0074.apcprd06.prod.outlook.com
 ([fe80::d5a:16db:d97c:df7a]) by JH0SPRMB0074.apcprd06.prod.outlook.com
 ([fe80::d5a:16db:d97c:df7a%5]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 08:50:48 +0000
From: =?gb2312?B?THVvIExpdSAowfXC3ik=?= <Luo.Liu@cixtech.com>
To: Conor Dooley <conor@kernel.org>
CC: "vkoul@kernel.org" <vkoul@kernel.org>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>, "mani@kernel.org" <mani@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?gb2312?B?R2FyeSBZYW5nICjR7tDCzrAp?= <Gary.Yang@cixtech.com>,
	=?gb2312?B?RnVnYW5nIER1YW4gKLbOuLu41Sk=?= <fugang.duan@cixtech.com>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?gb2312?B?V3V5aSBTaGVuICjJ8s7k0uUp?=
	<wuyi.shen@cixtech.com>, =?gb2312?B?RWFzdGxha2UgWWFuZyAo0e62q7uiKQ==?=
	<Eastlake.Yang@cixtech.com>
Subject: =?gb2312?B?u9i4tDogW1BBVENIIHYyIDEvM10gZHQtYmluZGluZ3M6IHBoeTogQWRkIENJ?=
 =?gb2312?Q?X_Sky1_DP_PHY?=
Thread-Topic: [PATCH v2 1/3] dt-bindings: phy: Add CIX Sky1 DP PHY
Thread-Index: AQHdWkZJ9y0ACZVbrE2EN05pQE0rk7b6Qa8AgADpo6A=
Date: Tue, 13 Oct 2026 08:50:48 +0000
Message-ID: <JH0SPRMB0074821E0A55434A23B60E45F59E2@JH0SPRMB0074.apcprd06.prod.outlook.com>
References: <20261012123618.648930-1-Luo.Liu@cixtech.com>
 <20261012123618.648930-2-Luo.Liu@cixtech.com>
 <20261012-founding-stench-55cff46fe1a3@spud>
In-Reply-To: <20261012-founding-stench-55cff46fe1a3@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: JH0SPRMB0074:EE_|TY0PR06MB5472:EE_
x-ms-office365-filtering-correlation-id: a4062767-5afb-44d8-8a21-08df290713a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|23010399003|376014|366016|38070700021|56012099006|4143699003|261009223027099003|10067099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: rjZ+3Ir+iJYVrSBqXc9NBOOHNcP9pxm5cIQZnP2TKVJBwYab9bv2WfdDGhi4JgYLmZXSnxmiK36aSa0aSKYIOEBsVnbNlJgfxlA7u6Ekea3+E1gTZdn+RNGH2eLWDhr8gCngqPeWrPczuJhCyrGQS+5/pJjlPkgoiGJ4KrJLmTl3ezcQMjvcxOLNrZTay2VZRK/das04aM9gmwFeb5yAqxyKvZrKxl64zub5OmYXPX7ckdM1bBp/HB3zUH2qLICihhv7NA0x6UBhosKk6saO6dGP5NKwTQQjPZsYkxxK3oE1wdSRkWefJd4+GNXqBnSuDmqLdAxHrlYewx2jMuxiXe4Wej5kzGfOlnHWDTynhPiWosv4nCB7aglYcFtNzuYlkw0c0oEk35gQuX3mpZLS7nU3Ccw8/2jAX5KfmP0n3Mfdn4I2EpcFQpSFDSPWIR+S09nVmxaW1N3XqWcVfDVpJrg2BUPHJ+irLafi4vBpzeK3h4ZKBXY+po56Y9lLRRxsdc+9VmeQb+bW7JySwAo2HQ8isgQJWdf3V2aO40bsrmlfcq7tY/LC7t61SYRZ/bCXtA+Wi9P4A13+jEsV6ZjrVX5ZzT+bbnyAzWj1wNSE0/zIcOc+Tb4O9rrjTQMAFVZdt1XslxZMHAKiSfRPtcCF5xPekfILtahT5CXPL1LbxKU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0SPRMB0074.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(23010399003)(376014)(366016)(38070700021)(56012099006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?cEdtZGI2dWNsaUJwS1JuRXlSQzZIcVJyVmUxckpPS0tZN3JsdVZ0MWdXSGNU?=
 =?gb2312?B?U3FyL0VXNGJjVWVycm1YNU9HRFNnenhnVHlTcUIzamZWN2t0cUF4RkhjQzcv?=
 =?gb2312?B?MFdFem1qMlRYVEZzNTJoWUtYdVVyS2NXVHVKTm5iQTVTcFp3ZDQ3N1BkMUZj?=
 =?gb2312?B?RnRiSmNjQTBCaWVzZCt4RVRRTmhSMDdleDFBNGttZWx4c2NhVWM2SUpjeHNY?=
 =?gb2312?B?c3lVR0NyR1JhTnR0TVpQRmNycVlrVE9XMTJpbVlvR1RrZHBldkNIQ0FtZ2dT?=
 =?gb2312?B?ZUxlWFRiZ09zdXBvekxpcjBCdlRTSlovaWx0WWtWTVdUb3lCS2sxcit4TzQv?=
 =?gb2312?B?d1VVSzdDSEswNWxiRnNCMFRsRTJMVkw1amhsU1gxZlBld0RmV2Rkd21lQlZ4?=
 =?gb2312?B?OEM1S1BDQk1kcWhpaE1lR2dwcG1SbjNydEQ5b1J2dC9VbkZnMEdUeWFEcG5t?=
 =?gb2312?B?aTFMU0ZaMFA5QjdNMVhHdVYrck50RFpVQTdUaHNLRkowTVZ6OXd2UHVmUGdn?=
 =?gb2312?B?cng3d1RTNW9aTHpXM1ZONW9UQ2ViMnQ1WHMwNFNvRTFDNVhPSE92eE9Oeitn?=
 =?gb2312?B?WmpqZUM5VlZZZ2RrMlBpUlo1MUR0VG1VckY2MGw5QmVMRDZ1bW9Fd01uMzAy?=
 =?gb2312?B?MnBCbmtXdzB6ZUJzSkpWSkJNbGlFcGQvdFpwYzh5WjhEZE1oVFc1cFJ1Y09p?=
 =?gb2312?B?S20rVDRIQ05qSjUyRFlrVVRrbDJsNWJjWnp4RXpHdmx0VEl3cStCaGtadWZS?=
 =?gb2312?B?SXR1eGM4ZjlYOGlWcWpnSXdOU0hlVnF2VitBdjRUekVYVGVtaFZZdHROQVpm?=
 =?gb2312?B?YWdiQzVEWjdESFFuc2ZoZHVCWlBsbXhTbmF4YXkrTXJmQ243M2ZpcW8vZ0pa?=
 =?gb2312?B?K1BUbEpKb0xOMDJNc2s1eUY5dlgrQ0llZ056aWRFYitURlYvbWdmTnZaalpS?=
 =?gb2312?B?Lzd1Q1QyU2VQTnAveXFXZkFveTEwZjNUcnZ3d2tHbTNGZXZWOGNpeGl3czg4?=
 =?gb2312?B?NXMwcEZ6UXNLc3N6bDJENWMybTB0Nlp0K1NLUlBDYnBnNnFldXRWOWpVZDVI?=
 =?gb2312?B?M2Zhbnl2RXFyc3NReW1PSnV5M2puLzNJbE9JdnI3ckc4SFRZSlN5dkRtK1hG?=
 =?gb2312?B?Tm1BKzA4QUdKMnByR3Q5OVJJN2ZRQ2xzR2JvdVdqZHpZMldST2h6QTJvb0Zr?=
 =?gb2312?B?SU0vZWV2QXhTOStzWmdVVHEybk5FZzhvT090cEpqQytBY0NUSVViVXZkdDJO?=
 =?gb2312?B?VzhkaVE3TUlKYmFrdzhDeTRRazM5ZTF4TXNnYnZhUVk3aHB3cEFNZnEwNmd5?=
 =?gb2312?B?NWdyOUk0ams5Rk4vOEZMQmRWb0Y3bHk1Rks5YVlwSStlWG51MU9RcGRKanVN?=
 =?gb2312?B?OE5ieGN2eUtYczJITjVYMkJWZXhFanVIRnpBc3IweVFzQmRiREV1ZTJ4dTJQ?=
 =?gb2312?B?OVhENkFJTEdFNm9xVnRLOXUzODQ5OENmaEFvYVBSVkh1T3k3dm10NFZCc0cr?=
 =?gb2312?B?Y1Y4KzBwQzZwSFJwVy80VU5yVjI5Y2tZc3N1WkRDZGkrWkR0SVlMMFU4NHdN?=
 =?gb2312?B?aGlPU1h4M3dxVHh5Z3hKOXJLOUdLR0dlN0l0SzU5Vm9ibzZtTEJqNXdjeUU3?=
 =?gb2312?B?TEx6RTU5ekkxNVRNZWVodU44RjRTRmFHWmxsTFNOdmxMNVhpUlFtbFhZcHc1?=
 =?gb2312?B?V1ZyQzRtdnRIdVYxS09GQVZzdUtoZDhaMHg5RGdJTXdRRGsvRld5REd3cy8z?=
 =?gb2312?B?clJ0RE10dEJQUFdvbEpvMk85TmRmN2hlMVZUdDIvanpLd3RGZmswWlZzSnQ2?=
 =?gb2312?B?NFNNRFNpajk0WEJ1WXkxUEpsTVArWTRRYlZ1T0dpaytONng3dEVMY1NTdDVl?=
 =?gb2312?B?RWVkNC96U0ZrYmgzRTVaV2M1S1VtanZBRVVqK1QzeXJKcnNYUlFYakorN3gw?=
 =?gb2312?B?b0wvL2VxL28wUVVISGxVb28zU0lSeTlVV05sNnRSZTJaMW03cXd2MjgrUmsy?=
 =?gb2312?B?NWlSWm9lV1k0a3ozaFFObzBHZVk3TW5qRm5ueHB1WjZPenlmR004TWtTdGJW?=
 =?gb2312?B?d2V3eHNsdElUVFJTOUppV2FCRjdKdUNDSWZHdWxsS3kxM2R2bmV5RDN3MVhx?=
 =?gb2312?B?MXV1Rm5CTkRVUTRQWTJOeXBXRHpJYklkeEU1VnJMM1hua1IzblJDREs4OS9h?=
 =?gb2312?B?TVdOSGw3OUxrYmEwaG95NUZKOGJQM2ZaSFNUL2ZrajVLRW03d2JOeVNxS3dT?=
 =?gb2312?B?ZjRrNHRLcWRXdzZaTlZ5SjZ5R2pNbFFGcDFDNUljeHVlQllVSWtsdXNLWlNk?=
 =?gb2312?Q?9paxwO8B7Oqx4bSfPU?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: JH0SPRMB0074.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4062767-5afb-44d8-8a21-08df290713a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2026 08:50:48.1023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KeWovK2rSGrQ2aTok5lBADGRlrdR9Wt5bZ+A/i1SX8zOAWLm3NTwOb62oOkCS50U23dHWU1kLl5z0PAIUKOAFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5472
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_095107_790759_82975803 
X-CRM114-Status: GOOD (  24.10  )
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

SEkgQ29ub3IsIA0KDQoJVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgeW91ciByZXBseSBhbmQgc3Vn
Z2VzdGlvbnMuDQoNCi0tLS0t08q8/tStvP4tLS0tLQ0Kt6K8/sjLOiBDb25vciBEb29sZXkgPGNv
bm9yQGtlcm5lbC5vcmc+IA0Kt6LLzcqxvOQ6IDIwMjbE6jEw1MIxM8jVIDI6NTUNCsrVvP7Iyzog
THVvIExpdSAowfXC3ikgPEx1by5MaXVAY2l4dGVjaC5jb20+DQqzrcvNOiB2a291bEBrZXJuZWwu
b3JnOyBuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnOyBtYW5pQGtlcm5lbC5vcmc7IHJvYmhAa2Vy
bmVsLm9yZzsga3J6aytkdEBrZXJuZWwub3JnOyBjb25vcitkdEBrZXJuZWwub3JnOyBHYXJ5IFlh
bmcgKNHu0MLOsCkgPGdhcnkueWFuZ0BjaXh0ZWNoLmNvbT47IEZ1Z2FuZyBEdWFuICi2zri7uNUp
IDxmdWdhbmcuZHVhbkBjaXh0ZWNoLmNvbT47IGxpbnV4LXBoeUBsaXN0cy5pbmZyYWRlYWQub3Jn
OyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnOyBjaXgta2VybmVsLXVwc3RyZWFtIDxjaXgta2VybmVsLXVwc3RyZWFtQGNpeHRl
Y2guY29tPjsgcC56YWJlbEBwZW5ndXRyb25peC5kZTsgbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZzsgV3V5aSBTaGVuICjJ8s7k0uUpIDxXdXlpLlNoZW5AY2l4dGVjaC5jb20+OyBFYXN0bGFr
ZSBZYW5nICjR7raru6IpIDxFYXN0TGFrZS5ZYW5nQGNpeHRlY2guY29tPg0K1vfM4jogUmU6IFtQ
QVRDSCB2MiAxLzNdIGR0LWJpbmRpbmdzOiBwaHk6IEFkZCBDSVggU2t5MSBEUCBQSFkNCg0KT24g
TW9uLCBPY3QgMTIsIDIwMjYgYXQgMDg6MzY6MTZQTSArMDgwMCwgTHVvIExpdSB3cm90ZToNCj4g
RG9jdW1lbnQgdGhlIGRlZGljYXRlZCBEaXNwbGF5UG9ydCBQSFkgb24gQ0lYIFNreTEsIGluY2x1
ZGluZyB0aGUgDQo+IG9wdGlvbmFsIGNpeCxleHRlcm5hbC1kcCBib2FyZCBwcm9wZXJ0eSBmb3Ig
ZXh0ZXJuYWwgY29ubmVjdG9yIHN3aW5nLg0KPiBBZGQgYSBNQUlOVEFJTkVSUyBlbnRyeSBmb3Ig
dGhlIGJpbmRpbmcgYW5kIGRyaXZlci4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEx1byBMaXUgPEx1
by5MaXVAY2l4dGVjaC5jb20+DQo+IC0tLQ0KPiAgLi4uL2JpbmRpbmdzL3BoeS9jaXgsc2t5MS1k
cC1waHkueWFtbCAgICAgICAgIHwgNTMgKysrKysrKysrKysrKysrKysrKw0KPiAgTUFJTlRBSU5F
UlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDggKysrDQo+ICAyIGZpbGVz
IGNoYW5nZWQsIDYxIGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCANCj4gRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9jaXgsc2t5MS1kcC1waHkueWFtbA0K
PiANCj4gZGlmZiAtLWdpdCANCj4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cGh5L2NpeCxza3kxLWRwLXBoeS55YW1sIA0KPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9waHkvY2l4LHNreTEtZHAtcGh5LnlhbWwNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQN
Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5jNjkxNGNhYjc0ZTANCj4gLS0tIC9kZXYvbnVsbA0KPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L2NpeCxza3kxLWRwLXBo
eS55YW1sDQo+IEBAIC0wLDAgKzEsNTMgQEANCj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKSAlWUFNTCAxLjINCj4gKy0tLQ0KPiArJGlk
OiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9waHkvY2l4LHNreTEtZHAtcGh5LnlhbWwj
DQo+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFt
bCMNCj4gKw0KPiArdGl0bGU6IENJWCBTa3kxIERpc3BsYXlQb3J0IFBIWQ0KPiArDQo+ICttYWlu
dGFpbmVyczoNCj4gKyAgLSBMdW8gTGl1IDxMdW8uTGl1QGNpeHRlY2guY29tPg0KPiArDQo+ICtk
ZXNjcmlwdGlvbjoNCj4gKyAgVGhlIENJWCBTa3kxIERQIFBIWSBwcm92aWRlcyB0aGUgUE1BL0NE
QiByZWdpc3RlciBpbnRlcmZhY2UgZm9yIHRoZQ0KPiArICBkZWRpY2F0ZWQgRGlzcGxheVBvcnQg
aW5zdGFuY2Ugb24gQ0lYIFNreTEuDQo+ICsNCj4gK3Byb3BlcnRpZXM6DQo+ICsgIGNvbXBhdGli
bGU6DQo+ICsgICAgY29uc3Q6IGNpeCxza3kxLWRwLXBoeQ0KPiArDQo+ICsgIHJlZzoNCj4gKyAg
ICBtYXhJdGVtczogMQ0KPiArDQo+ICsgICIjcGh5LWNlbGxzIjoNCj4gKyAgICBjb25zdDogMA0K
PiArDQo+ICsgIHJlc2V0czoNCj4gKyAgICBtYXhJdGVtczogMQ0KPiArICAgIGRlc2NyaXB0aW9u
OiBQSFkgaGFyZHdhcmUgcmVzZXQNCj4gKw0KPiArICBjaXgsZXh0ZXJuYWwtZHA6DQo+ICsgICAg
dHlwZTogYm9vbGVhbg0KPiArICAgIGRlc2NyaXB0aW9uOg0KPiArICAgICAgVXNlIHZvbHRhZ2Ug
c3dpbmcgdmFsdWVzIHN1aXRhYmxlIGZvciBhbiBleHRlcm5hbCBEaXNwbGF5UG9ydA0KPiArICAg
ICAgY29ubmVjdG9yIGluc3RlYWQgb2YgdGhlIGRlZmF1bHQgbG93LXZvbHRhZ2UgdmFsdWVzLg0K
PiArDQo+ICtyZXF1aXJlZDoNCj4gKyAgLSBjb21wYXRpYmxlDQo+ICsgIC0gcmVnDQo+ICsgIC0g
IiNwaHktY2VsbHMiDQo+ICsgIC0gcmVzZXRzDQoNCkEgcmVzZXQgYnV0IG5vIGNsb2Nrcz8gVGhh
dCdzIGEgYml0IGhhcmQgdG8gYmVsaWV2ZS4NCg0KU2VlbXMgZmluZSBvdGhlcndpc2UsIHVubGVz
cyBJIGFtIG1pc3Npbmcgc29tZSBzb3J0IG9mIGNvbW1vbiBwcm9wZXJ0eSBmb3IgdGhlIHZvbHRh
Z2Ugc3dpbmcgc3R1ZmYuDQoNClRoYW5rcywNCkNvbm9yLg0KDQoNCjGjrFJlZ2FyZGluZyB0aGUg
bWlzc2luZyBjbG9ja3MgcHJvcGVydHk6IA0KDQoJVGhlIFBIWSBBUEIgY2xvY2sgaXMgcGh5c2lj
YWxseSB0aGUgc2FtZSBjbG9jayBhcyB0aGUgRFBUeCBjb250cm9sbGVyIEFQQiBjbG9jay4gSXQg
aXMgZGVzY3JpYmVkIGFuZCANCg0KbWFuYWdlZCBvbmx5IGJ5IHRoZSBEUFR4IGNvbnRyb2xsZXIg
ZHJpdmVyLCBzbyB0aGUgUEhZIG5vZGUgZG9lcyBub3QgbGlzdCBhIHNlcGFyYXRlIGNsb2NrcyBw
cm9wZXJ0eS4NCg0KVGhlIFBIWSBkcml2ZXIgb25seSBpbXBsZW1lbnRzIHRoZSBzdGFuZGFyZCBQ
SFkgY2FsbGJhY2tzLiBJdCBkb2VzIG5vdCB0b3VjaCB0aGUgaGFyZHdhcmUgaW4gcHJvYmU7IA0K
DQpBbGwgUEhZIHByb2dyYW1taW5nIGhhcHBlbnMgbGF0ZXIsIHdoZW4gdGhlIERQVHggZHJpdmVy
IGFjdGl2ZWx5IGNhbGxzIHBoeV9pbml0KCkgLyBwaHlfcG93ZXJfb24oKSAvIHBoeV9jb25maWd1
cmUoKSANCg0KYW5kIHNpbWlsYXIgaW50ZXJmYWNlcy4gDQoNCglCeSB0aGF0IHRpbWUgdGhlIHNo
YXJlZCBBUEIgY2xvY2sgaXMgYWxyZWFkeSB1bmRlciBEUFR4IGNvbnRyb2wuDQoNClNvIGZyb20g
dGhpcyBiaW5kaW5nJ3MgcG9pbnQgb2YgdmlldyB0aGVyZSBhcmUgbm8gY2xvY2tzIHRvIGRlc2Ny
aWJlIKGqIG9ubHkgdGhlIHJlc2V0IGxpbmUgb3duZWQgYnkgdGhlIFBIWSBub2RlLg0KDQoNCjKj
rE9uIHRoZSB2b2x0YWdlIHN3aW5nIHByb3BlcnR5OiB0aGVyZSBpcyBubyBzdWl0YWJsZSBjb21t
b24gRFQgcHJvcGVydHkgZm9yIHRoaXMuDQoNCglUaGUgZmxhZyBvbmx5IHNlbGVjdHMgd2hpY2gg
dmVuZG9yIGNhbGlicmF0aW9uIHRhYmxlIHRvIHVzZSBmb3IgdGhlIHNhbWUgUEhZIElQIKGqIHRo
ZSBEaXNwbGF5UG9ydCBzd2luZy9FUSB0YWJsZSANCg0KdmVyc3VzIHRoZSBlRFAgdGFibGUuIA0K
DQoJUnVudGltZSBzd2luZy9wcmUtZW1waGFzaXMgbGV2ZWxzIHN0aWxsIGNvbWUgZnJvbSBwaHlf
Y29uZmlndXJlX29wdHNfZHAgYXMgdXN1YWwuDQoNClRoZSBvbGQgbmFtZSBjaXgsZXh0ZXJuYWwt
ZHAgd2FzIG1pc2xlYWRpbmcuIEkgd2lsbCByZW5hbWUgaXQgdG8gY2l4LGVkcCAocHJlc2VudCA9
PiBlRFAgdGFibGUsIGFic2VudCA9PiBEUCB0YWJsZSkNCg0KYW5kIHVwZGF0ZSB0aGUgZHJpdmVy
IGFuZCBiaW5kaW5nIGFjY29yZGluZ2x5IGluIHYzLg0KDQoNClRoYW5rcywNCkx1by4NCg0KDQo+
ICsNCj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiArDQo+ICtleGFtcGxlczoNCj4g
KyAgLSB8DQo+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Jlc2V0L2NpeCxza3kxLXM1LXN5
c3RlbS1jb250cm9sLmg+DQo+ICsNCj4gKyAgICBwaHlAMTQxNGMwMDAgew0KPiArICAgICAgICBj
b21wYXRpYmxlID0gImNpeCxza3kxLWRwLXBoeSI7DQo+ICsgICAgICAgIHJlZyA9IDwweDE0MTRj
MDAwIDB4NDAwMD47DQo+ICsgICAgICAgIHJlc2V0cyA9IDwmczVfc3lzY29uIFNLWTFfRFBfUEhZ
X1JTVF9OPjsNCj4gKyAgICAgICAgI3BoeS1jZWxscyA9IDwwPjsNCj4gKyAgICB9Ow0KPiBkaWZm
IC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUyBpbmRleCANCj4gM2ExOWRhNzRkMDBj
Li5iNDZkMGY0MjIwYTkgMTAwNjQ0DQo+IC0tLSBhL01BSU5UQUlORVJTDQo+ICsrKyBiL01BSU5U
QUlORVJTDQo+IEBAIC02MzYwLDYgKzYzNjAsMTQgQEAgTToJU2F0aXNoIEtoYXJhdCA8c2F0aXNo
a2hAY2lzY28uY29tPg0KPiAgUzoJU3VwcG9ydGVkDQo+ICBGOglkcml2ZXJzL2luZmluaWJhbmQv
aHcvdXNuaWMvDQo+ICANCj4gK0NJWCBTS1kxIERJU1BMQVlQT1JUIFBIWSBEUklWRVINCj4gK006
CUx1byBMaXUgPEx1by5MaXVAY2l4dGVjaC5jb20+DQo+ICtSOglDSVggTGludXggS2VybmVsIFVw
c3RyZWFtIEdyb3VwIDxjaXgta2VybmVsLXVwc3RyZWFtQGNpeHRlY2guY29tPg0KPiArTDoJbGlu
dXgtcGh5QGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gK1M6CU1haW50YWluZWQNCj4gK0Y6CURvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvY2l4LHNreTEtZHAtcGh5LnlhbWwNCj4g
K0Y6CWRyaXZlcnMvcGh5L2NpeC8NCj4gKw0KPiAgQ0xBTkcgQ09OVEVYVCBBTkFMWVNJUw0KPiAg
TToJTWFyY28gRWx2ZXIgPGVsdmVyQGdvb2dsZS5jb20+DQo+ICBSOglCYXJ0IFZhbiBBc3NjaGUg
PGJ2YW5hc3NjaGVAYWNtLm9yZz4NCj4gLS0NCj4gMi4yNS4xDQo+IA0K

