Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18588CC6B39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 09:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lfNaC7G0CFtt6g5HK84/0GmEi2YR+Up4b6D59qzUdj8=; b=EHZ4lycup1Th0W3RZ4mOmpVMst
	+BIjkwQp/00+7qw9xRfYMwz1+SxYP5tYx8SVJ3wZblilDGzZQG0F1NoW+TST7/F+ixYuF7+M86EX0
	rqqODJF6z88UcRodpzEMGLzYJGT+BHrflHMAWizPZdobykpC6Lzub09W+pAZZtsK/lZnGBm5BoDHI
	dJYjN2hG7qDXRPfUubFybVAn37Uh6pp0MwB3ZxhJLmnl/Vsfx0kzvKDBP7op7nffmt9eWrEo5nyzZ
	BohcIeYtZSBHWwQ+MOn7cti1FBgq4MP72eNDebNBoa+Jd10RLzBPPmq66fQQholcK4gt4Sv+Lv0XT
	Oe07643A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHW6-0000000HEA5-28eM;
	Thu, 15 Oct 2026 09:12:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHW5-0000000HE9G-32D4;
	Thu, 15 Oct 2026 09:12:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lfNaC7G0CFtt6g5HK84/0GmEi2YR+Up4b6D59qzUdj8=; b=bdZUEbceMkzdN+aORzkkO78arR
	0Dev+bSmk8dDcjRJzwIHr+gLZ/QiK7p4nDS8KR97VKU/HBA0nAb22NtUj10qqlCWffQpIpSRgNyad
	k/TEg4ae/tA2rec7sFEe82yfpQ/abBSeHeGEssF439lWebdHzZqG1C5NvJ3/Q/XVlWJiHh7VaU/UW
	iU0KGHAbqlBNbUf0Ay0VPEJ7tdwOBJkFjgFWn7Eg+vU2CMebLEhHF4IFQump7aHWkAJKqGW2wtsv0
	KB2ElLmZ2F+CJYie9rBEJkXJdornoU+cijZ0kCOSxfRBJxKh/WhF4i6G0pcsmtY9DekGXnDxtl7v2
	UWz3lnvA==;
Received: from exmail3.compal.com ([59.120.207.196] helo=tpecef22.compal.com)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHHW0-000000009cG-0sE0;
	Thu, 15 Oct 2026 09:12:47 +0000
X-UUID: 8946baf0c87811f1a87c2323a98e90a4-20261015
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:fccc4dd7-6bdf-4c38-a5f6-ae467af890c4,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:291e20b,CLOUDID:7e5718fd-82fa-4755-85ae-ebe9525ab585,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8946baf0c87811f1a87c2323a98e90a4-20261015
Received: from sdmg12.sdbg.compal.com [(10.113.168.10)] by tpecef22.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 149126805; Thu, 15 Oct 2026 17:12:24 +0800
X-UUID: 85f07972c87811f1a9f9c99e036204b4-20261015
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:6c0fc86c-41a4-4d2d-8bb1-fd28e0d23b8d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e276073,CLOUDID:42af6095-3103-4fdb-b79c-08de0e281a5d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS
	:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,A
	RC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 85f07972c87811f1a9f9c99e036204b4-20261015
Received: from sdbmbx11.tpe.compalcomm.com [(10.113.2.135)] by sdmg12.sdbg.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Compal Mail Service with TLSv1.2 ECDHE-RSA-AES128-SHA 128/128)
	with ESMTP id 985879827; Thu, 15 Oct 2026 17:12:19 +0800
Received: from SDBMBX13.tpe.compalcomm.com (10.113.2.137) by
 SDBMBX11.tpe.compalcomm.com (10.113.2.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Thu, 15 Oct 2026 17:12:17 +0800
Received: from SDBMBX13.tpe.compalcomm.com ([fe80::d3a3:2665:d306:e36a]) by
 SDBMBX13.tpe.compalcomm.com ([fe80::d3a3:2665:d306:e36a%11]) with mapi id
 15.02.2562.043; Thu, 15 Oct 2026 17:12:17 +0800
From: "Wu. JackBB (GSM)" <JackBB_Wu@compal.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
CC: Sergey Ryazanov <ryazanov.s.a@gmail.com>, Johannes Berg
	<johannes@sipsolutions.net>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Wen-Zhi Huang
	<wen-zhi.huang@mediatek.com>, Shi-Wei Yeh <shi-wei.yeh@mediatek.com>, "Minano
 Tseng" <Minano.tseng@mediatek.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "Simon Horman" <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	"Yu. Robert (GSM)" <robert_yu@compal.com>, "Chang. Jeff (GSM)"
	<Jeff_Chang@compal.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: Re: [PATCH v10 1/6] net: wwan: t9xx: Add PCIe core
Thread-Topic: [PATCH v10 1/6] net: wwan: t9xx: Add PCIe core
Thread-Index: AQHdXIVGsyD+Aq2AK0OYcS5BD0f6eA==
Date: Thu, 15 Oct 2026 09:12:17 +0000
Message-ID: <1686fe2dfdfd4a0890c037a53818aec1@compal.com>
References: <20261014-t9xx_driver_v1-v10-0-4d0dde3613f5@compal.com>
 <20261014-t9xx_driver_v1-v10-1-4d0dde3613f5@compal.com>,<CAFEp6-0d86Mx1gardmN74WNFCerY00Pm1B=720tqOqKhz5EE1Q@mail.gmail.com>
In-Reply-To: <CAFEp6-0d86Mx1gardmN74WNFCerY00Pm1B=720tqOqKhz5EE1Q@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.113.2.241]
x-tm-as-product-ver: SMEX-14.0.0.3239-9.1.2019-30258.005
x-tm-as-result: No-10--15.752000-8.000000
x-tmase-matchedrid: q6+TWfRxf4cuv++HU7VXryRFbfQbCufdN0X64jGy2dZJTOxleK2tZuZd
	NI5cmL7EqJ63gZLKrOBDdLXYWGnDb52vFMfvZjTGiu6u4shZ+fFtT5dsVizXEi+IwZW+xLvQ9PE
	ncRVMUNt0GOgwQ+Y9+BEz71V9WVMe28Nv2hpJvnB4lyF1lyvUrRnz+kO152KHwnWkERiSip3i9D
	rRYAMc5Df8MHPNq3cEyrzRjZhtElOvngkjHjojpPe3el8uYlFT28gAxP/Ts6IH2l80MvY9heUo4
	N9PjSkTthRFAcCnfMqUTGVAhB5EbQ==
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--15.752000-8.000000
x-tmase-version: SMEX-14.0.0.3239-9.1.2019-30258.005
x-tm-snts-smtp: 6D4F98746250E19D728C3E331916E799E093B7B9BF113165B5D1611D73E97CB82000:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_101245_054564_DB6A5385 
X-CRM114-Status: GOOD (  12.20  )
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

SGkgTG9pYywNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQpPbiBXZWQsIE9jdCAxNCwgMjAy
NiBhdCA4OjQ5IFBNIExvaWMgUG91bGFpbg0KPGxvaWMucG91bGFpbkBvc3MucXVhbGNvbW0uY29t
PiB3cm90ZToNCj4gPiArI2luY2x1ZGUgPGxpbnV4L2RtYS1tYXBwaW5nLmg+DQo+ID4gKyNpbmNs
dWRlIDxsaW51eC9kbWFwb29sLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4NCj4g
PiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvc2NoZWQu
aD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3Nw
aW5sb2NrLmg+DQo+DQo+IExvb2tzIGxpa2UgYSBsb3Qgb2YgaGVhZGVycyBmb3Igc3VjaCBhIHNt
YWxsIGhlYWRlciBmaWxlLiBDb3VsZCB5b3UNCj4gdHJpbSB0aGUgdW5uZWNlc3NhcnkgaW5jbHVk
ZXM/IEZvciBleGFtcGxlLCBzcGlubG9jay5oIGRvZXNuJ3QgYXBwZWFyDQo+IHRvIGJlIHVzZWQu
DQoNCldpbGwgZml4IGluIHYxMS4gIEFsbCBzZXZlbiBnbzogdGhlIGhlYWRlciBvbmx5IHVzZXMg
QklUKCkgYW5kIHUzMiwgc28NCjxsaW51eC9iaXRzLmg+IGFuZCA8bGludXgvdHlwZXMuaD4gYXJl
IGxlZnQsIHBsdXMgYSBmb3J3YXJkIGRlY2xhcmF0aW9uDQpmb3Igc3RydWN0IGRldmljZS4NCg0K
PiA+ICsjZGVmaW5lIFNFVF9IV19CSVRTKGRlc3QsIGNocywgbWhjY2lmLCBkZXYpCQlcDQo+ID4g
KwkoewkJCQkJCVwNCj4gPiArCQlpZiAoKGNocykgJiAoZGV2KSkJCQkJCVwNCj4gPiArCQkJKGRl
c3QpIHw9IEZJRUxEX1BSRVAobWhjY2lmLCAxKTsJCVwNCj4gPiArCX0pDQo+DQo+IEEgc3RhdGlj
IGlubGluZSBoZWxwZXIgd291bGQgYmUgY2xlYW5lci4NCg0KV2lsbCBmaXggaW4gdjExOg0KDQog
IHN0YXRpYyBpbmxpbmUgdTMyIG10a19wY2lfbWFwX2V2dF9iaXQodTMyIHZhbCwgdTMyIGZyb20s
IHUzMiB0bykNCiAgew0KCXJldHVybiAodmFsICYgZnJvbSkgPyB0byA6IDA7DQogIH0NCg0KRXZl
cnkgbWFzayBpbnZvbHZlZCBpcyBhIHNpbmdsZSBiaXQsIHNvIEZJRUxEX1BSRVAobWFzaywgMSkg
d2FzIGp1c3QNCm1hc2suICBUaGUgc2FtZSBoZWxwZXIgYWxzbyByZXBsYWNlcyB0aGUgRklFTERf
UFJFUChGSUVMRF9HRVQoKSkgcGFpcnMNCmluIG10a19wY2lfZXh0X2QyaF9ldnRfY2hzKCksIHdo
aWNoIGlzIHRoaXMgdHJhbnNsYXRpb24gaW4gdGhlIG90aGVyDQpkaXJlY3Rpb24uDQoNClRoYW5r
cywNCkphY2s=

