Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FEAD59F5F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 02:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Gd3ZPcpZCccuSNzJYaGEPiStISD0m98tSjC8VyiwbA=; b=uOmmbhBnpaOaL6PglQ2Evf6f+N
	22SgaKePDhNfLvdETAo0iMn17Lx4pBmFHALOqQgsJJ3AQ5VjQWBYU1b+inZj0//aQr54r0MPFNZ5K
	dTBvcJgGFLY2XKC8JrpH30Q3qkSJAKzs9FJd+Giv/zsWtEOJ4HY57Ok3mX5/HAPjxH8GN5SxZNuoM
	9oGbSWocBMJdgxHD2xF6T7BGBPe1DNhvmN9nZTutiM/5Vcc2SpAroc9T+p2oc2Vy765Mhl4yNWVaw
	J3vlA/d8CseOdf1Glg+eJtXPL/OPZNO7a9KZmRpf7bI0rOADmhHvvqP0iy0oxFJFnoLErs8EDD5zQ
	oJgj9JjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUFos-00000001K5O-2J09;
	Sat, 13 Dec 2025 02:57:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUFoq-00000001K4e-26X5;
	Sat, 13 Dec 2025 02:57:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1Gd3ZPcpZCccuSNzJYaGEPiStISD0m98tSjC8VyiwbA=; b=ayBfgq5yskXBqfQqclfOv27T84
	ZsKfS7sVfqiajXI3kWCNj4mevv6CAUIGNjmRLgbRZTMwB4HHICSw4EldfyJvJX74WAxw0PoOMyC8Z
	1C4ac5U0RYwfKcoKMUokjcUERaikXu43oGLZIjP5LA8vcpGKpSAibyiVOwb5/AM+GLrusn8r2sij9
	GYRVqGh+jF5RnTXWy9FbgvhkpdnM9sEmijY2GCY1xzFu8EurffSwNY2DmnRfZwV++3XhCkGe8+PcF
	DICPETQZLdLfjHNQeg4tbbgm9fiWe4i+04tdtSocPD1tcjPXczrRlOLKpzav28c1FbhUAn4aaqccm
	8TeijVGg==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLb8q-0000000BR80-0qZJ;
	Wed, 19 Nov 2025 05:54:12 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5AJ6kNXZ13032395, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1763534784; bh=1Gd3ZPcpZCccuSNzJYaGEPiStISD0m98tSjC8VyiwbA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=YI8H3jzTbBaVCOzToRtvwnHs++qBXHrn/tuF39PLJUQ38nhlji/EWhnZGB5DMNgos
	 NVAMla+rmXNWm1xWMwkAfTi6I7VkrOr07i0Pc4BAyOT9DYembD78uqqQKk7KZojNIY
	 jKBuiI13miA9NdqTAl8LEJw+0Xk4q6o9sbwWel5CHQHFI2qFj7s1xV6uSwu9WSoU05
	 khc3b8cOXfD/Hz2C9D9AHeiOhcChydathnPqIiEnSoeZ0aqUmX7tkXd1fin7zmADaq
	 zcjiTbqEJpDEAuG1MO1bBy8foR01U9wTZU2isKvdUQNrEulsxeeFkc+rMko8avrgEE
	 8EBdwQUjd9d4g==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5AJ6kNXZ13032395
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 14:46:24 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Wed, 19 Nov 2025 14:46:24 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Wed, 19 Nov 2025 14:46:24 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::744:4bc9:832c:9b7e%10]) with mapi id
 15.02.1544.027; Wed, 19 Nov 2025 14:46:24 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        "afaerber@suse.de"
	<afaerber@suse.de>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "lee@kernel.org" <lee@kernel.org>,
        =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?=
	<james.tai@realtek.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        =?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?=
	<cy.huang@realtek.com>,
        =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?=
	<stanley_chang@realtek.com>
Subject: RE: [PATCH v2 2/3] dt-bindings: mfd: Add Realtek MISC system
 controller
Thread-Topic: [PATCH v2 2/3] dt-bindings: mfd: Add Realtek MISC system
 controller
Thread-Index: AQHcVJlAzHmV40ZjSkSQ8WpSKXbqLLT2ughw//98TgCAAJ8DAP//iGCAgAM4iJA=
Date: Wed, 19 Nov 2025 06:46:23 +0000
Message-ID: <d2dbb700ce684ee4a4c4ca120ac5e4e4@realtek.com>
References: <20251113123009.26568-1-eleanor.lin@realtek.com>
 <20251113123009.26568-3-eleanor.lin@realtek.com>
 <e799389ce8b4449baba83a893361bdd4@realtek.com>
 <94198d5f-e49f-4b38-8288-3be29efd142b@kernel.org>
 <15951264289d44f797ebd4e05238b380@realtek.com>
 <38d7aacd-1c05-4040-8575-bdec0587e08f@kernel.org>
In-Reply-To: <38d7aacd-1c05-4040-8575-bdec0587e08f@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_055409_422373_1444A8E4 
X-CRM114-Status: GOOD (  18.15  )
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

PiBPbiAxNy8xMS8yMDI1IDEzOjQxLCBZdS1DaHVuIExpbiBb5p6X56WQ5ZCbXSB3cm90ZToNCj4g
Pj4+DQo+ID4+DQo+ID4+IE5vbmUgb2YgdGhlbS4gWW91IG5lZWQgU29DIHNwZWNpZmljIGNvbXBh
dGlibGVzIHdoaWNoIGNhbiBiZSB1c2VkIGFzDQo+ID4+IGZhbGxiYWNrcyBmb3IgU29DIHNwZWNp
ZmljIGNvbXBhdGlibGVzLiBUaGVyZSBpcyBwbGVudHkgb2YgZXhhbXBsZXMNCj4gPj4gZm9yIHRo
aXMgYWxyZWFkeSwgYnV0IGFueXdheSB0aGlzIGRvZXMgbm90IHNvbHZlIHRoZSBwcm9ibGVtIHRo
YXQgeW91DQo+ID4+IHN0aWxsIGRpZCBub3QgcHJvcGVybHkgZGVzY3JpYmUgdGhlIGhhcmR3YXJl
IGJ1dCBpbnN0ZWFkIHVzZSB5b3VyDQo+ID4+IGRvd25zdHJlYW0gYXMgYXJndW1lbnRzLg0KPiA+
Pg0KPiA+PiBUaGlzIHdpbGwgZ2V0IHlvdSBub3doZXJlLg0KPiA+DQo+ID4gVG8gaW1wbGVtZW50
IHRoaXMgZmFsbGJhY2sgc3RydWN0dXJlLCBteSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgdGhlDQo+
ID4gU29DLWxldmVsIERUU0kgc2hvdWxkIG92ZXJyaWRlIHRoZSBub2RlIGFuZCBwcmVwZW5kIGl0
cyBTb0Mtc3BlY2lmaWMNCj4gPiBDb21wYXRpYmxlLCB3aGlsZSB0aGUgY29tbW9uIERUU0kgb25s
eSBwcm92aWRlcyB0aGUgZmFtaWx5LWxldmVsDQo+ID4gY29tcGF0aWJsZS4NCj4gPg0KPiA+IC8q
IGNvbW1vbiBEVFNJICovDQo+ID4gbWlzYzogc3lzY29uQC4uLiB7DQo+ID4gICAgIGNvbXBhdGli
bGUgPSAicmVhbHRlayxrZW50LW1pc2MiLCAic3lzY29uIiwgInNpbXBsZS1tZmQiOw0KPiANCj4g
Tm8uIFlvdSBjaGFuZ2VkIG5vdGhpbmcuIEhvdyBkb2VzIHRoaXMgZGlmZmVyIGZyb20gb3B0aW9u
cyBJIGRpc2FncmVlZCB3aXRoPw0KPiANCj4gQW55d2F5LCB0aGVyZSBpcyBubyBzdWNoIFNvQyBh
cyAia2VudCIgYW5kIEkgd2FzIGNsZWFyIC0geW91IG5lZWQgU29DDQo+IGNvbXBhdGlibGVzLg0K
PiANCj4gRGVmaW5lIHdoYXQgaXMgeW91ciBTb0MgZmlyc3QuDQo+IA0KPiBCZXN0IHJlZ2FyZHMs
DQo+IEtyenlzenRvZg0KDQpIaSBLcnp5c3p0b2YsDQoNClRoYW5rIHlvdSBmb3IgeW91ciByZXNw
b25zZS4NCg0KVGhlIG9yaWdpbmFsIGludGVudGlvbiB3YXMgdG8gYWRkIGEgYmFzaWMgS2VudCBk
ZXZpY2UgdHJlZSwgYnV0IHNpbmNlIHRoZQ0KJ21pc2MnIG5vZGUgaXMgY3VycmVudGx5IGVtcHR5
LiBJIHdpbGwgcmVtb3ZlIGJvdGggdGhpcyBkZXZpY2Ugbm9kZSBhbmQNCml0cyBjb3JyZXNwb25k
aW5nIFlBTUwgYmluZGluZyBpbiB2My4NCg0KQWZ0ZXIgZnVydGhlciBjb25zaWRlcmF0aW9uIHdp
dGhpbiBvdXIgdGVhbSwgd2UgaGF2ZSBkZWNpZGVkIHRvIGFkZA0KcG93ZXItZG9tYWluIGFuZCBy
ZWJvb3QtbW9kZSBmdW5jdGlvbmFsaXRpZXMgdG8gdGhlICdtaXNjJyBub2RlIGluIHRoZQ0KZnV0
dXJlLiBBbmQgd2Ugd2lsbCBhZGhlcmUgdG8gdGhlIFNvQy1zcGVjaWZpYyBjb21wYXRpYmxlIHN0
cmluZyBiaW5kaW5nDQpwYXR0ZXJuLCBmb2xsb3dpbmcgdGhpcyBzdHJ1Y3R1cmU6DQoNCi8qIHNj
aGVtYSBiaW5kaW5nICovDQpjb21wYXRpYmxlOg0KICBpdGVtczoNCiAgICAtIGVudW06DQogICAg
ICAgIC0gcmVhbHRlayxydGQxNTAxLW1pc2MNCiAgICAgICAgLSByZWFsdGVrLHJ0ZDE4NjEtbWlz
Yw0KICAgICAgICAtIHJlYWx0ZWsscnRkMTkyMC1taXNjDQogICAgLSBjb25zdDogc3lzY29uDQog
ICAgLSBjb25zdDogc2ltcGxlLW1mZA0KDQovKiBTb0Mtc3BlY2lmaWMgRGV2aWNlIFRyZWUgU291
cmNlIChlLmcuIHJ0ZDE5MjBzLmR0c2kpICovDQoNCiZyYnVzIHsNCiAgbWlzYzogc3lzY29uQDcw
MDAgew0KICAgIGNvbXBhdGlibGUgPSAicmVhbHRlayxydGQxOTIwLW1pc2MiLCAic3lzY29uIiwg
InNpbXBsZS1tZmQiOw0KICAgIHJlZyA9IDwweDcwMDAgMHgxMDAwPjsNCiAgICByYW5nZXMgPSA8
MHgwIDB4NzAwMCAweDEwMDA+Ow0KICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KICAgICNzaXpl
LWNlbGxzID0gPDE+Ow0KICB9Ow0KfTsNCg0KQmVzdCByZWdhcmRzLA0KWXUtQ2h1bg0K

