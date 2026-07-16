Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6AA5C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 10:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g8q/IPRJEYFWmaGWIl+GVaKce9B51slXwOfK6vMI1Ok=; b=sBAb+ERi5PcWWN6HA2h3cpZDyx
	Z/fOHhr4SJ0nhbmVJdGRRBGr379E7fF6DCCbhZl1WVOZv9cVxZFmZ+MSJQOQx15IqBccAizaa85mV
	CjygfNtwFYhGTblVe2YqNh/iJIS+cTsZ2tYhpbvVB6xrVMDETkxZS6SRsA/uHk1IOqVGjUSaCJrAi
	j0KhwcVXT1a7CPKIlMnGs1sUQTRQiKUGeH5pb36uBlUHCirICeuGI1KNRIPwZONI614A+tsOYXBya
	Vy6CwJQrkhfSmFr8rZU9CRd9BjzcNuU/gLizf3a9jQAFHr5R7Z+MAUj2SmhHuWuzHULkWVM4Qs3iV
	yd4eGiIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJeM-0000000H3fa-046h;
	Thu, 16 Jul 2026 10:49:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJeK-0000000H3fK-443C;
	Thu, 16 Jul 2026 10:49:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=g8q/IPRJEYFWmaGWIl+GVaKce9B51slXwOfK6vMI1Ok=; b=al8tBYNH1VV4LxXGWyctPznvG8
	763WoD7FYDIWXvtQmos0ELiORivC8k9T5pdzlb9h+zGPCKLI+DG5OG7cajfzPBO5sk0Yrs9N49K2d
	wAF0kw8EPTSJx5wPxtxFItScCsxXFF6iar/3kZBhDbMHiTurU9OocnCkB0xvw2fbSVe6E831OHICv
	miqt1e3Uf7n8KNWLMTFjoPEFBmtpyKBmISuyjYlUuibDo2LedNa5nzPhVCy8GfUTr7NGPqX+0aVsL
	BZzCxP+atu1gi3GeRpa4MzbCauZ9hlTYyguL3XsMOrv1ZR+tjgOzLuZFhG/LN+z/XFsJ81m1h2zDG
	/aNEnEZw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wkJeA-0000000Dyy0-0JiS;
	Thu, 16 Jul 2026 10:48:57 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66GAlvn673573599, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1784198877; bh=g8q/IPRJEYFWmaGWIl+GVaKce9B51slXwOfK6vMI1Ok=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=cMs7P/zdrQwRsk6OhaEwO4/JaemYB5YvRDOPBAhUPU+kGoyH4ZmzXL3M86q96/BTu
	 PGSsMQssVwApSevUBkdNJAuMB6NV+mjL8LIITXJvI4r3VTPnk27kGxlTl4tXGnGGef
	 r2qFtRSP958S03uy9yPuPgur+DnIRmHm72pvayUaoVnz6tOzQ9pFydz2ao62Ti+Vpr
	 ZIY5PlTAy1N5LaHibAyDle/FD9IwrqXmrWEpsQv3m+Z8G+xu/2u2H+L6bldrIUsYEG
	 DgdIJKWAFghtn+Kv5E05l2he/VRM/B6DrVGnpqjaAT1IkFTfEHUsvCx3khHcRqbmYY
	 uUk1eYgyihleg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66GAlvn673573599
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Jul 2026 18:47:57 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 16 Jul 2026 18:47:56 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 16 Jul 2026 18:47:56 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Thu, 16 Jul 2026 18:47:56 +0800
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
Thread-Index: AQHc4cATPP5CAXxOA0S9aBj6QrzqgrYJ8C6AgFvXxWCACcZxAIAAIc4AgAALpoCAAAi9AIAAl8rg
Date: Thu, 16 Jul 2026 10:47:56 +0000
Message-ID: <9ee344c1d9c642bdb7d3b85bc922fe66@realtek.com>
References: <d301ba0cd45d49d59e6a014188306ec9@realtek.com>
 <20260716062614.1507243-1-eleanor.lin@realtek.com>
 <aliV4u6_xzx9D9Aq@ashevche-desk.local>
 <DJZVLZ4LLD9E.3MPLYYXT1VQ9R@kernel.org>
 <alim_HGTD5RCupav@ashevche-desk.local>
In-Reply-To: <alim_HGTD5RCupav@ashevche-desk.local>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_114855_060060_0CCD53BE 
X-CRM114-Status: GOOD (  33.00  )
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

SGkgQW5keSBhbmQgTWljaGFlbCwNCg0KPiBPbiBUaHUsIEp1bCAxNiwgMjAyNiBhdCAxMTowODo1
NUFNICswMjAwLCBNaWNoYWVsIFdhbGxlIHdyb3RlOg0KPiA+IE9uIFRodSBKdWwgMTYsIDIwMjYg
YXQgMTA6MjcgQU0gQ0VTVCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOg0KPiA+ID4gT24gVGh1LCBK
dWwgMTYsIDIwMjYgYXQgMDI6MjY6MTRQTSArMDgwMCwgWXUtQ2h1biBMaW4gd3JvdGU6DQo+IA0K
PiAuLi4NCj4gDQo+ID4gPiBGcm9tIHRoZSBhYm92ZSBsaXN0IEkgdGVuZCB0byB0aGUgYXBwcm9h
Y2ggMiwgYnV0IHRoaXMgbWlnaHQgcmVxdWlyZQ0KPiA+ID4gdG8gaGF2ZSBHUElPIHJlZ21hcCBs
ZXZlbCBvZiBsb2NraW5nLiBJJ20gYSBiaXQgbG9zdCBpbiB0aGUgY29udGV4dCwNCj4gPiA+IHRo
b3VnaC4gSSBhc3N1bWUgd2UgbmVlZCBhIGZyZXNoIHN0YXJ0LCBpZCBlc3QgaXNzdWUgYSB2NiB3
aXRoDQo+ID4gPiBhcHByb2FjaCAyIG9yIDMgaW4gcGxhY2UgYW5kIHN1bW1hcml6ZSB0aGUgY2hv
aWNlcyBpbiB0aGUgY292ZXINCj4gPiA+IGxldHRlciwgc28gd2UgY2FuIHVuZGVyc3RhbmQgd2hh
dCBoYXMgYmVlbiBjb25zaWRlcmVkLg0KPiA+DQo+ID4gSSBkb24ndCByZWFsbHkgbGlrZSBhcHBy
b2FjaCAzLiBZb3UnZCBuZWVkIHRvIGNoZWNrIGlmIHRoZSByZWdzIG9mDQo+ID4gYm90aCB4bGF0
ZSBjYWxscyBhcmUgdGhlIHNhbWUuIFdpdGggdGhlIHNhbXBsZSBjb2RlIGFib3ZlLCB5b3UNCj4g
PiBzaWxlbnRseSBkcm9wIHRoZSBmaXJzdCB4bGF0ZSdkIHJlZy4NCj4gDQo+IElmIEkgcmFuayB0
aGUgcHJvcG9zYWxzLCB0aGUgd29yc3QgaXMgIzEsIHRoZSBiZXN0IGlzICMyLg0KPiANCj4gPiBB
bmQgaG9uZXN0bHksIGl0IHJlYWxseSBzZWVtcyBsaWtlIGEgb25lLW9mZi4gV2hhdCBjb250cm9s
bGVycywgYXJlDQo+ID4gdGhlcmUgdGhhdCBuZWVkIGEgd3JpdGUgZW5hYmxlIGJpdC4gVGhlIHJl
YWwgcHJvYmxlbSBzZWVtcyB0byBiZSB0aGUNCj4gPiBhc3N1bXB0aW9uIHRoYXQgd2Ugb3BlcmF0
ZSBvbiBqdXN0IG9uZSBiaXQuIElPVyB3ZSBlaXRoZXIgc2V0IG1hc2sgb3INCj4gPiBkb24ndCBz
ZXQgbWFzayBpbiBncGlvX3JlZ21hcF9zZXQoKS4NCj4gDQo+IFllcywgd2Ugc2hvdWxkIEtJU1Mu
DQo+IA0KPiA+IEZvciBhIG1vcmUgZ2VuZXJpYyBzb2x1dGlvbiwgd2Ugc2hvdWxkIGJlIGFibGUg
dG8gY29udHJvbCB0aGUgd3JpdHRlbg0KPiA+IHZhbHVlLiBXZSBjb3VsZCBhZGQgYW5vdGhlciAu
dmFsdWVfeGxhdGUoKS4NCj4gDQo+IE1heWJlIG5vdCBub3c/IEFzIHBlciBJUHMsIFN5bm9wc3lz
IElQcyAobm90IGV4YWN0bHkgR1BJTykgbGlrZXMgdG8gaGF2ZSB0aGF0DQo+IGtpbmQgb2YgInBy
b3RlY3Rpb24iLiBTbywgZnJvbSBIVyBwZXJzcGVjdGl2ZSBpdCdzIGtpbmRhIHBhdHRlcm4sIGFu
ZCBpdCBtaWdodA0KPiBiZSBwb3NzaWJsZSB0byBzZWUgbW9yZSBJUHMgKGluY2x1ZGluZyBHUElP
KSB0aGF0IGZvbGxvdyBpdCBpbiBzb21lIGNhc2VzLg0KPiANCj4gLS0NCj4gV2l0aCBCZXN0IFJl
Z2FyZHMsDQo+IEFuZHkgU2hldmNoZW5rbw0KPiANCg0KSSBjaGVja2VkIHdpdGggb3VyIGludGVy
bmFsIGhhcmR3YXJlIGVuZ2luZWVycy4gVGhlIFdSRU4gYml0IHdhcyBkZXNpZ25lZCB0bw0KYXZv
aWQgcmFjZSBjb25kaXRpb25zLCB3aGljaCByZXF1aXJlcyBib3RoIHRoZSBkYXRhIGJpdCBhbmQg
dGhlIFdSRU4gYml0IHRvIGJlDQp1cGRhdGVkIHNpbXVsdGFuZW91c2x5IHdpdGhpbiB0aGUgc2Ft
ZSByZWdpc3Rlci4NCg0KSSBoYXZlIGEgbmV3IGlkZWEgdGhhdCBtaWdodCBiZSBzaW1pbGFyIHRv
IE1pY2hhZWwncyBzdWdnZXN0aW9uLiBXZSBjYW4NCmludHJvZHVjZSBhIG5ldyBjYWxsYmFjayB0
byBhbGxvdyB0aGUgZHJpdmVyIHRvIGludGVyY2VwdCBhbmQgbW9kaWZ5IHRoZQ0KbWFzayBhbmQg
dGhlIHZhbHVlLiBCeSBkb2luZyBzbywgdGhlIGRyaXZlciBjYW4gZGV0ZXJtaW5lIHRoZSBjb3Jy
ZXNwb25kaW5nDQpXUkVOIGJpdCBiYXNlZCBvbiB0aGUgb3JpZ2luYWwgbWFzaywgYW5kIGFzc2Vt
YmxlIHRoZSBXUkVOIGJpdCBpbnRvIHRoaXMgbmV3DQpjYWxsYmFjayBmdW5jdGlvbiByaWdodCBi
ZWZvcmUgdGhlIGZpbmFsIHdyaXRlIEFQSSBpcyBleGVjdXRlZC4NCg0KVGhlIGlkZWEgbG9va3Mg
bGlrZToNCg0Kc3RhdGljIHZvaWQgZ3Bpb19yZWdtYXBfc2V0KHN0cnVjdCBncGlvX2NoaXAgKmNo
aXAsIHVuc2lnbmVkIGludCBvZmZzZXQsDQoJCQkgICBpbnQgdmFsKQ0Kew0KCXN0cnVjdCBncGlv
X3JlZ21hcCAqZ3BpbyA9IGdwaW9jaGlwX2dldF9kYXRhKGNoaXApOw0KCXVuc2lnbmVkIGludCBi
YXNlID0gZ3Bpb19yZWdtYXBfYWRkcihncGlvLT5yZWdfc2V0X2Jhc2UpOw0KCXVuc2lnbmVkIGlu
dCByZWcsIG1hc2ssIG1hc2tfdmFsLCB3cmVuX3JlZywgd3Jlbl9tYXNrOw0KCWludCByZXQ7DQoN
CglyZXQgPSBncGlvLT5yZWdfbWFza194bGF0ZShncGlvLCBHUElPX1JFR01BUF9TRVRfT1AsIGJh
c2UsIG9mZnNldCwgJnJlZywgJm1hc2spOw0KCWlmIChyZXQpDQoJCXJldHVybjsNCg0KCWlmICh2
YWwpDQoJCW1hc2tfdmFsID0gbWFzazsNCgllbHNlDQoJCW1hc2tfdmFsID0gMDsNCg0KICAgIC8q
IExldCB0aGUgZHJpdmVyIG1vZGlmeSB0aGUgbWFzayBhbmQgbWFza192YWwgdG8gaW5jbHVkZSBX
UkVOICovDQoJaWYgKGdwaW8tPnZhbHVlX3hsYXRlKSB7DQoJCXJldCA9IGdwaW8tPnZhbHVlX3hs
YXRlKCZtYXNrLCAmbWFza192YWwpOw0KCQlpZiAocmV0KQ0KCQkJcmV0dXJuIHJldDsNCgl9DQoN
CgkvKiBpZ25vcmUgaW5wdXQgdmFsdWVzIHdoaWNoIHNoYWRvdyB0aGUgb2xkIG91dHB1dCB2YWx1
ZSAqLw0KCWlmIChncGlvLT5yZWdfZGF0X2Jhc2UgPT0gZ3Bpby0+cmVnX3NldF9iYXNlKQ0KCQly
ZXQgPSByZWdtYXBfd3JpdGVfYml0cyhncGlvLT5yZWdtYXAsIHJlZywgbWFzaywgbWFza192YWwp
Ow0KCWVsc2UNCgkJcmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKGdwaW8tPnJlZ21hcCwgcmVnLCBt
YXNrLCBtYXNrX3ZhbCk7DQoNCglyZXR1cm4gcmV0Ow0KfQ0KDQpCZXN0IFJlZ2FyZHMsDQpZdS1D
aHVuDQo=

