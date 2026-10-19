Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09F4CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 11:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QA1eOrPJrYNKlxWlaIRYtRL2w5ep69GInvvuM85VaoU=; b=oRE5z82Il6bX1Zgop2uX98FmUj
	c+AZg3LR0qWxhS3bWsdZeZIUvJErPNqsP2dzCbdf237Ggmu7jQ76SFNGTseKuGtdRuN9uOloHNZn/
	NEP9k4GZ9EGn6pa4MitUXikhoJOM0tlKqXgbfVaSZCLC+vWGq6xUlJUaDN8C3N68WhwIXJkUo0u7e
	GVgcvazLJrRf/sssY2U5C6GhHtZuf2kC6bjwZhABMVFcJNygMD+qINPq5Wzk9PnlgaAptRCpTdZje
	xvbDxaThgm/CZw0XiqYaNNPJSaL9bN0eNtE6PPcsQ8RBdnaZyXMpfT+jQ9bDAyEW5VsJD26ch8AEe
	HtRzV+VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlPZ-00000007HcY-30Sd;
	Mon, 19 Oct 2026 11:20:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlPX-00000007Hc7-3ywd;
	Mon, 19 Oct 2026 11:20:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QA1eOrPJrYNKlxWlaIRYtRL2w5ep69GInvvuM85VaoU=; b=Z7tKsVKqJlno/9UQgAiEpO+FHm
	1P6yYSRrON63b++4R6X0MC2DkGaOg6K8o7kVNLhtWkimJ48fe5D0JHxXii4jzHa2CCOYMEA6OGwdl
	F9mL6oNKevGxWf0KHEwylFko1ebfZH6ch1+pY1ecnxbGny+2zaeC+xvdy0myCXBVTFX4CFayjCfai
	2iJN8NMChFXfZFcju3Iefg+LW62PlGrp8o7UiTtqwcmoUgeKwIKRw8RQ4dMutqGpKZ8p0waJGCd7M
	k1cDXnWC63AdLHmdwYTz7fHDVfZXeA6G6FtXtMh4m22jOmc9f6OI21eucDT1UhiO2T+bck68PJLMK
	WQ2OWQpQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xIlPT-00000003ZFt-3ZKl;
	Mon, 19 Oct 2026 11:20:10 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69JBJIrdC1843777, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1792408758; bh=QA1eOrPJrYNKlxWlaIRYtRL2w5ep69GInvvuM85VaoU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=G7/dfBEEogSn5trDkoOtJmwNN5o9QZHOYwrYPKKpKyGua4LreGDym9O3fL3b974LB
	 i3T5UnL2PyeMupjYK2hohgb+KktC1IKbUCn0zEb49IAIRwz+E3zRfXfdnuG2cBKWE+
	 o4LZxhjsPbPdYWVbYX/dgAfC09W0udypNeFESx8cQSMnkMUy3Cor2A06pXrvbN6gfL
	 oRUPRIqpHgv8gUeb1WEzgowX0BWnMShpBPUOu5j334bnD1CwdyLq+fRoGoAFL7gG5S
	 Pntc6cSoDfu0uk5eWfM9CR2hQtWM0ISnJVd8m9OdY11sIzIbKFQvwsFBUf3TOcqTQR
	 1XqdwlsWCCkaQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69JBJIrdC1843777
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Oct 2026 19:19:18 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 19:19:18 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 19:19:17 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::b3cc:c263:b82d:e87c%10]) with mapi id
 15.02.2562.049; Mon, 19 Oct 2026 19:19:17 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "tglx@kernel.org" <tglx@kernel.org>, "radu@rendec.net" <radu@rendec.net>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"lee@kernel.org" <lee@kernel.org>, "afaerber@suse.com" <afaerber@suse.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"mfd@lists.linux.dev" <mfd@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
	=?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
	=?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>
Subject: RE: [PATCH v5 3/8] dt-bindings: mfd: realtek,rtd1xxx: Add interrupt
 controller child node
Thread-Topic: [PATCH v5 3/8] dt-bindings: mfd: realtek,rtd1xxx: Add interrupt
 controller child node
Thread-Index: AQHdXxqxrooHtuvy+0+IPKYEf41fuLcED+AAgACnvNA=
Date: Mon, 19 Oct 2026 11:19:17 +0000
Message-ID: <b12ff328ebca405f96a9b25decdb7c81@realtek.com>
References: <20261018160653.3940371-1-eleanor.lin@realtek.com>
 <20261018160653.3940371-4-eleanor.lin@realtek.com>
 <20261019-prophetic-moth-of-youth-40dbd6@quoll>
In-Reply-To: <20261019-prophetic-moth-of-youth-40dbd6@quoll>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_122008_888282_A9898D81 
X-CRM114-Status: GOOD (  24.03  )
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

SGkgS3J6eXN6dG9mLA0KDQo+IE9uIE1vbiwgT2N0IDE5LCAyMDI2IGF0IDEyOjA2OjQ4QU0gKzA4
MDAsIFl1LUNodW4gTGluIHdyb3RlOg0KPiA+IEFsbG93IGFuIGludGVycnVwdCBjb250cm9sbGVy
IGFzIGEgY2hpbGQgbm9kZSBieSByZWZlcmVuY2luZyB0aGUNCj4gPiBydGQxMzE5LWludGMtaXNv
IHNjaGVtYSwgdXBkYXRlIGFkZGl0aW9uYWxQcm9wZXJ0aWVzIHRvDQo+ID4gdW5ldmFsdWF0ZWRQ
cm9wZXJ0aWVzLCBhbmQgYXBwZW5kIGEgdXNhZ2UgZXhhbXBsZS4NCj4gDQo+IEkgZG8gbm90IHNl
ZSB0aGF0ICJ1cGRhdGUiLg0KPiANCg0KU29ycnkgYWJvdXQgdGhpcy4gSSB1cGRhdGVkIHRoZSBk
aWZmIGJ1dCBtaXNzZWQgdXBkYXRpbmcgdGhlIGNvbW1pdA0KbWVzc2FnZS4gV2lsbCBmaXguDQoN
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFl1LUNodW4gTGluIDxlbGVhbm9yLmxpbkByZWFsdGVr
LmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdzL21mZC9yZWFsdGVrLHJ0ZDF4eHgueWFt
bCAgICAgICAgIHwgMjgNCj4gKysrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMjggaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9yZWFsdGVrLHJ0ZDF4eHgueWFtbA0KPiA+IGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9yZWFsdGVrLHJ0ZDF4eHgueWFt
bA0KPiA+IGluZGV4IDcxN2UyOWMzN2IzNi4uYjIxZTE0ZGYyODc5IDEwMDY0NA0KPiA+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvcmVhbHRlayxydGQxeHh4Lnlh
bWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3JlYWx0
ZWsscnRkMXh4eC55YW1sDQo+ID4gQEAgLTY1LDYgKzY1LDEwIEBAIHByb3BlcnRpZXM6DQo+ID4g
ICAgICBjb25zdDogMQ0KPiA+DQo+ID4gIHBhdHRlcm5Qcm9wZXJ0aWVzOg0KPiA+ICsgICJeaW50
ZXJydXB0LWNvbnRyb2xsZXIiOg0KPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvaW50ZXJydXB0LWNv
bnRyb2xsZXIvcmVhbHRlayxydGQxMzE5LWludGMtaXNvLnlhbWwNCj4gPiArICAgIHVuZXZhbHVh
dGVkUHJvcGVydGllczogZmFsc2UNCj4gPiArDQo+ID4gICAgJ0BbMC05YS1mXSskJzoNCj4gPiAg
ICAgIHR5cGU6IG9iamVjdA0KPiANCj4gV2hhdCBpcyB0aGlzIGZvciB0aGVuPyBTaG91bGQgaXQg
YmUgcmVtb3ZlZD8NCj4gDQoNClRoZSBvcmlnaW5hbCBzeXNjb24gY29tcGF0aWJsZSBoYXMgb3Ro
ZXIgY2hpbGQgbm9kZXMgdGhhdCBkbyBoYXZlICdyZWcnDQpwcm9wZXJ0aWVzIGFuZCB1bml0IGFk
ZHJlc3Nlcywgc28gdGhpcyBwYXR0ZXJuIGlzIHN0aWxsIG5lZWRlZCBmb3IgdGhlbS4NCg0KPiA+
DQo+ID4gQEAgLTc2LDMgKzgwLDI3IEBAIHJlcXVpcmVkOg0KPiA+ICAgIC0gcmVnDQo+ID4NCj4g
PiAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICtleGFtcGxlczoNCj4g
PiArICAtIHwNCj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJv
bGxlci9hcm0tZ2ljLmg+DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0
LWNvbnRyb2xsZXIvaXJxLmg+DQo+ID4gKw0KPiA+ICsgICAgc3lzY29uQDcwMDAgew0KPiA+ICsg
ICAgICAgIGNvbXBhdGlibGUgPSAicmVhbHRlayxydGQxNjI1LWlzbyIsICJzeXNjb24iLCAic2lt
cGxlLW1mZCI7DQo+ID4gKyAgICAgICAgcmVnID0gPDB4NzAwMCAweDEwMDA+Ow0KPiA+ICsgICAg
ICAgIHJhbmdlcyA9IDwweDAgMHg3MDAwIDB4MTAwMD47DQo+ID4gKyAgICAgICAgI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47DQo+ID4gKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MT47DQo+IA0KPiBXaHkg
ZG8geW91IGhhdmUgY2VsbHMgaXQgeW91ciBjaGlsZCBoYXMgbm8gYWRkcmVzc2luZz8NCj4NCj4g
PiArDQo+ID4gKyAgICAgICAgaW50ZXJydXB0LWNvbnRyb2xsZXIgew0KPiANCj4gU28gdGhlIGJp
bmRpbmcgcmVxdWlyZXMgY2hpbGRyZW4gd2l0aCB1bml0IGFkZHJlc3MsIHllcz8NCj4gDQoNClRo
ZSBpbnRlcnJ1cHQtY29udHJvbGxlciBkb2VzIG5vdCBuZWVkIGEgdW5pdCBhZGRyZXNzIGJlY2F1
c2UgaXQgYWNjZXNzZXMNCnRoZSByZWdpc3RlcnMgdmlhIHRoZSBwYXJlbnQncyByZWdtYXAuDQoN
CldpbGwgdXBkYXRlIHRoZSBleGFtcGxlIHRvIHJlbW92ZSB0aGUgdW5uZWNlc3NhcnkgcHJvcGVy
dGllcyBmcm9tIHRoZQ0KcGFyZW50IGFzIGZvbGxvd3M6DQoNCnN5c2NvbkA3MDAwIHsNCiAgICBj
b21wYXRpYmxlID0gInJlYWx0ZWsscnRkMTYyNS1pc28iLCAic3lzY29uIiwgInNpbXBsZS1tZmQi
Ow0KICAgIHJlZyA9IDwweDcwMDAgMHgxMDAwPjsNCg0KICAgIGludGVycnVwdC1jb250cm9sbGVy
IHsNCiAgICAgICAgY29tcGF0aWJsZSA9ICJyZWFsdGVrLHJ0ZDE2MjUtaW50Yy1pc28iOw0KICAg
ICAgICBpbnRlcnJ1cHQtY29udHJvbGxlcjsNCiAgICAgICAgaW50ZXJydXB0LXBhcmVudCA9IDwm
Z2ljPjsNCiAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDQxIElSUV9UWVBFX0xFVkVMX0hJ
R0g+LA0KICAgICAgICAgICAgPEdJQ19TUEkgNTcgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQogICAg
ICAgICAgICA8R0lDX1NQSSAzOSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCiAgICAgICAgI2FkZHJl
c3MtY2VsbHMgPSA8MD47DQogICAgICAgICNpbnRlcnJ1cHQtY2VsbHMgPSA8MT47DQogICAgfTsN
Cn07DQoNCkJlc3QgcmVnYXJkcywNCll1LUNodW4NCg0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlz
enRvZg0K

