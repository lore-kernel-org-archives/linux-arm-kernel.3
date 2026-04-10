Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56C3F36BBF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 06:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQdqe7+anrwPXHbdSUwofGdyqwbRhOA59PuIIYeANnM=; b=Pd18OSjug4IZuH2BTy/E85cCmq
	i7wBtfnZ1/5aci6BMXKLPK+YzZ8OaNKTRkn7zH4UuhT3xDeVWOFYuEGUQbnHWIswM6yJPD0PVGnmu
	blnivurfls3EqeBEYz6Jz1Pi6TYEYVqN5pFnkqBOVIGRdu8x69TKlDbz8mBNPXvKDhTKFFnDNMeML
	jc3x1bY2sDIJLG3q2G3CeuxSa9cyfD8oMrQVc7pWnxONknTRjpNUCcjsLBWbahpxjiZcD+waMEdf4
	cQ7jxyZysq27H8rS4CusazXTy+39rdlYC8EfY+guUNWf42ysY/HnlJypjMsxLjSruM1H90bfffISk
	jeCLG2IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB5id-0000000BhP2-1tSh;
	Fri, 10 Apr 2026 06:51:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB5ic-0000000BhOk-0OYP;
	Fri, 10 Apr 2026 06:51:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tQdqe7+anrwPXHbdSUwofGdyqwbRhOA59PuIIYeANnM=; b=ULLQ9Ciwr92j2b7hr1cEJDARPK
	VxXxPV1aY4k1Dklk10J4ifkajUqUA1Jd/QdAcOToNisb7HgY1pi3L+CQCtMu+y9WoMotTGsTY0R6j
	sBT36grxxMVTYmKE2NUyr+tR3afJW83XC+BVbrDO5fKktOXYs/MN9PyZdN3NoFAj6tt2nwSFVb7aA
	WVyui+biVOsHk96vXT1UW351UyLDvaJiv7iuZtBoV0UsvKkJBR5MVLlk2VPx16Squz7umf0Wbb3e5
	PXQU5PA3ot75gTI0mILmkWGMrF9IpX2x9bOzuU9GhBLAkLWUpq5OBICxiawAr5IeBkTdKiCLbfzBf
	vCj8veFg==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB5iY-0000000Cx9B-1C08;
	Fri, 10 Apr 2026 06:51:52 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 63A6n5ZH12561100, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1775803745; bh=tQdqe7+anrwPXHbdSUwofGdyqwbRhOA59PuIIYeANnM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=GHoW/yyUemygLZgpndO8Np3BScTs5bemmVEBsjDNi5cGZNTt/V10nsJgjaPXbFeJU
	 uCjUE9Ua+DibGFCapksLf5l4EKLXnBg+Yc9Tt2DQbQK4ifbIaZaArVSt8fjInqXbFY
	 LTQxkAczV4+FL64suTu/teyPv/v/Dc6jlt1My37pOww2MVWAJh/JzZiyQYzHY4wBXN
	 3RcdDSZUGwIjObTDq120yyUT9XpR95o7IqNmJ49nVAJmp5RK008BG12ThOCd+h9wOm
	 TzUwqndJGlTbHVjWMk2REcqrRcXksyo3Ho2TNyucY1U8uU6Mg34xf7/8+V6erETAED
	 qi6t2GdfJWuwQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 63A6n5ZH12561100
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Apr 2026 14:49:05 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 10 Apr 2026 14:49:05 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 10 Apr 2026 14:49:05 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458%10]) with mapi id
 15.02.1748.010; Fri, 10 Apr 2026 14:49:05 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
        "mturquette@baylibre.com"
	<mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        =?utf-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
        "afaerber@suse.com" <afaerber@suse.com>,
        =?utf-8?B?SnlhbiBDaG91IFvlkajoirflrold?= <jyanchou@realtek.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
        =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
        =?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
        =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>
Subject: RE: [PATCH v6 02/10] reset: Add Realtek basic reset support
Thread-Topic: [PATCH v6 02/10] reset: Add Realtek basic reset support
Thread-Index: AQHcwnPpTWHumUza+kqw9rM1hz3eN7XK95OAgAzuXTA=
Date: Fri, 10 Apr 2026 06:49:05 +0000
Message-ID: <a360528ce9164857838891772f68ac06@realtek.com>
References: <20260402073957.2742459-1-eleanor.lin@realtek.com>
	 <20260402073957.2742459-3-eleanor.lin@realtek.com>
 <5dd7ddb50b71de737aae6ad4d11bd28fa52443a9.camel@pengutronix.de>
In-Reply-To: <5dd7ddb50b71de737aae6ad4d11bd28fa52443a9.camel@pengutronix.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_075150_933106_A7DE8593 
X-CRM114-Status: GOOD (  33.42  )
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

PiBPbiBEbywgMjAyNi0wNC0wMiBhdCAxNTozOSArMDgwMCwgWXUtQ2h1biBMaW4gd3JvdGU6DQo+
ID4gRnJvbTogQ2hlbmctWXUgTGVlIDxjeWxlZTEyQHJlYWx0ZWsuY29tPg0KPiA+DQo+ID4gRGVm
aW5lIHRoZSByZXNldCBvcGVyYXRpb25zIGJhY2tlZCBieSBhIHJlZ21hcC1iYXNlZCByZWdpc3Rl
cg0KPiA+IGludGVyZmFjZSBhbmQgcHJlcGFyZSB0aGUgcmVzZXQgY29udHJvbGxlciB0byBiZSBy
ZWdpc3RlcmVkIHRocm91Z2gNCj4gPiB0aGUgcmVzZXQgZnJhbWV3b3JrLg0KPiA+DQo+ID4gU2lu
Y2UgdGhlIHJlc2V0IGNvbnRyb2xsZXJzIG9uIFJlYWx0ZWsgU29DcyBvZnRlbiBzaGFyZSB0aGUg
c2FtZQ0KPiA+IHJlZ2lzdGVyIHNwYWNlIHdpdGggdGhlIGNsb2NrIGNvbnRyb2xsZXJzLCB0aGlz
IGNvbW1vbiBmcmFtZXdvcmsgaXMNCj4gPiBkZXNpZ25lZCB0byBleHRyYWN0IHRoZSByZWdtYXAg
YW5kIGRldmljZSB0cmVlIG5vZGUgZnJvbSB0aGUgcGFyZW50DQo+ID4gZGV2aWNlIChlLmcuLCBh
biBhdXhpbGlhcnkgZGV2aWNlIHBhcmVudCkuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGVu
Zy1ZdSBMZWUgPGN5bGVlMTJAcmVhbHRlay5jb20+DQo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBZdS1D
aHVuIExpbiA8ZWxlYW5vci5saW5AcmVhbHRlay5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogWXUt
Q2h1biBMaW4gPGVsZWFub3IubGluQHJlYWx0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+IENoYW5nZXMg
aW4gdjY6DQo+ID4gLSBSZW1vdmUgdGhlIGdsb2JhbCBoZWFkZXIgaW5jbHVkZS9saW51eC9yZXNl
dC9yZWFsdGVrLmggYW5kIHVzZSBhDQo+ID4gbG9jYWwgY29tbW9uLmggaW5zdGVhZC4NCj4gPiAt
IEV4dHJhY3QgcmVnbWFwIGFuZCBvZl9ub2RlIGRpcmVjdGx5IGZyb20gdGhlIHBhcmVudCBkZXZp
Y2UuDQo+ID4gLSBSZW1vdmUgc3RydWN0IHJ0a19yZXNldF9pbml0ZGF0YS4gTm93LCBwYXNzIHN0
cnVjdCBydGtfcmVzZXRfZGF0YQ0KPiA+IGRpcmVjdGx5IHdoZW4gY2FsbGluZyBydGtfcmVzZXRf
Y29udHJvbGxlcl9hZGQoKS4NCj4gPiAtLS0NCj4gPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAg
ICAgICAgIHwgIDEgKw0KPiA+ICBkcml2ZXJzL3Jlc2V0L0tjb25maWcgICAgICAgICAgfCAgMSAr
DQo+ID4gIGRyaXZlcnMvcmVzZXQvTWFrZWZpbGUgICAgICAgICB8ICAxICsNCj4gPiAgZHJpdmVy
cy9yZXNldC9yZWFsdGVrL0tjb25maWcgIHwgIDMgKysNCj4gPiBkcml2ZXJzL3Jlc2V0L3JlYWx0
ZWsvTWFrZWZpbGUgfCAgMiArICBkcml2ZXJzL3Jlc2V0L3JlYWx0ZWsvY29tbW9uLmMNCj4gPiB8
IDg1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgZHJpdmVycy9yZXNl
dC9yZWFsdGVrL2NvbW1vbi5oIHwgMjkgKysrKysrKysrKysrDQo+ID4gIDcgZmlsZXMgY2hhbmdl
ZCwgMTIyIGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcmVz
ZXQvcmVhbHRlay9LY29uZmlnICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiBkcml2ZXJzL3Jlc2V0
L3JlYWx0ZWsvTWFrZWZpbGUgIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IGRyaXZlcnMvcmVzZXQv
cmVhbHRlay9jb21tb24uYyAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gZHJpdmVycy9yZXNldC9y
ZWFsdGVrL2NvbW1vbi5oDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlO
VEFJTkVSUyBpbmRleA0KPiA+IDA3ZTczYmY2MjFiMC4uOGYzNTU4OTY1ODNiIDEwMDY0NA0KPiA+
IC0tLSBhL01BSU5UQUlORVJTDQo+ID4gKysrIGIvTUFJTlRBSU5FUlMNCj4gPiBAQCAtMjIyNDAs
NiArMjIyNDAsNyBAQCBMOiAgICBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZw0KPiA+ICBMOiAg
IGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5vcmcNCj4gPiAgUzogICBTdXBwb3J0ZWQNCj4gPiAgRjog
ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svcmVhbHRlayoNCj4gPiAr
RjogICBkcml2ZXJzL3Jlc2V0L3JlYWx0ZWsvKg0KPiA+ICBGOiAgIGluY2x1ZGUvZHQtYmluZGlu
Z3MvY2xvY2svcmVhbHRlayoNCj4gPiAgRjogICBpbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0L3Jl
YWx0ZWsqDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZXNldC9LY29uZmlnIGIvZHJp
dmVycy9yZXNldC9LY29uZmlnIGluZGV4DQo+ID4gN2NlMTUxZjZhN2U0Li4wM2JlMTkzMWYyNjQg
MTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9yZXNldC9LY29uZmlnDQo+ID4gKysrIGIvZHJpdmVy
cy9yZXNldC9LY29uZmlnDQo+ID4gQEAgLTM5OCw2ICszOTgsNyBAQCBjb25maWcgUkVTRVRfWllO
UU1QDQo+ID4NCj4gPiAgc291cmNlICJkcml2ZXJzL3Jlc2V0L2FtbG9naWMvS2NvbmZpZyINCj4g
PiAgc291cmNlICJkcml2ZXJzL3Jlc2V0L2hpc2lsaWNvbi9LY29uZmlnIg0KPiA+ICtzb3VyY2Ug
ImRyaXZlcnMvcmVzZXQvcmVhbHRlay9LY29uZmlnIg0KPiA+ICBzb3VyY2UgImRyaXZlcnMvcmVz
ZXQvc3BhY2VtaXQvS2NvbmZpZyINCj4gPiAgc291cmNlICJkcml2ZXJzL3Jlc2V0L3N0YXJmaXZl
L0tjb25maWciDQo+ID4gIHNvdXJjZSAiZHJpdmVycy9yZXNldC9zdGkvS2NvbmZpZyINCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9yZXNldC9NYWtlZmlsZSBiL2RyaXZlcnMvcmVzZXQvTWFrZWZp
bGUgaW5kZXgNCj4gPiBmYzBjYzk5Zjg1MTQuLjQ0MDdkMTYzMDA3MCAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL3Jlc2V0L01ha2VmaWxlDQo+ID4gKysrIGIvZHJpdmVycy9yZXNldC9NYWtlZmls
ZQ0KPiA+IEBAIC0yLDYgKzIsNyBAQA0KPiA+ICBvYmoteSArPSBjb3JlLm8NCj4gPiAgb2JqLXkg
Kz0gYW1sb2dpYy8NCj4gPiAgb2JqLXkgKz0gaGlzaWxpY29uLw0KPiA+ICtvYmoteSArPSByZWFs
dGVrLw0KPiA+ICBvYmoteSArPSBzcGFjZW1pdC8NCj4gPiAgb2JqLXkgKz0gc3RhcmZpdmUvDQo+
ID4gIG9iai15ICs9IHN0aS8NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9yZXNldC9yZWFsdGVr
L0tjb25maWcNCj4gPiBiL2RyaXZlcnMvcmVzZXQvcmVhbHRlay9LY29uZmlnIG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0IGluZGV4DQo+ID4gMDAwMDAwMDAwMDAwLi45OWExNGQzNTU4MDMNCj4gPiAtLS0g
L2Rldi9udWxsDQo+ID4gKysrIGIvZHJpdmVycy9yZXNldC9yZWFsdGVrL0tjb25maWcNCj4gPiBA
QCAtMCwwICsxLDMgQEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
bmx5IGNvbmZpZyBSRVNFVF9SVEtfQ09NTU9ODQo+ID4gKyAgICAgYm9vbA0KPiANCj4gUGxlYXNl
IG1ha2UgdGhpcyBidWlsZC10ZXN0YWJsZSB3aXRoIENPTVBJTEVfVEVTVC4NCj4NCg0KSSB3aWxs
IGNoYW5nZSBLY29uZmlnIHRvDQoNCmNvbmZpZyBSRVNFVF9SVEtfQ09NTU9ODQrigIPigIN0cmlz
dGF0ZSAiUmVhbHRlayBjb21tb24gcmVzZXQgZHJpdmVyIiBpZiBDT01QSUxFX1RFU1QNCuKAg+KA
g2hlbHANCuKAg+KAgyAgQ29tbW9uIGhlbHBlciBjb2RlIHNoYXJlZCBieSBSZWFsdGVrIHJlc2V0
IGNvbnRyb2xsZXIgZHJpdmVycy4NCg0KY29uZmlnIENPTU1PTl9SRVNFVF9SVEQxNjI1DQrigIPi
gIN0cmlzdGF0ZSAiUlREMTYyNSBSZXNldCBDb250cm9sbGVyIg0K4oCD4oCDZGVwZW5kcyBvbiBB
UkNIX1JFQUxURUsgfHwgQ09NUElMRV9URVNUDQrigIPigINzZWxlY3QgUkVTRVRfUlRLX0NPTU1P
Tg0K4oCD4oCDc2VsZWN0IEFVWElMSUFSWV9CVVMNCuKAg+KAg2hlbHANCuKAg+KAgyAgVGhpcyBl
bmFibGVzIHRoZSByZXNldCBjb250cm9sbGVyIGRyaXZlciBmb3IgUmVhbHRlayBSVEQxNjI1IFNv
Qy4NCg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Jlc2V0L3JlYWx0ZWsvTWFrZWZpbGUNCj4g
PiBiL2RyaXZlcnMvcmVzZXQvcmVhbHRlay9NYWtlZmlsZSBuZXcgZmlsZSBtb2RlIDEwMDY0NCBp
bmRleA0KPiA+IDAwMDAwMDAwMDAwMC4uYjU5YTNmN2YyNDUzDQo+ID4gLS0tIC9kZXYvbnVsbA0K
PiA+ICsrKyBiL2RyaXZlcnMvcmVzZXQvcmVhbHRlay9NYWtlZmlsZQ0KPiA+IEBAIC0wLDAgKzEs
MiBAQA0KPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkNCj4gPiAr
b2JqLSQoQ09ORklHX1JFU0VUX1JUS19DT01NT04pICs9IGNvbW1vbi5vDQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcmVzZXQvcmVhbHRlay9jb21tb24uYw0KPiA+IGIvZHJpdmVycy9yZXNldC9y
ZWFsdGVrL2NvbW1vbi5jIG5ldyBmaWxlIG1vZGUgMTAwNjQ0IGluZGV4DQo+ID4gMDAwMDAwMDAw
MDAwLi5lYTdmZjI3MTE3ZTcNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvZHJpdmVycy9y
ZXNldC9yZWFsdGVrL2NvbW1vbi5jDQo+ID4gQEAgLTAsMCArMSw4NSBAQA0KPiA+ICsvLyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5DQo+ID4gKy8qDQo+ID4gKyAqIENvcHly
aWdodCAoQykgMjAxOSBSZWFsdGVrIFNlbWljb25kdWN0b3IgQ29ycG9yYXRpb24gICovDQo+ID4g
Kw0KPiA+ICsjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9t
b2R1bGUuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L29mLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51
eC9yZWdtYXAuaD4NCj4gPiArI2luY2x1ZGUgImNvbW1vbi5oIg0KPiA+ICsNCj4gPiArc3RhdGlj
IGlubGluZSBzdHJ1Y3QgcnRrX3Jlc2V0X2RhdGEgKnRvX3J0a19yZXNldF9jb250cm9sbGVyKHN0
cnVjdA0KPiA+ICtyZXNldF9jb250cm9sbGVyX2RldiAqcikgew0KPiA+ICsgICAgIHJldHVybiBj
b250YWluZXJfb2Yociwgc3RydWN0IHJ0a19yZXNldF9kYXRhLCByY2Rldik7IH0NCj4gPiArDQo+
ID4gK3N0YXRpYyBpbmxpbmUgc3RydWN0IHJ0a19yZXNldF9kZXNjICpydGtfcmVzZXRfZ2V0X2Rl
c2Moc3RydWN0IHJ0a19yZXNldF9kYXRhDQo+ICpkYXRhLA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkDQo+IGxvbmcNCj4g
PiAraWR4KSB7DQo+ID4gKyAgICAgcmV0dXJuICZkYXRhLT5kZXNjc1tpZHhdOw0KPiA+ICt9DQo+
ID4gKw0KPiA+ICtzdGF0aWMgaW50IHJ0a19yZXNldF9hc3NlcnQoc3RydWN0IHJlc2V0X2NvbnRy
b2xsZXJfZGV2ICpyY2RldiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVk
IGxvbmcgaWR4KSB7DQo+ID4gKyAgICAgc3RydWN0IHJ0a19yZXNldF9kYXRhICpkYXRhID0gdG9f
cnRrX3Jlc2V0X2NvbnRyb2xsZXIocmNkZXYpOw0KPiA+ICsgICAgIHN0cnVjdCBydGtfcmVzZXRf
ZGVzYyAqZGVzYyA9IHJ0a19yZXNldF9nZXRfZGVzYyhkYXRhLCBpZHgpOw0KPiA+ICsgICAgIHUz
MiBtYXNrID0gZGVzYy0+d3JpdGVfZW4gPyAoMHgzIDw8IGRlc2MtPmJpdCkgOiBCSVQoZGVzYy0+
Yml0KTsNCj4gPiArICAgICB1MzIgdmFsICA9IGRlc2MtPndyaXRlX2VuID8gKDB4MiA8PCBkZXNj
LT5iaXQpIDogMDsNCj4gPiArDQo+ID4gKyAgICAgcmV0dXJuIHJlZ21hcF91cGRhdGVfYml0cyhk
YXRhLT5yZWdtYXAsIGRlc2MtPm9mcywgbWFzaywgdmFsKTsgfQ0KPiA+ICsNCj4gPiArc3RhdGlj
IGludCBydGtfcmVzZXRfZGVhc3NlcnQoc3RydWN0IHJlc2V0X2NvbnRyb2xsZXJfZGV2ICpyY2Rl
diwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBpZHgpIHsN
Cj4gPiArICAgICBzdHJ1Y3QgcnRrX3Jlc2V0X2RhdGEgKmRhdGEgPSB0b19ydGtfcmVzZXRfY29u
dHJvbGxlcihyY2Rldik7DQo+ID4gKyAgICAgc3RydWN0IHJ0a19yZXNldF9kZXNjICpkZXNjID0g
cnRrX3Jlc2V0X2dldF9kZXNjKGRhdGEsIGlkeCk7DQo+ID4gKyAgICAgdTMyIG1hc2sgPSBkZXNj
LT53cml0ZV9lbiA/ICgweDMgPDwgZGVzYy0+Yml0KSA6IEJJVChkZXNjLT5iaXQpOw0KPiA+ICsg
ICAgIHUzMiB2YWwgID0gbWFzazsNCj4gPiArDQo+ID4gKyAgICAgcmV0dXJuIHJlZ21hcF91cGRh
dGVfYml0cyhkYXRhLT5yZWdtYXAsIGRlc2MtPm9mcywgbWFzaywgdmFsKTsgfQ0KPiA+ICsNCj4g
PiArc3RhdGljIGludCBydGtfcmVzZXRfc3RhdHVzKHN0cnVjdCByZXNldF9jb250cm9sbGVyX2Rl
diAqcmNkZXYsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGlk
eCkgew0KPiA+ICsgICAgIHN0cnVjdCBydGtfcmVzZXRfZGF0YSAqZGF0YSA9IHRvX3J0a19yZXNl
dF9jb250cm9sbGVyKHJjZGV2KTsNCj4gPiArICAgICBzdHJ1Y3QgcnRrX3Jlc2V0X2Rlc2MgKmRl
c2MgPSBydGtfcmVzZXRfZ2V0X2Rlc2MoZGF0YSwgaWR4KTsNCj4gPiArICAgICB1MzIgdmFsOw0K
PiA+ICsgICAgIGludCByZXQ7DQo+ID4gKw0KPiA+ICsgICAgIHJldCA9IHJlZ21hcF9yZWFkKGRh
dGEtPnJlZ21hcCwgZGVzYy0+b2ZzLCAmdmFsKTsNCj4gPiArICAgICBpZiAocmV0KQ0KPiA+ICsg
ICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gPiArDQo+ID4gKyAgICAgcmV0dXJuICEoKHZhbCA+
PiBkZXNjLT5iaXQpICYgMSk7IH0NCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcmVz
ZXRfY29udHJvbF9vcHMgcnRrX3Jlc2V0X29wcyA9IHsNCj4gPiArICAgICAuYXNzZXJ0ICAgPSBy
dGtfcmVzZXRfYXNzZXJ0LA0KPiA+ICsgICAgIC5kZWFzc2VydCA9IHJ0a19yZXNldF9kZWFzc2Vy
dCwNCj4gPiArICAgICAuc3RhdHVzICAgPSBydGtfcmVzZXRfc3RhdHVzLA0KPiA+ICt9Ow0KPiA+
ICsNCj4gPiArLyogVGhlIGNhbGxlciBtdXN0IGluaXRpYWxpemUgZGF0YS0+cmNkZXYubnJfcmVz
ZXRzIGFuZCBkYXRhLT5kZXNjcw0KPiA+ICtiZWZvcmUNCj4gPiArICogY2FsbGluZyBydGtfcmVz
ZXRfY29udHJvbGxlcl9hZGQoKS4NCj4gPiArICovDQo+ID4gK2ludCBydGtfcmVzZXRfY29udHJv
bGxlcl9hZGQoc3RydWN0IGRldmljZSAqZGV2LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBydGtfcmVzZXRfZGF0YSAqZGF0YSkgew0KPiA+ICsgICAgIHN0cnVjdCBkZXZp
Y2UgKnBhcmVudCA9IGRldi0+cGFyZW50Ow0KPiA+ICsNCj4gPiArICAgICBkYXRhLT5yZWdtYXAg
PSBkZXZfZ2V0X3JlZ21hcChwYXJlbnQsIE5VTEwpOw0KPiA+ICsgICAgIGlmICghZGF0YS0+cmVn
bWFwKQ0KPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7DQo+ID4gKw0KPiA+ICsgICAg
IGRhdGEtPnJjZGV2Lm93bmVyICAgICA9IFRISVNfTU9EVUxFOw0KPiANCj4gVGhlIHJ0a19yZXNl
dF9kZXNjIGFycmF5cyB1c2VkIGJ5IHRoaXMgY29kZSBsaXZlIGluIHRoZSBjYWxsaW5nIG1vZHVs
ZSwgc28gaXQNCj4gd291bGQgYmUgYmV0dGVyIHRvIGxldCB0aGUgY2FsbGVyIGluaXRpYWxpemUg
Lm93bmVyIGFzIHdlbGwuDQo+IA0KPiBJdCBkb2Vzbid0IG1ha2UgYSBkaWZmZXJlbmNlIGluIHBy
YWN0aWNlLCBzaW5jZSBDT05GSUdfUkVTRVRfUlRLX0NPTU1PTg0KPiBpc24ndCB0cmlzdGF0ZSAo
cmlnaHQgbm93KS4NCj4gDQoNCkkgd2lsbCBtb3ZlICdkYXRhLT5yY2Rldi5vd25lciA9IFRISVNf
TU9EVUxFJyB0byB0aGUgY2FsbGVyLg0KDQpCZXN0IFJlZ2FyZHMsDQpZdS1DaHVuDQoNCj4gDQo+
IHJlZ2FyZHMNCj4gUGhpbGlwcA0K

