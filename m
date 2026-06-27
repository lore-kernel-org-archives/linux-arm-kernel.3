Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7469C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 02:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nkr0Eq7PIA/wqbDL/2f8mEx/nI1+mbKaRbCHEDenAt4=; b=aGSP30VjXv6OLUQgSmDRxQTxQg
	Er9505fRIzBOezDmP1Ys2iSSKh2ksN4f/fdXYQ0fg7evEkiYUjp+c+zAsHEjxKX3xeGTKCxSwH9Hq
	Xa7LgoGogVuDZK/USUrseDrXUcgACGi0jbp94Tfq4wqyKqcqQ6gSdwIoV7GbQaAKnhDOxgnMFNJVc
	MKY95sxsY7Ml31yORsEzeyvLhGo3WlsjtpD1qn3TSdGcSTlv6GGI97f5VmCnPASl6aUl99W/bB09f
	JlfVJYwQ7vprn9cvwLAWvQtEUYKwXZ9Co+DReIIQ7s3U5Ix+/Qa5HoL1RbQD9rtL0KmZ1h6IUZFOc
	S0vZEMLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdJ4J-0000000C5LL-3Vm0;
	Sat, 27 Jun 2026 02:46:55 +0000
Received: from mx22.baidu.com ([220.181.50.185] helo=outbound.baidu.com)
	by bombadil.infradead.org with smtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdJ4E-0000000C5Ko-3HGw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 02:46:54 +0000
X-MD-Sfrom: lirongqing@baidu.com
X-MD-SrcIP: 172.31.3.11
From: "Li,Rongqing" <lirongqing@baidu.com>
To: Yang Shi <yang@os.amperecomputing.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Ryan Roberts
	<ryan.roberts@arm.com>, Ard Biesheuvel <ardb@kernel.org>, David Hildenbrand
	<david@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, "Kevin
 Brodsky" <kevin.brodsky@arm.com>, Chaitanya S Prakash
	<chaitanyas.prakash@arm.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: =?utf-8?B?562U5aSNOiBb5aSW6YOo6YKu5Lu2XSBSZTogW1BBVENIXSBhcm02NDogbW06?=
 =?utf-8?B?IHJlZnJlc2ggc3RhbGUgcG1kIHNuYXBzaG90IGFmdGVyIHNwbGl0X2NvbnRw?=
 =?utf-8?Q?md()?=
Thread-Topic: =?utf-8?B?W+WklumDqOmCruS7tl0gUmU6IFtQQVRDSF0gYXJtNjQ6IG1tOiByZWZyZXNo?=
 =?utf-8?Q?_stale_pmd_snapshot_after_split=5Fcontpmd()?=
Thread-Index: AQHdBJdanZ2Pf9apPEG0nKg6zmz4zbZQ7gCAgADFsrA=
Date: Sat, 27 Jun 2026 02:46:21 +0000
Message-ID: <7ac17ef889d242c29f39898a95364df9@baidu.com>
References: <20260625113953.2332-1-lirongqing@baidu.com>
 <32e089d6-7832-4af3-87fc-c1d6bcdb5ba8@os.amperecomputing.com>
In-Reply-To: <32e089d6-7832-4af3-87fc-c1d6bcdb5ba8@os.amperecomputing.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.31.62.18]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baidu.com;
	s=selector1; t=1782528396;
	bh=Nkr0Eq7PIA/wqbDL/2f8mEx/nI1+mbKaRbCHEDenAt4=;
	h=From:To:Subject:Date:Message-ID:Content-Type;
	b=TutGT+G2OqO97z4CvHUlK5/DSYMowXh8McnzSgesvRcx6YLPMp9eYmd+x6bEAFoR3
	 tnU00K0VHWhRslq6UYj6c/5LVeIVSU6VjIIG6P+DERIvaPT4CRluLHpcrIEPaqt6c7
	 jxMkhHW/oCU0yqQ9MXdJ4NC3CzEJAHF1/Y4JfFmWe/ZK8iFuF2dmZb9LX1vf/zUOU8
	 daVbi+DcdQ4BRnQCo2Aom0ZgysyhU0kAcsrsBameR3I4gd2zJsAxqqbuws6vsqA6IQ
	 imSTBGtkCBqRftQP3OqXNJ6HpvBw3UiIaKRjvCf+hasTjcofxgK608O3QgoO67AClP
	 SnjRencvV5oNQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_194652_408239_9D1A36CD 
X-CRM114-Status: GOOD (  23.65  )
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

PiANCj4gDQo+IA0KPiBPbiA2LzI1LzI2IDQ6MzkgQU0sIGxpcm9uZ3Fpbmcgd3JvdGU6DQo+ID4g
RnJvbTogTGkgUm9uZ1FpbmcgPGxpcm9uZ3FpbmdAYmFpZHUuY29tPg0KPiA+DQo+ID4gc3BsaXRf
Y29udHBtZCgpIG1vZGlmaWVzIHRoZSBwbWQgZW50cmllcyBpbi1wbGFjZSBieSBjbGVhcmluZyB0
aGUgQ09OVA0KPiA+IGJpdCwgYnV0IHRoZSBsb2NhbCAncG1kJyB2YXJpYWJsZSBzdGlsbCBob2xk
cyB0aGUgb2xkIHNuYXBzaG90IHdpdGgNCj4gPiBDT05UIHNldC4gVGhlIHN1YnNlcXVlbnQgc3Bs
aXRfcG1kKCkgY2FsbCB1c2VzIHRoaXMgc3RhbGUgdmFsdWUgdG8NCj4gPiBkZXJpdmUgdGhlIHBn
cHJvdCBmb3IgdGhlIG5ldyBQVEUgZW50cmllcyB2aWEgcG1kX3BncHJvdCgpLCBjYXVzaW5nDQo+
ID4gdGhlIHJlc3VsdGluZyBQVEVzIHRvIGJlIHBvcHVsYXRlZCB3aXRoIGluY29ycmVjdCBwcm90
ZWN0aW9uIGJpdHMuDQo+IA0KPiBJZiBJIHJlYWQgdGhlIGNvZGUgY29ycmVjdGx5LCBDT05UIGJp
dCBpcyBjbGVhcmVkIGJ5IHNwbGl0X3BtZCgpLCB0aGVuIHRoZSBiaXQNCj4gbWF5IGJlIHNldCBh
Z2FpbiBmb3IgUFRFcyBpZiB3ZSB3YW50IHRvIGhhdmUgY29udCBwdGVzLiBTbyBJIGRvbid0IHNl
ZSBhbnkNCj4gcHJvYmxlbSwgZGlkIEkgbWlzcyBzb21ldGhpbmc/DQo+IA0KDQpZb3UgYXJlIHJp
Z2h0LCB0aGVyZSdzIG5vIGZ1bmN0aW9uYWwgaXNzdWUgd2l0aCB0aGUgY3VycmVudCBjb2RlLg0K
SG93ZXZlciwgSSB0aGluayBleHBsaWNpdGx5IHJlLXJlYWRpbmcgdGhlIHBtZCBpcyB0aGUgc2Fm
ZXIgYW5kIGNsZWFyZXIgDQphcHByb2FjaCDigJQgaXQgbWFrZXMgdGhlIGludGVudCBvYnZpb3Vz
ICh3ZSBuZWVkIHRoZSBwb3N0LW1vZGlmaWNhdGlvbiBzdGF0ZSkgDQpyYXRoZXIgdGhhbiByZWx5
aW5nIG9uIHRoZSBpbXBsaWNpdCBhc3N1bXB0aW9uIHRoYXQgIkNPTlQgYml0IGRvZXNuJ3QgYWZm
ZWN0IHBncHJvdC4iDQoNClRoYW5rcw0KDQoNCltMaSxSb25ncWluZ10gDQoNCg0KPiBUaGFua3Ms
DQo+IFlhbmcNCj4gDQo+ID4NCj4gPiBGaXggdGhpcyBieSByZS1yZWFkaW5nIHRoZSBwbWQgZnJv
bSBtZW1vcnkgYWZ0ZXIgc3BsaXRfY29udHBtZCgpDQo+ID4gcmV0dXJucyBpbiBib3RoIGNhbGwg
c2l0ZXM6IHNwbGl0X2tlcm5lbF9sZWFmX21hcHBpbmdfbG9ja2VkKCkgYW5kDQo+ID4gc3BsaXRf
dG9fcHRlc19wbWRfZW50cnkoKS4NCj4gPg0KPiA+IEZpeGVzOiBhMTY2NTYzZTdlYzMgKCJhcm02
NDogbW06IHN1cHBvcnQgbGFyZ2UgYmxvY2sgbWFwcGluZyB3aGVuDQo+ID4gcm9kYXRhPWZ1bGwi
KQ0KPiA+IFNpZ25lZC1vZmYtYnk6IExpIFJvbmdRaW5nIDxsaXJvbmdxaW5nQGJhaWR1LmNvbT4N
Cj4gPiAtLS0NCj4gPiAgIGFyY2gvYXJtNjQvbW0vbW11LmMgfCA4ICsrKysrKy0tDQo+ID4gICAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvbW0vbW11LmMgYi9hcmNoL2FybTY0L21tL21tdS5jIGlu
ZGV4DQo+ID4gMTJlODYyYy4uZTUxMDMzNiAxMDA2NDQNCj4gPiAtLS0gYS9hcmNoL2FybTY0L21t
L21tdS5jDQo+ID4gKysrIGIvYXJjaC9hcm02NC9tbS9tbXUuYw0KPiA+IEBAIC03NDYsOCArNzQ2
LDEwIEBAIHN0YXRpYyBpbnQNCj4gc3BsaXRfa2VybmVsX2xlYWZfbWFwcGluZ19sb2NrZWQodW5z
aWduZWQgbG9uZyBhZGRyKQ0KPiA+ICAgCWlmICghcG1kX3ByZXNlbnQocG1kKSkNCj4gPiAgIAkJ
Z290byBvdXQ7DQo+ID4gICAJaWYgKHBtZF9sZWFmKHBtZCkpIHsNCj4gPiAtCQlpZiAocG1kX2Nv
bnQocG1kKSkNCj4gPiArCQlpZiAocG1kX2NvbnQocG1kKSkgew0KPiA+ICAgCQkJc3BsaXRfY29u
dHBtZChwbWRwKTsNCj4gPiArCQkJcG1kID0gcG1kcF9nZXQocG1kcCk7DQo+ID4gKwkJfQ0KPiA+
ICAgCQkvKg0KPiA+ICAgCQkgKiBQTUQ6IElmIGFkZHIgaXMgUE1EIGFsaWduZWQgdGhlbiBhZGRy
IGFscmVhZHkgZGVzY3JpYmVzIGENCj4gPiAgIAkJICogbGVhZiBib3VuZGFyeS4gT3RoZXJ3aXNl
LCBzcGxpdCB0byBjb250cHRlLg0KPiA+IEBAIC04OTEsOCArODkzLDEwIEBAIHN0YXRpYyBpbnQg
c3BsaXRfdG9fcHRlc19wbWRfZW50cnkocG1kX3QgKnBtZHAsDQo+IHVuc2lnbmVkIGxvbmcgYWRk
ciwNCj4gPiAgIAlpbnQgcmV0ID0gMDsNCj4gPg0KPiA+ICAgCWlmIChwbWRfbGVhZihwbWQpKSB7
DQo+ID4gLQkJaWYgKHBtZF9jb250KHBtZCkpDQo+ID4gKwkJaWYgKHBtZF9jb250KHBtZCkpIHsN
Cj4gPiAgIAkJCXNwbGl0X2NvbnRwbWQocG1kcCk7DQo+ID4gKwkJCXBtZCA9IHBtZHBfZ2V0KHBt
ZHApOw0KPiA+ICsJCX0NCj4gPiAgIAkJcmV0ID0gc3BsaXRfcG1kKHBtZHAsIHBtZCwgZ2ZwLCBm
YWxzZSk7DQo+ID4NCj4gPiAgIAkJLyoNCg0K

