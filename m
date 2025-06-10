Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B45CC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 18:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTMdhk67xc7XKkOuFv//TWr5oxho4kXHuNSuGFjH+xE=; b=mltjJiMkYZxeRd0gBi0Wb6dHKi
	DFT7XMwNqlIyqea9kDRv7iy4bfPxYE8YssFAd6aJKDwvtL1QUEd+cENAfEkMCoEA3BWvEibmHQZk+
	2iiR/6uiODJnXwH+0TGII5xYJLSTcXF8rMe01Q4+s5S160FsfaxKOBKdDlTbtf8JdDDjepFN37lWR
	IfZUMCc77+XWpihumfUeH5YX/4c8fwhI+Da2ltTcYX01GbXl+u+wO3mKuyYDotASEAFGpyDAOuVir
	6LyNfyQLGCa1r390YU4XG65+MnEHJHiIxEIK9GGPvHiVshyJenAoOyOJOHU0873gS+WSxDhhtRBs8
	26gIJhug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP3Ue-00000007lwa-3PR7;
	Tue, 10 Jun 2025 18:14:40 +0000
Received: from mail.actia.se ([212.181.117.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0Vg-00000007Djm-1W5h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 15:03:34 +0000
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 17:03:25 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.039; Tue, 10 Jun 2025 17:03:25 +0200
From: John Ernberg <john.ernberg@actia.se>
To: Shawn Guo <shawnguo2@yeah.net>
CC: Xu Yang <xu.yang_2@nxp.com>, Peter Chen <peter.chen@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: i.MX kernel hangup caused by chipidea USB gadget driver
Thread-Topic: i.MX kernel hangup caused by chipidea USB gadget driver
Thread-Index: AQHb2Uk8r5zPXewyY0SsDNZZa8wLobP7lMcAgADIvwA=
Date: Tue, 10 Jun 2025 15:03:24 +0000
Message-ID: <8b48c88f-4d70-403a-b1a5-bb80643086ed@actia.se>
References: <aEZxmlHmjeWcXiF3@dragon>
 <c56pgxmfscg6tpqxjayu4mvxc2g5kgmfitpvp36lxulpq4jxmg@ces5l7ofab6s>
 <aEbstxkQmji4tfjf@w447anl.localdomain> <aEeg1s9A0F8x0U2+@dragon>
In-Reply-To: <aEeg1s9A0F8x0U2+@dragon>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.12.12.63]
x-esetresult: clean, is OK
x-esetid: 37303A2955B14453627660
Content-Type: text/plain; charset="utf-8"
Content-ID: <9A91E4C4EE6A4C4B8F9753C8D81719A4@actia.se>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_080332_398552_108D68E1 
X-CRM114-Status: GOOD (  23.89  )
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

SGkgU2hhd24sDQoNCk9uIDYvMTAvMjUgNTowNCBBTSwgU2hhd24gR3VvIHdyb3RlOg0KPiBIaSBK
b2huLA0KPiANCj4gT24gTW9uLCBKdW4gMDksIDIwMjUgYXQgMDI6MTc6MzBQTSArMDAwMCwgSm9o
biBFcm5iZXJnIHdyb3RlOg0KPiANCj4gPHNuaXA+DQo+IA0KPj4gV2UgcHJvYmFibHkgcmFuIGlu
dG8gdGhlIHNhbWUgcHJvYmxlbSB0cnlpbmcgdG8gYnJpbmcgb25ib2FyZCA2LjEyLCBnb2luZw0K
Pj4gZnJvbSA2LjEsIG9uIGlNWDhRWFAuIEkgbWFuYWdlZCB0byB0cmFjZSB0aGUgaGFuZyB0byBF
UCBwcmltaW5nIHRocm91Z2ggYQ0KPj4gY29tYmluYXRpb24gb2YgZGVidWcgdHJhY2luZyBhbmQg
QlVHX09OIGV4cGVyaW1lbnRzLiBTZWUgaWYgaXQgc3RhcnRzDQo+PiBzcGxhdGluIHdpdGggdGhl
IGJlbG93IGNoYW5nZS4NCj4+DQo+PiAtLS0tLS0tLS0tLS0tLS0tLT44LS0tLS0tLS0tLS0tLS0t
LS0tDQo+Pg0KPj4gIEZyb20gMDkyNTk5YWI2ZjllMjA0MTJhN2NhMWViMTE4ZGQyYmU4MGNkMThm
ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCj4+IEZyb206IEpvaG4gRXJuYmVyZyA8am9obi5l
cm5iZXJnQGFjdGlhLnNlPg0KPj4gRGF0ZTogTW9uLCA1IE1heSAyMDI1IDA5OjA5OjAxICswMjAw
DQo+PiBTdWJqZWN0OiBbUEFUQ0hdIFVTQjogY2k6IGdhZGdldDogUGFuaWMgaWYgcHJpbWluZyB3
aGVuIGdhZGdldCBvZmYNCj4+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy91c2IvY2hpcGlkZWEvdWRj
LmMgfCA0ICsrKy0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9jaGlwaWRlYS91ZGMuYyBi
L2RyaXZlcnMvdXNiL2NoaXBpZGVhL3VkYy5jDQo+PiBpbmRleCAyZmVhMjYzYTVlMzAuLjU0NGFh
NGZhMmQxZCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvdXNiL2NoaXBpZGVhL3VkYy5jDQo+PiAr
KysgYi9kcml2ZXJzL3VzYi9jaGlwaWRlYS91ZGMuYw0KPj4gQEAgLTIwMyw4ICsyMDMsMTAgQEAg
c3RhdGljIGludCBod19lcF9wcmltZShzdHJ1Y3QgY2lfaGRyYyAqY2ksIGludCBudW0sIGludCBk
aXIsIGludCBpc19jdHJsKQ0KPj4NCj4+ICAgICAgaHdfd3JpdGUoY2ksIE9QX0VORFBUUFJJTUUs
IH4wLCBCSVQobikpOw0KPj4NCj4+IC0gICB3aGlsZSAoaHdfcmVhZChjaSwgT1BfRU5EUFRQUklN
RSwgQklUKG4pKSkNCj4+ICsgICB3aGlsZSAoaHdfcmVhZChjaSwgT1BfRU5EUFRQUklNRSwgQklU
KG4pKSkgew0KPj4gICAgICAgICAgY3B1X3JlbGF4KCk7DQo+PiArICAgICAgIEJVR19PTihkaXIg
PT0gVFggJiYgIWh3X3JlYWQoY2ksIE9QX0VORFBUQ1RSTCArIG51bSwgRU5EUFRDVFJMX1RYRSkp
Ow0KPj4gKyAgIH0NCj4+ICAgICAgaWYgKGlzX2N0cmwgJiYgZGlyID09IFJYICYmIGh3X3JlYWQo
Y2ksIE9QX0VORFBUU0VUVVBTVEFULCBCSVQobnVtKSkpDQo+PiAgICAgICAgICByZXR1cm4gLUVB
R0FJTjsNCj4+DQo+PiAtLS0tLS0tLS0tLS0tLS0tLT44LS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0K
PiBIbW0sIEkganVzdCB0ZXN0ZWQgdGhlIGNoYW5nZSBvbiBpLk1YOE1NIGJ1dCBkaWRuJ3Qgc2Vl
IHRoZSBzcGxhdHRpbmcuDQo+IE1heWJlIHdlIGFyZSBydW5uaW5nIGludG8gYSBzbGlnaHRseSBk
aWZmZXJlbnQgcHJvYmxlbXM/DQo+IA0KPiBTaGF3bg0KPiANCg0KUGVyaGFwcyB0aGUgaGFuZ2lu
ZyBwb2ludCBpcyBkaWZmZXJlbnQgaW4gaS5NWDhNTSwgSSB1bmZvcnR1bmF0ZWx5IGRvIA0Kbm90
IGhhdmUgYW55IGJvYXJkcyB3aXRoIHRoYXQgU29DIG9uIHRoZW0uIFdoZW4gSSB0cmFja2VkIGRv
d24gdGhlIA0KcHJvYmxlbSBvbiBRWFAgSSB0aHJldyBzaW1pbGFyIEJVR19PTiBzdGF0ZW1lbnRz
IGluIG1vc3Qgd2hpbGUgbG9vcHMuDQoNCkJ1dCBzaW5jZSBhIGZpeCBpcyB2ZXJ5IGxpa2VseSBp
ZGVudGlmaWVkIGFscmVhZHkgYnkgeW91IEknbSBub3Qgc3VyZSBpbiANCnRoZSB2YWx1ZSBvZiBm
aW5kaW5nIHRoZSBleGFjdCBzcG90Lg0KDQpCZXN0IHJlZ2FyZHMgLy8gSm9obiBFcm5iZXJn

