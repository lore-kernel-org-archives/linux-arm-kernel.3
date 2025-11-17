Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4B8D59F5C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 02:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XDGQYe9hMvB0bsyJEU6EbuLLzED7HzwvYlwRiiMygqY=; b=qgBbO+x+nVbrkSREEAy1dDDWFQ
	eLBi7pZAPJvYvLTltCpFqWWknJEL2kHC26QjQttlD9ga7j8lz5pDitn53rD7Tlb2OZ8EnpNqgN5FM
	lT4U72zm1krXWWBnPqF1CjBEW+fHlRY05LDTHnysfmAB8fUBwLDYmwRcyiesH8MusTdQ70rlEISbE
	l+ejMDkJSMuxYuYme7YDfjJdOqjDy3qT+HUuJZqP86rJ95WfVQ4J9YdOl1gvTMP8UJ/mYxNSI2d+a
	mH6y+olQXms+EWiSO0UvQTOEJOI4M4uZ7bQb0Pn/opVLnT7rm64XwKz/h3bVa+UxQ2KEpe/+iaGM3
	dK/2oDQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUFoq-00000001K4f-3MoK;
	Sat, 13 Dec 2025 02:57:16 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUFoo-00000001K4T-3BDT;
	Sat, 13 Dec 2025 02:57:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XDGQYe9hMvB0bsyJEU6EbuLLzED7HzwvYlwRiiMygqY=; b=GrmPqD/9SLy4dhnFt+silSdpfj
	S4g7kt1LGD5xs9aV9tFp7juGIOEc7fC7XQhdwwBod3pG0ZXGm4htWSusYERkCRPvDFa/gjHo2He6Q
	AVMIroUfurAftFdKPjsbewhtbMwVeOyan+8J9yT6J7DZSCLvwDPWoDyYag/PoCtCTXUtNIHWGZw5o
	7faa6IKeNKXtHDo/Stu16C93WUoFIEXNRXOZV6Ek75ITdEczBaASEBk/J7BsKokW7XfDZl0fRf+sp
	tw+SIlP5mvc9M9Y+ZEjO+Yvy8yM3FHsEnEdyci+XrfdZOYHx9ukWQrzxcP+0XN95Qlqo1AABg4Vz5
	2zhTwPtQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxk4-00000007Bir-1aBQ;
	Mon, 17 Nov 2025 11:49:58 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5AHCh43213604016, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1763383384; bh=XDGQYe9hMvB0bsyJEU6EbuLLzED7HzwvYlwRiiMygqY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=VF5wnS64HgvmA/75/98aQk8RIkk3FLYvkl6DPLts7CxIuWa9eAMrww5ZZ+AlROV2C
	 eG4Wsp2TbM/D5eIC3hwz1d26OCPeCUAA/ZGiPJ9lDjbDzE7KhrArMRgffVwv1RSCc5
	 UJWWwj3BquE5OJVrmEtxTaKukcK9RIybvpaCeFVcc9RsR4T9Mtyv7iPBj383LPBknf
	 xmILvWEjTZfjbYpRg4KoT1iiXV3QOyYZXuYqUnLRlsiyDET+Cnya+T5Kbb8Gqgriju
	 g8hYUUqMP4hZpqgLsw5V/8emsFCnaIhO5eGp1cN82SfNiwbIwwOR8e6GpusXBbwRwz
	 uFM54LMhO+mUw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5AHCh43213604016
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Nov 2025 20:43:04 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Mon, 17 Nov 2025 20:43:05 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::744:4bc9:832c:9b7e%10]) with mapi id
 15.02.1544.027; Mon, 17 Nov 2025 20:43:05 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        "afaerber@suse.de"
	<afaerber@suse.de>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "lee@kernel.org" <lee@kernel.org>,
        =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?=
	<james.tai@realtek.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        =?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?=
	<cy.huang@realtek.com>,
        =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?=
	<stanley_chang@realtek.com>
Subject: RE: [PATCH v2 3/3] arm64: dts: realtek: Add Kent SoC and EVB device
 trees
Thread-Topic: [PATCH v2 3/3] arm64: dts: realtek: Add Kent SoC and EVB device
 trees
Thread-Index: AQHcVJlBsddZeY2r4k6RSDkiGGnkcLTwfiUAgAZX9vA=
Date: Mon, 17 Nov 2025 12:43:04 +0000
Message-ID: <1e4c91ab20564680b497d996bc2a4db3@realtek.com>
References: <20251113123009.26568-1-eleanor.lin@realtek.com>
 <20251113123009.26568-4-eleanor.lin@realtek.com>
 <3add6c9f-1bcd-4ec7-ae5e-ba1e67c5087d@kernel.org>
In-Reply-To: <3add6c9f-1bcd-4ec7-ae5e-ba1e67c5087d@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_114957_007815_41BB4541 
X-CRM114-Status: GOOD (  14.43  )
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

PiBPbiAxMy8xMS8yMDI1IDEzOjMwLCBZdS1DaHVuIExpbiB3cm90ZToNCj4+IGRpZmYgLS1naXQg
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlYWx0ZWsvcnRkMTkyMHMtc21hbGx2aWxsZS5kdHNpIGIv
YXJjaC9hcm02NC9ib290L2R0cy9yZWFsdGVrL3J0ZDE5MjBzLXNtYWxsdmlsbGUuZHRzaQ0KPj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uMDk4OWFmY2JkZTY3
DQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlYWx0ZWsv
cnRkMTkyMHMtc21hbGx2aWxsZS5kdHNpDQo+PiBAQCAtMCwwICsxLDEyOSBAQA0KPj4gKy8vIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vci1sYXRlciBPUiBCU0QtMi1DbGF1c2Up
DQo+DQo+IE9kZCwgd2h5IGRvIHlvdSB3YW50IEdQTHYzIG9yIEdQTHY0PyBHUEx2MyBoYXMgcXVp
dGUgc3RyaWN0DQo+IHJlcXVpcmVtZW50cywgc28gSSBob3BlIHlvdSBrbm93IHdoYXQgeW91IGFy
ZSBkb2luZyBhbmQgeW91ciBsZWdhbA0KPiB1bmRlcnN0YW5kIHRoaXMuDQoNClRoYW5rIHlvdSBm
b3IgdGhlIGtpbmQgcmVtaW5kZXIuDQoNCkkgc2ltcGx5IGNvcGllZCB0aGUgaGVhZGVyIGZyb20g
YW4gZXhpc3RpbmcgUmVhbHRlayB1cHN0cmVhbSBkdHNpIGZpbGUuDQpJIHdpbGwgY2hhbmdlIGl0
IHRvICdTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCcNCg0KPj4gKy8qDQo+PiArICog
UmVhbHRlayBSVEQxOTIwUyBTbWFsbHZpbGxlIEVWQg0KPj4gKyAqDQo+PiArICogQ29weXJpZ2h0
IChjKSAyMDI0IFJlYWx0ZWsgU2VtaWNvbmR1Y3RvciBDb3JwLg0KPj4gKyAqLw0KPj4gKw0KPj4g
Ky9kdHMtdjEvOw0KPj4gKw0KPj4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy90aGVybWFsL3RoZXJt
YWwuaD4NCj4+ICsjaW5jbHVkZSAicnRkMTkyMC5kdHNpIg0KPj4gKw0KPj4gKy8gew0KPj4gKwlj
aG9zZW4gew0KPj4gKwkJYm9vdGFyZ3MgPSAiZWFybHljb249dWFydDgyNTAsbW1pbzMyLDB4OTgw
MDc4MDAiOw0KPg0KPiBEcm9wIGJvb3RhcmdzLCBJIGFza2VkIGZvciB0aGlzIGxhc3QgdGltZS4g
VGhhdCdzIGRlYnVnZ2luZy4NCj4NCg0KU29ycnkuIEkgd2lsbCBkcm9wIGl0LiBTZXQgYm9vdCBh
cmdzIGluIGJvb3Rsb2FkZXIuDQoNCj4+ICsJCXN0ZG91dC1wYXRoID0gInNlcmlhbDA6NDYwODAw
bjgiOw0KPj4gKwl9Ow0KPg0KPg0KPg0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0K

