Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A87D35176
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 11:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Du2sSK+w7A138RXer2hE9EYVOnPw5AIHeHoZShzeyJM=; b=v0ZMS4w42H1zKc3JcZGnhHbjTH
	mE/3JotDurr4qplRL4sb54DjMtKLGZHTHrtYeSXLo5cOWUDuh/LYeBBAdVoJu7qCTHPLxm006x42J
	xDSf/Tgcj0LfE2Jot9t0PRtj0wY8hi8EA2KnQ4/OubCb8iXin3B1Fy4YpRclkM8nPCNBytmfu5WmW
	bPTg8d1ePWLKLkYiem0t3Qv+VNDkgmKKiw9r2y5ihLsiTnqXQ/niXvxhCwUpIsa82pxzcZV/RvHKa
	p1BnQ02LtVvMwgxYKZUT4nqFzUCIwDhHjzJzMMJW0kteWF3MIULoI0iEACQChmTSZhQlBopjT02W3
	J24Oq+9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tVf-0000000EbUY-33cY;
	Wed, 01 Apr 2026 11:13:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tVe-0000000EbUA-0X4H;
	Wed, 01 Apr 2026 11:13:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Du2sSK+w7A138RXer2hE9EYVOnPw5AIHeHoZShzeyJM=; b=TIKiYZViK6NnAFw7LKhCCaNyxu
	LiUVPhOjdh5QQnlIA2yLb8C2Mo/dKrgKMR6q5vCLtm94jPEYztIH9TVCr5vsSZCIj3rF9g9IMrUgH
	CtzCp9A1fjeHikkXG1gO5i6gbxhopYtsGKqq/sRF+/LnMk/+BeSXH/2+BUPLGqVF2eStGXL+Iiyy+
	7aaoNVVSRM80FGM+OmRsUrEa9n4JbuCZ64w06d9rJiTNo3GTRNV+KgsccgmUs9tmtlMkaSm1Q73MD
	xsPiR+WyjEN/Fne8PqgrGu5e5V/lKOWZTzLg6LzATB0vpvKuK435NsD3PugOfZ3UoYkOOPiZMDdRG
	4GEjcsGw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tVa-00000000A5k-1i7w;
	Wed, 01 Apr 2026 11:13:16 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 631BAZGi8972599, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1775041835; bh=Du2sSK+w7A138RXer2hE9EYVOnPw5AIHeHoZShzeyJM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=vErFAfVZmCZ5liiHF0W5Cl3eXZdN4kpbEX9IS93k0RpGOUUpR0jW0bswmr9cDs8ar
	 59NeCMBYWcbooGZrpBUhwc2Ltd6F80ib8WZHJ4Ql09sFSVQx1lj/SSvm8v4sgbhRQr
	 fp/9mH5QUb9qeBeVGP5/s5bZ4vbDUEj1Gyd7mEBIdjWHHw2H1GtjcFaWQWqY/eiRfB
	 HLZQXjHwWNtQR5gS7L05SQEJF57GRbbm4XyxtB3tdkrE78VVFxEaG3iIq8U5fkw+B/
	 QlyGTIwqLrLW5J5vTHw5ObvFrECcJaT2kEBw1wg0PLtZ9llXPtT+9NBfCISYsWz8Nq
	 DtLR7vwe2hdaw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 631BAZGi8972599
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Apr 2026 19:10:35 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 1 Apr 2026 19:10:33 +0800
Received: from RTKEXHMBS05.realtek.com.tw ([fe80::5e14:1ddb:ee82:82d6]) by
 RTKEXHMBS05.realtek.com.tw ([fe80::5e14:1ddb:ee82:82d6%4]) with mapi id
 15.02.1748.010; Wed, 1 Apr 2026 19:10:33 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "linusw@kernel.org" <linusw@kernel.org>,
        "brgl@kernel.org"
	<brgl@kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "afaerber@suse.com" <afaerber@suse.com>,
        =?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
        =?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
        =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>,
        =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>
Subject: RE: [PATCH 1/3] dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio
Thread-Topic: [PATCH 1/3] dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio
Thread-Index: AQHcwREmgkCVEmuK9kquFtQiZIu6y7XJTzgAgAC+jFA=
Date: Wed, 1 Apr 2026 11:10:33 +0000
Message-ID: <8a4f558fdc6649be8c6239403e706621@realtek.com>
References: <20260331113835.3510341-1-eleanor.lin@realtek.com>
 <20260331113835.3510341-2-eleanor.lin@realtek.com>
 <20260401-idealistic-grinning-wallaby-8c3cd5@quoll>
In-Reply-To: <20260401-idealistic-grinning-wallaby-8c3cd5@quoll>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_121315_098270_13706E4B 
X-CRM114-Status: GOOD (  14.99  )
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

PiBPbiBUdWUsIE1hciAzMSwgMjAyNiBhdCAwNzozODozM1BNICswODAwLCBZdS1DaHVuIExpbiB3
cm90ZToNCj4gPiArICByZWc6DQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAgICAgLSBkZXNjcmlw
dGlvbjogR1BJTyBjb250cm9sbGVyIHJlZ2lzdGVycw0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9u
OiBHUElPIGludGVycnVwdCByZWdpc3RlcnMNCj4gPiArDQo+ID4gKyAgaW50ZXJydXB0czoNCj4g
PiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBJbnRlcnJ1cHQgbnVtYmVy
IG9mIHRoZSBhc3NlcnQgR1BJTyBpbnRlcnJ1cHQsIHdoaWNoDQo+IGlzDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIHRyaWdnZXJlZCB3aGVuIHRoZXJlIGlzIGEgcmlzaW5nIGVkZ2UuDQo+ID4g
KyAgICAgIC0gZGVzY3JpcHRpb246IEludGVycnVwdCBudW1iZXIgb2YgdGhlIGRlYXNzZXJ0IEdQ
SU8gaW50ZXJydXB0LA0KPiB3aGljaCBpcw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICB0cmln
Z2VyZWQgd2hlbiB0aGVyZSBpcyBhIGZhbGxpbmcgZWRnZS4NCj4gPiArICAgICAgLSBkZXNjcmlw
dGlvbjogSW50ZXJydXB0IG51bWJlciBvZiB0aGUgbGV2ZWwtc2Vuc2l0aXZlIEdQSU8gaW50ZXJy
dXB0LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICB0cmlnZ2VyZWQgYnkgYSBjb25maWd1cmVk
IGxvZ2ljIGxldmVsLg0KPiA+ICsNCj4gPiArICBpbnRlcnJ1cHQtY29udHJvbGxlcjogdHJ1ZQ0K
PiA+ICsNCj4gPiArICAiI2ludGVycnVwdC1jZWxscyI6DQo+ID4gKyAgICBjb25zdDogMg0KPiA+
ICsNCj4gPiArICBncGlvLXJhbmdlczogdHJ1ZQ0KPiA+ICsNCj4gPiArICBncGlvLWNvbnRyb2xs
ZXI6IHRydWUNCj4gPiArDQo+ID4gKyAgIiNncGlvLWNlbGxzIjoNCj4gPiArICAgIGNvbnN0OiAy
DQo+ID4gKw0KPiA+ICtyZXF1aXJlZDoNCj4gPiArICAtIGNvbXBhdGlibGUNCj4gPiArICAtIHJl
Zw0KPiA+ICsgIC0gZ3Bpby1yYW5nZXMNCj4gPiArICAtIGdwaW8tY29udHJvbGxlcg0KPiA+ICsg
IC0gIiNncGlvLWNlbGxzIg0KPiA+ICsNCj4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNl
DQo+ID4gKw0KPiA+ICtleGFtcGxlczoNCj4gPiArICAtIHwNCj4gPiArICAgIGdwaW9AODkxMjAg
ew0KPiA+ICsgICAgICBjb21wYXRpYmxlID0gInJlYWx0ZWsscnRkMTYyNS1pc29tLWdwaW8iOw0K
PiA+ICsgICAgICByZWcgPSA8MHg4OTEyMCAweDEwPiwNCj4gDQo+IDB4MTAgZmVlbHMgdmVyeSBz
aG9ydCByYW5nZS4NCj4gDQo+ID4gKyAgICAgICAgICAgIDwweDg5MTAwIDB4MjA+Ow0KPiANCj4g
QW5kIHRoaXMgbWVhbnMgaXQncyBjb250aW51b3VzLiBBcmUgeW91IHN1cmUgdGhlc2UgYXJlIHR3
byBzZXBhcmF0ZSBhZGRyZXNzDQo+IHNwYWNlcz8NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6
eXN6dG9mDQoNCkFncmVlZCwgdGhleSBhcmUgY29udGludW91cy4gSSB3aWxsIG1lcmdlIHRoZW0g
aW50byBhIHNpbmdsZSByZWdpb24gaW4gdjIuDQoNCkJlc3QgcmVnYXJkcywNCll1LUNodW4NCg==

