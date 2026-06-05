Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031BECD6E74
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 10:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9SIK4GJUuNVm7UrlcAc52/GfJDsjxbvisMEnTElK+V0=; b=oTYofqMN/cnJACqcd4V9g9n2TW
	5BcpHXzz1YhFKZbtMvtukB+BU3goyPNFYUAfs7C4CZOh1h6lpuARvhtSk+zyfXXWIAdKuQcRjLy6a
	4RTJIFUA3MoR9fkyNjis4nVDsUzBzvsEeNRJoclC1LBt7/NlbwPlVsUOYRbloQRvQkYVrHJseHMVe
	cB5bviCb+lKKOHK4lBo6pgjk5p5UBL4KoFGRHFwKZAJaXo+YMXUZ8lUvlfGApmwxg0c5MT84z3BDm
	9XTV3b30uC4i8P8c0l5rsS7Ww8frlmDkIsD/ad+0uYYTgl0IMe4ATJzfUQHi/3cFdnGsP46V8I81J
	L4kL7rjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVReU-00000000TXt-3MJK;
	Fri, 05 Jun 2026 10:19:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVReT-00000000TWu-1uhX;
	Fri, 05 Jun 2026 10:19:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9SIK4GJUuNVm7UrlcAc52/GfJDsjxbvisMEnTElK+V0=; b=qpR3Zt7j9s2lzcRWzBYRqP6ujU
	k91quB2QbmPEPoY1bHSA8FEf044TEDb0DdzJItjhte8xnqrWrezs2tvckzQfEjcPu1yw/tyqdh0tL
	FseuNCN5oXv/UnTi4psh1peiSGfMtx97ATm0GzIU3K576fvkvysNCTMqE7lw4M63K0U0wXTVK1+rs
	ENQFyeR74oAUKqKZ5ym6wE+nm/TGudwU4gJtXkagZRA5uChjIrFzJXdNsl1VfZO5bHk5GC+cioe88
	BrTMBmmt6CLtjqPuN9XllNYmVfKS4g2T3cOuWcRo6TMWJfMpBFsp/YEYHg1mc1qGXyLfJgrfGVHjV
	SRlexUGw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wVReP-0000000FRn9-0QLp;
	Fri, 05 Jun 2026 10:19:44 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 655AJBDF01318468, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1780654751; bh=9SIK4GJUuNVm7UrlcAc52/GfJDsjxbvisMEnTElK+V0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=KvsDFQh36MtAxNsNGLHH16+QXZXZVewq2yPGkWuLTlEGINAk6IwToXbRBSlmUkv4w
	 VzKkagyUMG+JSequrehMvf/7NpwChxD/Aca/oY46XU710T6HWyZ0jwRiQ4Sl076DwW
	 wbPfTmk0ylswf9GjShl+92Ju77QUmY+hEo4NdZqisLGS1yXXEOMeiUXbww1ADDdF2U
	 RHzDG9oEhcr15e6do0ueZ55q1Quvq4M2YrTJGUtUgmXLzM8d+r9tyrEe0ObiYQWUxA
	 LchRfbUIasXQ/IlMvmqUqjMT4idsAAPP8dc17XAM3V2qs15u4qoGyMikhgnypXES6O
	 1bJISGiDUqmow==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.28/5.94) with ESMTPS id 655AJBDF01318468
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 5 Jun 2026 18:19:11 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Jun 2026 18:19:11 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Fri, 5 Jun 2026 18:19:11 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>
CC: =?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
	=?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>,
	=?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
	"afaerber@suse.com" <afaerber@suse.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>
Subject: RE: [PATCH 1/3] dt-bindings: soc: realtek: Add Realtek DHC I/O level
 detector
Thread-Topic: [PATCH 1/3] dt-bindings: soc: realtek: Add Realtek DHC I/O level
 detector
Thread-Index: AQHc9BPaRmrrx5++SE6AdRHOCxFbW7Yt0tqAgAHtDsA=
Date: Fri, 5 Jun 2026 10:19:11 +0000
Message-ID: <1850ca790a2f4af1b1682aeb437e47fc@realtek.com>
References: <20260604111821.975624-1-eleanor.lin@realtek.com>
 <20260604111821.975624-2-eleanor.lin@realtek.com>
 <4d96835a-a273-4c46-85a2-03c059934650@kernel.org>
In-Reply-To: <4d96835a-a273-4c46-85a2-03c059934650@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_111942_210431_A52940B0 
X-CRM114-Status: GOOD (  22.19  )
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

PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFRo
dXJzZGF5LCBKdW5lIDQsIDIwMjYgODo0OSBQTQ0KPiBUbzogWXUtQ2h1biBMaW4gW+ael+elkOWQ
m10gPGVsZWFub3IubGluQHJlYWx0ZWsuY29tPjsgcm9iaEBrZXJuZWwub3JnOw0KPiBrcnprK2R0
QGtlcm5lbC5vcmc7IGNvbm9yK2R0QGtlcm5lbC5vcmc7IFRZX0NoYW5nW+W8teWtkOmAuF0NCj4g
PHR5Y2hhbmdAcmVhbHRlay5jb20+DQo+IENjOiBDWV9IdWFuZ1vpu4PpiabmmY9dIDxjeS5odWFu
Z0ByZWFsdGVrLmNvbT47IFN0YW5sZXkgQ2hhbmdb5piM6IKy5b63XQ0KPiA8c3RhbmxleV9jaGFu
Z0ByZWFsdGVrLmNvbT47IEphbWVzIFRhaSBb5oi05b+X5bOwXSA8amFtZXMudGFpQHJlYWx0ZWsu
Y29tPjsNCj4gYWZhZXJiZXJAc3VzZS5jb207IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmc7IGxpbnV4LXJlYWx0ZWstc29jQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCAxLzNdIGR0LWJpbmRpbmdzOiBzb2M6IHJlYWx0ZWs6IEFkZCBSZWFs
dGVrIERIQyBJL08gbGV2ZWwNCj4gZGV0ZWN0b3INCj4gDQo+IE9uIDA0LzA2LzIwMjYgMTM6MTgs
IFl1LUNodW4gTGluIHdyb3RlOg0KPiA+IEZyb206IFR6dXlpIENoYW5nIDx0eWNoYW5nQHJlYWx0
ZWsuY29tPg0KPiA+DQo+ID4gQWRkIGRldmljZSB0cmVlIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBm
b3IgdGhlIFJlYWx0ZWsgREhDIEkvTyBsZXZlbA0KPiA+IGRldGVjdG9yLg0KPiA+DQo+ID4gVGhp
cyBoYXJkd2FyZSBibG9jayBpcyByZXNwb25zaWJsZSBmb3IgZGV0ZWN0aW5nIHRoZSBJL08gc2ln
bmFsaW5nDQo+ID4gbGV2ZWxzIChlLmcuLCAxLjhWIG9yIDMuM1YpIG9mIHZhcmlvdXMgaW50ZXJm
YWNlcyAoUkdNSUksIFNESU8sIGVNTUMsDQo+ID4gZXRjLikgYW5kIGFwcGx5aW5nIHRoZSBjb3Jy
ZXNwb25kaW5nIHBhZCBjb25maWd1cmF0aW9ucyB2aWEgcGluY3RybA0KPiA+IHN0YXRlcy4NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IFR6dXlpIENoYW5nIDx0eWNoYW5nQHJlYWx0ZWsuY29tPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IFl1LUNodW4gTGluIDxlbGVhbm9yLmxpbkByZWFsdGVrLmNvbT4N
Cj4gPiAtLS0NCj4gPiAgLi4uL3JlYWx0ZWsvcmVhbHRlayxydGQxNjI1LWlvLWRldGVjdC55YW1s
ICAgIHwgNzcgKysrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNzcgaW5z
ZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvc29jL3JlYWx0ZWsvcmVhbHRlayxydGQxNjI1LWlvLWRldGVjDQo+
ID4gdC55YW1sDQo+ID4NCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc29jL3JlYWx0ZWsvcmVhbHRlayxydGQxNjI1LWlvLWRldA0KPiA+IGVj
dC55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL3JlYWx0
ZWsvcmVhbHRlayxydGQxNjI1LWlvLWRldA0KPiA+IGVjdC55YW1sDQo+ID4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmJhZGYyNzIxMmRmZA0KPiA+IC0tLSAv
ZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29j
L3JlYWx0ZWsvcmVhbHRlayxydGQxNjI1LWlvDQo+ID4gKysrIC1kZXRlY3QueWFtbA0KPiA+IEBA
IC0wLDAgKzEsNzcgQEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAg
T1IgQlNELTItQ2xhdXNlKSAjIENvcHlyaWdodCAyMDI2DQo+ID4gK1JlYWx0ZWsgU2VtaWNvbmR1
Y3RvciBDb3Jwb3JhdGlvbiAlWUFNTCAxLjINCj4gPiArLS0tDQo+ID4gKyRpZDoNCj4gPiAraHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvc29jL3JlYWx0ZWsvcmVhbHRlayxydGQxNjI1LWlv
LWRldGVjdC55DQo+ID4gK2FtbCMNCj4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3Jn
L21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4gKw0KPiA+ICt0aXRsZTogUmVhbHRlayBESEMg
SS9PIExldmVsIERldGVjdG9yDQo+ID4gKw0KPiA+ICttYWludGFpbmVyczoNCj4gPiArICAtIFR6
dXlpIENoYW5nIDx0eWNoYW5nQHJlYWx0ZWsuY29tPg0KPiA+ICsNCj4gPiArZGVzY3JpcHRpb246
IHwNCj4gDQo+IERyb3AgfA0KPiANCj4gPiArICBUaGUgUmVhbHRlayBESEMgSS9PIExldmVsIERl
dGVjdG9yIGlzIGEgaGFyZHdhcmUgYmxvY2sgdGhhdCBkZXRlY3RzDQo+ID4gKyBJL08gIHNpZ25h
bGluZyBsZXZlbHMgKHN1Y2ggYXMgMS44ViBvciAzLjNWKSB0byBkZXRlcm1pbmUgdGhlDQo+ID4g
KyBjb3JyZWN0IHBhZCAgY29uZmlndXJhdGlvbnMgZm9yIHNwZWNpZmljIElQIGJsb2Nrcy4NCj4g
PiArDQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAgY29tcGF0aWJsZToNCj4gPiArICAgIGNvbnN0
OiByZWFsdGVrLHJ0ZDE2MjUtaW8tZGV0ZWN0DQo+ID4gKw0KPiANCj4gTm8gcmVzb3VyY2VzIGhl
cmUsIHNvIGRvZXMgbm90IGxvb2sgbGlrZSBhIHJlYWwgZGV2aWNlLCBidXQgZHJpdmVyIGluc3Rh
bnRpYXRpb24uDQo+IA0KDQpIaSBLcnp5c3p0b2YsDQoNCllvdSdyZSByaWdodCwgSXQgc2hvdWxk
bid0IGludHJvZHVjZSBhIGRldmljZSBub2RlIGp1c3QgZm9yIGEgc29mdHdhcmUgZHJpdmVyLg0K
DQpGb3IgdjIsIHdlJ2xsIGRyb3AgdGhpcyBiaW5kaW5nIGFuZCB0aGUgZGV2aWNlIG5vZGUsIGFu
ZCByZXZpc2l0IHRoZSBhcHByb2FjaC4NCg0KQmVzdCByZWdhcmRzLA0KWXUtQ2h1bg0KDQo+IA0K
PiA+ICsgIHBpbmN0cmwtbmFtZXM6DQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAgICAgLSBjb25z
dDogcmdtaWlfMXY4DQo+ID4gKyAgICAgIC0gY29uc3Q6IHJnbWlpXzN2Mw0KPiA+ICsgICAgICAt
IGNvbnN0OiBzZGlvXzF2OA0KPiA+ICsgICAgICAtIGNvbnN0OiBzZGlvXzN2Mw0KPiA+ICsgICAg
ICAtIGNvbnN0OiBjc2lfMXY4DQo+ID4gKyAgICAgIC0gY29uc3Q6IGNzaV8zdjMNCj4gPiArICAg
ICAgLSBjb25zdDogc2RfMXY4DQo+ID4gKyAgICAgIC0gY29uc3Q6IHNkXzN2Mw0KPiA+ICsgICAg
ICAtIGNvbnN0OiB1YXJ0MV8xdjgNCj4gPiArICAgICAgLSBjb25zdDogdWFydDFfM3YzDQo+ID4g
KyAgICAgIC0gY29uc3Q6IGFpb18xdjgNCj4gPiArICAgICAgLSBjb25zdDogYWlvXzN2Mw0KPiA+
ICsgICAgICAtIGNvbnN0OiBlbW1jXzF2OA0KPiA+ICsgICAgICAtIGNvbnN0OiBlbW1jXzN2Mw0K
PiA+ICsNCj4gPiArICByZWFsdGVrLGlzby1waW5jdHJsOg0KPiA+ICsgICAgJHJlZjogL3NjaGVt
YXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQ0KPiA+ICsgICAgZGVzY3JpcHRpb246
DQo+ID4gKyAgICAgIFBpbmN0cmwgcGhhbmRsZSBjb250YWluaW5nIEkvTyBkZXRlY3Rpb24gcmVn
aXN0ZXJzLg0KPiANCj4gTU1JTyByZWdpc3RlcnMgYXJlIGluICdyZWcnIHByb3BlcnR5Lg0KPiAN
Cj4gPiArDQo+ID4gK3JlcXVpcmVkOg0KPiA+ICsgIC0gY29tcGF0aWJsZQ0KPiA+ICsgIC0gcGlu
Y3RybC1uYW1lcw0KPiA+ICsgIC0gcmVhbHRlayxpc28tcGluY3RybA0KPiBCZXN0IHJlZ2FyZHMs
DQo+IEtyenlzenRvZg0K

