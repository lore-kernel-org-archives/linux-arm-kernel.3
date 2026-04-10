Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D301AE99055
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 08:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T1L02dg6RFoVGQ/FlKFkoyuOT9BMekcepcLQCo7lU0s=; b=MEWWM4ppan+f5vzujsttqZwvM5
	rO/1rG+BpvkMqqjvxFeLzwBcWaIwV+JqQqDRrrWypNwu8x7d46EC9d4bcb23nClaFpnOaMOgdX6L3
	oK6G7A4MAnK+OPOEOuhItqcosXGdAwo65kMUWrO23zTHdJCWsgxLWKD3khfTMz7xE5satNzA8gsX2
	PKGXOsNxxqbzbJnj0SLPtAot+l1jSk1qSRXnCK2RkyV/ym2dC/VehBAY/s3WBZe2b//TMtnPPx/5h
	D4YneHf2D6sapxNG3QRIgmwGa6JoLlwQCGU7HXzRDscpykMmEU9XRuqiDjtk4iVAeRe4xbn9Sd78V
	2P2Ackow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB7As-0000000Bq1h-3QWR;
	Fri, 10 Apr 2026 08:25:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB7Ar-0000000Bq1X-1MAc;
	Fri, 10 Apr 2026 08:25:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=T1L02dg6RFoVGQ/FlKFkoyuOT9BMekcepcLQCo7lU0s=; b=kiTIymvnDrPVzUujsZGcUOc38v
	ulKagkUB+nv1zJN7RBtyL6mz+bGQKPnAK9aWd2ZOvgrWB8E2sh8E87cV/7CAJA5X6tLM/nfmMrbho
	lBMasF7G8SzUutbZUr35ZdejFzdMNSFgkX9ZWn6o6f964715jlAIItXaDeSPwf43BwVlBw8wKVWpU
	QbbR/f+bLpBFJLWdgoI0HIB2LWQJ3EiOZmrvCojkS27dH88ucZInYuOApHq9NKSHH8omrK8pu7yfI
	bnqgjf21EdZn9QWSOGNy/D0jB0qmnVjzqJ2MVs6ic9AGq7AolH29U3wDGJ4NwQf0qRAjrnWss1O/M
	MhetyxMQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB7An-0000000D53Q-2zPq;
	Fri, 10 Apr 2026 08:25:08 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 63A8OtG022684423, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1775809496; bh=T1L02dg6RFoVGQ/FlKFkoyuOT9BMekcepcLQCo7lU0s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=dX7mU6hMx7fHwoB6gnF4ogNRjbZpMuQdusgt1SJVYLg6pxmLuFsykZvk9a5ywBncc
	 ldEyaO5MrSe3ECtX14tY75fbIBXDflKZgl5xToL4g8WTBffZOWaFlf2mmgtTQ/HEvL
	 YiCq2J5KFm7LMYnwIlGa2bO3aUHPItObAXdJ7FxV+k0UUzwKP7SDSxgksT3rPGmJYc
	 6pseC9IeZC3Uti3Wk/6czSumGGSVB6hATcFY4GJvvMaOnKITPZ0ASaxbZFFW08wX/K
	 TVO+VmXOOm6M8Vu4m/UWrCWHrbf9RZ7CZA5R/IlrEf36o8bxehJCAE4RnfRctUA1/A
	 xyqD8zo5Z8dHw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 63A8OtG022684423
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Apr 2026 16:24:55 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 10 Apr 2026 16:24:55 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458%10]) with mapi id
 15.02.1748.010; Fri, 10 Apr 2026 16:24:55 +0800
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
Subject: RE: [PATCH v6 06/10] clk: realtek: Add support for mux clock
Thread-Topic: [PATCH v6 06/10] clk: realtek: Add support for mux clock
Thread-Index: AQHcwnPq8HmZxIkpqUqMP4W7CMRK7rXM6G+AgAsZZvA=
Date: Fri, 10 Apr 2026 08:24:55 +0000
Message-ID: <603e602b8a294e0ea26e818226087bb7@realtek.com>
References: <20260402073957.2742459-1-eleanor.lin@realtek.com>
 <20260402073957.2742459-7-eleanor.lin@realtek.com>
 <ac_UkRiqWb6fSc1I@redhat.com>
In-Reply-To: <ac_UkRiqWb6fSc1I@redhat.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_092506_443272_9249F4D6 
X-CRM114-Status: GOOD (  31.69  )
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

SGkgQnJpYW4sDQoNCj4gSGkgWXUtQ2h1biBhbmQgQ2hlbmctWXUsDQo+IA0KPiBPbiBUaHUsIEFw
ciAwMiwgMjAyNiBhdCAwMzozOTo1M1BNICswODAwLCBZdS1DaHVuIExpbiB3cm90ZToNCj4gPiBG
cm9tOiBDaGVuZy1ZdSBMZWUgPGN5bGVlMTJAcmVhbHRlay5jb20+DQo+ID4NCj4gPiBBZGQgYSBz
aW1wbGUgcmVnbWFwLWJhc2VkIGNsa19vcHMgaW1wbGVtZW50YXRpb24gZm9yIFJlYWx0ZWsgbXV4
IGNsb2Nrcy4NCj4gPg0KPiA+IFRoZSBpbXBsZW1lbnRhdGlvbiBzdXBwb3J0cyBwYXJlbnQgc2Vs
ZWN0aW9uIGFuZCByYXRlIGRldGVybWluYXRpb24NCj4gPiB0aHJvdWdoIHJlZ21hcC1iYWNrZWQg
cmVnaXN0ZXIgYWNjZXNzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2hlbmctWXUgTGVlIDxj
eWxlZTEyQHJlYWx0ZWsuY29tPg0KPiA+IENvLWRldmVsb3BlZC1ieTogWXUtQ2h1biBMaW4gPGVs
ZWFub3IubGluQHJlYWx0ZWsuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFl1LUNodW4gTGluIDxl
bGVhbm9yLmxpbkByZWFsdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiBDaGFuZ2VzIGluIHY2Og0KPiA+
IC0gQWRkIHRoZSBoZWFkZXJzIHVzZWQgaW4gYyBmaWxlIHRvIGZvbGxvdyB0aGUgIkluY2x1ZGUg
V2hhdCBZb3UgVXNlIg0KPiBwcmluY2lwbGUuDQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvY2xrL3Jl
YWx0ZWsvTWFrZWZpbGUgICAgICAgICB8ICAxICsNCj4gPiAgZHJpdmVycy9jbGsvcmVhbHRlay9j
bGstcmVnbWFwLW11eC5jIHwgNDgNCj4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrICBk
cml2ZXJzL2Nsay9yZWFsdGVrL2Nsay1yZWdtYXAtbXV4LmggfA0KPiA+IDQzICsrKysrKysrKysr
KysrKysrKysrKysrKysNCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA5MiBpbnNlcnRpb25zKCspDQo+
ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9yZWFsdGVrL2Nsay1yZWdtYXAtbXV4
LmMNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xrL3JlYWx0ZWsvY2xrLXJlZ21h
cC1tdXguaA0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3JlYWx0ZWsvTWFrZWZp
bGUNCj4gPiBiL2RyaXZlcnMvY2xrL3JlYWx0ZWsvTWFrZWZpbGUgaW5kZXggNzQzNzVmODEyN2Fj
Li5mOTBkYzU3ZmNmZGIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9jbGsvcmVhbHRlay9NYWtl
ZmlsZQ0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3JlYWx0ZWsvTWFrZWZpbGUNCj4gPiBAQCAtNSw0
ICs1LDUgQEAgY2xrLXJ0ay15ICs9IGNvbW1vbi5vDQo+ID4NCj4gPiAgY2xrLXJ0ay15ICs9IGNs
ay1wbGwubw0KPiA+ICBjbGstcnRrLXkgKz0gY2xrLXJlZ21hcC1nYXRlLm8NCj4gPiArY2xrLXJ0
ay15ICs9IGNsay1yZWdtYXAtbXV4Lm8NCj4gPiAgY2xrLXJ0ay15ICs9IGZyZXFfdGFibGUubw0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9yZWFsdGVrL2Nsay1yZWdtYXAtbXV4LmMNCj4g
PiBiL2RyaXZlcnMvY2xrL3JlYWx0ZWsvY2xrLXJlZ21hcC1tdXguYw0KPiA+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi4wNjhiMDU2ZDYxZjANCj4gPiAtLS0g
L2Rldi9udWxsDQo+ID4gKysrIGIvZHJpdmVycy9jbGsvcmVhbHRlay9jbGstcmVnbWFwLW11eC5j
DQo+ID4gQEAgLTAsMCArMSw0OCBAQA0KPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMC1vbmx5DQo+ID4gKy8qDQo+ID4gKyAqIENvcHlyaWdodCAoQykgMjAxNyBSZWFsdGVr
IFNlbWljb25kdWN0b3IgQ29ycG9yYXRpb24NCj4gPiArICogQXV0aG9yOiBDaGVuZy1ZdSBMZWUg
PGN5bGVlMTJAcmVhbHRlay5jb20+ICAqLw0KPiA+ICsNCj4gPiArI2luY2x1ZGUgPGxpbnV4L3Jl
Z21hcC5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvY2xrLXByb3ZpZGVyLmg+DQo+IA0KPiBTb3J0
IHRoZSBpbmNsdWRlcy4NCj4gDQoNCkFjay4NCg0KPiA+ICsjaW5jbHVkZSAiY2xrLXJlZ21hcC1t
dXguaCINCj4gPiArDQo+ID4gK3N0YXRpYyB1OCBjbGtfcmVnbWFwX211eF9nZXRfcGFyZW50KHN0
cnVjdCBjbGtfaHcgKmh3KSB7DQo+ID4gKyAgICAgc3RydWN0IGNsa19yZWdtYXBfbXV4ICpjbGtt
ID0gdG9fY2xrX3JlZ21hcF9tdXgoaHcpOw0KPiA+ICsgICAgIGludCBudW1fcGFyZW50cyA9IGNs
a19od19nZXRfbnVtX3BhcmVudHMoaHcpOw0KPiA+ICsgICAgIHUzMiB2YWw7DQo+ID4gKyAgICAg
aW50IHJldDsNCj4gPiArDQo+ID4gKyAgICAgcmV0ID0gcmVnbWFwX3JlYWQoY2xrbS0+Y2xrci5y
ZWdtYXAsIGNsa20tPm11eF9vZnMsICZ2YWwpOw0KPiA+ICsgICAgIGlmIChyZXQpDQo+ID4gKyAg
ICAgICAgICAgICByZXR1cm4gMDsNCj4gDQo+IFRoaXMgaXMgYW5vdGhlciBjYXNlIHdoZXJlIGl0
J2QgYmUgbmljZSB0byBnZXQgdGhlIGdldF9wYXJlbnQgZGVjbGFyYXRpb24gZml4ZWQuDQo+IFN0
ZXBoZW4gcmVjZW50bHkgbGlua2VkIHRvIHNvbWUgd29yayBvZiBoaXMgZnJvbSAyMDIyIGhlcmUu
DQo+IA0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1jbGsvMTc3NDMxMzA1NTA5LjU0
MDMuMTUzODYwMjEzMzc1MTc5NzA2NjcNCj4gQGxhem9yLw0KPiANCj4gVGhlcmUncyBub3RoaW5n
IGZvciB5b3UgdG8gZG8gcmlnaHQgbm93Lg0KPiANCj4gPiArDQo+ID4gKyAgICAgdmFsID0gdmFs
ID4+IGNsa20tPnNoaWZ0ICYgY2xrbS0+bWFzazsNCj4gDQo+IEkga25vdyB0aGVyZSdzIHRoZSBv
cmRlciBvZiBvcGVyYXRpb25zLCBob3dldmVyIGZvciBjbGFyaXR5IEkgd291bGQganVzdCBpbmNs
dWRlDQo+IHNvbWUgKCkgaGVyZSB0byBtYWtlIGl0IGNsZWFyIHRoZSBleHBlY3RlZCBvcmRlci4N
Cg0KQWNrLg0KDQo+ID4gKw0KPiA+ICsgICAgIGlmICh2YWwgPj0gbnVtX3BhcmVudHMpDQo+IA0K
PiBSZW1vdmUgbmV3bGluZSBiZWZvcmUgaWYuDQoNCkFjay4NCg0KPiANCj4gPiArICAgICAgICAg
ICAgIHJldHVybiAwOw0KPiA+ICsNCj4gPiArICAgICByZXR1cm4gdmFsOw0KPiANCj4gT3IgeW91
IGNvdWxkIGp1c3QgdXNlIGEgdGVybmFyeSBvcGVyYXRvcjoNCj4gDQo+IHJldHVybiB2YWwgPj0g
bnVtX3BhcmVudHMgPyAwIDogdmFsOw0KPiANCg0KQWNrLg0KDQo+ID4gK30NCj4gPiArDQo+ID4g
K3N0YXRpYyBpbnQgY2xrX3JlZ21hcF9tdXhfc2V0X3BhcmVudChzdHJ1Y3QgY2xrX2h3ICpodywg
dTggaW5kZXgpIHsNCj4gPiArICAgICBzdHJ1Y3QgY2xrX3JlZ21hcF9tdXggKmNsa20gPSB0b19j
bGtfcmVnbWFwX211eChodyk7DQo+ID4gKw0KPiA+ICsgICAgIHJldHVybiByZWdtYXBfdXBkYXRl
X2JpdHMoY2xrbS0+Y2xrci5yZWdtYXAsIGNsa20tPm11eF9vZnMsDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjbGttLT5tYXNrIDw8IGNsa20tPnNoaWZ0LCBpbmRleCA8PA0K
PiA+ICtjbGttLT5zaGlmdCk7IH0NCj4gPiArDQo+ID4gK2NvbnN0IHN0cnVjdCBjbGtfb3BzIHJ0
a19jbGtfcmVnbWFwX211eF9vcHMgPSB7DQo+ID4gKyAgICAgLnNldF9wYXJlbnQgPSBjbGtfcmVn
bWFwX211eF9zZXRfcGFyZW50LA0KPiA+ICsgICAgIC5nZXRfcGFyZW50ID0gY2xrX3JlZ21hcF9t
dXhfZ2V0X3BhcmVudCwNCj4gPiArICAgICAuZGV0ZXJtaW5lX3JhdGUgPSBfX2Nsa19tdXhfZGV0
ZXJtaW5lX3JhdGUsIH07DQo+ID4gK0VYUE9SVF9TWU1CT0xfTlNfR1BMKHJ0a19jbGtfcmVnbWFw
X211eF9vcHMsICJSRUFMVEVLX0NMSyIpOw0KPiA+ICsNCj4gPiArY29uc3Qgc3RydWN0IGNsa19v
cHMgcnRrX2Nsa19yZWdtYXBfbXV4X3JvX29wcyA9IHsNCj4gPiArICAgICAuZ2V0X3BhcmVudCA9
IGNsa19yZWdtYXBfbXV4X2dldF9wYXJlbnQsIH07DQo+ID4gK0VYUE9SVF9TWU1CT0xfTlNfR1BM
KHJ0a19jbGtfcmVnbWFwX211eF9yb19vcHMsICJSRUFMVEVLX0NMSyIpOw0KPiANCj4gcnRrX2Ns
a19yZWdtYXBfbXV4X3JvX29wcyBpcyBleHBvcnRlZCwgaG93ZXZlciB0aGUgZGVjbGFyYXRpb24g
aXMgbm90DQo+IGFjdHVhbGx5IGRlY2xhcmVkIGluIGFueSBoZWFkZXIgZmlsZXMuDQo+IA0KPiBC
cmlhbg0KDQpTaW5jZSBpdCBpcyBjdXJyZW50bHkgdW51c2VkLCBJIHdpbGwgZHJvcCB0aGUgJ3J0
a19jbGtfcmVnbWFwX211eF9yb19vcHMnDQppbXBsZW1lbnRhdGlvbi4NCg0KQmVzdCBSZWdhcmRz
LA0KWXUtQ2h1bi4NCg==

