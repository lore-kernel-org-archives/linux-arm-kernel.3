Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED65606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 02:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jTnDRNwv;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=TEUYK8JJ;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=VJ0opFGf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WWrBPkeC4TvVvs6w11n3c6Qn5dT9hgJIXbxG1uIC660=; b=jTnDRNwvAf9fKk6hFayKBaNAOt
	PZZb/JSAw70HsBkZQc2LAfV2aMAx+d9zy+rQhSFNAzTgNv0STGhPYppLgWM39gxEi3adl62U/E8Jn
	D6YClIRaZZOcynXe6Snaqv4114G/Px965qFOhoAYrD9qD8yYt7qz9Yp+4bohtp2BaZORzqQKd4Acr
	2PTqW+zY0rzJZaShsHTwU/+SNzfHenT89gVH3U2nA0RdcJx23iXBaY5Sxshx0rZSvBnE2aafMYWYS
	26tN0dII85UiOsuxK2aOjA6s+or7SRoQ6hi37J1CkPJhZ4kX3NBc49AyeM9RX8nXDRsXhBWfc+H2q
	oS2v6Whw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPA21-0000000B7DS-3Kfp;
	Fri, 06 Nov 2026 02:50:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPA20-0000000B7DC-0GtN;
	Fri, 06 Nov 2026 02:50:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WWrBPkeC4TvVvs6w11n3c6Qn5dT9hgJIXbxG1uIC660=; b=TEUYK8JJl3KKyYKJb4WopaWK5A
	fiPzLdAvhpB0xHNhVj16aAXWLpWVLVgOaK/+RlLTKkJnJ4JpepoJ3iZJtO1hJVnY1hLiqxhh2kMbJ
	oUNhT2UexR1PT4qbVa6XIzHh/9p/r2lne+y257Oo5+6iZC5+4TCekviNoKHTKk+pvOD5eCALrpk5g
	SvDcWwIeGw4khGP4VPk39O/6cP+KIcKzEm0Q2iHIqL+rzvgSyZWfDceEA7ogQX4MIlwfWr6ml2uhD
	oBKuWtdNKdAfonssKblKfTYI3VLjHRJDS5pQt48hD0wzOsGT9cV/i0QtD43X6PBWlkpZlthDu5HSO
	sBdh7bYw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPA1w-00000003lqb-199A;
	Fri, 06 Nov 2026 02:50:19 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6A62njXG31267802, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1793933385; bh=WWrBPkeC4TvVvs6w11n3c6Qn5dT9hgJIXbxG1uIC660=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=VJ0opFGfYol8UEOicELHeNyNa5LmZcIvkPryunCBAwpKJqnS0P2wKTKB99aFuSsEi
	 TyDiD51TolTFWHb8LzUbz2GNA627q/zQLE/LqNRKTXLzTRWvztFEaqGwFr/CbykZay
	 e8Dr3vHr2fODEoFKWmMyslG0b/hNfHMUg99COjKb9T3b5aEh7HxIVkV0xOxKW3QCWk
	 kplqUQA0V4ChAodvpVlze5FDX+hLGE6Yr5VY4cWMfDVYVXQnoLC8N37lAp2ksK1IKp
	 C7qUMPWargvCrQh977PfRfWHU1vl39rzNelNbXI1dk9mRoIv++ibLH65izNdxBvwau
	 rDdO7Ql34H03w==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6A62njXG31267802
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 6 Nov 2026 10:49:45 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 10:49:45 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 10:49:44 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Fri, 6 Nov 2026 10:49:44 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Linus Walleij <linusw@kernel.org>, Lee Jones <lee@kernel.org>
CC: =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
	=?utf-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.com>,
	=?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: RE: [PATCH 07/10] pinctrl: realtek: Initialise omitted offset fields
 to NA in config macros
Thread-Topic: [PATCH 07/10] pinctrl: realtek: Initialise omitted offset fields
 to NA in config macros
Thread-Index: AQHda9qgbhIxCAk+mka0RzFPD9N5YrcesHKAgAGqjsA=
Date: Fri, 6 Nov 2026 02:49:43 +0000
Message-ID: <5c414196f5e34bfeb7a94714e5542a72@realtek.com>
References: <20261103213002.1673560-1-lee@kernel.org>
 <20261103213002.1673560-8-lee@kernel.org>
 <CAD++jLmF0U6ehFSuauqKDQiZRkuUnqpbZd--v2aqF2YZQF=HwA@mail.gmail.com>
In-Reply-To: <CAD++jLmF0U6ehFSuauqKDQiZRkuUnqpbZd--v2aqF2YZQF=HwA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_025016_885273_599F0374 
X-CRM114-Status: GOOD (  15.45  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DQo+IE9uIFR1ZSwgTm92IDMsIDIwMjYgYXQgMTA6MzHigK9QTSBMZWUgSm9uZXMgPGxlZUBrZXJu
ZWwub3JnPiB3cm90ZToNCj4gDQo+ID4gVGhlIFJlYWx0ZWsgcGluY3RybCBkcml2ZXIgdXNlcyBO
QSAoMHhmZmZmZmZmZikgYXMgdGhlIHNlbnRpbmVsIGZvcg0KPiA+IHVuc3VwcG9ydGVkIHBpbiBj
b25maWd1cmF0aW9uIGZlYXR1cmVzLiAgSG93ZXZlciwgUlRLX1BJTl9DT05GSUcgb21pdHMNCj4g
PiBpbnB1dF92b2x0X29mZnNldCwgc2xld19yYXRlX29mZnNldCwgYW5kIGh2aWxfb2Zmc2V0LCBh
bmQNCj4gPiBSVEtfUElOX0NPTkZJR19WMiBvbWl0cyBzbGV3X3JhdGVfb2Zmc2V0IGFuZCBodmls
X29mZnNldC4gIEJlY2F1c2UgQzk5DQo+ID4gZGVzaWduYXRlZCBpbml0aWFsaXNlcnMgemVyby1p
bml0aWFsaXNlIG9taXR0ZWQgbWVtYmVycywgdGhvc2UgZmllbGRzDQo+ID4gZGVmYXVsdCB0byAw
IGluc3RlYWQgb2YgTkEsIGNhdXNpbmcgcnRkX3Bjb25mX3BhcnNlX2NvbmYoKSB0byB0cmVhdA0K
PiA+IHVuc3VwcG9ydGVkIGZlYXR1cmVzIGFzIHZhbGlkIGF0IGJpdCBvZmZzZXQgYmFzZV9iaXQg
KyAwIGFuZCBjb3JydXB0DQo+ID4gYWRqYWNlbnQgcmVnaXN0ZXIgYml0cy4NCj4gPg0KPiA+IEV4
cGxpY2l0bHkgaW5pdGlhbGlzZSB0aGUgb21pdHRlZCBvZmZzZXQgZmllbGRzIHRvIE5BIGluDQo+
ID4gUlRLX1BJTl9DT05GSUcgYW5kIFJUS19QSU5fQ09ORklHX1YyLg0KPiA+DQo+ID4gRml4ZXM6
IGRjYzkzMzQ0MzViMCAoInBpbmN0cmw6IHJlYWx0ZWs6IGFkZCBzdXBwb3J0IGZvciBzbGV3IHJh
dGUsDQo+ID4gaW5wdXQgdm9sdGFnZSBhbmQgaGlnaCBWSUwiKQ0KPiA+IEZpeGVzOiBlMzA5ZGJk
NTIzYjggKCJwaW5jdHJsOiByZWFsdGVrOiBhZGQgcnRkMTYyNSBwaW5jdHJsIGRyaXZlciIpDQo+
ID4gQ2xvc2VzOg0KPiA+IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9idWcvbGludXgtZmJkMGJmNTQt
NmRiYS00NjUyLTk0MTgtMjcwYjExZmI2ZDhiDQo+ID4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmcNCj4gPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZUBrZXJuZWwub3JnPg0KPiANCj4g
VGhpcyBwYXRjaCA3LzEwIGFwcGxpZWQgdG8gdGhlIHBpbmN0cmwgdHJlZSBmb3IgZml4ZXMuDQo+
IA0KPiBZb3VycywNCj4gTGludXMgV2FsbGVpag0KDQpIaSBMaW51cywNCg0KVGhhbmtzIGZvciBh
cHBseWluZyB0aGlzIHBhdGNoLiBKdXN0IGEgcXVpY2sgaGVhZHMtdXAgb24gdGhlIG1lcmdlZCBj
b21taXQgWzFdOg0KDQoxLiBUaGUgZmlyc3QgRml4ZXMgdGFnIGtlcHQgdGhlIG9yaWdpbmFsICdk
Y2M5MzM0NDM1YjAnIGluc3RlYWQgb2YgdGhlIGNvcnJlY3RlZA0KJ2U5OWNlNzgwMzBkYicgSSBz
dWdnZXN0ZWQuDQoyLiBCcmFuY2g6IEl0IHdhcyBhcHBsaWVkIHRvICdmb3ItbmV4dCcgaW5zdGVh
ZCBvZiAnZml4ZXMnLiBKdXN0IGNoZWNraW5nIGlmDQp0aGlzIHdhcyBpbnRlbmRlZC4NCg0KWzFd
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2xpbnVzdy9s
aW51eC1waW5jdHJsLmdpdC9jb21taXQvP2g9Zm9yLW5leHQmaWQ9MGU2MmE2YWFkZWY1YmY5M2Ez
NzlhYzdhYTlhODlmNDM1OTZmODNlNA0KDQpCZXN0IHJlZ2FyZHMsDQpZdS1DaHVuDQo=

