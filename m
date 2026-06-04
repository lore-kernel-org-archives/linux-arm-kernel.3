Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302AFCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 06:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mI9g6gD5BRy3kD3PF5NSErrg5217vlzsf1ZgKqQ13AA=; b=K8v1H3UDPrna3XopsmAUEYcZ8y
	11IfwItmz5uc8PZJRXab8p814t7aErY6r01sKH2ca4hp8UcKtsL+IvY5ZOZ+WhdVFX8Fi4N0rcZYN
	TYOdqg/DQr6eGKt5cgJJDaL/PVsTS5NwWdRBBfglJR2N2Sop6sT6QJWs0fQfu1cyeEz2n7gZvklio
	8TfR7w3oTJIS5d+m3mmkCZ9Xq239xmEt/NHbYm5d/Enbn/IozucPWgI05nJEaPf6HxZM/mPCaJURx
	kfaeSA/LPJKL43rYtKS6taooazAdfv8yEvjk/TZdkGrB2ZRqI2TElEE4vskxi3KOIuS6fLJ9dTglk
	ndpkgoJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV1nP-0000000GEgO-46E4;
	Thu, 04 Jun 2026 06:43:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV1nO-0000000GEgA-1MlB;
	Thu, 04 Jun 2026 06:43:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mI9g6gD5BRy3kD3PF5NSErrg5217vlzsf1ZgKqQ13AA=; b=jbYYTF2V1Q9jwkgoszYw+2P8FQ
	r4rAl/qGGt5+0hy0R3QAbOFKDhof8EGFTzAh6eFRcgnjsQakia2kKOVYkWiUbQ2ZS3C9bTCstvVeh
	zjZ7kIgdgYjlz0gkwULoJm2hTJVOrByDyinRljVRnSY6l/NmNwxDm2MVqzQ0tFuQWiq5bWDjty32P
	sblSJHeTFVzcZFsJLfd8BRuYwdtWI+5ZZ+Ks9kocgWjd3ql7Zm50KBa6lLx2TQnXLuDS3TStnX85+
	b/vbsc2Ckz7wd67LEJ2HU6bQMPk4Xzmr4VPYuLOswqhaCx52BkJDR4DvfChMF8J6DyTdZ2YsHMqFl
	3xMrVjeA==;
Received: from exmail3.compal.com ([59.120.207.196] helo=tpecef21.compal.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wV1nH-0000000DupI-1tJN;
	Thu, 04 Jun 2026 06:43:11 +0000
X-UUID: 968b9e8e5fe011f1b2470fb4f881575f-20260604
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:a75fff77-d19e-4694-9d0c-2136a68adc54,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e276073,CLOUDID:a995f2c8-bf0b-48fd-a537-c174b04741d7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|817|836|865|
	888|898,TC:-5,Content:-10|-8|-5|15|50,EDM:-3,IP:nil,URL:11|94|82|106|1,Fil
	e:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR
	:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 968b9e8e5fe011f1b2470fb4f881575f-20260604
Received: from sdmg12.sdbg.compal.com [(10.113.168.10)] by tpecef21.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1778118517; Thu, 04 Jun 2026 14:42:42 +0800
X-UUID: 938fe0325fe011f1a42089d3d1632821-20260604
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:f1996c64-118c-4810-bc2f-8dcf2a3762f9,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e276073,CLOUDID:0fc30542-f53d-456b-bcbe-afd9e5a5b333,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|817|836|865|
	888|898,TC:-5,Content:-10|-8|-5|15|50,EDM:-3,IP:nil,URL:11|94|82|106|1,Fil
	e:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR
	:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 938fe0325fe011f1a42089d3d1632821-20260604
Received: from sdbmbx13.tpe.compalcomm.com [(10.113.2.137)] by sdmg12.sdbg.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Compal Mail Service with TLSv1.2 ECDHE-RSA-AES128-SHA 128/128)
	with ESMTP id 1827825207; Thu, 04 Jun 2026 14:42:37 +0800
Received: from SDBMBX13.tpe.compalcomm.com (10.113.2.137) by
 SDBMBX13.tpe.compalcomm.com (10.113.2.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.29;
 Thu, 4 Jun 2026 14:42:33 +0800
Received: from SDBMBX13.tpe.compalcomm.com ([fe80::ea2a:c2b2:8475:8d69]) by
 SDBMBX13.tpe.compalcomm.com ([fe80::ea2a:c2b2:8475:8d69%11]) with mapi id
 15.02.2562.029; Thu, 4 Jun 2026 14:42:33 +0800
From: "Wu. JackBB (GSM)" <JackBB_Wu@compal.com>
To: "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, Loic Poulain
	<loic.poulain@oss.qualcomm.com>, Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Wen-Zhi Huang <wen-zhi.huang@mediatek.com>, Shi-Wei Yeh
	<shi-wei.yeh@mediatek.com>, Minano Tseng <Minano.tseng@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH 01/11] net: wwan: t9xx: Add PCIe core
Thread-Topic: [PATCH 01/11] net: wwan: t9xx: Add PCIe core
Thread-Index: AQHc8bhcdmgibeQV+0mP7OG8OB0FzrYt9Hq3
Date: Thu, 4 Jun 2026 06:42:33 +0000
Message-ID: <c9e80369a7ec449a814cd85269f1135e@compal.com>
References: <20260529-t9xx_driver_v1-v1-0-bdbfe2c01e57@compal.com>
 <20260529-t9xx_driver_v1-v1-1-bdbfe2c01e57@compal.com>,<PH0PR11MB5902127C590230B9FE50F78AF0152@PH0PR11MB5902.namprd11.prod.outlook.com>
In-Reply-To: <PH0PR11MB5902127C590230B9FE50F78AF0152@PH0PR11MB5902.namprd11.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.113.2.241]
x-tm-as-product-ver: SMEX-14.0.0.3239-9.1.2019-29986.005
x-tm-as-result: No-10--7.938100-8.000000
x-tmase-matchedrid: EefIVvJ/ke0uv++HU7VXryRFbfQbCufdN0X64jGy2dbVc/AFNTvLSw2J
	SRqdWmN4dOiVKzG2jpTSPUHhcw+FHAE8OiDrjBOCUirF7gO7fvl0pPFWgq1KNgSjtG4gy/zQk3M
	PpgxG+BYZ+O+6wWe+rfJ3yfksIbvtUohvb26/VwDIUNmTDb0ad1XyfUSvLyzCwuyxgbj8l3/4mW
	TdKLNVsJtnQM1dYEpEhP3qugnKLontZDpZlNWg4O3qPLdU3cUZ8kOnQJj3cxKt4Zcwyi58uXaRl
	uqYn9rmrWwln+vsup2vvs41AhDx9CRoQhMu0UDBJPlTeUnhPwrNWLms91YSA1o7GmCOJYd1O50T
	9A74HCu2FEUBwKd8ytET2zOm+uW5sIEAo6wFidwno0Idd9TzoxCUQCtauB3Whv30+gdEALI=
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--7.938100-8.000000
x-tmase-version: SMEX-14.0.0.3239-9.1.2019-29986.005
x-tm-snts-smtp: EA7519F9C438C9B8BD9413C927FD465DE89BEFAF1CB7E18423535D7878401CC42000:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_074309_044507_B18970AD 
X-CRM114-Status: GOOD (  10.00  )
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

DQoNCj4gU2VudDogRnJpZGF5LCBNYXkgMjksIDIwMjYgMTI6MzIgUE0NCj4NCj4gPiArDQo+DQo+
IHBsZWFzZSBhbHNvIHRha2UgYSBsb29rIG9uIHNhc2hpa28gbm90ZXMsIHRoZXJlIGlzIHNvbWUg
bnVtYmVyIG9mIHRoZW0NCg0KSGkgSmFnaWVsc2tpLA0KDQogIFRoYW5rIHlvdSBmb3IgeW91ciBy
ZXZpZXcuIFdlIGhhdmUgZml4ZWQgc29tZSBpc3N1ZXMgYW5kIGFyZSBzdGlsbCBkaXNjdXNzaW5n
IG90aGVycyB3aXRoIE1lZGlhVGVrLiBBbGwgb2YgdGhlbSB3aWxsIGJlIGFkZHJlc3NlZCBpbiBW
Mi4NCg0KICBSZWdhcmRpbmcgc2FzaGlrbyBub3RlcywgaG93IHNob3VsZCBJIGhhbmRsZSB0aGVt
IGlmIGRpc2N1c3Npb24gaXMgbmVlZGVkPyBJIGNhbm5vdCBmaW5kIHNhc2hpa28ncyBlbWFpbCBh
ZGRyZXNzLCBhbmQgaXRzIHdlYnNpdGUgZG9lcyBub3QgaGF2ZSBhIHJlcGx5IG9wdGlvbi4NCg0K
Rm9yIGV4YW1wbGU6DQogIGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDUyOS10
OXh4X2RyaXZlcl92MS12MS0wLWJkYmZlMmMwMWU1NyU0MGNvbXBhbC5jb20/cGFydD0yDQoNCiAg
UTE6DQogIFRoZSBjb21taXQgbWVzc2FnZSBtZW50aW9ucyBpbXBsZW1lbnRpbmcgVFggYW5kIFJY
IHNlcnZpY2VzLCBidXQgdGhlIHBhdGNoIHByaW1hcmlseSBhZGRzIGVtcHR5IHN0cnVjdHVyZXMg
YW5kIGJvaWxlcnBsYXRlIGNvZGUuIElzIHRoZSBwYXRjaCBtaXNzaW5nIHRoZSBhY3R1YWwgVFgv
UlggaW1wbGVtZW50YXRpb24gZGVzY3JpYmVkIGhlcmU/DQoNCiAgUmVwbHk6DQogIFdlIHBsYW4g
dG8gdXBkYXRlIHRoZSBjb21taXQgbWVzc2FnZS4gV291bGQgdGhlIGZvbGxvd2luZyBiZSBhY2Nl
cHRhYmxlPw0KDQogICAgQWRkIHRoZSBjb250cm9sIHBsYW5lIHRyYW5zYWN0aW9uIGxheWVyIGZy
YW1ld29yayBmb3IgdGhlIHQ5eHgNCiAgICBXV0FOIGRyaXZlciwgaW5jbHVkaW5nIGNvbmZpZ3Vy
YXRpb24gb3B0aW9ucywgZGV2aWNlIHN0cnVjdHVyZQ0KICAgIGRlZmluaXRpb25zLCBhbmQgaW5p
dGlhbGl6YXRpb24vY2xlYW51cCBmdW5jdGlvbnMuDQoNCiAgICBUaGUgYWN0dWFsIFRYL1JYIHNl
cnZpY2UgaW1wbGVtZW50YXRpb25zIHRoYXQgdXNlIHRoaXMgZnJhbWV3b3JrDQogICAgYXJlIGlu
dHJvZHVjZWQgaW4gc3Vic2VxdWVudCBwYXRjaGVzLg0KDQoNClRoYW5rcy4NCg0KDQoNCg0KDQo9
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQpUaGlzIG1lc3Nh
Z2UgbWF5IGNvbnRhaW4gaW5mb3JtYXRpb24gd2hpY2ggaXMgcHJpdmF0ZSwgcHJpdmlsZWdlZCBv
ciBjb25maWRlbnRpYWwgb2YgQ29tcGFsIEVsZWN0cm9uaWNzLCBJbmMuIElmIHlvdSBhcmUgbm90
IHRoZSBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBtZXNzYWdlLCBwbGVhc2Ugbm90aWZ5IHRo
ZSBzZW5kZXIgYW5kIGRlc3Ryb3kvZGVsZXRlIHRoZSBtZXNzYWdlLiBBbnkgcmV2aWV3LCByZXRy
YW5zbWlzc2lvbiwgZGlzc2VtaW5hdGlvbiBvciBvdGhlciB1c2Ugb2YsIG9yIHRha2luZyBvZiBh
bnkgYWN0aW9uIGluIHJlbGlhbmNlIHVwb24gdGhpcyBpbmZvcm1hdGlvbiwgYnkgcGVyc29ucyBv
ciBlbnRpdGllcyBvdGhlciB0aGFuIHRoZSBpbnRlbmRlZCByZWNpcGllbnQgaXMgcHJvaGliaXRl
ZC4NCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCg==

