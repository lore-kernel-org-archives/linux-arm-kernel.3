Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE09CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=moujiGOu9PAJ3ZlhRbXA7SWL1BST4vazsX9fofw7HTI=; b=YZ6+z1/AcO6HguVGFoU693b2Tf
	50IAwk63JaaKUBPHTObXcCV25FNBJ+ovSCmCz3JUdu/uXVhzChTVcwFnEhBY1pzW2Tp74gwpkJZr+
	fONM3LS09yQb0zWytC/Bb7766yst70xVnUQ+vuq61DyR0+YUXP1kdIFgTVj5VSRdt5NSkEiMoJnzI
	06sY1CRii/JyWSBAP5pRQuMNowMWlj7S+/uT4+5b65Ey4NhIhZTXMR47mnhkDEjhJR3hxjO9H4Evf
	rIJg9PP1fIz1iezPXMEpoT1F6TFxVA4kJPuXE7jjWmV9IS5M5E+6jEapUZhezh64IWH+ATHx/paFz
	2nntE+lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZn96-0000000H1E5-3nqv;
	Wed, 17 Jun 2026 10:05:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZn94-0000000H1Dc-2H28;
	Wed, 17 Jun 2026 10:05:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=moujiGOu9PAJ3ZlhRbXA7SWL1BST4vazsX9fofw7HTI=; b=DvtiiHxZatrwg9UDwtCFyWkrdg
	QysBQpPCqy+APj5Ma/HzcNh9Mv2dZghHwBUtBv7g7AlWZT7g61h0EDm4vuVQcIdW0XXUeFJMocC+e
	Jz3j9EhoffktVtNc7giB9ilKHaBVwOgudk7XZiaQ2+QLfj9CGs7nRvabHm0+zSHSYLnAxjJI+B7u3
	hh2AzWJEgOPvcNHrt7LUnKiAIF82OPDMRAgx4uY7tO9CAGISYHbGSQ7Pb6pDlvaQN9FjEcmvvO+Hy
	cmJ/GZDGu+9u6BJpOx0but9xbn9JY2Y732CY/UA4KpqJGelL+HJN/bL8oF41a+RcLkmmdVDa5zZLR
	XovyLy3A==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wZn90-0000000ByhD-4Arr;
	Wed, 17 Jun 2026 10:05:17 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 65H9sREk92672371, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1781690067; bh=moujiGOu9PAJ3ZlhRbXA7SWL1BST4vazsX9fofw7HTI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=Z8INmZOWK5z00I2KVZAR9ytDHODlboHrX57M3opOQjVa4KUmNXll1kjvNmuj2qeJ6
	 ZYzulV0QFjZa/i9o5Y5exjKiVHbOoGnDmQRvaexKEZZuQAsXMyoPwVakiNC/BAH+8R
	 KHZOhjQBpOJjmMN6oyPdeB4lC0DnJ9dV4pwhqj70Zsnph9V6Q8bmW9myl/M7R7n6Vb
	 wi/JnDuNzvzCPlPKRrYnGLP6Cvl7wDlyWAC48R6p39ldmITbooIhiiLtK/+UmtNawC
	 4sdVjBjCS47qYNlrLsUXnLvISeUoarVJZrGFX8yGmDNgdonr1dwwc/nkGsgd8pVuhQ
	 EGoqfnUBdzWPg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 65H9sREk92672371
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 Jun 2026 17:54:27 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Jun 2026 17:54:27 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Wed, 17 Jun 2026 17:54:27 +0800
From: =?big5?B?WXUtQ2h1biBMaW4gW6pMr6enZ10=?= <eleanor.lin@realtek.com>
To: Michael Walle <mwalle@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
CC: "linusw@kernel.org" <linusw@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "afaerber@suse.com"
	<afaerber@suse.com>, "wbg@kernel.org" <wbg@kernel.org>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	"lars@metafoo.de" <lars@metafoo.de>, "Michael.Hennerich@analog.com"
	<Michael.Hennerich@analog.com>, "jic23@kernel.org" <jic23@kernel.org>,
	"nuno.sa@analog.com" <nuno.sa@analog.com>, "andy@kernel.org"
	<andy@kernel.org>, "dlechner@baylibre.com" <dlechner@baylibre.com>,
	=?big5?B?VFlfQ2hhbmdbsWmkbLZoXQ==?= <tychang@realtek.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>, "linux-iio@vger.kernel.org"
	<linux-iio@vger.kernel.org>, =?big5?B?Q1lfSHVhbmdbtsDgsq7LXQ==?=
	<cy.huang@realtek.com>, =?big5?B?U3RhbmxleSBDaGFuZ1up96h8vHdd?=
	<stanley_chang@realtek.com>, =?big5?B?SmFtZXMgVGFpIFvAuafTrnBd?=
	<james.tai@realtek.com>
Subject: RE: [PATCH v3 2/7] gpio: regmap: add gpio_regmap_get_gpiochip()
 accessor
Thread-Topic: [PATCH v3 2/7] gpio: regmap: add gpio_regmap_get_gpiochip()
 accessor
Thread-Index: AQHc4cATn1PDC9J2iUegNlC3h35mQ7YJuQgAgBT/RkCADN+cAIAIv5wAgAAIjACADkT7EP//fG0AgACZdFA=
Date: Wed, 17 Jun 2026 09:54:27 +0000
Message-ID: <61c053a5a8e6461f9e6fcd40b6b5064d@realtek.com>
References: <20260512033317.1602537-1-eleanor.lin@realtek.com>
 <20260512033317.1602537-3-eleanor.lin@realtek.com>
 <agMM9soiqpG-TRSb@ashevche-desk.local>
 <adff3a2d21a64d3ea3b408d62157ee1e@realtek.com>
 <ah92oEavMu4QRn8y@ashevche-desk.local>
 <CAMRc=MdA24z-tB_D8CTw68Di8e4OVQJ1QH4+rDskFzq=xjJ5BQ@mail.gmail.com>
 <DJ3QVMZ6XLW9.1M9W541O92QWJ@kernel.org>
 <39de4d4ada5446e7a33e48c43f410439@realtek.com>
 <DJB6XO07EC8Q.1X9P752MLFB4N@kernel.org>
In-Reply-To: <DJB6XO07EC8Q.1X9P752MLFB4N@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_110515_688215_F7820816 
X-CRM114-Status: GOOD (  12.55  )
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

SGkgTWljaGFlbCwNCg0KPiBIaSwNCj4NCj4gT24gV2VkIEp1biAxNywgMjAyNiBhdCAxMDozNiBB
TSBDRVNULCBZdS1DaHVuIExpbiBbqkyvp6dnXSB3cm90ZToNCj4+Pj4+PiBXaXRob3V0IGFuIGFj
Y2Vzc29yIGxpa2UgZ3Bpb19yZWdtYXBfZ2V0X2dwaW9jaGlwKCksIHdlIGNhbm5vdCANCj4+Pj4+
PiByZXRyaWV2ZSB0aGUgZ3Bpb19jaGlwIGluc3RhbnRpYXRlZCBpbnNpZGUgZ3Bpby1yZWdtYXAu
YyB0byANCj4+Pj4+PiBmdWxmaWxsIHRoZXNlIHJlcXVpcmVtZW50cyBpbiBvdXINCj4+Pj4+PiBt
YXAoKSBmdW5jdGlvbi4NCj4+Pg0KPj4+IFdoeSBpcyBncGlvY2hpcF9pcnFfcmVxcmVzKCkgY2Fs
bGVkIGluIHRoZSBmaXJzdCBwbGFjZT8gSXNuJ3QgdGhhdCANCj4+PiBvbmx5IGNhbGxlZCBpZiB0
aGUgaXJxIGhhbmRsaW5nIGlzIHNldCB1cCB2aWEgZ2MtPmlycS5jaGlwIGFuZCBub3QgDQo+Pj4g
dmlhDQo+Pj4gZ3Bpb2NoaXBfaXJxY2hpcF9hZGRfZG9tYWluKCkgbGlrZSBpbiBncGlvLXJlZ21h
cD8NCj4+Pg0KPj4NCj4+IFRoZSBwYW5pYyB3YXMgY2F1c2VkIGJ5IG15IGRyaXZlciBpbmNsdWRp
bmcgDQo+PiAnR1BJT0NISVBfSVJRX1JFU09VUkNFX0hFTFBFUlMnLCB3aGljaCBmb3JjZWQgdGhl
IGNhbGwgdG8gJ2dwaW9jaGlwX2lycV9yZXFyZXMoKScgYW5kIGNyYXNoZWQuDQo+DQo+IEJ1dCB3
aHkgZGlkIHlvdSB1c2UgaXQgaWYgeW91ciBpcnEgZG9tYWluIGlzbid0IG1hbmFnZWQgYnkgdGhl
IGdwaW9saWIsIGJ1dCByYXRoZXIgeW91ciBvd24gPmlycSBkb21haW4/IEJlZm9yZSBnb2luZyB3
aXRoIG9wdGlvbiAjMyBJJ2QgZG91YmxlIGNoZWNrIGlmIHRoYXQgaXMgY29ycmVjdCBpbiB5b3Vy
IGRyaXZlci4NCj4NCj4gLW1pY2hhZWwNCg0KRG8geW91IG1lYW4gdGhhdCBhIGN1c3RvbSBJUlEg
ZG9tYWluIHNob3VsZG4ndCBiZSBtaXhlZCB3aXRoIGdwaW9saWIgZmVhdHVyZXMgbGlrZQ0KJ0dQ
SU9DSElQX0lSUV9SRVNPVVJDRV9IRUxQRVJTJz8NCg0KQWRkaXRpb25hbCBpbmZvcm1hdGlvbjog
b3VyIEdQSU8gY29udHJvbGxlciByZWNlaXZlcyAzIHNlcGFyYXRlIGludGVycnVwdCBsaW5lcy4N
CkJlY2F1c2UgdGhlIHN0YW5kYXJkICdyZWdtYXBfaXJxX2NoaXAnIG1lY2hhbmlzbSBpbiAnZ3Bp
by1yZWdtYXAnIGRvZXMgbm90IHN1cHBvcnQNCnRoaXMgbXVsdGktbGluZSBoYXJkd2FyZSBkZXNp
Z24sIHdlIGFyZSBmb3JjZWQgdG8gY3JlYXRlIG91ciBvd24gSVJRIGRvbWFpbiBhbmQgcGFzcw0K
aXQgdmlhICdjb25maWctPmlycV9kb21haW4nLiANCg0KR2l2ZW4gdGhpcyBjb25zdHJhaW50ICh0
aGF0IHdlIG11c3QgdXNlIG91ciBvd24gSVJRIGRvbWFpbiksIGFyZSB5b3Ugc3VnZ2VzdGluZw0K
dGhhdCB3ZSBzaG91bGQgaW1wbGVtZW50IG91ciBvd24gJ2lycV9yZXF1ZXN0X3Jlc291cmNlcycg
YW5kDQonaXJxX3JlbGVhc2VfcmVzb3VyY2VzJyBjYWxsYmFja3MgaW5zdGVhZCBvZiByZWx5aW5n
IG9uDQonR1BJT0NISVBfSVJRX1JFU09VUkNFX0hFTFBFUlMnPw0KDQpCdXQgaWYgdGhhdCBpcyB0
aGUgY2FzZSwgd2Ugd291bGQgbXVjaCBwcmVmZXIgdG8gbGV0IHRoZSBjb3JlIGdwaW9saWIgaGFu
ZGxlDQp0aGVzZSByZXNvdXJjZSBhbmQgc3RhdGUgbWFuYWdlbWVudCB0YXNrcyBmb3IgdXMgKmFz
IHByb3Bvc2VkIGluIG9wdGlvbiAzKSwgcmF0aGVyIA0KdGhhbiBkdXBsaWNhdGluZyB0aGUgZWZm
b3J0IGluIG91ciBkcml2ZXIuDQoNCkJlc3QgUmVnYXJkcywNCll1LUNodW4NCg==

