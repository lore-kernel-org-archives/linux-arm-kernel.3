Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C47C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 10:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1SAjUtfKAHjhqPstwZeDnPVWH8nkgMFt0Lr5rqjRwLQ=; b=ugjI/os7DL26VcTM4Ixx5L41gv
	SVyNOFf04OB26t9WGvUWMLVRfeKVcyFboHP9qiOyZpDU/Bg+W8y3fhgQrf8TVjz7TP3+pHwr8m1ec
	u/JiWYdBhPpenUi01Ap2yjtE7C+XBxIShBgTccCcJuSjwcjtLaRqPO5bE1+qrqHQth4kR//wnvjuA
	E3Pf2U/ont/odCx+DGbDMjzHEpTdc4Z0QAm1n40F06Ki/pBDrJeoiiSIiMHUw3Wzn+0o8VsKhqDJI
	GzvwIJsG0Tx0/PthwEbXFcRiWe+sUZFqtxxPhpI1HDBR79Va7nTsQ4TELP3mZNmWWrYfT4NbFAwmt
	IcIlVNHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu674-0000000FslV-3J7q;
	Wed, 12 Aug 2026 10:23:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu673-0000000FslD-1TN9;
	Wed, 12 Aug 2026 10:23:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1SAjUtfKAHjhqPstwZeDnPVWH8nkgMFt0Lr5rqjRwLQ=; b=QdjmiDQevWZrNa9murqRlGcbbh
	6oNnWMHFTbk3cKxJ8MYDyJKfsTUnx1P0hTFJde5Twgivi02xSjMkae9pL67LUUB5mWBGuxec92y9z
	3cRMzJ3IgFIJqR9WGJJUYTSHi1LkQMXfvrRkBHDqHQnSk2S6dRj7HrENI5qqUIP6sEMqgJqo1mLg6
	dgDB9vBTVIXh19YEB3WnBExfKFM6QexrPwmaIylyHCqoILe+Qih9HfhrW5am59Hr0ehuK9EUOKTrY
	M3O7552bSzxNgHdqC70AVKddJGSx+AIHyd18jjbl+DXHqm+vcV7xq5WrBIDMp96GJTNF51arhc/6v
	cgSsdZ/w==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wu66z-0000000FIV4-0Lar;
	Wed, 12 Aug 2026 10:23:07 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 67CAMaxG63513210, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1786530156; bh=1SAjUtfKAHjhqPstwZeDnPVWH8nkgMFt0Lr5rqjRwLQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=XPsudSQM49Q6t/U/qRJgD88Cw6cQVAg0NqbeYJxXbO19q4kWBMBcdWazshnZZetZH
	 h7oxCo6h1wCq1LS9VW1LRlAV7v8SVI6SNm1iSnkuwl4RX1ZJmD8uOhsaVzdxTXOldM
	 44j9fhWgMqqeSbMLrdBe6OTQOTFhrtOQbB7Hcm0QchMjFjTpjJyRaN7NTvTqPSbiFY
	 mcv7bqrWlRoerJTOWRfukkjrYTexvBSrlO+4NI9MBEFoXkMKWtZaY+6ycJGsPs0HPg
	 jbtChwobWNrziruIw+Qln8IO1tKnldzAU/UC6N8Y+bf1kcudgaxweyE6v0hf+U7NcK
	 dxCK0CQq2IzDw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 67CAMaxG63513210
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Aug 2026 18:22:36 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 12 Aug 2026 18:22:36 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 12 Aug 2026 18:22:35 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::126f:59ad:658:674d%10]) with mapi id
 15.02.2562.043; Wed, 12 Aug 2026 18:22:35 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?utf-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
	"afaerber@suse.com" <afaerber@suse.com>,
	=?utf-8?B?SnlhbiBDaG91IFvlkajoirflrold?= <jyanchou@realtek.com>,
	"bmasney@redhat.com" <bmasney@redhat.com>
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
Subject: RE: [PATCH v13 01/11] dt-bindings: clock: Add Realtek RTD1625 Clock &
 Reset Controller
Thread-Topic: [PATCH v13 01/11] dt-bindings: clock: Add Realtek RTD1625 Clock
 & Reset Controller
Thread-Index: AQHdKf6sqK1LXpXPjkadMFMzDtoXkraZlK4AgACT8SD//3zlAIAAjtXw
Date: Wed, 12 Aug 2026 10:22:35 +0000
Message-ID: <e2c90bd25e654e0f9ce1aea6e0b4f74d@realtek.com>
References: <20260812020009.3480538-1-eleanor.lin@realtek.com>
 <20260812020009.3480538-2-eleanor.lin@realtek.com>
 <313b74fd-1a5f-4e1b-a4e2-a537f7939fad@oss.qualcomm.com>
 <fd254ec8d59a4ed3b4ea157b866ce798@realtek.com>
 <d55ed65c-b066-47aa-b285-c9582894b84f@oss.qualcomm.com>
In-Reply-To: <d55ed65c-b066-47aa-b285-c9582894b84f@oss.qualcomm.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_112305_696093_57E33BB1 
X-CRM114-Status: GOOD (  15.63  )
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

PiBPbiAxMi8wOC8yMDI2IDExOjQxLCBZdS1DaHVuIExpbiBb5p6X56WQ5ZCbXSB3cm90ZToNCj4g
PiBIaSBLcnp5c3p0b2YsDQo+ID4NCj4gPj4gT24gMTIvMDgvMjAyNiAwMzo1OSwgWXUtQ2h1biBM
aW4gd3JvdGU6DQo+ID4+PiBBZGQgRFQgYmluZGluZyBzY2hlbWEgZm9yIFJlYWx0ZWsgUlREMTYy
NSBjbG9jayBhbmQgcmVzZXQgY29udHJvbGxlcg0KPiA+Pj4NCj4gPj4+IFJldmlld2VkLWJ5OiBL
cnp5c3p0b2YgS296bG93c2tpDQo+ID4+PiA8a3J6eXN6dG9mLmtvemxvd3NraUBvc3MucXVhbGNv
bW0uY29tPg0KPiA+Pg0KPiA+PiBIb3cgbXkgdGFnIGNvdWxkIGFwcGVhciBoZXJlPw0KPiA+Pg0K
PiA+PiBMb29rOg0KPiA+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjYwMzI0MDI1
MzMyLjM0MTY5NzctMi1lbGVhbm9yLmxpbkByZWENCj4gPj4gbHRlay5jDQo+ID4+IG9tLw0KPiA+
Pg0KPiA+Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBDaGVuZy1ZdSBMZWUgPGN5bGVlMTJAcmVhbHRlay5j
b20+DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBDaGVuZy1ZdSBMZWUgPGN5bGVlMTJAcmVhbHRlay5j
b20+DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBZdS1DaHVuIExpbiA8ZWxlYW5vci5saW5AcmVhbHRl
ay5jb20+DQo+ID4+DQo+ID4+IFdobyBhZGRlZCBteSB0YWc/IFdoYXQgaXMgdGhlIGFjdHVhbCBm
bG93IG9mIHRoaXMgcGF0Y2g/DQo+ID4+DQo+ID4NCj4gPiBZb3UgZ2F2ZSB5b3VyIFJldmlld2Vk
LWJ5IHRhZyBpbiB2NS4gSG93ZXZlciwgYWZ0ZXIgdGhhdCwgU3RlcGhvbg0KPiA+IHByb3ZpZGVk
IGFkZGl0aW9uYWwgZmVlZGJhY2suIEluIHY2LCBJIG1vZGlmaWVkIHRoZSBwYXRjaCBiYXNlZCBv
bg0KPiA+IFN0ZXBob24ncyBjb21tZW50cyBhbmQgbWFkZSBzb21lIG90aGVyIGNoYW5nZXMuIEZ1
cnRoZXJtb3JlLCBJIGFkZGVkDQo+ID4gdGhlIGNsb2NrIElEDQo+ID4gMTQ0IGluIHYxMS4NCj4g
DQo+IFNvIGhvdyBteSB0YWcgY291bGQgYXBwZWFyIGJlZm9yZSBDaGVuZy1ZdSBMZWUgc2lnbmVk
IG9mZiB0aGUgcGF0Y2g/DQo+IA0KDQpBaCwgSSByZWFkIHRoZSBydWxlcyBzdGF0aW5nIHRoYXQg
InRoZSBsYXN0IFNpZ25lZC1vZmYtYnk6IG11c3QgYWx3YXlzIGJlDQp0aGF0IG9mIHRoZSBkZXZl
bG9wZXIgc3VibWl0dGluZyB0aGUgcGF0Y2giLg0KDQpJIG1pc3Rha2VubHkgdGhvdWdodCBteSBT
aWduZWQtb2ZmLWJ5IGhhZCB0byBiZSB0aGUgYWJzb2x1dGUgbGFzdCBsaW5lIG9mDQp0aGUgZW50
aXJlIGNvbW1pdCBtZXNzYWdlLiBUaGVyZWZvcmUsIHdoZW4gSSBpbnNlcnRlZCB5b3VyIHRhZyBh
dCB0aGUgdG9wDQpvZiB0aGUgdGFnIGJsb2NrLiANCg0KSSB3aWxsIHJldmlzZS4gVGhhbmsgeW91
IGZvciBwb2ludGluZyB0aGlzIG91dC4NCg0KQmVzdCByZWdhcmRzLA0KWXUtQ2h1bg0KDQo+IEJl
c3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo=

