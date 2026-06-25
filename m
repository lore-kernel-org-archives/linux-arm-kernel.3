Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2280CDB466
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 10:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=th+KaCo5ptZs+RHqEyaI/+5bXjVpk6+bxJ8u0JZdqBg=; b=cNvcWan1iZ/STyg1s//IZFeRjj
	amryU9d6p7H9FxOQdkI4XaLmuGnBka3DFR7oMDXlf2j9D8YP1c3dAq8jhZiwCFg1WAGG5vzXUurKg
	Am8U+7oTexpwtzT8bVOQthfSTwglbGgMp94Lyzi9B/OCGaic2Ogl5fb/CfNHlQTdG2HIGZEdFUdKD
	UNqmosIO5iSMWuQyOKHp/lppHLf4Lux7uXMWUEbIimB8UpOSKP9oA3eqHqnYIdy4ADgLCo0OFOzyP
	GB+cUiLZv1QOR+tguUjJW2xm2aD5gYtUxdju3cGEq05MmKXswfnDH2zpcy1dLpUKDcGEArj1U+DrD
	Wf3XV43A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcgvr-00000008xRf-3I5k;
	Thu, 25 Jun 2026 10:03:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcgvr-00000008xRU-0mWm;
	Thu, 25 Jun 2026 10:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=th+KaCo5ptZs+RHqEyaI/+5bXjVpk6+bxJ8u0JZdqBg=; b=PzmGU9NdfkjOgnGDXjH5CVQrvQ
	6ArcBY7Rct0b1XcEGjPr9tyK572Rr0eUNhc7t1Y+NbViG63lPYTn3hOsvGqKPuOo2V4Qt+7rCOTH1
	yZpdetBv83gc8k3c3LcSUmaX/rkl6kzGzIOjJXHVO7tVcja5Mbi2bBJl9hod7p+9wDDKCVTn8zV18
	o+pk/R/GIrWGCyZYuItbisqL4y2sdmVYYA3+/IvafDDaGCYFPizr8eHB+yyEU6PdLwMQ+nulDY4g2
	KKeKs7DssyY4hwlSOkDMaYWHoP1H0NsH6KQ+n4kIBMeJ/L2OLBbyvoj5MpQWG1bzSPljAKFQdB4vO
	gTo3YJ8A==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wcgvm-00000003SFV-2Vjl;
	Thu, 25 Jun 2026 10:03:38 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 65PA2wbY6717867, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1782381778; bh=th+KaCo5ptZs+RHqEyaI/+5bXjVpk6+bxJ8u0JZdqBg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=HwmTYMnvarTqM6BA40WtvLsClcGtoQ7m0Ktlw24ZOX/0YcNkBAh9ZMqU6x3WjCECa
	 qBns3fBiKSxgyzdxPGUO2Ms2r2YibnPd7BP/PIh1jHr9LIfUR0OE5veq3n0GFSFtEL
	 9PFfeUHkAkZ66tSHImhE/VTGZNzru72NUfp09X3MuLvQFRHFsfA3pN9MvzLXaZGp/d
	 zgnD3fr/t7obxCa8GyqMMcSmla7c38EZMClxT2OA1mrIzNuwg3c2yGQELB0/MYxphX
	 5CldvLN6LE2hrILEhrqxoiznlWBYq7+lJfTGqfuUrzhQHvFo4ec7LEuguPjru5W3Fi
	 vhhlBLNWIF1AQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 65PA2wbY6717867
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 Jun 2026 18:02:58 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 25 Jun 2026 18:02:59 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Thu, 25 Jun 2026 18:02:59 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
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
Subject: RE: [PATCH v9 02/12] reset: Add Realtek basic reset support
Thread-Topic: [PATCH v9 02/12] reset: Add Realtek basic reset support
Thread-Index: AQHdA8zBAZKfhVb73U+IfwNcnX+KFLZNJaIAgAHmRkA=
Date: Thu, 25 Jun 2026 10:02:59 +0000
Message-ID: <e447f0d347b343129064317fcf220ee7@realtek.com>
References: <20260624112940.3475605-1-eleanor.lin@realtek.com>
	 <20260624112940.3475605-3-eleanor.lin@realtek.com>
 <eb03894ae2765a426457238157e474087ea0aaa6.camel@pengutronix.de>
In-Reply-To: <eb03894ae2765a426457238157e474087ea0aaa6.camel@pengutronix.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_110336_175929_4706951F 
X-CRM114-Status: GOOD (  15.78  )
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

SGkgUGhpbGlwcCwNCg0KPiBPbiBNaSwgMjAyNi0wNi0yNCBhdCAxOToyOSArMDgwMCwgWXUtQ2h1
biBMaW4gd3JvdGU6DQo+ID4gU2lnbmVkLW9mZi1ieTogWXUtQ2h1biBMaW4gPGVsZWFub3IubGlu
QHJlYWx0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICtzdGF0aWMgaW50IHJ0a19yZXNldF9kZWFzc2Vy
dChzdHJ1Y3QgcmVzZXRfY29udHJvbGxlcl9kZXYgKnJjZGV2LA0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGlkeCkgew0KPiA+ICsgICAgIHN0cnVjdCBydGtf
cmVzZXRfZGF0YSAqZGF0YSA9IHRvX3J0a19yZXNldF9jb250cm9sbGVyKHJjZGV2KTsNCj4gPiAr
ICAgICBjb25zdCBzdHJ1Y3QgcnRrX3Jlc2V0X2Rlc2MgKmRlc2M7DQo+ID4gKyAgICAgdTMyIG1h
c2ssIHZhbDsNCj4gPiArDQo+ID4gKyAgICAgZGVzYyA9IHJ0a19yZXNldF9nZXRfZGVzYyhkYXRh
LCBpZHgpOw0KPiA+ICsgICAgIG1hc2sgPSBkZXNjLT53cml0ZV9lbiA/ICgweDNVIDw8IGRlc2Mt
PmJpdCkgOiBCSVQoZGVzYy0+Yml0KTsNCj4gPiArICAgICB2YWwgPSBtYXNrOw0KPiA+ICsNCj4g
PiArICAgICByZXR1cm4gcmVnbWFwX3VwZGF0ZV9iaXRzKGRhdGEtPnJlZ21hcCwgZGVzYy0+b2Zz
LCBtYXNrLCB2YWwpOw0KPiANCj4gWW91IGNhbiB1c2UgcmVnbWFwX3NldF9iaXRzKCkgaGVyZS4N
Cj4gDQoNCkFjay4NCg0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IHJ0a19yZXNldF9z
dGF0dXMoc3RydWN0IHJlc2V0X2NvbnRyb2xsZXJfZGV2ICpyY2RldiwNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgaWR4KSB7DQo+ID4gKyAgICAgc3RydWN0IHJ0
a19yZXNldF9kYXRhICpkYXRhID0gdG9fcnRrX3Jlc2V0X2NvbnRyb2xsZXIocmNkZXYpOw0KPiA+
ICsgICAgIGNvbnN0IHN0cnVjdCBydGtfcmVzZXRfZGVzYyAqZGVzYzsNCj4gPiArICAgICB1MzIg
dmFsOw0KPiANCj4gICAgICAgICB1bnNpZ25lZCBpbnQgdmFsOw0KPiANCg0KQWNrLg0KDQo+ID4g
KyAgICAgaW50IHJldDsNCj4gPiArDQo+ID4gKyAgICAgZGVzYyA9IHJ0a19yZXNldF9nZXRfZGVz
YyhkYXRhLCBpZHgpOw0KPiA+ICsgICAgIHJldCA9IHJlZ21hcF9yZWFkKGRhdGEtPnJlZ21hcCwg
ZGVzYy0+b2ZzLCAmdmFsKTsNCj4gPiArICAgICBpZiAocmV0KQ0KPiA+ICsgICAgICAgICAgICAg
cmV0dXJuIHJldDsNCj4gPiArDQo+ID4gKyAgICAgcmV0dXJuICEoKHZhbCA+PiBkZXNjLT5iaXQp
ICYgMSk7IH0NCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcmVzZXRfY29udHJvbF9v
cHMgcnRrX3Jlc2V0X29wcyA9IHsNCj4gPiArICAgICAuYXNzZXJ0ICAgPSBydGtfcmVzZXRfYXNz
ZXJ0LA0KPiA+ICsgICAgIC5kZWFzc2VydCA9IHJ0a19yZXNldF9kZWFzc2VydCwNCj4gPiArICAg
ICAuc3RhdHVzICAgPSBydGtfcmVzZXRfc3RhdHVzLA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArLyog
VGhlIGNhbGxlciBtdXN0IGluaXRpYWxpemUgZGF0YS0+ZGVzY3MsIGRhdGEtPnJjZGV2Lm5yX3Jl
c2V0cyBhbmQNCj4gPiArICogZGF0YS0+cmNkZXYub3duZXIgYmVmb3JlIGNhbGxpbmcgcnRrX3Jl
c2V0X2NvbnRyb2xsZXJfYWRkKCkuDQo+ID4gKyAqLw0KPiA+ICtpbnQgcnRrX3Jlc2V0X2NvbnRy
b2xsZXJfYWRkKHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgcnRrX3Jlc2V0X2RhdGEgKmRhdGEpIHsNCj4gPiArICAgICBkYXRhLT5yZWdt
YXAgICAgICAgICAgPSBkZXZfZ2V0X3BsYXRkYXRhKGRldik7DQo+ID4gKyAgICAgZGF0YS0+cmNk
ZXYub3BzICAgICAgID0gJnJ0a19yZXNldF9vcHM7DQo+ID4gKyAgICAgZGF0YS0+cmNkZXYuZGV2
ICAgICAgID0gZGV2Ow0KPiA+ICsgICAgIGRhdGEtPnJjZGV2Lm9mX25vZGUgICA9IGRldi0+cGFy
ZW50LT5vZl9ub2RlOw0KPiANCj4gVGhpcyBzcGxpdCByY2RldiBpbml0aWFsaXphdGlvbiBpcyBt
b3JlIGhhc3NsZSB0aGFuIGl0IGlzIHdvcnRoLg0KPiBQbGVhc2UganVzdCBleHBvcnQgcnRrX3Jl
c2V0X29wcyBhbmQgZHVwbGljYXRlIHRoZSByZWdtYXAvb3BzL2Rldi9vZl9ub2RlDQo+IGFzc2ln
bm1lbnQgaW4gdGhlIHByb2JlIGZ1bmN0aW9ucy4NCj4gDQo+IEFsdGVybmF0aXZlbHksIGNvbnNv
bGlkYXRlIHRoZSBwcm9iZSBmdW5jdGlvbiBhbmQgZXhwb3J0IGl0IGZyb20gaGVyZS4NCj4gDQoN
ClRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9uLiBJIHdpbGwgZ28gd2l0aCB5b3VyIGZpcnN0IGFw
cHJvYWNoIGluIHYxMC4NCg0KQmVzdCBSZWdhcmRzLA0KWXUtQ2h1bg0KDQo+IHJlZ2FyZHMNCj4g
UGhpbGlwcA0K

