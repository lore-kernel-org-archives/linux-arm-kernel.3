Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EE4606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 01:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xFDVjGp2;
	dkim=pass (2048-bit key, unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=AY5GLLrh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AeBZK8r+mxZ1Nz1yDIHKXSZQsaq1zay0eAxH9FrWK/k=; b=xFDVjGp2KgM5fbr7vNLaYGaeDZ
	K3n0vGCkw8XUaI3KiDLwciIFWoRhCortTyW7RByE8xLsIEpZNbFaVxSYvUlNCcy9Y32UZWmsphhPI
	PBRmY1jHogpDYj1is1NBSncSAs3lH6XUnPaGhGNMojk+rbCWl1je7gWqza65vWTvZC+pt8BpzZMbA
	6hPbKSbcY5WOYgBR+CgDjtQV8pQ8R41GDK1n9h5n+S+6/q1q6DrM8kUVcgMsjtoqA1z3vwd19me5+
	NXYuW47XBmnuWoa7y+DwPwWvhLKhtpFn54/3+LQ1jD+ODEYSf5Bwh3vMHRDS3coQYB3TrdTO5v6to
	RijRT1jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJLUt-0000000Aued-28Uy;
	Wed, 21 Oct 2026 01:52:07 +0000
Received: from mail-japanwestazon11022108.outbound.protection.outlook.com ([40.107.75.108] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJLUq-0000000Audo-2Bmf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 01:52:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f7/5dn5lz97u62YCoJCYrdDVuUf3m5cB0p5Y5W/hckpj2YDFFEWgVcySDja7OgrezOP8aZ/PQBOWiRqlkrp0xakNB7ZGQuG/1iL1KYrTBMVmO2Sw8Hem2JxbfuVYE65UIBRkYL7tuan3LkuusMY7tiL7VOIuR3TfREUuFJ1ggp8u7Zqu0jtuweV9h8MY10Bc84HsTkHAPX/4h5y/3nMMV6+YtmF+V8W9L2elCc11TFeM/YjyqKamJMNms0OGVq+cmD+OFoEag0ojcp5mM156H9EpsstKkIzp7fi7b7ph7epSr/emVmNa+zb5qbEIWdZMuAMsvPD63jc7Nk/ZyK9a8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AeBZK8r+mxZ1Nz1yDIHKXSZQsaq1zay0eAxH9FrWK/k=;
 b=WWQ7fn1CH1d5HPsxVXVT+3I2ZWfulC4G6rpIU4X980U/qgsEnRjUQjt4GZ8VzRKPIqud9XInhCLhdFLOqrPJKtxP1Xxcjb26cyEmgdXQ9r8d9VdLgKtPGdCzlR4tK7BquutpobhZoLRNGIlEGYEx25JC7Ya2v4CczCFNKcvaOjhLvlVEYHBsqjPIo6UM0wXOOIWWpiBqD4qaWB8U3xidYUw4aKcKomo3KvdHzQQwTBx6UUqr3zQazyT045oi65YpopvOm1i7dLXbY1SctTUlf48yU/ieoXk3X4o006Mxu53OUQ+Ui3GWGJqT4wk4LVFzpByVxHGLFi69Y+YsvA6gCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AeBZK8r+mxZ1Nz1yDIHKXSZQsaq1zay0eAxH9FrWK/k=;
 b=AY5GLLrhbAFuxTDsjA3ZwaefdAtefIGmD2O1qVSd5uiuzmCMYuPxbP121lAeLWqD8XkbolHVG74jYHNe/ETAboOxHx1nvBFdeFoMk8ibdApb4zyT6+HX8ygVvmn6eSfq9EE1FCrfdm5WGr/qrQvwnQtqhYfu5seuBXCa/vpsbe+6fPLIXObZQNAOjkA1yTcqP8Zw17EPXNrZR9zSaBDk3BA0WrXWWIRbn+6kPA+KHgnJ8t+yhhP14vR5GYQpn2WgdKFXBtcCi4fSm8cnnoE0ygU9TKgKcf9941b0KW5t1fGj3h1tSUA0peI4eGKGDn+jWtnKis6nowigH3HgGdk9/Q==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by KUXPR06MB8752.apcprd06.prod.outlook.com (2603:1096:d10:a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Wed, 21 Oct
 2026 01:51:54 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::92af:c9d9:8779:d19%5]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 01:51:53 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Jonathan Cameron <jic23@kernel.org>
CC: David Lechner <dlechner@baylibre.com>, =?gb2312?B?TnVubyBTqKI=?=
	<nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
Subject: =?gb2312?B?u9i4sjogW1BBVENIIHYzIDAvM10gaWlvOiBhZGM6IGFzcGVlZDogRml4IFND?=
 =?gb2312?Q?U_lookup_for_multi-SCU_AST2700?=
Thread-Topic: [PATCH v3 0/3] iio: adc: aspeed: Fix SCU lookup for multi-SCU
 AST2700
Thread-Index: AQHdVLN9L0iLKjGYH0OTMHdtQavkurcD/mUAgANVQ/Y=
Date: Wed, 21 Oct 2026 01:51:53 +0000
Message-ID: <OSQPR06MB7252FB0EB1DCD1069E11CEF18B662@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20261005-ast27xx-adc-upstream-v3-0-ef25552d3a59@aspeedtech.com>
 <20261018235624.1971e7ff@jic23-hlaptop>
In-Reply-To: <20261018235624.1971e7ff@jic23-hlaptop>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|KUXPR06MB8752:EE_
x-ms-office365-filtering-correlation-id: e4c46103-0a8f-4b75-dcf5-08df2f15e1a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|23010399003|38070700021|4143699003|5023799004|56012099006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: qHmLIvKIRBGn0h3+A6WtxVuo1PU4b8vzHZkoWMa/faS5mv2v9hY5vVKnc6sNsPY7xND50sJn0cY1GPttt0OnJc33ZMmBd7uE9bi5XPzj1NIfRIxkxbU45FlGE2upSjc6LucY2/bG9X/s6r/mrY5XpG3xI9fVsH5rzRD4FlVYiCrHn0KqSSsW9Vd2Ip14m4FqKYxMi4kihjknCMgREXZX7P31wTGK2EC0J2XLkNq61WmEjiLlYQTlvSnzAmR6DO7wwjNJ2GDVQW1BuuziLGAkTlFZ7HnkWXY8EFcF9RsGu/ou2S5455KlxOpiqZ+AZMvDUMNtlP31DoLhU0jHEPXF+21NA/4te0WpP/uk3io3zTa2EnNB0ovYgCOWYOh28YjeBr4tbUsfELiTRoa7CpQzKUwH3EGWCSz0o4w1c87wS5bMWTELfk9BeFAJRKUklCqSAckrZpX1r9avoLskSjF+VtLzmpWu8b1y23n98JDreizWXaSNVg4Llq/Rr+snpMXRrtE+CZtCySxRTe2YIUIWY4MaavaWU1Copcriu5SvECXMJTU/kgpE2J5MaO5bkC0nGB75+vj1aGlR0icGXKC/URTCl0HrlPEGC2ojD8IZVB0s/cTGmim9YuXEpSxSg7bSDD4QfRXPX3FbU2UwhvI+GS+E9vsrSLYGfY1OuQp1eFj/HZAIYjJRp3DWBmPW1Or7tyQcBODdH9/FfriF+pcF7a6hijM9yhrWqZeHTvJ9Rxw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(23010399003)(38070700021)(4143699003)(5023799004)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?OEYyV0FEUEZjR0RuWnJyNTJSQ2kzNkI1YndKcCtLQlY4ZEZ3TUpLRGwzdFg2?=
 =?gb2312?B?Unpra3dzU1MvVU0ramZsa2EzQlN4WUE4bGY4UTA2ODVnckJzRHJhdEVsZzNT?=
 =?gb2312?B?UXFWdjNpLzhUV0o5eVYxTVg3VXpOd0FqSkVhcVlRaExZQ011c1F5Z2lKNVBk?=
 =?gb2312?B?dzIxT1d4b083OVRvd2xIdDVTaFFTaUdUb1RyTzlDckRKZjZXajNjWmVkVGh2?=
 =?gb2312?B?VDlpV203czZqaWQyNXdIY284cTFad2ltcjRwTlkxemx4T0NxcXRQbzYvUGM1?=
 =?gb2312?B?OElXWGM4cmFyZ0RuL3RreFhSSlpiMWVMOWQ2S1lEM1pNcUwzOHJMMWs3SUdJ?=
 =?gb2312?B?V1dFQ3JWcFZpbWVTTkgrUlIvK0lZYzJvWTBYa3dvRGtWRlJTMzl4SG00ZkNo?=
 =?gb2312?B?OC8wNVM5UlJoeUxwbThKZk4yVnJEbGR3YmI0OUo5Qi94LzdXQXRlY2hSODJi?=
 =?gb2312?B?dEs1NjNVMS9uY25Od0JSV1FxZXR5cEZZODBWS1RSQzF0OTNZWks4Z0EzY2lV?=
 =?gb2312?B?TGM3YVNVNnBYVzJtZlJTUHNjRWZFQUtRYXJRQ25WV3ZibmNMVXVpUUoyNTNI?=
 =?gb2312?B?SG9GT1RXN1NOK2JzTEdpTTF5MkxIRk9CYnV2VGhpQ3FzdW5JSHpqUmZTWVlJ?=
 =?gb2312?B?TlZuTEw2SjZrdmNGdXBFNDl4c29pU1Q0ZGk0eUVNckVhR0tkbXB2VmN3Slo0?=
 =?gb2312?B?anZkNktSVC95SmVpa2xrT0gydlRpUHI0VzNXU2FqNG1RQVlkT2thdUZoZ3dL?=
 =?gb2312?B?bUpJTFJsMFhKZERuNHVrdDJsNXJLNFhYZkFsTnY2cXJHbkhEeHhmckU4UTBC?=
 =?gb2312?B?TllIZ0pHdEpBR0thaG5iNEoxVW9BREtYTkdSckpHaDVKTnVFTGJtQUhIQ0NE?=
 =?gb2312?B?eWk0RWdNb0w3bm00TGdBd1h2L3ZQd1R1ejQ4bk8wbnVYbm5KRTl3NVQrSC9Y?=
 =?gb2312?B?WUtVeGc3MHRXYlZSRVZYZ2YxUjRBSDVXS3FaRXpjdkVlMkdNQTM2OUdGbmlS?=
 =?gb2312?B?dE1hTzl2WjVzSHhyY1NzYnpuak9CNDh3cGd5dmdhKzN3Sy85VDZMRnZma0lv?=
 =?gb2312?B?dGxvY1J3ajI1OG1VNFdGTVFrOFE0QzF2QjBaTnEvV2w5Y2hERXI0OW82dXdu?=
 =?gb2312?B?TW1NUHV5dmpuN1dvUDlOUDdDY2orUm51UGVxZ3l0T3M5ZVlKckZZd2F3NUZt?=
 =?gb2312?B?L2JPbUorN2R4TkZHaFdFeUFwZGF1VHRVem83NTEyKzVUd29zRnJSVjVLVnA0?=
 =?gb2312?B?RmNBdDcyaTUyRytEeTdka2tudGMwUzFwVnZpeU04a1pRVkJheVBvMTNRNklI?=
 =?gb2312?B?MU81K0QzNDNGNFgvMHVlY3Q5MEhxV1NkRnd3SGUrcjFWRGhCdTc2TzdQZk8y?=
 =?gb2312?B?Zyt1Z3hla3lqdXVsZWM1dkUrbUgrT0hWV3pPRmFMTDg3TXZXZ0NBaGtqVTZo?=
 =?gb2312?B?bk5FL1hGQnMzTmNRdUltUVNxQVUrSjhpMGVYamdtcUYzWmVpQ1MzTUVqRDYw?=
 =?gb2312?B?R0UyblVzaEhJNC94eTBsVlVvZHl2T25PemNaQWRCY1FkUlZCTjFRbzJXQllG?=
 =?gb2312?B?L1NqaWlqQlFTVTFkRFRmak9TN1FzQ2cvNktQeVl5bVZwaGoxM2JmWEZ3c0gy?=
 =?gb2312?B?ZjR5cWp3U0M4blJyckNvV29jN1hmUGkreE1WTWlnRlVqMEcwVG45VGhQSWtD?=
 =?gb2312?B?L3R1VkJYWVJxTGxOMkc5aDlIdnRQOWNZMTVDM0JGTElRTjU4N0JiNXVad2dj?=
 =?gb2312?B?WkRDdEdTRmxQaUpJenFUem9EaE1LV1AzK2dvQ3BsZElFN1NheWhUbVZ4S0c2?=
 =?gb2312?B?b0JIdi9zZHhsZmZBbGZraDJyaUU2WmRqRCsxUVk2UVRSL2tmN3NPY2xjSDRk?=
 =?gb2312?B?TklrdVpHQTZ6RzhFb1lGbTF0MldoaTI3RVFNR1VMYVFKWndRVDA0OHh6RUVl?=
 =?gb2312?B?TGRCWVM2U29MdkFGS0hDT3V6TEYyOVA2ZUJqV0hYUXltdHUwZmtMUGhvdzl5?=
 =?gb2312?B?M2NUOERvNUdVK0ZZRUVPV0djem85aGUwaTBCcEgvbnNqdUMvbWtPNVV3cWhQ?=
 =?gb2312?B?OUpRMWwvN1NSTkl4eDVUZG5iSkFrbytHeUFyNlBxM0JXSk1ZQ0dTbHBFNm9U?=
 =?gb2312?B?blBsU25SL2R6VmlBVHZZeU9USzJWeU51MncxL3lPQ0x6ZTRlV3pqUGJuTjRs?=
 =?gb2312?B?SjV3SmxNZEpNMEE1UXRRSURzZ2xDaUs2NEFudy9iN1NrNFQwamxaRkhvOGdT?=
 =?gb2312?B?K1ZWYU1hRHNYSUl2clBLYVAxMzVZeGhkQWFkWU04NlA2ZlZ5ZmNCeEtmSWZ2?=
 =?gb2312?B?WXpXc2JMelZPVzJ4eE5NR1RMTUdDSTl1ejFIVzh3U3NOVjMrMlNRQT09?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c46103-0a8f-4b75-dcf5-08df2f15e1a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2026 01:51:53.6291
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0WrNUDP+3hxSTTlJxqB6LbhCYyNoFtcxtjEfDFGCo+bzQmr3c16mes1u1C8q0KjMuaRzs83M8rIV1k+JVy7l2NqWF9btFUfmk6fns1UDNPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB8752
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_185204_567499_492A2995 
X-CRM114-Status: GOOD (  18.46  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiA+IFRoZSBBREMncyByZWZlcmVuY2Utdm9sdGFnZSB0cmltbWluZyBkYXRhIGxpdmVzIGluIGEg
U0NVIHJlZ2lzdGVyLiBUaGUKPiA+IGRyaXZlciBoYXMgYWx3YXlzIGxvY2F0ZWQgdGhhdCBTQ1Ug
d2l0aCBhIGdsb2JhbCwgbmFtZS1iYXNlZAo+ID4gZGV2aWNlLXRyZWUgc2VhcmNoLCB3aGljaCB3
b3JrcyBhcyBsb25nIGFzIGEgcGxhdGZvcm0gb25seSBoYXMgYQo+ID4gc2luZ2xlIG5vZGUgbmFt
ZWQgInN5c2NvbiIuIEFTVDI3MDAgc3BsaXRzIGl0cyBTQ1UgaW50byB0d28KPiA+IGluc3RhbmNl
cywgc3lzY29uMCBhbmQgc3lzY29uMSwgdGhhdCBzaGFyZSB0aGF0IHNhbWUgbm9kZSBuYW1lIGFu
ZAo+ID4gZGlmZmVyIG9ubHkgYnkgbGFiZWwgYW5kIHVuaXQgYWRkcmVzcywgc28gdGhlIGxvb2t1
cCBhbHdheXMgcmVzb2x2ZXMKPiA+IHRvIHN5c2NvbjAgZXZlbiB3aGVuIHRoZSBBREMncyB0cmlt
bWluZyBkYXRhIGxpdmVzIGluIHN5c2NvbjEuCgo+IEZvciBub3cgSSd2ZSBhcHBsaWVkIDEgYW5k
IDIgdG8gdGhlIHRlc3RpbmcgYnJhbmNoIG9mIGlpby5naXQuCj4gV2hpbHN0IGl0IGlzIGEgZml4
LCB0aGVyZSBpcyBsaXR0bGUgcG9pbnQgaW4gcnVzaGluZyBpdCB1bmxlc3MKPiBwYXRjaCAzIGFs
c28gZ29lcyBhbmQgdGhhdCBvbmUgaXNuJ3QgdGFnZ2VkIGFzIGEgZml4Li4KCj4gSWYgeW91IHdh
bnQgbWUgdG8gbW92ZSBpdCBvdmVyIHRvIHRoZSBmaXhlcy10b2dyZWcgYnJhbmNoIGFuZAo+IGdl
dCBpdCBpbiBhc2FwLCB0aGVuIHJlcGx5IHRvIHRoaXMgdG8gc2F5IHNvLgoKUGF0Y2hlcyAxIGFu
ZCAyIG9ubHkgYWRkIHRoZSBtZWNoYW5pc207IHRoZXkgZG9uJ3QgY2hhbmdlIGJlaGF2aW91ciBv
bgpBU1QyNzAwIGJ5IHRoZW1zZWx2ZXMuIFRoZSBkcml2ZXIgZmFsbHMgYmFjayB0byB0aGUgb2xk
IGdsb2JhbApieS1uYW1lIHN5c2NvbiBsb29rdXAgd2hlbmV2ZXIgdGhlIG5ldyAiYXNwZWVkLHRy
aW0tc3lzY29uIiBwcm9wZXJ0eQppcyBhYnNlbnQsIGFuZCBwYXRjaCAzIGlzIHdoYXQgYWN0dWFs
bHkgc2V0cyB0aGF0IHByb3BlcnR5IG9uCkFTVDI3MDAncyBkdHMuIFdpdGhvdXQgcGF0Y2ggMywg
MSBhbmQgMiBsYW5kIGJ1dCBBU1QyNzAwIGtlZXBzIHJlYWRpbmcKdGhlIHdyb25nIFNDVSBleGFj
dGx5IGFzIGJlZm9yZS4KClNvIHllcywgcGxlYXNlIG1vdmUgMSBhbmQgMiB0byBmaXhlcy10b2dy
ZWcsIGFuZCBJJ2QgbGlrZSBwYXRjaCAzIHRvCmdvIHdpdGggdGhlbS4gSSdsbCByZXNlbmQgaXQg
b24gaXRzIG93biB3aXRoIGEgRml4ZXMgdGFnIHBvaW50aW5nIGF0CnRoZSBjb21taXQgdGhhdCBh
ZGRlZCB0aGVzZSBBREMgbm9kZXMsIHNpbmNlIGl0J3MgdGhlIHBpZWNlIHRoYXQKbWFrZXMgdGhl
IGZpeCBhY3R1YWxseSB0YWtlIGVmZmVjdCBvbiBoYXJkd2FyZS4KClRoYW5rcwpCaWxseSBUc2Fp

