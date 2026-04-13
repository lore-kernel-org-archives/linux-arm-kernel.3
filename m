Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8777CEBFD22
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 09:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OfaFHGW4BHXsCEKDLY2bYmYjd4tuxeBTjzOITav+K40=; b=I2pGKPdmhlDooykgTM/NRouc8r
	+9mMfS5m2GRSLx9u7KQr33pHaLqk7ksYci7ZQT3cdYflDzyNXHlIrefLJ2NOurPwoZzai95bsQhx9
	zRvzUMBeCgUXI11OQPXUXSvWUOxyWoE0s2a+KT6zvVZt5JjYCLEMtoXZXqAOCcTO15Y2x0kYWn4Ui
	MYh7l8q3m3EIhfQHoZpOKqMmMprbsVMiYvT/g+XD8JZv+zBMgfx4h9XSkLBBHUlIKlAgKYWyw8F/8
	Ob0PDDw/PZ1CXXXCZgVJaKbfd7TzoLQMqQFtzgvGkYDv0qWa+HFX4eiZ3Va8xVJaJR4ZmKMz1D5y0
	lNa9WaKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDxH-0000000FOUE-2OYZ;
	Mon, 13 Apr 2026 09:51:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDxF-0000000FOU4-48L0;
	Mon, 13 Apr 2026 09:51:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OfaFHGW4BHXsCEKDLY2bYmYjd4tuxeBTjzOITav+K40=; b=nYf66K3tL7EuNzj0SPeAbYxXiP
	mRYtkrrgPIG8CerJPi7ZbJ6Lgs4ACvK8EPuz1aijQ16N5tDGf06wwqzDvWBm0b3MCqDi/15OFqvuG
	BvAROXn1so5quMqOO0lV2AFGExbTJEIdguA8LIFLE1YisUCVWh3/xz4Ah49odwTu7EzXYK1PVye7r
	im8DjGtc+1Madm5TJBWXURt12skNTSQ2Ncep8YxcHd7ER+mTVJPdYlOWKhGTtxe4+/ND3xo4GDNv3
	qo7SFptcM6BOMPtzdrRaG7gCKnRKswhyH1hnSxUxpQLJ0odEC4x1FO03QDMFAfJ7iB5VzZIlccU7d
	6vhHFgow==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDxC-0000000GWdx-2B9N;
	Mon, 13 Apr 2026 09:51:40 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 63D9nA5s94021616, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1776073751; bh=OfaFHGW4BHXsCEKDLY2bYmYjd4tuxeBTjzOITav+K40=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=VQD7aqt2XR9PJpPEIceqZ9cd1oxayPD/Gb6aeMAjLrQ2LwAr2Gf+M7FPIFXHrYMjL
	 /HgzlcDmTmtuIGxqe2qwHHTXUvGrAj/NYwQSb/E5xujCyEWacoIX0BDyiWawLyeqzh
	 xbszBRnBU7j0NCWKpWqV2/xVR7OFy80JjhTFMZbCsUdZZVoDzlrVCmI8rgMVPzKrBn
	 M9hCEjmQQd+5Ud7tMXPb2urUKV9/kNmQXeaouig7SR55y2t474QLiEYsR8l/bOj502
	 /Ota3JPsTe/NpMRYHrMSUVfvZ+iLT6AUqAv8puOhLwvgAiZl4oL72aag48tE8xgyUp
	 ELmNRui+C+PBw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 63D9nA5s94021616
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Apr 2026 17:49:10 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 13 Apr 2026 17:49:11 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458%10]) with mapi id
 15.02.1748.010; Mon, 13 Apr 2026 17:49:11 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Linus Walleij
	<linusw@kernel.org>,
        =?utf-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andrew Jeffery
	<andrew@codeconstruct.com.au>,
        "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>,
        "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        Joel Stanley <joel@jms.id.au>,
        "linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
        =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>
Subject: RE: [PATCH 1/4] pinctrl: realtek: Enable compile testing
Thread-Topic: [PATCH 1/4] pinctrl: realtek: Enable compile testing
Thread-Index: AQHcyOqp9cEi81by0U+J7Mg1UrX8w7XcwsLg
Date: Mon, 13 Apr 2026 09:49:11 +0000
Message-ID: <eda54aea98ba4ad58ba8fca0951dd714@realtek.com>
References: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com>
 <20260410-pinctrl-testing-v1-1-6f708c855867@oss.qualcomm.com>
In-Reply-To: <20260410-pinctrl-testing-v1-1-6f708c855867@oss.qualcomm.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_105139_246079_47974052 
X-CRM114-Status: GOOD (  14.90  )
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

PiBFbmFibGUgY29tcGlsZSB0ZXN0aW5nIGZvciBSZWFsdGVrIHBpbiBjb250cm9sbGVyIGRyaXZl
cnMgZm9yIGluY3JlYXNlZCBidWlsZA0KPiBhbmQgc3RhdGljIGNoZWNrZXJzIGNvdmVyYWdlLiAg
UElOQ1RSTF9SVEQgdXNlcw0KPiBwaW5jb25mX2dlbmVyaWNfZHRfbm9kZV90b19tYXAoKSwgdGh1
cyBuZWVkcyBPRi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGty
enlzenRvZi5rb3psb3dza2lAb3NzLnF1YWxjb21tLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3Bp
bmN0cmwvTWFrZWZpbGUgICAgICAgIHwgIDIgKy0NCj4gIGRyaXZlcnMvcGluY3RybC9yZWFsdGVr
L0tjb25maWcgfCAxMiArKysrKystLS0tLS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3Ry
bC9NYWtlZmlsZSBiL2RyaXZlcnMvcGluY3RybC9NYWtlZmlsZSBpbmRleA0KPiA5ZDMzZmEyOGEw
OTYuLmIwNTRjZmI5OTM0OCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9waW5jdHJsL01ha2VmaWxl
DQo+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9NYWtlZmlsZQ0KPiBAQCAtODIsNyArODIsNyBAQCBv
YmoteSAgICAgICAgICAgICAgICAgICAgICAgICArPSBudXZvdG9uLw0KPiAgb2JqLXkgICAgICAg
ICAgICAgICAgICAgICAgICAgICs9IG54cC8NCj4gIG9iai0kKENPTkZJR19QSU5DVFJMX1BYQSkg
ICAgICArPSBweGEvDQo+ICBvYmoteSAgICAgICAgICAgICAgICAgICAgICAgICAgKz0gcWNvbS8N
Cj4gLW9iai0kKENPTkZJR19BUkNIX1JFQUxURUspICAgICAgKz0gcmVhbHRlay8NCj4gK29iai0k
KENPTkZJR19QSU5DVFJMX1JURCkgICAgICArPSByZWFsdGVrLw0KPiAgb2JqLSQoQ09ORklHX1BJ
TkNUUkxfUkVORVNBUykgICs9IHJlbmVzYXMvDQo+ICBvYmotJChDT05GSUdfUElOQ1RSTF9TQU1T
VU5HKSAgKz0gc2Ftc3VuZy8NCj4gIG9iai15ICAgICAgICAgICAgICAgICAgICAgICAgICArPSBz
b3BoZ28vDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvcmVhbHRlay9LY29uZmlnIGIv
ZHJpdmVycy9waW5jdHJsL3JlYWx0ZWsvS2NvbmZpZw0KPiBpbmRleCAwNTRlODVkYjk5ZTcuLmEx
NTZjNGVmNTU2ZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9waW5jdHJsL3JlYWx0ZWsvS2NvbmZp
Zw0KPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvcmVhbHRlay9LY29uZmlnDQo+IEBAIC0yLDggKzIs
OCBAQA0KPiANCj4gIGNvbmZpZyBQSU5DVFJMX1JURA0KPiAgICAgICAgIHRyaXN0YXRlICJSZWFs
dGVrIERIQyBjb3JlIHBpbiBjb250cm9sbGVyIGRyaXZlciINCj4gLSAgICAgICBkZXBlbmRzIG9u
IEFSQ0hfUkVBTFRFSw0KPiAtICAgICAgIGRlZmF1bHQgeQ0KPiArICAgICAgIGRlcGVuZHMgb24g
QVJDSF9SRUFMVEVLIHx8IChDT01QSUxFX1RFU1QgJiYgT0YpDQo+ICsgICAgICAgZGVmYXVsdCBB
UkNIX1JFQUxURUsNCj4gICAgICAgICBzZWxlY3QgUElOTVVYDQo+ICAgICAgICAgc2VsZWN0IEdF
TkVSSUNfUElOQ09ORg0KPiAgICAgICAgIHNlbGVjdCBSRUdNQVBfTU1JTw0KPiBAQCAtMTEsMjIg
KzExLDIyIEBAIGNvbmZpZyBQSU5DVFJMX1JURA0KPiAgY29uZmlnIFBJTkNUUkxfUlREMTYxOUIN
Cj4gICAgICAgICB0cmlzdGF0ZSAiUmVhbHRlayBESEMgMTYxOUIgcGluIGNvbnRyb2xsZXIgZHJp
dmVyIg0KPiAgICAgICAgIGRlcGVuZHMgb24gUElOQ1RSTF9SVEQNCj4gLSAgICAgICBkZWZhdWx0
IHkNCj4gKyAgICAgICBkZWZhdWx0IEFSQ0hfUkVBTFRFSw0KPiANCj4gIGNvbmZpZyBQSU5DVFJM
X1JURDEzMTlEDQo+ICAgICAgICAgdHJpc3RhdGUgIlJlYWx0ZWsgREhDIDEzMTlEIHBpbiBjb250
cm9sbGVyIGRyaXZlciINCj4gICAgICAgICBkZXBlbmRzIG9uIFBJTkNUUkxfUlREDQo+IC0gICAg
ICAgZGVmYXVsdCB5DQo+ICsgICAgICAgZGVmYXVsdCBBUkNIX1JFQUxURUsNCj4gDQo+ICBjb25m
aWcgUElOQ1RSTF9SVEQxMzE1RQ0KPiAgICAgICAgIHRyaXN0YXRlICJSZWFsdGVrIERIQyAxMzE1
RSBwaW4gY29udHJvbGxlciBkcml2ZXIiDQo+ICAgICAgICAgZGVwZW5kcyBvbiBQSU5DVFJMX1JU
RA0KPiAtICAgICAgIGRlZmF1bHQgeQ0KPiArICAgICAgIGRlZmF1bHQgQVJDSF9SRUFMVEVLDQo+
IA0KPiAgY29uZmlnIFBJTkNUUkxfUlREMTYyNQ0KPiAgICAgICAgIHRyaXN0YXRlICJSZWFsdGVr
IERIQyAxNjI1IHBpbiBjb250cm9sbGVyIGRyaXZlciINCj4gICAgICAgICBkZXBlbmRzIG9uIFBJ
TkNUUkxfUlREDQo+IC0gICAgICAgZGVmYXVsdCB5DQo+ICsgICAgICAgZGVmYXVsdCBBUkNIX1JF
QUxURUsNCj4gICAgICAgICBoZWxwDQo+ICAgICAgICAgICBUaGlzIGRyaXZlciBlbmFibGVzIHN1
cHBvcnQgZm9yIHRoZSBwaW4gY29udHJvbGxlciBvbiB0aGUgUmVhbHRlaw0KPiAgICAgICAgICAg
UlREMTYyNSBTb0NzLg0KPiANCj4gLS0NCj4gMi41MS4wDQoNClJldmlld2VkLWJ5OiBZdS1DaHVu
IExpbiA8ZWxlYW5vci5saW5AcmVhbHRlay5jb20+DQo=

