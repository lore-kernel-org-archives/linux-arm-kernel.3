Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E469FFB5EA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 02:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sNM9Jb14J0evq05XH4j8QBYQXMrFLpykRBjI7g6ADVk=; b=Zax0lfwA8ED0wi25F78nIiDTC0
	bmZTq915KIJ6cRwRwCcOvGZmtD3+NH3WBr34RXm31ansC/hQ/MMeK9JsfOX65PU1e9WifGkhhPKoh
	pUEg5Dp4zswsgp6MPm3XiJ5ELJpnwvKX5RLGOc1Y6Iy7bzSxY58/6TifEmwgKUJVFJCIrGTZu7N78
	UHh/VEG+g8uO63t+FsfqNIV2hjFhiszOnihC5jtpnWjS+hkK+k1z8VSIQTd2V0Zral5S2SPGjis/k
	h3NIbXb+E9xxdiu+zx+ZBEBcUgYr6HTVwbAiRsqydEfV6e9t4EgXd2+WvXGthfQLIBUiWIf4DvsFC
	wuWuzeVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2JvZ-00000005EXi-3Zlv;
	Tue, 17 Mar 2026 02:13:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2JvX-00000005EXT-2nxN;
	Tue, 17 Mar 2026 02:13:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sNM9Jb14J0evq05XH4j8QBYQXMrFLpykRBjI7g6ADVk=; b=Fmaz+1GdyxpfxgqVdrwsNnDiEo
	hHE/KpK7b3+y/pQ18HIbYLs1SYgpwkF8lf6SEJD6RLfxwwxGwFaPhVqj4mdZxU4QQrU8cT0B0VSU9
	FKwkQcxOuPD6D+M1AllCqvS0QTRYamoZCZLrdCJ3XO7fyb3d2sWrPp9sqkvgMT941/ouU8gYiW67a
	S9AC8b4zFtSiVkeawdxRPITCuKtz0jMwf33WK/vE3qCu99LcpcI8Odr2j9C/lm0H17ul+birGPyGi
	DhBashXAi6C6txwydlv0lp+gwYdlDAmm4AKTESIr3NWy90G0+OWFenAkYCHpYRQ2Ao5ifXxcGsvfi
	dfm4MScw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2JvR-00000007ygO-2vHU;
	Tue, 17 Mar 2026 02:12:57 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62H2CfpzE3055258, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773713561; bh=sNM9Jb14J0evq05XH4j8QBYQXMrFLpykRBjI7g6ADVk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=akcU5cmHjbxrgodtLbWMaIhrjCiMnSLpDvxt5Yorv5xtWy+n0Bbfc5l2Wa5F/FwjV
	 V+i918H2w54XUyolsVkvB7XmOnL3cYN/PGj6fUn5KPHuuqWVjyYhAf9izPsGtWhmLd
	 Lc0338Z50uQdXDs25YPLgYQeZIqjzvCRLqOfrlgjBMS4fV+sZKroSFB2LB863rwv+p
	 tMVeD8nkjxNzH6E8y07RcjA5vnHpUiI92TG2Uok5acy9R+tN4eVe8bp9He5G0lbaM4
	 6rGrw8BQUBbL9l3YV3E66UI4ga1sA0mVikO8UeP765Jpfm0fDYoyWgriJcbKYLTy9m
	 NJrDJ6iZnKqEA==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62H2CfpzE3055258
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Mar 2026 10:12:41 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 17 Mar 2026 10:12:40 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913%10]) with mapi id
 15.02.1748.010; Tue, 17 Mar 2026 10:12:40 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org"
	<sboyd@kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        =?utf-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
        "afaerber@suse.com" <afaerber@suse.com>,
        =?utf-8?B?SnlhbiBDaG91IFvlkajoirflrold?= <jyanchou@realtek.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
        =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
        =?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
        =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>
Subject: RE: [PATCH v4 03/10] clk: realtek: Add basic reset support
Thread-Topic: [PATCH v4 03/10] clk: realtek: Add basic reset support
Thread-Index: AQHcssDuibSAuLJXXUaZv+it/w6wirWtO6QAgATF4ZA=
Date: Tue, 17 Mar 2026 02:12:40 +0000
Message-ID: <907b6a0128904309991f0a4a9000d8f1@realtek.com>
References: <20260313081100.596224-1-eleanor.lin@realtek.com>
 <20260313081100.596224-4-eleanor.lin@realtek.com>
 <20260314-silky-goshawk-of-penetration-f00964@quoll>
In-Reply-To: <20260314-silky-goshawk-of-penetration-f00964@quoll>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_021255_537781_576A176F 
X-CRM114-Status: GOOD (  30.22  )
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

PiBPbiBGcmksIE1hciAxMywgMjAyNiBhdCAwNDoxMDo1M1BNICswODAwLCBZdS1DaHVuIExpbiB3
cm90ZToNCj4gPiBGcm9tOiBDaGVuZy1ZdSBMZWUgPGN5bGVlMTJAcmVhbHRlay5jb20+DQo+ID4N
Cj4gPiBEZWZpbmUgdGhlIHJlc2V0IG9wZXJhdGlvbnMgYmFja2VkIGJ5IGEgcmVnbWFwLWJhc2Vk
IHJlZ2lzdGVyDQo+ID4gaW50ZXJmYWNlIGFuZCBwcmVwYXJlIHRoZSByZXNldCBjb250cm9sbGVy
IHRvIGJlIHJlZ2lzdGVyZWQgdGhyb3VnaA0KPiA+IHRoZSByZXNldCBmcmFtZXdvcmsuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGVuZy1ZdSBMZWUgPGN5bGVlMTJAcmVhbHRlay5jb20+DQo+
ID4gQ28tZGV2ZWxvcGVkLWJ5OiBZdS1DaHVuIExpbiA8ZWxlYW5vci5saW5AcmVhbHRlay5jb20+
DQo+ID4gU2lnbmVkLW9mZi1ieTogWXUtQ2h1biBMaW4gPGVsZWFub3IubGluQHJlYWx0ZWsuY29t
Pg0KPiA+IC0tLQ0KPiA+IENoYW5nZXMgaW4gdjQ6DQo+ID4gLSBBZGQgZm9yd2FyZCBkZWNsYXJh
dGlvbiBmb3Igc3RydWN0IHJlZ21hcCBpbiByZXNldC5oLg0KPiA+IC0gTW92ZSBzdHJ1Y3QgcnRr
X3Jlc2V0X2RhdGEgZGVmaW5pdGlvbiBpbnRvIHJlc2V0LmMgYXMgaXQncyBvbmx5IHVzZWQgdGhl
cmUuDQo+ID4gLSBSZW1vdmUgcnRrX3Jlc2V0X3Jlc2V0KCkgZHVlIHRvIHVubmVjZXNzYXJ5IGlt
cGxlbWVudGF0aW9uLg0KPiA+IC0gUmVtb3ZlIHVubmVjZXNzYXJ5IHBhcmFtZXRlciBmcm9tIHJ0
a19yZXNldF9nZXRfaWQoKS4NCj4gPiAtLS0NCj4gPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAg
ICAgICB8ICAgMSArDQo+ID4gIGRyaXZlcnMvY2xrL0tjb25maWcgICAgICAgICAgfCAgIDEgKw0K
PiA+ICBkcml2ZXJzL2Nsay9NYWtlZmlsZSAgICAgICAgIHwgICAxICsNCj4gPiAgZHJpdmVycy9j
bGsvcmVhbHRlay9LY29uZmlnICB8ICAyNyArKysrKysrKysrDQo+ID4gIGRyaXZlcnMvY2xrL3Jl
YWx0ZWsvTWFrZWZpbGUgfCAgIDQgKysNCj4gPiAgZHJpdmVycy9jbGsvcmVhbHRlay9yZXNldC5j
ICB8IDEwNA0KPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIGRy
aXZlcnMvY2xrL3JlYWx0ZWsvcmVzZXQuaCAgfCAgMjggKysrKysrKysrKw0KPiA+ICA3IGZpbGVz
IGNoYW5nZWQsIDE2NyBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2Nsay9yZWFsdGVrL0tjb25maWcgIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IGRyaXZlcnMv
Y2xrL3JlYWx0ZWsvTWFrZWZpbGUgIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IGRyaXZlcnMvY2xr
L3JlYWx0ZWsvcmVzZXQuYyAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gZHJpdmVycy9jbGsvcmVh
bHRlay9yZXNldC5oDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJ
TkVSUyBpbmRleA0KPiA+IDliN2Q2NGNjOGQ5MC4uNTNhMmYzNTc1YzM3IDEwMDY0NA0KPiA+IC0t
LSBhL01BSU5UQUlORVJTDQo+ID4gKysrIGIvTUFJTlRBSU5FUlMNCj4gPiBAQCAtMjIyNDcsNiAr
MjIyNDcsNyBAQCBMOiAgICBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZw0KPiA+ICBMOiAgIGxp
bnV4LWNsa0B2Z2VyLmtlcm5lbC5vcmcNCj4gPiAgUzogICBTdXBwb3J0ZWQNCj4gPiAgRjogICBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svcmVhbHRlayoNCj4gPiArRjog
ICBkcml2ZXJzL2Nsay9yZWFsdGVrLyoNCj4gPiAgRjogICBpbmNsdWRlL2R0LWJpbmRpbmdzL2Ns
b2NrL3JlYWx0ZWsqDQo+ID4NCj4gPiAgUkVBTFRFSyBTUEktTkFORA0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2Nsay9LY29uZmlnIGIvZHJpdmVycy9jbGsvS2NvbmZpZyBpbmRleA0KPiA+IDNk
ODAzYjRjZjVjMS4uZDYwZjY0MTViMGEzIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvY2xrL0tj
b25maWcNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9LY29uZmlnDQo+ID4gQEAgLTUxOSw2ICs1MTks
NyBAQCBzb3VyY2UgImRyaXZlcnMvY2xrL251dm90b24vS2NvbmZpZyINCj4gPiAgc291cmNlICJk
cml2ZXJzL2Nsay9waXN0YWNoaW8vS2NvbmZpZyINCj4gPiAgc291cmNlICJkcml2ZXJzL2Nsay9x
Y29tL0tjb25maWciDQo+ID4gIHNvdXJjZSAiZHJpdmVycy9jbGsvcmFsaW5rL0tjb25maWciDQo+
ID4gK3NvdXJjZSAiZHJpdmVycy9jbGsvcmVhbHRlay9LY29uZmlnIg0KPiA+ICBzb3VyY2UgImRy
aXZlcnMvY2xrL3JlbmVzYXMvS2NvbmZpZyINCj4gPiAgc291cmNlICJkcml2ZXJzL2Nsay9yb2Nr
Y2hpcC9LY29uZmlnIg0KPiA+ICBzb3VyY2UgImRyaXZlcnMvY2xrL3NhbXN1bmcvS2NvbmZpZyIN
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvTWFrZWZpbGUgYi9kcml2ZXJzL2Nsay9NYWtl
ZmlsZSBpbmRleA0KPiA+IGY3YmNlMzk1MWEzMC4uNjliODRkMWU3YmNjIDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvY2xrL01ha2VmaWxlDQo+ID4gKysrIGIvZHJpdmVycy9jbGsvTWFrZWZpbGUN
Cj4gPiBAQCAtMTQwLDYgKzE0MCw3IEBAIG9iai0kKENPTkZJR19DT01NT05fQ0xLX1BJU1RBQ0hJ
TykNCj4gKz0gcGlzdGFjaGlvLw0KPiA+ICBvYmotJChDT05GSUdfQ09NTU9OX0NMS19QWEEpICAg
ICAgICAgKz0gcHhhLw0KPiA+ICBvYmotJChDT05GSUdfQ09NTU9OX0NMS19RQ09NKSAgICAgICAg
ICAgICAgICArPSBxY29tLw0KPiA+ICBvYmoteSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICArPSByYWxpbmsvDQo+ID4gK29iai0kKENPTkZJR19DT01NT05fQ0xLX1JFQUxU
RUspICAgICArPSByZWFsdGVrLw0KPiA+ICBvYmoteSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICArPSByZW5lc2FzLw0KPiA+ICBvYmotJChDT05GSUdfQVJDSF9ST0NLQ0hJ
UCkgICAgICAgICAgKz0gcm9ja2NoaXAvDQo+ID4gIG9iai0kKENPTkZJR19DT01NT05fQ0xLX1NB
TVNVTkcpICAgICArPSBzYW1zdW5nLw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9yZWFs
dGVrL0tjb25maWcgYi9kcml2ZXJzL2Nsay9yZWFsdGVrL0tjb25maWcNCj4gPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NCBpbmRleCAwMDAwMDAwMDAwMDAuLjEyMTE1OGYxMWRkMQ0KPiA+IC0tLSAvZGV2
L251bGwNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9yZWFsdGVrL0tjb25maWcNCj4gPiBAQCAtMCww
ICsxLDI3IEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSBj
b25maWcgQ09NTU9OX0NMS19SRUFMVEVLDQo+ID4gKyAgICAgYm9vbCAiQ2xvY2sgZHJpdmVyIGZv
ciBSZWFsdGVrIFNvQ3MiDQo+ID4gKyAgICAgZGVwZW5kcyBvbiBBUkNIX1JFQUxURUsgfHwgQ09N
UElMRV9URVNUDQo+ID4gKyAgICAgZGVmYXVsdCB5DQo+ID4gKyAgICAgaGVscA0KPiA+ICsgICAg
ICAgRW5hYmxlIHRoZSBjb21tb24gY2xvY2sgZnJhbWV3b3JrIGluZnJhc3RydWN0dXJlIGZvciBS
ZWFsdGVrDQo+ID4gKyAgICAgICBzeXN0ZW0tb24tY2hpcCBwbGF0Zm9ybXMuDQo+ID4gKw0KPiA+
ICsgICAgICAgVGhpcyBwcm92aWRlcyB0aGUgYmFzZSBzdXBwb3J0IHJlcXVpcmVkIGJ5IGluZGl2
aWR1YWwgUmVhbHRlaw0KPiA+ICsgICAgICAgY2xvY2sgY29udHJvbGxlciBkcml2ZXJzIHRvIGV4
cG9zZSBjbG9ja3MgdG8gcGVyaXBoZXJhbCBkZXZpY2VzLg0KPiA+ICsNCj4gPiArICAgICAgIElm
IHlvdSBoYXZlIGEgUmVhbHRlay1iYXNlZCBwbGF0Zm9ybSwgc2F5IFkuDQo+ID4gKw0KPiA+ICtp
ZiBDT01NT05fQ0xLX1JFQUxURUsNCj4gPiArDQo+ID4gK2NvbmZpZyBSVEtfQ0xLX0NPTU1PTg0K
PiA+ICsgICAgIHRyaXN0YXRlICJSZWFsdGVrIENsb2NrIENvbW1vbiINCj4gDQo+IFJlc2V0IGRy
aXZlcnMgZ28gdG8gcmVzZXQgZGlyZWN0b3J5Lg0KPg0KDQpTZXZlcmFsIHZlbmRvcnMgKGUuZy4g
cWNvbSwgbWVkaWF0ZWssIHZpc2NvbnRpKSBhbHNvIHBsYWNlIHJlc2V0IGNvZGUgaW4NCmRyaXZl
cnMvY2xrLyB3aGVuIHRoZSByZXNldCBjb250cm9sbGVyIGlzIGludGVncmF0ZWQgd2l0aCB0aGUg
Y2xvY2sgY29udHJvbGxlci4NCg0KPiA+ICsgICAgIHNlbGVjdCBSRVNFVF9DT05UUk9MTEVSDQo+
ID4gKyAgICAgaGVscA0KPiA+ICsgICAgICAgQ29tbW9uIGhlbHBlciBjb2RlIHNoYXJlZCBieSBS
ZWFsdGVrIGNsb2NrIGNvbnRyb2xsZXIgZHJpdmVycy4NCj4gPiArDQo+ID4gKyAgICAgICBUaGlz
IHByb3ZpZGVzIHV0aWxpdHkgZnVuY3Rpb25zIGFuZCBkYXRhIHN0cnVjdHVyZXMgdXNlZCBieQ0K
PiA+ICsgICAgICAgbXVsdGlwbGUgUmVhbHRlayBjbG9jayBpbXBsZW1lbnRhdGlvbnMsIGFuZCBp
bmNsdWRlIGludGVncmF0aW9uDQo+ID4gKyAgICAgICB3aXRoIHJlc2V0IGNvbnRyb2xsZXJzIHdo
ZXJlIHJlcXVpcmVkLg0KPiA+ICsNCj4gPiArZW5kaWYNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9jbGsvcmVhbHRlay9NYWtlZmlsZQ0KPiA+IGIvZHJpdmVycy9jbGsvcmVhbHRlay9NYWtlZmls
ZSBuZXcgZmlsZSBtb2RlIDEwMDY0NCBpbmRleA0KPiA+IDAwMDAwMDAwMDAwMC4uNTIyNjdkZTJl
ZWY0DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3JlYWx0ZWsvTWFr
ZWZpbGUNCj4gPiBAQCAtMCwwICsxLDQgQEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMC1vbmx5DQo+ID4gK29iai0kKENPTkZJR19SVEtfQ0xLX0NPTU1PTikgKz0gY2xr
LXJ0ay5vDQo+ID4gKw0KPiA+ICtjbGstcnRrLXkgKz0gcmVzZXQubw0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2Nsay9yZWFsdGVrL3Jlc2V0LmMgYi9kcml2ZXJzL2Nsay9yZWFsdGVrL3Jlc2V0
LmMNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NCBpbmRleCAwMDAwMDAwMDAwMDAuLjQ1NzEzNzg1
ZDc2ZA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL2Nsay9yZWFsdGVrL3Jl
c2V0LmMNCj4gPiBAQCAtMCwwICsxLDEwNCBAQA0KPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMC1vbmx5DQo+ID4gKy8qDQo+ID4gKyAqIENvcHlyaWdodCAoQykgMjAxOSBS
ZWFsdGVrIFNlbWljb25kdWN0b3IgQ29ycG9yYXRpb24gICovDQo+ID4gKw0KPiA+ICsjaW5jbHVk
ZSA8bGludXgvZGV2aWNlLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9vZi5oPg0KPiA+ICsjaW5j
bHVkZSA8bGludXgvcmVnbWFwLmg+DQo+ID4gKyNpbmNsdWRlICJyZXNldC5oIg0KPg0KPiBBbmQg
aGVyZSBpcyB0aGUgcHJvb2YgdGhhdCBub25lIG9mIHlvdXIgcmVzZXQgaGVhZGVyIGNvbnN0YW50
cyBhcmUgYmluZGluZ3MgLQ0KPiBkbyB5b3Ugc2VlIHRoZSBoZWFkZXIgaGVyZSBhYm92ZT8gTm8u
DQo+DQoNClRoZSBiYW5rIG1hcHBpbmcgaXMgaW1wbGljaXRseSBoYXJkY29kZWQgaW4gZHJpdmVy
czoNCg0KRXhhbXBsZTogY2xrLXJ0ZDE2MjUtY3J0LmMNCg0Kc3RhdGljIHN0cnVjdCBydGtfcmVz
ZXRfYmFuayBydGQxNjI1X2NydF9yZXNldF9iYW5rc1tdID0gew0KICAgIHsub2ZzID0gMHgwLCAu
d3JpdGVfZW4gPSAxLH0sICAgLyogQmFuayAwICovDQogICAgey5vZnMgPSAweDQsIC53cml0ZV9l
biA9IDEsfSwgICAvKiBCYW5rIDEgKi8NCiAgICB7Lm9mcyA9IDB4OCwgLndyaXRlX2VuID0gMSx9
LCAgIC8qIEJhbmsgMiAqLw0KICAgIC8qIC4uLiAqLw0KfTsNCg0KVGhlIGFycmF5IGluZGV4IGlt
cGxpY2l0bHkgY29ycmVzcG9uZHMgdG8gdGhlIGJhbmsgSUQgaW4gdGhlIGhlYWRlci4NCkluIHY1
LCBJIHdpbGwgZXhwbGljaXRseSB1c2UgdGhlIGhlYWRlciBkZWZpbmVzIHRvIG1ha2UgdGhpcyBt
YXBwaW5nDQpjbGVhcjoNCg0Kc3RhdGljIHN0cnVjdCBydGtfcmVzZXRfZGVzYyBydGQxNjI1X2Nj
X3Jlc2V0X2Rlc2NzW10gPSB7DQoJLyogQmFuayAwOiBvZmZzZXQgMHgwMDAgKi8NCglbUlREMTYy
NV9DUlRfUlNUTl9NSVNDXSA9IHsub2ZzID0gMHgwMDAsIC5iaXQgPSAwLCAgLndyaXRlX2VuID0g
MX0sDQogIFtSVEQxNjI1X0NSVF9SU1ROX0RJUF0gID0gey5vZnMgPSAweDAwMCwgLmJpdCA9IDIs
ICAud3JpdGVfZW4gPSAxfSwNCiAgLyogLi4uICovDQp9Ow0KDQpCZXN0IHJlZ2FyZHMsDQpZdS1D
aHVuDQoNCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg==

