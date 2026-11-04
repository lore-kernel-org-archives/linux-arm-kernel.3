Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D045B606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 06:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hG9ACen9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=lNCugGkw;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=syA0olUt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3fqzlNIFl8e4DD3QtzcILKzoArZsVTIXy2/zJtbpfhQ=; b=hG9ACen9JOZQmiT75LhwepQw7o
	1ysZSzYbk3cKCcR1ZXdJ6YnJPded2QmbrowiuDXLNM5HDW1y3lQVhVRlFW346sZbVd2PQEwkfC6F1
	AYkyXAxNXovQFedDnz2Uu0qFRasw5MfVfab8gPatm4DLA+ZjLIKQH1Pue5tuRoqDcaLcXPad0L6d9
	fVLTcxjBFC36eTnRliUwL/0cM8qd+s0YyWgJK+6eONENd6JviRm9YUdCM/D/q/cZnDdaBlwC9HVUg
	t6kaZCMLsOLigAsnjd0ROJYV6oCodwF/HlPOaqgpdyf5BNOCxpzAyFb1EnNPIUC3lTmaayVBWkNoM
	3cluCGRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUC2-00000004OKE-1QNf;
	Wed, 04 Nov 2026 06:09:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUC0-00000004OJr-03PX;
	Wed, 04 Nov 2026 06:09:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3fqzlNIFl8e4DD3QtzcILKzoArZsVTIXy2/zJtbpfhQ=; b=lNCugGkwm97rYewmbHzbI14TLb
	mP5t3v+q+EIQS5bgGCEls9vp3ouwO2gqHhV8/LojOk7o/YP19QhijZQ9z/YRj5b2HECEUOV81SuOu
	C3MGSsPyWdwSHunn9MX8q32VDYybCijNgwxuMx4eqZat2M7J0Ci3k3a9uhYtHpNLnXpaUllpvI3G4
	P3UUjAtK5P9+M4bg+hXrLsZuLP/CyjIUjTVuOXLHwFcrFRg506aPlYlX4/qNdCrW6xv8Pu0DpvtQN
	rdTmjSZFxVKdPVDv5T8LUYdI1vk3L81NzioOPwdzac5o8PPEvXi3zeEl4rSx0JAaVkCsFQ1Xdu4IO
	imPMnlBA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUBv-00000001Gd0-1M39;
	Wed, 04 Nov 2026 06:09:49 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6A469emqE3770355, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1793772581; bh=3fqzlNIFl8e4DD3QtzcILKzoArZsVTIXy2/zJtbpfhQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=syA0olUtRopOrCl99dTF+P775+b1CzutFgC3AdUUob+BuiinQgHi5DBZglHw30QcS
	 FXRmoSmNod9qmUlcKeQGeO99h730+W86YLgarMKGVijCJyf6zofU3OhEFrrBJjWfYT
	 MdEUBMLnWgO1VomilqX9yj8bD5YxWhILWfcq37DNPWE7eknuSBDUVz3ZawF+brFgS7
	 w65XvgGRtRa0DvchAQ2cyqhD2mDkXpFAvWW6HdqLMljedAABvhIky10TlTtnXpvJvi
	 l8RC+XuGzuSaccP+cJj2eFQjY8jx84PpnGRo5OuTH7nSXgT22gFjhU3/uWxCT9UFzZ
	 uGmTWMMAFv6Pw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6A469emqE3770355
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Nov 2026 14:09:41 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 14:09:41 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 14:04:40 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Wed, 4 Nov 2026 14:04:40 +0800
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
Subject: RE: [PATCH 05/10] pinctrl: realtek: Prevent out-of-bounds access in
 rtd_pinctrl_find_config()
Thread-Topic: [PATCH 05/10] pinctrl: realtek: Prevent out-of-bounds access in
 rtd_pinctrl_find_config()
Thread-Index: AQHda9qYNWUoySvnvUSqlcQwwTjBP7cdbH4A
Date: Wed, 4 Nov 2026 06:04:39 +0000
Message-ID: <efec48c734f44016829a43d4e068794a@realtek.com>
References: <20261103213002.1673560-1-lee@kernel.org>
 <20261103213002.1673560-6-lee@kernel.org>
In-Reply-To: <20261103213002.1673560-6-lee@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_060948_034843_909007D9 
X-CRM114-Status: GOOD (  16.46  )
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

PiBTZXZlcmFsIFJlYWx0ZWsgU29DIHBpbiBjb25maWd1cmF0aW9uIHRhYmxlcyAoc3VjaCBhcyBy
dGQxMzE5ZF9pc29fY29uZmlncywNCj4gcnRkMTYxOWJfaXNvX2NvbmZpZ3MsIGFuZCB0aGUgcnRk
MTYyNSBjb25maWcgdGFibGVzKSBvbWl0IHRyYWlsaW5nIHBpbnMgdGhhdCBkbw0KPiBub3Qgc3Vw
cG9ydCBwaW4gY29uZmlndXJhdGlvbiwgbWFraW5nIGRhdGEtPmluZm8tPm51bV9jb25maWdzIHNt
YWxsZXIgdGhhbg0KPiBkYXRhLT5pbmZvLT5udW1fcGlucy4gIEJlY2F1c2UgcnRkX3BpbmN0cmxf
ZmluZF9jb25maWcoKSBpbmRleGVzDQo+IGRhdGEtPmluZm8tPmNvbmZpZ3NbcGluXSB3aXRob3V0
IGNoZWNraW5nIGRhdGEtPmluZm8tPm51bV9jb25maWdzLCByZXF1ZXN0aW5nDQo+IHBpbiBjb25m
aWd1cmF0aW9uIG9uIGEgdHJhaWxpbmcgcGluIHJlYWRzIG91dC1vZi1ib3VuZHMgbWVtb3J5Lg0K
PiANCj4gQ2hlY2sgdGhhdCBwaW4gaXMgbGVzcyB0aGFuIGRhdGEtPmluZm8tPm51bV9jb25maWdz
IGJlZm9yZSBpbmRleGluZw0KPiBkYXRhLT5pbmZvLT5jb25maWdzW10uDQo+IA0KPiBGaXhlczog
ZTk5Y2U3ODAzMGRiICgicGluY3RybDogcmVhbHRlazogQWRkIGNvbW1vbiBwaW5jdHJsIGRyaXZl
ciBmb3IgUmVhbHRlaw0KPiBESEMgUlREIFNvQ3MiKQ0KPiBDbG9zZXM6DQo+IGh0dHBzOi8vc2Fz
aGlrby5kZXYvIy9idWcvbGludXgtNjBlMTM3NjEtZmQ5ZS00ZmQzLTgyNmEtNDczNDRmMzZkNGZh
DQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25l
cyA8bGVlQGtlcm5lbC5vcmc+DQoNClJldmlld2VkLWJ5OiBZdS1DaHVuIExpbiA8ZWxlYW5vci5s
aW5AcmVhbHRlay5jb20+DQoNCj4gLS0tDQo+ICBkcml2ZXJzL3BpbmN0cmwvcmVhbHRlay9waW5j
dHJsLXJ0ZC5jIHwgMyArKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvcmVhbHRlay9waW5jdHJsLXJ0ZC5jDQo+
IGIvZHJpdmVycy9waW5jdHJsL3JlYWx0ZWsvcGluY3RybC1ydGQuYw0KPiBpbmRleCA2MDIyMjMz
OTcyNmIuLjJiODc3MDk5ZWM4NSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9waW5jdHJsL3JlYWx0
ZWsvcGluY3RybC1ydGQuYw0KPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvcmVhbHRlay9waW5jdHJs
LXJ0ZC5jDQo+IEBAIC0yNTIsNiArMjUyLDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwaW5jdHJs
X3Bpbl9kZXNjICBzdGF0aWMgY29uc3Qgc3RydWN0DQo+IHJ0ZF9waW5fY29uZmlnX2Rlc2MNCj4g
ICAgICAgICAqcnRkX3BpbmN0cmxfZmluZF9jb25maWcoc3RydWN0IHJ0ZF9waW5jdHJsICpkYXRh
LCB1bnNpZ25lZCBpbnQgcGluKQ0KPiB7DQo+ICsgICAgICAgaWYgKHBpbiA+PSBkYXRhLT5pbmZv
LT5udW1fY29uZmlncykNCj4gKyAgICAgICAgICAgICAgIHJldHVybiBOVUxMOw0KPiArDQo+ICAg
ICAgICAgaWYgKGRhdGEtPmluZm8tPmNvbmZpZ3NbcGluXS5uYW1lKQ0KPiAgICAgICAgICAgICAg
ICAgcmV0dXJuICZkYXRhLT5pbmZvLT5jb25maWdzW3Bpbl07DQo+IA0KPiAtLQ0KPiAyLjU2LjAu
Mzg1LmdhYzY3MWM4MTlhLWdvb2cNCg==

