Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610FEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 06:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mt6rUjgJc+IuOzhtFCcGRB1t052B3wNDIX5do0o14+8=; b=AbQl0WC1VprcYt+MQDyGlqCTH6
	wavv6yQqxkucwGDrbYnwee+I/GkEWD+qtQUrht3eFuZR7O5IsLji563eH5a2Ia9oL9jDovvkoWPTK
	Pxs6sf6zSVxpKfRkV0CAjAc5ZOOIXhhFNtogEffzaN8OyadEm4EYAHM1rMUbKvrvT/IJreDSKytd0
	qEImlbdaTz4faf8cAsLTJdh72UH1d7meV24+e2WRq+zSRnBy0iKJLVRRwHmF+2ohKvwrW/7VSH+mC
	6+8YdBRs+AwMbSPGS2IDup3HBxapImK9S3Poa/rPrznFebIxX9NX2oYC2BoIxVUqrz3hGDrtWCYnA
	+4FRyUHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgzj5-0000000EGUl-25Bf;
	Tue, 07 Jul 2026 06:56:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgzj4-0000000EGUU-11rj;
	Tue, 07 Jul 2026 06:56:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mt6rUjgJc+IuOzhtFCcGRB1t052B3wNDIX5do0o14+8=; b=i3FeNj1xXUMS/3g6KM1ksLw6MR
	1Py9h8VdHu/0O3XrIHV2Gc3PD/0ct+s2a40zFmdg7+MQFwyEjMxRxpAbpMfWrZ1LN/iSUhkqQ/dru
	lg75tQJE+467sM0Xo8nYTy3KA4Otq4hV1aGFA2+ZHfk66vEZziKOzyu7XfIWfFBhtKi1knqXmj0JM
	V7S/gG53HR1gW6Co4wU9AshnoqfAZqC7M/akNfxKpvbpuVErNyO7XDmGhfi/wYhQpL2F+kim+avtm
	anWjxMAL49ArmflPm3yoeQQpbM1S+soPdIvQOmn/dV3o2UBeBFacNAOjGeR67AlN79lUxAEFEDssa
	Bh1kTTbg==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wgzj0-00000007BJt-0Fxl;
	Tue, 07 Jul 2026 06:56:13 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6676tP2w9996839, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1783407325; bh=mt6rUjgJc+IuOzhtFCcGRB1t052B3wNDIX5do0o14+8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=BT1muqJfV9uvba4UeuBvFhB489eDtIdc082idO4/M8yYIYlG05iWs0nKwyNt4ETiq
	 oDY1NMvGa9VkFabtoEAsWKXnNhuG7AxF7aLL0ol/5JvrC3iDvK62XJ1l9Km5GvY1RV
	 gnYzNbdM/Bn72XCVI643rwoFWtbzTsUH0V8NeRWC0DhbcWd46Yj/mqTqe76z4uFacu
	 u/6I+RVYsp1qNn4817dJOhZY3cn8bs+3ujhc8QwZIOEx7Tvgm/8DGkd09DBipbvxzB
	 GIUdCP3VQDNcKPAr6T/Bp3efE0IxJrEdw9y1Re00yyLcy1RQ04V4yCz1jzdA7tt4tY
	 /gOU2olcAc4MA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6676tP2w9996839
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Jul 2026 14:55:25 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 7 Jul 2026 14:55:26 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Tue, 7 Jul 2026 14:55:26 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"linusw@kernel.org" <linusw@kernel.org>, "brgl@kernel.org" <brgl@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"afaerber@suse.com" <afaerber@suse.com>, "mwalle@kernel.org"
	<mwalle@kernel.org>, "andriy.shevchenko@intel.com"
	<andriy.shevchenko@intel.com>, =?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?=
	<tychang@realtek.com>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
	=?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>,
	=?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>
Subject: RE: (subset) [PATCH v4 0/4] gpio: realtek: Add support for Realtek
 DHC RTD1625
Thread-Topic: (subset) [PATCH v4 0/4] gpio: realtek: Add support for Realtek
 DHC RTD1625
Thread-Index: AQHdAijOhwVVCHLFCkaSAZ80GLo1NbZP+P+AgBG4dLA=
Date: Tue, 7 Jul 2026 06:55:26 +0000
Message-ID: <a00c475a6ce0469682305c4b4269b181@realtek.com>
References: <20260622092335.1166876-1-eleanor.lin@realtek.com>
 <178246069898.6685.11577448681947659397.b4-ty@oss.qualcomm.com>
In-Reply-To: <178246069898.6685.11577448681947659397.b4-ty@oss.qualcomm.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_075610_936632_BEBD3101 
X-CRM114-Status: GOOD (  14.65  )
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

SGkgQmFydG9zeiwNCg0KPiBPbiBNb24sIDIyIEp1biAyMDI2IDE3OjIzOjMxICswODAwLCBZdS1D
aHVuIExpbiB3cm90ZToNCj4gPiBUaGlzIHNlcmllcyBhZGRzIEdQSU8gc3VwcG9ydCBmb3IgdGhl
IFJlYWx0ZWsgREhDIFJURDE2MjUgU29DLg0KPiA+DQo+ID4gVW5saWtlIHRoZSBleGlzdGluZyBk
cml2ZXIgKGdwaW8tcnRkLmMpIHdoaWNoIHVzZXMgc2hhcmVkIGJhbmsNCj4gPiByZWdpc3RlcnMs
IHRoZSBSVEQxNjI1IGZlYXR1cmVzIGEgcGVyLXBpbiByZWdpc3RlciBhcmNoaXRlY3R1cmUgd2hl
cmUNCj4gPiBlYWNoIEdQSU8gbGluZSBpcyBtYW5hZ2VkIGJ5IGl0cyBvd24gZGVkaWNhdGVkIDMy
LWJpdCBjb250cm9sDQo+ID4gcmVnaXN0ZXIuIFRoaXMgZGlzdGluY3QgaGFyZHdhcmUgZGVzaWdu
IHJlcXVpcmVzIGEgbmV3LCBzZXBhcmF0ZSBkcml2ZXIuDQo+ID4NCj4gPiBbLi4uXQ0KPiANCj4g
QXBwbGllZCwgdGhhbmtzIQ0KPiANCj4gWzEvNF0gZHQtYmluZGluZ3M6IGdwaW86IHJlYWx0ZWs6
IEFkZCByZWFsdGVrLHJ0ZDE2MjUtZ3Bpbw0KPiANCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9i
cmdsL2MvOGYzMjgwOGUxNTMwYjIyMjllMDc2OTVmYjM5YzU0ZmVlOTEwYmQ0YQ0KPiBbMi80XSBn
cGlvOiBSZXBsYWNlICJkZWZhdWx0IHkiIHdpdGggImRlZmF1bHQgQVJDSF9SRUFMVEVLIiBpbiBL
Y29uZmlnDQo+IA0KPiBodHRwczovL2dpdC5rZXJuZWwub3JnL2JyZ2wvYy9iNWQyM2ZjZGIxMjk3
MmM1MjJlOTZmOTBhYjQ4YmU4YTBkOTcxYjBlDQo+IFszLzRdIGdwaW86IHJlYWx0ZWs6IEFkZCBk
cml2ZXIgZm9yIFJlYWx0ZWsgREhDIFJURDE2MjUgU29DDQo+IA0KPiBodHRwczovL2dpdC5rZXJu
ZWwub3JnL2JyZ2wvYy9hNTdlMjdjNDNiMDMxNWVlODZjNjg5NjUxMGQ2OWJlNTI1N2UwOTNlDQo+
IA0KDQpUaGFuayB5b3UgZm9yIGFwcGx5aW5nIHRoZSBwYXRjaGVzIQ0KDQpJJ20gY3VycmVudGx5
IHdvcmtpbmcgb24gdjYgb2YgdGhlIHBhdGNoIHNlcmllcyB0aGF0IGluY29ycG9yYXRlcyBBbmR5
J3MNCmdwaW8tcmVnbWFwIHBhdGNoZXMsIGFuZCBpdCBzaG91bGQgYnVpbGQgb24gdG9wIG9mIGdw
aW8vZm9yLW5leHQuIEhvd2V2ZXIsDQpJIGhhdmUgYSBjb25mbGljdCB3aXRoIHRoZSBkcml2ZXIg
cGF0Y2ggdGhhdCB3YXMgYWxyZWFkeSBhcHBsaWVkLg0KDQpDb3VsZCB5b3UgcGxlYXNlIHJldmVy
dCB0aGF0IGNvbW1pdCBmcm9tIGdwaW8vZm9yLW5leHQ/DQoNCkJlc3QgUmVnYXJkcywNCll1LUNo
dW4NCg0KPiBCZXN0IHJlZ2FyZHMsDQo+IC0tDQo+IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJhcnRv
c3ouZ29sYXN6ZXdza2lAb3NzLnF1YWxjb21tLmNvbT4NCg==

