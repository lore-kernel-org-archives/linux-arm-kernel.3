Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81901E77170
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 02:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LnI0Na3/B3DR4dG1oO0Wy0h54NsiJph8a4Tm/NLGsLI=; b=Wcw9eRVMK7Cwsr6WWaFjhz6sgm
	DfThTRCHKhy4TPQDkt9INdnCLKsodtCVN5O1nqpRLibbDFPBxa2+f1kmRXLk8nVmIqSWB8EGbsT1n
	Gd8JOQJyb6rZTKv4Moc+5evonA5JxmXUn4HTnyao1HM+B7IeR+E4TOTZZXjk3CrvM3ItIKSiQCY0A
	mtUYOvxJQC82CYtMYT5qQn1NYE5q70lA4L4IIsEMi9UVi6Juo4BN23CjFlONCMXDOZdM7BcFApCFs
	5pNy1Q81duaOvvWl28pQ+3lsRvTsMzx58cRIlGkABne+j3DbelgkKLIK+J7prtsQbJglQ1S77ARwL
	cy0xRuWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJNxf-00000000JPO-02MO;
	Fri, 06 Dec 2024 02:20:55 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJNwc-00000000JGG-0p0F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 02:19:51 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-38-yTzVEjDMP82plyYRPmALzQ-1; Fri, 06 Dec 2024 02:19:43 +0000
X-MC-Unique: yTzVEjDMP82plyYRPmALzQ-1
X-Mimecast-MFC-AGG-ID: yTzVEjDMP82plyYRPmALzQ
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 6 Dec
 2024 02:18:59 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Fri, 6 Dec 2024 02:18:59 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Naresh Kamboju' <naresh.kamboju@linaro.org>, Dan Carpenter
	<dan.carpenter@linaro.org>
CC: open list <linux-kernel@vger.kernel.org>, "lkft-triage@lists.linaro.org"
	<lkft-triage@lists.linaro.org>, Linux Regressions
	<regressions@lists.linux.dev>, Linux ARM
	<linux-arm-kernel@lists.infradead.org>, "netfilter-devel@vger.kernel.org"
	<netfilter-devel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Anders
 Roxell" <anders.roxell@linaro.org>, Johannes Berg <johannes.berg@intel.com>,
	"toke@kernel.org" <toke@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
	"kernel@jfarr.cc" <kernel@jfarr.cc>, "kees@kernel.org" <kees@kernel.org>
Subject: RE: arm64: include/linux/compiler_types.h:542:38: error: call to
 '__compiletime_assert_1050' declared with attribute error: clamp() low limit
 min greater than high limit max_avail
Thread-Topic: arm64: include/linux/compiler_types.h:542:38: error: call to
 '__compiletime_assert_1050' declared with attribute error: clamp() low limit
 min greater than high limit max_avail
Thread-Index: AQHbR0VgROIHG94lCEKLQVwMYBVLZbLYdnCQ
Date: Fri, 6 Dec 2024 02:18:59 +0000
Message-ID: <bd95d7249ff94e31beb11b3f71a64e87@AcuMS.aculab.com>
References: <CA+G9fYsT34UkGFKxus63H6UVpYi5GRZkezT9MRLfAbM3f6ke0g@mail.gmail.com>
 <8dde5a62-4ce6-4954-86c9-54d961aed6df@stanley.mountain>
 <CA+G9fYv5gW1gByakU1yyQ__BoAKWkCcg=vGGyNep7+5p9_2uJA@mail.gmail.com>
In-Reply-To: <CA+G9fYv5gW1gByakU1yyQ__BoAKWkCcg=vGGyNep7+5p9_2uJA@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: S-5s6IZrKyazdhnRBgcoKxcTWtkk6GIsFPVBe7bTkUI_1733451582
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_181950_495953_4E2EE426 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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

RnJvbTogTmFyZXNoIEthbWJvanUNCj4gU2VudDogMDUgRGVjZW1iZXIgMjAyNCAxODo0Mg0KPiAN
Cj4gT24gVGh1LCA1IERlYyAyMDI0IGF0IDIwOjQ2LCBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVu
dGVyQGxpbmFyby5vcmc+IHdyb3RlOg0KPiA+DQo+ID4gQWRkIERhdmlkIHRvIHRoZSBDQyBsaXN0
Lg0KPiANCj4gQW5kZXJzIGJpc2VjdGVkIHRoaXMgcmVwb3J0ZWQgaXNzdWUgYW5kIGZvdW5kIHRo
ZSBmaXJzdCBiYWQgY29tbWl0IGFzLA0KPiANCj4gIyBmaXJzdCBiYWQgY29tbWl0Og0KPiAgIFtl
ZjMyYjkyYWM2MDViYTFiNzY5MjgyNzMzMGI5YzYwMjU5ZjBhZjQ5XQ0KPiAgIG1pbm1heC5oOiB1
c2UgQlVJTERfQlVHX09OX01TRygpIGZvciB0aGUgbG8gPCBoaSB0ZXN0IGluIGNsYW1wKCkNCg0K
VGhhdCAnanVzdCcgY2hhbmdlZCB0aGUgdGVzdCB0byB1c2UgX19idWlsdGluX2NvbnN0YW50X3Ao
KSBhbmQNCnRodXMgZ2V0cyBjaGVja2VkIGFmdGVyIHRoZSBvcHRpbWlzZXIgaGFzIHJ1bi4NCg0K
SSBjYW4gcGFyYXBocmFzZSB0aGUgY29kZSBhczoNCnVuc2lnbmVkIGludCBmbih1bnNpZ25lZCBp
bnQgeCkNCnsNCglyZXR1cm4gY2xhbXAoMTAsIDUsIHggPT0gMCA/IDAgOiB4IC0gMSk7DQp9DQp3
aGljaCBpcyBuZXZlciBhY3R1YWxseSBjYWxsZWQgd2l0aCB4IDw9IDUuDQpUaGUgY29tcGlsZXIg
Y29udmVydHMgaXQgdG86DQoJcmV0dXJuIHggPCAwID8gY2xhbXAoMTAsIDUsIDApIDogY2xhbXAo
MTAsIDUsIHgpOw0KKFByb2JhYmx5IGJlY2F1c2UgaXQgY2FuIHNlZSB0aGF0IGNsYW1wKDEwLCA1
LCAwKSBpcyBjb25zdGFudC4pDQpBbmQgdGhlbiB0aGUgY29tcGlsZS10aW1lIHNhbml0eSBjaGVj
ayBpbiBjbGFtcCgpIGZpcmVzLg0KDQpUaGUgb3JkZXIgb2YgdGhlIGFyZ3VtZW50cyB0byBjbGFt
cCBpcyBqdXN0IHdyb25nIQ0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2Vz
aWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVL
DQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K


