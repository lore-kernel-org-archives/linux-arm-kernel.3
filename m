Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67664606A328
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 12:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VFWOAaeg;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=dEc5s60p;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=OlkHrWYX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=C66MeL5Q72nkzcx+0R2uKtwGLPP0+lTOxNnY0g90WzQ=; b=VFWOAaegO340zqAjGh/ykoWJnN
	3LoUDvxFrj/1Ac193YxKD8+q3Jq4d3ycRS+VUGOMrNQOHTiy22F2K/bQXC5H+uUDLwKQD5yFLG7Ru
	dZ8x17TcSObuAHMMWAFmxD94t92KJwAEi2KLVW+q2vmT5gL4PUWdbopbJ4P15OuwmgW73DnHERyiR
	7FnpJclHy0S1udoB2BFecwzCxon05MHrgQd9+e8R/50VOyv6QPsKO6AJoQGnxpywmQ6b/wo5amJu2
	PSDNA8xgkPVWFJ7i4BXEj7ZYVmHFR2qB+eZs8qRsHinRl9b8SbH75/ULSwh+skVFYzB8C374jV/dS
	GHtQuvsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODok-00000002P5G-29su;
	Tue, 03 Nov 2026 12:40:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODog-00000002P4y-2331;
	Tue, 03 Nov 2026 12:40:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=C66MeL5Q72nkzcx+0R2uKtwGLPP0+lTOxNnY0g90WzQ=; b=dEc5s60pmyAqn46bhZehBlScx9
	BJ3uSyLIkCFjsG410l+4sLva6ADCFaNPkffdKH6OSpNZlpHxOzDtXA9c3n/7YuJhE/M8rPYLniVtt
	5vxOIYnnQn1s8kPn2qPSdb8Lh9AWjl3YhoHmXOiWOsn4BoWV9QvmqLCxpnXPiV33BCLXVgNcENIok
	K/RI4Ho2O9JhwXCBEDkckLvLzdIbFrchzOufFn35Gpct8u3qhDu4qIxNbPt5EeE+WH9x1B4I7kf0u
	R321AGH3aU2NZ5eMV/KiuSfgZ57FsTtAkdwHbWIPCEAhN3c78OYooMa+sPwzBzPerIwvXZDOE/b2v
	Ywef45YQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODob-00000000Rzz-1XN6;
	Tue, 03 Nov 2026 12:40:40 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6A3Ce2q053039991, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1793709602; bh=C66MeL5Q72nkzcx+0R2uKtwGLPP0+lTOxNnY0g90WzQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=OlkHrWYXoNUxtvEqclrNdjw3nDnH5u1ajBuadRUSsGWCrZ0czt+C+bpTzGY41MV2A
	 ndBY4jdcNBb/ADzjH85QmCk3LJCOKk/ndJsiD/ki10jNfdRAyHCewZWyqKn6HHD7tj
	 31HAP4lUBlROFwwEPPamqQjRls+i5/HOc0DLgEzZ/R3/doHJXozzo813ysRm0CdNYY
	 +movWpN9VliMeZr1D5S+VpQ+VfFVURd6wVct/FLEdv2Xf8pIMoL7rhtLwEAgv2hL9g
	 wpd28dNsTAuR3YZg34AoWTF9s85PDSsgYbBiouyRYRgf2ytTcmIKj9if2uzpJShKfF
	 HPBrh0KGkewsQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6A3Ce2q053039991
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Nov 2026 20:40:02 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 20:40:03 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 20:40:02 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Tue, 3 Nov 2026 20:40:02 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>, Linus Walleij <linusw@kernel.org>
CC: =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
	=?utf-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] pinctrl: realtek: Write the encoded slew rate value
Thread-Topic: [PATCH] pinctrl: realtek: Write the encoded slew rate value
Thread-Index: AQHdaRBfL8CcACdIrkWn/iKOgGQaurccSaPA
Date: Tue, 3 Nov 2026 12:40:02 +0000
Message-ID: <727f8462393544b1bb2a816069f16b4e@realtek.com>
References: <20261031081804.218566-1-pocj8ur4in@gmail.com>
In-Reply-To: <20261031081804.218566-1-pocj8ur4in@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_124037_865958_F99B1021 
X-CRM114-Status: GOOD (  17.26  )
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

PiBydGRfcGNvbmZfcGFyc2VfY29uZigpIG1hcHMgc2xldy1yYXRlIGFyZ3VtZW50cyAxLCAxMCwg
MjAgYW5kIDMwIHRvIHRoZQ0KPiB0d28tYml0IGZpZWxkIHZhbHVlcyAwLCAxLCAyIGFuZCAzLiBI
b3dldmVyLCBpdCBzaGlmdHMgdGhlIG9yaWdpbmFsIGFyZ3VtZW50IGludG8NCj4gdGhlIHJlZ2lz
dGVyIHZhbHVlIGluc3RlYWQgb2YgdXNpbmcgdGhlIGNvbXB1dGVkIGVuY29kaW5nLg0KPiBBZnRl
ciBtYXNraW5nLCB0aGVzZSBhcmd1bWVudHMgd3JpdGUgMSwgMiwgMCBhbmQgMiByZXNwZWN0aXZl
bHkuIEluIHBhcnRpY3VsYXIsDQo+IHRoZSBkaXN0aW5jdCAxMCBhbmQgMzAgc2V0dGluZ3Mgd3Jp
dGUgdGhlIHNhbWUgZmllbGQgdmFsdWUuDQo+IA0KPiBVc2Ugc2V0X3ZhbCB3aGVuIGNvbnN0cnVj
dGluZyB0aGUgcmVnaXN0ZXIgdmFsdWUgc28gdGhhdCBib3RoIGluZGl2aWR1YWwgcGluDQo+IGFu
ZCBncm91cCBjb25maWd1cmF0aW9uIGFwcGx5IHRoZSBleGlzdGluZyBjb252ZXJzaW9uLiBMZWF2
ZSBhcmd1bWVudA0KPiB2YWxpZGF0aW9uLCBmaWVsZCBvZmZzZXRzLCBtYXNrcyBhbmQgcmVnbWFw
IGVycm9yIGhhbmRsaW5nIHVuY2hhbmdlZC4NCj4gDQo+IEZpeGVzOiBkY2M5MzM0NDM1YjAgKCJw
aW5jdHJsOiByZWFsdGVrOiBhZGQgc3VwcG9ydCBmb3Igc2xldyByYXRlLCBpbnB1dCB2b2x0YWdl
DQo+IGFuZCBoaWdoIFZJTCIpDQo+IFNpZ25lZC1vZmYtYnk6IEJhZWsgS3l1LCBLaW0gPHBvY2o4
dXI0aW5AZ21haWwuY29tPg0KDQpSZXZpZXdlZC1ieTogWXUtQ2h1biBMaW4gPGVsZWFub3IubGlu
QHJlYWx0ZWsuY29tPg0KVGVzdGVkLWJ5OiBZdS1DaHVuIExpbiA8ZWxlYW5vci5saW5AcmVhbHRl
ay5jb20+DQoNClRoYW5rcyENCll1LUNodW4NCg0KPiAtLS0NCj4gQW4gYXJtNjQgUUVNVSBrZXJu
ZWwgZXhlcmNpc2VkIHRoZSBSVEQxNjI1IE1BSU4yIHBpbiBhbmQgZ3JvdXANCj4gc3RhdGUtc2Vs
ZWN0aW9uIHBhdGhzIHVzaW5nIHRoZSByZWFsIHBpbmN0cmwgY2FsbGJhY2tzIGFuZCBhIHN5bnRo
ZXRpYyByZWdtYXANCj4gYmFja2VuZC4gQSBzbGV3LXJhdGUgcmVxdWVzdCBvZiAxMCB3cm90ZSBm
aWVsZCB2YWx1ZSAyIGJlZm9yZSB0aGUgY2hhbmdlIGFuZCAxDQo+IGFmdGVyIGl0LCB3aGlsZSBh
ZGphY2VudCBiaXRzIHdlcmUgcHJlc2VydmVkLiBObyBib2FyZCBkZXZpY2UgdHJlZSwgcGh5c2lj
YWwNCj4gTU1JTyBvciBzaWduYWwgdGltaW5nIHdhcyB0ZXN0ZWQuDQo+IA0KPiAgZHJpdmVycy9w
aW5jdHJsL3JlYWx0ZWsvcGluY3RybC1ydGQuYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
cGluY3RybC9yZWFsdGVrL3BpbmN0cmwtcnRkLmMNCj4gYi9kcml2ZXJzL3BpbmN0cmwvcmVhbHRl
ay9waW5jdHJsLXJ0ZC5jDQo+IGluZGV4IDYwMjIyMzM5NzI2YjQuLjY1NmMyODFjNTU3YWMgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9yZWFsdGVrL3BpbmN0cmwtcnRkLmMNCj4gKysr
IGIvZHJpdmVycy9waW5jdHJsL3JlYWx0ZWsvcGluY3RybC1ydGQuYw0KPiBAQCAtNDM4LDcgKzQz
OCw3IEBAIHN0YXRpYyBpbnQgcnRkX3Bjb25mX3BhcnNlX2NvbmYoc3RydWN0IHJ0ZF9waW5jdHJs
DQo+ICpkYXRhLA0KPiAgICAgICAgICAgICAgICAgc3Jfb2ZmID0gY29uZmlnX2Rlc2MtPmJhc2Vf
Yml0ICsNCj4gY29uZmlnX2Rlc2MtPnNsZXdfcmF0ZV9vZmZzZXQ7DQo+ICAgICAgICAgICAgICAg
ICByZWdfb2ZmID0gY29uZmlnX2Rlc2MtPnJlZ19vZmZzZXQ7DQo+ICAgICAgICAgICAgICAgICBt
YXNrID0gMHgzIDw8IHNyX29mZjsNCj4gLSAgICAgICAgICAgICAgIHZhbCA9IGFyZyA8PCBzcl9v
ZmY7DQo+ICsgICAgICAgICAgICAgICB2YWwgPSBzZXRfdmFsIDw8IHNyX29mZjsNCj4gICAgICAg
ICAgICAgICAgIGJyZWFrOw0KPiANCj4gICAgICAgICBjYXNlIFBJTl9DT05GSUdfSU5QVVRfVk9M
VEFHRV9VVjoNCj4gLS0NCj4gMi41NS4wDQoNCg==

