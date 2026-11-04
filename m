Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D672606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 06:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fZyZqXSu;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=FR1gKjQ0;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=Se7ovEnL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zDtggkZku8PgJt9OARmJv04xDfsbkkp5F4eyRrnZB7M=; b=fZyZqXSu2uu6YCwowi2hL73W9A
	J1chxJJNs4BNKmX0fhRRVjgpzwjJt7lw0Usk3pqlNJKWoGrvCtsz0CYe0oaf1Afz8O67If1zyXVdC
	THER0NC8D3pr5ihF9xF5alEyVYDuByY4F85tY1CmYscVp08vfV8YDVlJXll90pEEvaWhm/xjE4Cwq
	nCtVYqdCNGekuIn1TQDZfBGgM9OH/9lXStUx7Mp85ZOm0JcVDm2hgbYXfqTUJnCzW0xeKsfLL3/8q
	3a1uYc4F7gAaweOffhbh0PwNwqQe0kHrdwRn/dPWIE2tObcFzCD5AjIYM5x2wq2vyw3j2zvpY9ZQI
	rMfZae/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUAP-00000004OB9-3bb7;
	Wed, 04 Nov 2026 06:08:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUAO-00000004OB0-2657;
	Wed, 04 Nov 2026 06:08:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zDtggkZku8PgJt9OARmJv04xDfsbkkp5F4eyRrnZB7M=; b=FR1gKjQ0k5GcUJb+BfVytrfDgk
	xtjZP/1comP17LZ95x7TTe8NsJ4KPAKdafoWKF8pfSeBITsPEvdDrILe746q2iZAnt9Sdy+37T5no
	AIYe5+4brGOuQtJhZ4XsiecQolkyLGkhBWwi4ga9T0Uo9+l190ZCskBhjG05iGZJezZ2mOUZjDuMc
	xiYN4Mw/jjR6uHZjPW6jBDhXHfIAyFR43Xph2Go1N85DPC6L1Ov/1xzErfgDn5oQlt/C8B2a+IWO6
	cjy2x6FxSRc8ljMEkcNUCGIF0dtktOPjwqoN0+qfqdRYuqEemXhRT4WyRacqnVRIUNmA7QZPi/aAi
	1YhxIimw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUAK-00000001GaF-2Len;
	Wed, 04 Nov 2026 06:08:11 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6A467Y0v83769780, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1793772454; bh=zDtggkZku8PgJt9OARmJv04xDfsbkkp5F4eyRrnZB7M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Se7ovEnLOecaDyUD3iXqu4ZiBrA1AiwbzBm+EZo5g9xGEyoLWuCcIUOTo0P4sq6p7
	 gjGM2pXhIORx7aYofDar/wrMGPF9uVK0KmpngnO9ayrLIPEP1Jg1eNCqXsRgJ8VXoc
	 E0PVLVwYRfFPoYbVBkGei3WhXm8oUpIbh0x5uX51v8EGegBxa5me5xAv/tsj1D/+fi
	 LdY6JI0aH0ezpi1MjXWC7UPZBDXseXanP5j45uO0xtZF7HFfoyV6w/ULFsOX0q9cOe
	 nhuk0G1tsDrdx6kUSOzyRbtpwQz1AyR7gsXkq8/MMuSFo4KaSvm7PbXeqHODyKokKd
	 83pxoFmwjP2Lg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6A467Y0v83769780
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Nov 2026 14:07:34 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 14:07:34 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 14:07:33 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Wed, 4 Nov 2026 14:07:33 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Lee Jones <lee@kernel.org>, =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?=
	<james.tai@realtek.com>, =?utf-8?B?QW5kcmVhcyBGw6RyYmVy?=
	<afaerber@suse.com>, Linus Walleij <linusw@kernel.org>,
	=?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH 07/10] pinctrl: realtek: Initialise omitted offset fields
 to NA in config macros
Thread-Topic: [PATCH 07/10] pinctrl: realtek: Initialise omitted offset fields
 to NA in config macros
Thread-Index: AQHda9qgbhIxCAk+mka0RzFPD9N5YrcdbaGA
Date: Wed, 4 Nov 2026 06:07:33 +0000
Message-ID: <c48f0d12ee764bf3bd04b57db9a8b9cb@realtek.com>
References: <20261103213002.1673560-1-lee@kernel.org>
 <20261103213002.1673560-8-lee@kernel.org>
In-Reply-To: <20261103213002.1673560-8-lee@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_060809_046654_B1AB1CD6 
X-CRM114-Status: GOOD (  17.12  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiBUaGUgUmVhbHRlayBwaW5jdHJsIGRyaXZlciB1c2VzIE5BICgweGZmZmZmZmZmKSBhcyB0aGUg
c2VudGluZWwgZm9yIHVuc3VwcG9ydGVkDQo+IHBpbiBjb25maWd1cmF0aW9uIGZlYXR1cmVzLiAg
SG93ZXZlciwgUlRLX1BJTl9DT05GSUcgb21pdHMNCj4gaW5wdXRfdm9sdF9vZmZzZXQsIHNsZXdf
cmF0ZV9vZmZzZXQsIGFuZCBodmlsX29mZnNldCwgYW5kDQo+IFJUS19QSU5fQ09ORklHX1YyIG9t
aXRzIHNsZXdfcmF0ZV9vZmZzZXQgYW5kIGh2aWxfb2Zmc2V0LiAgQmVjYXVzZSBDOTkNCj4gZGVz
aWduYXRlZCBpbml0aWFsaXNlcnMgemVyby1pbml0aWFsaXNlIG9taXR0ZWQgbWVtYmVycywgdGhv
c2UgZmllbGRzIGRlZmF1bHQgdG8gMA0KPiBpbnN0ZWFkIG9mIE5BLCBjYXVzaW5nIHJ0ZF9wY29u
Zl9wYXJzZV9jb25mKCkgdG8gdHJlYXQgdW5zdXBwb3J0ZWQgZmVhdHVyZXMgYXMNCj4gdmFsaWQg
YXQgYml0IG9mZnNldCBiYXNlX2JpdCArIDAgYW5kIGNvcnJ1cHQgYWRqYWNlbnQgcmVnaXN0ZXIg
Yml0cy4NCj4gDQo+IEV4cGxpY2l0bHkgaW5pdGlhbGlzZSB0aGUgb21pdHRlZCBvZmZzZXQgZmll
bGRzIHRvIE5BIGluIFJUS19QSU5fQ09ORklHIGFuZA0KPiBSVEtfUElOX0NPTkZJR19WMi4NCj4g
DQo+IEZpeGVzOiBkY2M5MzM0NDM1YjAgKCJwaW5jdHJsOiByZWFsdGVrOiBhZGQgc3VwcG9ydCBm
b3Igc2xldyByYXRlLCBpbnB1dCB2b2x0YWdlDQo+IGFuZCBoaWdoIFZJTCIpDQoNClRoaXMgc2hv
dWxkIGJlOg0KRml4ZXM6IGU5OWNlNzgwMzBkYiAoInBpbmN0cmw6IHJlYWx0ZWs6IEFkZCBjb21t
b24gcGluY3RybCBkcml2ZXIgZm9yIFJlYWx0ZWsNCkRIQyBSVEQgU29DcyIpDQoNCj4gRml4ZXM6
IGUzMDlkYmQ1MjNiOCAoInBpbmN0cmw6IHJlYWx0ZWs6IGFkZCBydGQxNjI1IHBpbmN0cmwgZHJp
dmVyIikNCj4gQ2xvc2VzOg0KPiBodHRwczovL3Nhc2hpa28uZGV2LyMvYnVnL2xpbnV4LWZiZDBi
ZjU0LTZkYmEtNDY1Mi05NDE4LTI3MGIxMWZiNmQ4Yg0KPiBDYzogc3RhYmxlQHZnZXIua2VybmVs
Lm9yZw0KPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZUBrZXJuZWwub3JnPg0KDQpPdGhl
cndpc2UsIGxvb2tzIGdvb2QgdG8gbWUuDQoNClRoYW5rcyBmb3IgdGhlIGZpeGVzLg0KDQpSZXZp
ZXdlZC1ieTogWXUtQ2h1biBMaW4gPGVsZWFub3IubGluQHJlYWx0ZWsuY29tPg0KDQo+IC0tLQ0K
PiAgZHJpdmVycy9waW5jdHJsL3JlYWx0ZWsvcGluY3RybC1ydGQuaCB8IDUgKysrKysNCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3BpbmN0cmwvcmVhbHRlay9waW5jdHJsLXJ0ZC5oDQo+IGIvZHJpdmVycy9waW5jdHJsL3JlYWx0
ZWsvcGluY3RybC1ydGQuaA0KPiBpbmRleCA3N2MzMGVhNzY0NDMuLjg2ZGI1NGVhM2NlOCAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9waW5jdHJsL3JlYWx0ZWsvcGluY3RybC1ydGQuaA0KPiArKysg
Yi9kcml2ZXJzL3BpbmN0cmwvcmVhbHRlay9waW5jdHJsLXJ0ZC5oDQo+IEBAIC05Niw2ICs5Niw5
IEBAIHN0cnVjdCBydGRfcGluX3JlZ19saXN0IHsNCj4gICAgICAgICAgICAgICAgIC5zbXRfb2Zm
c2V0ID0gX3NtdF9vZmYsIFwNCj4gICAgICAgICAgICAgICAgIC5wb3dlcl9vZmZzZXQgPSBfcG93
X29mZiwgXA0KPiAgICAgICAgICAgICAgICAgLmN1cnJfdHlwZSA9IF9jdXJyX3R5cGUsIFwNCj4g
KyAgICAgICAgICAgICAgIC5pbnB1dF92b2x0X29mZnNldCA9IE5BLCBcDQo+ICsgICAgICAgICAg
ICAgICAuc2xld19yYXRlX29mZnNldCA9IE5BLCBcDQo+ICsgICAgICAgICAgICAgICAuaHZpbF9v
ZmZzZXQgPSBOQSwgXA0KPiAgICAgICAgIH0NCj4gDQo+ICAjZGVmaW5lIFJUS19QSU5fQ09ORklH
X1YyKF9uYW1lLCBfcmVnX29mZiwgX2Jhc2VfYml0LCBfcHVkX2VuX29mZiwgXA0KPiBAQCAtMTEy
LDYgKzExNSw4IEBAIHN0cnVjdCBydGRfcGluX3JlZ19saXN0IHsNCj4gICAgICAgICAgICAgICAg
IC5wb3dlcl9vZmZzZXQgPSBfcG93X29mZiwgXA0KPiAgICAgICAgICAgICAgICAgLmlucHV0X3Zv
bHRfb2Zmc2V0ID0gX2lucHV0X3ZvbHRfb2ZmLCBcDQo+ICAgICAgICAgICAgICAgICAuY3Vycl90
eXBlID0gX2N1cnJfdHlwZSwgXA0KPiArICAgICAgICAgICAgICAgLnNsZXdfcmF0ZV9vZmZzZXQg
PSBOQSwgXA0KPiArICAgICAgICAgICAgICAgLmh2aWxfb2Zmc2V0ID0gTkEsIFwNCj4gICAgICAg
ICB9DQo+IA0KPiAgI2RlZmluZSBSVEtfUElOX0NPTkZJR19JMkMoX25hbWUsIF9yZWdfb2ZmLCBf
YmFzZV9iaXQsIF9wdWRfZW5fb2ZmLCBcDQo+IC0tDQo+IDIuNTYuMC4zODUuZ2FjNjcxYzgxOWEt
Z29vZw0K

