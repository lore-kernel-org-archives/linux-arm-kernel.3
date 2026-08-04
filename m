Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CBEC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 02:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Glc6UAfiJxXWX4rTJSzOsAmV3soZFnJEPo2fZl86Gno=; b=fjZEkiIkIVrvaCicwsrHITYbAO
	OChM7bhiqOjMESwW0VSMTCi61q6KGkhVaWaygawhlJnvmD5wDkmHl7QEKf0KZlnFZUYyEAdHOcS3k
	+zFb7knoOA/8Xop+2q4o7wNG6OEplaavnpfjHjXOrTKERj4NLYz7e3M5suvepoq8ooiztz99g1DL7
	W78IaAfe+K1kOsHAnaxUAhoFHX4wN3BX0kFrUGo/+XtCPgXvf4zdnMqMOw8CNqnOGE087u+ExmK74
	zLU19kCCgU+DNfa/W32RdHz41lC913eOK6oNLNowgEZKMIY4oYBpvd/0INhzKuENHNAz80kP/o3iK
	/EwyBwNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5FA-00000000sMC-3Uy0;
	Tue, 04 Aug 2026 02:51:04 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5F9-00000000sLp-3zJQ;
	Tue, 04 Aug 2026 02:51:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Glc6UAfiJxXWX4rTJSzOsAmV3soZFnJEPo2fZl86Gno=; b=DMDykrrBahSTKsaV2KTgd40LDs
	1NYPz+nDjnMg51jTOGDFPhZAsSXHFOFLiD2ak88240GMOmR8XrcLzU4PtKHMZGPI5Mn2wHD96rjKC
	Ts5/IMVGzKNTxYIshG+I70AApWHjzU+los3UrHwe8vKAnhDfCzx/9O6nfIVgY4KLpaue5R76O91GZ
	02sPXoofAYeyBS9EyJx/pAyuTYH7OLQiHkUQkKVQQfXHp37kNukgLY7USH+bUIRJgmn+BI3BePge2
	ptWZunpiEbLYXtVzPTJZOL9+AtfRBrh67TGTs9HjpqTbypag9Bp1b+aijgkfCwOCXOWAfx2qzOmH4
	d1PfOJ4g==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wr5F5-00000009VVb-01kV;
	Tue, 04 Aug 2026 02:51:02 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6742o8dhD753734, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1785811808; bh=Glc6UAfiJxXWX4rTJSzOsAmV3soZFnJEPo2fZl86Gno=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Plg9a3TtLhXCfHcQCSCV4Y09eFPDP+DjvmRM8fYh3DyF8ooRXLO32RKf3WtKQVogQ
	 HlQq3VDzchtYo3Z5quJIg0kfdoUO+Q35OaSGqlv3KurwnE5C4WodJZF93n4s8Qyin0
	 RAxpCtdtGuB74mBnGuyfdb4+62ED+peb5tYTmOyVMziGaZLPoptJJdAAEVEHlOnMIY
	 oVFddF9ZXnm0AxsZpVzrk7lhxggKdh+SCDxbf5MJVuVILKik4gdY4D5A8cTRE9bThV
	 vZd8F+fAbmnNEd6M+0mkHEggQdFlzkmQhPk/9q6GfrOAlMJaoCrlVZzbCTRVXu3sUc
	 L6UNEPokuWB0w==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6742o8dhD753734
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Aug 2026 10:50:08 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 4 Aug 2026 10:50:08 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Tue, 4 Aug 2026 10:50:08 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Brian Masney <bmasney@redhat.com>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?utf-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
	=?utf-8?B?SnlhbiBDaG91IFvlkajoirflrold?= <jyanchou@realtek.com>,
	"afaerber@suse.com" <afaerber@suse.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
	=?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
	=?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>
Subject: RE: [PATCH v11 09/11] clk: realtek: Add RTD1625-CRT clock controller
 driver
Thread-Topic: [PATCH v11 09/11] clk: realtek: Add RTD1625-CRT clock controller
 driver
Thread-Index: AQHdHp1PRrydlNtj20y7WRFW4A3UiraFxLQAgAGIGQD//+r2AIAE5x2Q//+uAACAAWyoQA==
Date: Tue, 4 Aug 2026 02:50:08 +0000
Message-ID: <be6d1e827cba4a779757b81ce084c108@realtek.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-10-eleanor.lin@realtek.com>
 <amuBqi43ce9bYbir@redhat.com> <577a6882b25e457fa94fa199e66f3197@realtek.com>
 <amy47how40BJnHsn@redhat.com> <a216b77c125544c0871b40f31c021ef7@realtek.com>
 <anCRAqhQ93QAihsS@redhat.com>
In-Reply-To: <anCRAqhQ93QAihsS@redhat.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_035100_195829_59747D63 
X-CRM114-Status: GOOD (  27.24  )
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

PiBPbiBNb24sIEF1ZyAwMywgMjAyNiBhdCAwOTo1NjowMUFNICswMDAwLCBZdS1DaHVuIExpbiBb
5p6X56WQ5ZCbXSB3cm90ZToNCj4gPiA+IE9uIEZyaSwgSnVsIDMxLCAyMDI2IGF0IDA4OjE3OjQ0
QU0gKzAwMDAsIFl1LUNodW4gTGluIFvmnpfnpZDlkJtdIHdyb3RlOg0KPiA+ID4gPiA+IE9uIFR1
ZSwgSnVsIDI4LCAyMDI2IGF0IDEwOjI4OjA0UE0gKzA4MDAsIFl1LUNodW4gTGluIHdyb3RlOg0K
PiA+ID4gPiA+ID4gRnJvbTogQ2hlbmctWXUgTGVlIDxjeWxlZTEyQHJlYWx0ZWsuY29tPg0KPiA+
ID4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gKC4uLikNCj4gPiA+ID4NCj4gPiA+ID4gPiA+ICsg
ICAgIHsgLyogc2VudGluZWwgKi8gfQ0KPiA+ID4gPiA+ID4gK307DQo+ID4gPiA+ID4gPiArTU9E
VUxFX0RFVklDRV9UQUJMRShvZiwgcnRkMTYyNV9jcnRfbWF0Y2gpOw0KPiA+ID4gPiA+ID4gKw0K
PiA+ID4gPiA+ID4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHJ0ZDE2MjVfY3J0X2Ry
aXZlciA9IHsNCj4gPiA+ID4gPiA+ICsgICAgIC5wcm9iZSA9IHJ0ZDE2MjVfY3J0X3Byb2JlLA0K
PiA+ID4gPiA+ID4gKyAgICAgLmRyaXZlciA9IHsNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAg
Lm5hbWUgPSAicnRrLXJ0ZDE2MjUtY3J0LWNsayIsDQo+ID4gPiA+ID4gPiArICAgICAgICAgICAg
IC5vZl9tYXRjaF90YWJsZSA9IHJ0ZDE2MjVfY3J0X21hdGNoLA0KPiA+ID4gPiA+ID4gKyAgICAg
ICAgICAgICAuc3VwcHJlc3NfYmluZF9hdHRycyA9IHRydWUsDQo+ID4gPiA+ID4NCj4gPiA+ID4g
PiBUaGlzIGRyaXZlciBpcyBsaXN0ZWQgYXMgYSB0cmlzdGF0ZSBpbiB0aGUgS2NvbmZpZyBidXQg
dGhlbiB5b3UNCj4gPiA+ID4gPiBoYXZlIHRoaXMuIElzIHRoZSBpbnRlbnRpb24gb2YgdGhpcyBk
cml2ZXIgdG8gYmUgYnVpbHQgaW4gb25seT8NCj4gPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBJ
IHdpbGwgY2hhbmdlIHRoZSBLY29uZmlnIG9wdGlvbnMgZm9yIHRoaXMgZHJpdmVyLCBhcyB3ZWxs
IGFzIHRoZQ0KPiA+ID4gPiByZWxhdGVkIGNvbmZpZywgZnJvbSB0cmlzdGF0ZSB0byBib29sLg0K
PiA+ID4NCj4gPiA+IEtlZXAgaXQgYXMgYSB0cmlzdGF0ZSBpZiB5b3UgYXJlIGdvaW5nIHRvIHVz
ZSBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKCkuDQo+ID4gPiBZb3UgY2FuIGFsc28gZHJvcCBzdXBw
cmVzc19iaW5kX2F0dHJzIHVubGVzcyB5b3UgaGF2ZSBhIHNwZWNpZmljIG5lZWQgd2h5Lg0KPiA+
ID4NCj4gPiA+IEJyaWFuDQo+ID4NCj4gPiBZb3UgYXJlIHJpZ2h0LiBLZWVwaW5nIGl0IHRyaXN0
YXRlIGlzIGJlbmVmaWNpYWwsIGVzcGVjaWFsbHkgZm9yDQo+ID4gYWxpZ25pbmcgd2l0aCB0aGUg
QW5kcm9pZCBHS0kgZGVzaWduLg0KPiA+DQo+ID4gVG8gcHJvcGVybHkgc3VwcG9ydCBtb2R1bGUg
dW5sb2FkaW5nIGFuZCBkcml2ZXIgdW5iaW5kaW5nLCBJIHdpbGwgYWRkDQo+ID4gdGhlIC5yZW1v
dmUgY2FsbGJhY2sgYW5kIGRyb3Agc3VwcHJlc3NfYmluZF9hdHRycy4NCj4gDQo+IElmIHlvdSBh
cmUgYWJsZSB0byB1c2UgYWxsIGRldm1fKigpIEFQSXMsIHRoZW4geW91IHNob3VsZG4ndCBuZWVk
IGEgcmVtb3ZlDQo+IGNhbGxiYWNrLg0KPiANCg0KVGhlIHJlYXNvbiBJIHBsYW5uZWQgdG8gYWRk
IGEgLnJlbW92ZSBjYWxsYmFjayBpcyBub3QgdG8gZnJlZSBtZW1vcnkgb3INCnVucmVnaXN0ZXIg
Y2xvY2tzLCBidXQgdG8gY2xlYXIgdGhlIHJlZ21hcCBwb2ludGVycy4NCg0KSSB3YW50IHRvIHNl
dCBkZXNjLT5jbGtzW2ldLT5yZWdtYXAgPSBOVUxMOyBpbiAucmVtb3ZlIGNhbGxiYWNrLg0KDQpC
ZXN0IFJlZ2FyZHMsDQpZdS1DaHVuDQoNCj4gQnJpYW4NCj4gDQoNCg==

