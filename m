Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77A8C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 12:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LAHJXtjz49nvhJPbzvbU50sJTKabAZX8q3QdWFwbqL0=; b=sBGKvZ1Bx/aPvFjtWGjRY6JPiQ
	/546niRitWqxMcHIxfsvM6TOgQqGd+qv5P+Ahbv4h4nrMjjlSGp7coR48Q0oiqjczhhw1K5doVCdm
	Itn01ku7EXaZ1g7WzmFPEhojRuzQnxK7/2WjzZD44aY4LunKQoejUE8LvepVrPYEZi0d05tX3onQL
	pdSb0XhxzIOZg5wrbTeR09crnzLpXHrnTYDyh/zUK/gGlWbHtrSRYZ3ZWkJT/mSXb6JNv1L+1UDKB
	Jv/8cD55lvynTviaSSNoGzyv/LL2HaI/0kOZcr8wYf/C7FrapyELWsSL3LQe12ojf0kAmAcbFhXj5
	wFa2sF1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJ8B-00000007x0k-3qIF;
	Tue, 18 Aug 2026 12:41:27 +0000
Received: from exmail3.compal.com ([59.120.207.196] helo=tpecef22.compal.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJ86-00000007wy7-1ssH;
	Tue, 18 Aug 2026 12:41:23 +0000
X-UUID: 1bdb16809b0211f1a87c2323a98e90a4-20260818
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:77b6cfc4-12e1-41f4-929e-f86af7792db6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7f1ae54,CLOUDID:bb75fff1-0685-46a3-9cac-19d8f3a05ae7,B
	ulkID:nil,BulkQuantity:0,SF:81|82|83|102|110|111|836|865|888|898,TC:-5,Con
	tent:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,
	COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1bdb16809b0211f1a87c2323a98e90a4-20260818
Received: from sdmg12.sdbg.compal.com [(10.113.168.10)] by tpecef22.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1565929998; Tue, 18 Aug 2026 20:41:18 +0800
X-UUID: 18fecbf09b0211f1a9f9c99e036204b4-20260818
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:b2f9ffb2-9790-4000-8bcd-6238caaf229e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:31da99e2-71f1-405e-92eb-6802d6af74fd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|110|111|836|865|888|898
	,TC:-5,Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
	l,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:
	0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 18fecbf09b0211f1a9f9c99e036204b4-20260818
Received: from sdbmbx12.tpe.compalcomm.com [(10.113.2.136)] by sdmg12.sdbg.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Compal Mail Service with TLSv1.2 ECDHE-RSA-AES256-SHA 256/256)
	with ESMTP id 1862435259; Tue, 18 Aug 2026 20:41:13 +0800
Received: from SDBMBX13.tpe.compalcomm.com (10.113.2.137) by
 SDBMBX12.tpe.compalcomm.com (10.113.2.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.2.2562.43;
 Tue, 18 Aug 2026 20:41:12 +0800
Received: from SDBMBX13.tpe.compalcomm.com ([fe80::2b98:6c2c:37df:2a86]) by
 SDBMBX13.tpe.compalcomm.com ([fe80::2b98:6c2c:37df:2a86%11]) with mapi id
 15.02.2562.043; Tue, 18 Aug 2026 20:41:12 +0800
From: "Wu. JackBB (GSM)" <JackBB_Wu@compal.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: "loic.poulain@oss.qualcomm.com" <loic.poulain@oss.qualcomm.com>,
	"ryazanov.s.a@gmail.com" <ryazanov.s.a@gmail.com>,
	"johannes@sipsolutions.net" <johannes@sipsolutions.net>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "wen-zhi.huang@mediatek.com"
	<wen-zhi.huang@mediatek.com>, "shi-wei.yeh@mediatek.com"
	<shi-wei.yeh@mediatek.com>, "Minano.tseng@mediatek.com"
	<Minano.tseng@mediatek.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "horms@kernel.org"
	<horms@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "Yu. Robert (GSM)"
	<robert_yu@compal.com>, "Chang. Jeff (GSM)" <Jeff_Chang@compal.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: RE: [External Mail] Re: [PATCH v6 6/7] net: wwan: t9xx: Add AT & MBIM
 WWAN ports
Thread-Topic: [External Mail] Re: [PATCH v6 6/7] net: wwan: t9xx: Add AT &
 MBIM WWAN ports
Thread-Index: AQHdLpjyDR73LFAPUUmDtuyetZLf8bajwENR
Date: Tue, 18 Aug 2026 12:41:12 +0000
Message-ID: <c2cba1d9cf9f454bad9a72fee67ce2ed@compal.com>
References: <20260811-t9xx_driver_v1-v6-6-2c969fad57c6@compal.com>,<20260817223658.3688816-1-kuba@kernel.org>
In-Reply-To: <20260817223658.3688816-1-kuba@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.113.2.241]
x-tm-as-product-ver: SMEX-14.0.0.3239-9.1.2019-30140.007
x-tm-as-result: No-10--16.102200-8.000000
x-tmase-matchedrid: 17iyaxE7EzIuv++HU7VXryRFbfQbCufdN0X64jGy2dbsEpKlvft9qjRG
	JnoK3ysiHe/Upp/4ecQGzC6W4eU7pRGwbnb8QicjsX4aFYAMIYNBqFX02wvtD72L79/20sYb4f8
	xw8uex9io/Zn+7Gq6rm/eDcdtNcbDktQ3Wzhue4EIjw+vaMoImyEf3Td5xsfFYcKx85MjSJX9EW
	7gNgh408cJir2Opr2TYU7xfHrXr9ikw3+k4j/Jjl1jeXyy57LeiLHhdp4GztOHLFEWrGCxda68k
	bxBBVsgMQ38m9tNAnJn6obUQ390fFVb7WSBJ2slprktoeU+bT7jwao3bN2eyaAcDPu7eAhBmBGz
	eOcTpv/Q+sS71+DOCBAOLNGeu33dv9rSd36EgULA931+mNd9sJs7gkGWoKY3IeFljx6Txcrt5mN
	bWeY1hy6rMqlDL4sxy40mGXQbGhJYaZNY1Y1zK37cGd19dSFd
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--16.102200-8.000000
x-tmase-version: SMEX-14.0.0.3239-9.1.2019-30140.007
x-tm-snts-smtp: 5B17F91330E131C5C77F4BB929BCFBFC6D545A41DF61E6114C54ADC43599104A2000:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_054122_823885_ED9C86AB 
X-CRM114-Status: GOOD (  15.68  )
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

T24gTW9uLCAxNyBBdWcgMjAyNiBhdCAyMjozNiwgSmFrdWIgS2ljaW5za2kgPGt1YmFAa2VybmVs
Lm9yZz4gd3JvdGU6DQo+IFtTZXZlcml0eTogTG93XQ0KPiBTaG91bGQgdGhlIGVycm9yIGZyb20g
bXRrX3BvcnRfZW5hYmxlX2J5X3R5cGUoKSBiZSBoYW5kbGVkIG9yIGF0IGxlYXN0DQo+IGxvZ2dl
ZCBoZXJlPw0KDQpXaWxsIGZpeCBpbiB2Ny4gV2lsbCBhZGQgZGV2X2VyciBsb2dnaW5nIHdoZW4N
Cm10a19wb3J0X2VuYWJsZV9ieV90eXBlKCkgcmV0dXJucyBhbiBlcnJvci4NCg0KPiBbU2V2ZXJp
dHk6IE1lZGl1bV0NCj4gQ2FuIGEgc2hvcnQgd3JpdGUgYmUgc2lsZW50bHkgcmVwb3J0ZWQgdG8g
dXNlcnNwYWNlIGFzIGEgY29tcGxldGUgd3JpdGUNCj4gaGVyZSAoYW5kIGluIG10a19wb3J0X3d3
YW5fd3JpdGVfYmxvY2tpbmcoKSBiZWxvdyk/DQouLi4NCj4gQm90aCB0eCBjYWxsYmFja3Mgb25s
eSB0ZXN0IHJldCA8IDAsIHRoZW4gY29uc3VtZSB0aGUgc2tiIGFuZCByZXR1cm4gMC4NCg0KV2ls
bCBmaXggaW4gdjcuIFdpbGwgdHJlYXQgYSBwb3NpdGl2ZSByZXR1cm4gc21hbGxlciB0aGFuIHNr
Yi0+bGVuDQphcyBhbiBlcnJvciAocmV0dXJuIC1FSU8pIGluIGJvdGggbXRrX3BvcnRfd3dhbl93
cml0ZSgpIGFuZA0KbXRrX3BvcnRfd3dhbl93cml0ZV9ibG9ja2luZygpLg0KDQo+IFtTZXZlcml0
eTogTWVkaXVtXQ0KPiBEb2VzIHRoaXMgZWFybHkgcmV0dXJuIG5lZWQgYSBjb21wZW5zYXRpbmcg
bXRrX3BvcnRfY2hfZGlzYWJsZSgpLCB0aGUgd2F5DQo+IHRoZSB3d2FuX2NyZWF0ZV9wb3J0KCkg
ZmFpbHVyZSBwYXRoIGJlbG93IGRvZXM/DQouLi4NCj4gcXVldWUgbm90IGFsbG9jYXRlZCBhbmQg
cmV0dXJucyAtRUlOVkFMLiAgV291bGQgdGhhdCBsZWF2ZSB0aGUgQVQvTUJJTQ0KPiBjaGFubmVs
IHBlcm1hbmVudGx5IHVudXNhYmxlIGZvciB0aGUgbGlmZXRpbWUgb2YgdGhlIGRldmljZT8NCg0K
V2lsbCBmaXggaW4gdjcuIFdpbGwgY2FsbCBtdGtfcG9ydF9jaF9kaXNhYmxlKCkgb24gdGhlIGVy
cm9yIHBhdGgNCndoZW4gbXRrX3BvcnRfY2hfZW5hYmxlKCkgZmFpbHMsIHRvIGNsZWFuIHVwIHVz
cl9jbnQgYW5kIGFueQ0KcGFydGlhbGx5IGFsbG9jYXRlZCBxdWV1ZSByZXNvdXJjZXMuDQoNCj4g
W1NldmVyaXR5OiBNZWRpdW1dDQo+IENhbiB0aGUgUlggcGF0aCBkZXJlZmVyZW5jZSB0aGUgRVJS
X1BUUiB0aGF0IGlzIHN0b3JlZCBpbnRvDQo+IHBvcnQtPndfcHJpdi53X3BvcnQgYmVmb3JlIGl0
IGlzIHZhbGlkYXRlZD8NCi4uLg0KPiB3b3VsZCB1c2luZyBhIGxvY2FsIHZhcmlhYmxlIGFuZCBv
bmx5IHB1Ymxpc2hpbmcgdGhlIHZhbGlkYXRlZCBwb2ludGVyDQo+IHVuZGVyIHdfbG9jayBiZSBt
b3JlIGNvbnNpc3RlbnQgaGVyZT8NCg0KV2lsbCBmaXggaW4gdjcuIFdpbGwgdXNlIGEgbG9jYWwg
dmFyaWFibGUgZm9yIHd3YW5fY3JlYXRlX3BvcnQoKQ0KcmVzdWx0IGFuZCBvbmx5IHB1Ymxpc2gg
dGhlIHZhbGlkYXRlZCBwb2ludGVyIHRvIHdfcHJpdi53X3BvcnQNCnVuZGVyIHdfbG9jaywgY29u
c2lzdGVudCB3aXRoIG10a19wb3J0X3d3YW5fZGlzYWJsZSgpLg0KDQo+IFtTZXZlcml0eTogTG93
XQ0KPiBUaGlzIGlzbid0IGEgYnVnLCBidXQgd291bGQgcGFzc2luZyBhIHd3YW5fcG9ydF9jYXBz
IGhlcmUgYmUgcHJlZmVyYWJsZSB0bw0KPiBOVUxMPw0KLi4uDQo+IGZyYWdfbGVuIHRvIHRoZSB0
eCBNVFUgYW5kIGhlYWRyb29tX2xlbiB0byBzaXplb2Yoc3RydWN0IG10a19jY2NpX2hlYWRlciks
DQo+IGFzIHQ3eHhfcG9ydF93d2FuLmMgZG9lcywgd291bGQgYm91bmQgdGhhdCBhbGxvY2F0aW9u
IGFuZCBkcm9wIHRoZSBleHRyYQ0KPiBjb3B5Lg0KDQpXaWxsIGZpeCBpbiB2Ny4gV2lsbCBwYXNz
IHd3YW5fcG9ydF9jYXBzIHdpdGggZnJhZ19sZW4gc2V0IHRvDQpwb3J0LT5pbmZvLnR4X210dSBh
bmQgaGVhZHJvb21fbGVuIHRvIHNpemVvZihzdHJ1Y3QgbXRrX2NjY2lfaGVhZGVyKSwNCm1hdGNo
aW5nIHRoZSB0N3h4IGFwcHJvYWNoLg0KDQo+IFtTZXZlcml0eTogTG93XQ0KPiBTaG91bGQgdGhl
c2UgYml0cyBiZSBzZXQgYmVmb3JlIHd3YW5fY3JlYXRlX3BvcnQoKSByYXRoZXIgdGhhbiBhZnRl
cj8NCi4uLg0KPiBzdWNoIGFzIE1vZGVtTWFuYWdlciBjYW4gb3BlbigpIHRoZSBub2RlIGJlZm9y
ZSB0aGVzZSBzZXRfYml0KCkgY2FsbHMgcnVuLg0KDQpXaWxsIGZpeCBpbiB2Ny4gV2lsbCBtb3Zl
IHNldF9iaXQoUE9SVF9TX1dSKSBhbmQgc2V0X2JpdChQT1JUX1NfRU5BQkxFKQ0KYmVmb3JlIHd3
YW5fY3JlYXRlX3BvcnQoKSwgYW5kIGNsZWFyIHRoZW0gb24gZmFpbHVyZS4NCg0KVGhhbmtzLg0K
DQotLQ0KSmFjaw==

