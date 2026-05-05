Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B64FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nd4ZcYSmdEtBrbYBc5EdvBORdOz6BQRpz7hjMzcloAs=; b=pW+uL/pR5Fz5FeN1mHwuhWyu4I
	feduM5TC3rVUic6HZfW5fDG80FZHViTj9dJke93XUGAHpgLyf7KUWZ0H3qbZvKau80jnvfxate0QH
	VQ10/WjDJCmTKo58mV1rYnE5+oAgApoPNDQuiyxclqD0FwEEy6Jg55K4Si/l0QufE744gT0s5Dsy2
	yD37O3imdM3VYRs1TzIfDWhai1/Izs9+yAw524RWPufNVD5CvCOQmjdUKScfGH/xzVExVQva5eIZt
	MblJWsRXcttjaBXZO21N1ALOPXYnQ2OG3B92sFR1ZiRJsn+q8r3jpJG5tZO82fSYCkFGOIyIVuLq6
	Oj4XWp9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCzr-0000000Fsxy-0R1R;
	Tue, 05 May 2026 10:27:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCzp-0000000FsxM-0Eyv;
	Tue, 05 May 2026 10:27:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nd4ZcYSmdEtBrbYBc5EdvBORdOz6BQRpz7hjMzcloAs=; b=HsyIL3lQoznLZgmis69oRbE5et
	WRgTZBKiyc1DOrSr62CA8JHwwHa9po4C2OkPXYj1lXlkvOMMbfy0CI6fjbVrhwvDJEef24Mtbe3m4
	aCrMEpFj8I/jtpAh+zIX03YbUxcnPx8cYjswbOplPYiZKWJqwAYHL2rPNzYnkMN9TiR8LlF6rjXSi
	cD7wJRyZTJNE5ZVnRGtWYZXhsq7C0aLiHjbDx0Nw+TGripjY/f+KpOfm2M3r+qQrYoaQ0TteofgC1
	diULtkDICqz3zt5r9LQ3oIC/jXPq2sgnCTyv0MWl/7M2FOJj139Yxirn9u65NsN+zhILHzVcc/oAn
	CRHo6O/w==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCzl-0000000DByX-1wsy;
	Tue, 05 May 2026 10:27:19 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 645AQbyP61150973, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1777976797; bh=nd4ZcYSmdEtBrbYBc5EdvBORdOz6BQRpz7hjMzcloAs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=KRUPH5AmyvR3Ywi2gVAXXKSJKUY1dbABEKalo9995UmQmFI3BknwOuxt4gqAgVM67
	 09gzw4NaRay1M6Ev6gX10ZGvXQG8xsPoA6W+yVlfnxw1AiKOeGF/HQb896TiJ0hfeK
	 YpUIhHSygWZ9XCh6J/O5MBVfbZP3wTyScU1hSpTlGJxKu0eNVTmnqRZKSY2FjXk4qR
	 o8BZkbgrwzO0kFbNPK61+3MbgqzJ/NOmVqrjieJ2/Arv/mSsnAtJJr9c3F0BvtK9/u
	 4Dr3QEYG/8HRT+N5uzhw/FpSscWM+Ug9oj+QM5IVQCdJxDjY8rl16q69102056mwGU
	 9+rQJ+E78ZQkg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.27/5.94) with ESMTPS id 645AQbyP61150973
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 May 2026 18:26:37 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 5 May 2026 18:26:36 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458%10]) with mapi id
 15.02.1748.010; Tue, 5 May 2026 18:26:36 +0800
From: =?big5?B?WXUtQ2h1biBMaW4gW6pMr6enZ10=?= <eleanor.lin@realtek.com>
To: Michael Walle <mwalle@kernel.org>, Linus Walleij <linusw@kernel.org>
CC: Bartosz Golaszewski <brgl@kernel.org>,
        "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
        =?big5?B?Q1lfSHVhbmdbtsDgsq7LXQ==?=
	<cy.huang@realtek.com>,
        =?big5?B?U3RhbmxleSBDaGFuZ1up96h8vHdd?=
	<stanley_chang@realtek.com>,
        =?big5?B?SmFtZXMgVGFpIFvAuafTrnBd?=
	<james.tai@realtek.com>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>,
        "afaerber@suse.com" <afaerber@suse.com>,
        =?big5?B?VFlfQ2hhbmdbsWmkbLZoXQ==?= <tychang@realtek.com>
Subject: RE: [PATCH v2 3/4] gpio: realtek: Add driver for Realtek DHC RTD1625
 SoC
Thread-Topic: [PATCH v2 3/4] gpio: realtek: Add driver for Realtek DHC RTD1625
 SoC
Thread-Index: AQHcxwLHJ5/eWVH9pU2ZY37QYpQGurXUP0uAgAPMV8CADmSzAIAAqFqAgBBo1aD//5D9AIAIUqFA
Date: Tue, 5 May 2026 10:26:36 +0000
Message-ID: <3f9aa7a00a384511bf12d5b420c98e85@realtek.com>
References: <20260408025243.1155482-1-eleanor.lin@realtek.com>
 <20260408025243.1155482-4-eleanor.lin@realtek.com>
 <CAMRc=MfUh_OuxS4SC6QzSOg_PMNc9i9crGYgBASrbVUgHDHSCw@mail.gmail.com>
 <52bf9ce2b7754af8af69b0afee0d07b2@realtek.com>
 <CAD++jLkpS-T9yK=ctSwpLvXkj7s7ivmwu1KKwzy4KS40LVYeyA@mail.gmail.com>
 <DHXSUW3NJU22.1RUYUHQZSZ53S@kernel.org>
 <b73f34ec55984a33b0172e2ac3a28e04@realtek.com>
 <DI6G6LSE68E9.1PHS6K9083JJ9@kernel.org>
In-Reply-To: <DI6G6LSE68E9.1PHS6K9083JJ9@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_112718_141516_820AA5EE 
X-CRM114-Status: GOOD (  27.40  )
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

PiBIaSwNCj4NCj4gT24gVGh1IEFwciAzMCwgMjAyNiBhdCAxMTo1OCBBTSBDRVNULCBZdS1DaHVu
IExpbiBbqkyvp6dnXSB3cm90ZToNCj4gPj4gPj4gMy4gSGFyZHdhcmUgRGVib3VuY2U6IFdlIGFs
c28gbmVlZCB0byBzdXBwb3J0IGhhcmR3YXJlIGRlYm91bmNlIA0KPiA+PiA+PiBzZXR0aW5ncyBw
ZXIgcGluLCB3aGljaCByZXF1aXJlcyBjdXN0b20gY29uZmlndXJhdGlvbiB2aWEgDQo+ID4+ID4+
IHNldF9jb25maWcgbWFwcGVkIHRvIHRoZXNlIHNwZWNpZmljIHBlci1waW4gcmVnaXN0ZXJzLg0K
PiA+PiA+DQo+ID4+ID4gSnVzdCBhZGQgYSB2ZXJzaW9uIG9mIGFuIG9wdGlvbmFsIC5zZXRfY29u
ZmlnKCkgY2FsbCB0byANCj4gPj4gPiBncGlvLXJlZ21hcC5jIHRvIGhhbmRsZSB0aGlzIHVzaW5n
IC5yZWdfbWFza194bGF0ZSgpIHBlciBhYm92ZSBhbmQgDQo+ID4+ID4gYWRkIGEgbmV3IEdQSU9f
UkVHTUFQX0NPTkZJR19PUCB0byB0aGUgYWJvdmUgZW51bSwgcHJvYmxlbSBzb2x2ZWQuDQo+ID4+
ID4NCj4gPj4gPiBJZiBpdCBzZWVtcyB0b28gaGFyZCBJIGNhbiB3cml0ZSBwYXRjaCAxICYgMiBh
ZGRpbmcgdGhpcyANCj4gPj4gPiBpbmZyYXN0cnVjdHVyZSBidXQgSSBiZXQgeW91IGNhbiBlYXNp
bHkgc2VlIHdoYXQgY2FuIGJlIGRvbmUgd2l0aCANCj4gPj4gPiBncGlvLXJlZ21hcC5jIGhlcmUg
cHJvdmlkZWQgTWljaGFlbCBXIGFwcHJvdmVzIHRoZSBpZGVhLg0KPiA+PiA+DQo+ID4NCj4gPiBP
dXIgLnNldF9jb25maWcgcmVxdWlyZXMgbWFwcGluZyBzcGVjaWZpYyBkZWJvdW5jZSB0aW1lIHZh
bHVlcyB0byANCj4gPiBoYXJkd2FyZS1zcGVjaWZpYyBlbnVtcyBhbmQgYXBwbHlpbmcgYSBXcml0
ZS1FbmFibGUgYml0Lg0KPiA+DQo+ID4gV291bGQgaXQgYmUgYmV0dGVyIHRvIGFsbG93IGRyaXZl
cnMgdG8gYXNzaWduIGEgY3VzdG9tICcuc2V0X2NvbmZpZycgDQo+ID4gY2FsbGJhY2sgZGlyZWN0
bHkgd2l0aGluICdzdHJ1Y3QgZ3Bpb19yZWdtYXBfY29uZmlnJz8NCj4NCj4gWWVhaCwgSSBkb24n
dCB0aGluayB0aGVyZSB3aWxsIGJlIG11Y2ggY29kZSBzaGFyaW5nIG9mIGNvZGUvZnVuY3Rpb25h
bGl0eQ0KPiBmb3IgdGhlIC5zZXRfY29uZmlnIGNhbGxiYWNrLiBBIGN1c3RvbSAuc2V0X2NvbmZp
ZyB3YXMgcHJvcG9zZWQgbWFueSB0aW1lcyBpbiB0aGUgcGFzdC4NCj4gDQoNCldpbGwgYWRkIGEg
bmV3IHBhdGNoIHRvIHN1cHBvcnQgY3VzdG9tIC5zZXRfY29uZmlnLg0KDQo+ID4gQWRkaXRpb25h
bGx5LCBJIGRpZG4ndCBtZW50aW9uIHRoaXMgaW4gbXkgcHJldmlvdXMgZW1haWwuIHdlIGFsc28g
bmVlZCANCj4gPiB0byBpbXBsZW1lbnQgR1BJTyBpbnRlcnJ1cHRzLiBPdXIgaGFyZHdhcmUgZGVz
aWduIGRvZXMgbm90IGZpdCB3ZWxsIA0KPiA+IHdpdGggJ3JlZ21hcF9pcnFfY2hpcCcuIFRoZXJl
Zm9yZSwgSSBhbSBwbGFubmluZyB0byBjcmVhdGUgb3VyIG93biANCj4gPiAnaXJxZG9tYWluJyBh
bmQgJ2lycWNoaXAnIG9wcyB0byBoYW5kbGUgb3VyIGNhc2NhZGVkIGludGVycnVwdHMuDQo+ID4N
Cj4gPiBCZWNhdXNlIG9mIHRoaXMgY3VzdG9tIElSUSBpbXBsZW1lbnRhdGlvbiwgSSB3b3VsZCBu
ZWVkIHRvIHVzZSAncmVhZGwoKS93cml0ZWwoKScNCj4gPiBmb3IgdGhlIElSUSBjYWxsYmFja3Mg
aW4gdGhlIHJ0ZDE2MjUgR1BJTyBkcml2ZXIgaW5zdGVhZCBvZiB0aGUgcmVnbWFwIEFQSXMuDQo+
ID4gRG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb25zIG9uIGhvdyB0byBoYW5kbGUgdGhpcyBncmFj
ZWZ1bGx5IHdoaWxlIA0KPiA+IGtlZXBpbmcgaXQgYWxpZ25lZCB3aXRoIHRoZSByZWdtYXAgaW5m
cmFzdHJ1Y3R1cmU/DQo+DQo+IFdoeSBjYW4ndCB0aGUgTU1JTyByZWdtYXAgYmUgdXNlZCBmb3Ig
dGhhdD8NCj4NCj4gLW1pY2hhZWwNCg0KSSB3YXMgd29ycmllZCBhYm91dCByZWdtYXAgb3Zlcmhl
YWQgaW4gYXRvbWljIGNvbnRleHQsIGJ1dCBNTUlPIHJlZ21hcCBzaG91bGQNCmJlIGZpbmUuIEkn
bGwgY29udmVydCB0aGUgaXJxY2hpcCBjYWxsYmFja3MgdG8gdXNlIHJlZ21hcCBpbiB2My4NCg0K
QmVzdCBSZWdhcmRzLA0KWXUtQ2h1bg0K

