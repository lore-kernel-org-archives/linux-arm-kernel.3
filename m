Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC459C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 18:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fgyqr2VSwZft01wwmePX/9fb8MG0zuAyG3Xa6crGPW8=; b=H7zfLR44r03odN8T2omh/bYLma
	KULiqIFV3Elc6st5RFOcFOf3YgAR+2kn6DufXcGHiMZEuMAaHnNDfJweb8f7qdW8oGCDW6ub29iis
	eICno2tSejNDBlJcIR+W6GsDwxscl+CTTiuQmzuivCm0DMHE85uKFeKPK1xMQOM28qfPvEsZ2F/+O
	QIxuo717RcOzDC22N6emsdtg9/xf3V2hcIobiqUzTn6xbsuTBeOn/MUxaLB/CMKIHuPAtgj1bec2f
	fh4i8kIuRWlfaSTE7qMR2jIglfiWEgON5binuMigi6Ntnk9iRZcsQ+UZY7qWLUrt2qOM5FUfFaErZ
	sLZAJaKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP3Wj-00000007mDV-1xhc;
	Tue, 10 Jun 2025 18:16:49 +0000
Received: from mail.actia.se ([212.181.117.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0XN-00000007E2j-1Bwt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 15:05:18 +0000
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 17:05:15 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.039; Tue, 10 Jun 2025 17:05:15 +0200
From: John Ernberg <john.ernberg@actia.se>
To: Xu Yang <xu.yang_2@nxp.com>
CC: Shawn Guo <shawnguo2@yeah.net>, Peter Chen <peter.chen@kernel.org>, "Shawn
 Guo" <shawnguo@kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: i.MX kernel hangup caused by chipidea USB gadget driver
Thread-Topic: i.MX kernel hangup caused by chipidea USB gadget driver
Thread-Index: AQHb2Uk8r5zPXewyY0SsDNZZa8wLobP8IguAgAA7/4A=
Date: Tue, 10 Jun 2025 15:05:15 +0000
Message-ID: <4fc6ec7a-ab2d-4b2c-b1f7-7902010c8682@actia.se>
References: <aEZxmlHmjeWcXiF3@dragon>
 <c56pgxmfscg6tpqxjayu4mvxc2g5kgmfitpvp36lxulpq4jxmg@ces5l7ofab6s>
 <aEbstxkQmji4tfjf@w447anl.localdomain>
 <k6j2za47cp4ccyfkevwpx2x5s4bjrxxqhqvteyspbf2n7yxcff@ccztqeuhn2di>
In-Reply-To: <k6j2za47cp4ccyfkevwpx2x5s4bjrxxqhqvteyspbf2n7yxcff@ccztqeuhn2di>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.12.12.63]
x-esetresult: clean, is OK
x-esetid: 37303A2955B14453627660
Content-Type: text/plain; charset="utf-8"
Content-ID: <6142381A428FC447986A4F4CDC66E534@actia.se>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_080517_323098_4762723F 
X-CRM114-Status: GOOD (  25.82  )
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

SGkgWHUsDQoNCk9uIDYvMTAvMjUgMTozMCBQTSwgWHUgWWFuZyB3cm90ZToNCj4gSGkgSm9obiwN
Cj4gDQo+IE9uIE1vbiwgSnVuIDA5LCAyMDI1IGF0IDAyOjE3OjMwUE0gKzAwMDAsIEpvaG4gRXJu
YmVyZyB3cm90ZToNCj4+IEhpIFNoYXduLCBYdSwNCj4+DQo+PiBPbiBNb24sIEp1biAwOSwgMjAy
NSBhdCAwNzo1MzoyMlBNICswODAwLCBYdSBZYW5nIHdyb3RlOg0KPj4+IEhpIFNoYXduLA0KPj4+
DQo+Pj4gVGhhbmtzIGZvciB5b3VyIHJlcG9ydHMhDQo+Pj4NCj4+PiBPbiBNb24sIEp1biAwOSwg
MjAyNSBhdCAwMTozMTowNlBNICswODAwLCBTaGF3biBHdW8gd3JvdGU6DQo+Pj4+IEhpIFh1LCBQ
ZXRlciwNCj4+Pj4NCj4+Pj4gSSdtIHNlZWluZyBhIGtlcm5lbCBoYW5ndXAgb24gaW14OG1tLWV2
ayBib2FyZC4gIEl0IGhhcHBlbnMgd2hlbjoNCj4+Pj4NCj4+Pj4gICAtIFVTQiBnYWRnZXQgaXMg
ZW5hYmxlZCBhcyBFdGhlcm5ldA0KPj4+PiAgIC0gVGhlcmUgaXMgZGF0YSB0cmFuc2ZlciBvdmVy
IFVTQiBFdGhlcm5ldA0KPj4+PiAgIC0gRGV2aWNlIGlzIGdvaW5nIGluL291dCBzdXNwZW5kDQo+
Pj4+DQo+Pj4+IEEgc2ltcGxlIHdheSB0byByZXByb2R1Y2UgdGhlIGlzc3VlIGNvdWxkIGJlOg0K
Pj4+Pg0KPj4+PiAgIDEuIENvcHkgYSBiaWcgZmlsZSAobGlrZSA1MDBNQikgZnJvbSBob3N0IFBD
IHRvIGRldmljZSB3aXRoIHNjcA0KPj4+Pg0KPj4+PiAgIDIuIFdoaWxlIHRoZSBmaWxlIGNvcHkg
aXMgb25nb2luZywgc3VzcGVuZCAmIHJlc3VtZSB0aGUgZGV2aWNlIGxpa2U6DQo+Pj4+DQo+Pj4+
ICAgICAgJCBlY2hvICszID4gL3N5cy9jbGFzcy9ydGMvcnRjMC93YWtlYWxhcm07IGVjaG8gbWVt
ID4gL3N5cy9wb3dlci9zdGF0ZQ0KPj4+Pg0KPj4+PiAgIDMuIFRoZSBkZXZpY2Ugd2lsbCBoYW5n
IHVwIHRoZXJlDQo+Pj4+DQo+Pj4+IEkgcmVwcm9kdWNlZCBvbiB0aGUgZm9sbG93aW5nIGtlcm5l
bHM6DQo+Pj4+DQo+Pj4+ICAgLSBNYWlubGluZSBrZXJuZWwNCj4+Pj4gICAtIE5YUCBrZXJuZWwg
bGYtNi42LnkNCj4+Pj4gICAtIE5YUCBrZXJuZWwgbGYtNi4xMi55DQo+Pj4+DQo+Pj4+IEJ1dCBO
WFAga2VybmVsIGxmLTYuMS55IGRvZXNuJ3QgaGF2ZSB0aGlzIHByb2JsZW0uICBJIHRyYWNrZWQg
aXQgZG93biB0bw0KPj4+PiBQZXRlcidzIGNvbW1pdCBbMV0gb24gbGYtNi4xLnksIGFuZCBmb3Vu
ZCB0aGF0IHRoZSBnYWRnZXQgZGlzY29ubmVjdCAmDQo+Pj4+IGNvbm5lY3QgY2FsbHMgZ290IGxv
c3QgZnJvbSBzdXNwZW5kICYgcmVzdW1lIGhvb2tzLCB3aGVuIHRoZSBjb21taXQgd2VyZQ0KPj4+
PiBzcGxpdCBhbmQgcHVzaGVkIHVwc3RyZWFtLiAgSSBjb25maXJtIHRoYXQgYWRkaW5nIHRoZSBj
YWxscyBiYWNrIGZpeGVzDQo+Pj4+IHRoZSBoYW5ndXAuDQo+Pg0KPj4gV2UgcHJvYmFibHkgcmFu
IGludG8gdGhlIHNhbWUgcHJvYmxlbSB0cnlpbmcgdG8gYnJpbmcgb25ib2FyZCA2LjEyLCBnb2lu
Zw0KPj4gZnJvbSA2LjEsIG9uIGlNWDhRWFAuIEkgbWFuYWdlZCB0byB0cmFjZSB0aGUgaGFuZyB0
byBFUCBwcmltaW5nIHRocm91Z2ggYQ0KPj4gY29tYmluYXRpb24gb2YgZGVidWcgdHJhY2luZyBh
bmQgQlVHX09OIGV4cGVyaW1lbnRzLiBTZWUgaWYgaXQgc3RhcnRzDQo+PiBzcGxhdGluIHdpdGgg
dGhlIGJlbG93IGNoYW5nZS4NCj4+DQo+PiAtLS0tLS0tLS0tLS0tLS0tLT44LS0tLS0tLS0tLS0t
LS0tLS0tDQo+Pg0KPj4gPkZyb20gMDkyNTk5YWI2ZjllMjA0MTJhN2NhMWViMTE4ZGQyYmU4MGNk
MThmZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCj4+IEZyb206IEpvaG4gRXJuYmVyZyA8am9o
bi5lcm5iZXJnQGFjdGlhLnNlPg0KPj4gRGF0ZTogTW9uLCA1IE1heSAyMDI1IDA5OjA5OjAxICsw
MjAwDQo+PiBTdWJqZWN0OiBbUEFUQ0hdIFVTQjogY2k6IGdhZGdldDogUGFuaWMgaWYgcHJpbWlu
ZyB3aGVuIGdhZGdldCBvZmYNCj4+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy91c2IvY2hpcGlkZWEv
dWRjLmMgfCA0ICsrKy0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9jaGlwaWRlYS91ZGMu
YyBiL2RyaXZlcnMvdXNiL2NoaXBpZGVhL3VkYy5jDQo+PiBpbmRleCAyZmVhMjYzYTVlMzAuLjU0
NGFhNGZhMmQxZCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvdXNiL2NoaXBpZGVhL3VkYy5jDQo+
PiArKysgYi9kcml2ZXJzL3VzYi9jaGlwaWRlYS91ZGMuYw0KPj4gQEAgLTIwMyw4ICsyMDMsMTAg
QEAgc3RhdGljIGludCBod19lcF9wcmltZShzdHJ1Y3QgY2lfaGRyYyAqY2ksIGludCBudW0sIGlu
dCBkaXIsIGludCBpc19jdHJsKQ0KPj4NCj4+ICAgICAgaHdfd3JpdGUoY2ksIE9QX0VORFBUUFJJ
TUUsIH4wLCBCSVQobikpOw0KPj4NCj4+IC0gICB3aGlsZSAoaHdfcmVhZChjaSwgT1BfRU5EUFRQ
UklNRSwgQklUKG4pKSkNCj4+ICsgICB3aGlsZSAoaHdfcmVhZChjaSwgT1BfRU5EUFRQUklNRSwg
QklUKG4pKSkgew0KPj4gICAgICAgICAgY3B1X3JlbGF4KCk7DQo+PiArICAgICAgIEJVR19PTihk
aXIgPT0gVFggJiYgIWh3X3JlYWQoY2ksIE9QX0VORFBUQ1RSTCArIG51bSwgRU5EUFRDVFJMX1RY
RSkpOw0KPj4gKyAgIH0NCj4+ICAgICAgaWYgKGlzX2N0cmwgJiYgZGlyID09IFJYICYmIGh3X3Jl
YWQoY2ksIE9QX0VORFBUU0VUVVBTVEFULCBCSVQobnVtKSkpDQo+PiAgICAgICAgICByZXR1cm4g
LUVBR0FJTjsNCj4+DQo+PiAtLS0tLS0tLS0tLS0tLS0tLT44LS0tLS0tLS0tLS0tLS0tLS0tDQo+
Pg0KPj4gT24gdGhlIGlNWDhRWFAgeW91IG1heSBhZGRpdGlvbmFsbHkgcnVuIGludG8gYXN5Y2hy
b25vdXMgYWJvcnRzIGFuZCBTRXJyb3INCj4+IGR1ZSB0byByZXNvdXJjZSBiZWluZyBkaXNhYmxl
ZC4NCj4+DQo+Pj4+DQo+Pj4+IC0tLTg8LS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+Pj4NCj4+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2NoaXBpZGVhL3VkYy5jIGIvZHJpdmVycy91c2IvY2hp
cGlkZWEvdWRjLmMNCj4+Pj4gaW5kZXggOGE5YjMxZmQ1Yzg5Li43MjMyOWE3ZWFjNGQgMTAwNjQ0
DQo+Pj4+IC0tLSBhL2RyaXZlcnMvdXNiL2NoaXBpZGVhL3VkYy5jDQo+Pj4+ICsrKyBiL2RyaXZl
cnMvdXNiL2NoaXBpZGVhL3VkYy5jDQo+Pj4+IEBAIC0yMzc0LDYgKzIzNzQsOSBAQCBzdGF0aWMg
dm9pZCB1ZGNfc3VzcGVuZChzdHJ1Y3QgY2lfaGRyYyAqY2kpDQo+Pj4+ICAgICAgICAgICAqLw0K
Pj4+PiAgICAgICAgICBpZiAoaHdfcmVhZChjaSwgT1BfRU5EUFRMSVNUQUREUiwgfjApID09IDAp
DQo+Pj4+ICAgICAgICAgICAgICAgICAgaHdfd3JpdGUoY2ksIE9QX0VORFBUTElTVEFERFIsIH4w
LCB+MCk7DQo+Pj4+ICsNCj4+Pj4gKyAgICAgICBpZiAoY2ktPmRyaXZlciAmJiBjaS0+dmJ1c19h
Y3RpdmUgJiYgKGNpLT5nYWRnZXQuc3RhdGUgIT0gVVNCX1NUQVRFX1NVU1BFTkRFRCkpDQo+Pj4+
ICsgICAgICAgICAgICAgICB1c2JfZ2FkZ2V0X2Rpc2Nvbm5lY3QoJmNpLT5nYWRnZXQpOw0KPj4+
PiAgIH0NCj4+Pj4NCj4+Pj4gICBzdGF0aWMgdm9pZCB1ZGNfcmVzdW1lKHN0cnVjdCBjaV9oZHJj
ICpjaSwgYm9vbCBwb3dlcl9sb3N0KQ0KPj4+PiBAQCAtMjM4NCw2ICsyMzg3LDkgQEAgc3RhdGlj
IHZvaWQgdWRjX3Jlc3VtZShzdHJ1Y3QgY2lfaGRyYyAqY2ksIGJvb2wgcG93ZXJfbG9zdCkNCj4+
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBPVEdTQ19CU1ZJUyB8
IE9UR1NDX0JTVklFKTsNCj4+Pj4gICAgICAgICAgICAgICAgICBpZiAoY2ktPnZidXNfYWN0aXZl
KQ0KPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgdXNiX2dhZGdldF92YnVzX2Rpc2Nvbm5l
Y3QoJmNpLT5nYWRnZXQpOw0KPj4+PiArICAgICAgIH0gZWxzZSB7DQo+Pj4+ICsgICAgICAgICAg
ICAgICBpZiAoY2ktPmRyaXZlciAmJiBjaS0+dmJ1c19hY3RpdmUpDQo+Pj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHVzYl9nYWRnZXRfY29ubmVjdCgmY2ktPmdhZGdldCk7DQo+Pj4+ICAgICAg
ICAgIH0NCj4+Pj4NCj4+Pj4gICAgICAgICAgLyogUmVzdG9yZSB2YWx1ZSAwIGlmIGl0IHdhcyBz
ZXQgZm9yIHBvd2VyIGxvc3QgY2hlY2sgKi8NCj4+Pj4NCj4+Pj4gLS0tLT44LS0tLS0tLS0tLS0t
LS0tLS0tDQo+IA0KPiBEb2VzIGFib3ZlIGNoYW5nZSB3b3JrIGZvciB5b3U/DQoNCkkgaG9wZSB0
byBhbGxvY2F0ZSBzb21lIHRpbWUgdG8gdGVzdCB0aGlzIGluIHRoZSBuZXh0IGZldyBkYXlzLg0K
DQpCZXN0IHJlZ2FyZHMgLy8gSm9obiBFcm5iZXJn

