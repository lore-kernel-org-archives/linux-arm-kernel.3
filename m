Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A534C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CsO8ipof80Sfgt/x1IVb9h+EHVZOEBiAg5aJSVjycZs=; b=cwguGLgI7oQM+QG+/LU0fMa++k
	JzecDypOiZeBRNr0YHKG0rgvJEKEUxYJyEc86zpknFtmCQrYQwtRRbufCn0/1FrdNeeyc6bMVRoY0
	XeqXA5vrzGA2GgKOAPUUsoNs6waP+JH2poFScqi/pS0I9fKqD6D1mYwhUirNrxwxV0Dsc5+mJSmbv
	uZPyV8IKXuf3DNMYZ7UNXucy8t0rvkiw9ePH+eG9IIAaMkedwDG4+79h8xl4KxW7GhBfNH+8DgfWF
	5BLdPVFURu6/lPTmivoIO+GotMu8XfWLd+PV5Oj8ch4+B3z6x/imgpch8CD1bC2UMiyhlUdyo+Sj8
	yj8SjiqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRUO-0000000B5EB-0TcX;
	Wed, 22 Jul 2026 07:35:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRUM-0000000B5CY-0mSl;
	Wed, 22 Jul 2026 07:35:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CsO8ipof80Sfgt/x1IVb9h+EHVZOEBiAg5aJSVjycZs=; b=kLU5LifyEY0XK1umazq2O3XG3v
	wnM/bh6T9/XCAKz9jQwucINZJazf9cgTTjs+NCtZpI7otkVzqJJJIt1TTHyN0cmIC+A1Y2bRPrOrB
	l8xsP67dMH01kkffyT4T9K/TzHTHXjD3R/aVPl1soU2WK8PYdPib9VMFn4Kw/PwV8Au/mKmR1ahTS
	ASQ5R5KgrfX/cD/J4ciu/tQITRFRmxFtHTdM1htthM7x84fPYFATaGG9/SxmeqFS5tyLtHIGPp19n
	gOsXgXNIoBormMA/OMr2+JextUUh7lHC0/5RlQwKHqUNqA35UWNKUwVmmtA3QM+JRxiTJnCFc+iFW
	auNouUiA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmRUI-00000000a1U-0c5h;
	Wed, 22 Jul 2026 07:35:32 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66M7YdEW23797704, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1784705679; bh=CsO8ipof80Sfgt/x1IVb9h+EHVZOEBiAg5aJSVjycZs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Kh1+bxb1/5PJwCrOGPgqtCBJZPFltAC+DPE9lHTn61xBrnyAs9fj9YJ29p0qDVhwY
	 p+Shvo4z/usHVUy+tkXpU607XATI1kzNn1Z3kknMq54ltYMqrjlkDdt41g7MGRao1x
	 PVTYNt1kXlRraXIEhzZ0Sstw9P3lSWVLEF2QZWtN6UjpqW80dM10HbrXvm78UCn3SK
	 edDiCyFPic1sHUU1o+pJQaR03uq8aeL8Q6FoS32bHhZAORtsYegCp3cwIsA4LpeuM2
	 orzJ9jGSioqvg9IzLVg4mrOfDXSNvFWzuyGr9vANGrfmrdM7Dq38KJ76CTSYJ0WibM
	 mPyCt5tc6f2lA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66M7YdEW23797704
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Jul 2026 15:34:39 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 22 Jul 2026 15:34:38 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Wed, 22 Jul 2026 15:34:38 +0800
From: =?big5?B?WXUtQ2h1biBMaW4gW6pMr6enZ10=?= <eleanor.lin@realtek.com>
To: Brian Masney <bmasney@redhat.com>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?big5?B?RWRnYXIgTGVlIFun9anTv9ld?= <cylee12@realtek.com>,
	"afaerber@suse.com" <afaerber@suse.com>, =?big5?B?SnlhbiBDaG91IFupUKrppndd?=
	<jyanchou@realtek.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>, =?big5?B?SmFtZXMgVGFpIFvAuafTrnBd?=
	<james.tai@realtek.com>, =?big5?B?Q1lfSHVhbmdbtsDgsq7LXQ==?=
	<cy.huang@realtek.com>, =?big5?B?U3RhbmxleSBDaGFuZ1up96h8vHdd?=
	<stanley_chang@realtek.com>
Subject: RE: [PATCH v10 08/11] clk: realtek: Add support for MMC-tuned PLL
 clocks
Thread-Topic: [PATCH v10 08/11] clk: realtek: Add support for MMC-tuned PLL
 clocks
Thread-Index: AQHdEuAsI89D8FRCKUWTKm1gKjcY/rZ4KEgAgAEKgkA=
Date: Wed, 22 Jul 2026 07:34:38 +0000
Message-ID: <9080dd0534184fbd9c546d2e81f4984a@realtek.com>
References: <20260713155630.3054636-1-eleanor.lin@realtek.com>
 <20260713155630.3054636-9-eleanor.lin@realtek.com>
 <amADBr_DnBeGh2jg@redhat.com>
In-Reply-To: <amADBr_DnBeGh2jg@redhat.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_083530_880284_2724CE09 
X-CRM114-Status: GOOD (  19.37  )
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

SGkgQnJpYW4sDQoNCj4gT24gTW9uLCBKdWwgMTMsIDIwMjYgYXQgMTE6NTY6MjdQTSArMDgwMCwg
WXUtQ2h1biBMaW4gd3JvdGU6DQo+ID4gRnJvbTogQ2hlbmctWXUgTGVlIDxjeWxlZTEyQHJlYWx0
ZWsuY29tPg0KPiA+DQo+ID4gQWRkIGNsa19wbGxfbW1jX29wcyBmb3IgZW5hYmxlL2Rpc2FibGUs
IHByZXBhcmUsIHJhdGUgY29udHJvbCwgYW5kDQo+ID4gc3RhdHVzIG9wZXJhdGlvbnMgb24gTU1D
IFBMTCBjbG9ja3MuDQo+ID4NCj4gPiBBbHNvIGFkZCBjbGtfcGxsX21tY19waGFzZV9vcHMgdG8g
c3VwcG9ydCBwaGFzZSBnZXQvc2V0IG9wZXJhdGlvbnMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBDaGVuZy1ZdSBMZWUgPGN5bGVlMTJAcmVhbHRlay5jb20+DQo+ID4gQ28tZGV2ZWxvcGVkLWJ5
OiBKeWFuIENob3UgPGp5YW5jaG91QHJlYWx0ZWsuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEp5
YW4gQ2hvdSA8anlhbmNob3VAcmVhbHRlay5jb20+DQo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBZdS1D
aHVuIExpbiA8ZWxlYW5vci5saW5AcmVhbHRlay5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogWXUt
Q2h1biBMaW4gPGVsZWFub3IubGluQHJlYWx0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+IENoYW5nZXMg
aW4gdjEwOg0KPiA+IC0gTm9uZS4NCj4gPiAtLS0NCj4gPiAgTUFJTlRBSU5FUlMgICAgICAgICAg
ICAgICAgICAgICAgIHwgICA4ICsNCj4gPiAgZHJpdmVycy9jbGsvcmVhbHRlay9LY29uZmlnICAg
ICAgIHwgICAzICsNCj4gPiAgZHJpdmVycy9jbGsvcmVhbHRlay9NYWtlZmlsZSAgICAgIHwgICAy
ICsNCj4gPiAgZHJpdmVycy9jbGsvcmVhbHRlay9jbGstcGxsLW1tYy5jIHwgNDMwDQo+ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICBkcml2ZXJzL2Nsay9yZWFsdGVrL2Nsay1w
bGwuaCAgICAgfCAgMTMgKw0KPiA+ICA1IGZpbGVzIGNoYW5nZWQsIDQ1NiBpbnNlcnRpb25zKCsp
DQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9yZWFsdGVrL2Nsay1wbGwtbW1j
LmMNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTIGluZGV4
DQo+ID4gMWZmZmIxZmM1ZGUxLi4wYzhiOThlY2M0YTUgMTAwNjQ0DQo+ID4gLS0tIGEvTUFJTlRB
SU5FUlMNCj4gPiArKysgYi9NQUlOVEFJTkVSUw0KPiA+IEBAIC0yMjc0Nyw2ICsyMjc0NywxNCBA
QCBGOiAgIGRyaXZlcnMvcmVzZXQvcmVhbHRlay8qDQo+ID4gIEY6ICAgaW5jbHVkZS9kdC1iaW5k
aW5ncy9jbG9jay9yZWFsdGVrKg0KPiA+ICBGOiAgIGluY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQv
cmVhbHRlayoNCj4gPg0KPiA+ICtSRUFMVEVLIFNPQyBQTEwgQ0xPQ0sgRk9SIE1NQyBTVVBQT1JU
DQo+ID4gK006ICAgQ2hlbmctWXUgTGVlIDxjeWxlZTEyQHJlYWx0ZWsuY29tPg0KPiA+ICtNOiAg
IEp5YW4gQ2hvdSA8anlhbmNob3VAcmVhbHRlay5jb20+DQo+ID4gK006ICAgWXUtQ2h1biBMaW4g
PGVsZWFub3IubGluQHJlYWx0ZWsuY29tPg0KPiA+ICtMOiAgIGxpbnV4LWNsa0B2Z2VyLmtlcm5l
bC5vcmcNCj4gPiArUzogICBTdXBwb3J0ZWQNCj4gPiArRjogICBkcml2ZXJzL2Nsay9yZWFsdGVr
L2Nsay1wbGwtbW1jLmMNCj4gDQo+IDIgb2YgdGhlIDMgbmFtZXMgbGlzdGVkIGhlcmUgYXJlIHVu
ZGVyIHRoZSBuZXcgcmVhbHRlayBlbnRyeSBhZGRlZCBieSB0aGlzDQo+IHNlcmllcy4gSSdtIG5v
dCBzdXJlIGhvdyBjb21tb24gdGhpcyBpcyBidXQgaXQgc2VlbXMgb3Zlcmx5IGdyYW51bGFyLg0K
PiANCj4gQnJpYW4NCg0KSSBoYXZlIGNoZWNrZWQgd2l0aCBKeWFuIENob3UsIGFuZCB3ZSBhZ3Jl
ZSB0aGF0IHRoaXMgZW50cnkgaXMgdG9vIGdyYW51bGFyLg0KDQpXZSB3aWxsIHJlbW92ZSB0aGUg
J1JFQUxURUsgU09DIFBMTCBDTE9DSyBGT1IgTU1DIFNVUFBPUlQnIGVudHJ5IGFuZCBvbmx5IGtl
ZXANCnRoZSBicm9hZGVyIG9uZS4NCg0KQmVzdCBSZWdhcmRzLA0KWXUtQ2h1bg0K

