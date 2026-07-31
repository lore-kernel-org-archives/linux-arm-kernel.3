Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03289C5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 08:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDq/39NYkCTEKLDC0hjx3kVLjkZNdyDTk8aSX84/Fus=; b=q6zpKQMJu9C8n34SMeEafRKlxT
	f46noajtp62noi5IxYjtCFZ03Yjy+upuSw1xglg2OD6jkIlozxDEG6Fu1EANk3vxnA4Zu8omOwnba
	/m4wUGwLBtbSTpiulCcTmeRYrk0dGhm5Wh2KBqsD4k17iMb1fkrBk6rXBKpjOHnILW1ynLIE8lEb7
	CjSxtHy0p10LwE0p+BJtvvO0URaDtvjLdyeFmIN169NduO8ZlIeRPcVVlxVMpQgrsKVhPlN7mAZPN
	nAaRmdlcmOkZ0q0xoh49lHHWotEex2BShvqkT+3qziOl7ubVtxf5UEkj9NMX1L7GJEY32uwoRElzO
	GsuBbPtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiRY-0000000C30k-1uS1;
	Fri, 31 Jul 2026 08:18:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiRX-0000000C30E-1Wim;
	Fri, 31 Jul 2026 08:18:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TDq/39NYkCTEKLDC0hjx3kVLjkZNdyDTk8aSX84/Fus=; b=JZCwG18+m2EkYes3Kd9wbfLf8O
	NQuQLacHmN218nyzruT4f5PEE3BO4kh4wAHAruJBudc+gkWvDfCWmqrDMcwN9ajD7QX+MRfP12hJv
	+xJ9qzriXC6917Hzg5Van3YSwy5Vo5ggAEWYo4ratvHfvBxY+LEdij2CQkYQicTYOtYTys4D1T4yL
	DDpiUdQcRRFG2/Uid/NpWJuqQLGkEv48W44I4lP0WJuJsRlvv8HBaF4sjhpdpQkODZJ3Rxt0tKgrj
	A98RkH9FUU24+rs2tquYmi3OQrhulCgTSiOUP345aWkylDfEbv6jRLgdD+ARYyyhyPQenn6QSkQ+L
	bzzwDRlA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wpiRU-00000007J3n-0FXr;
	Fri, 31 Jul 2026 08:18:10 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66V8HinX61760576, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1785485864; bh=TDq/39NYkCTEKLDC0hjx3kVLjkZNdyDTk8aSX84/Fus=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=O0820tfMFtLGtMVH2gspHi/gE2vBsFsDePTWWP3QC0T+90Op/yr8ivbWqxYykG4mu
	 +NneuSni+j5gvzuIKXg243fCyBuhaPjbX9u5ghBZgzNizNYIo1ylDoBiArCmQwcdNR
	 haRh0aU2noHbZpyNquXuWxeDg/o2KQy0NasDyPUfIrBhh5oWQk6MKjRjabSzY3OtBH
	 tvxAt1otXtcV+D3w/sTyQx0DUwN7IjSFkPp6TNgpye6hHitmMONPnqNutx1a6RBZJK
	 CSETjwwry9CxsOeFmJOhaE77TDszueHyanm8uWrM80i5ycbf1LTT7aJ2woNG3x5ua1
	 GcpqsE3+u6y8Q==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66V8HinX61760576
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 Jul 2026 16:17:44 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 31 Jul 2026 16:17:44 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Fri, 31 Jul 2026 16:17:44 +0800
From: =?big5?B?WXUtQ2h1biBMaW4gW6pMr6enZ10=?= <eleanor.lin@realtek.com>
To: Brian Masney <bmasney@redhat.com>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?big5?B?RWRnYXIgTGVlIFun9anTv9ld?= <cylee12@realtek.com>,
	=?big5?B?SnlhbiBDaG91IFupUKrppndd?= <jyanchou@realtek.com>,
	"afaerber@suse.com" <afaerber@suse.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>, =?big5?B?SmFtZXMgVGFpIFvAuafTrnBd?=
	<james.tai@realtek.com>, =?big5?B?Q1lfSHVhbmdbtsDgsq7LXQ==?=
	<cy.huang@realtek.com>, =?big5?B?U3RhbmxleSBDaGFuZ1up96h8vHdd?=
	<stanley_chang@realtek.com>
Subject: RE: [PATCH v11 09/11] clk: realtek: Add RTD1625-CRT clock controller
 driver
Thread-Topic: [PATCH v11 09/11] clk: realtek: Add RTD1625-CRT clock controller
 driver
Thread-Index: AQHdHp1PRrydlNtj20y7WRFW4A3UiraFxLQAgAGIGQA=
Date: Fri, 31 Jul 2026 08:17:44 +0000
Message-ID: <577a6882b25e457fa94fa199e66f3197@realtek.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-10-eleanor.lin@realtek.com>
 <amuBqi43ce9bYbir@redhat.com>
In-Reply-To: <amuBqi43ce9bYbir@redhat.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_091808_769354_830FA345 
X-CRM114-Status: GOOD (  23.31  )
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

SGkgQnJpYW4sDQoNCj4gSGkgWXUtQ2h1biwNCj4gDQo+IE9uIFR1ZSwgSnVsIDI4LCAyMDI2IGF0
IDEwOjI4OjA0UE0gKzA4MDAsIFl1LUNodW4gTGluIHdyb3RlOg0KPiA+IEZyb206IENoZW5nLVl1
IExlZSA8Y3lsZWUxMkByZWFsdGVrLmNvbT4NCj4gPg0KDQooLi4uKQ0KDQo+ID4gKw0KPiA+ICtz
dGF0aWMgaW50IHJ0ZDE2MjVfY3J0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
IHsNCj4gPiArICAgICBjb25zdCBzdHJ1Y3QgcnRrX2Nsa19kZXNjICpkZXNjOw0KPiA+ICsNCj4g
PiArICAgICBkZXNjID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZwZGV2LT5kZXYpOw0KPiAN
Cj4gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCkgaXMgZGVwcmVjYXRlZC4gVXNlDQo+IGRldmlj
ZV9nZXRfbWF0Y2hfZGF0YSgmcGRldi0+ZGV2KSBpbnN0ZWFkLiBZb3Ugc2hvdWxkIGJlIGFibGUg
dG8gZHJvcCB0aGUNCj4gbGludXgvb2ZfZGV2aWNlLmggaW5jbHVkZSBhdCB0aGUgdG9wLg0KPiAN
Cg0KQWNrLg0KDQo+IA0KPiA+ICsgICAgIGlmICghZGVzYykNCj4gPiArICAgICAgICAgICAgIHJl
dHVybiAtRUlOVkFMOw0KPiA+ICsNCj4gPiArICAgICByZXR1cm4gcnRrX2Nsa19wcm9iZShwZGV2
LCBkZXNjKTsgfQ0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQg
cnRkMTYyNV9jcnRfbWF0Y2hbXSA9IHsNCj4gPiArICAgICB7LmNvbXBhdGlibGUgPSAicmVhbHRl
ayxydGQxNjI1LWNydC1jbGsiLCAuZGF0YSA9DQo+ID4gKyZydGQxNjI1X2NydF9kZXNjLH0sDQo+
IA0KPiBBZGQgYSBzcGFjZSBhZnRlciB0aGUgeyBhbmQgYmVmb3JlIHRoZSBlbmRpbmcgfS4NCj4g
DQoNCkFjay4NCg0KPiA+ICsgICAgIHsgLyogc2VudGluZWwgKi8gfQ0KPiA+ICt9Ow0KPiA+ICtN
T0RVTEVfREVWSUNFX1RBQkxFKG9mLCBydGQxNjI1X2NydF9tYXRjaCk7DQo+ID4gKw0KPiA+ICtz
dGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBydGQxNjI1X2NydF9kcml2ZXIgPSB7DQo+ID4g
KyAgICAgLnByb2JlID0gcnRkMTYyNV9jcnRfcHJvYmUsDQo+ID4gKyAgICAgLmRyaXZlciA9IHsN
Cj4gPiArICAgICAgICAgICAgIC5uYW1lID0gInJ0ay1ydGQxNjI1LWNydC1jbGsiLA0KPiA+ICsg
ICAgICAgICAgICAgLm9mX21hdGNoX3RhYmxlID0gcnRkMTYyNV9jcnRfbWF0Y2gsDQo+ID4gKyAg
ICAgICAgICAgICAuc3VwcHJlc3NfYmluZF9hdHRycyA9IHRydWUsDQo+IA0KPiBUaGlzIGRyaXZl
ciBpcyBsaXN0ZWQgYXMgYSB0cmlzdGF0ZSBpbiB0aGUgS2NvbmZpZyBidXQgdGhlbiB5b3UgaGF2
ZSB0aGlzLiBJcyB0aGUNCj4gaW50ZW50aW9uIG9mIHRoaXMgZHJpdmVyIHRvIGJlIGJ1aWx0IGlu
IG9ubHk/DQo+IA0KDQpJIHdpbGwgY2hhbmdlIHRoZSBLY29uZmlnIG9wdGlvbnMgZm9yIHRoaXMg
ZHJpdmVyLCBhcyB3ZWxsIGFzIHRoZSByZWxhdGVkDQpjb25maWcsIGZyb20gdHJpc3RhdGUgdG8g
Ym9vbC4NCg0KPiA+ICsgICAgIH0sDQo+ID4gK307DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IF9f
aW5pdCBydGQxNjI1X2NydF9pbml0KHZvaWQpIHsNCj4gPiArICAgICByZXR1cm4gcGxhdGZvcm1f
ZHJpdmVyX3JlZ2lzdGVyKCZydGQxNjI1X2NydF9kcml2ZXIpOw0KPiA+ICt9DQo+ID4gK3N1YnN5
c19pbml0Y2FsbChydGQxNjI1X2NydF9pbml0KTsNCj4gDQo+IElzIHRoZXJlIGEgcmVhc29uIHRo
YXQgeW91IGNhbid0IHVzZSBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKCkgdG8gaGF2ZSB0aGlzDQo+
IHJlZ2lzdGVyZWQgYXQgdGhlIGRldmljZV9pbml0Y2FsbCBsZXZlbD8NCj4gDQo+IEJyaWFuDQoN
Ck5vIHNwZWNpZmljIHJlYXNvbi4gSSB3aWxsIGNoYW5nZSBpdCB0byB1c2UgbW9kdWxlX3BsYXRm
b3JtX2RyaXZlcigpIHRvDQp0YWtlIGFkdmFudGFnZSBvZiB0aGUgZGVmZXJyZWQgcHJvYmUgbWVj
aGFuaXNtLg0KDQpUaGFuayB5b3UgZm9yIHJldmlld2luZy4NCg0KQmVzdCBSZWdhcmRzLA0KWXUt
Q2h1bg0K

