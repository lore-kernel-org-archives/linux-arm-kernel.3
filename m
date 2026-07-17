Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096BBC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 15:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xq+wp583z5Dgaf7ED96floun2T/tzYN8/kIia0bn+j4=; b=KwCahxKLAj5dBjKpxMjRJI8zoa
	pcsZF36hXZ2eI9rXynlhCkZRxYEYTryRK4hk4vzbSS4PyCN86Td10atqQySasXZoaIgXD++3FmNSp
	zTJeDlzNCKqCLFRqcTEtbLf8lMoEMTqPD2LUtp69bIMMQqBe35qDLuomFqdKHSA+7vglbL76N0NJB
	qGywFDYe/hcbAFZuChMnaMtGt25GCsCyheqYP8guZkwQ5syjSmwTp4lAIXprNcknHuRhRBU5qe1DT
	fkfA13Z17f/nVZRE3x1yQFe4hXQlfcyTf+qb4CqiaW32/b/dftfbawmskfPlAezp9Lq3qjroLHFTQ
	teWYbGOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkfY-00000002dYx-2vKl;
	Fri, 17 Jul 2026 15:40:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkfX-00000002dYh-1l6v;
	Fri, 17 Jul 2026 15:40:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Xq+wp583z5Dgaf7ED96floun2T/tzYN8/kIia0bn+j4=; b=fVnULtKzp8+R4/JMTcAEX2K7rQ
	e/UIzNSUY2ts7M8m63xp8CPRCx7CSV/SyUYZu8bjkYb7A7gr7gnvak2C1Zg2h2EA2gPz1YVO8+O+b
	ICrBHIAFXxdZC4OLWI5gJ1fUl+AWml0+ywqIwMDtGW0pvqTYdGxmUE8PjaGjd0Ybd42zha/zNkf6T
	RCwuV5IAkWXBWHmt5Pe3SjzN0rPfBa1SwQno7LYc/ThlMSBBXvMkVS/JjllyYVWmIPJis5qOeM48O
	hZT70ZEi6vmJqrgOb83RKxSON86rXsO5sro9qzo+tXMhLUj/aka1c77QjWJKeqGDXkqW/qtILs4s3
	T/6fqchw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wkkfT-0000000F0MH-3ATu;
	Fri, 17 Jul 2026 15:40:06 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66HFcZTm9227495, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1784302715; bh=Xq+wp583z5Dgaf7ED96floun2T/tzYN8/kIia0bn+j4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=tChzxZZuw/EEvSWU2UNDR8ArudcgTBXIesf41mAHOesM0n1+yI3Z3RfWaw8XLTM4r
	 7yI8RMjFFRTWGrZa3ieXtkYpyWAsEoJ7xukiSUcay+Lqqel3kGVqHKKv0k2TCnb9XY
	 bJXxUI6DN7ztZUQ1DhyEiBc2Ef47KzJXgzYTe+qH73TQdcQwawiZNEl0ivQZ498k99
	 P8DCnS0QuShQ/nmpZalpLcoz2Pm23R7zDuhTlzZg9F4EPjwjhN/3ImEbCim9rUkYb+
	 ik494Uq0VRMeUbInseldfLQEnxXdvWtfBEk6syAxGgHBAlCNYVyf5ZBsggmrvf50yw
	 H5FxENZVPZz8Q==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66HFcZTm9227495
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Jul 2026 23:38:35 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 17 Jul 2026 23:38:36 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 17 Jul 2026 23:38:35 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Fri, 17 Jul 2026 23:38:35 +0800
From: =?big5?B?WXUtQ2h1biBMaW4gW6pMr6enZ10=?= <eleanor.lin@realtek.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>, Michael Walle
	<mwalle@kernel.org>
CC: "Michael.Hennerich@analog.com" <Michael.Hennerich@analog.com>,
	"afaerber@suse.com" <afaerber@suse.com>, "andy@kernel.org" <andy@kernel.org>,
	"brgl@kernel.org" <brgl@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, =?big5?B?Q1lfSHVhbmdbtsDgsq7LXQ==?=
	<cy.huang@realtek.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "dlechner@baylibre.com"
	<dlechner@baylibre.com>, =?big5?B?SmFtZXMgVGFpIFvAuafTrnBd?=
	<james.tai@realtek.com>, "jic23@kernel.org" <jic23@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "lars@metafoo.de"
	<lars@metafoo.de>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"linusw@kernel.org" <linusw@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-iio@vger.kernel.org"
	<linux-iio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>, "mathieu.dubois-briand@bootlin.com"
	<mathieu.dubois-briand@bootlin.com>, "nuno.sa@analog.com"
	<nuno.sa@analog.com>, "robh@kernel.org" <robh@kernel.org>,
	=?big5?B?U3RhbmxleSBDaGFuZ1up96h8vHdd?= <stanley_chang@realtek.com>,
	=?big5?B?VFlfQ2hhbmdbsWmkbLZoXQ==?= <tychang@realtek.com>, "wbg@kernel.org"
	<wbg@kernel.org>
Subject: RE: [PATCH v3 3/7] gpio: regmap: Add gpio_regmap_operation and
 write-enable support
Thread-Topic: [PATCH v3 3/7] gpio: regmap: Add gpio_regmap_operation and
 write-enable support
Thread-Index: AQHc4cATPP5CAXxOA0S9aBj6QrzqgrYJ8C6AgFvXxWCACcZxAIAAIc4AgAALpoCAAAi9AIAAFRKAgAB1ogCAAW1TgA==
Date: Fri, 17 Jul 2026 15:38:35 +0000
Message-ID: <82f3f73764ac4553a8e2743bbebd90e8@realtek.com>
References: <d301ba0cd45d49d59e6a014188306ec9@realtek.com>
 <20260716062614.1507243-1-eleanor.lin@realtek.com>
 <aliV4u6_xzx9D9Aq@ashevche-desk.local>
 <DJZVLZ4LLD9E.3MPLYYXT1VQ9R@kernel.org>
 <alim_HGTD5RCupav@ashevche-desk.local>
 <DJZXVOGZ3ZTH.20P8NY7DON0X7@kernel.org>
 <alkbVkB5KNNR7ffN@ashevche-desk.local>
In-Reply-To: <alkbVkB5KNNR7ffN@ashevche-desk.local>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.16.3.62]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_164004_451162_FA5A70C1 
X-CRM114-Status: GOOD (  37.77  )
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

SGksDQoNCj4gDQo+IE9uIFRodSwgSnVsIDE2LCAyMDI2IGF0IDEyOjU1OjM3UE0gKzAyMDAsIE1p
Y2hhZWwgV2FsbGUgd3JvdGU6DQo+ID4gT24gVGh1IEp1bCAxNiwgMjAyNiBhdCAxMTo0MCBBTSBD
RVNULCBBbmR5IFNoZXZjaGVua28gd3JvdGU6DQo+ID4gPiBPbiBUaHUsIEp1bCAxNiwgMjAyNiBh
dCAxMTowODo1NUFNICswMjAwLCBNaWNoYWVsIFdhbGxlIHdyb3RlOg0KPiA+ID4+IE9uIFRodSBK
dWwgMTYsIDIwMjYgYXQgMTA6MjcgQU0gQ0VTVCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOg0KPiA+
ID4+ID4gT24gVGh1LCBKdWwgMTYsIDIwMjYgYXQgMDI6MjY6MTRQTSArMDgwMCwgWXUtQ2h1biBM
aW4gd3JvdGU6DQo+IA0KPiAuLi4NCj4gDQo+ID4gPj4gPiBGcm9tIHRoZSBhYm92ZSBsaXN0IEkg
dGVuZCB0byB0aGUgYXBwcm9hY2ggMiwgYnV0IHRoaXMgbWlnaHQNCj4gPiA+PiA+IHJlcXVpcmUg
dG8gaGF2ZSBHUElPIHJlZ21hcCBsZXZlbCBvZiBsb2NraW5nLiBJJ20gYSBiaXQgbG9zdCBpbg0K
PiA+ID4+ID4gdGhlIGNvbnRleHQsIHRob3VnaC4gSSBhc3N1bWUgd2UgbmVlZCBhIGZyZXNoIHN0
YXJ0LCBpZCBlc3QgaXNzdWUNCj4gPiA+PiA+IGEgdjYgd2l0aCBhcHByb2FjaCAyIG9yIDMgaW4g
cGxhY2UgYW5kIHN1bW1hcml6ZSB0aGUgY2hvaWNlcyBpbg0KPiA+ID4+ID4gdGhlIGNvdmVyIGxl
dHRlciwgc28gd2UgY2FuIHVuZGVyc3RhbmQgd2hhdCBoYXMgYmVlbiBjb25zaWRlcmVkLg0KPiA+
ID4+DQo+ID4gPj4gSSBkb24ndCByZWFsbHkgbGlrZSBhcHByb2FjaCAzLiBZb3UnZCBuZWVkIHRv
IGNoZWNrIGlmIHRoZSByZWdzIG9mDQo+ID4gPj4gYm90aCB4bGF0ZSBjYWxscyBhcmUgdGhlIHNh
bWUuIFdpdGggdGhlIHNhbXBsZSBjb2RlIGFib3ZlLCB5b3UNCj4gPiA+PiBzaWxlbnRseSBkcm9w
IHRoZSBmaXJzdCB4bGF0ZSdkIHJlZy4NCj4gPiA+DQo+ID4gPiBJZiBJIHJhbmsgdGhlIHByb3Bv
c2FscywgdGhlIHdvcnN0IGlzICMxLCB0aGUgYmVzdCBpcyAjMi4NCj4gPiA+DQo+ID4gPj4gQW5k
IGhvbmVzdGx5LCBpdCByZWFsbHkgc2VlbXMgbGlrZSBhIG9uZS1vZmYuIFdoYXQgY29udHJvbGxl
cnMsIGFyZQ0KPiA+ID4+IHRoZXJlIHRoYXQgbmVlZCBhIHdyaXRlIGVuYWJsZSBiaXQuIFRoZSBy
ZWFsIHByb2JsZW0gc2VlbXMgdG8gYmUNCj4gPiA+PiB0aGUgYXNzdW1wdGlvbiB0aGF0IHdlIG9w
ZXJhdGUgb24ganVzdCBvbmUgYml0LiBJT1cgd2UgZWl0aGVyIHNldA0KPiA+ID4+IG1hc2sgb3Ig
ZG9uJ3Qgc2V0IG1hc2sgaW4gZ3Bpb19yZWdtYXBfc2V0KCkuDQo+ID4gPg0KPiA+ID4gWWVzLCB3
ZSBzaG91bGQgS0lTUy4NCj4gPg0KPiA+IEJ1dCBJTUhPICMyIGFuZCAjMyBhcmUgbm90IEtJU1Mu
IEFwcHJvYWNoIDIgaXMganVzdCBhIHdheSBvZiBhZGRpbmcNCj4gPiBzb21lIGtpbmQgb2YgcHJl
IG9wIHRvIGEgZ3BpbyBzZXQuIEp1c3QgdHlpbmcgaXQgdG8gYSB3cml0ZSBlbmFibGUNCj4gPiBm
ZWF0dXJlLiBUaGF0IGtpbmRhIGJvdGhlcnMgbWUuIEl0IG1pZ2h0IGFsc28gYmUgdXNlZnVsIGZv
ciBvdGhlcg0KPiA+IHRoaW5ncywgdG9vLiBTbyBkb24ndCB0aWUgaXQgdG8ganVzdCB3cml0ZSBl
bmFibGUuIEFuZCB3aG8gaXMgZG9pbmcgYQ0KPiA+IHdyaXRlIGRpc2FibGUgaWYgaXQncyBub3Qg
c2VsZiBjbGVhcmluZyBmb3IgZXhhbXBsZS4gUHJvYmFibHkgU29tZQ0KPiA+IGtpbmQgb2YgcG9z
dCBvcCA6KQ0KPiA+DQo+ID4gQXBwcm9hY2ggMyBpcyBhIHdheSB0byBjaGFuZ2UgdGhlIHZhbHVl
IG9mIHRoZSB3cml0dGVuIHZhbHVlIC0gaW4gYQ0KPiA+IHJlc3RyaWN0ZWQgd2F5LCBhcyBpcyBp
cyBqdXN0IGRvaW5nIGEgT1Igd2l0aCBib3RoIHZhbHVlcy4NCj4gPg0KPiA+IEFsc28gYXBwcm9h
Y2ggMiBtaWdodCBub3QgZXZlbiB3b3JrIGlmIHRoZSBoYXJkd2FyZSByZXF1aXJlcyB0aGUgd3Jp
dGUNCj4gPiBlbmFibGUgYml0IHNldCBpbiB0aGUgKnNhbWUqIHdyaXRlIGFzIHRoZSBncGlvIHNl
dCBiaXQuIFRodXMsIHdlIG1pZ2h0DQo+ID4gbmVlZCBib3RoIGFueXdheSBpbiB0aGUgZnV0dXJl
Lg0KPiA+DQo+ID4gPj4gRm9yIGEgbW9yZSBnZW5lcmljIHNvbHV0aW9uLCB3ZSBzaG91bGQgYmUg
YWJsZSB0byBjb250cm9sIHRoZQ0KPiA+ID4+IHdyaXR0ZW4gdmFsdWUuIFdlIGNvdWxkIGFkZCBh
bm90aGVyIC52YWx1ZV94bGF0ZSgpLg0KPiA+ID4NCj4gPiA+IE1heWJlIG5vdCBub3c/DQo+ID4N
Cj4gPiBCdXQgaWYgbm90IG5vdywgdGhlbiB3aGVuPyBJIHdvdWxkbid0IGFkZCB0aGUgd3JpdGUg
ZW5hYmxlIGZlYXR1cmUgYW5kDQo+ID4gbGF0ZXIgYSBtb3JlIGdlbmVyaWMgc29sdXRpb24gd2hp
Y2ggYWxzbyBjb3ZlcnMgdGhlIHdyaXRlIGVuYWJsZQ0KPiA+IGZlYXR1cmUuDQo+IA0KPiBUYWtp
bmcgaW50byBhY2NvdW50IGhvdyBpdCdzIGRvbmUgaW4gSFcsIEkgdGhpbmsgdGhlIHdob2xlIGFw
cHJvYWNoIGNhbiBiZQ0KPiBmb2xkZWQgdG8ganVzdCBhIGJvb2xlYW4gZmxhZyAgKG9yIGEgc2lt
cGx5IGJpdCBzaGlmdCkgaW4gdGhlIGNvbmZpZy4NCj4gV291bGRuJ3QgaXQgd29yaz8NCj4gDQoN
ClRvIHJlc3BlY3QgTWljaGFlbCdzIHBlcnNwZWN0aXZlIG9uIGtlZXBpbmcgV1JFTi1zcGVjaWZp
YyBjb2RlIG91dCBvZiB0aGUNCmZyYW1ld29yaywgSSB0aGluayBhZGRpbmcgYSB2YWx1ZV94bGF0
ZSBjYWxsYmFjayBpbiB0aGUgY29uZmlnIGlzIGEgY2xlYW5lcg0KYXBwcm9hY2guIEl0IGFsbG93
cyB1cyB0byB3cmFwIHRoaXMgaGFyZHdhcmUgcXVpcmsgd2l0aGluIHRoZSBjYWxsYmFjayBhbmQg
bGV0DQp0aGUgY29uc3VtZXIgZHJpdmVyIGhhbmRsZSBpdCBlbnRpcmVseS4NCg0KVG8gZW5zdXJl
IGl0IGlzIHRydWx5IGdlbmVyaWMsIEkgd2lsbCBub3QgaW50cm9kdWNlIGFueSBXUkVOLXNwZWNp
ZmljIG9wZXJhdGlvbg0KZmxhZ3MuIEluc3RlYWQsIHZhbHVlX3hsYXRlIHdpbGwgcmV1c2UgdGhl
IGdwaW9fcmVnbWFwX29wZXJhdGlvbiBlbnVtDQooZS5nLiwgR1BJT19SRUdNQVBfT1BfU0VULCBH
UElPX1JFR01BUF9PUF9TRVRfRElSKS4NCg0KQmVzdCBSZWdhcmRzLA0KWXUtQ2h1bg0KDQo+ID4g
PiBBcyBwZXIgSVBzLCBTeW5vcHN5cyBJUHMgKG5vdCBleGFjdGx5IEdQSU8pIGxpa2VzIHRvIGhh
dmUgdGhhdCBraW5kDQo+ID4gPiBvZiAicHJvdGVjdGlvbiIuIFNvLCBmcm9tIEhXIHBlcnNwZWN0
aXZlIGl0J3Mga2luZGEgcGF0dGVybiwgYW5kIGl0DQo+ID4gPiBtaWdodCBiZSBwb3NzaWJsZSB0
byBzZWUgbW9yZSBJUHMgKGluY2x1ZGluZyBHUElPKSB0aGF0IGZvbGxvdyBpdCBpbg0KPiA+ID4g
c29tZSBjYXNlcy4NCj4gDQo+IC0tDQo+IFdpdGggQmVzdCBSZWdhcmRzLA0KPiBBbmR5IFNoZXZj
aGVua28NCj4gDQoNCg==

