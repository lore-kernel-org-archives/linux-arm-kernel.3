Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACF5CD4F48
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 07:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPbF3CSlFQmQPBdAkkbkGIJv62ZPeIi63yMWEzsfKP4=; b=oG7SlWsd+pM5RCw/MQATMyGvFc
	S3q8UMtOVjq/VFNcldwO0ew4indgO5Rk3RJ7oopqmqMG+bAxjToFvJJn67/Vxm97Z7rZaXSV2Sl7c
	p3hDJkCOGrtNdkf/8I+CK3RF1kMuFb8pTAh6l0TJ2PsialY/BZYo2qOmoaR2MixlBpKrR3lSJjXWC
	lbEZDBQqwvkud/E1Q8WG0Jamb3qRENlkIJhyY9Q0yTOVYisj55ShtdcXDdDS3PCszWgtQfU/tNwcY
	KCpNlIiR2ug8Sm9q46FGOvn9Eac+SJf0kPb6GSgJ1vh8rwemur9dgA9pmVrEFPZoPtOeG3Vu3c+nn
	7TkNinmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsbG-0000000Ee7q-04Ek;
	Mon, 18 May 2026 07:41:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsbC-0000000Ee6t-3hpg;
	Mon, 18 May 2026 07:41:16 +0000
X-UUID: efc836a8528c11f1afed4741b24580c9-20260518
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=hPbF3CSlFQmQPBdAkkbkGIJv62ZPeIi63yMWEzsfKP4=;
	b=SuA9Xunx+gy5pY5EG/t3V5xtBzebBo56lybCl+z6gorawSJ3biKS3Mb5NcfgmQSpDbY/hTr11tfdDP6U8TZmNmP/Fsp/aGtYuSOLh/9ZXLo0yVMKmvKhS8CF0OiBqFA+bXHwdSmOI2N1Uxq1OQBQwJgyUvuMhfvdtaUCVYF28FM=;
X-CID-CACHE: Type:Local,Time:202605172342-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14,REQID:7444c395-936a-4b9a-8745-cc8d19cd9e2e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:9091e75,CLOUDID:0f5c81e1-02d4-4065-accc-97789b7ab0e5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:1,File:130,RT:0,Bulk:nil,QS:ni
	l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: efc836a8528c11f1afed4741b24580c9-20260518
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <xueqi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 468997056; Mon, 18 May 2026 00:41:09 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 18 May 2026 15:41:07 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 18 May 2026 15:41:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bcow4TTN+iz7fy3x6n8Vp/epe2nTBxKMKUOYczbYXlBBWp2V91A6QumyHef9zl7DrmTDi7V1KJyrhg6uTB9S24z2Xnpqp1anVojVR4df1g9tZvUjzo7ONMoO8Zu7GiOGmAxWyw9MZeP7ntH6nZA9NhjwwwT5caYkfpvXB4y99heIBgDjs9bcT1ILaOx+denWXS1jhwj/KRFGT9J90eW3I4I4YfagISigqyfl/FxInpQAWfbmpmTmliDq4hdphsVT73/T/VBzSq8PX9PuZkx/TLJecnkiBw41DzH+NCZS6Fg1hoNa2sUWN2Zs01EXpcPCmztcJFs9dpaBt8pLo13axw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPbF3CSlFQmQPBdAkkbkGIJv62ZPeIi63yMWEzsfKP4=;
 b=WAux8LLxSI909gZQEP0AywSXc/5oxv6r4Bwvyx9bNLuVGaKwXgoYVSIm3qni6Lb0v2tOVp5VZI5Tj/7l0Fi/mawXezOv+fRBW4wgq7lFWccSbz+TFAKdZ9+BKlvKq/945tShoFupeZTVYXBuc8cjReRY7ktyLVXDFb8kkP8Ivp1P5JVElcOjxTuF+6AhE748CO2A6HBYZzd3f31QfD2YPyYkgc0c2cfUd6AwYHmUGJWH6eFQKCOtTaVCJ+K3S6yLlElddedQpAZ4XepIHApEig39Lrpryt0nQZ2EJAbNtV5Uu4uX+Q909bJhjFF8xGvBNV2Ari61Ww+S+bJkBbO/Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPbF3CSlFQmQPBdAkkbkGIJv62ZPeIi63yMWEzsfKP4=;
 b=NKlR/+UJSFQT3txDQaHnEkvcXaTvRFlpUmWqJ31ckHSWy5PHAALQk80V5TfHT4O5aqzKWUlaPu9O4fZAD1Xv8vTFRmFC0278DsjHhvRVCLNitFi0u8QQYiWcxPnQ+DeFE96TQ4fDUAc7Gk6U9o4cmXonyX6B7yhY7UivRxs9ft0=
Received: from TYZPR03MB6471.apcprd03.prod.outlook.com (2603:1096:400:1c9::8)
 by KL1PR03MB8012.apcprd03.prod.outlook.com (2603:1096:820:101::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.11; Mon, 18 May
 2026 07:41:02 +0000
Received: from TYZPR03MB6471.apcprd03.prod.outlook.com
 ([fe80::6c05:f611:5357:7326]) by TYZPR03MB6471.apcprd03.prod.outlook.com
 ([fe80::6c05:f611:5357:7326%5]) with mapi id 15.21.0048.010; Mon, 18 May 2026
 07:41:02 +0000
From: =?utf-8?B?WHVlcWkgWmhhbmcgKOW8oOmbqueQpik=?= <Xueqi.Zhang@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?=
	<Yong.Wu@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "krzk@kernel.org"
	<krzk@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?WHVlcWkgWmhhbmcgKOW8oOmbqueQpik=?= <Xueqi.Zhang@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	=?utf-8?B?V2VuZHktU1QgTGluICjmnpfoqanluq0p?= <Wendy-ST.Lin@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>
Subject: Re: [PATCH 2/3] memory: mtk-smi: Add a flag skip_rpm
Thread-Topic: [PATCH 2/3] memory: mtk-smi: Add a flag skip_rpm
Thread-Index: AQHbmWr+ThkPYzLV/EeJKX653FeCxLN777UAgpoKryaAAAYdAA==
Date: Mon, 18 May 2026 07:41:01 +0000
Message-ID: <932b23380cf23b340d4738b5ac577f850dc61ae7.camel@mediatek.com>
References: <20250320073625.25225-1-xueqi.zhang@mediatek.com>
	 <20250320073625.25225-3-xueqi.zhang@mediatek.com>
	 <46e0e1f1-e094-40f9-99f9-22678bb40d39@collabora.com>
	 <198865fb3184926d0b1b4e4855b5f863ad0d6a20.camel@mediatek.com>
	 <1571510c-e51c-40c6-a702-214bf77f9f4d@kernel.org>
In-Reply-To: <1571510c-e51c-40c6-a702-214bf77f9f4d@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6471:EE_|KL1PR03MB8012:EE_
x-ms-office365-filtering-correlation-id: 9f0cd209-c61f-4842-9f9c-08deb4b0cf6c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700021|11063799003|4143699003|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: 9WAiSKhz1mSHM2OuGOTboZzrNuRMQRvUR2u+MCzRrfB6MtDqN8uD+YPeysKiAwdx6PsaHN1H77AQvU56klp2EQ95fJYBFA/JoXAcPMIiTCMyKhXpN4YYUNh3YhuPpnZLEFNdwNmoVynaw38QJZHLmvj9P/3MfcG/444IW6yZw+iGN1NGMVqpicaGSbiUtBsNFFldgzpYit6eW9TSG4oZ4DOPJ9xv4S3azFl78sS1/cYoBgBd3wd3RymXPPJb1Ugv1SrGHehw+Hx4J6X4256dPlHTXhSprdP6hWAsV5BqZCjnG1UT11ATQ6KWfJVTVZ2uW9pbMjVPyigcv7YwFxNP5/I0i16j38EHVskDjhmiYNvsTzNOiGo+wkRle5J8XuG1ZjlIAr1H5vqlHqNEuSXMzKKDwTKetcCj5q5EQgtwx+xJODWc8GZKxpM0cO5IIgRG7AIwjTMV73ypgtRNeZCJG4W+BSFHVnQDzc0ekrsAMOnRKOX9e9/akW0CwPdhH53EhGOWcjcwnV75kQ43a8Ls2koD6lOflBmqz5ag3sXIRhPhLCQt6RjXSKuuQ3DA/nIFlPWpI1r3wOXfMkP+gvPr/FKAiXc4n776KzlKcxBNu0NhJ4o0WAQ1ZI5y/ckmSQ0V838H36HJNb64G1Hk0Ok47iqN31j5UIdz2sCt9BveuFQa5mEYW4YxgDMTtaMt9XlM0SpeV6Z0mF7t1UjOWayXTk8GxuuWE6BRlu/82QKw/h/PrZXxkrv3jCCeWHELTRbC
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6471.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(11063799003)(4143699003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dU5Ba1c5R01qcjdRVDdpSm4rYXpFYkJDdFM1VWFkYjBvL0IxSWJJM0h5dHYx?=
 =?utf-8?B?azZ0SUE4ZlJBRFlJNjAzRmZCb3ZPdDc0cVU2QlBKRlV2cCtNalhWQjRjdFc2?=
 =?utf-8?B?RlpyQUVIM1gxSU1XS095UmtNNTVldFlqZjFWUEk3aG5wdHN5Q1pMTEpqclNu?=
 =?utf-8?B?aVJ1SXl6Mlp3S2UyNzAwY0NEUHBmaWNEbWo1dU51VGw4KzBSZkdVdXVVM05a?=
 =?utf-8?B?QkhNU0N1TXRZMkNvM0dEblJvSTZjN3FtY294aGZ3Sy94NGpHVlAraXN1dEtN?=
 =?utf-8?B?NFEvTEZLVXNBQXJGZHp2RGVkUlNhUFpsOGIzd2Q2bjNIdFJweHBlYU8yWFFY?=
 =?utf-8?B?RXlVQmJEREJCemo3bUFGZGpHdjl5Tm9oRU0vVGEyNVlEN3ZIaUdqQUVMaGhT?=
 =?utf-8?B?Z3VMTDU3SVF1UVZKY2lQRGFsb1lkeGJuLzhLZTBVdzdrVnVXeElDYXBvNkNr?=
 =?utf-8?B?dnFpMlhxSnFER0RxeEd0enY1ekxsd0VLUVV3OGlKOGZuV21wdm16eHNhRGVI?=
 =?utf-8?B?cCtzTDBBd240WE05V09UcHByTEJqSzZOb3U1VEJNR1BpQUFsbG9PZFlFbno5?=
 =?utf-8?B?RjhWWjczUzVVeFBNa2g0Q0lOUkxZaG9TanlNa0ZxWGdheml0YVFLWmFqMnF3?=
 =?utf-8?B?ekhzU2JUUDBFZ3VrcTRxMERQZWxBMjhYaG9nSXZQbEhqWkU4MCtxaVBaVzdp?=
 =?utf-8?B?Um5KSWF0bnZDZWZBYU5xQU50cDNBaWVvNXIzM2FVRnI1NVVrZWFTWmZBa21h?=
 =?utf-8?B?bkdSUzBmSDJqcU9JWWZsZlg4REJOQ1dZd3ZVVU1LQlI1cVdQUkIra3UvMVRq?=
 =?utf-8?B?NTg3M1pkYVRqM1czMzV4ZnVacVlXbUNWU2NwUVpta0hwbVcwSm9YREZxS1hS?=
 =?utf-8?B?eHRjUWJLYUpQNlp0M1ArT3FEakpNakZHcTV0cmtjRGtLWUYvN0VPQ2E2TlI3?=
 =?utf-8?B?cTB6a29Kd0JKVzB6eUROSSs5NVlWRTNaOVNkQ1ZZejlscUlNbzJOdTZ5NzJI?=
 =?utf-8?B?cS9qcXN6V0lkaG5Ya3JCRHBLTnZIWlVoYnpWbkNFT1VsTGYxWmc0MThxZWh2?=
 =?utf-8?B?T2o3Y0lVa3BNZGNKdjZpWkVua0hoTkVuL09uZ3hwUTZSbUdZWEJSNU1mczhY?=
 =?utf-8?B?WmFqWVBwYmhSTXN1TU15YWIyM0dPWWFramJoTjJjS3lVSXB3cS9ETVliMzhO?=
 =?utf-8?B?c2dYMUtGaEVzZENGemNzdVdrVVAxSlo0bVdDZk01VjdOaEg1eHl2ZWFFUDZM?=
 =?utf-8?B?VmJDdEZzdVlERXdERXQySmVEdE80T1c1YVd3UGFyS3lqSHFGeHd2SHdqejlJ?=
 =?utf-8?B?QnlhZkVLV3JEYWlDdlBGQjJpWHhvRzF0L1BwUVNpTE5KZWwzbjJwcllSUWdM?=
 =?utf-8?B?WW12dno4emo1ZklDSjlOVFhGMnJJK1Zha0JSSHlnbXlGQkhCNzJWS1FDUnZP?=
 =?utf-8?B?WW96RHluT0RabDN3d05SY0lFN21QQUplTUNKYXd5QUkzaisvM1BYclpQbVlS?=
 =?utf-8?B?SDA1dkROTFJMMDBNRkIwMitSbnBHbkpudUxmVXlCQitqa3UrTUtTdXJ0Zko1?=
 =?utf-8?B?MTdyWGFGUnBkRWorUWMwUHgrZlJ2TmRyQk1BL3NkRTNLckt2UXJnTVFkNzMy?=
 =?utf-8?B?WXV3TEY3eHpRUDE5bWhqelRRK1VvUDQrdTFha2UwZ3Z3dmM1UWpxbVJtcXJz?=
 =?utf-8?B?dFc5M3ZVZC9aRXJXczdkL09FMkhhc2pGcnVnRnZUeGhQd0lyNFhGeWl1TEMv?=
 =?utf-8?B?NnFoWG5ZNGFEQmp3MWZSbkxFR0NlaUJYYndNQkxxdXp0bStJUDlUMjkvSTda?=
 =?utf-8?B?NHQrOGxOb2U5Qk9DYWR3K3pOcElGS2w4NXJUbC9LMmF3RVJNV2V2Slc2ZFEy?=
 =?utf-8?B?S1NueVUzbmUrR2wwZ0lvUTh0VHUxZmNlS3RQV0FrTU1RbGNqM0l5SWFTaktv?=
 =?utf-8?B?S1VwRzlheXJ3MjQ3c09MY3h5aEhoS1d3ZElicC9QMmJDemNkTFZhektkdTJs?=
 =?utf-8?B?U1lOcmZrVDk4b1h5OHUzbDJqeWlaVFhQNmFGVkh2S3lqdWp4SEdsbFdLdi9a?=
 =?utf-8?B?bnRxQjRqaDRtMDM5R3A4bzhXb0RtZXdxRy84bkk4WmlGanAxb2FmVGxrOUpr?=
 =?utf-8?B?U3ZuSmIwNEdmdk9NSXQvS2ExV2RFVHJhNmdLaVlNbXJrV1lUamVaT00xSnVx?=
 =?utf-8?B?amNaRU55YUh4ampXUXdKOTVUcCtMdmlkUnp2WkcySjFBckxibVZmUGI4eHho?=
 =?utf-8?B?Q0xLaFlxNDdYNTNPaVZRM2lhQnUraEJscnlOQjhSVG9WVmpuVWVOQkx4OWpz?=
 =?utf-8?B?aGcrMEcyVE9NSlUvRVpqdm13OVVvbGh5TDZ0WWtWc211RE1zVGMzUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <47C866EAE8B99747989ACF07942A3BD8@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: LLhHv9JgeMxr/8aHXYs4Mh/esA0Qdqi8BvXvOkZuaHZwloGopf0EeLWprJ7Y/at/L1gp67FpMf5H5/ZmsZQtdmQOJew3lXEFzEX7uc93Ue7g1YaOiMHVTmWq7bK+S7fiWmbbaiqEusYRrzlqHIPkDJY8XNYOJVeZ0/jCw5/nxVtgtODUZFrRNk8yoix03ZtVHd7nLTCBoBir9gT6K6TV0VF9NHIBS/aYrgcOMQ6hTlZTLmuPoKgbj4zuRAZ3dN65QJQ/o1zfbEQFSJ6SBvSN97mxM5Dvlb//UETChfUa3KTYaFOsP0D/MD/a9GrX+e8v0elD2nMkS0OPUNs/BA+14A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6471.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f0cd209-c61f-4842-9f9c-08deb4b0cf6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2026 07:41:02.0111
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IvQUYwC0zk/nM1nKa6M0D3onQo6SgUdIOXep4rfNF4kiKXYa8ETsjJMXSuLVUVUoeOu3M4A/VoTlEK3JvGDkL6pfdgxUMYU77ki6U72bWUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_004114_962074_DD42D330 
X-CRM114-Status: GOOD (  11.37  )
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

aGkgS3J6eXN6dG9mDQoNCk15IGFwb2xvZ2llcyBmb3IgdGhlIG11bHRpcGxlIGVtYWlscyEgSSd2
ZSBiZWVuIGhhdmluZyBzb21lIHRlY2huaWNhbA0KaXNzdWVzIHdpdGggbXkgbWFpbCBjbGllbnQn
cyBwbGFpbi10ZXh0IHNldHRpbmdzIGFuZCB0aG91Z2h0IG15DQpwcmV2aW91cyBhdHRlbXB0cyBo
YWQgZmFpbGVkLlRoYW5rcyBmb3IgdGhlIHJlbWluZGVyIQ0KDQp0aGFua3MNCnh1ZXFpDQoNCk9u
IE1vbiwgMjAyNi0wNS0xOCBhdCAwOToxOCArMDIwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90
ZToNCj4gT24gMTgvMDUvMjAyNiAwOToxNiwgWHVlcWkgWmhhbmcgKOW8oOmbqueQpikgd3JvdGU6
DQo+ID4gSGkgQW5nZWxvLA0KPiA+IA0KPiA+IEZpcnN0IG9mIGFsbCwgcGxlYXNlIGFjY2VwdCBt
eSBhcG9sb2dpZXMgZm9yIHRoZSBkZWxheWVkIHJlc3BvbnNlLg0KPiA+IEkgDQo+ID4gaGF2ZSBi
ZWVuIGRlZXBseSBvY2N1cGllZCB3aXRoIE1UODE5NiBBbHVtaW5pdW0gcEtWTSBTTU1VIGFuZCBT
TUkgDQo+ID4gcmVsYXRlZCB0YXNrcyByZWNlbnRseS4NCj4gPiANCj4gDQo+IA0KPiBIb3cgbWF5
IHRpbWVzIGFyZSB5b3UgZ29pbmcgdG8gc2VuZCBpdD8gSSBjb3VudGVkIEZPVVIgYWxyZWFkeSEN
Cj4gDQo+IA0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLz9xPSUyMlJlJTNBKyU1QlBBVENI
KzIlMkYzJTVEK21lbW9yeSUzQSttdGstc21pJTNBK0FkZCthK2ZsYWcrc2tpcF9ycG0lMjINCj4g
IA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg==

