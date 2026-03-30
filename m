Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CF8FF4934
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 03:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLQNRD4cQ46/Nf4UJ1f3dsQ04JuLOBmHiU6tZ6GrvCE=; b=iQcx0gDIBe1CduUP85sN7lnJVB
	+mhvKyl4LJYkygXM90VGOTPhMd5fuWU9apphbbNt7fv/HhPFllBYZW7HXKLEJ1e6BmpTWe8BxeU+y
	TuN3XKuTKMIs7kAFEYD9i2zMv/QzUuXcV+5YwD+PBd6SDo3tV69oEuOEcHPA81WY4UlzqFYcOdBjb
	FLWpQ5qmN1JBSO+OMpXPSOJ7YJSTk/Hfw0ADVxjP4izJC325lK/KHDReXwFiz4jDy+damZ3DgRP1e
	jzHjLmO21CHHc3gy0V2hPMO8EGq5gkxIalUD3HjKdXtZudx6CQ6cMCofqZWIMedqbrpATplOcKNcU
	l2TkmSgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w72ta-0000000AXAE-0iVd;
	Mon, 30 Mar 2026 03:02:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w72tY-0000000AX9z-3Zbn;
	Mon, 30 Mar 2026 03:02:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WLQNRD4cQ46/Nf4UJ1f3dsQ04JuLOBmHiU6tZ6GrvCE=; b=YE160exlf1sfDOSCQu4FhMnG2+
	t0rqC37ecZkvnqpF3b6TSRvp315tTbKI2LA2LRDv8d2Lx9USIbxiLIKSEtYUwu9gfcoojWlDAQFKp
	F4lCNtjdTryaCo9cBv4NTEHncuzvwSmtwcxx8+STP+NkuD9MwQvdHkA6etXgU9Uxox8BJoL9e/KPT
	IgU9sRct8z/btxNUr9nNmkY8L97U+GjoKcBcFjKUA+dRyfxT/nRigjHgGtfefVNrKmBD8wXxhXVWt
	CHu4fXOv7NY4PE1+Nkv6u+8Cj+dibw+cX5+e8r8a2Ou3kKyVNy1B5cn8GFXvhlZHDDwrTC5od3lZ3
	lhlK2Dsw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w72tV-0000000D0GN-1x6j;
	Mon, 30 Mar 2026 03:02:27 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62U32GsqC204435, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1774839736; bh=WLQNRD4cQ46/Nf4UJ1f3dsQ04JuLOBmHiU6tZ6GrvCE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=kE8QdR1pj8kBoxyrbUmtnlwlqm/GwYwkZp9olfXVx66//0bqjWTtnP+1wX9n1QMYF
	 F2vcC9NDxhtvaKVInlXbXXbW6qmLAiZ2Ap89bsaKmir+sXueFaMmLQKqz24Tjh2ZLO
	 wKfWhzLsjAxKvHZSt52ZJn9gCNA0FFfevwJjdYVDA1UkNhJB2r7OZI5+ca0UnINbIx
	 w9c0CnEgU+vpEIxeGRxg/vodlshwR28Lt4+5+/TYaglcL7RfmXdfj3a/y3s33KYZLB
	 j9x9rANtaLewxsiB46x+5tZYkUauPCoPN5hwUoLqFjzVgTH3a9VhPHN43y/a+QKZKX
	 kqTe1I5SnMoyQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 62U32GsqC204435
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Mar 2026 11:02:16 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 30 Mar 2026 11:02:08 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 30 Mar 2026 11:01:01 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::46e9:fab9:b2cf:c99b%10]) with mapi id
 15.02.1748.010; Mon, 30 Mar 2026 11:00:59 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Stephen Boyd <sboyd@kernel.org>, "afaerber@suse.com" <afaerber@suse.com>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        =?utf-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
        =?utf-8?B?SnlhbiBDaG91IFvlkajoirflrold?= <jyanchou@realtek.com>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "mturquette@baylibre.com"
	<mturquette@baylibre.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "robh@kernel.org" <robh@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
        =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
        =?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
        =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>
Subject: RE: [PATCH v5 08/10] clk: realtek: Add support for MMC-tuned PLL
 clocks
Thread-Topic: [PATCH v5 08/10] clk: realtek: Add support for MMC-tuned PLL
 clocks
Thread-Index: AQHcuzlow7Y+xay5/E+Ex+WmCwwUabW9+A0AgAh0PAA=
Date: Mon, 30 Mar 2026 03:00:54 +0000
Message-ID: <85ccff0f13504501a9b4efda4661ee1b@realtek.com>
References: <20260324025332.3416977-1-eleanor.lin@realtek.com>
 <20260324025332.3416977-9-eleanor.lin@realtek.com>
 <177440366488.5403.14385693004290004608@localhost.localdomain>
In-Reply-To: <177440366488.5403.14385693004290004608@localhost.localdomain>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_040226_115253_38A71DD0 
X-CRM114-Status: GOOD (  18.71  )
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

PiBRdW90aW5nIFl1LUNodW4gTGluICgyMDI2LTAzLTIzIDE5OjUzOjI5KQ0KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2Nsay9yZWFsdGVrL2Nsay1wbGwtbW1jLmMNCj4gPiBiL2RyaXZlcnMvY2xr
L3JlYWx0ZWsvY2xrLXBsbC1tbWMuYw0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5k
ZXggMDAwMDAwMDAwMDAwLi4wMTc2NjM3MzhjMWYNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysr
IGIvZHJpdmVycy9jbGsvcmVhbHRlay9jbGstcGxsLW1tYy5jDQo+ID4gQEAgLTAsMCArMSwzOTkg
QEANCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQ0KPiA+ICsv
Kg0KPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjEgUmVhbHRlayBTZW1pY29uZHVjdG9yIENvcnBv
cmF0aW9uDQo+ID4gKyAqIEF1dGhvcjogQ2hlbmctWXUgTGVlIDxjeWxlZTEyQHJlYWx0ZWsuY29t
PiAgKi8NCj4gPiArDQo+ID4gKyNpbmNsdWRlICJjbGstcGxsLmgiDQo+IA0KPiBJbmNsdWRlIHdo
YXQgeW91IHVzZSBpbiB0aGlzIEMgZmlsZSwgbm90IGp1c3QgdGhpcyBoZWFkZXIgZmlsZS4gVGhh
dCBtYWtlcyBpdA0KPiBzaW1wbGVyIHRvIHNlZSB3aGF0IGlzIHVzZWQgd2l0aG91dCBmb2xsb3dp
bmcgaW5jbHVkZSB0cmFpbHMuDQoNCkdvdCBpdC4gSSB3aWxsIGV4cGxpY2l0bHkgaW5jbHVkZSB0
aGUgcmVxdWlyZWQgaGVhZGVycyBkaXJlY3RseSBpbiB0aGlzIC5jIGZpbGUuDQoNCj4gPiArDQo+
ID4gKyNkZWZpbmUgUExMX0VNTUMxX09GRlNFVCAgICAgICAgICAgMHgwDQo+ID4gKyNkZWZpbmUg
UExMX0VNTUMyX09GRlNFVCAgICAgICAgICAgMHg0DQo+ID4gKyNkZWZpbmUgUExMX0VNTUMzX09G
RlNFVCAgICAgICAgICAgMHg4DQo+ID4gKyNkZWZpbmUgUExMX0VNTUM0X09GRlNFVCAgICAgICAg
ICAgMHhjDQo+ID4gKyNkZWZpbmUgUExMX1NTQ19ESUdfRU1NQzFfT0ZGU0VUICAgMHgwDQo+ID4g
KyNkZWZpbmUgUExMX1NTQ19ESUdfRU1NQzNfT0ZGU0VUICAgMHhjDQo+ID4gKyNkZWZpbmUgUExM
X1NTQ19ESUdfRU1NQzRfT0ZGU0VUICAgMHgxMA0KPiA+ICsNCj4gPiArI2RlZmluZSBQTExfTU1D
X1NTQ19ESVZfTl9WQUwgICAgICAweDFiDQo+ID4gKw0KPiA+ICsjZGVmaW5lIFBMTF9QSFJUMF9N
QVNLICAgICAgICAgICAgIEJJVCgxKQ0KPiA+ICsjZGVmaW5lIFBMTF9QSFNFTF9NQVNLICAgICAg
ICAgICAgIEdFTk1BU0soNCwgMCkNCj4gPiArI2RlZmluZSBQTExfU1NDUExMX1JTX01BU0sgICAg
ICAgICBHRU5NQVNLKDEyLCAxMCkNCj4gPiArI2RlZmluZSBQTExfU1NDUExMX0lDUF9NQVNLICAg
ICAgICBHRU5NQVNLKDksIDUpDQo+ID4gKyNkZWZpbmUgUExMX1NTQ19ESVZfRVhUX0ZfTUFTSyAg
ICAgR0VOTUFTSygyNSwgMTMpDQo+ID4gKyNkZWZpbmUgUExMX1BJX0lCU0VMSF9NQVNLICAgICAg
ICAgR0VOTUFTSygyOCwgMjcpDQo+ID4gKyNkZWZpbmUgUExMX1NTQ19ESVZfTl9NQVNLICAgICAg
ICAgR0VOTUFTSygyMywgMTYpDQo+ID4gKyNkZWZpbmUgUExMX05DT0RFX1NTQ19FTU1DX01BU0sg
ICAgR0VOTUFTSygyMCwgMTMpDQo+ID4gKyNkZWZpbmUgUExMX0ZDT0RFX1NTQ19FTU1DX01BU0sg
ICAgR0VOTUFTSygxMiwgMCkNCj4gPiArI2RlZmluZSBQTExfR1JBTl9FU1RfRU1fTUNfTUFTSyAg
ICBHRU5NQVNLKDIwLCAwKQ0KPiA+ICsjZGVmaW5lIFBMTF9FTl9TU0NfRU1NQ19NQVNLICAgICAg
IEJJVCgwKQ0KPiA+ICsjZGVmaW5lIFBMTF9GTEFHX0lOSVRBTF9FTU1DX01BU0sgIEJJVCgxKQ0K
PiBbLi4uXQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9yZWFsdGVrL2Nsay1wbGwuaA0K
PiA+IGIvZHJpdmVycy9jbGsvcmVhbHRlay9jbGstcGxsLmggaW5kZXggMmQyN2E0NGEyNzBjLi45
Y2YyMTk4NzEyMTgNCj4gPiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2Nsay9yZWFsdGVrL2Ns
ay1wbGwuaA0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3JlYWx0ZWsvY2xrLXBsbC5oDQo+ID4gQEAg
LTQ0LDQgKzQ0LDI1IEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IGNsa19wbGwgKnRvX2Nsa19wbGwo
c3RydWN0DQo+ID4gY2xrX2h3ICpodykgIGV4dGVybiBjb25zdCBzdHJ1Y3QgY2xrX29wcyBydGtf
Y2xrX3BsbF9vcHM7ICBleHRlcm4NCj4gPiBjb25zdCBzdHJ1Y3QgY2xrX29wcyBydGtfY2xrX3Bs
bF9yb19vcHM7DQo+ID4NCj4gPiArc3RydWN0IGNsa19wbGxfbW1jIHsNCj4gPiArICAgICAgIHN0
cnVjdCBjbGtfcmVnbWFwIGNsa3I7DQo+ID4gKyAgICAgICBpbnQgcGxsX29mczsNCj4gPiArICAg
ICAgIGludCBzc2NfZGlnX29mczsNCj4gDQo+IFRoZXNlIG9mZnNldHMgc2hvdWxkIGJlIHVuc2ln
bmVkPw0KPg0KDQpZZXMsIEkgd2lsbCBmaXggaXQuDQoNCj4gPiArICAgICAgIHN0cnVjdCBjbGtf
aHcgcGhhc2UwX2h3Ow0KPiA+ICsgICAgICAgc3RydWN0IGNsa19odyBwaGFzZTFfaHc7DQo+ID4g
KyAgICAgICB1MzIgc2V0X3JhdGVfdmFsXzUzXzk3X3NldF9pcGM6IDE7DQo+IA0KPiBib29sPyBE
b3VidCB3ZSBjYXJlIGFib3V0IHRoaXMgdW5sZXNzIHdlJ3JlIHBhY2tpbmcgc3RydWN0cyAod2hp
Y2ggd2UNCj4gc2hvdWxkbid0IGJlKS4NCj4gDQoNClRoaXMgbWVtYmVyIGlzIGFjdHVhbGx5IHJl
ZHVuZGFudCwgc28gSSB3aWxsIGp1c3QgcmVtb3ZlIGl0Lg0KDQo+ID4gK307DQo+ID4gKw0KPiA+
ICsjZGVmaW5lIF9fY2xrX3BsbF9tbWNfaHcoX3B0cikgIF9fY2xrX3JlZ21hcF9odygmKF9wdHIp
LT5jbGtyKQ0KPiA+ICsNCj4gPiArc3RhdGljIGlubGluZSBzdHJ1Y3QgY2xrX3BsbF9tbWMgKnRv
X2Nsa19wbGxfbW1jKHN0cnVjdCBjbGtfaHcgKmh3KSB7DQo+ID4gKyAgICAgICBzdHJ1Y3QgY2xr
X3JlZ21hcCAqY2xrciA9IHRvX2Nsa19yZWdtYXAoaHcpOw0KPiA+ICsNCj4gPiArICAgICAgIHJl
dHVybiBjb250YWluZXJfb2YoY2xrciwgc3RydWN0IGNsa19wbGxfbW1jLCBjbGtyKTsgfQ0KDQpC
ZXN0IHJlZ2FyZHMsDQpZdS1DaHVuDQo=

