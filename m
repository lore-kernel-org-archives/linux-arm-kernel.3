Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46737E99049
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 07:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wgFBGI4lM4xP6/pkLys2HvTLxffJdeQgef3VJorRvAc=; b=4JiSpqe9zhXiaiHvfqu/XzwcVn
	tpS33SrffD1/niMIBI30OVLt3DNePSR1t+Q+rFNdzXSmQpZZPWIGjUQIo7eyyBWNchGdCa53naKSj
	Th2EkoO/1KUlKTL5aONNEaC382JghS/B/eQGGYiPOjHKjpaduCQglTQdo46+4++POSUDMXFfAGxGb
	O2HsKD8ZJP9qTkF4bwGuyPW5WaQxnkPunbiODCYUzYUG4FSvnojWrwbDiAwueiJ+WHzigwtBsb/AB
	aYvi5HJBidKy3EIGRgVSMXgdax5MyDmqCGSgiYoLjvzrA+oeIVLWyTPwatOp+DEsQ0aRFjITBaz7U
	C6o+qqCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6EF-0000000BjIz-2Ab4;
	Fri, 10 Apr 2026 07:24:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6EE-0000000BjIq-2lLN;
	Fri, 10 Apr 2026 07:24:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wgFBGI4lM4xP6/pkLys2HvTLxffJdeQgef3VJorRvAc=; b=iPnEi0dWXHPOExWq0f19X36jaa
	vGc35V+9tKudHkIiH2O+yhbFLbIKFnFE/CP36NCBJtYPQD6ITg/GiLjKL0fveOz9zgv1teHimUciO
	FCdWJXFsCtT9OLx4tkIfbo7v+zcZT6Kp47jGbRq4NKpORmcrB+Sdewl180WkgpLHTB4N+n0ixT+tR
	5OmON9ZfSGka1QyLb6tHZuuVRXcUYUx5KDT0t5BZu8acSEGBo6UPUsxkRnL8QJBD3C4kUNG1P2F9s
	Gzm4BMhnfN7CGY19VgelLtmEr72qzxvWZ7IC2Aaz0yGgrAeQZqtBSgMkP8EuXkF/+xCRQbOOkavgF
	kDKPPF3g==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6EA-0000000CzP8-36VZ;
	Fri, 10 Apr 2026 07:24:33 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 63A7M5mF42598450, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1775805725; bh=wgFBGI4lM4xP6/pkLys2HvTLxffJdeQgef3VJorRvAc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=odk5j1wswY6cNNLmxiatAqLoJzcovUHxgEwu8X6o851Mx7C/ZTUdMUBStFO6RFizD
	 ylIZ8zBEuuDqcUX60h1NRjw1PrbfFcwYSkw/kx2bz7x1vpgMU0VuGOUrA9FtTX4T9l
	 fMhKU9XrlCRc+NF6beNUi2bsyShsCOKDqpSsiqNqQ2OTy5eorXO2lEiMUdo9HRwhMk
	 xzFIQNH6aK6agOmKE81BedSn8Xhr1Mu6M+oTaTLwczSZfJpFDZVWQohDfUSESn1etW
	 lFWEWQgY4fhoxkW5mqQtw9FoWY6IWf0YVJto+JIWEll3fpobOBGVrXkXIU557nJyXx
	 re08L5KsCd7iw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 63A7M5mF42598450
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Apr 2026 15:22:05 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 10 Apr 2026 15:22:06 +0800
Received: from RTKEXHMBS05.realtek.com.tw ([fe80::5e14:1ddb:ee82:82d6]) by
 RTKEXHMBS05.realtek.com.tw ([fe80::5e14:1ddb:ee82:82d6%4]) with mapi id
 15.02.1748.010; Fri, 10 Apr 2026 15:22:06 +0800
From: =?big5?B?WXUtQ2h1biBMaW4gW6pMr6enZ10=?= <eleanor.lin@realtek.com>
To: Brian Masney <bmasney@redhat.com>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org"
	<sboyd@kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        =?big5?B?RWRnYXIgTGVlIFun9anTv9ld?= <cylee12@realtek.com>,
        "afaerber@suse.com" <afaerber@suse.com>,
        =?big5?B?SnlhbiBDaG91IFupUKrppndd?=
	<jyanchou@realtek.com>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
        =?big5?B?SmFtZXMgVGFpIFvAuafTrnBd?=
	<james.tai@realtek.com>,
        =?big5?B?Q1lfSHVhbmdbtsDgsq7LXQ==?=
	<cy.huang@realtek.com>,
        =?big5?B?U3RhbmxleSBDaGFuZ1up96h8vHdd?=
	<stanley_chang@realtek.com>
Subject: RE: [PATCH v6 03/10] clk: realtek: Introduce a common probe()
Thread-Topic: [PATCH v6 03/10] clk: realtek: Introduce a common probe()
Thread-Index: AQHcwnPq97dXVWd6W0ejMS4/lmP1R7XM33KAgAsQ/7A=
Date: Fri, 10 Apr 2026 07:22:05 +0000
Message-ID: <b7756e4a348d44b9a1e34a235d354005@realtek.com>
References: <20260402073957.2742459-1-eleanor.lin@realtek.com>
 <20260402073957.2742459-4-eleanor.lin@realtek.com>
 <ac_NB8y414PtbtqM@redhat.com>
In-Reply-To: <ac_NB8y414PtbtqM@redhat.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_082431_710019_C4E96FED 
X-CRM114-Status: GOOD (  38.35  )
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

SGkgQnJpYW4sDQoNCj4gSGkgQ2hlbmctWXUsDQo+IA0KPiBPbiBUaHUsIEFwciAwMiwgMjAyNiBh
dCAwMzozOTo1MFBNICswODAwLCBDaGVuZy1ZdSBMZWUgd3JvdGU6DQo+ID4gQWRkIHJ0a19jbGtf
cHJvYmUoKSB0byBzZXQgdXAgdGhlIHNoYXJlZCByZWdtYXAsIHJlZ2lzdGVyIGNsb2NrDQo+ID4g
aGFyZHdhcmUsIGFuZCBhZGQgdGhlIGNsb2NrIHByb3ZpZGVyLg0KPiA+DQo+ID4gQWRkaXRpb25h
bGx5LCBpZiB0aGUgIiNyZXNldC1jZWxscyIgcHJvcGVydHkgaXMgcHJlc2VudCBpbiB0aGUgZGV2
aWNlDQo+ID4gdHJlZSwgaXQgY3JlYXRlcyBhbmQgcmVnaXN0ZXJzIGFuIGF1eGlsaWFyeSBkZXZp
Y2UgdXNpbmcgdGhlIHByb3ZpZGVkDQo+IGF1eF9uYW1lLg0KPiA+IFRoaXMgYWxsb3dzIHRoZSBk
ZWRpY2F0ZWQgcmVzZXQgZHJpdmVyIHRvIGJpbmQgdG8gdGhpcyBkZXZpY2UsDQo+ID4gZW5hYmxp
bmcgYm90aCBjbG9jayBhbmQgcmVzZXQgZHJpdmVycyB0byBzaGFyZSB0aGUgc2FtZSByZWdtYXAu
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGVuZy1ZdSBMZWUgPGN5bGVlMTJAcmVhbHRlay5j
b20+DQo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBZdS1DaHVuIExpbiA8ZWxlYW5vci5saW5AcmVhbHRl
ay5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogWXUtQ2h1biBMaW4gPGVsZWFub3IubGluQHJlYWx0
ZWsuY29tPg0KPiA+IC0tLQ0KPiA+IENoYW5nZXMgaW4gdjY6DQo+ID4gLSBSZXBsYWNlIGRpcmVj
dCByZXNldCBjb250cm9sbGVyIGluaXRpYWxpemF0aW9uIHdpdGggYXV4aWxpYXJ5IGRldmljZSBj
cmVhdGlvbi4NCj4gPiAtIEFkZCBhdXhfbmFtZSBwYXJhbWV0ZXIgdG8gcnRrX2Nsa19wcm9iZSgp
IHRvIHJlZ2lzdGVyIHRoZSByZXNldCBhdXhpbGlhcnkNCj4gZGV2aWNlLg0KPiA+IC0gU2ltcGxp
ZnkgcnRrX2Nsa19kZXNjIGJlY2F1c2UgcmVzZXQgZGF0YSBpcyBoYW5kbGVkIGVudGlyZWx5IGJ5
IHRoZSBhdXhpbGlhcnkNCj4gcmVzZXQgZHJpdmVyLg0KPiA+IC0gSW4gS2NvbmZpZywgY2hhbmdl
ICJkZXBlbmRzIG9uIFJFU0VUX0NPTlRST0xMRVIiIHRvICJzZWxlY3QNCj4gUkVTRVRfQ09OVFJP
TExFUiINCj4gPiAtIFJlbW92ZSB1bnVzZWQgaW5jbHVkZXMgaGVhZGVycyBhbmQgYWRkZWQgPGxp
bnV4L2F1eGlsaWFyeV9idXMuaD4uDQo+ID4gLS0tDQo+ID4gIE1BSU5UQUlORVJTICAgICAgICAg
ICAgICAgICAgfCAgMSArDQo+ID4gIGRyaXZlcnMvY2xrL0tjb25maWcgICAgICAgICAgfCAgMSAr
DQo+ID4gIGRyaXZlcnMvY2xrL01ha2VmaWxlICAgICAgICAgfCAgMSArDQo+ID4gIGRyaXZlcnMv
Y2xrL3JlYWx0ZWsvS2NvbmZpZyAgfCAyOCArKysrKysrKysrKysrKysNCj4gPiBkcml2ZXJzL2Ns
ay9yZWFsdGVrL01ha2VmaWxlIHwgIDQgKysrICBkcml2ZXJzL2Nsay9yZWFsdGVrL2NvbW1vbi5j
IHwNCj4gPiA2NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgZHJp
dmVycy9jbGsvcmVhbHRlay9jb21tb24uaCB8IDM3ICsrKysrKysrKysrKysrKysrKysrDQo+ID4g
IDcgZmlsZXMgY2hhbmdlZCwgMTM5IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvY2xrL3JlYWx0ZWsvS2NvbmZpZyAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4g
ZHJpdmVycy9jbGsvcmVhbHRlay9NYWtlZmlsZSAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gZHJp
dmVycy9jbGsvcmVhbHRlay9jb21tb24uYyAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gZHJpdmVy
cy9jbGsvcmVhbHRlay9jb21tb24uaA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJT
IGIvTUFJTlRBSU5FUlMgaW5kZXgNCj4gPiA4ZjM1NTg5NjU4M2IuLjgzMTgxNTZhMDJiNSAxMDA2
NDQNCj4gPiAtLS0gYS9NQUlOVEFJTkVSUw0KPiA+ICsrKyBiL01BSU5UQUlORVJTDQo+ID4gQEAg
LTIyMjQwLDYgKzIyMjQwLDcgQEAgTDogICAgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcNCj4g
PiAgTDogICBsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnDQo+ID4gIFM6ICAgU3VwcG9ydGVkDQo+
ID4gIEY6ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3JlYWx0ZWsq
DQo+ID4gK0Y6ICAgZHJpdmVycy9jbGsvcmVhbHRlay8qDQo+ID4gIEY6ICAgZHJpdmVycy9yZXNl
dC9yZWFsdGVrLyoNCj4gPiAgRjogICBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3JlYWx0ZWsq
DQo+ID4gIEY6ICAgaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9yZWFsdGVrKg0KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2Nsay9LY29uZmlnIGIvZHJpdmVycy9jbGsvS2NvbmZpZyBpbmRleA0K
PiA+IDNkODAzYjRjZjVjMS4uZDYwZjY0MTViMGEzIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
Y2xrL0tjb25maWcNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9LY29uZmlnDQo+ID4gQEAgLTUxOSw2
ICs1MTksNyBAQCBzb3VyY2UgImRyaXZlcnMvY2xrL251dm90b24vS2NvbmZpZyINCj4gPiAgc291
cmNlICJkcml2ZXJzL2Nsay9waXN0YWNoaW8vS2NvbmZpZyINCj4gPiAgc291cmNlICJkcml2ZXJz
L2Nsay9xY29tL0tjb25maWciDQo+ID4gIHNvdXJjZSAiZHJpdmVycy9jbGsvcmFsaW5rL0tjb25m
aWciDQo+ID4gK3NvdXJjZSAiZHJpdmVycy9jbGsvcmVhbHRlay9LY29uZmlnIg0KPiA+ICBzb3Vy
Y2UgImRyaXZlcnMvY2xrL3JlbmVzYXMvS2NvbmZpZyINCj4gPiAgc291cmNlICJkcml2ZXJzL2Ns
ay9yb2NrY2hpcC9LY29uZmlnIg0KPiA+ICBzb3VyY2UgImRyaXZlcnMvY2xrL3NhbXN1bmcvS2Nv
bmZpZyINCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvTWFrZWZpbGUgYi9kcml2ZXJzL2Ns
ay9NYWtlZmlsZSBpbmRleA0KPiA+IGY3YmNlMzk1MWEzMC4uNjliODRkMWU3YmNjIDEwMDY0NA0K
PiA+IC0tLSBhL2RyaXZlcnMvY2xrL01ha2VmaWxlDQo+ID4gKysrIGIvZHJpdmVycy9jbGsvTWFr
ZWZpbGUNCj4gPiBAQCAtMTQwLDYgKzE0MCw3IEBAIG9iai0kKENPTkZJR19DT01NT05fQ0xLX1BJ
U1RBQ0hJTykNCj4gKz0gcGlzdGFjaGlvLw0KPiA+ICBvYmotJChDT05GSUdfQ09NTU9OX0NMS19Q
WEEpICAgICAgICAgKz0gcHhhLw0KPiA+ICBvYmotJChDT05GSUdfQ09NTU9OX0NMS19RQ09NKSAg
ICAgICAgICAgICAgICArPSBxY29tLw0KPiA+ICBvYmoteSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICArPSByYWxpbmsvDQo+ID4gK29iai0kKENPTkZJR19DT01NT05fQ0xL
X1JFQUxURUspICAgICArPSByZWFsdGVrLw0KPiA+ICBvYmoteSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICArPSByZW5lc2FzLw0KPiA+ICBvYmotJChDT05GSUdfQVJDSF9S
T0NLQ0hJUCkgICAgICAgICAgKz0gcm9ja2NoaXAvDQo+ID4gIG9iai0kKENPTkZJR19DT01NT05f
Q0xLX1NBTVNVTkcpICAgICArPSBzYW1zdW5nLw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Ns
ay9yZWFsdGVrL0tjb25maWcgYi9kcml2ZXJzL2Nsay9yZWFsdGVrL0tjb25maWcNCj4gPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NCBpbmRleCAwMDAwMDAwMDAwMDAuLmJjNDdkM2YxYzQ1Mg0KPiA+IC0t
LSAvZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9yZWFsdGVrL0tjb25maWcNCj4gPiBA
QCAtMCwwICsxLDI4IEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAt
b25seSBjb25maWcgQ09NTU9OX0NMS19SRUFMVEVLDQo+ID4gKyAgICAgYm9vbCAiQ2xvY2sgZHJp
dmVyIGZvciBSZWFsdGVrIFNvQ3MiDQo+ID4gKyAgICAgZGVwZW5kcyBvbiBBUkNIX1JFQUxURUsg
fHwgQ09NUElMRV9URVNUDQo+ID4gKyAgICAgZGVmYXVsdCBBUkNIX1JFQUxURUsNCj4gPiArICAg
ICBoZWxwDQo+ID4gKyAgICAgICBFbmFibGUgdGhlIGNvbW1vbiBjbG9jayBmcmFtZXdvcmsgaW5m
cmFzdHJ1Y3R1cmUgZm9yIFJlYWx0ZWsNCj4gPiArICAgICAgIHN5c3RlbS1vbi1jaGlwIHBsYXRm
b3Jtcy4NCj4gPiArDQo+ID4gKyAgICAgICBUaGlzIHByb3ZpZGVzIHRoZSBiYXNlIHN1cHBvcnQg
cmVxdWlyZWQgYnkgaW5kaXZpZHVhbCBSZWFsdGVrDQo+ID4gKyAgICAgICBjbG9jayBjb250cm9s
bGVyIGRyaXZlcnMgdG8gZXhwb3NlIGNsb2NrcyB0byBwZXJpcGhlcmFsIGRldmljZXMuDQo+ID4g
Kw0KPiA+ICsgICAgICAgSWYgeW91IGhhdmUgYSBSZWFsdGVrLWJhc2VkIHBsYXRmb3JtLCBzYXkg
WS4NCj4gPiArDQo+ID4gK2lmIENPTU1PTl9DTEtfUkVBTFRFSw0KPiA+ICsNCj4gPiArY29uZmln
IFJUS19DTEtfQ09NTU9ODQo+ID4gKyAgICAgdHJpc3RhdGUgIlJlYWx0ZWsgQ2xvY2sgQ29tbW9u
Ig0KPiA+ICsgICAgIHNlbGVjdCBSRVNFVF9DT05UUk9MTEVSDQo+ID4gKyAgICAgc2VsZWN0IFJF
U0VUX1JUS19DT01NT04NCj4gDQo+IHNlbGVjdCBBVVhJTElBUllfQlVTID8NCj4NCg0KQWNrLg0K
DQo+ID4gKyAgICAgaGVscA0KPiA+ICsgICAgICAgQ29tbW9uIGhlbHBlciBjb2RlIHNoYXJlZCBi
eSBSZWFsdGVrIGNsb2NrIGNvbnRyb2xsZXIgZHJpdmVycy4NCj4gPiArDQo+ID4gKyAgICAgICBU
aGlzIHByb3ZpZGVzIHV0aWxpdHkgZnVuY3Rpb25zIGFuZCBkYXRhIHN0cnVjdHVyZXMgdXNlZCBi
eQ0KPiA+ICsgICAgICAgbXVsdGlwbGUgUmVhbHRlayBjbG9jayBpbXBsZW1lbnRhdGlvbnMsIGFu
ZCBpbmNsdWRlIGludGVncmF0aW9uDQo+ID4gKyAgICAgICB3aXRoIHJlc2V0IGNvbnRyb2xsZXJz
IHdoZXJlIHJlcXVpcmVkLg0KPiA+ICsNCj4gPiArZW5kaWYNCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9jbGsvcmVhbHRlay9NYWtlZmlsZQ0KPiA+IGIvZHJpdmVycy9jbGsvcmVhbHRlay9NYWtl
ZmlsZSBuZXcgZmlsZSBtb2RlIDEwMDY0NCBpbmRleA0KPiA+IDAwMDAwMDAwMDAwMC4uMzc3ZWM3
NzZlZTQ3DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3JlYWx0ZWsv
TWFrZWZpbGUNCj4gPiBAQCAtMCwwICsxLDQgQEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMC1vbmx5DQo+ID4gK29iai0kKENPTkZJR19SVEtfQ0xLX0NPTU1PTikgKz0g
Y2xrLXJ0ay5vDQo+ID4gKw0KPiA+ICtjbGstcnRrLXkgKz0gY29tbW9uLm8NCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9jbGsvcmVhbHRlay9jb21tb24uYw0KPiA+IGIvZHJpdmVycy9jbGsvcmVh
bHRlay9jb21tb24uYyBuZXcgZmlsZSBtb2RlIDEwMDY0NCBpbmRleA0KPiA+IDAwMDAwMDAwMDAw
MC4uYzVhZWExNWEzNzE0DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZlcnMvY2xr
L3JlYWx0ZWsvY29tbW9uLmMNCj4gPiBAQCAtMCwwICsxLDY3IEBADQo+ID4gKy8vIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkNCj4gPiArLyoNCj4gPiArICogQ29weXJpZ2h0
IChDKSAyMDE5IFJlYWx0ZWsgU2VtaWNvbmR1Y3RvciBDb3Jwb3JhdGlvbg0KPiANCj4gSWYgeW91
IGFyZSBtYWtpbmcgY2hhbmdlcyBoZXJlLCBzaG91bGQgdGhlIGNvcHlyaWdodHMgYmUgdXBkYXRl
ZCB0byBpbmNsdWRlDQo+IDIwMjY/DQo+IA0KDQpBZ3JlZWQuIFdpbGwgaW5jbHVkZSAyMDI2Lg0K
DQo+ID4gKyAqIEF1dGhvcjogQ2hlbmctWXUgTGVlIDxjeWxlZTEyQHJlYWx0ZWsuY29tPiAqLw0K
PiA+ICsNCj4gPiArI2luY2x1ZGUgPGxpbnV4L2F1eGlsaWFyeV9idXMuaD4NCj4gPiArI2luY2x1
ZGUgPGxpbnV4L2RldmljZS5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvbWZkL3N5c2Nvbi5oPg0K
PiA+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9wbGF0
Zm9ybV9kZXZpY2UuaD4NCj4gPiArI2luY2x1ZGUgImNvbW1vbi5oIg0KPiA+ICsNCj4gPiArc3Rh
dGljIGludCBydGtfcmVzZXRfY29udHJvbGxlcl9yZWdpc3RlcihzdHJ1Y3QgZGV2aWNlICpkZXYs
IGNvbnN0DQo+ID4gK2NoYXIgKmF1eF9uYW1lKSB7DQo+ID4gKyAgICAgc3RydWN0IGF1eGlsaWFy
eV9kZXZpY2UgKmFkZXY7DQo+ID4gKw0KPiA+ICsgICAgIGlmICghb2ZfcHJvcGVydHlfcHJlc2Vu
dChkZXYtPm9mX25vZGUsICIjcmVzZXQtY2VsbHMiKSkNCj4gPiArICAgICAgICAgICAgIHJldHVy
biAwOw0KPiA+ICsNCj4gPiArICAgICBhZGV2ID0gZGV2bV9hdXhpbGlhcnlfZGV2aWNlX2NyZWF0
ZShkZXYsIGF1eF9uYW1lLCBOVUxMKTsNCj4gPiArDQo+ID4gKyAgICAgaWYgKElTX0VSUihhZGV2
KSkNCj4gPiArICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKGFkZXYpOw0KPiA+ICsgICAgIHJl
dHVybiAwOw0KPiANCj4gQWRkIG5ld2xpbmUgYmVmb3JlIHJldHVybi4NCj4gDQoNCkFjay4NCg0K
PiA+ICt9DQo+ID4gKw0KPiA+ICtpbnQgcnRrX2Nsa19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2LCBjb25zdCBzdHJ1Y3QgcnRrX2Nsa19kZXNjDQo+ICpkZXNjLA0KPiA+ICsgICAg
ICAgICAgICAgICBjb25zdCBjaGFyICphdXhfbmFtZSkNCj4gPiArew0KPiA+ICsgICAgIGludCBp
LCByZXQ7DQo+ID4gKyAgICAgc3RydWN0IHJlZ21hcCAqcmVnbWFwOw0KPiA+ICsgICAgIHN0cnVj
dCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7DQo+IA0KPiBQdXQgdmFyaWFibGVzIGluIHJldmVy
c2UgQ2hyaXN0bWFzIHRyZWUgb3JkZXIuDQo+IA0KDQpBY2suDQoNCj4gPiArDQo+ID4gKyAgICAg
cmVnbWFwID0gZGV2aWNlX25vZGVfdG9fcmVnbWFwKHBkZXYtPmRldi5vZl9ub2RlKTsNCj4gPiAr
ICAgICBpZiAoSVNfRVJSKHJlZ21hcCkpDQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gZGV2X2Vy
cl9wcm9iZShkZXYsIFBUUl9FUlIocmVnbWFwKSwgImZhaWxlZCB0bw0KPiA+ICsgZ2V0IHJlZ21h
cFxuIik7DQo+ID4gKw0KPiA+ICsgICAgIGZvciAoaSA9IDA7IGkgPCBkZXNjLT5udW1fY2xrczsg
aSsrKQ0KPiA+ICsgICAgICAgICAgICAgZGVzYy0+Y2xrc1tpXS0+cmVnbWFwID0gcmVnbWFwOw0K
PiA+ICsNCj4gPiArICAgICBmb3IgKGkgPSAwOyBpIDwgZGVzYy0+Y2xrX2RhdGEtPm51bTsgaSsr
KSB7DQo+ID4gKyAgICAgICAgICAgICBzdHJ1Y3QgY2xrX2h3ICpodyA9IGRlc2MtPmNsa19kYXRh
LT5od3NbaV07DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgaWYgKCFodykNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgY29udGludWU7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgcmV0ID0g
ZGV2bV9jbGtfaHdfcmVnaXN0ZXIoZGV2LCBodyk7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAg
aWYgKHJldCkgew0KPiANCj4gUmVtb3ZlIG5ld2xpbmUgYmVmb3JlIGlmLg0KPg0KDQpBY2suDQoN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgZGV2X3dhcm4oZGV2LCAiZmFpbGVkIHRvIHJlZ2lz
dGVyIGh3IG9mIGNsayVkOg0KPiAlZFxuIiwgaSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcmV0KTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgZGVzYy0+Y2xrX2RhdGEt
Pmh3c1tpXSA9IE5VTEw7DQo+IA0KPiBUaGlzIGNodW5rIGRvZXNuJ3QgdGFrZSBpbnRvIGFjY291
bnQgcHJvYmUgZGVmZXJyYWxzLg0KDQpXaWxsIHJldHVybiBlcnJvciBoZXJlLg0KDQpCZXN0IFJl
Z2FyZHMsDQpZdS1DaHVuDQoNCj4gDQo+IEJyaWFuDQo=

