Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B12CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 10:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ugxfiulw+EAp1DFH2y/1hWh2xw6aK0sIEzwG6s+wSgI=; b=YtrhgP8ti0SPD+Za7RZQZCERAQ
	Hmw+NJti5O/J2Ab8vq68cOlyZniqVvragTP7T2l1s9qBM4tGWJxlzW/3ppBTGOM9VI9CoobGh81iw
	liYAKYJMdpxionUspho2NvVl5kzFxQt58C+VmBS0CIIDZU8IlXOeHISpaFjPXq57keeEGlOJxO5t5
	74gNotF/To/uk+aJv50PazHvUnarUPswsg8ascgeEnLEv2U99ZOj0DFwtDpvQH/oPar0Jw/Gg2Oja
	RzTS2Pkc9ATgg+WFop6JrOi5DtWcgUfOUKUAt3Q091xhg4BvI4fgC6/Yx48FBZmwGhq/ym38oH61Q
	dcI1PHKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcgxV-00000008xYY-0Cio;
	Thu, 25 Jun 2026 10:05:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcgxT-00000008xYD-3JJm;
	Thu, 25 Jun 2026 10:05:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ugxfiulw+EAp1DFH2y/1hWh2xw6aK0sIEzwG6s+wSgI=; b=clIU5l1ftOJrfrNANexsrZiZJ4
	rBFAbXWP7t5sn2GMw67T8Zq1fLue536BrB2w3TGp5AE1tK2FhPUVF0dusWh76JuThqs/LM86GJL7r
	wicTXECyZi0GmJmqfqDd2SXJG+BqTfZfbFbf9cuEAW+sFP7HR5Dz98x4RttYad7oKxPMtvMhm/FWH
	Jqa0qw/ufnT2qK5urjqsSsA2dBKACCupV/dx6N+Ku8XEaLnYbcKvVPiYHwZMM+T1kHWa/zR2pCB2p
	gGCTr1T7QZS4qgi7pUCPR1VlqQa+e5Lii920n7i4H1sSvI4F8yND2uUDbXQ7G6rhRwSwMn2PK4Qoz
	J2nHoldQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wcgxQ-00000003SKK-1Yes;
	Thu, 25 Jun 2026 10:05:18 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 65PA56fU4718355, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1782381906; bh=ugxfiulw+EAp1DFH2y/1hWh2xw6aK0sIEzwG6s+wSgI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=ZEAp4XH+Ig00DX/SaHL26IILIdmxbfs1GSVz39CXhmQXTHM/hoo/NdWwsElQug1cN
	 3BU0oBj59TI7/UzCWQ/u+K4obp1cvOncxKdvWNMkkcV3pow+4uFOBL9ZMmgfEBjbjE
	 rav0TjzBKIenRnJ+INSz468PWyYaA2HNj6pj6RyQPPXHOq6hL/aFyK2X3vqN5Alw6f
	 69cR1pBu0bjhUhdSaac3NQZ5Jy43Gi3cI1jfrsme0e6sO4IVDEPYwUbME7c9j+e/j/
	 nldp1677BuQ0JcbZbNAgIpVVzsExNl+OVyEnYSF9PzvK/z/SkTHfZ3gD/Lzhq3NzQ9
	 i4y57fzNaVP7w==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 65PA56fU4718355
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 Jun 2026 18:05:06 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 25 Jun 2026 18:05:04 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Thu, 25 Jun 2026 18:05:04 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
	"afaerber@suse.com" <afaerber@suse.com>,
	=?utf-8?B?SnlhbiBDaG91IFvlkajoirflrold?= <jyanchou@realtek.com>,
	"bmasney@redhat.com" <bmasney@redhat.com>
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
Subject: RE: [PATCH v9 04/12] reset: realtek: Add RTD1625-ISO reset controller
 driver
Thread-Topic: [PATCH v9 04/12] reset: realtek: Add RTD1625-ISO reset
 controller driver
Thread-Index: AQHdA8zC/zONM9TlNk2rSzncAW5GibZNJgWAgAHmVNA=
Date: Thu, 25 Jun 2026 10:05:04 +0000
Message-ID: <f3b747e20110424c8a434cbd271edb87@realtek.com>
References: <20260624112940.3475605-1-eleanor.lin@realtek.com>
	 <20260624112940.3475605-5-eleanor.lin@realtek.com>
 <9db83aa615f43ff6eac090626b43915fcd593a25.camel@pengutronix.de>
In-Reply-To: <9db83aa615f43ff6eac090626b43915fcd593a25.camel@pengutronix.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_110517_267224_73549801 
X-CRM114-Status: GOOD (  32.64  )
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

SGkgUGhpbGlwcCwNCg0KPiBPbiBNaSwgMjAyNi0wNi0yNCBhdCAxOToyOSArMDgwMCwgWXUtQ2h1
biBMaW4gd3JvdGU6DQo+ID4gRnJvbTogQ2hlbmctWXUgTGVlIDxjeWxlZTEyQHJlYWx0ZWsuY29t
Pg0KPiA+DQo+ID4gQWRkIHN1cHBvcnQgZm9yIHRoZSBJU08gKElzb2xhdGlvbikgZG9tYWluIHJl
c2V0IGNvbnRyb2xsZXIgb24gdGhlDQo+ID4gUmVhbHRlaw0KPiA+IFJURDE2MjUgU29DLg0KPiA+
DQo+ID4gVGhlIHJlc2V0IGNvbnRyb2xsZXIgc2hhcmVzIHRoZSBzYW1lIHJlZ2lzdGVyIHNwYWNl
IHdpdGggdGhlIElTTyBjbG9jaw0KPiA+IGNvbnRyb2xsZXIuIFRvIGhhbmRsZSB0aGlzIHNoYXJl
ZCByZWdpc3RlciBzcGFjZSwgdGhlIHJlc2V0IGRyaXZlciBpcw0KPiA+IGltcGxlbWVudGVkIGFz
IGFuIGF1eGlsaWFyeSBkcml2ZXIuIEl0IHdpbGwgYmUgaW5zdGFudGlhdGVkIGFuZCBwcm9iZWQN
Cj4gPiB2aWEgdGhlIGF1eGlsaWFyeSBidXMgYnkgdGhlIFJURDE2MjUtSVNPIGNsb2NrIGNvbnRy
b2xsZXIgZHJpdmVyLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2hlbmctWXUgTGVlIDxjeWxl
ZTEyQHJlYWx0ZWsuY29tPg0KPiA+IENvLWRldmVsb3BlZC1ieTogWXUtQ2h1biBMaW4gPGVsZWFu
b3IubGluQHJlYWx0ZWsuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFl1LUNodW4gTGluIDxlbGVh
bm9yLmxpbkByZWFsdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiBDaGFuZ2VzIGluIHY5Og0KPiA+IC0g
RXh0cmFjdCByZXNldC1yZWxhdGVkIGNvZGUgZnJvbSB0aGUgcHJldmlvdXMgY2xvY2sgZHJpdmVy
IHBhdGNoDQo+ID4gKGZvcm1lcmx5IHBhdGNoIDkgaW4gdjgpLg0KPiA+IC0tLQ0KPiA+ICBkcml2
ZXJzL3Jlc2V0L3JlYWx0ZWsvTWFrZWZpbGUgICAgICAgICAgICB8ICAyICstDQo+ID4gIGRyaXZl
cnMvcmVzZXQvcmVhbHRlay9yZXNldC1ydGQxNjI1LWlzby5jIHwgOTkNCj4gPiArKysrKysrKysr
KysrKysrKysrKysrKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEwMCBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBkcml2ZXJzL3Jlc2V0L3JlYWx0
ZWsvcmVzZXQtcnRkMTYyNS1pc28uYw0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVz
ZXQvcmVhbHRlay9NYWtlZmlsZQ0KPiA+IGIvZHJpdmVycy9yZXNldC9yZWFsdGVrL01ha2VmaWxl
IGluZGV4IGMzZjYwNWZmYjExYy4uOTAwN2M5ZDU2ODNiDQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy9yZXNldC9yZWFsdGVrL01ha2VmaWxlDQo+ID4gKysrIGIvZHJpdmVycy9yZXNldC9y
ZWFsdGVrL01ha2VmaWxlDQo+ID4gQEAgLTEsMyArMSwzIEBADQo+ID4gICMgU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQ0KPiA+ICBvYmotJChDT05GSUdfUkVTRVRfUlRLX0NP
TU1PTikgKz0gcmVzZXQtcnRrLWNvbW1vbi5vDQo+ID4gLW9iai0kKENPTkZJR19SRVNFVF9SVEQx
NjI1KSArPSByZXNldC1ydGQxNjI1LWNydC5vDQo+ID4gK29iai0kKENPTkZJR19SRVNFVF9SVEQx
NjI1KSArPSByZXNldC1ydGQxNjI1LWNydC5vDQo+ID4gK3Jlc2V0LXJ0ZDE2MjUtaXNvLm8NCj4g
DQo+IElzIHRoZXJlIGFueSBiZW5lZml0IHRvIHRoZXNlIHR3byBiZWluZyBzZXBhcmF0ZSBtb2R1
bGVzPw0KPiBJIHN1Z2dlc3QgeW91IG1lcmdlIHRoZW0gaW50byBvbmU6IHJlc2V0LXJ0ZDE2MjUu
bw0KPiANCg0KSWYgSSBtZXJnZSB0aGVtIGludG8gYSBzaW5nbGUgJ3Jlc2V0LXJ0ZDE2MjUnIG1v
ZHVsZSwNCmJvdGggdGhlICdjcnQnIGFuZCAnaXNvJyBjbG9jayBkcml2ZXJzIHdvdWxkIHRyaWdn
ZXIgdGhlIHByb2JlDQpwcm9jZXNzIGZvciB0aGUgc2FtZSByZXNldCBkcml2ZXIgbmFtZSwgd2hp
Y2ggd291bGQgbGVhZCB0byBhDQpkdXBsaWNhdGUgZHJpdmVyIHJlZ2lzdHJhdGlvbiBlcnJvci4N
Cg0KVGhlcmVmb3JlLCBJIHdvdWxkIHByZWZlciB0byBrZWVwIHRoZW0gc2VwYXJhdGUuDQoNCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZXNldC9yZWFsdGVrL3Jlc2V0LXJ0ZDE2MjUtaXNvLmMN
Cj4gPiBiL2RyaXZlcnMvcmVzZXQvcmVhbHRlay9yZXNldC1ydGQxNjI1LWlzby5jDQo+ID4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjc4ZWFhYmI0MDhmMA0K
PiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL3Jlc2V0L3JlYWx0ZWsvcmVzZXQt
cnRkMTYyNS1pc28uYw0KPiA+IEBAIC0wLDAgKzEsOTkgQEANCj4gPiArLy8gU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQ0KPiA+ICsvKg0KPiA+ICsgKiBDb3B5cmlnaHQgKEMp
IDIwMjYgUmVhbHRlayBTZW1pY29uZHVjdG9yIENvcnBvcmF0aW9uICAqLw0KPiA+ICsNCj4gPiAr
I2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Jlc2V0L3JlYWx0ZWsscnRkMTYyNS5oPg0KPiA+ICsjaW5j
bHVkZSA8bGludXgvYXV4aWxpYXJ5X2J1cy5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvZGV2aWNl
Lmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9lcnJuby5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgv
b2YuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4NCj4gPiArI2luY2x1ZGUgInJlc2V0
LXJ0ay1jb21tb24uaCINCj4gPiArDQo+ID4gKyNkZWZpbmUgUlREMTYyNV9JU09fUlNUTl9NQVgg
MjkNCj4gPiArI2RlZmluZSBSVEQxNjI1X0lTT19TX1JTVE5fTUFYICAgICAgIDUNCj4gDQo+IFRo
ZXNlIGFyZSBub3QgbmVjZXNzYXJ5LCBqdXN0IHVzZSBBUlJBWV9TSVpFKCkgZm9yIG5yX3Jlc2V0
cy4NCj4gDQoNCkFjay4NCg0KPiA+ICsNCg0KWy4uLl0NCg0KPiA+ICsNCj4gPiArc3RhdGljIGlu
dCBydGQxNjI1X2lzb19yZXNldF9wcm9iZShzdHJ1Y3QgYXV4aWxpYXJ5X2RldmljZSAqYWRldiwN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgYXV4aWxp
YXJ5X2RldmljZV9pZCAqaWQpDQo+ID4gK3sNCj4gPiArICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYg
PSAmYWRldi0+ZGV2Ow0KPiA+ICsgICAgIHN0cnVjdCBkZXZpY2UgKnBhcmVudCA9IGRldi0+cGFy
ZW50Ow0KPiA+ICsgICAgIHN0cnVjdCBydGtfcmVzZXRfZGF0YSAqZGF0YTsNCj4gPiArDQo+ID4g
KyAgICAgZGF0YSA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqZGF0YSksIEdGUF9LRVJORUwp
Ow0KPiA+ICsgICAgIGlmICghZGF0YSkNCj4gPiArICAgICAgICAgICAgIHJldHVybiAtRU5PTUVN
Ow0KPiA+ICsNCj4gPiArICAgICBpZiAob2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUocGFyZW50LT5v
Zl9ub2RlLA0KPiAicmVhbHRlayxydGQxNjI1LWlzby1zLWNsayIpKSB7DQo+ID4gKyAgICAgICAg
ICAgICBkYXRhLT5kZXNjcyAgICAgICAgICAgPSBydGQxNjI1X2lzb19zX3Jlc2V0X2Rlc2NzOw0K
PiA+ICsgICAgICAgICAgICAgZGF0YS0+cmNkZXYubnJfcmVzZXRzID0gUlREMTYyNV9JU09fU19S
U1ROX01BWDsNCj4gPiArICAgICB9IGVsc2Ugew0KPiA+ICsgICAgICAgICAgICAgZGF0YS0+ZGVz
Y3MgICAgICAgICAgID0gcnRkMTYyNV9pc29fcmVzZXRfZGVzY3M7DQo+ID4gKyAgICAgICAgICAg
ICBkYXRhLT5yY2Rldi5ucl9yZXNldHMgPSBSVEQxNjI1X0lTT19SU1ROX01BWDsNCj4gPiArICAg
ICB9DQo+IA0KPiBObyBuZWVkIHRvIHBhcnNlIE9GIGNvbXBhdGlibGUgYWdhaW4uIFN0b3JlIHRo
ZXNlIGluIGEgc3RydWN0LCBwb2ludA0KPiBhdXhpbGlhcnlfZGV2aWNlX2lkOjpkcml2ZXJfZGF0
YSB0byBpdCwgYW5kIHVzZSB0aGF0IGhlcmUuDQo+IA0KPiByZWdhcmRzDQo+IFBoaWxpcHANCg0K
QWdyZWVkLCBJIHdpbGwgZG8gaXQgaW4gdjEwLiBUaGFua3MuDQoNCkJlc3QgUmVnYXJkcywNCll1
LUNodW4NCg==

