Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FF0CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=buKsSZ+7jW/UO5tcyoJnJM3jwIHms8+0rSELJYgMv38=; b=jBKOsxJN1zfsJNiU4t1fV38AYS
	YTbxIaZSZ89WfwMZMuKwy0IPLAKOEOlivGkwxBSX0+DRBBG0r8CnBYNNRuP0u1mCV3w+SYs2s2pKC
	VA0IuMDitAC6UlPvt9E00ZFKi1CL8OotYsusQqOQ1xZtbhtInXrlBDVpS0egkuTM8XS7DBl8P7Mwn
	011pgwvAp1GREIs9d5FuE22fyne/Pjk28XFgm9jYazjCOXPCFofCSsRdZvflvV0zuAPxzgHD+u0Tc
	/7I3JSmSrEbu8kvnnzy04mYny6q1duhJkCmhei1L/T3pVVlQMkTXNy9eubbzaJ77C27eR7TeQGCgr
	eHO3IjXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCzq-0000000Fsxi-3PRa;
	Tue, 05 May 2026 10:27:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCzp-0000000FsxN-0DQl;
	Tue, 05 May 2026 10:27:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=buKsSZ+7jW/UO5tcyoJnJM3jwIHms8+0rSELJYgMv38=; b=pfDyCBd8Tieb8u1nFbb9XmJk8T
	4qUT5lCteiOmG4tYAAxzPPVhC3M31TGTSw/VPLakVmeeaZtmsjKUFpBtIjAur3H88bjtolnlI29LD
	OvrTrZu19WnUju4IzUJWWDYhDAitziAZq1udjIQSAvIVOle6+FVC4EBD2Ca6bdylwePvPdsBZvZwT
	LsWYOksngZ40K6jesahZ2zoqhQEZpVc6G/YS4HP6ASb+bXkffE8V1r9I+m6BipMoLBt+tw45c3jmB
	Tle0BJfkX5/ZU1+jDBIe/N0OWWFO27dZdZ9UfY7I67cnETnXT4C86XuyG5UaEAiuhrpqv1/MN22Mx
	wsu94RDg==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCzl-0000000DByY-1xUr;
	Tue, 05 May 2026 10:27:19 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 645AR5zP41151053, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1777976825; bh=buKsSZ+7jW/UO5tcyoJnJM3jwIHms8+0rSELJYgMv38=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=mkgJVHrBo+1ysTT19p5CNIRkHdmTfy4xkcVllc0UBYxsZk5VZ6e1QDEVhS/ZY34TE
	 mp0x7Fa0NE37JJSph6OBQkGTWwv4JA+KhCptWaVLtNRibGQoqSlWvJ8kcwkCXQXf7J
	 1+/wcZCLL1Bp1c0f55SHvnXdc5ML0tIDUO8TSncswePjN6ubADK/PAzaOji84ClvKM
	 uxIfczzcfC04FP1R0ag385VV3Zk3T0RlJM9X1mn+W66bGu+frmw6E59aN0dYGG6pB4
	 VAxZtmxMQF6WOI6DFHzCeH2Br37GVb5Z/XzRjKLSr+tSypF80nP0ELf+Sw99Z6bCV3
	 yjaVo1JaVd1Lg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.27/5.94) with ESMTPS id 645AR5zP41151053
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 May 2026 18:27:05 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 5 May 2026 18:27:04 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 5 May 2026 18:27:04 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::ed72:3015:2840:4458%10]) with mapi id
 15.02.1748.010; Tue, 5 May 2026 18:27:04 +0800
From: =?utf-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        "linusw@kernel.org"
	<linusw@kernel.org>,
        "brgl@kernel.org" <brgl@kernel.org>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "afaerber@suse.com"
	<afaerber@suse.com>,
        =?utf-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?=
	<tychang@realtek.com>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-realtek-soc@lists.infradead.org"
	<linux-realtek-soc@lists.infradead.org>,
        =?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
        =?utf-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>,
        =?utf-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>
Subject: RE: [PATCH v2 1/4] gpio: Remove "default y" in Kconfig
Thread-Topic: [PATCH v2 1/4] gpio: Remove "default y" in Kconfig
Thread-Index: AQHc2JPPhFmKb15Oy0q6ziQ+KMIRSbX28IkAgAhPSpA=
Date: Tue, 5 May 2026 10:27:04 +0000
Message-ID: <9f28aa58bb8c441ca7b4a0e75c2947cf@realtek.com>
References: <20260408025243.1155482-1-eleanor.lin@realtek.com>
 <20260408025243.1155482-2-eleanor.lin@realtek.com>
 <6ff75de9-6d5f-4d4a-bb19-1c06d0aa8d3a@kernel.org>
 <e1829cf5-c277-4e34-8bcf-addc27bfd69c@kernel.org>
In-Reply-To: <e1829cf5-c277-4e34-8bcf-addc27bfd69c@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_112718_141611_81668EE8 
X-CRM114-Status: GOOD (  12.43  )
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

PiBPbiAzMC8wNC8yMDI2IDEzOjIzLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiA+IE9u
IDA4LzA0LzIwMjYgMDQ6NTIsIFl1LUNodW4gTGluIHdyb3RlOg0KPiA+PiBSZW1vdmUgdGhlIGRl
ZmF1bHQgeSB0byBhdm9pZCBibG9hdGluZyB0aGUgYnVpbGQgZm9yIG5vbi1SZWFsdGVrDQo+ID4+
IHBsYXRmb3JtcyB3aGVuIENPTVBJTEVfVEVTVCBpcyBlbmFibGUgb24gb3RoZXIgcGxhdGZvcm1z
Lg0KPiA+Pg0KPiA+DQo+ID4gV2h5IGlzbid0IHRoaXMgZHJpdmVyIGltcG9ydGFudCBmb3IgUmVh
bHRlayBTb0M/IFRoaXMgc2hvdWxkIGJlDQo+ID4gZXhwbGFpbmVkLCBvdGhlcndpc2UgcHJvcGVy
IGZpeCBpcyBkZWZhdWx0IGZvciBBUkNIX1JFQUxURUsuDQo+IA0KPiBBbmQgeW91IHdlcmUga2lu
ZCBvZiBhc2tlZCBmb3IgaXQgYXQgdjEuLi4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6
dG9mDQoNCkkgd2FzIGFzc3VtaW5nIG91ciBkZWZjb25maWcgYWxyZWFkeSBlbmFibGVzIHRoaXMg
ZHJpdmVyIGFzIGJ1aWx0LWluLCBzbw0Kc2ltcGx5IGRyb3BwaW5nICJkZWZhdWx0IHkiIHNlZW1l
ZCBzdWZmaWNpZW50Lg0KDQpJIHdpbGwgY2hhbmdlIGl0ICdkZWZhdWx0IEFSQ0hfUkVBTFRFSycu
DQoNCkJlc3QgcmVnYXJkcywNCll1LUNodW4NCg==

