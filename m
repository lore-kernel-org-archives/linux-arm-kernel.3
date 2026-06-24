Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D721CDB47C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 09:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=feVT5fLuDOE7Rojq+E9WobjTI1iyHmEb409dta7jO8w=; b=O/yduilbhTVwBxA/rMb8E7Rx+H
	5wWlFkX1pXtaMktUPgpqwH123MBzh6qiqdTEdtJBwIfExYEuFLBI3+DP51TQCnX5TBczGFzFDRVMd
	XRkc8R9QAFxyeWlyetbW6Ul2uG24lttQF+zCFd+tF2Ja3kZ4Vxwj4YOlu1yjQ3cN7EKf0EGoR3y3I
	XeMLZchlMUoNUJPqwx1u6ZgOnfmCzY/H6/O1M0xLixL46iK2vcfmGMfkzLrkxSW/56EcdUDzarnXn
	JU4sbWBqwV6MZZffqo2HCnG6z6dwhtwzgBqZAxERXmV84Bmaxz6JDLqZQjePjRkqBD/y8kcSIARc4
	mSVXDssw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJqb-00000007URC-2e5h;
	Wed, 24 Jun 2026 09:24:41 +0000
Received: from exmail3.compal.com ([59.120.207.196] helo=tpecef21.compal.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJqU-00000007UPD-3MKw;
	Wed, 24 Jun 2026 09:24:36 +0000
X-UUID: 8035e5446fae11f1b2470fb4f881575f-20260624
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:7676ea42-48f2-4055-8346-59add65a3351,IP:0,U
	RL:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:e276073,CLOUDID:49ae7045-d8c0-4c26-a341-e1551eb7b06d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|110|111|836|865|888|898
	,TC:-5,Content:0|15|50,EDM:1,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil
	,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8035e5446fae11f1b2470fb4f881575f-20260624
Received: from sdmg11.sdbg.compal.com [(10.113.168.9)] by tpecef21.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 517502503; Wed, 24 Jun 2026 17:24:29 +0800
X-UUID: 7d3c655c6fae11f1b328fd8a884f4420-20260624
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:bafa626e-4ca2-48ec-a458-67fe5a3918c4,IP:0,U
	RL:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:e276073,CLOUDID:ff7d0dee-45e6-4692-a476-3f71842ee83b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|110|111|836|865|888|898
	,TC:-5,Content:0|15|50,EDM:1,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil
	,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7d3c655c6fae11f1b328fd8a884f4420-20260624
Received: from sdbmbx13.tpe.compalcomm.com [(10.113.2.137)] by sdmg11.sdbg.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Compal Mail Service with TLSv1.2 ECDHE-RSA-AES128-SHA 128/128)
	with ESMTP id 993115234; Wed, 24 Jun 2026 17:24:24 +0800
Received: from SDBMBX13.tpe.compalcomm.com (10.113.2.137) by
 SDBMBX13.tpe.compalcomm.com (10.113.2.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.29;
 Wed, 24 Jun 2026 17:24:22 +0800
Received: from SDBMBX13.tpe.compalcomm.com ([fe80::ea2a:c2b2:8475:8d69]) by
 SDBMBX13.tpe.compalcomm.com ([fe80::ea2a:c2b2:8475:8d69%11]) with mapi id
 15.02.2562.029; Wed, 24 Jun 2026 17:24:22 +0800
From: "Wu. JackBB (GSM)" <JackBB_Wu@compal.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, Sergey Ryazanov
	<ryazanov.s.a@gmail.com>, Johannes Berg <johannes@sipsolutions.net>, "Andrew
 Lunn" <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Wen-Zhi Huang <wen-zhi.huang@mediatek.com>, Shi-Wei Yeh
	<shi-wei.yeh@mediatek.com>, Minano Tseng <Minano.tseng@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	"Wu. JackBB (GSM)" <JackBB_Wu@compal.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: RE: [External Mail] [PATCH v2 6/7] net: wwan: t9xx: Add AT & MBIM
 WWAN ports
Thread-Topic: [External Mail] [PATCH v2 6/7] net: wwan: t9xx: Add AT & MBIM
 WWAN ports
Thread-Index: AQHc+MXDiLwR0PrArUm0OQwIvRWSlLZNhLaa
Date: Wed, 24 Jun 2026 09:24:22 +0000
Message-ID: <e70456005c3c403189cf135143f96e36@compal.com>
References: <20260610-t9xx_driver_v1-v2-0-c65addf23b3f@compal.com>,<20260610-t9xx_driver_v1-v2-6-c65addf23b3f@compal.com>
In-Reply-To: <20260610-t9xx_driver_v1-v2-6-c65addf23b3f@compal.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.113.2.241]
x-tm-as-product-ver: SMEX-14.0.0.3239-9.1.2019-30026.005
x-tm-as-result: No-10--8.630600-8.000000
x-tmase-matchedrid: MCb2X8FnAXQuv++HU7VXryRFbfQbCufdN0X64jGy2dZJTOxleK2tZnw0
	UcwaiWo2OEjNu/JAa11YsTeqDGqRggCyCXo9mCokAszeqtinEnt4Z8iCvievMktf+nDzeNA5rUC
	vW535VRVx/3vFNR5Gn9vmcY1a+YjJvmBRnessaQvdnKzUfJok1DAGAPS1lC6H+mag7XH0T2ng6I
	sP5CQMBRm01/5OnlUVUe0HnlDD6uFzLIMOHzR0H1yH89h6Sv8E64sq6ekYKa27G2SFw0dTyrNtL
	JrMGzAKbxjWf5YY68zlSoteWkUhdPIIB9QHlQCE5enkh7Jrzn6d4wdGi/BH5a7zQeWM/8x2H9eq
	MMHVCOVNY8dJ8xzaN6gh+IlrIVEcxgRatLz2wHShHa4ajj4rLO4BPpPrzMWli9dqe3GagVgobj5
	Jsp7aHHqeYMk3FaHe5OoEfTXN5NRXs+zvk+5JKQ53Bh+4sUi8OteHVGUMZ+BbseSoBtlH76nQtt
	SLi2noK1B8swvjScIL0S5rTMqI7lmsSofMBbXOES46qCSbf/X5gNZJP+k/L6JYuGaIjh0/IOKWW
	MbJYW2zZHhGBmyWLmReMZ2OJkk3d5c5uTUTfEXqcr4gT7AnzSDBIKx9EIIZt0AKecgRzk8=
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--8.630600-8.000000
x-tmase-version: SMEX-14.0.0.3239-9.1.2019-30026.005
x-tm-snts-smtp: 55B437C1F277F25705A8EAF4CBE1EDAD9FA8CACEF8705A8AAFD070BBEC949BC52000:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_022435_262153_14932E6A 
X-CRM114-Status: GOOD (  17.87  )
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

SGkgSmFrdWIsDQoNCkFkZHJlc3Npbmcgc2FzaGlrbyBBSSBjb2RlIHJldmlldyBjb21tZW50cyBm
b3IgdGhpcyBwYXRjaCwgYXMNCnJlcXVlc3RlZCBieSB5b3UgaW4gdGhlIHBhdGNoIDMvNyByZXZp
ZXc6DQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbmV0ZGV2YnBmL3BhdGNo
LzIwMjYwNjEwLXQ5eHhfZHJpdmVyX3YxLXYyLTMtYzY1YWRkZjIzYjNmQGNvbXBhbC5jb20vIzI3
MDA2MDg4DQoNClExOiBJcyB0aGlzIG11dGV4IGV2ZXIgYWNxdWlyZWQ/IEl0IGlzIGluaXRpYWxp
emVkIGR1cmluZyBwb3J0IHNldHVwLCBidXQNCml0IGRvZXMgbm90IGFwcGVhciB0byBiZSB1c2Vk
IHRvIHNlcmlhbGl6ZSBvcGVyYXRpb25zIGluDQptdGtfcG9ydF9jb21tb25fd3JpdGUoKSBvciB3
aGVuIHNlbmRpbmcgZGF0YS4NCg0KICBWYWxpZC4gRml4ZWQgaW4gdjMgYnkgcmVtb3ZpbmcgdGhl
IHVudXNlZCB3cml0ZV9sb2NrIG11dGV4IGZyb20NCiAgc3RydWN0IG10a19wb3J0IGFuZCBpdHMg
bXV0ZXhfaW5pdCBjYWxsLg0KDQpRMjogV2lsbCBjb25jdXJyZW50IHdyaXRlcyBzYWZlbHkgZXhl
Y3V0ZSBoZXJlIHdpdGhvdXQgaG9sZGluZyB3cml0ZV9sb2NrPw0KQ291bGQgdGhpcyBsYWNrIG9m
IHNlcmlhbGl6YXRpb24gbGVhZCB0byBzZXF1ZW5jZSBudW1iZXIgY29ycnVwdGlvbj8NCg0KICBU
aGUgV1dBTiBjb3JlIGZyYW1ld29yayBob2xkcyBwb3J0LT5vcHNfbG9jayAoYSBtdXRleCkgYXJv
dW5kIHRoZQ0KICB0eC90eF9ibG9ja2luZyBjYWxsYmFjayBpbnZvY2F0aW9ucywgc2VyaWFsaXpp
bmcgd3JpdGUgb3BlcmF0aW9ucw0KICBvbiB0aGUgc2FtZSBXV0FOIHBvcnQuIEZvciBpbnRlcm5h
bCBwb3J0cywgd3JpdGVzIGFyZSBleGNsdXNpdmVseQ0KICBwZXJmb3JtZWQgYnkgdGhlIEZTTSBr
dGhyZWFkLCB3aGljaCBpcyBzaW5nbGUtdGhyZWFkZWQuIENvbmN1cnJlbnQNCiAgd3JpdGVzIHRv
IHRoZSBzYW1lIHBvcnQgZG8gbm90IG9jY3VyLCBhbmQgcG9ydC0+dHhfc2VxIGlzIGFsd2F5cw0K
ICBtb2RpZmllZCBieSBhIHNpbmdsZSB0aHJlYWQuDQoNClEzOiBXaGF0IGhhcHBlbnMgaWYgYSBi
bG9ja2luZyB3cml0ZSBpcyBpbnRlcnJ1cHRlZCBieSBhIHBvcnQgdGVhcmRvd24/DQpJZiBQT1JU
X1NfV1IgaXMgY2xlYXJlZCwgdHJiLT5zdGF0dXMgcmVtYWlucyBhdCBNVEtfREZMVF9UUkJfU1RB
VFVTICgxKS4NCnJldCA9ICghdHJiLT5zdGF0dXMpID8gbGVuIDogdHJiLT5zdGF0dXMgZXZhbHVh
dGVzIHRvIDEsIGNhdXNpbmcgYW4NCmluY29ycmVjdCBieXRlIGNvdW50IHRvIGJlIHJldHVybmVk
Lg0KDQogIFRoaXMgb25seSBvY2N1cnMgZHVyaW5nIHBvcnQgdGVhcmRvd24gKFBPUlRfU19XUiBj
bGVhcmVkIGJ5DQogIG10a19wb3J0X2NvbW1vbl9jbG9zZSBvciBkaXNhYmxlKS4gQXQgdGhpcyBw
b2ludCB0aGUgcG9ydCBpcyBiZWluZw0KICBzaHV0IGRvd24gYW5kIHRoZSByZXR1cm4gdmFsdWUg
aXMgbGFyZ2VseSBpcnJlbGV2YW50IKFYIHRoZSBjYWxsZXINCiAgY2Fubm90IG1lYW5pbmdmdWxs
eSB1c2UgdGhlIHBvcnQgYWZ0ZXJ3YXJkLiBUaGUgc3VibWl0dGVkIGRhdGEgbWF5DQogIG9yIG1h
eSBub3QgaGF2ZSBiZWVuIHRyYW5zbWl0dGVkIGJ5IERNQSwgZGVwZW5kaW5nIG9uIHRpbWluZy4g
VGhpcw0KICBpcyBhIHRlYXJkb3duLW9ubHkgc2NlbmFyaW8gd2l0aCBubyBwcmFjdGljYWwgaW1w
YWN0IG9uIGRhdGENCiAgaW50ZWdyaXR5Lg0KDQpRNDogSXMgaXQgc2FmZSB0byBtdXRhdGUgdGhl
IGZsYWdzIGRpcmVjdGx5IGhlcmU/IFRoaXMgaXMgYSBub24tYXRvbWljDQpyZWFkLW1vZGlmeS13
cml0ZSBvbiB0aGUgc2hhcmVkIHBvcnQgc3RydWN0dXJlLg0KDQogIFRoZSBXV0FOIGNvcmUgaG9s
ZHMgcG9ydC0+b3BzX2xvY2sgKGEgbXV0ZXgpIGFyb3VuZCB0eC90eF9ibG9ja2luZw0KICBjYWxs
YmFja3MsIHNlcmlhbGl6aW5nIGZsYWcgbW9kaWZpY2F0aW9ucy4gbXRrX3BvcnRfd3dhbl93cml0
ZSgpDQogIGFuZCBtdGtfcG9ydF93d2FuX3dyaXRlX2Jsb2NraW5nKCkgYXJlIG5ldmVyIGNhbGxl
ZCBjb25jdXJyZW50bHkNCiAgZm9yIHRoZSBzYW1lIHBvcnQuDQoNClE1OiBEb2VzIHRoaXMgc2ls
ZW50bHkgZHJvcCBkYXRhIG9uIHBhcnRpYWwgd3JpdGVzPyBJZg0KbXRrX3BvcnRfY29tbW9uX3dy
aXRlKCkgcmV0dXJucyBhIHBvc2l0aXZlIHZhbHVlIChwYXJ0aWFsIHN1Y2Nlc3MpLA0KY29uc3Vt
ZV9za2IgaXMgY2FsbGVkIHVuY29uZGl0aW9uYWxseSBhbmQgMCAoc3VjY2VzcykgaXMgcmV0dXJu
ZWQuDQoNCiAgVGhpcyBpcyBhIGRlc2lnbiBsaW1pdGF0aW9uIG9mIHRoZSBXV0FOIHBvcnQgQVBJ
OiB3d2FuX3BvcnRfb3BfdHgNCiAgcmV0dXJucyAwIGZvciBzdWNjZXNzIG9yIG5lZ2F0aXZlIGZv
ciBlcnJvciChWCB0aGVyZSBpcyBubyBtZWNoYW5pc20NCiAgdG8gcmVwb3J0IHBhcnRpYWwgd3Jp
dGVzIGJhY2sgdG8gdGhlIFdXQU4gY29yZS4gVGhlIGFscmVhZHktc3VibWl0dGVkDQogIGZyYWdt
ZW50cyBjYW5ub3QgYmUgcmVjYWxsZWQgZnJvbSB0aGUgRE1BIGVuZ2luZS4gRm9yIHRoZSBBVC9N
QklNDQogIGNvbnRyb2wgcG9ydHMgaW4gdGhpcyBkcml2ZXIsIG1lc3NhZ2VzIGFyZSBzbWFsbCAo
dHlwaWNhbGx5IHVuZGVyDQogIDFLQiwgd2l0aGluIGEgc2luZ2xlIE1UVSkuIFRoZSBtdWx0aS1m
cmFnbWVudCBwYXRoIGlzIHJhcmVseQ0KICBleGVyY2lzZWQgZm9yIGNvbnRyb2wgcGxhbmUgdHJh
ZmZpYy4NCg0KUTY6IEFzIHdpdGggbXRrX3BvcnRfd3dhbl93cml0ZSgpLCBtdXRhdGluZyB0aGUg
c2hhcmVkIGJsb2NraW5nIGZsYWcNCndpdGhvdXQgYXRvbWljcyBjb3VsZCByYWNlLCBhbmQgaWdu
b3JpbmcgcG9zaXRpdmUgcmV0dXJuIHZhbHVlcyBjb3VsZA0KbGVhZCB0byBzaWxlbnQgZGF0YSBs
b3NzLg0KDQogIFNhbWUgYXMgUTQgKGZsYWdzIHNlcmlhbGl6ZWQgYnkgV1dBTiBjb3JlIG9wc19s
b2NrKSBhbmQgUTUNCiAgKHBhcnRpYWwgd3JpdGUgaXMgYSBXV0FOIEFQSSBsaW1pdGF0aW9uLCBy
YXJlIGZvciBjb250cm9sIG1lc3NhZ2VzKS4NCg0KUTc6IElzIHRoZXJlIGEgcmFjZSBjb25kaXRp
b24gaGVyZSBpZiB3d2FuX2NyZWF0ZV9wb3J0KCkgZmFpbHM/IFRoZSByZXR1cm4NCnZhbHVlIGlz
IGRpcmVjdGx5IGFzc2lnbmVkIHRvIHdfcG9ydCB3aXRob3V0IGNoZWNraW5nIElTX0VSUigpIGZp
cnN0Lg0KQ291bGQgY29uY3VycmVudCBSWCBwYXNzIHRoZSBlcnJvciBwb2ludGVyIHRvIHd3YW5f
cG9ydF9yeCgpPw0KDQogIE5vIHJhY2UuIG10a19wb3J0X3d3YW5fZW5hYmxlKCkgaXMgY2FsbGVk
IGZyb20gdGhlIEZTTSB0aHJlYWQNCiAgZHVyaW5nIHRoZSBoYW5kc2hha2Ugc2VxdWVuY2UsIGJl
Zm9yZSB0aGUgcG9ydCBzdGFydHMgcmVjZWl2aW5nDQogIGRhdGEuIFRoZSBDTERNQSBSWCBxdWV1
ZSBmb3IgdGhpcyBwb3J0IGhhcyBub3QgYmVlbiBvcGVuZWQgYXQgdGhpcw0KICBwb2ludCChWCBS
WCBkYXRhIG9ubHkgYXJyaXZlcyBhZnRlciB0aGUgbW9kZW0gY29tcGxldGVzIGl0cw0KICBoYW5k
c2hha2UuIFRoZSBSWCBwYXRoIGNhbm5vdCBvYnNlcnZlIHRoZSBlcnJvciBwb2ludGVyIGJlY2F1
c2Ugbm8NCiAgZGF0YSBhcnJpdmVzIHVudGlsIGFmdGVyIHRoZSBwb3J0IGlzIGZ1bGx5IGVuYWJs
ZWQuDQoNClE4OiBJcyB0aGUgV1dBTiBwb3J0IGV4cG9zZWQgdG8gdXNlcnNwYWNlIGJlZm9yZSBp
dHMgc3RhdGUgaXMgZnVsbHkNCmluaXRpYWxpemVkPyB3d2FuX2NyZWF0ZV9wb3J0KCkgcmVnaXN0
ZXJzIHRoZSBjaGFyYWN0ZXIgZGV2aWNlIGFuZA0KdHJpZ2dlcnMgYSB1ZXZlbnQuIElmIHVzZXJz
cGFjZSBvcGVucyBpbW1lZGlhdGVseSwgUE9SVF9TX0VOQUJMRSBpcw0Kbm90IHNldCB5ZXQgc28g
b3BlbiByZXR1cm5zIC1FTk9ERVYuDQoNCiAgVGhlIHdpbmRvdyBiZXR3ZWVuIHd3YW5fY3JlYXRl
X3BvcnQoKSByZXR1cm5pbmcgYW5kDQogIHNldF9iaXQoUE9SVF9TX0VOQUJMRSkgaXMgYSBmZXcg
aW5zdHJ1Y3Rpb25zIChuYW5vc2Vjb25kcykuIElmDQogIHVzZXJzcGFjZSBvcGVucyBpbiB0aGF0
IHdpbmRvdywgdGhlIG9wZW4gcmV0dXJucyAtRU5PREVWIGFuZCB0aGUNCiAgYXBwbGljYXRpb24g
cmV0cmllcy4gSW4gcHJhY3RpY2UsIHVzZXIgc3BhY2UgV1dBTiBtYW5hZ2VycyAoZS5nLiwNCiAg
TW9kZW1NYW5hZ2VyKSB3YWl0IGZvciB1ZGV2IGV2ZW50cyB0byBzZXR0bGUgYmVmb3JlIG9wZW5p
bmcgcG9ydHMuDQogIFJlb3JkZXJpbmcgdG8gc2V0IFBPUlRfU19FTkFCTEUgYmVmb3JlIHd3YW5f
Y3JlYXRlX3BvcnQgaXMgbm90DQogIGNvcnJlY3QgZWl0aGVyIKFYIHRoZSBwb3J0IHNob3VsZCBu
b3QgYmUgbWFya2VkIGVuYWJsZWQgYmVmb3JlIHRoZQ0KICBXV0FOIHBvcnQgb2JqZWN0IGV4aXN0
cy4NCg0KVGhhbmtzLg0KDQoNCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT0NClRoaXMgbWVzc2FnZSBtYXkgY29udGFpbiBpbmZvcm1hdGlvbiB3aGljaCBpcyBw
cml2YXRlLCBwcml2aWxlZ2VkIG9yIGNvbmZpZGVudGlhbCBvZiBDb21wYWwgRWxlY3Ryb25pY3Ms
IEluYy4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCBvZiB0aGlzIG1lc3Nh
Z2UsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBhbmQgZGVzdHJveS9kZWxldGUgdGhlIG1lc3Nh
Z2UuIEFueSByZXZpZXcsIHJldHJhbnNtaXNzaW9uLCBkaXNzZW1pbmF0aW9uIG9yIG90aGVyIHVz
ZSBvZiwgb3IgdGFraW5nIG9mIGFueSBhY3Rpb24gaW4gcmVsaWFuY2UgdXBvbiB0aGlzIGluZm9y
bWF0aW9uLCBieSBwZXJzb25zIG9yIGVudGl0aWVzIG90aGVyIHRoYW4gdGhlIGludGVuZGVkIHJl
Y2lwaWVudCBpcyBwcm9oaWJpdGVkLg0KPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PQ0K

