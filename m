Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E9BCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 15:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VmqgzTZXEL2abXYE2ZwSbXtEHIgDV5rMnt4AXizdjxQ=; b=LHVZqR6sHRosJ1GNUSgskdFcVq
	RJkwdpY7TxMAWvyWtAe6HjEGMwp3N+s4wN5sRrKDxxjxY1IV2xWHz19qbp2TBbTd8vOtcDkX0qJg1
	qfgCYbdei3EcANc3TbBN0Tz4BDJPMY3kMxdsia8GsLhUxDshLsYp/EyfZ1KG/6RZqA1WNat+/8i8D
	aIdw20ltrvYZtkoir6RImd39OO8OSav0NBG+Lk3EtLtWuxDuOdJajxRuIpw/ScWO7LDV88cq43owC
	YpWpgtH7GWGM5WugKtPhsnIvThpV0k+s6jJColL5l5OCZxjHcrOcb5WKyrygjLMaLsQPCnTdswnGp
	DxFQU6Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCr3-00000000qUG-2Uxm;
	Mon, 28 Sep 2026 15:01:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCr2-00000000qU5-2tEk;
	Mon, 28 Sep 2026 15:01:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VmqgzTZXEL2abXYE2ZwSbXtEHIgDV5rMnt4AXizdjxQ=; b=nLyjVc2RZ+LqmMoUSRQWwtSXKd
	1On90EArucngnpfepdtRuXFVwpAXsmmyQUFOWgLv6DiDK6TuQu0mGRTh5isACD2xGwOq8ojz5qWP2
	LW0A2dR40QE3cUxLaNPT6rfVS3GE3qY6SQYs6o1+GORjWvBJjK0OPKQVp3QARCJpG9YkkJBxKVvVZ
	+90PMF5Ux3MNOMfd7KDm612wO0J86fO+bo+8c4+YGV6rs9418cGXwsBHQikm6j0OnOA7pejnPsaU2
	/Nq6/fDBJNnmCQrRhUol0Oq7oVvq/g56joLiDR4qpgWfYW7VkHFa38NJAwrXoisMkCh+2JGHGYdKi
	jGEZHr1A==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBCqy-00000001bFn-3qDJ;
	Mon, 28 Sep 2026 15:01:19 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68SF0TgwC500472, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1790607629; bh=VmqgzTZXEL2abXYE2ZwSbXtEHIgDV5rMnt4AXizdjxQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=a6o5sbIH2x2yw8YBJmbd7YZJvkpsImIgnemZspapUG3IzJbVciACNPU6eKQ/nwZ0X
	 5eeMet+zkKkl4UkmjjA1auOWgq74LROKKRvaw2guX9+JmflmqMFOZC50VkH9NZ+Pnf
	 ob7GHs1zBKH/Q9nWCz8NnkUXaQxspEO5ICoyhc+skWfgftgu5jro2ZMv/a8syBQ/o8
	 8pztzpQjZH4vhOwREPuurcRDT7Mo1uHlI6rYaErtPg9dSq3O9ZWw33hfJESfDyJolN
	 IiKjg7JM4XLfy2s+3yI1Z3j7+tyabA/jDblLG1CJBNTMJ+kMhicyWm+XVJ6mXXwGpW
	 JZ7+unULky3zA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68SF0TgwC500472
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Sep 2026 23:00:29 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 28 Sep 2026 23:00:29 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::b3cc:c263:b82d:e87c%10]) with mapi id
 15.02.2562.049; Mon, 28 Sep 2026 23:00:29 +0800
From: =?big5?B?WXUtQ2h1biBMaW4gW6pMr6enZ10=?= <eleanor.lin@realtek.com>
To: Pengpeng Hou <hppiscas@163.com>, =?big5?B?SmFtZXMgVGFpIFvAuafTrnBd?=
	<james.tai@realtek.com>
CC: "afaerber@suse.com" <afaerber@suse.com>, "linusw@kernel.org"
	<linusw@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?big5?B?VFlfQ2hhbmdbsWmkbLZoXQ==?=
	<tychang@realtek.com>
Subject: RE: [PATCH v2] pinctrl: realtek: rtd1619b: publish the OF module
 alias
Thread-Topic: [PATCH v2] pinctrl: realtek: rtd1619b: publish the OF module
 alias
Thread-Index: AQHdSLEcJX+4NvxkzUaHWGar/UKH9rbkIpVw
Date: Mon, 28 Sep 2026 15:00:29 +0000
Message-ID: <f25e75dabbf64d3a9078ea584aee7986@realtek.com>
References: <20260920033520.12924-1-hppiscas@163.com>
In-Reply-To: <20260920033520.12924-1-hppiscas@163.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.16.3.62]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_160117_495535_0CBEA4B2 
X-CRM114-Status: GOOD (  19.36  )
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

PiBQSU5DVFJMX1JURDE2MTlCIGlzIHRyaXN0YXRlLCBhbmQgdGhlIGRyaXZlciB1c2VzIHRoZSBy
ZWFsdGVrLHJ0ZDE2MTliLXBpbmN0cmwNCj4gY29tcGF0aWJsZSB0byBtYXRjaCBpdHMgZGV2aWNl
cy4gSG93ZXZlciwgdGhlIE9GIHRhYmxlIGlzIG5vdCBleHBvcnRlZCwgc28gYQ0KPiBtb2R1bGFy
IGJ1aWxkIGRvZXMgbm90IGFkdmVydGlzZSB0aGlzIGFsaWFzIGZvciBhdXRvbWF0aWMgbW9kdWxl
IGxvYWRpbmcuDQo+IA0KPiBBZGQgdGhlIE9GIGV4cG9ydCB3aXRob3V0IGNoYW5naW5nIHByb2Jl
IG9yIHJlZ2lzdHJhdGlvbiBvcmRlcmluZy4NCj4gDQo+IFRoZSBpc3N1ZSB3YXMgZm91bmQgYnkg
b3VyIHN0YXRpYy1hbmFseXNpcyB0b29sLg0KPiANCj4gRml4ZXM6IGM3OTEwZjZhY2E1NiAoInBp
bmN0cmw6IHJlYWx0ZWs6IEFkZCBwaW5jdHJsIGRyaXZlciBmb3IgUlREMTYxOUIiKQ0KPiBBc3Np
c3RlZC1ieTogZ3B0IDUNCj4gU2lnbmVkLW9mZi1ieTogUGVuZ3BlbmcgSG91IDxocHBpc2Nhc0Ax
NjMuY29tPg0KDQpBY2tlZC1ieTogWXUtQ2h1biBMaW4gPGVsZWFub3IubGluQHJlYWx0ZWsuY29t
Pg0KDQo+IC0tLQ0KPiBDaGFuZ2VzIHNpbmNlIHYxOg0KPiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvMjAyNjA5MDUxMzQ0MTguNjc2MTktMS1ocHBpc2Nhc0AxNjMuY29tLw0KPiBVc2UgdGhl
IGZ1bGwgYXV0aG9yIG5hbWUgYW5kIHJlZ2VuZXJhdGUgdGhlIHBsYWluLXRleHQgaW5saW5lIGRp
ZmYgd2l0aG91dA0KPiBlbWJlZGRlZCBjYXJyaWFnZSByZXR1cm5zLg0KPiANCj4gIGRyaXZlcnMv
cGluY3RybC9yZWFsdGVrL3BpbmN0cmwtcnRkMTYxOWIuYyB8ICAgIDEgKw0KPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJs
L3JlYWx0ZWsvcGluY3RybC1ydGQxNjE5Yi5jDQo+IGIvZHJpdmVycy9waW5jdHJsL3JlYWx0ZWsv
cGluY3RybC1ydGQxNjE5Yi5jDQo+IGluZGV4IGIwN2U1MGQ2MzU2ZC4uZTAzZTFmYjA5ODk5IDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvcmVhbHRlay9waW5jdHJsLXJ0ZDE2MTliLmMN
Cj4gKysrIGIvZHJpdmVycy9waW5jdHJsL3JlYWx0ZWsvcGluY3RybC1ydGQxNjE5Yi5jDQo+IEBA
IC0xNTc1LDYgKzE1NzUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZA0KPiBy
dGQxNjE5Yl9waW5jdHJsX29mX21hdGNoW10gPSB7DQo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9
ICJyZWFsdGVrLHJ0ZDE2MTliLXBpbmN0cmwiLCB9LA0KPiAgICAgICAgIHt9LA0KPiAgfTsNCj4g
K01PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIHJ0ZDE2MTliX3BpbmN0cmxfb2ZfbWF0Y2gpOw0KPiAN
Cj4gIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHJ0ZDE2MTliX3BpbmN0cmxfZHJpdmVy
ID0gew0KPiAgICAgICAgIC5kcml2ZXIgPSB7DQo+IA0KPiBiYXNlLWNvbW1pdDogNTE4ZTViNzk0
YzA2YzBmMGViNDBkZjNlMjAyMjc0YTY2MjAyYzEzNw0KPiAtLQ0KPiAyLjUwLjEgKEFwcGxlIEdp
dC0xNTUpDQoNCg==

