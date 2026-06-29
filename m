Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D9FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 07:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f5qa8RAdToMYzzfcdF+jPx5im4QzdDpp231TTda8m9o=; b=GkkZGwqYCzecBLAUbrtFg9y/2V
	c1PyY/pmMY2u9ZrNatZY3M3MxvjPD0sP+IGQtjbYF0S59H55H5F4uIoC+WW183Vpnf3gC6gdA7M/2
	hEBvFnbu6LpyPVNes4J9KGPsEqSZgtKIX7M7p9qrTUNBa/D+fUhngSicVSzkVdjgaPtm156rtnWRW
	OZ5ojGGRi1jkDXWhG5oFVrkToHK4OL8w+zk3dW2A3Ut2jLBWI/c7cZuWkQDxgN+O3q+nDVULo2kCZ
	KDngBJQsHZiprdDtx5E7HEhGViyy8klfbcpbhzbYpeiEQxACAsk5QgIfje6vkw/8E/0c9V4HWQlYD
	4f8MH+qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we61V-0000000DpxV-1ghw;
	Mon, 29 Jun 2026 07:03:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we61T-0000000DpxE-3iQS;
	Mon, 29 Jun 2026 07:03:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=f5qa8RAdToMYzzfcdF+jPx5im4QzdDpp231TTda8m9o=; b=cUo2NO2FXhaC3nXaqbjBw7D839
	do9GjUyB2nrPHP6VgVeMpyYDXN2mU9Eo5X6Pkqn7niqKRrh4ENlYvsnj3mp5rvYvKXdufyAwl2IoU
	tmtCQpWFFRC7U+HBwczXWGYdBtdYKLwuV14J2HzPnZ3YuwNYKq1146xUOTdq3b44EM/0KBm99x9ba
	GWKKPe8aw1Yxwli7H/wAtSZs9Ysr1/cTayIfCyuefN7OwVKiPDIKBnFcd4niS88dHbWFsmOwQ2JD6
	OVqo9uVxWm2LGj15V9QGn7T1eBupQKsHyR7hQYDH/v9NU3TiDbcP5tTVJhE54Y1fV/KCodgyLrOBB
	MeHlafOw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1we61Q-00000000i9v-17zz;
	Mon, 29 Jun 2026 07:03:14 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 65T72WOl83489434, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1782716552; bh=f5qa8RAdToMYzzfcdF+jPx5im4QzdDpp231TTda8m9o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=vGTzHOJIFWA/mwRJcyAmSAO+OsjFR5EZKD1ArfiOQcQLsx33pAK2dcFJyqwLprxg3
	 gudxUm5MxQeJMPneTfZsILxHxjVipJNGwTx4xvGyZftUrpm1r/VPAl1z5UlcOKj/eg
	 x/lh+l9HXNpELT4ianuHERUsXtm5BgOonlii+G00Piz7PSe8Sil7rF8H8HAgFPIKGk
	 O4ublv9M2BixQwQlBLtushfsC0vjo9wWY6trUG6MduD4ejArRpQX1KXMe9ySAHSjBO
	 8xV9eFtG3edoIzkT+2qRSVMc5qDgh7QYyvCmXxRV9nDHSji8IYAvUQT/VyKY8Ad1Rb
	 ZeFnYCUakqHig==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 65T72WOl83489434
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 29 Jun 2026 15:02:32 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 29 Jun 2026 15:02:33 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 29 Jun 2026 15:02:33 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Mon, 29 Jun 2026 15:02:33 +0800
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
Subject: RE: [PATCH v9 04/12] reset: realtek: Add RTD1625-ISO reset controller
 driver
Thread-Topic: [PATCH v9 04/12] reset: realtek: Add RTD1625-ISO reset
 controller driver
Thread-Index: AQHdA8zC/zONM9TlNk2rSzncAW5GibZNJgWAgAHmVND//37xAIAGliyA
Date: Mon, 29 Jun 2026 07:02:32 +0000
Message-ID: <fef283cd7a3b45afae1f34ea9a06541e@realtek.com>
References: <20260624112940.3475605-1-eleanor.lin@realtek.com>
		 <20260624112940.3475605-5-eleanor.lin@realtek.com>
	 <9db83aa615f43ff6eac090626b43915fcd593a25.camel@pengutronix.de>
	 <f3b747e20110424c8a434cbd271edb87@realtek.com>
 <36c8a3db6038db4973b6cd80c554339f5b71d32c.camel@pengutronix.de>
In-Reply-To: <36c8a3db6038db4973b6cd80c554339f5b71d32c.camel@pengutronix.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_080312_990312_DC491F59 
X-CRM114-Status: GOOD (  27.55  )
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

SGkgUGhpbGlwcCwNCg0KPiANCj4gT24gRG8sIDIwMjYtMDYtMjUgYXQgMTA6MDUgKzAwMDAsIFl1
LUNodW4gTGluIFvmnpfnpZDlkJtdIHdyb3RlOg0KPiA+IEhpIFBoaWxpcHAsDQo+ID4NCj4gPiA+
IE9uIE1pLCAyMDI2LTA2LTI0IGF0IDE5OjI5ICswODAwLCBZdS1DaHVuIExpbiB3cm90ZToNCj4g
PiA+ID4gRnJvbTogQ2hlbmctWXUgTGVlIDxjeWxlZTEyQHJlYWx0ZWsuY29tPg0KPiA+ID4gPg0K
PiA+ID4gPiBBZGQgc3VwcG9ydCBmb3IgdGhlIElTTyAoSXNvbGF0aW9uKSBkb21haW4gcmVzZXQg
Y29udHJvbGxlciBvbiB0aGUNCj4gPiA+ID4gUmVhbHRlaw0KPiA+ID4gPiBSVEQxNjI1IFNvQy4N
Cj4gPiA+ID4NCj4gPiA+ID4gVGhlIHJlc2V0IGNvbnRyb2xsZXIgc2hhcmVzIHRoZSBzYW1lIHJl
Z2lzdGVyIHNwYWNlIHdpdGggdGhlIElTTw0KPiA+ID4gPiBjbG9jayBjb250cm9sbGVyLiBUbyBo
YW5kbGUgdGhpcyBzaGFyZWQgcmVnaXN0ZXIgc3BhY2UsIHRoZSByZXNldA0KPiA+ID4gPiBkcml2
ZXIgaXMgaW1wbGVtZW50ZWQgYXMgYW4gYXV4aWxpYXJ5IGRyaXZlci4gSXQgd2lsbCBiZQ0KPiA+
ID4gPiBpbnN0YW50aWF0ZWQgYW5kIHByb2JlZCB2aWEgdGhlIGF1eGlsaWFyeSBidXMgYnkgdGhl
IFJURDE2MjUtSVNPIGNsb2NrDQo+IGNvbnRyb2xsZXIgZHJpdmVyLg0KPiA+ID4gPg0KPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBDaGVuZy1ZdSBMZWUgPGN5bGVlMTJAcmVhbHRlay5jb20+DQo+ID4g
PiA+IENvLWRldmVsb3BlZC1ieTogWXUtQ2h1biBMaW4gPGVsZWFub3IubGluQHJlYWx0ZWsuY29t
Pg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZdS1DaHVuIExpbiA8ZWxlYW5vci5saW5AcmVhbHRl
ay5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiBDaGFuZ2VzIGluIHY5Og0KPiA+ID4gPiAtIEV4
dHJhY3QgcmVzZXQtcmVsYXRlZCBjb2RlIGZyb20gdGhlIHByZXZpb3VzIGNsb2NrIGRyaXZlciBw
YXRjaA0KPiA+ID4gPiAoZm9ybWVybHkgcGF0Y2ggOSBpbiB2OCkuDQo+ID4gPiA+IC0tLQ0KPiA+
ID4gPiAgZHJpdmVycy9yZXNldC9yZWFsdGVrL01ha2VmaWxlICAgICAgICAgICAgfCAgMiArLQ0K
PiA+ID4gPiAgZHJpdmVycy9yZXNldC9yZWFsdGVrL3Jlc2V0LXJ0ZDE2MjUtaXNvLmMgfCA5OQ0K
PiA+ID4gPiArKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ID4gPiAgMiBmaWxlcyBjaGFuZ2Vk
LCAxMDAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKSAgY3JlYXRlIG1vZGUNCj4gPiA+ID4g
MTAwNjQ0IGRyaXZlcnMvcmVzZXQvcmVhbHRlay9yZXNldC1ydGQxNjI1LWlzby5jDQo+ID4gPiA+
DQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Jlc2V0L3JlYWx0ZWsvTWFrZWZpbGUNCj4g
PiA+ID4gYi9kcml2ZXJzL3Jlc2V0L3JlYWx0ZWsvTWFrZWZpbGUgaW5kZXggYzNmNjA1ZmZiMTFj
Li45MDA3YzlkNTY4M2INCj4gPiA+ID4gMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvcmVz
ZXQvcmVhbHRlay9NYWtlZmlsZQ0KPiA+ID4gPiArKysgYi9kcml2ZXJzL3Jlc2V0L3JlYWx0ZWsv
TWFrZWZpbGUNCj4gPiA+ID4gQEAgLTEsMyArMSwzIEBADQo+ID4gPiA+ICAjIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkNCj4gPiA+ID4gIG9iai0kKENPTkZJR19SRVNFVF9S
VEtfQ09NTU9OKSArPSByZXNldC1ydGstY29tbW9uLm8NCj4gPiA+ID4gLW9iai0kKENPTkZJR19S
RVNFVF9SVEQxNjI1KSArPSByZXNldC1ydGQxNjI1LWNydC5vDQo+ID4gPiA+ICtvYmotJChDT05G
SUdfUkVTRVRfUlREMTYyNSkgKz0gcmVzZXQtcnRkMTYyNS1jcnQubw0KPiA+ID4gPiArcmVzZXQt
cnRkMTYyNS1pc28ubw0KPiA+ID4NCj4gPiA+IElzIHRoZXJlIGFueSBiZW5lZml0IHRvIHRoZXNl
IHR3byBiZWluZyBzZXBhcmF0ZSBtb2R1bGVzPw0KPiA+ID4gSSBzdWdnZXN0IHlvdSBtZXJnZSB0
aGVtIGludG8gb25lOiByZXNldC1ydGQxNjI1Lm8NCj4gPiA+DQo+ID4NCj4gPiBJZiBJIG1lcmdl
IHRoZW0gaW50byBhIHNpbmdsZSAncmVzZXQtcnRkMTYyNScgbW9kdWxlLCBib3RoIHRoZSAnY3J0
Jw0KPiA+IGFuZCAnaXNvJyBjbG9jayBkcml2ZXJzIHdvdWxkIHRyaWdnZXIgdGhlIHByb2JlIHBy
b2Nlc3MgZm9yIHRoZSBzYW1lDQo+ID4gcmVzZXQgZHJpdmVyIG5hbWUsIHdoaWNoIHdvdWxkIGxl
YWQgdG8gYSBkdXBsaWNhdGUgZHJpdmVyIHJlZ2lzdHJhdGlvbg0KPiA+IGVycm9yLg0KPiANCj4g
V2hhdCBkbyB5b3UgbWVhbiBieSBkdXBsaWNhdGUgZHJpdmVyIHJlZ2lzdHJhdGlvbiBlcnJvcj8N
Cj4gDQo+IFRoZXJlIHdvdWxkIG9ubHkgYmUgb25lIGF1eGlsaWFyeV9kcml2ZXIsIHdpdGggc3Vw
cG9ydCBmb3IgYWxsIHRocmVlDQo+IGF1eGlsaWFyeV9kZXZpY2VfaWQncy4NCj4gDQo+IA0KPiBy
ZWdhcmRzDQo+IFBoaWxpcHANCg0KQWgsIEkgdW5kZXJzdGFuZCB3aGF0IHlvdSBtZWFuIG5vdy4N
Cg0KUHJldmlvdXNseSwgSSBvbmx5IG1lcmdlZCB0aGVtIGluIHRoZSBNYWtlZmlsZSBidXQgbGVm
dCB0d28gc2VwYXJhdGUNCidtb2R1bGVfYXV4aWxpYXJ5X2RyaXZlcigpJyByZWdpc3RyYXRpb25z
IGluIHRoZSBDIGNvZGUsIHdoaWNoIGNhdXNlZCB0aGUNCmR1cGxpY2F0ZSByZWdpc3RyYXRpb24g
ZXJyb3IuDQoNCkZvbGxvd2luZyB5b3VyIHN1Z2dlc3Rpb24sIEkgd2lsbCByZWZhY3RvciB0aGUg
cmVzZXQgZHJpdmVycyBpbnRvIGEgc2luZ2xlDQonYXV4aWxpYXJ5X2RyaXZlcicgZW50cnkgd2l0
aCBhIHNpbmdsZSAnaWRfdGFibGUnIHRvDQpkaWZmZXJlbnRpYXRlIGJldHdlZW4gdGhlIGNydCwg
aXNvLCBhbmQgaXNvX3MgcmVzZXQgdHlwZXMuDQoNCkJlc3QgUmVnYXJkcywNCll1LUNodW4NCg0K

