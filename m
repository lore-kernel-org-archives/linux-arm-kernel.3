Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4618CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 10:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MAOU/H4rP3vMD5JkGQ/N6kaHM6Ob1xXG95h7Yn8X/I8=; b=Ckv3iLjA42bHOZEoONgvYwqJNC
	R6+HaJTI6axvVRKzlfsDoYSrxNuRFQWCpVmyMdDwkQXee27z6UYK5XT7E8WwtGByR2fWFoFif2Jih
	nHW5Lpm7WArQyWjkwsnaXUGccfw8ZrSsEUnnNxwJ5ukoE+9crwAGaO1XxkCMVkuV/7dSWUpNzURs6
	Jpn6JLA2MNuvoM+mpMGmFBIrmLFL9f/ebuEpkabM139XxDQVSOA6BGB9+Xc+jdM+jmIGZTf1VEznP
	rFfAZZkKlcxvNjKWfdutYD0je0+KrvNNfrRpIJg16GlsLEAqf7D1wHvQF6ifJ1rUnGTRavA9HrgiG
	JzITCoqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMpj-0000000CqSe-1mmR;
	Tue, 02 Jun 2026 10:58:55 +0000
Received: from exmail3.compal.com ([59.120.207.196] helo=tpecef21.compal.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMpf-0000000CqRs-3vDz;
	Tue, 02 Jun 2026 10:58:54 +0000
X-UUID: 0550078a5e7211f1b2470fb4f881575f-20260602
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:3503611f-c3d8-4c26-bc8b-5dd21fcc196a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:6629ffd6-0b04-449f-bc4f-a909b8df9b02,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:-10|0|15|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:ni
	l,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE
	:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0550078a5e7211f1b2470fb4f881575f-20260602
Received: from sdmg11.sdbg.compal.com [(10.113.168.9)] by tpecef21.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1757077939; Tue, 02 Jun 2026 18:58:43 +0800
X-UUID: 032bf1445e7211f1943831befd1aa4bc-20260602
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:b2ed9818-399c-4c40-83a8-13e3fd1ae099,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:4429ffd6-0b04-449f-bc4f-a909b8df9b02,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:-10|0|15|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:ni
	l,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE
	:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 032bf1445e7211f1943831befd1aa4bc-20260602
Received: from sdbmbx11.tpe.compalcomm.com [(10.113.2.135)] by sdmg11.sdbg.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Compal Mail Service with TLSv1.2 ECDHE-RSA-AES128-SHA 128/128)
	with ESMTP id 1693711392; Tue, 02 Jun 2026 18:58:39 +0800
Received: from SDBMBX13.tpe.compalcomm.com (10.113.2.137) by
 SDBMBX11.tpe.compalcomm.com (10.113.2.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.29;
 Tue, 2 Jun 2026 18:58:37 +0800
Received: from SDBMBX13.tpe.compalcomm.com ([fe80::ea2a:c2b2:8475:8d69]) by
 SDBMBX13.tpe.compalcomm.com ([fe80::ea2a:c2b2:8475:8d69%11]) with mapi id
 15.02.2562.029; Tue, 2 Jun 2026 18:58:37 +0800
From: "Wu. JackBB (GSM)" <JackBB_Wu@compal.com>
To: Jakub Kicinski <kuba@kernel.org>, Jack Wu via B4 Relay
	<devnull+jackbb_wu.compal.com@kernel.org>
CC: Loic Poulain <loic.poulain@oss.qualcomm.com>, Sergey Ryazanov
	<ryazanov.s.a@gmail.com>, Johannes Berg <johannes@sipsolutions.net>, "Andrew
 Lunn" <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Wen-Zhi
 Huang <wen-zhi.huang@mediatek.com>, Shi-Wei Yeh <shi-wei.yeh@mediatek.com>,
	"Minano Tseng" <Minano.tseng@mediatek.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "Simon Horman" <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: RE: [External Mail] Re: [PATCH 00/11] net: wwan: t9xx: Add MediaTek
 T9XX WWAN driver
Thread-Topic: [External Mail] Re: [PATCH 00/11] net: wwan: t9xx: Add MediaTek
 T9XX WWAN driver
Thread-Index: AQHc8iePJegWnmu1bUi94DWo9+PN/LYrGJEz
Date: Tue, 2 Jun 2026 10:58:37 +0000
Message-ID: <c279aea41ecf41c6aca4314a2f4e306b@compal.com>
References: <20260529-t9xx_driver_v1-v1-0-bdbfe2c01e57@compal.com>,<20260601173401.2c892526@kernel.org>
In-Reply-To: <20260601173401.2c892526@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.113.2.241]
x-tm-as-product-ver: SMEX-14.0.0.3239-9.1.2019-29982.005
x-tm-as-result: No-10--20.911500-8.000000
x-tmase-matchedrid: 13nEecSBt9Euv++HU7VXryRFbfQbCufdN0X64jGy2dbVc/AFNTvLS9XY
	nKy9ZqbG0wNjG7j2lpfWtteiDVXz7mpW0A+eYNud4WMcbQqR5OFkrVIXZHd52KloHyDFpaEsbxq
	9W35blN9+M8NObIEDkCLCiAPpH5Zk/7zDDoXJoQ2DhqUecocKp5Wa6EbToghtwd4te8L2vhKVPE
	hvdlk+CqeenaCmQghS8mtEegHTuKyGtpiI1cumNtTSGjubFor4a3FVQe5d4zvlNADTSrHglS1A/
	qnDlqGPFpzeGnmPO0/7sEGacnICGo1g3zDt1sv5v9rSd36EgULA931+mNd9sJs7gkGWoKY36QLg
	e8Tcpn0=
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--20.911500-8.000000
x-tmase-version: SMEX-14.0.0.3239-9.1.2019-29982.005
x-tm-snts-smtp: 3683968551714F2E1CC524964F4B12B68B09CA53E3CB9515879F16383EF833F72000:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_035852_373499_E2D63AB2 
X-CRM114-Status: GOOD (  11.29  )
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

SGkgSmFrdWIsDQoNCj4gT24gRnJpLCAyOSBNYXkgMjAyNiAxODozMTozOSArMDgwMCBKYWNrIFd1
IHZpYSBCNCBSZWxheSB3cm90ZToNCj4gPiA0MyBmaWxlcyBjaGFuZ2VkLCAxNDc2MSBpbnNlcnRp
b25zKCspDQo+DQo+IFBsZWFzZSB0cnkgdG8gY3V0IHRoaXMgZG93biB0byB+NWtMb0MgZm9yIHRo
ZSBpbml0aWFsIHN1Ym1pc3Npb24uDQo+IFdoYXRldmVyIHRoZSBhYnNvbHV0ZSBtaW5pbXVtIHNl
bnNpYmxlIGNodW5rIG9mIGNvZGUgaXMuDQo+DQo+IEVhY2ggcGF0Y2ggbXVzdCBidWlsZCBjbGVh
bmx5IHdpdGggVz0xDQoNCldlJ3ZlIGFscmVhZHkgcmVkdWNlZCB0aGlzIHNpZ25pZmljYW50bHkg
ZnJvbSB0aGUgb3JpZ2luYWwgNDFrIExvQw0KZG93biB0byB+MTQuN2sgYnkgc3RyaXBwaW5nIG91
dCBub24tZXNzZW50aWFsIGZlYXR1cmVzIHN1Y2ggYXMNCmV4Y2VwdGlvbiBoYW5kbGluZywgbWVt
b3J5IGxvZ2dpbmcsIGRldmxpbmssIHN0YXRpc3RpY3MsIGRlYnVnDQp0cmFjaW5nLCBhbmQgb3Ro
ZXJzLg0KDQpXZSBldmVuIHJlbW92ZWQgc29tZSBhcmd1YWJseSBuZWNlc3NhcnkgZmVhdHVyZXMg
KFBNLCBtZGxvZywNCnRocm91Z2hwdXQgb3B0aW1pemF0aW9ucykgdGhhdCB3ZSBwbGFuIHRvIHN1
Ym1pdCBhcyBmb2xsb3ctdXANCnNlcmllcy4NCg0KTm90ZSB0aGF0IHRoZSBsaW5lIGNvdW50IG1h
eSBzbGlnaHRseSBpbmNyZWFzZSBpbiB2MiwgYXMgd2UgcGxhbg0KdG8gYWRkIG1pc3Npbmcga2Rv
YyBjb21tZW50cyBiYXNlZCBvbiByZXZpZXcgZmVlZGJhY2suDQoNCkZvciByZWZlcmVuY2UsIHRo
ZSB0N3h4IGRyaXZlciAodHdvIGdlbmVyYXRpb25zIG9sZGVyLCBzaW1wbGVyIEhXKQ0KaGFkIGFu
IGluaXRpYWwgc3VibWlzc2lvbiBvZiB+MTEuM2sgTG9DIFsxXS4gVGhlIHQ5eHggaGFyZHdhcmUg
aXMNCm1vcmUgY29tcGxleCwgc28gd2UgYmVsaWV2ZSBiZWluZyBpbiBhIHNpbWlsYXIgcmFuZ2Ug
aXMgcmVhc29uYWJsZS4NCg0KV2UnZCBsaWtlIHRvIGtlZXAgdGhlIGRyaXZlciBmdW5jdGlvbmFs
IGFuZCByZXZpZXdhYmxlIGluIGl0cw0KY3VycmVudCBzY29wZS4gRG8geW91IGhhdmUgYW55IHN1
Z2dlc3Rpb25zIG9uIGhvdyB3ZSBjb3VsZCBmdXJ0aGVyDQpyZWR1Y2UgdGhlIHNpemUgd2hpbGUg
bWFpbnRhaW5pbmcgYSB3b3JraW5nIGluaXRpYWwgc3VibWlzc2lvbj8NCg0KWzFdIGh0dHBzOi8v
cGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9uZXRkZXZicGYvY292ZXIvMjAyMjA1MDYxODEz
MTAuMjE4MzgyOS0xLXJpY2FyZG8ubWFydGluZXpAbGludXguaW50ZWwuY29tLw0KDQpUaGFua3Mu
DQoNCg0KPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KVGhp
cyBtZXNzYWdlIG1heSBjb250YWluIGluZm9ybWF0aW9uIHdoaWNoIGlzIHByaXZhdGUsIHByaXZp
bGVnZWQgb3IgY29uZmlkZW50aWFsIG9mIENvbXBhbCBFbGVjdHJvbmljcywgSW5jLiBJZiB5b3Ug
YXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgbWVzc2FnZSwgcGxlYXNlIG5v
dGlmeSB0aGUgc2VuZGVyIGFuZCBkZXN0cm95L2RlbGV0ZSB0aGUgbWVzc2FnZS4gQW55IHJldmll
dywgcmV0cmFuc21pc3Npb24sIGRpc3NlbWluYXRpb24gb3Igb3RoZXIgdXNlIG9mLCBvciB0YWtp
bmcgb2YgYW55IGFjdGlvbiBpbiByZWxpYW5jZSB1cG9uIHRoaXMgaW5mb3JtYXRpb24sIGJ5IHBl
cnNvbnMgb3IgZW50aXRpZXMgb3RoZXIgdGhhbiB0aGUgaW50ZW5kZWQgcmVjaXBpZW50IGlzIHBy
b2hpYml0ZWQuDQo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
DQo=

