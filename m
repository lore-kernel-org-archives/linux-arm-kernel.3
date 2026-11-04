Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280A5606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 06:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fkbBjhRD;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=gwpKEAC5;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=m0Ql2Bhs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=W2+vG0KPIH8/bYQUlolzGe5acC3JyyLLgqwS1M/RQn4=; b=fkbBjhRDvW/r11V3HP3NyzkFVo
	CqVevN1inT3GVWa39gz99/G//MenpdYoWj9SdyhzfF36bIZot+6jTWK3qrMYNMBSb7twPkGJESi3j
	e6Z7umUVWkoEcOKjJjzHEl+W00+97HxlBMl+m3jTHCJC0BKinHGWlZp1y9pSZP/NoVaWfU1FruVhz
	qzRGQaxV5Ls6sEVzNm0AnxDB1YQRh4Sh+FyOAFtg0xeCynxmy/OyxpJ6mcUg2RcZBt7MfTqZOA6LT
	ZD5/hDieii+QLV2TrRVjsv7h97IhqTuPCP80BJL9+h5oz+7JtoY6bvwUCz9hZYx3yAalR4cPexm6Z
	oAd+3V+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUDh-00000004OZO-4C0X;
	Wed, 04 Nov 2026 06:11:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUDh-00000004OYw-0Ax9;
	Wed, 04 Nov 2026 06:11:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=W2+vG0KPIH8/bYQUlolzGe5acC3JyyLLgqwS1M/RQn4=; b=gwpKEAC5tMbyUDf6RooOVvPJ34
	BpsPOPKka/zw9eHxwET6wU/R7ban6fJu3AeZ1kVz7CopcoygLkN/lmpaQw2M+k1pxpQhYNh6iZt8h
	TcX3aduohnP1gCgfLaZYD5E64kC6LGrzF/46muumTWTEfdHOUCsac1pu3eDbiDceG845MSB1HQXKV
	y/n7vABp6Qu5wwqNtByH15XkI6NQOdNJphuPSLFON5wHinai9GxAcARTEHdTBY9B2NVN6IsXxh0gj
	vde3OyVjoWggujF6B0SIIICXc7yASPouvz/SJTatEMy4JAIflTy8KSvWLKkru0rdFDK9UlH8WAPjw
	cZ+naDgA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUDd-00000001Gfj-1sl1;
	Wed, 04 Nov 2026 06:11:35 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6A46BQKY03770829, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1793772686; bh=W2+vG0KPIH8/bYQUlolzGe5acC3JyyLLgqwS1M/RQn4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=m0Ql2BhsnzDwwls4B1Eq15/kvkhTwwutT3FeSAmm+SYqyQNIa+tvrPSRCOKc3Vga9
	 uT+fOdihro4+ZWuWvNEwmiHNEdxug2R0UHyZztB54BB0QI8Jr2UYmZErQ5Mt7b2mcO
	 pRs08leZmr8GW0KpMeuZjM2g9cnh1li9tXu2kqXLvm1iPabDvWRdOq/T/o/RVGg/Fw
	 kQtVrrVWxFQ/4ipL1/gf2w/HsEeGpJOT1hxEyifPeXSLBrpFrrcO/2gawOMa71ETCG
	 JCpAhrQNQOuxphUCoAcnHoWTC9H5+sWhW6WqYG48R5cUnER6ntS1w+lohqb1bdJQ5+
	 EMNsQ5IhtTejw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6A46BQKY03770829
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Nov 2026 14:11:26 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 14:11:26 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 14:06:26 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Wed, 4 Nov 2026 14:06:24 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Lee Jones <lee@kernel.org>, =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?=
	<james.tai@realtek.com>, =?utf-8?B?QW5kcmVhcyBGw6RyYmVy?=
	<afaerber@suse.com>, Linus Walleij <linusw@kernel.org>,
	=?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH 06/10] pinctrl: realtek: Fix bit shift when configuring
 RTD_HIGH_VIL
Thread-Topic: [PATCH 06/10] pinctrl: realtek: Fix bit shift when configuring
 RTD_HIGH_VIL
Thread-Index: AQHda9qcs5VNo2mdPkWfhFNS4aI0ubcdbUDg
Date: Wed, 4 Nov 2026 06:06:24 +0000
Message-ID: <e7944214d9394aaf80d64c7e394f0232@realtek.com>
References: <20261103213002.1673560-1-lee@kernel.org>
 <20261103213002.1673560-7-lee@kernel.org>
In-Reply-To: <20261103213002.1673560-7-lee@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_061134_134991_407BB52E 
X-CRM114-Status: GOOD (  17.16  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PiBJbiBydGRfcGNvbmZfcGFyc2VfY29uZigpLCB0aGUgUlREX0hJR0hfVklMIGNhc2UgcHJlcGFy
ZXMgbWFzayBhcw0KPiBCSVQoaHZpbF9vZmYpIGZvciByZWdtYXBfdXBkYXRlX2JpdHMoKSwgYnV0
IHNldHMgdmFsID0gMSB3aXRob3V0IHNoaWZ0aW5nIGl0IHRvDQo+IGh2aWxfb2ZmLiAgV2hlbmV2
ZXIgaHZpbF9vZmYgaXMgbm9uLXplcm8sDQo+IHJlZ21hcF91cGRhdGVfYml0cygpIG1hc2tzIHZh
bCB3aXRoIEJJVChodmlsX29mZikgYW5kIGNsZWFycyB0aGUgaGlnaCBWSUwgYml0DQo+IGluc3Rl
YWQgb2Ygc2V0dGluZyBpdC4NCj4gDQo+IFNldCB2YWwgdG8gQklUKGh2aWxfb2ZmKSBzbyB0aGF0
IHRoZSB0YXJnZXQgYml0IGlzIHNldCBhcyBpbnRlbmRlZC4NCj4gDQo+IEZpeGVzOiBkY2M5MzM0
NDM1YjAgKCJwaW5jdHJsOiByZWFsdGVrOiBhZGQgc3VwcG9ydCBmb3Igc2xldyByYXRlLCBpbnB1
dCB2b2x0YWdlDQo+IGFuZCBoaWdoIFZJTCIpDQo+IENsb3NlczoNCj4gaHR0cHM6Ly9zYXNoaWtv
LmRldi8jL2J1Zy9saW51eC1lNzA3NzMxMS0zZjMwLTRiNzctODQ0Yi0xNDQ3NTE5ZDBjODQNCj4g
Q2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxs
ZWVAa2VybmVsLm9yZz4NCg0KUmV2aWV3ZWQtYnk6IFl1LUNodW4gTGluIDxlbGVhbm9yLmxpbkBy
ZWFsdGVrLmNvbT4NCg0KPiAtLS0NCj4gIGRyaXZlcnMvcGluY3RybC9yZWFsdGVrL3BpbmN0cmwt
cnRkLmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvcmVhbHRlay9waW5jdHJs
LXJ0ZC5jDQo+IGIvZHJpdmVycy9waW5jdHJsL3JlYWx0ZWsvcGluY3RybC1ydGQuYw0KPiBpbmRl
eCAyYjg3NzA5OWVjODUuLjcyNzczNjAwMzAzYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9waW5j
dHJsL3JlYWx0ZWsvcGluY3RybC1ydGQuYw0KPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvcmVhbHRl
ay9waW5jdHJsLXJ0ZC5jDQo+IEBAIC00NzMsNyArNDczLDcgQEAgc3RhdGljIGludCBydGRfcGNv
bmZfcGFyc2VfY29uZihzdHJ1Y3QgcnRkX3BpbmN0cmwNCj4gKmRhdGEsDQo+ICAgICAgICAgICAg
ICAgICBodmlsX29mZiA9IGNvbmZpZ19kZXNjLT5iYXNlX2JpdCArDQo+IGNvbmZpZ19kZXNjLT5o
dmlsX29mZnNldDsNCj4gICAgICAgICAgICAgICAgIHJlZ19vZmYgPSBjb25maWdfZGVzYy0+cmVn
X29mZnNldDsNCj4gICAgICAgICAgICAgICAgIG1hc2sgPSBCSVQoaHZpbF9vZmYpOw0KPiAtICAg
ICAgICAgICAgICAgdmFsID0gMTsNCj4gKyAgICAgICAgICAgICAgIHZhbCA9IEJJVChodmlsX29m
Zik7DQo+ICAgICAgICAgICAgICAgICBicmVhazsNCj4gDQo+ICAgICAgICAgY2FzZSBSVERfRFJJ
VkVfU1RSRU5HVEhfUDoNCj4gLS0NCj4gMi41Ni4wLjM4NS5nYWM2NzFjODE5YS1nb29nDQo=

