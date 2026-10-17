Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90043CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 09:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2xvXwXpH3oNPZ0br7VdFtxgQD2uo52DIxsxCJg5a5Q=; b=vLGPR5Q+IGf8lIlY6ibazS7ecD
	Ql19MTE7/0BlvjAY1FyMEuw9IQjG2uLrbBfZ1q6Z42ci0C0M6RY4SKf2kWVmBUARtxFjXJeDpRKk8
	CbcAHuCpuL1JjI4wImfysJn2T7H6nyz5SCIhpSUVQhyWPl6Ct2cptc4ekMvLB+taQknBZpDz+xfnv
	FX6NDQ802lDZpJqIjL0Y604h0Ag5lTJaI14k3/95mtQbo+jwaOD/jRXMpTNrFoKaf0lv3SV31qzQr
	jMxTX/h1PEK4jT2SGn+Xe0wl2i7Yxybh1ExuYKgk8CzxfdpFjgDyALERGW9LfKzBvt6OIYE7XHhj5
	dPY3Z+Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI0PR-00000004beZ-0bGM;
	Sat, 17 Oct 2026 09:08:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI0PP-00000004beO-20CG;
	Sat, 17 Oct 2026 09:08:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=h2xvXwXpH3oNPZ0br7VdFtxgQD2uo52DIxsxCJg5a5Q=; b=H7im0TJUtu4nSmmNFhEnqsarBN
	LarJwHbkUUl/EzXB/+OtT6jeBJlAKALgR+4Auhdg3zARIB98id8hwEzx9FqB+Amq8H+x5QPdne4FW
	vL8YGNVnzdZyEhea+zDZnElgmgeVJFk/R12fPXzim3hecAdYVPUzyJu+yF9uubcDufMyWFIv+u1YG
	QVYTMNJGnz5k74OFHpYhtNFYvtAid97r6DvV/fQeC5jY0ynoFaDBNKjnA8CySz8pJDDFm3g3726Go
	rPqbomHUVldKPIPhE8g+yaH2bnbkkR5Oo0KXWQUZ9BI0upNjUs+yBqWsr7aHO4vhZrseBREG0cXsm
	1vT5gdMg==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xI0PL-00000002G4H-2qFl;
	Sat, 17 Oct 2026 09:08:54 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69H98SSP0010786, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1792228108; bh=h2xvXwXpH3oNPZ0br7VdFtxgQD2uo52DIxsxCJg5a5Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=OoDMX8fkWLzWJ4wWmtty6sXe9G2rAIVXsndHn56/PRbXrAhalQQMNtnQT7ujN78fB
	 n8CAY4YagfiqCf32S+1y34K5C4DOkIKIc8ayLbI8n63nIYU3PFlYNqkvZvTvVw2amv
	 f518eVlFNSJBYcZYQ8p6j+f8uTt9YclhWyb/jX8I+9oMahtFITBHDnVR86B5MLQ0Pq
	 L0vG/LW2hH4PHbETsFbpzQf1ZKg+LE0dHJgqUBZaORy6Q9VKhPCEU3ZieKeP8CSxRx
	 Qgh4qIePb/wzK20H9oLt6amks1CUzZ1mTG/eubCYYu3SyguISEMZyjdSV6DtU+TK75
	 FtcXP/p/JtpIQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69H98SSP0010786
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 17 Oct 2026 17:08:28 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 17 Oct 2026 17:08:28 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 17 Oct 2026 17:08:28 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::b3cc:c263:b82d:e87c%10]) with mapi id
 15.02.2562.049; Sat, 17 Oct 2026 17:08:27 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: "jbrunet+clk@baylibre.com" <jbrunet+clk@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?utf-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
	"afaerber@suse.com" <afaerber@suse.com>,
	=?utf-8?B?SnlhbiBDaG91IFvlkajoirflrold?= <jyanchou@realtek.com>,
	"bmasney+clk@redhat.com" <bmasney+clk@redhat.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
	=?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
	=?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>,
	Brian Masney <bmasney@redhat.com>
Subject: RE: [PATCH v15 09/11] clk: realtek: Add RTD1625-CRT clock controller
 driver
Thread-Topic: [PATCH v15 09/11] clk: realtek: Add RTD1625-CRT clock controller
 driver
Thread-Index: AQHdUkHDeyAIvxzC6kidLKM4l0r/f7b1DaSAgAx7uAA=
Date: Sat, 17 Oct 2026 09:08:27 +0000
Message-ID: <cef1d6ec8329461dbf98e86e9594f103@realtek.com>
References: <20261002074331.3066919-1-eleanor.lin@realtek.com>
 <20261002074331.3066919-10-eleanor.lin@realtek.com>
 <179157057524.266328.2343186062671086748.b4-review@b4>
In-Reply-To: <179157057524.266328.2343186062671086748.b4-review@b4>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.16.3.62]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_100852_822359_37FCA513 
X-CRM114-Status: GOOD (  12.10  )
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

SGkgSmVyb21lLA0KDQo+ID4gK3N0YXRpYyBjb25zdCBjaGFyICogY29uc3QgY2xrX2dwdV9wYXJl
bnRzW10gPSB7InBsbF9ncHUiLCAiY2xrX3N5cyJ9Ow0KPiA+ICtzdGF0aWMgUlRLX0NMS19SRUdN
QVBfTVVYKGNsa19ncHUsIGNsa19ncHVfcGFyZW50cywNCj4gQ0xLX1NFVF9SQVRFX1BBUkVOVCB8
IENMS19TRVRfUkFURV9OT19SRVBBUkVOVCwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAw
eDI4LCAxMiwgMHgxKTsgc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdA0KPiA+ICtjbGtfdmVfcGFy
ZW50c1tdID0geyJwbGxfdm9kbWEiLCAiY2xrX3N5c2giLCAicGxsX3ZlMSIsICJwbGxfdmUyIn07
DQo+ID4gK3N0YXRpYyBSVEtfQ0xLX1JFR01BUF9NVVgoY2xrX3ZlMSwgY2xrX3ZlX3BhcmVudHMs
DQo+IENMS19TRVRfUkFURV9QQVJFTlQgfCBDTEtfU0VUX1JBVEVfTk9fUkVQQVJFTlQsDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgMHg0YywgMCwgMHgzKTsgc3RhdGljDQo+ID4gK1JUS19D
TEtfUkVHTUFQX01VWChjbGtfdmUyLCBjbGtfdmVfcGFyZW50cywgQ0xLX1NFVF9SQVRFX1BBUkVO
VA0KPiB8IENMS19TRVRfUkFURV9OT19SRVBBUkVOVCwNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAweDRjLCAzLCAweDMpOyBzdGF0aWMNCj4gPiArUlRLX0NMS19SRUdNQVBfTVVYKGNsa192
ZTQsIGNsa192ZV9wYXJlbnRzLCBDTEtfU0VUX1JBVEVfUEFSRU5UDQo+IHwgQ0xLX1NFVF9SQVRF
X05PX1JFUEFSRU5ULA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIDB4NGMsIDYsIDB4Myk7
IHN0YXRpYw0KPiA+ICtSVEtfQ0xLX1JFR01BUF9HQVRFKGNsa19lbl9taXNjLCAiY2xrX3N5cyIs
IENMS19JU19DUklUSUNBTCwgMHg1MCwgMCwNCj4gPiArMSk7DQo+IA0KPiBZb3UgYXJlIHVzaW5n
IHRoZSB1c2luZyB0aGUgb2xkIGdsb2JhbCBuYW1lcyBidXQgdGhlcmUgZG9lcyBub3Qgc2VlbSB0
byBiZSBhDQo+IGdvb2QgcmVhc29uIGZvciB0aGlzLiBZb3VyIGRyaXZlciBpcyBlbnRpcmVseSBz
dGF0aWMgc28gdGhlIGh3IGFyZSBrbm93biBhdA0KPiBjb21waWxlIHRpbWUgYW5kIHlvdSBjYW4g
dXNlIHRoZW0uIFVzZSAucGFyZW50X2h3cyBvciBwYXJlbnRfZGF0YSB3aGVuDQo+IGFwcHJvcHJp
YXRlLiBOb3QgcGFyZW50X25hbWVzIHBsZWFzZS4NCg0KVGhhbmtzIGZvciB5b3VyIGFkdmljZS4N
Cg0KV2Ugd2lsbCByZW1vdmUgdGhlIG9sZCAnUlRLX0NMS19SRUdNQVBfR0FURSgpJyBhbmQgJ1JU
S19DTEtfUkVHTUFQX01VWCgpJw0KbWFjcm9zIGFuZCBpbnRyb2R1Y2UgbWFjcm9zLCB3aGljaCB1
c2UgJ0NMS19IV19JTklUX0hXKCknIHRvDQpkaXJlY3RseSByZWZlcmVuY2UgJy5wYXJlbnRfaHdz
JyBpbnN0ZWFkIG9mIHJlbHlpbmcgb24gc3RyaW5nIG5hbWVzLg0KDQpCZXN0IFJlZ2FyZHMsDQpZ
dS1DaHVuDQo+IA0KPiAtLQ0KPiBKZXJvbWUNCg==

