Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9E7EFCD70
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 09:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZphVZ4RqXhL4eWRHFvl9+gGhhsng+ktPL/YDsjZRbj8=; b=MuAFzUpCJsCisS1BoVxNQq2vkS
	QdDKduwDeXmA9ijocdQaNz3eiWLSg+E+YM7XY76lwHo8TtYcjXp0E1nAhmTTMykTNrMBh0M6HdL8x
	w1Wn13ht0S6dcNNZep3l+h6qY3NAPSWri7NFF7qLyb2KBv384b4CqsblJz6v1z5R8LUFDnrGmBtUW
	JPJAWujEnYDcyI/GjGCA+SjSVvtzvpOyvE2t4IeiFxyy9dFAad7MKsDyNiGMKcpyX9l5ZOaXQBHiU
	HL/tzp7f15Zey5osh9DxzkRTH2i5KcikmmvepaDYouY5n+VN4FhY2c5cNR+QpTJlfC5lRjToKLAd4
	IpWVdpng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzX3S-00000006ypz-2oyd;
	Mon, 09 Mar 2026 09:37:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzX3R-00000006ypb-10Z3;
	Mon, 09 Mar 2026 09:37:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZphVZ4RqXhL4eWRHFvl9+gGhhsng+ktPL/YDsjZRbj8=; b=qv1I4PbQwl0v8vYLB0zINh3IQc
	xbVRuTNpuQWU5PrlNIAThnCbJq0dqUitZb8auW5eS0UIajDvA7rYssmVMUIW/hwqy+EFgHnfFUDXq
	sy191TSsNRcCfFR3Qp7oAeAF2uYFXuycqqRDtThM879agkYDGiiTUSj2w1EwehZO+gmglcvn0U533
	HxRs6jW9438EkEK5Z+B7KIQOowv8a2+Zd3aGPyi80gXlvMzFBoetfkBbZL4yGNavFXA8QzmN1GO8S
	scEgWoGJbK6t0TXQExKjmnb8f55L9M89zs61uL/timgtAVBAPcZwXPK/YDtKV9fy4xqDOyD8xxCqv
	cX+yN9og==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzX3O-0000000Bn3q-00mf;
	Mon, 09 Mar 2026 09:37:36 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6299ZFVL0292231, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773048915; bh=ZphVZ4RqXhL4eWRHFvl9+gGhhsng+ktPL/YDsjZRbj8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=SCYm3aNxq/2Z1X2JAMSMvAAiGK0DTOY6Nom2bSDpJds4XhrChx7/ADq4ebN0lYldn
	 5e21q1zfCCom4uK69emU578OQpf9mPLhGFqcTENPYXfWi99oNKn3CK0DcAyK53aqrG
	 QuxXMBz7NYDjnCfHr36Ik1zJSr/Yrs4BGjKwyS9cl26UHrqkLvinDBHJW9b9FDADRR
	 UlANON0ZBZrn2ZBarzSA2ZV/lhyM4FA/ODdD2Ed+oDhX6EjOw42ne70e997RAudCom
	 4KSQQDRP4+6P5Twy0OZkDpVZ6N0A8feFvNM29QeOJ8w9EMvMRl26//npPLJKBcA1Pw
	 AwOXzZviu6wSQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 6299ZFVL0292231
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Mar 2026 17:35:15 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 9 Mar 2026 17:35:16 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 9 Mar 2026 17:35:16 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913%10]) with mapi id
 15.02.1748.010; Mon, 9 Mar 2026 17:35:16 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "linusw@kernel.org" <linusw@kernel.org>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "bartosz.golaszewski@oss.qualcomm.com"
	<bartosz.golaszewski@oss.qualcomm.com>,
        "afaerber@suse.com"
	<afaerber@suse.com>,
        =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?=
	<james.tai@realtek.com>,
        =?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?=
	<cy.huang@realtek.com>,
        =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?=
	<stanley_chang@realtek.com>,
        =?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?=
	<tychang@realtek.com>,
        "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>
Subject: RE: [PATCH v2 11/14] dt-bindings: pinctrl: realtek: Add RTD1625
 pinctrl binding
Thread-Topic: [PATCH v2 11/14] dt-bindings: pinctrl: realtek: Add RTD1625
 pinctrl binding
Thread-Index: AQHcrT46QKJ7ZZAXa0eNtBxS5QqEirWihswAgANuBLA=
Date: Mon, 9 Mar 2026 09:35:15 +0000
Message-ID: <b112ca036212456ba80fd7bb2a035834@realtek.com>
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
 <20260306075244.1170399-12-eleanor.lin@realtek.com>
 <20260307-large-wondrous-coot-4f4ee7@quoll>
In-Reply-To: <20260307-large-wondrous-coot-4f4ee7@quoll>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_093734_692883_5CF38765 
X-CRM114-Status: GOOD (  26.16  )
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

PiBPbiBGcmksIE1hciAwNiwgMjAyNiBhdCAwMzo1Mjo0MVBNICswODAwLCBZdS1DaHVuIExpbiB3
cm90ZToNCj4gPiArICAgICAgaW5wdXQtdm9sdGFnZS1taWNyb3ZvbHQ6DQo+ID4gKyAgICAgICAg
ZGVzY3JpcHRpb246IHwNCj4gPiArICAgICAgICAgIFNlbGVjdCB0aGUgaW5wdXQgcmVjZWl2ZXIg
dm9sdGFnZSBkb21haW4gZm9yIHRoZSBwaW4uDQo+ID4gKyAgICAgICAgICBWYWxpZCBhcmd1bWVu
dHMgYXJlOg0KPiA+ICsgICAgICAgICAgLSAxODAwMDAwOiAxLjhWIGlucHV0IGxvZ2ljIGxldmVs
DQo+ID4gKyAgICAgICAgICAtIDMzMDAwMDA6IDMuM1YgaW5wdXQgbG9naWMgbGV2ZWwNCj4gPiAr
ICAgICAgICBlbnVtOiBbMTgwMDAwMCwgMzMwMDAwMF0NCj4gPiArDQo+ID4gKyAgICAgIGRyaXZl
LXB1c2gtcHVsbDogdHJ1ZQ0KPiA+ICsNCj4gPiArICAgICAgcG93ZXItc291cmNlOg0KPiA+ICsg
ICAgICAgIGRlc2NyaXB0aW9uOiB8DQo+ID4gKyAgICAgICAgICBWYWxpZCBhcmd1bWVudHMgYXJl
IGRlc2NyaWJlZCBhcyBiZWxvdzoNCj4gPiArICAgICAgICAgIDA6IHBvd2VyIHN1cHBseSBvZiAx
LjhWDQo+ID4gKyAgICAgICAgICAxOiBwb3dlciBzdXBwbHkgb2YgMy4zVg0KPiA+ICsgICAgICAg
IGVudW06IFswLCAxXQ0KPiANCj4gSXNuJ3QgdGhpcyBkdXBsaWNhdGluZyBpbnB1dC12b2x0YWdl
LW1pY3Jvdm9sdD8gV2hlcmUgZG8geW91IHVzZSBpdCBpbiB0aGUNCj4gZHJpdmVyPw0KPiANCg0K
Tm8sIHRoaXMgaXMgbm90IGEgZHVwbGljYXRpb24uIHBvd2VyLXNvdXJjZSBpcyB1c2VkIHRvIGNv
bmZpZ3VyZSB0aGUgb3V0cHV0IHZvbHRhZ2UsDQp3aGVyZWFzIGlucHV0LXZvbHRhZ2UtbWljcm92
b2x0IGNvbnRyb2xzIHRoZSBpbnB1dCBsb2dpYyB0aHJlc2hvbGRzLg0KDQpCb3RoIGFyZSBoYW5k
bGVkIGluIHJ0ZF9wY29uZl9wYXJzZV9jb25mKCksIHdoaWNoIGlzIGNhbGxlZCBieSBydGRfcGlu
X2NvbmZpZ19zZXQoKS4NCg0KPiA+ICsNCj4gPiArICAgICAgc2xldy1yYXRlOg0KPiA+ICsgICAg
ICAgIGRlc2NyaXB0aW9uOiB8DQo+ID4gKyAgICAgICAgICBWYWxpZCBhcmd1bWVudHMgYXJlIGRl
c2NyaWJlZCBhcyBiZWxvdzoNCj4gPiArICAgICAgICAgICAgMDogfjFucyBmYWxsaW5nIHRpbWUN
Cj4gPiArICAgICAgICAgICAgMTogfjEwbnMgZmFsbGluZyB0aW1lDQo+ID4gKyAgICAgICAgICAg
IDI6IH4yMG5zIGZhbGxpbmcgdGltZQ0KPiA+ICsgICAgICAgICAgICAzOiB+MzBucyBmYWxsaW5n
IHRpbWUNCj4gPiArICAgICAgICBlbnVtOiBbMCwgMSwgMiwgM10NCj4gDQo+IElmIHlvdSBoYXZl
IHNwZWNpZmljIHZhbHVlcywgd2h5IG5vdCB1c2luZyAxLzEwLzIwLzMwPw0KPiANCg0KSSB3aWxs
IHVzZSBzcGVjaWZpYyB2YWx1ZXMgaW4gdjMuDQoNCj4gPiArDQo+ID4gKyAgICAgIHJlYWx0ZWss
ZHJpdmUtc3RyZW5ndGgtcDoNCj4gPiArICAgICAgICBkZXNjcmlwdGlvbjogfA0KPiA+ICsgICAg
ICAgICAgU29tZSBvZiBwaW5zIGNhbiBiZSBkcml2ZW4gdXNpbmcgdGhlIFAtTU9TIGFuZCBOLU1P
Uw0KPiB0cmFuc2lzdG9yIHRvDQo+ID4gKyAgICAgICAgICBhY2hpZXZlIGZpbmVyIGFkanVzdG1l
bnRzLiBUaGUgYmxvY2stZGlhZ3JhbSByZXByZXNlbnRhdGlvbiBpcw0KPiBhcw0KPiA+ICsgICAg
ICAgICAgZm9sbG93czoNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgIFZERA0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgIHx8
LS0rDQo+ID4gKyAgICAgICAgICAgICAgICstLS0tLW98fCAgICAgUC1NT1MtRkVUDQo+ID4gKyAg
ICAgICAgICAgICAgIHwgICAgICB8fC0tKw0KPiA+ICsgICAgICAgICAgSU4gLS0rICAgICAgICAg
ICstLS0tLSBvdXQNCj4gPiArICAgICAgICAgICAgICAgfCAgICAgIHx8LS0rDQo+ID4gKyAgICAg
ICAgICAgICAgICstLS0tLS18fCAgICAgTi1NT1MtRkVUDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICB8fC0tKw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgIEdORA0KPiA+ICsgICAgICAgICAgVGhlIGRyaXZpbmcgc3RyZW5n
dGggb2YgdGhlIFAtTU9TL04tTU9TIHRyYW5zaXN0b3JzIGltcGFjdHMNCj4gdGhlDQo+ID4gKyAg
ICAgICAgICB3YXZlZm9ybSdzIHJpc2UvZmFsbCB0aW1lcy4gR3JlYXRlciBkcml2aW5nIHN0cmVu
Z3RoIHJlc3VsdHMgaW4NCj4gPiArICAgICAgICAgIHNob3J0ZXIgcmlzZS9mYWxsIHRpbWVzLiBF
YWNoIFAtTU9TIGFuZCBOLU1PUyB0cmFuc2lzdG9yDQo+IG9mZmVycw0KPiA+ICsgICAgICAgICAg
OCBjb25maWd1cmFibGUgbGV2ZWxzICgwIHRvIDcpLCB3aXRoIGhpZ2hlciB2YWx1ZXMgaW5kaWNh
dGluZw0KPiA+ICsgICAgICAgICAgZ3JlYXRlciBkcml2aW5nIHN0cmVuZ3RoLCBjb250cmlidXRp
bmcgdG8gYWNoaWV2aW5nIHRoZSBkZXNpcmVkDQo+ID4gKyAgICAgICAgICBzcGVlZC4NCj4gPiAr
DQo+ID4gKyAgICAgICAgICBUaGUgcmVhbHRlayxkcml2ZS1zdHJlbmd0aC1wIGlzIHVzZWQgdG8g
Y29udHJvbCB0aGUgZHJpdmluZw0KPiBzdHJlbmd0aA0KPiA+ICsgICAgICAgICAgb2YgdGhlIFAt
TU9TIG91dHB1dC4NCj4gPiArDQo+ID4gKyAgICAgICAgICBUaGlzIHZhbHVlIGlzIG5vdCBhIHNp
bXBsZSBjb3VudCBvZiB0cmFuc2lzdG9ycy4gSW5zdGVhZCwgaXQNCj4gPiArICAgICAgICAgIHJl
cHJlc2VudHMgYSB3ZWlnaHRlZCBjb25maWd1cmF0aW9uLiBUaGVyZSBpcyBhIGJhc2UgZHJpdmlu
Zw0KPiA+ICsgICAgICAgICAgY2FwYWJpbGl0eSAoZXZlbiBhdCB2YWx1ZSAwKSwgYW5kIGVhY2gg
Yml0IGFkZHMgYSBkaWZmZXJlbnQNCj4gd2VpZ2h0IHRvDQo+ID4gKyAgICAgICAgICB0aGUgdG90
YWwgc3RyZW5ndGguIFRoZSByZXN1bHRpbmcgY3VycmVudCBpcyBub24tbGluZWFyIGFuZCB2YXJp
ZXMNCj4gPiArICAgICAgICAgIHNpZ25pZmljYW50bHkgYmFzZWQgb24gdGhlIElPIHZvbHRhZ2Ug
KDEuOFYgdnMgMy4zVikgYW5kIHRoZQ0KPiBzcGVjaWZpYw0KPiA+ICsgICAgICAgICAgcGFkIGdy
b3VwLg0KPiA+ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25z
L3VpbnQzMg0KPiA+ICsgICAgICAgIG1pbmltdW06IDANCj4gPiArICAgICAgICBtYXhpbXVtOiA3
DQo+ID4gKw0KPiA+ICsgICAgICByZWFsdGVrLGRyaXZlLXN0cmVuZ3RoLW46DQo+ID4gKyAgICAg
ICAgZGVzY3JpcHRpb246IHwNCj4gPiArICAgICAgICAgIFNpbWlsYXIgdG8gdGhlIHJlYWx0ZWss
ZHJpdmUtc3RyZW5ndGgtcCwgdGhlDQo+IHJlYWx0ZWssZHJpdmUtc3RyZW5ndGgtbg0KPiA+ICsg
ICAgICAgICAgaXMgdXNlZCB0byBjb250cm9sIHRoZSBkcml2aW5nIHN0cmVuZ3RoIG9mIHRoZSBO
LU1PUyBvdXRwdXQuDQo+ID4gKw0KPiA+ICsgICAgICAgICAgVGhpcyBwcm9wZXJ0eSB1c2VzIHRo
ZSBzYW1lIHdlaWdodGVkIGNvbmZpZ3VyYXRpb24gbG9naWMNCj4gd2hlcmUgdmFsdWVzDQo+ID4g
KyAgICAgICAgICAwLTcgcmVwcmVzZW50IG5vbi1saW5lYXIgc3RyZW5ndGggYWRqdXN0bWVudHMg
cmF0aGVyIHRoYW4gYQ0KPiB0cmFuc2lzdG9yDQo+ID4gKyAgICAgICAgICBjb3VudC4NCj4gPiAr
DQo+ID4gKyAgICAgICAgICBIaWdoZXIgdmFsdWVzIGluZGljYXRlIGdyZWF0ZXIgZHJpdmluZyBz
dHJlbmd0aCwgcmVzdWx0aW5nIGluDQo+IHNob3J0ZXINCj4gPiArICAgICAgICAgIGZhbGwgdGlt
ZXMuDQo+ID4gKyAgICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMv
dWludDMyDQo+ID4gKyAgICAgICAgbWluaW11bTogMA0KPiA+ICsgICAgICAgIG1heGltdW06IDcN
Cj4gPiArDQo+ID4gKyAgICAgIHJlYWx0ZWsscHVsc2Utd2lkdGgtYWRqdXN0Og0KPiA+ICsgICAg
ICAgIGRlc2NyaXB0aW9uOiB8DQo+ID4gKyAgICAgICAgICBBbiBpbnRlZ2VyIGRlc2NyaWJpbmcg
dGhlIGxldmVsIHRvIGFkanVzdCB0aGUgb3V0cHV0IHB1bHNlIHdpZHRoLA0KPiBpdA0KPiA+ICsg
ICAgICAgICAgcHJvdmlkZXMgYSBmaXhlZCBuYW5vc2Vjb25kLWxldmVsIGFkanVzdG1lbnQgdG8g
dGhlDQo+IHJpc2luZy9mYWxsaW5nDQo+ID4gKyAgICAgICAgICBlZGdlcyBvZiBhbiBleGlzdGlu
ZyBzaWduYWwuIEl0IGlzIHVzZWQgZm9yIFNpZ25hbCBJbnRlZ3JpdHkgdHVuaW5nDQo+ID4gKyAg
ICAgICAgICAoYWRkaW5nL3N1YnRyYWN0aW5nIGRlbGF5IHRvIGZpbmUtdHVuZSB0aGUgaGlnaC9s
b3cgZHVyYXRpb24pLA0KPiByYXRoZXINCj4gPiArICAgICAgICAgIHRoYW4gZ2VuZXJhdGluZyBh
IHNwZWNpZmljIFBXTSBmcmVxdWVuY3kuDQo+ID4gKw0KPiA+ICsgICAgICAgICAgVmFsaWQgYXJn
dW1lbnRzIGFyZSBkZXNjcmliZWQgYXMgYmVsb3c6DQo+ID4gKyAgICAgICAgICAwOiAwbnMNCj4g
PiArICAgICAgICAgIDI6ICsgMC4yNW5zDQo+ID4gKyAgICAgICAgICAzOiArIDAuNW5zDQo+ID4g
KyAgICAgICAgICA0OiAtMC4yNW5zDQo+ID4gKyAgICAgICAgICA1OiAtMC41bnMNCj4gPiArICAg
ICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzINCj4gPiAr
ICAgICAgICBlbnVtOiBbMCwgMiwgMywgNCwgNV0NCj4gPiArDQo+ID4gKyAgICAgIHJlYWx0ZWss
aGlnaC12aWwtbWljcm92b2x0Og0KPiA+ICsgICAgICAgIGRlc2NyaXB0aW9uOiB8DQo+ID4gKyAg
ICAgICAgICBUaGUgdGhyZXNob2xkIHZhbHVlIGZvciB0aGUgaW5wdXQgcmVjZWl2ZXIncyBMT1cg
cmVjb2duaXRpb24NCj4gKFZJTCkuDQo+ID4gKw0KPiA+ICsgICAgICAgICAgVGhpcyBwcm9wZXJ0
eSBpcyB1c2VkIHRvIGFkZHJlc3Mgc3BlY2lmaWMgSERNSSBJMkMgY29tcGF0aWJpbGl0eQ0KPiA+
ICsgICAgICAgICAgaXNzdWVzIHdoZXJlIHNvbWUgc2lua3MgKFRWcykgaGF2ZSB3ZWFrIHB1bGwt
ZG93biBjYXBhYmlsaXRpZXMNCj4gYW5kDQo+ID4gKyAgICAgICAgICBmYWlsIHRvIHB1bGwgdGhl
IGJ1cyB2b2x0YWdlIGJlbG93IHRoZSBzdGFuZGFyZCBWSUwgdGhyZXNob2xkDQo+ID4gKyAgICAg
ICAgICAofjAuN1YpLg0KPiA+ICsNCj4gPiArICAgICAgICAgIFNldHRpbmcgdGhpcyBwcm9wZXJ0
eSB0byAxMTAwMDAwICgxLjFWKSBlbmFibGVzIGEgc3BlY2lhbGl6ZWQNCj4gaW5wdXQNCj4gPiAr
ICAgICAgICAgIHJlY2VpdmVyIG1vZGUgdGhhdCByYWlzZXMgdGhlIGVmZmVjdGl2ZSBWSUwgdGhy
ZXNob2xkIHRvIGltcHJvdmUNCj4gPiArICAgICAgICAgIGRldGVjdGlvbi4NCj4gPiArICAgICAg
ICBlbnVtOiBbMTEwMDAwMF0NCj4gPiArDQo+ID4gKyAgICByZXF1aXJlZDoNCj4gPiArICAgICAg
LSBwaW5zDQo+ID4gKw0KPiA+ICsgICAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4g
Kw0KPiA+ICtyZXF1aXJlZDoNCj4gPiArICAtIGNvbXBhdGlibGUNCj4gPiArICAtIHJlZw0KPiA+
ICsNCj4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICtleGFtcGxl
czoNCj4gPiArICAtIHwNCj4gPiArICAgIHBpbmN0cmxANGUwMDAgew0KPiA+ICsgICAgICAgIGNv
bXBhdGlibGUgPSAicmVhbHRlayxydGQxNjI1LWlzby1waW5jdHJsIjsNCj4gPiArICAgICAgICBy
ZWcgPSA8MHg0ZTAwMCAweDEzMD47DQo+ID4gKw0KPiA+ICsgICAgICAgIGVtbWMtaHMyMDAtcGlu
cyB7DQo+ID4gKyAgICAgICAgICAgIHBpbnMgPSAiZW1tY19jbGsiLA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgImVtbWNfY21kIiwNCj4gPiArICAgICAgICAgICAgICAgICAgICJlbW1jX2RhdGFf
MCIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAiZW1tY19kYXRhXzEiLA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgImVtbWNfZGF0YV8yIiwNCj4gPiArICAgICAgICAgICAgICAgICAgICJlbW1j
X2RhdGFfMyIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAiZW1tY19kYXRhXzQiLA0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgImVtbWNfZGF0YV81IiwNCj4gPiArICAgICAgICAgICAgICAgICAg
ICJlbW1jX2RhdGFfNiIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAiZW1tY19kYXRhXzciOw0K
PiA+ICsgICAgICAgICAgICBmdW5jdGlvbiA9ICJlbW1jIjsNCj4gPiArICAgICAgICAgICAgcmVh
bHRlayxkcml2ZS1zdHJlbmd0aC1wID0gPDB4Mj47DQo+ID4gKyAgICAgICAgICAgIHJlYWx0ZWss
ZHJpdmUtc3RyZW5ndGgtbiA9IDwweDI+Ow0KPiANCj4gVGhlc2UgYXJlIG5vdCBoZXgsIGJ1dCBz
aW1wbGUgZGVjaW1hbHMNCj4gDQoNCkkgd2lsbCBjaGFuZ2UgdGhlbSB0byA8Mj4uDQoNCkJlc3Qg
UmVnYXJkcywNCll1LUNodW4NCg0KPiA+ICsgICAgICAgIH07DQo+ID4gKw0KPiA+ICsgICAgICAg
IGkyYy0wLXBpbnMgew0KPiA+ICsgICAgICAgICAgICBwaW5zID0gImdwaW9fMTIiLA0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgImdwaW9fMTMiOw0KPiA+ICsgICAgICAgICAgICBmdW5jdGlvbiA9
ICJpMmMwIjsNCj4gPiArICAgICAgICAgICAgZHJpdmUtc3RyZW5ndGggPSA8ND47DQo+ID4gKyAg
ICAgICAgfTsNCj4gPiArICAgIH07DQo+ID4gLS0NCj4gPiAyLjM0LjENCj4gPg0K

