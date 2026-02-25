Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8284F5543F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 02:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sF86GcUqIXAPJZboujCxbflL7szf619HZhme+zOctOg=; b=X+EvzpxKq7MO1Ag/6N19DXKJH8
	hs4REqjNRSgartTGKeeKWudWDi5u39thV3sWez7i+G1OQUC63Qw1pTbjX50lsJKpy1eso1H+WFy4U
	qjWl++vj0YX7wrvgzp7aAF3N851+oPbvoPkqtvLQHSy2yDROfNecOEHuaAy+3q/E9XxFtW5DtwiyP
	E4QzlhBEklvqXyOnsbKhAHfQk8QCSMCM35NuQdt8uTpb3NA/YRwnnA99q7AqUWot1tCV9DFUtTDNz
	ao60xd8e7JP0U8avUygxPK6YT7UxHJtZSkS51+OIZR6Bs7XsMPfVldaB+c2OTkYP380b5aW0qKoJ5
	uWK8tE9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv4q1-000000036jd-30nK;
	Wed, 25 Feb 2026 02:41:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv4pz-000000036j9-1xAN;
	Wed, 25 Feb 2026 02:41:20 +0000
X-UUID: 745d7fca11f311f1a16f0188aa809bee-20260224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=sF86GcUqIXAPJZboujCxbflL7szf619HZhme+zOctOg=;
	b=WForyiQec92BcPLasZsVPhnsi5bOezYOMYziOeyYYGKAcZvRnze5csEAHC0zPfTyn0Ex8gDM0jRrl2slo9lmnfr7hOxRGzqz0Th4whCJN4xmd+ZOWdES4/qYH8eqdJsjUNqgXrq5bEmHLpXRbwSkk1RXDMZnUR50NN1QBnjP/CM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:8e582d95-e604-4ff6-9e33-e9a7e1f87255,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:9388935b-a957-4259-bcca-d3af718d7034,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 745d7fca11f311f1a16f0188aa809bee-20260224
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 657031165; Tue, 24 Feb 2026 19:41:15 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 25 Feb 2026 10:41:12 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 25 Feb 2026 10:41:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mrXmBWUjfnDL3yt2t+u3/YSyuOWZgFqr+vi+N/jxbcPUj6Jz534zWeTtD24Yj06UaWCFbdVlSsIHtmuEKPiilFC+dcsSPOoZpP9UfrfDwjdkh/jz5xz6chdeX0FzqooDCJNNhpUId2MHP03zH9tk/NNdWHfpge/aCEH3KN7cvPg673kZUFrYHQCzEWv8ooM1+0deTuPaTBoyM5Xkdtl4FkIrToIEuEV6y7hn7ec7tja6DEU3IuLOUqtnFWQi8B2tptbDTWqO8TimS3WTAhlUwhzRMRwmqDH9T23JAZn06LVtAEzul0NU4r2/SN/55WOlMKIzHV0Ss9bl7Z4EjI/5xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sF86GcUqIXAPJZboujCxbflL7szf619HZhme+zOctOg=;
 b=bZ1pKMmXUx0a1vHes1HR09IDfizIm1ExjI4Hj7BJ1UA/hVyG0RscuF0Vc9OdpHf3qLEiUn6GTmthf8LsS++UBaSfsblQM8HWwwLLof7N0Nsm/S6OJfS4Mh3g7REjaGL7POwZ8f2MEJ0/ZtU2FhzT5VTiySB1wKbH/9+JsR8lPcQy3C8bwj9IPtrXRgGqmfp2jOAIVsRHltN9wnTVCzJTZIGS+OQp8FkTUa5HiE6A/kNbQhag0aFJgbcBGDbdgo7iIznhBQ2NDh2pzi9G18ULaKqOnSFv0gc87UkXcFB9ZIaRyiguHj35rzmC65fcNfyWOM/1HqM3DxROCEEbDYpc4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sF86GcUqIXAPJZboujCxbflL7szf619HZhme+zOctOg=;
 b=a3RMj0KIKxcdui23cOFzTSMcZ8I00Ab9kyYDPZDXOrkL43C6U57SI20oJgWBiWatQho9RwiUDTRvT1EvEAMHpGNiSzTqvJZGpwd3VltAWwZyTf3O9aAGR8Ac9Rby+iB1SriRp2+KvqYSWqB05ehdvaWepmbPEW1QU+BZaqMVRpk=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by PUZPR03MB7159.apcprd03.prod.outlook.com (2603:1096:301:111::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 02:41:03 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9632.015; Wed, 25 Feb 2026
 02:41:03 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"l.scorcia@gmail.com" <l.scorcia@gmail.com>
CC: "robh@kernel.org" <robh@kernel.org>,
	=?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>,
	"tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch"
	<simona@ffwll.ch>, "mripard@kernel.org" <mripard@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "vkoul@kernel.org"
	<vkoul@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 5/6] drm/mediatek: dsi: Add compatible for mt8167-dsi
Thread-Topic: [PATCH v3 5/6] drm/mediatek: dsi: Add compatible for mt8167-dsi
Thread-Index: AQHcpOFKeerDVVvn8keTXR6yIV+Y0LWStpuA
Date: Wed, 25 Feb 2026 02:41:03 +0000
Message-ID: <bc064717108de5ea1a8c98937bb03fd00794682c.camel@mediatek.com>
References: <cover.1771863641.git.l.scorcia@gmail.com>
	 <2fbf179c03c61f527e2583f9df4f97f6aaf3297a.1771863641.git.l.scorcia@gmail.com>
In-Reply-To: <2fbf179c03c61f527e2583f9df4f97f6aaf3297a.1771863641.git.l.scorcia@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|PUZPR03MB7159:EE_
x-ms-office365-filtering-correlation-id: 3a108148-5b9a-4ce8-9774-08de741751c1
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|42112799006|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?Rk9XRURRelFlQnJWN3ZFSVpmc1ZFS3hYbDc4QXZmaGFQL2VzSWhVckJ6MUdt?=
 =?utf-8?B?SkRubzFNUEZPUkNVZU5tNmpZSUZZUGZha0ljZXkzYytGalUyRjVTVmYzdHVN?=
 =?utf-8?B?cU55QlFIWFZyc29OZFBGbUlzMFJaWGU1SktGa2lpcEdQbXhBY2VIbEk4a05V?=
 =?utf-8?B?Nzh3clczZHc4OWlnZWswVmM4MStkU0d5UGdBdlVuYTIydm5QNmNHdHNqSnda?=
 =?utf-8?B?U1Z3NUNEOWNyWHRUVTYzVmJNSHdUT1B4ZWtRdiswb2JSYUJkNUV3eExJOXZH?=
 =?utf-8?B?dktmVm91L2xFczBJZjIyMW1lZDdobTNVTXczd2FtaDFsOGhqMG5XRGFjRDJj?=
 =?utf-8?B?cWorNENDVGpaZDVUY1ZUMkFhRUQ3NGlVRmt3a2pHMnQyejhFMjBMT3VoYTAy?=
 =?utf-8?B?Y3UreE56ejAyVmhPR1BwMFhCV1AzMU1acUFNejZicTdNbGF3RXl5bzA2aUx3?=
 =?utf-8?B?ZGdSRE1zMG13eE02YitZc1dQNnJFQjdSOWNENDU3K3pHeEJ0d3pwK04rREpr?=
 =?utf-8?B?VndYSS8xcVh5aGF5WUJjMW00bElPOWt5eDBYdUc1NmNPRjE3SmtvSUxRQXVM?=
 =?utf-8?B?amdnZk9LMnpnQXk5bjVYZ0E1aU4zUmVCOEppWStRUFlLRVlaRGRJNEJTbkVj?=
 =?utf-8?B?RlQvVkx4L2xEUWtmbEgxOHRHR1M3emttU0p4RlZSY1AwcnRlWDhBMGhmc2RK?=
 =?utf-8?B?aU1pZ1dsVk91VEI0UlJQQnpuNzFHMzRicHljL3pqMjdGZ3dXQjZWSU9hRnJh?=
 =?utf-8?B?NjFVeEpKMC9WdE9EbUVEaHpSSGJ5RUsxVk1pTFZNNUhWT2FxdXhISzlBRnY3?=
 =?utf-8?B?Z0k3bkdkY3Y1Z3A0RDFSaFVBREFvRjRQdDlnZ3hVUTIvN2NNemtab3pZUzFq?=
 =?utf-8?B?YzBFb1FuNUFkQ3NHSThiQjE4WUMwZ0l6amREMFhyamM4V1BpcElJeDNZbHVw?=
 =?utf-8?B?eGpNRklsTEk4VGgwclhkeEg0dzFyMElNZXhmL2ZHWVlRUTNkRjMvZEFCQXN0?=
 =?utf-8?B?UFhtUEgwMXdoWi9KMFBUTWIwTWFnUHgzNDZPUFFUQyt1UHAzMHNhVnQvOU9W?=
 =?utf-8?B?SXJsUXZhQXhpdjhWTTVMWThrNm9BdW5nRHR0aURDeUh5NTVNekc1WWF1OVBz?=
 =?utf-8?B?NUpDZzlJZzRnTnUvN0VHSk16emsrZE5XckdrK3lLZFpIQ1FBTlBMeEl0Q1Zu?=
 =?utf-8?B?VUUvTjFKKzNNVWUyNWY1ODREWmQ1RTd3dUZsRnNabFBzNmdITktxMFFSamdF?=
 =?utf-8?B?a05Lam9zTGVWRWp6eUlyUEVwaGprQ3ZWb0t5SnFhVENnaEdmTExkaERvd2FT?=
 =?utf-8?B?MTBoN1ZlSmcwRDZnZUdpa1U4ZTVnYks1b1R4Y1VoY1RKM2t0L1d1UE4vbDRs?=
 =?utf-8?B?UENCd3RlRzdwSXBhUE14NklSTy9lSnVBTWphZkdmN0N2WnpxM3hvMjR3ZGd3?=
 =?utf-8?B?QlVIU3dwYUpSWWxKWkdMMlduY1FseVRtMFJmd0RLc29mRW0wK1U3M3FBR05k?=
 =?utf-8?B?SGM1OUkrT3premw5WGtMZlFRcGM5MHQzdWVDK2kyU3VRNmFnWE5uMDQyVkNu?=
 =?utf-8?B?OWJVZ3VNM1NIaUlwamhMR2ZoaGhGc1dObDdKYUpmTzhqbGNwM2pUZEZqMlRP?=
 =?utf-8?B?R0VxTDRjUUhlYnMvUlFiUEhmSWova2l3Y0RlTEs5UU1tYW02ckN2N1RkbkRN?=
 =?utf-8?B?UEZmVXNWaHNNWmpySW4xeElpazVOYlMvU3JBWDg2aXZnRlI0K2cvQTBvbVpl?=
 =?utf-8?B?OUdqelQrVHNBVzlmdUluMXBGYjFraHY0T2tvTjZFTTF2aWI5dDVtcVRtZExJ?=
 =?utf-8?B?eEJ3WXErN2ZUVXZsZW9NNEJ5cEZPVEtXa2lqNTFpb3c2dG92QXJXQldxR3hJ?=
 =?utf-8?B?UjV1UlU4eXhzNU11WUppV2Y1eXhqa0dxWXh4eXhFdFB4ZnFwbWI1dVdrK2Uv?=
 =?utf-8?B?ZWtYZTNmZlVnbStLUHlJaFN6WlNBOTNvbkhDUUhCMURoT2d5TUVQWVZEVzdZ?=
 =?utf-8?B?Sis5Y1kwci9zeW00RmlyRXNqS1h2OTAxcXVaUlVnYzJ5WVJCZ1BMakZmZ3FI?=
 =?utf-8?B?T1B0UHpKVGkwVzNJNFltVmdpUUZVS1gvRXNEVUVSQmlVYmgyOGl3WnVhc0JT?=
 =?utf-8?B?SCtUU3N0eVBSNS9QdzltMXRKUHBaU01iMDliMUxpK25GSiszT3pJbCtnQVZ4?=
 =?utf-8?Q?0OoLZsWP69CeKmSOxiMPn6I=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1EvV3BRWi84dHI1QkpFdTh4Vnppd2tCck00ejBvaFoyRWhzdWtyUHZBZk9H?=
 =?utf-8?B?QVV2OEtUZTg3TllQU1ZYRlNZRytsUEs1RlkwZTZ5WHNZdXdUNGVUeTZCZDIr?=
 =?utf-8?B?K2FEVmllWFMvOVpQYmlXa2hUOEg5VjVTZm03dTg5MjVvZzl4SnBKSWRERUxm?=
 =?utf-8?B?Vk52WkQxNUorTEx5UmorMmZaYWtTLzVoeVZUN1E3Um1aaS91TkxPOFBub3RL?=
 =?utf-8?B?Ni8zQnNwS055eUVHdlpSUjhhR0s2enBEOEFuVFd1N2Y4Z2djcXBibDlOeURI?=
 =?utf-8?B?MmVKVEZJazNraFR5NUtYR2NzNlVPQTJwdStxcFF1NEJ5TEJYVTdSenBsUEoz?=
 =?utf-8?B?ZDUzamxJb2d3b3N2ZGNoOCtCMStXa0FtWXd5VS9zUm5yMFZMZUpSTXdFUGV4?=
 =?utf-8?B?M0YybUgwUXNiR1FISlB0Vys3OXovOG02WmNrVFBVVytaZXRQcnFtYWsvQ0Qx?=
 =?utf-8?B?S05JanlsNTA1Zlp4L2loeG41RGpFSENwWm9SYzNJL1QvUDRxWmpIQ25tbENR?=
 =?utf-8?B?YUxzcjJYcG5ZVmREODlxWjlqN2o2L2pWLzY3UG1MSXYwTzJSWXF4bVBRa1dk?=
 =?utf-8?B?WFVWanIzZ0pKVjNxVmxCY2o4WkNYaHVCcnlMR1cvNVBIWHV6V0lwWHdVSFR2?=
 =?utf-8?B?WWdZaWNkNlFwU0RmM2hnRGdoY1Vzc3dISDZ2dzZyMFJVUDl6bjRJWTNHS2xH?=
 =?utf-8?B?OTh6SVAreXdEMDRNUUtuY2hQREhWV0VMSkllV3RqUnQ2Z0RqR1VzWklJK3BC?=
 =?utf-8?B?cVVWYXJKUUtHQXR3V05lUDZpTzlYZm5TcmRTaWxNZENGQTh0YlRHMlI0cGVw?=
 =?utf-8?B?NHRMVWxMK0c2NHlJelcvYmk1U0gveEdiVy83R3N1WWRNZWVLeTBwcXRaYi90?=
 =?utf-8?B?NE5hakxiOWI3LzJDd1ZkbldqOEEyR09pL3ZxaW1SS2RZeHpDSGk0bVQ3YVh6?=
 =?utf-8?B?c1lnNTZRNXRGcEFxVnhsOG12T1pxd0JOK2poNUJ4clo5QXhJdWpicE00L2h1?=
 =?utf-8?B?SFFWQU1ZSC80dCtNZ1dERlBFTThNenhDeU1vRVZxTzI3QTRqR0JCQnE3Nm9k?=
 =?utf-8?B?akppRWdmWWo1dVk2ZzEyNFpGaHlSSWRCc1dOejUzOU5DMDhFbC82ckhMNUM4?=
 =?utf-8?B?SDhFd2NDWTRXZEU0U01XWmsxZTJCWDE3K3ZuTTJud0RaL1ZtNGdPM2kxR29u?=
 =?utf-8?B?cUNmeE95dDljWTBrT2dMbm50K09Fcy9HbGlnZXowOEFRZ211bHNJUVByTkxn?=
 =?utf-8?B?SkppNURwMkx5VkN6MnFXbGZJUUlWSVZwaVozVWdtVGY5eXF1MnowL1M0ZVdR?=
 =?utf-8?B?K25WMG9neVNpM2hDWlJTM20raTNoY3l1WkxFcisyTEJBdGt5NkpwdTdVL01P?=
 =?utf-8?B?QzBXdVp1TWxrNDBMenJGM2p2cTJFbEU1YUhuV0piTURuVTZlbFdPWlZLTmZB?=
 =?utf-8?B?UE9PNXh3NTVXSTVEVnUxd0Nxdk1pMTZBSFJMYXdLclkzemxZcFhQb0xlMENk?=
 =?utf-8?B?SldQQUNiMk1QaEU1Mi95YnF0Qi9rNWVOd2Q4NkJmaGttTVdZRFBXSk4vNUk5?=
 =?utf-8?B?c283Yk5mWDd6ZGpiWW8ramNaTURLUlZYSXBCdjVHWlNXcElTazczSWVJZTRV?=
 =?utf-8?B?ZjNkNk1pNnJ5Z3ArQ24zSGxyOUJQMjczM2FQUDdpdkx5eHJFN0RmcC84YzZt?=
 =?utf-8?B?QWhBdVBmd2hwczhIRStIUGsyNEsrVWV0dXVvU0xCNTdTSVRvWFRERkxEWHFu?=
 =?utf-8?B?b1dEWklvTWxxQmxycGRQSm5MTStvRXV1NU5HellzSkJFS2RGN2QwdVk4WURT?=
 =?utf-8?B?MTZBdXpYdEZjcENvQlJXZEUxMUYzNlZ4YjdNWXpzbDBvR2NLcXR4eUpRazBr?=
 =?utf-8?B?TjkvRWpGQ0E0Qk9MbHkxY2JUNnFxL2Y4MGc0R1prbjN5Z1B6U3FnMmZFNUJl?=
 =?utf-8?B?cS9lWUZaeTcweGJ3OWJTZnQzWlFmMkNaWld4TVBTRytLQTdvbHV4OGhkeTJC?=
 =?utf-8?B?UU10NnIxaEcrSlEzdVpGVmNpREw4SmdKc1FjQ255dW5pNUtNREhLNGJQUFBF?=
 =?utf-8?B?NlhEUGhnbi85RnZPQmdLWVlYdmZlbG9HdnUxUmhSOEJiYjU5RkE3ejF3N2ww?=
 =?utf-8?B?R01FRGY0Y05waWlrWjRqL3JRaDZ4ekVCcUcrQmxtZ3gvOCtPY3lmWFJ2VHY2?=
 =?utf-8?B?cXA3K2I4UmVvbFF1TUZrZkVMc0djVjZGcjFtbzhQMGNIaTdPNlFFRkRncHI0?=
 =?utf-8?B?eGtnSmhyOUl1UEc3NVZITEp0WXRHMnA5VWZXNzhvaGlBdFUzWjBuM0plVkVF?=
 =?utf-8?B?V05lOTFEcnYvaXN3Q2VkaWJaaXAxYU4vOFJGdjhpUXZyMlBQUElWQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D605CE72D2C72A4298D19A2EF9561AAF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: tidcGHRNlX7SIjX9fj3hYY7u+ZfcKP3Zo+6Xv0s77TW5l8jdMNVFBW4o3MCl33AzfOoRUZju8Aln73K1pgcHhesIKLExtB9L8Xt9piElxHudoFpClUm5aruHXj3Yev/Z7u2L/IbMkTzU5jCSG3XXsArDgYJmM1rwYYYE/b708WAs7b0SAxQ8wZaQZnlMQdBR1JWnm+A0bUfBJ8yVUj49OQz4aQRL0iUOa0CAxOuBzFD0jn44mOeb4nGhNP82C0e3STq/J0lksYYicNNTD/49aC6mO6fGjfoBui8kAZ+Nd2IyvKeWJ36V2eddQm+E7J8ngLcLa9lPMhvzeMwAFMugmg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a108148-5b9a-4ce8-9774-08de741751c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 02:41:03.7848
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JGKnZMyw6Z6ubW9AUiR9MIOUDYvM5Ve53ag9IdAsECMqlA+wPpKtvHwYHDgTx+8Ta7Ann64/IpolDhmtlJ6f/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7159
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_184119_541753_99025020 
X-CRM114-Status: GOOD (  16.87  )
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
IGNvbnRlbnQuDQo+IA0KPiANCj4gVGhlIG10ODE2NyBEU0kgY29udHJvbGxlciBpcyBmdWxseSBj
b21wYXRpYmxlIHdpdGggdGhlIG9uZSBmb3VuZCBpbg0KPiBtdDI3MDEuIERldmljZSB0cmVlIGRv
Y3VtZW50YXRpb24gaXMgYWxyZWFkeSBwcmVzZW50IHVwc3RyZWFtLg0KDQpJZiBtdDgxNjcgRFNJ
IGlzIGZ1bGx5IGNvbXBhdGlibGUgd2l0aCBtdDI3MDEgRFNJLCBJIHRoaW5rIHRoZSBiaW5kaW5n
IGRvY3VtZW50IGFuZCBkZXZpY2UgdHJlZSBzaG91bGQgYmUgbW9kaWZpZWQuDQpJbiBkZXZpY2Ug
dHJlZSwNCg0KICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTY3LWRzaSIsICJtZWRpYXRl
ayxtdDI3MDEtZHNpIjsNCg0KQW5kIHRoaXMgcGF0Y2ggaXMgbm90IG5lY2Vzc2FyeS4NCg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogTHVjYSBMZW9uYXJkbyBTY29yY2lhIDxsLnNjb3JjaWFAZ21haWwu
Y29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCAxICsN
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RzaS5jDQo+IGluZGV4IGFmNDg3MWRlOWU0Yy4uYWQxMGU4NmIxNjFkIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMNCj4gQEAgLTEzMDEsNiArMTMwMSw3IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RzaV9kcml2ZXJfZGF0YSBtdDgxODhfZHNpX2RyaXZlcl9k
YXRhID0gew0KPiANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a19kc2lf
b2ZfbWF0Y2hbXSA9IHsNCj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10Mjcw
MS1kc2kiLCAuZGF0YSA9ICZtdDI3MDFfZHNpX2RyaXZlcl9kYXRhIH0sDQo+ICsgICAgICAgeyAu
Y29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNjctZHNpIiwgLmRhdGEgPSAmbXQyNzAxX2RzaV9k
cml2ZXJfZGF0YSB9LA0KPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTcz
LWRzaSIsIC5kYXRhID0gJm10ODE3M19kc2lfZHJpdmVyX2RhdGEgfSwNCj4gICAgICAgICB7IC5j
b21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4My1kc2kiLCAuZGF0YSA9ICZtdDgxODNfZHNpX2Ry
aXZlcl9kYXRhIH0sDQo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODYt
ZHNpIiwgLmRhdGEgPSAmbXQ4MTg2X2RzaV9kcml2ZXJfZGF0YSB9LA0KPiAtLQ0KPiAyLjQzLjAN
Cj4gDQo+IA0KDQo=

