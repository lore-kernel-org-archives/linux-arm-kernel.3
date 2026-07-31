Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7518C55167
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 07:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dpAuLGDSZJturAo8ygRPYqJ9xibibf7Bd/SqwDGiaaw=; b=f88APmYH8VtO0YEYJnqIgAuO8F
	gDVPiJ7IKToeNbkcx2Oo+A0uGTMXM5Bty2lklMxhsSBZoQ+hhxiIjyFUkz83xB3+qtgToNuJzCnj2
	OtgF9/bBMdLDyhr1HL7Zn4psWQ01+Jqtjt5gfUatlD1htQU6TK8TkdGeakqEVHikEPf2cmFMZvl0t
	ofvDL4nT3EbHjv2dF75u283JEXD+Efkyea8AmPakGxE5Cw0GS0v3lyppqvJxKS16j6on1qZF9I6fI
	zqJ7IcneVyDBckthnZbkrefbLo4E8HYUcJaIvytgfhgbH0D7SShsaGkERvz5Rf0FUbvk8GVb/Ga+/
	tZ3MyKVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpi7K-0000000C0BN-1enC;
	Fri, 31 Jul 2026 07:57:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpi7J-0000000C0BB-08QC;
	Fri, 31 Jul 2026 07:57:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dpAuLGDSZJturAo8ygRPYqJ9xibibf7Bd/SqwDGiaaw=; b=arQDjNC3qIdV/6VWRkyohQZ7gF
	vrg77KJZ4LvElm49Tl8WUD7wuW62uRwKPvUwlnnLqvQ2Xv8MnX5sGkE9eOjk4GNF0x9bTiCSAvGbS
	xdUlWbbdi/SeeHIjcGdvwQRZO9wUYmEQYENsJa4QTMi6NsbUgvAqnbqfmFMZ1GRr4Y1BeqbdlSzyV
	Wtl1hU5l54qDdhSTafvw6uEtw0WBdIvEqCYVk5ztMg2AzioEN6BnnTeX29evqhT+jACwpw5+EOcNW
	yWGyTpQXoPHqtImnX8609b9N8N5Y1e7LeV98PTY5GO9SArZhUi+MR4mFGJyCQlMaJHub9ach2TYQ9
	yh5DCM/Q==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wpi7E-00000007IHB-0yXb;
	Fri, 31 Jul 2026 07:57:15 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66V7uScY51752431, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1785484588; bh=dpAuLGDSZJturAo8ygRPYqJ9xibibf7Bd/SqwDGiaaw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=wmRqjR0XKNMVoyhvCXY3hfXS94bgSGSLF2LwtXmTa+UYmj1CETi+omC+QjJ7MMK4/
	 6wpZpCjqpQYI+Zk72kMuv7zPfRLXZSBkN5CH56Pt/4he3191NKEtHsR/kXdcW7V4WI
	 CjonKPqsgeWLwzedJYlCqs7ocYadwB6zbw6VZ/2VTAcv+PPR/rvsoI5xwrv+gi4AZd
	 9VW8PxpC4z79JMsbx17cOH2dVA2+lVPMLBr//RBt7UiFSslu+tygt49xQHeBzyVRRf
	 9dVlk/sAtfxTzVXMCXeVu0q5XB24gApVsKQvXuwplvhoI88/rurBoAa3kdnkz8+ef5
	 6bYorTyQGh1Gg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66V7uScY51752431
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 Jul 2026 15:56:28 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 31 Jul 2026 15:56:28 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 31 Jul 2026 15:56:28 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Fri, 31 Jul 2026 15:56:28 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Brian Masney
	<bmasney@redhat.com>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?utf-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
	=?utf-8?B?SnlhbiBDaG91IFvlkajoirflrold?= <jyanchou@realtek.com>,
	"afaerber@suse.com" <afaerber@suse.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
	=?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
	=?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>
Subject: RE: [PATCH v11 01/11] dt-bindings: clock: Add Realtek RTD1625 Clock &
 Reset Controller
Thread-Topic: [PATCH v11 01/11] dt-bindings: clock: Add Realtek RTD1625 Clock
 & Reset Controller
Thread-Index: AQHdHp1OTHbsvktC/EW4g15O79pg0raFvauAgADk/4CAAKQq0A==
Date: Fri, 31 Jul 2026 07:56:28 +0000
Message-ID: <28ab6e21cba54e839595352e3e1f31c8@realtek.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-2-eleanor.lin@realtek.com>
 <amt7w327inR5rZrU@redhat.com>
 <d986debd-fc19-4e42-9470-79b0da2fcd2d@oss.qualcomm.com>
In-Reply-To: <d986debd-fc19-4e42-9470-79b0da2fcd2d@oss.qualcomm.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_085713_280046_27BC465A 
X-CRM114-Status: GOOD (  17.27  )
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

SGkgQnJpYW4gYW5kIEtyenlzenRvZg0KDQo+IE9uIDMwLzA3LzIwMjYgMTg6MjgsIEJyaWFuIE1h
c25leSB3cm90ZToNCj4gPiBIaSBZdS1DaHVuLA0KPiA+DQo+ID4gT24gVHVlLCBKdWwgMjgsIDIw
MjYgYXQgMTA6Mjc6NTZQTSArMDgwMCwgWXUtQ2h1biBMaW4gd3JvdGU6DQo+ID4+IGRpZmYgLS1n
aXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTIGluZGV4DQo+ID4+IDJmOTQ3MmMxYTA5MC4u
NjVkZDJiZTYzOTAzIDEwMDY0NA0KPiA+PiAtLS0gYS9NQUlOVEFJTkVSUw0KPiA+PiArKysgYi9N
QUlOVEFJTkVSUw0KPiA+PiBAQCAtMjI3NDEsNiArMjI3NDEsMTYgQEAgUzogIE1haW50YWluZWQN
Cj4gPj4gIEY6ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2RzYS9yZWFs
dGVrLnlhbWwNCj4gPj4gIEY6ICBkcml2ZXJzL25ldC9kc2EvcmVhbHRlay8qDQo+ID4+DQo+ID4+
ICtSRUFMVEVLIFNPQyBDTE9DSyBBTkQgUkVTRVQgRFJJVkVSUw0KPiA+PiArTTogIENoZW5nLVl1
IExlZSA8Y3lsZWUxMkByZWFsdGVrLmNvbT4NCj4gPj4gK006ICBZdS1DaHVuIExpbiA8ZWxlYW5v
ci5saW5AcmVhbHRlay5jb20+DQo+ID4+ICtMOiAgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcN
Cj4gPg0KPiA+IFlvdSBhZGQgZHJpdmVycyB0byB0aGlzIGxpc3QgbGF0ZXIgaW4gdGhlIHNlcmll
cy4NCj4gPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyBzaG91bGRuJ3QgYmUgbGlzdGVkIGhl
cmUgc28gdGhhdCB0aGUgbGlzdA0KPiA+IGlzIG5vdCBDQ2VkIGZvciBqdXN0IGRyaXZlciBjaGFu
Z2VzLiBJdCdsbCBnZXQgcGlja2VkIHVwIGlmIHNvbWVvbmUgaXMNCj4gPiBtYWtpbmcgY2hhbmdl
cyB0byB0aGUgZHQtYmluZGluZ3MgdmlhIHRoZSAiT1BFTiBGSVJNV0FSRSBBTkQNCj4gRkxBVFRF
TkVEDQo+ID4gREVWSUNFIFRSRUUgQklORElOR1MiIGVudHJ5Lg0KPiANCj4gQm90aCBsaXN0cyBz
aG91bGQgbm90IGJlIGxpc3RlZC4gQm90aCBhcmUgcG9pbnRsZXNzLCBidXQgb2YgY291cnNlIERU
IGxpc3QgaXMgcGxhaW4NCj4gd3JvbmcuDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRv
Zg0KDQpUaGFua3MgZm9yIGV4cGxhaW5pbmcuIFdpbGwgcmVtb3ZlIHRoZW0uDQoNCkJlc3QgcmVn
YXJkcywNCll1LUNodW4NCg==

