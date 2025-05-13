Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00349C3ABD7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 11:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MARU0BjyY0SrYojyHdub6+o8m/1k8lh/KiPGV7UPNdI=; b=L1oR6VlGPHyaaipUxyuuKWOCps
	31mymA9oIGu2A+YzsWbkO3Oo0ZJhXdNLfvBRqmPgCw+Ulb/d462gkLzXs4yP5ctuJI3hgXa9Erpwc
	gzoxusllZL3+Cyd+WnWtcB/aPOM2WtZuWk/WrAthe32qEgykWjA8tO7oACXfUVvHB7ujfwlK0uapf
	hpI26+6HLz3kYv64Q4QsFrtn9nhWL16UVRM2cIdFxH7JjRM7M0PUGu3YcGEYUJWYj429PDjTJEFl/
	gtgMP3XNNMJejXjHskOLqtXUuNcsploneuobvKpG9nIeQTY/F1HhpChTYuO9SZxHGMdYJmCRW+7jP
	7KCXjunQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEntb-0000000CGM6-28Hl;
	Tue, 13 May 2025 11:34:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmcj-0000000C2uT-2Htw;
	Tue, 13 May 2025 10:12:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To
	:From:Sender:Reply-To:Content-Description;
	bh=MARU0BjyY0SrYojyHdub6+o8m/1k8lh/KiPGV7UPNdI=; b=bvzCgKhBmZ3M2R+1awYbsRAHda
	V40F8ch7Emdz1bpv0AvpnyfO/2Bqw+QstDDtLS1qO98su4bfaSDbD5mvTvQW3vMYxg7u5lFR4VW5X
	pULZKUd1WvnblLqQ4irfZY+K/txKwLRhTPJOdOWgTclQm4r9nXwvNfM+iymZKw7BHZTgXW0MLMxdj
	HNi77/j8uGFXc/b9Vv85v+dqSuiacoF2FTQqmWiwnFMu5dudIST2DxqH4vu4usK2/LGulJkP3SiDl
	WaCWNuk7PeS8MfaVaLhGfRUvLdsadya1jnKmvn5xU1oKVXAd1MhQe5rFSrsgBalOOcrs9fC0D9gNQ
	yPSd0t/w==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uEmcf-0000000Gvoa-1IWW;
	Tue, 13 May 2025 10:12:32 +0000
X-UUID: bc9c8c162fe211f08d385d50fb11b32d-20250513
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=MARU0BjyY0SrYojyHdub6+o8m/1k8lh/KiPGV7UPNdI=;
	b=F/zop4NAxGOx8rnXRdbQ/vf8iJ9wU2ANjaaCLRZQqLn52p/G2Yi0sd43+yCgO1tcssvkhuv1zvDhD2HLo/Se2fOUxquzOCzaFXbenvQ+WV+AI3Duk3ez/glQla0THiX9dznDjjw8fRk9b/zY4lwR+0glFpy06WAQTHfHw3DUmOM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:d87b4014-4f3a-45b3-9171-a90d47963011,IP:0,UR
	L:0,TC:0,Content:10,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:10
X-CID-META: VersionHash:0ef645f,CLOUDID:65107951-76c0-4e62-bb75-246dfb0889c6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:4|50,EDM:-3,IP:nil,URL:80|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: bc9c8c162fe211f08d385d50fb11b32d-20250513
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1830117667; Tue, 13 May 2025 03:12:12 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 13 May 2025 18:12:09 +0800
Received: from OS8PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 13 May 2025 18:12:08 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cuqxGrWf/LJ8XXrj7QNV48+Yw5olQ0mx/+mhwV7gJIPWoW3CSH3Uhdd5BBTOAsa+bLezRAMcbDP2enqBAULGa6shPmrOPSZqaPRtlDS4K6nC3wdmkrpvTy2D84J6htSCV/ZpNDZkR/t4MFgOB0+vDJJJbOb6/QJ3Tn0xRe867z13nHEgoTxF813PZTOunx2bp7/Y4sDvjdChEgIisZMpLjILGWDpoOefgow/Gz4euGH/0gtBoHc1WWAAB4kw0BjgSugv3LpKl56zZknhxqBAiUKb0D8XX1j7GISOvbahH+X207uQ1cO2/CWARkbQr/7dg1j2Fw8FDaUwBXtbsdLKgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MARU0BjyY0SrYojyHdub6+o8m/1k8lh/KiPGV7UPNdI=;
 b=UY8P2n1hxMO9IMcNmfiXOZ+QtzsuxHFLq1RmiyWAzfN8RVAIYkJoZuFkOxj0RXtEScPBnvofwrGYkK8xE0RpAMLMpwkz2lgVMdp9y0UxUxkWAdTErmwmrkFHPMhWP++D0k+7jdM1QVT2tJ+yCeC0HiBlxNjZLUIksskAPLQfHMSYaPl3IP2ZbJzzEm3shOwBqVGPY9+v7ZKau8mdG7dXQuyN+pfii1WXPkYqQj3SXSMhzIHU/NYnu/vNryhG9J5NMRfSGN7PAhW3+FzOuZH10EsCU/AaEMEEJpDkx/FwnO/IDm6g9IHtdfkM2xirx0n0tSYXdeQGfDDdk+MuwRhrRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MARU0BjyY0SrYojyHdub6+o8m/1k8lh/KiPGV7UPNdI=;
 b=kzqKJOZ84uV7F9HqlciIfs/fliWqOBJMoxplpmO7G+OgF/1xzT4COezxnLPGh9iHJTSEJti1BEabDel+Yx0iE2SbgGT3OmHix8egQUUpuosGCqJeKvPzlH8ztI5J9AhWxKWI9iFL6Qh65Kvfr0djMcOEP+sGtOmZZ8+FjSnWj6E=
Received: from KL1PR03MB6226.apcprd03.prod.outlook.com (2603:1096:820:8c::14)
 by SEYPR03MB7142.apcprd03.prod.outlook.com (2603:1096:101:d7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 10:12:06 +0000
Received: from KL1PR03MB6226.apcprd03.prod.outlook.com
 ([fe80::f3:c11:8422:7ce3]) by KL1PR03MB6226.apcprd03.prod.outlook.com
 ([fe80::f3:c11:8422:7ce3%3]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 10:12:04 +0000
From: =?utf-8?B?U2t5TGFrZSBIdWFuZyAo6buD5ZWf5r6kKQ==?=
	<SkyLake.Huang@mediatek.com>
To: "linux@armlinux.org.uk" <linux@armlinux.org.uk>
CC: "andrew@lunn.ch" <andrew@lunn.ch>, "dqfext@gmail.com" <dqfext@gmail.com>,
	=?utf-8?B?U3RldmVuIExpdSAo5YqJ5Lq66LGqKQ==?= <steven.liu@mediatek.com>,
	"davem@davemloft.net" <davem@davemloft.net>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "edumazet@google.com"
	<edumazet@google.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "hkallweit1@gmail.com"
	<hkallweit1@gmail.com>, "horms@kernel.org" <horms@kernel.org>,
	"daniel@makrotopia.org" <daniel@makrotopia.org>, "kuba@kernel.org"
	<kuba@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Subject: Re: [PATCH net-next v2 3/3] net: phy: mediatek: add driver for
 built-in 2.5G ethernet PHY on MT7988
Thread-Topic: [PATCH net-next v2 3/3] net: phy: mediatek: add driver for
 built-in 2.5G ethernet PHY on MT7988
Thread-Index: AQHbgqn0+oUccgrII0yLc8X4a8i6V7NOXWgAgIJ8NAA=
Date: Tue, 13 May 2025 10:12:04 +0000
Message-ID: <74ce0275952a9c60af87ded9d64ca7301fd69d0f.camel@mediatek.com>
References: <20250219083910.2255981-1-SkyLake.Huang@mediatek.com>
	 <20250219083910.2255981-4-SkyLake.Huang@mediatek.com>
	 <Z7WleP9v6Igx2MjC@shell.armlinux.org.uk>
In-Reply-To: <Z7WleP9v6Igx2MjC@shell.armlinux.org.uk>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB6226:EE_|SEYPR03MB7142:EE_
x-ms-office365-filtering-correlation-id: 335d23c7-fc96-4a34-1ba3-08dd92069c59
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VmdFYlRnK2YwQUxzZWRnT3NWZTNmZ3htc0xPTnFRcVRXTWlkSUVrV2Q4cWV3?=
 =?utf-8?B?QzFrb2VRSDNZUTJPbytQa0poNkplaHAyVnZrWlhuRTFpc3BQSjRDQ2p5TUhP?=
 =?utf-8?B?M2ZQeU9reVdXTVNSSDJGa1Nob0VielNlTERkeWhWb0xIV2lHbGFqQ3F6aXBY?=
 =?utf-8?B?V0NsMVI1RlpSSzJwakpJZzBDd3Y4ZFdVN0JYbjhtanZvV2ttdXhaYXp6NjVE?=
 =?utf-8?B?SnZFT0M3ZVl3Qzk2Q1lWRVdycWtPTzlQaG00TFdaNC9pSkM0UHZ5cS9HS3pC?=
 =?utf-8?B?L0srWWxmQUtoV0RMYldVR2ttbTVVUmtucnFqaWNad28yY0FwcUpXajJYVmJu?=
 =?utf-8?B?bktRMjNJR1hrOUROcVQ0UTZTQWw4eVpCYXhIOWhjRENhMWtrelBoaEVyOTVr?=
 =?utf-8?B?OFEzMEZOdVk0UkpTVndJMW9XMkdrQVpHeE9FdEdMTFpmS083NDk5Y05Sekdp?=
 =?utf-8?B?WXo0NFBVVm1HM0tNdmdBY2xmMEpjelVQNE4xRVZXQTZWZ0lQaWR4dUJjbzFX?=
 =?utf-8?B?SmV5MkNRM21JZS9kQkRFZk5CcEVsL0I0Uis5dG5NMVFkeEttc0tnekYrN2Nx?=
 =?utf-8?B?WFBqdWROQW4vKzVnZUpCYjdQWnY5bkN1VVhiMG1Sc1htRStaOVFvZE5kY0VV?=
 =?utf-8?B?Q1ljY3dmaHBuY21MUUtVOUxpTVNuYUszMTR3V0JrVU5vVTYwRC9nSDBFMitj?=
 =?utf-8?B?S0FTTk1xTmoxdExOSkdMMmpmWmthT0xsZWEyR3hxcXlFTEdTL0VkZFUvdlp6?=
 =?utf-8?B?bTBKRCsxRGdsdEhkRVZ1TWRoUmRoN2NmTTl2V002UTd3ZWFtNWNhaXB5TFFD?=
 =?utf-8?B?M2xROC9TSno5R09QaWFWajF1MGt4N3VzNEh0OE0wT2JjOVhBUjg3TFdycTVR?=
 =?utf-8?B?Q2VVajFtR3BoUDI0R01CWkpxckxnUkcwaUFrbFhMNWJkdHBReVVqbGV1Tnlj?=
 =?utf-8?B?QThJaTU1anN0Y3BFUEdBRzlCZlBtUHduaSt1ZkJnMmhtL1hSSHh2cXJRcUJv?=
 =?utf-8?B?d0NVSCszV21DVGdnQTllM3pZeWlBejREd00wTjFyR1plZ1c0aG80cndzbGli?=
 =?utf-8?B?M25FZlZYWlRCVGFoNlo5TjJKNS80eURReDFSYnR0a0pyQVFubWt5U2Z6cGd0?=
 =?utf-8?B?TDFNWE12SDBiSDU5VUNsN1BZZmVFcisxY0tlSmZUL2xkbjR4bHRwVGpSQTJQ?=
 =?utf-8?B?SlRJVFNoOHNnT2dTcTBYZHlQd3RKZFV4Yjd2KzREazQvT2ZVZDczRUZCVW9K?=
 =?utf-8?B?ellYbjBUZzRMUDM3ekhKVldmY28rbG1hTWFXeGdLUmNqVUNNdkIwNCt1WXk3?=
 =?utf-8?B?ZndGbUQ3Zkhia1F1ZUtoWTBCTjhBV0JQZFcvRTV0Tk9kVXdMcW9pQXlJUjdN?=
 =?utf-8?B?M1FKRGlJTWlQTDRLSXpzekFGd3Q4bStvb3FEd3pLNEJTMnhuT25wR0MzNVY4?=
 =?utf-8?B?VWlTeXNzbld5MXh5U3Rhb3lsMjlYZzhlekVyVEc1R1h6ZHJYSE81bEdvMXJK?=
 =?utf-8?B?Z1ZVQmhkYmpXeGNEdGVhNHJ0d2JDQzBmNy9BNU5adWV5VnZLcVRibWg5aS9Z?=
 =?utf-8?B?WTlmYzBxMVpaajZsU2FYeWZoZWkzd3Vua1dkc1BYUWpRRmhZUlFLN3ZNa3JL?=
 =?utf-8?B?NFJvZkZWOERNMzFqdVZGQkRvMUZTRVgremRrc1htRGZTcTh4bUc1YlZwMGs5?=
 =?utf-8?B?SjVZRjRONVdkS3RKbkU5S2YxL1NkdjgxMnkyUnBRdFk5V0FBYis1UGwvM1dm?=
 =?utf-8?B?VXlhSFBwME9yK3FMaUZUQ2xoSjlXRCtTNnNuYXlrMXFDVit2WFlSRm9VK3Bm?=
 =?utf-8?B?MVFkSWM2NlVERGRhU3VZV2o5VGFVVGM5UFpreTM2cUR3V1hRSGFobE9pNEFv?=
 =?utf-8?B?bFNlN2VQRkhDL0MzYTBQeGYzeStmRTV0MU5NZm1DckNDRTFQWEE4NlRRcWtO?=
 =?utf-8?Q?9+IpFoaQAIU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB6226.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NE81UTJiMVdiZVlPcWxseldlakk0QzVOQUlDYVZFVXhJUXE1SVl3M2pDTi9B?=
 =?utf-8?B?VkJ0ZjY4OFVZWk1HbjN4Nlp1NDAzekRWeW1RcmdoMk9KczRra05ZTDF2SHBJ?=
 =?utf-8?B?Sy85YnZENjFFUWZLZURhMlYyOFJGMm43bUhOU2NUL0FXZWFwOVYwVk9HdXly?=
 =?utf-8?B?dENIV2ZONm9vYkpiRU5HZWxxbDIySjA4WGdkN0RJbzFCUWs0OFpqZUtFN2lZ?=
 =?utf-8?B?aFl4am84ZmZLNTMwcFBHR0Erci8wU3ZsSGNGdEg0SzhxNUhVVEpNMlFyQmRy?=
 =?utf-8?B?RVZVQnF2bEFYNHRIRFJKU1djNVNId2FFQ0p1T0xHSnBGS3RHcVlzYmdneTY1?=
 =?utf-8?B?bE40MlpKN3I4SUFlMDU4VnJpd3FRaTg0ZEluMHRkZUhCVlBvamhBZkM4N3VQ?=
 =?utf-8?B?aTZLbUljNWZES09lTDB5MnQ2bWdCTlIySHNxckV5NldCWnc2OVVwSTZ2ZFBF?=
 =?utf-8?B?K2l2T2ZNSGozZnh1ZkcxOU9kWVZwQlVLQmtrZ05XQkFuamFzYSsxRXZtRUFS?=
 =?utf-8?B?MTVlZVY0UklmWSsveTFnbm1XekNTSDdFNXB3YXJONUw1a1ptdEF4Z0RSUVlp?=
 =?utf-8?B?cHZzVFU2MWVLcnZTdEppSUQyRjIzYU85SWVsZVBZbk13ZDRsNldhMGxaT1lI?=
 =?utf-8?B?citCN2NDNFVjVDdOcm5teGJEaXZYN0l3UlptMDdtdzltODJCK1JZTEdjUjRn?=
 =?utf-8?B?N2o0UlJTZU5KVUVUSTZVN3RjN3lnN0N4YzNNcmlQb0VrbEpZUDQwT2RyYmtV?=
 =?utf-8?B?MGdWcUpuSzQ1QmllWGlZMHhicTl5TVRqODhNSVZlNG4rcDZTeHg0WU5tMmxF?=
 =?utf-8?B?eTBHWmxFTXNaT0p3QXc4M0JNUDZhZmYrT1hyYjduOUFDNURlMDA2R01ObzVK?=
 =?utf-8?B?U0t0RWdIUzhnSGxKZ3VRUno1WGxKOThqRXNJblhPMytNdmhkdkM2WSs1TUpt?=
 =?utf-8?B?ekludUt4R3ZaMEovanFGK0k0M3hhTzVCRWNrMFdNU0d4TmVOTnNrRGFwZGla?=
 =?utf-8?B?ZnhJOUdYTGlxbzF0VWladGd0bmdkaDl2a3pBUUNrK2VEQVhTaDVjWkxUSDho?=
 =?utf-8?B?ZXFDRkxSUWtxOHp2bWEzTlh3U3JBMUZqY2I3c09pbC92RkJxYVpGNkVKUWxB?=
 =?utf-8?B?RUNiY2tBdmxJczJYS21sOHl6Ri8xMWNsY2ZTYnBmYnYvSjA3QWVudU5oeGUz?=
 =?utf-8?B?ZmRHWnBRM0VFckJhV21hY3ZzbEl1cTc2K2hvNUo5bFlZMGl5SEYxV3RobDZk?=
 =?utf-8?B?bE9rdHFra0c4dmNUT0p0dTJCMS9uT29UNGxseDBjbWZubHVvQXlDYytkcEVm?=
 =?utf-8?B?VG9aR2NtUkpleCtXc2dyK3N3L0tkTkEzQUNqelJNdTQyT2lkRkN1bjRoa0VI?=
 =?utf-8?B?Q3hMemc4S2JKRHdRMTNOUVF2eDFrU0dBbFgyN3pDeUR3TkxRdlA1S0dPemZI?=
 =?utf-8?B?aS9icDA4MDhRSE8vUVZneVVrNTNmbWtCZHZ5OWkzbGlJTkV5TGdwTk9Fejlr?=
 =?utf-8?B?SkJKVUVRTFEwakxvTDRJd0NrWU8rdEJRNHBLcTRTNHR5amhRc3h3cmNLNG9v?=
 =?utf-8?B?czZaekpNMXorL1R2RXdOY1lQRUFZNmpmRW1JU3RQZXdtelJTRzF3Z2VCV2U1?=
 =?utf-8?B?U0lWZkxBM0dDRjZ2SzhBclZLS01PVGdzQzBTL3ROWWFMaWdQYU5JZnJ4QXFR?=
 =?utf-8?B?eVBENi9UYk9kNXNQTjQ4S0t5a3ZYTFBVZWVXeHBHVGNaZkxZd3JOb3BlZUw1?=
 =?utf-8?B?dFVvTG1OUzZ4SXRLaWFXTFJGaGZnSUpZOENHU1dVc2p3SkgzK0Exb0hrTjFL?=
 =?utf-8?B?azBjQUpTd25CMTJML0V5YWZlMWhBV05uWlJPTlNkMWhYNUtWVWplVU1EVnY5?=
 =?utf-8?B?RVd2bG1BK21OdGUzRGJmRGZjL1ZNbDBhZTk0aytTSTJzZVBnbkdodVlqMUVw?=
 =?utf-8?B?MExjOENaM1VqRUZIa2VTNEIyUUZZVTFJMFVaVlQ1UWFrN0RhMU9mbWQ5Tytq?=
 =?utf-8?B?QkZDMU1iMTFsTHBVdm51M1lobi9XQ2o1ZHVENXp4R2s4U001MUtvWjZjTDU4?=
 =?utf-8?B?M014cHo1TjlmM1kyQVhWNkQ3am1uWW85T1E3V3AyRkVwd2JqTGpjU21Ba0Zh?=
 =?utf-8?B?YjFkQVcxaFRWaUdQZmFteDZoUkI0L2lDWlZwdkxoMDFPTkFkT2VzMWdmQkNy?=
 =?utf-8?B?ckE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5CEAEA7CDC085A4CBB46BEBF9AC224F4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB6226.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 335d23c7-fc96-4a34-1ba3-08dd92069c59
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2025 10:12:04.6607
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gZ0M0WwgzD9kLaDHd9L3cvMNIClwXgY9BP1CZnyzsH2fgGH2aN7HM6gTVAd3xzCDset+XOCYo5O8opt4exGC+cfQfi7vs67ojHKNbiErX8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_111230_117535_9F6BB6CC 
X-CRM114-Status: GOOD (  17.69  )
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

T24gV2VkLCAyMDI1LTAyLTE5IGF0IDA5OjMzICswMDAwLCBSdXNzZWxsIEtpbmcgKE9yYWNsZSkg
d3JvdGU6DQo+IA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mg
b3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVy
IG9yIHRoZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIFdlZCwgRmViIDE5LCAyMDI1IGF0IDA0OjM5
OjEwUE0gKzA4MDAsIFNreSBIdWFuZyB3cm90ZToNCj4gPiArc3RhdGljIGludCBtdDc5OHhfMnA1
Z2VfcGh5X2NvbmZpZ19pbml0KHN0cnVjdCBwaHlfZGV2aWNlICpwaHlkZXYpDQo+ID4gK3sNCj4g
PiArwqDCoMKgwqAgc3RydWN0IHBpbmN0cmwgKnBpbmN0cmw7DQo+ID4gK8KgwqDCoMKgIGludCBy
ZXQ7DQo+ID4gKw0KPiA+ICvCoMKgwqDCoCAvKiBDaGVjayBpZiBQSFkgaW50ZXJmYWNlIHR5cGUg
aXMgY29tcGF0aWJsZSAqLw0KPiA+ICvCoMKgwqDCoCBpZiAocGh5ZGV2LT5pbnRlcmZhY2UgIT0g
UEhZX0lOVEVSRkFDRV9NT0RFX0lOVEVSTkFMKQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIC1FTk9ERVY7DQo+ID4gKw0KPiA+ICvCoMKgwqDCoCByZXQgPSBtdDc5OHhfMnA1
Z2VfcGh5X2xvYWRfZncocGh5ZGV2KTsNCj4gPiArwqDCoMKgwqAgaWYgKHJldCA8IDApDQo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Ow0KPiANCj4gRmlybXdhcmUgc2hv
dWxkIG5vdCBiZSBsb2FkZWQgaW4gdGhlIC5jb25maWdfaW5pdCBtZXRob2QuIFRoZSBhYm92ZQ0K
PiBjYWxsIHdpbGwgYmxvY2sgd2hpbGUgaG9sZGluZyB0aGUgUlROTCB3aGljaCB3aWxsIHByZXZl
bnQgYWxsIG90aGVyDQo+IG5ldHdvcmsgY29uZmlndXJhdGlvbiB1bnRpbCB0aGUgZmlybXdhcmUg
aGFzIGJlZW4gbG9hZGVkIG9yIHRoZSBsb2FkDQo+IGZhaWxzLg0KPiANCj4gVGhhbmtzLg0KPiAN
Cj4gLS0NCj4gUk1LJ3MgUGF0Y2ggc3lzdGVtOg0KPiBodHRwczovL3VybGRlZmVuc2UuY29tL3Yz
L19faHR0cHM6Ly93d3cuYXJtbGludXgub3JnLnVrL2RldmVsb3Blci9wYXRjaGVzL19fOyEhQ1RS
TktBOXdNZzBBUmJ3IWlWLTFWaVBGc1VWLWxMajdhSXljYW44bmVyeTZzUU8zdDZta3BkbGJfR1c4
aHN3aHhjNGVqSm96eHFrVTNzMld6eFNpenM0a2ZkQzc3eXI3SEdHUkl1VSQNCj4gRlRUUCBpcyBo
ZXJlISA4ME1icHMgZG93biAxME1icHMgdXAuIERlY2VudCBjb25uZWN0aXZpdHkgYXQgbGFzdCEN
Cg0KQWN0dWFsbHksIEkgd3JvdGUgZncgbG9hZGluZyBmbG93IGluIC5wcm9iZS4gSG93ZXZlciwg
ZHVyaW5nIGJvb3QgdGltZSwNCi5wcm9iZSBpcyBjYWxsZWQgYXQgdmVyeSBlYXJseSBzdGFnZSAo
YWJvdXQgdGhlIGZpcnN0IDJzIGFmdGVyIGJvb3RpbmcNCmludG8gTGludXggS2VybmVsKS4gQXQg
dGhhdCB0aW1lLCBmaWxlc3lzdGVtIGlzbid0IHJlYWR5IHlldCBhbmQgcGh5DQpkcml2ZXIgY2Fu
J3QgbG9jYXRlIC9saWIvZmlybXdhcmUvbWVkaWF0ZWsvbXQ3OTg4L2kycDVnZS1waHktcG1iLmJp
bi4NCkFkZGluZyAiLUVQUk9CRV9ERUZFUiIgZG9lc24ndCBoZWxwIGF0IHRoaXMgbW9tZW50LiBJ
J20gbm90IHN1cmUgaG93DQphcXVhbnRpYSBhbmQgcXQyMDI1IGRyaXZlcnMgaGFuZGxlIHRoaXMu
DQoNCkJ1dCBhbnl3YXksIG10Nzk4OCdzIGJ1aWx0LWluIHBoeSBkcml2ZXIgbG9hZHMgZmlybXdh
cmUgaW4gb25seSBhIGZldw0KbXMuIFRoaXMgaXMgdmlhIGludGVybmFsIGJ1cyBpbnN0ZWFkIG9m
IE1ESU8gYnVzLCBzbyBsb2FkaW5nIHNwZWVkIGlzDQptdWNoIGZhc3Rlci4gV2lsbCB0aGlzIGhh
dmUgYW55IGltcGFjdCwgaWYgdGhhdCdzIHRoZSBjYXNlPw0KDQpCUnMsDQpTa3kNCg==

