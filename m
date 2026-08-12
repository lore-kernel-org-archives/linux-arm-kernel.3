Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A51C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 09:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9dgD8NETMczdDIL/VoWWE5yrLNaW/+4UzsIrHmvh40=; b=eVyVdLKrJNzHY9MHFFAUm+3r05
	lfZqi8B0C43dxvAeXmxlP/CJ++YsYU+s1SlVYvaAStoWvNkoolv30ILAg5Xyz6vgCeO+RGXRRtLeB
	PknvaT2Kl9fBT0Cvv3EvXeKxXmOd3UeTHGYy9tqLPNloUreDnlYVqb2UGlHnjHHmLNbOFlv0Wpulb
	MZH6r9yY8KmMbXBmRKmDmSfmxksbTFIAth2KxZyS3CAWaDvit6ZjBzijkNkAexD5VayUHBKDeKTY9
	EOHNc1Zgkev2FmKamCpGqV4GzuFoiwoG4Z72Kn8Jdp8hvQx01hQNwdC0IzIgyLeW+ZezKsco86B7o
	oaAaziBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5TB-0000000FmaS-3M2g;
	Wed, 12 Aug 2026 09:41:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5T5-0000000FmXd-2miw;
	Wed, 12 Aug 2026 09:41:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=D9dgD8NETMczdDIL/VoWWE5yrLNaW/+4UzsIrHmvh40=; b=K0Jrbi0cOH0sRrrdv0NpYZyCqu
	9AJDhE7LbGj+lDFjISwoSKLOqflBZNvSTLKiZzQGip76n2Y9nZqE8rxektLk0qqHEI1LVoURKah+h
	19svU0U0PgNY4KPwrFgw2We7ZPH6JQRQZ4qOPqbWwTpgd5UH+UutuzN3jn+Q8jA8T4UX1QAWRw3Eq
	MdxUqQpFiHfSycy5tgupKhQVNLAjF6DswObclX+4AiSn/oWklDmyXZJhhdcSUnbZnSGGjAL8rlyOX
	HegN8HGyogr5qfTphC2rWeqwovB2a41Y8+mpEzNk0+hHUX5J0yyspmzcPDOUiQZq0MokUypvE3uGd
	1XKOnI1w==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wu5T1-0000000FGZp-3gqH;
	Wed, 12 Aug 2026 09:41:50 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 67C9f6bjD3497543, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1786527666; bh=D9dgD8NETMczdDIL/VoWWE5yrLNaW/+4UzsIrHmvh40=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=rjGVv6bd3y+Z+j8T1xoakVTILwLRMq2USZHsM0ri3blImk+nR+Ib7QftnmLNSutWL
	 ROdvXm08aoNMoE0AHJfI5TzsF2W30QFeTzdDZKMvr6AovAHzCwESeY19rcN47mH9TO
	 X5gOYJZSIoM8XwsftLfprUTmCVc4H6i8vojKpjCU9n/SliuOlkixf9hQCtrof6xGv3
	 p970v9pZ4IcM9G906ZCmLYT9viErmrzTWhuE5oqCkgqu8DjZ5zuoehsjE5xa0z02zd
	 6pi9mttyMtDaBNqOQqZ83UXEhb4khN3mV7PyfGfldamUZ1ZSYZrzK+2Ky4ImKEfsdt
	 ySg7Y0k5S9lDA==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 67C9f6bjD3497543
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Aug 2026 17:41:06 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 12 Aug 2026 17:41:06 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::126f:59ad:658:674d%10]) with mapi id
 15.02.2562.043; Wed, 12 Aug 2026 17:41:06 +0800
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
Thread-Index: AQHdKf6sqK1LXpXPjkadMFMzDtoXkraZlK4AgACT8SA=
Date: Wed, 12 Aug 2026 09:41:06 +0000
Message-ID: <fd254ec8d59a4ed3b4ea157b866ce798@realtek.com>
References: <20260812020009.3480538-1-eleanor.lin@realtek.com>
 <20260812020009.3480538-2-eleanor.lin@realtek.com>
 <313b74fd-1a5f-4e1b-a4e2-a537f7939fad@oss.qualcomm.com>
In-Reply-To: <313b74fd-1a5f-4e1b-a4e2-a537f7939fad@oss.qualcomm.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_104148_658316_DBE52319 
X-CRM114-Status: GOOD (  10.97  )
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

SGkgS3J6eXN6dG9mLA0KDQo+IE9uIDEyLzA4LzIwMjYgMDM6NTksIFl1LUNodW4gTGluIHdyb3Rl
Og0KPiA+IEFkZCBEVCBiaW5kaW5nIHNjaGVtYSBmb3IgUmVhbHRlayBSVEQxNjI1IGNsb2NrIGFu
ZCByZXNldCBjb250cm9sbGVyDQo+ID4NCj4gPiBSZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBvc3MucXVhbGNvbW0uY29tPg0KPiANCj4gSG93IG15
IHRhZyBjb3VsZCBhcHBlYXIgaGVyZT8NCj4gDQo+IExvb2s6DQo+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xrbWwvMjAyNjAzMjQwMjUzMzIuMzQxNjk3Ny0yLWVsZWFub3IubGluQHJlYWx0ZWsu
Yw0KPiBvbS8NCj4gDQo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBDaGVuZy1ZdSBMZWUgPGN5bGVlMTJA
cmVhbHRlay5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2hlbmctWXUgTGVlIDxjeWxlZTEyQHJl
YWx0ZWsuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFl1LUNodW4gTGluIDxlbGVhbm9yLmxpbkBy
ZWFsdGVrLmNvbT4NCj4gDQo+IFdobyBhZGRlZCBteSB0YWc/IFdoYXQgaXMgdGhlIGFjdHVhbCBm
bG93IG9mIHRoaXMgcGF0Y2g/DQo+IA0KDQpZb3UgZ2F2ZSB5b3VyIFJldmlld2VkLWJ5IHRhZyBp
biB2NS4gSG93ZXZlciwgYWZ0ZXIgdGhhdCwgU3RlcGhvbiBwcm92aWRlZA0KYWRkaXRpb25hbCBm
ZWVkYmFjay4gSW4gdjYsIEkgbW9kaWZpZWQgdGhlIHBhdGNoIGJhc2VkIG9uIFN0ZXBob24ncw0K
Y29tbWVudHMgYW5kIG1hZGUgc29tZSBvdGhlciBjaGFuZ2VzLiBGdXJ0aGVybW9yZSwgSSBhZGRl
ZCB0aGUgY2xvY2sgSUQNCjE0NCBpbiB2MTEuDQoNCkFmdGVyIHY2LCBJIGRpZG4ndCBkcm9wIHlv
dXIgdGFnLiBJIGFwb2xvZ2l6ZSBmb3IgdGhlIG1pc3Rha2UgaW4gdGhlIHBhdGNoDQpmbG93Lg0K
DQpJIHdpbGwgZHJvcCB5b3VyIHRhZyBpbiB2MTQuDQoNCkJlc3QgcmVnYXJkcywNCll1LUNodW4N
Cg0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0K

