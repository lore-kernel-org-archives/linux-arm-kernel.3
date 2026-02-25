Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56431F5543B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 02:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=80Tu4zNGuCwxovsU3J5ZUopRLp3eJfKaycLTh+B01yI=; b=e/7ALfsDwul9997Jzvy2h463s7
	S6guQpQFRSydykNsQo4a55MACodtK/egncYxlWYO2odPbFbESFOZqWLhtrVLDhPqXca5vboUMDAGL
	4UUb422ux3O5sEb4tuHWhddFBnfX2yH7518O89WSgGUj5yFhug7anKh87laQCIaIKkr4UdOHGq74i
	TbHPsd5CxfeOwTqCIo4AEMySV1d6xgC/3TYNvsQq40hPwRBOyeDE+ZZkNV43QkxxQTRYcDWafQ0We
	w46yF01dse8v9YITg4FYXZGXckQzW5tcaEfRPoG0/3UnIa5fKd4TkTMAxvpJZycPkhXwVdVPowiE+
	xgJTeUlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv4cU-0000000369T-3Usk;
	Wed, 25 Feb 2026 02:27:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv4cS-0000000368y-3HZK;
	Wed, 25 Feb 2026 02:27:21 +0000
X-UUID: 8103968a11f111f1ad39f32c34db0b1c-20260224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=80Tu4zNGuCwxovsU3J5ZUopRLp3eJfKaycLTh+B01yI=;
	b=G6kO80gcnjRBs1lpcrita3AkeD1CLg8wHIQ6zouUVAUZaMmlxODTC/7RO/CgSeAJ4HnaYy/P8WlB1OxYhlVVgIjtYY6mxBc+MVlx+EA/J3uW4x+1Ny3yZEEkpmX2kRvv6DMaGZEHEAlhoZWQ+Dkw3cVR3XuaERkux5+q0Af6r30=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:2ddcd58a-e2c4-4632-a3e7-6b74cf9ac395,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:88a8f9f0-16bd-4243-b4ca-b08ca08ab1d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8103968a11f111f1ad39f32c34db0b1c-20260224
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1121514508; Tue, 24 Feb 2026 19:27:17 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 25 Feb 2026 10:27:14 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 25 Feb 2026 10:27:14 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e0SadIK68yUq686RCDLK1XPeleAKf6jqRExR+kEjaS0b+aQ1r8b4JI1PcPbJzodqK29ONBcfK256+Y4NwwSD//1HKutJwEmT6w9YvfYjw5AT3ufl3uDJjI8jAVt9jjaWA6kqcXg9xIOSQbRvyLMRtsLzyTZiN92Se7+yFpczVOtPu12OQH6SXdnLEmWQKCMnHCsGV4U7/eWjpjXgJ83G9Nopv0VeGe7QGVUapZfBLSK/VzIWbwcdu9Tkb8+FB2HjZtp1mF3Q53B3KXeuCawXQFGhfHaAkdlSOKXYrxvPFMRLWsAeFTyRb8N9C9/IdTtpVQQ0NOnm99lPSRkFyw/GTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80Tu4zNGuCwxovsU3J5ZUopRLp3eJfKaycLTh+B01yI=;
 b=pzZlN8uEXrmZJhtjuDt/MQWp8G2/Hfzsh9GcFBcPNaQjfcwlsFvlna0uXp0QsxOg35JivFCq+VBVf3oqPVLEN6pgB1cHrn/u2zyQO4dph/1VHhC3Qj0ofQcRwmLvme46C4LbnM6+ueBldvH9OZA9tA7zyE/SgEPbu0yaeMakxwjjAzn3AyTXTYmBP9fCK1Si4WhK/Zd7I1z105X26VDIKLZ2Y/ejMatfhi8Y+AV3yiFf6bstWTelrHBxQ8rZoGr2sAtG9aic+ZgzudqbGXZ9dX3i+F5m/CiXMT6lmm3a+90QGFfVq7C/lqWZGcNyaImEKvn05ZvNUvpGDHO6MEcWnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80Tu4zNGuCwxovsU3J5ZUopRLp3eJfKaycLTh+B01yI=;
 b=FlgBdv1UmaDle0D1UIc2uA+WyN0kyoZ6mOpZZTaNyV8jFx1dagQCxUaOGUmleR5QUA7BwCjh2f4jl4/lAaD8oDIfj6YC297rMNcDcsZ/Vy3rCO9x3BGuUWO7Sosi9mGYbjBolAQxXp8Egjd8+Kzkv891ageOwqDlA8++DXUENzY=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KUZPR03MB9640.apcprd03.prod.outlook.com (2603:1096:d10:61::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 02:27:12 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9632.015; Wed, 25 Feb 2026
 02:27:11 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"l.scorcia@gmail.com" <l.scorcia@gmail.com>
CC: "robh@kernel.org" <robh@kernel.org>,
	=?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>,
	"krzysztof.kozlowski@oss.qualcomm.com"
	<krzysztof.kozlowski@oss.qualcomm.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
	"tzimmermann@suse.de" <tzimmermann@suse.de>, "mripard@kernel.org"
	<mripard@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"vkoul@kernel.org" <vkoul@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 3/6] dt-bindings: phy: mediatek,dsi-phy: Add support
 for mt8167
Thread-Topic: [PATCH v3 3/6] dt-bindings: phy: mediatek,dsi-phy: Add support
 for mt8167
Thread-Index: AQHcpOFMvBPfzA8LwE+UMae7K1msq7WSsruA
Date: Wed, 25 Feb 2026 02:27:11 +0000
Message-ID: <ea7015f3e3215b67dc5ca009fff428b72f8dcc5f.camel@mediatek.com>
References: <cover.1771863641.git.l.scorcia@gmail.com>
	 <92530e0a31eca1feb822f5c5fd4ac894937dd6c7.1771863641.git.l.scorcia@gmail.com>
In-Reply-To: <92530e0a31eca1feb822f5c5fd4ac894937dd6c7.1771863641.git.l.scorcia@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KUZPR03MB9640:EE_
x-ms-office365-filtering-correlation-id: ad8d445f-d962-4a85-3419-08de741561dd
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|42112799006|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?MjlaRW92Ly90bWFXR2oyM3hLN3NyQWdyY0ZJZDkyaXpUK0tLWHpWbFBzSDJi?=
 =?utf-8?B?UGdlMDRqUFlZL2dtSS9lMXpNOGlnSG5xTXhFNUFWc2thMXpiMlFyS050Z3lB?=
 =?utf-8?B?cWtmcFBQdU41S2plNkwzKy9xcnNPNTRzY2hObzFoaTFmN2FBSld4eENnVVNL?=
 =?utf-8?B?eUFZNWhrWVExM0RVZWhDeVJtVVN5YWFJUExmd3o4QVFFaGNjRHA1Mlhka1R3?=
 =?utf-8?B?VzZ2eTMzSU9hQm03MU9XT3ByOFczV281Z0hYbU5OenFIN1dNeVlvYSt6TGky?=
 =?utf-8?B?N0VhT2NMbjl3UEpPeEFwM2NFS3ZDcE9nb2tCR3lJcEhzVk1ZUzBDM1FZdkxK?=
 =?utf-8?B?aTJQcDRoYWFLY2lxTzZFcUJuQy9nSmFQbnU5RnhNMzZ2UGJ3eVJyZVpBZG1H?=
 =?utf-8?B?UllaRzJ6cjZkOTQ4ZzRnSHlsWjI5SmI3MFJDV1dOYlpHK3ZxTzJucE9OY1NK?=
 =?utf-8?B?WGNKekprQ3BaYXdKSHVTS29XWlc1TWNac0JGVGhJTmpoNVBiZ21jRVBQajZP?=
 =?utf-8?B?TTlVWERYYndVaGJqa1U0RGMxVnNxT3oyZUJTZzVmRWEwVm1KQ0dTcHlpUjNl?=
 =?utf-8?B?WWtoYTFsZHIyNHZPcnF6MWd2Zkp0MnZ2RmVmV21sQ0xKa1AwMXl1OTZ0aG84?=
 =?utf-8?B?M2orZmtMOGcvVlovN0I2OE5hK1h2STJEM281Vmlxdi9XYzRRbnA2U0lCWmpL?=
 =?utf-8?B?bDlKc1g4YzcvTmxGeGRYbUhjRzZFWXRNaUdqUnBINEpMeXdEcjJjOVBqOWFq?=
 =?utf-8?B?dk1XSmRJSll0UFBYSm9zcmFxOGwvTmFsVmQ0cFc0MG4xcEM4eEVOdm1CL3ZO?=
 =?utf-8?B?S2pmU0JlbjMwTytKd3V1ZXlYK3Z2dXJBdS83QTdOTEFvSkk4TXNLS0xxVmJw?=
 =?utf-8?B?VEMzd1kvYnVGWnBkZlVNcUpiQ3I1QTNVM3hXRjJjaFZSa2c0RFVYUGsveXpD?=
 =?utf-8?B?bHJHc3kyNUZpS2ZUYWdTWllTMkFPTkF4RWZUaVdiR2o3cHM0MStrN2FLcWY4?=
 =?utf-8?B?eWZkL3lDWUVWcm5KUGN5WElBZGtIMmVzUHRlSGtGTWNnZXBiakdlNzFLcktp?=
 =?utf-8?B?S1Z2M2lnYW40TmhLUmpuZFEwd09XMW5nS2RtbjVtWjdySS9rd0IrTUlJTWJi?=
 =?utf-8?B?dnd0MkloOS9PYmNTQmEzRk5SWnAyaC9OQ29Kc0RlVTNHckt5em5mQnM2a0FD?=
 =?utf-8?B?aVM5NjVsZ0dkL00vNzVWYTdRSDYvd1VGK0toMmVFbmRlSnl4aGNleDA5VlJ2?=
 =?utf-8?B?SGNzQmdvZUN5YVR5SXJoRFIrdS94dHEvSGhaZEZuT2tCZm1OZzVqaWNYaFFR?=
 =?utf-8?B?eU1EZjVmL0JIdU95SFUxWFBhNFBzck1UaU9BV0RPZTlYODk4bDdTdTZ4Vkgy?=
 =?utf-8?B?Q1BDZTI1bVhiNW05UTNlcW1ZcVA2MEJSRlhnYXZYKzVXaTVxY3ZiQ2RxTXk3?=
 =?utf-8?B?dnhOWUlCV3UyYXlsOW5uYnFOaU92NHV2ZDdCbm1zaktQTmY2V3NCVVk0SmxQ?=
 =?utf-8?B?MlZMMGtldy9KYTFtSEp1N1FJOXArVyt4UXdVT3dLSiswVjM2d1ppT1p1NjEz?=
 =?utf-8?B?T0FhMXJyQndSSDRYaEpOV3RMWW0yeGsrcHl2VExpbEZzeUlGb2FYcHFEZy96?=
 =?utf-8?B?MEU1VDk0TTlIaXlqQ1FlTVdtekh3UEFUQ3I0cWYwaUNEYVdZRXZhVFNaYzhh?=
 =?utf-8?B?WXQ4ajNmdCtBQ2RnbUdzc3JicTZ0S2N0NnFpU2dCaFBZVkVrbzdxZlpUbzJL?=
 =?utf-8?B?amRrVk9YejdoRHdCU1daamhPcWlycEhtSGt5T21Ha3UxMmh3cnZTbXFIQXFJ?=
 =?utf-8?B?czNxNzF6RHI1NUdmeWhVekRsQlF1emhUN3FBeTdoQW5LZVZRTmI1bDc0OC85?=
 =?utf-8?B?UVJlME4ramVoQ3M5REwyY0Z4TFdEOWFlaHJuWUc4cndRaXREUGNtTUxMRUp1?=
 =?utf-8?B?MFR0T3ZOTnMzeVR1MWN6dXZFRW1yVVZSNnp6Y01qZmtsSkFqS1c3bS9nRy8x?=
 =?utf-8?B?Q1AzQ2NJU0tRUlYyVnA4UThOelNTcFNlS21va3QyZWc1bnE3Rlg3cWIxMUIv?=
 =?utf-8?B?bjVVODhndStZTEVlM0lzVUpqVzVDc0s1R1hSQ25wRGNxMUUyYWZyblhGOGxN?=
 =?utf-8?B?WThaSUVONDZiQTF6Y0w1UlZjNy9ONkdzekE0dzZRMlRzNlVCTVpWb2dZY2l2?=
 =?utf-8?Q?pYe92cTm9eb910tKbps9Tt0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFJiaEJyb08yYnFkaGdJdW1tMkFKZWdyYmRlNUM1bXB0TjI1V1psb2tZdzM1?=
 =?utf-8?B?Y095Q2ZZYkNJcFpJdmVMSVNWNkMrTXNETzZqejBKOEw1ZmUyRkV3cS9vdGc3?=
 =?utf-8?B?NnVuWGh5bDhORnhMTXRVTW5waktwWW5QeHNSTDhUUkNPcG9yRmFvSk4xaGhs?=
 =?utf-8?B?QngvT0lUbENJM0NtcGRoUGdoeDI0RVBCSEFhMytINk0xOUhWRlF5S0QxT2hq?=
 =?utf-8?B?K2h4VTVnQ2dFQzB6Qnh4K2xMTXYzZjQwTk9ZQ20vTU1wYUNkK3VZZ3lMQ3JE?=
 =?utf-8?B?THZlQjM5ajdtc1A2azczb0dSWEgvR1BTd3hxYXNuUEV4MmlhR3d5RWUzUTJC?=
 =?utf-8?B?NjlHNWsyVDB3L2swOU9HUlRQQkE1RG95NlYzZG5BeHRDUENkZlJFUXNuM05F?=
 =?utf-8?B?aHNpMXNtK2plSStvTWVVa3oyMHJEMTNCQXEyZmQ4RWxGUkVFcDhwTkYxZnlT?=
 =?utf-8?B?VGkyYnZYUEErNm1ZK044UW8zVGxOb3JoYXE5cG1LbU9NY2ZJWVJUbDhRekl3?=
 =?utf-8?B?YkowQmExbVlvMnlha0h2bkdLUnRFVVZrY3VrcVUxV3plNjVjU1dvbmJ1VUI5?=
 =?utf-8?B?aXRDU3lleFozVnhOMzVsMHJiclhQTGdUanlBU1MvM3ROMHlSbjFlQ1hSei9G?=
 =?utf-8?B?M3lwZDZ5TzJZZEhSQUNOcFRQZ2pKMnMxSlA3dkhrUGZwRXFod3l4MmtUcWkx?=
 =?utf-8?B?QnZUcXFmalFHaytKbGs0NXEvOGVvSmFybFpLTzIvYzhiWjN4dndhTnRGL0ow?=
 =?utf-8?B?UDZ6OXgwd29QWCt6eS9PVmE5bHdVd21iWVRFa21BZGx3NGNvSmkyN3ZlOThE?=
 =?utf-8?B?d29sZFZFTENlODZpdElsTHFoTDdDL0hocCt5MFVxQ21aT3ZxZ1ZaSjRzMTFD?=
 =?utf-8?B?T2dSTDVJNE1COVRDbXJQLzZIZVpzME0vZW1wL0ZnbmNGbi9LS2ViSUd4T3Vh?=
 =?utf-8?B?eGwwQ0N1RkVQOCs3SVphSzV3eng0T1Nmd0RwbUNWem5rd1lOQTA4em9oaXRR?=
 =?utf-8?B?VW00dkNuL0JESk0zK2JTNFBnUnh1SVNZOWJOTTF1WHQ0QmswclljdDUwQ01O?=
 =?utf-8?B?QmhvMVRoa3lZRmVqWEVnWnZMUGdsMGRJcnNuTUY5WEpTdHVmWUY2QUNDYUN0?=
 =?utf-8?B?bjVOVDhkaktZYXpGMnpHVjhLL3F2YW1VOUMveUlvM0tUMjhieXlhUmp5VlQx?=
 =?utf-8?B?R1pjQWZiYjQ2bEZQZlRZbzVRcThnSFRtOUpFeExqS0FhYmQ4ZVFRcFY2YXcz?=
 =?utf-8?B?MU0zbjd5N0RCelhtbEVnd0Z3U1F0UlkzYU5jblJjMEFEZTFSTW9FbVNCK0JT?=
 =?utf-8?B?bG5hTGtnM3BmZ29kbjBwdEllRXhEUFVwRTE2bDVLVHVBa3VmT05yMUVQRlpS?=
 =?utf-8?B?V3pJS0g5S1FzNUQrNDlCU0RSVS9xaUNtblJpeU1zcUxGWjAzMnNHKzNqSnlF?=
 =?utf-8?B?bWpxQTlyeStSa1BpK1h3bmNjTXk0OFV5eTBtNWUrWnplUFFxOHEyMStycUp3?=
 =?utf-8?B?NUxWd2l1S2pScGxoQnkvZVZpQURnVjNiNlR0dFdnaTFPS1lPOWo1UUp1ZGVx?=
 =?utf-8?B?OEV0cEdocHJQKzRheGErY29MMVRwdXBjOG04NG0vUkJJYk1hTjdrMzNvUTl6?=
 =?utf-8?B?R3RjMmdoNWU3N1VWVDZIbVlMVmdkWWVSRHRlNkVWR2Nsbm9ablNZU0tmbUxW?=
 =?utf-8?B?bHdoeHdZMFpWVlp3R2xTVXdkeHRtc0tzckJXaEdKR2w1WHpOQjNzL2F6ejZF?=
 =?utf-8?B?bzNnWThXWC9VWElGQ0R3djdCK2hXdDZxZ3NsVHZscWhVR3ppeVgyVTBJemI0?=
 =?utf-8?B?c2VWOTFVWnBFaUhlRnFPL0h4MndQb3NobkJxdGFiV0NJUlFJVkJpdCtFQVlP?=
 =?utf-8?B?d1hkRG9XTitBeDBwejIvcHZ5NUZPcmt2dHhMTi9JYW1TRDEvWjlYQk1SalVh?=
 =?utf-8?B?N2FSdXYrY2FWR2drSTJ3Rlo5aWhxWDBMcmpOZ2xRRGQyalBxZVEwM3NWZFZ1?=
 =?utf-8?B?cjRiVlU3VjFLOXJOaDA2bHBEaEVHTHNORnRFc3dMSUo4SHBOc3ZZOW5DQnQ4?=
 =?utf-8?B?UXpNZVBPeW5GMXNsU0RzMEFpYTVZeGpaaWJLWXUvU0JFKzY1SHdlUGZZck1Z?=
 =?utf-8?B?cldoWkFoekxqSE5mZWZnbzdoUlhTWE00VStFMUNaYzlUUkFJYXRhZHJJQzVo?=
 =?utf-8?B?cVBaeVRac0dZS1dvKzVRV2RQUHlaM2RoR1pBVXpwZyt0UEM5RDN3cDFaYUkr?=
 =?utf-8?B?UmdQL0dqaUpDU2V6NGVyMFhVbVVkSTlvMm1LWUFjaWsrYVBqeUpPYmlDRGhV?=
 =?utf-8?B?elRFaHlLMXRWaGk4bUZCZGlTUW03ZFJ2Q0ZOR1dQN3JOTFU2TUhvZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C1D50009209FE8478D05CD3CA80EF2D2@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Y7hwaJVjR7pmv0cB5lGj8/O4vn2pfHLjnxjx6rz+wUQmQBT23zpnqEg4bFqCUkHkUsIZNdiJ8/G2vKv+5QDNE+IlquCtzLWwhwpcerfFN+yRMy6YGZVWmIHs6tzzuClbe4xnshZ7+bQQtjHt3HAqbkf6u0zOtuUac443RbH73UuIcEit5C7Il6quNzVgcT3F2soqsrc08hsdO6LdDFN9o/ifepY5ljrnNcHGDNEeL8bRBMGrVPm/lP6rgyvsZ3e3WQT03zYjNvP6oBH8Y5+cCtrMg+cElxfdqJcAYXLzZAhCD55XuwY9WLiMviWslfB6ge7W9RTAugRSDA7dHhthpw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8d445f-d962-4a85-3419-08de741561dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 02:27:11.8034
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7c107R5G/tTBWzDfywWDtyjqUH4UN0hIvnkkWSx46SFFpqDZEjCheWWhPoflUICHIn+LvLEAuwIRDw1nnEN8SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR03MB9640
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_182720_829919_7DB11694 
X-CRM114-Status: GOOD (  14.89  )
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

T24gTW9uLCAyMDI2LTAyLTIzIGF0IDE2OjIyICswMDAwLCBMdWNhIExlb25hcmRvIFNjb3JjaWEg
d3JvdGU6DQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhl
IGNvbnRlbnQuDQo+IA0KPiANCj4gQWRkIHN1cHBvcnQgZm9yIHRoZSBNZWRpYVRlayBtdDgxNjcg
U29DOiB0aGUgRFNJIFBIWSBmb3VuZA0KPiBpbiB0aGlzIGNoaXAgaXMgZnVsbHkgY29tcGF0aWJs
ZSB3aXRoIHRoZSBvbmUgZm91bmQgaW4gdGhlIG10MjcwMSBTb0MuDQoNClJldmlld2VkLWJ5OiBD
SyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMdWNhIExl
b25hcmRvIFNjb3JjaWEgPGwuc2NvcmNpYUBnbWFpbC5jb20+DQo+IFJldmlld2VkLWJ5OiBBbmdl
bG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJv
cmEuY29tPg0KPiBBY2tlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxv
d3NraUBvc3MucXVhbGNvbW0uY29tPg0KPiAtLS0NCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWssZHNpLXBoeS55YW1sIHwgMSArDQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcGh5L21lZGlhdGVrLGRzaS1waHkueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWssZHNpLXBoeS55YW1sDQo+IGluZGV4
IGFjZGJjZTkzN2IwYS4uYzZkMGJiZGJlMGUyIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21lZGlhdGVrLGRzaS1waHkueWFtbA0KPiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21lZGlhdGVrLGRzaS1waHkueWFt
bA0KPiBAQCAtMjMsNiArMjMsNyBAQCBwcm9wZXJ0aWVzOg0KPiAgICAgICAgLSBpdGVtczoNCj4g
ICAgICAgICAgICAtIGVudW06DQo+ICAgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ3NjIzLW1p
cGktdHgNCj4gKyAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgxNjctbWlwaS10eA0KPiAgICAg
ICAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10MjcwMS1taXBpLXR4DQo+ICAgICAgICAtIGl0ZW1z
Og0KPiAgICAgICAgICAgIC0gZW51bToNCj4gLS0NCj4gMi40My4wDQo+IA0KPiANCg0K

