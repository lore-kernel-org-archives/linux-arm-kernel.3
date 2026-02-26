Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3BB2FC5914
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 09:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSC7YklpQNwmyYnQU0Ns0OxF+A+2WgfQLHA3YNtEwWg=; b=zGH6PhSReGfJjKhjvU/wHbDP/U
	TVVOULQLVjn8YkzZxTbroyxttUBm//m5TuDCSlbzOOKRcHSanWoLhHFb0hmST25FKIMX+N3C5W/re
	5wCY0MDuLQ+mOmfOEEc8A4n+yX1wdioiuPWHuOLpvsSsUYZf0jI7HCs42cy9LCccsSjUjbNAOMG4z
	n8GkbelKY4fMyXr3b5V2gRoNdLFvpRETck6y8xJDR+jemF9OA+SKKgAn/vT13J2rE9KZZ8obz8/W6
	xB8EMYzYtSniUnIHy7qUHwOJOwfqh22gUf6h9gB2M2IGFzj0vV4bQqFOxhD4ZQQ4RNbe1Nj09Fn/e
	5nzfCExg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXPz-00000005l2O-0Oa8;
	Thu, 26 Feb 2026 09:12:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXPx-00000005l20-0pgr;
	Thu, 26 Feb 2026 09:12:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To
	:From:Sender:Reply-To:Content-Description;
	bh=wSC7YklpQNwmyYnQU0Ns0OxF+A+2WgfQLHA3YNtEwWg=; b=mjt60tdSC0s8ECPFReeJ685ARp
	H20ABjpBFdT2LRIJGUipXG8ncSmS5vsmkufm8DfyMD1XxZx4ntyyfmZFcfZZzkQq1D3VgyX00kK+m
	IanJbIqdW4O2oRgAT8oZt7xoAJjWI1lbH0FRmts/3l6OH1vfvtU+/1lChNkzkH+ITXyKDpDaYI6AC
	bvbpU/QUEK5Nsz0LAZTSQgHp0J8ZbDBqAdbgegVIPA+IaQKyCt+KCehjBR0xCkjxjtz0pywz8XQEs
	LKAtvIM2ba9sE3aFS4s0+vua5vqW6kgrhg6oG98ZVJMSVFXRT2oePepOfaIc6McSO26eSqgCXgDGK
	JaOPgoYw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXPq-0000000AaMC-152X;
	Thu, 26 Feb 2026 09:12:20 +0000
X-UUID: 35ce7ad812f311f1ad39f32c34db0b1c-20260226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=wSC7YklpQNwmyYnQU0Ns0OxF+A+2WgfQLHA3YNtEwWg=;
	b=kkniPthw7OFTJw/v0JnapBGotoZSblyMv6e2p8M9hlZCB1h6A6WGDPIisyNWLkdlEEhNtPm7obNJsL3lwdNTZusVijORkALlJ3cchchA7TivqIgZY9LrxDpurOT8KBgrnW1AxRyn5li2FaH8/mSKA8w2D+Fn9z/SFBsZLo3xNDQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:fd68aca4-a104-4b3d-b9f8-b311f2f82933,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:a037a35b-a957-4259-bcca-d3af718d7034,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 35ce7ad812f311f1ad39f32c34db0b1c-20260226
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 527132701; Thu, 26 Feb 2026 02:12:01 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 26 Feb 2026 17:11:59 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 26 Feb 2026 17:11:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ebPbnuNy8klc+FkOgbSFEy78xkfAh03AGTq6ZOn3WGE8HfiJfxPwI69wM1oFKrqKR0k0SeJlPZ6jDGGowwhsey0IfSp1hGMrFe4bSpY9RjLh/TTOV14qJo/VKJwOHgM69EBrCKyJyfUfkp0yVkZphAnDYFziBIwGIiOl/nb3YeDV1HZwUFXyxd41tSRAHTJDrUROM1d9OIYlS4gNmAmRcX3gkOFk+EJG1x+27iQfAlcwYrS8Z3o2AFEmrYXyKSplC5Hi2bFfFrKnoczWNb5FscCHqub4LzV9/yfla1aaLiAt9YKgZ/p08eq3UpgzNMab4zK+fa/rJ7hZS00DSleNMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSC7YklpQNwmyYnQU0Ns0OxF+A+2WgfQLHA3YNtEwWg=;
 b=LPiC99ENVIM+52cBR6biUMjk8rtTcXPPKXbNEkBC477e2G/hkZKj2o13z4NrZmlV/MsGf1Q31EACnfe34zb5QrsBUFDfDi19Say0UyTFvg5cnn5eSJntX/D+jsg+wqOX8rGe86+msiK8xTn63bbwe2qHwsWzLQx09pm2raXmfc/GTB3BliOwIsL9UPKpNdv1myBVRa1eT5alPMBn1kOqSVMg1HK88Fa6oD/9Yz14vkqo7O2B/+JdK32Q5cv2uNyep6UN6HkvY6I6ND7KH3LsOH5058okQDJh4bxTpYk652iFYRN66B2GL8c2fO8xWuzAwlcavNMUwyuIZe/EGmq5Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSC7YklpQNwmyYnQU0Ns0OxF+A+2WgfQLHA3YNtEwWg=;
 b=TiOaIPKwYZQsMPzmAi8LLSR5P9FOtLl59ouvfi2Ku9NOEDPZYxSN0u2q1CvmQ6WOowaIRUkh6qX4UKZ/vRhe0iA8obWV+LhUx9wtQUB8br+ef59+/7AM7+8OGZflML//gzaGcQ2YB+wPKpSfDjpb9fAT3rFYL7MxKRU0bqhCCr4=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB7548.apcprd03.prod.outlook.com (2603:1096:990:16::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 09:11:56 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9654.013; Thu, 26 Feb 2026
 09:11:55 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"l.scorcia@gmail.com" <l.scorcia@gmail.com>
CC: "simona@ffwll.ch" <simona@ffwll.ch>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "airlied@gmail.com"
	<airlied@gmail.com>, Alexandre Mergnat <amergnat@baylibre.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] drm/mediatek: dsi: Store driver data before invoking
 mipi_dsi_host_register
Thread-Topic: [PATCH v3] drm/mediatek: dsi: Store driver data before invoking
 mipi_dsi_host_register
Thread-Index: AQHcpjrq0WAwaTNLPkyj3G10T0uBxrWUs3AA
Date: Thu, 26 Feb 2026 09:11:55 +0000
Message-ID: <c281ef370805709e40b05aabf729d68557d69eb0.camel@mediatek.com>
References: <20260225094047.76780-1-l.scorcia@gmail.com>
In-Reply-To: <20260225094047.76780-1-l.scorcia@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB7548:EE_
x-ms-office365-filtering-correlation-id: ccebd3b6-b313-4c72-95ea-08de75171689
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|42112799006|7416014|376014|366016|38070700021;
x-microsoft-antispam-message-info: CJ+EU/ASJBfrC0ml4ulNGIEWjWeyFfcVDTqmmB8M1r42oqzeevyyllClO5qFzIDNTAZj1hy7Q87MYCvRz+g4aTCxt0S2rA/iM7bthGWSxKgLhNo5sxG4iHOxI4Zvqvue35eEzR+l+U4nJ11Is5OB2yxJrhRd0IG16c4XbkbKt5quv8r1Od6+4JdWygE6+IYs3wOwcGt9e7NhD9CR7JGyHrANXD04+VjuEdeDAszfsqsu4LL3oTAKezS6NXwtc6zWhYK5nYrIS3Vvqx2C4JCVlhe/ifxjFXDrEDCieO4C3JEYPRkLD+kGjB1avzuWCFeHIOFY966U+pDaVasJY2CWDpIhaPfaR6TbBWz3XA7C3ld34BxY28/Kj2lhFpQY1IAR5JZq9Bpt8zAkZrCtNk+3NTXs+iDxlAV/x1hCY2x7sK550Kq0Rrht44OVWE8U/Xrj+mLSzPyMg8SQdcwaF2i6aFVL3WYxMZ5C+C9PwgSfBH3VRZeqscPOdJMyNrcYBcghU8tNRAHK6MiZpKxab19XJRbtFaFSFLJoYUnp9aAdJMqxyYzmBGi61RILobHn9xu71CfLpg+N5LR34aRqM+orEMPOh8ckqz2vwkle3KpfXf10SP+bON/a5slD3aJmMuHjmiqdbZJs7Au0St2WL90OymPdASKzJisiM99Fj6AfxETxSk4hdZbo2kiHyNiWCgb8OLj6sWyhAnS5X2U+Hjub39zN2imV2W8tV39Moi80ApEkCNUoCGgK65icpcjIymAviMOFfjkhgQuzb99R2CBdFHmlYqO9sJOTY+za/G9G3hc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(7416014)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUVUNXlmb295d2lOY0pIb25Qd0prUHhjOHNKYTk2TnF6clRjYS83SzZabkxT?=
 =?utf-8?B?QnpjeU1QNnA5TVd0MGNaT3BYcFJEQ3g3YmVJSkhmTHhIUGV4a0d4cHJwYThW?=
 =?utf-8?B?emdkRzVib29mUVMvVDBsTnR6Nk5vOFZJSmRQWnI1NkdWNWJRVVlXMU9oZDRp?=
 =?utf-8?B?WkQxNjUzRzhtSXNwVnprRTlzUTQrTTREd0NkZEhJcks0Q21wa25uSURSY0ly?=
 =?utf-8?B?ZGZiZmJiaHM0eUZXZVd3ZFBGQ0k5OUJweVh5cElxYndFcFl4VzB1T2o3aTE3?=
 =?utf-8?B?dldNVDV4NUx6RldiUU5LUmw4NHk0TU5DQUlwZEJDV0czd2xSV2pBd0xkUUNV?=
 =?utf-8?B?YlR4UmNIZm1HclhhUXdFWTJpcjRCdjlJaGZJcGNhdzZrWkxtQmk2Y1h0bXpp?=
 =?utf-8?B?YVFVMWk3UVJjZDNELzgxZlN3Ym1IVGQyL2J4dmJBNmcra3BlK2d3OEVzS1FM?=
 =?utf-8?B?N1dhb0l0QVAvZEloUVo2cUI5RGREVVBJdjZOMVM2ckdyQ0tHSlFseURycmVv?=
 =?utf-8?B?ai85REM3b1l3RFZwaVl5U2tqTCtvZERncjh4RTBIOGN3UzR0YUFyczVRL2JS?=
 =?utf-8?B?a2lMbHVudXN5MTczanNhQWdHZC94alRnWmxmTjhXNHdPR3ErRmM2Yk5UYXQ1?=
 =?utf-8?B?cGhnU2ZMWTBGelZSZXFrOVI3YUFCVnhlcGlRejZzN1VkcEdKOHRlNGJKTVpM?=
 =?utf-8?B?ajRiRzJmN0ZHdUE5WFhWNVN4WW5nM05GMUVzZWwvUHArL1BNTnI4QjZSMFI3?=
 =?utf-8?B?bk9EdWdNSDh5OTJLcmVwSUdlL1FLOWZVS3pBNndJaURyTFdYVUY2Wm5DOWtw?=
 =?utf-8?B?MGo2Z3J0S3N6MmduWFFrMW9xZ0ZEQlRXQTJsNzR5cFlzNHdBem9SakxoaG1Z?=
 =?utf-8?B?MG4yOTFDZHNZeWhIU1FqaFpHUzJOZS9oZklnWCtreWh0Z2QyMFByTm1ndnNF?=
 =?utf-8?B?MzRua0l5aGJxaUJ5a2tnMGNRM09pTzVLNWsxWVZYUS9YQnFhV25XdlQwRWNO?=
 =?utf-8?B?VGNYdnBFYXNRcGozbW1BTXNNdDdqanVjdHpKcXZWejVPUWFBejdPV0NHalF3?=
 =?utf-8?B?NUQxMnBKOE5aMmhBZm11dHY2czl0bkM1RXk1cW94RHVWc2crR1o4eWVOVCtY?=
 =?utf-8?B?VHMyTUdSamc4aE9ycnRSQlovaXJEc3c0Tm9qeFJ2NlhObWdNd1k1VTNiNjkx?=
 =?utf-8?B?cnZFR1U4QlFabC9OY2ptVDBhVktCdEJDMDdDS0w3NUhyWlM4UUZ6Rm4wcUpi?=
 =?utf-8?B?Tm5odTdrVmdlNE1Ib0hOWm5DYjdEdXdOY0M2U09aa3lZZXJwT0dJNGdhdG5r?=
 =?utf-8?B?VEprRlc1WFExS1Y4a2JjVXhXa3hLTWFNc3J5RmxPbm1NZjlNNDU2YmRZNndC?=
 =?utf-8?B?VmtBZ3lTK1FCN3dtUk9mNkR1Z1dsb1p3My9nOFBxUmZwUzE0TUVpcm5UY1Rt?=
 =?utf-8?B?dU9CTkhHNlgwN3FmSkdBVTliTFVqb29KNDF2US8yU29ib0loTlVHOE84N3pE?=
 =?utf-8?B?Vm8za0k2NEoxVU5QY0pvYU5ueWdOZUJtRzlGS1BmTWFYUVFUWWxlTThUY0pl?=
 =?utf-8?B?SjdlbTQ2K0d4OEpnU1orTjdKWW84bmI3VGFEaGxQMXFhTXRmUGZaWnplUXJM?=
 =?utf-8?B?aEJkY2VSUGpUeUtIRjdZczEyenJvTWdtZjZkdlNHVzZXc2o5UGdrUHFheXpx?=
 =?utf-8?B?cVpIdndpWUZwYWM0VHRaOXVkRjJLQWhhR3p3Tmg2L0NpV08yckJxcjI2M29U?=
 =?utf-8?B?TXNYVWpQaTBjbUlmVEpZdSt5eldtbWRkTDVLNUtGUFU5NGFieWpZU3FwQkJj?=
 =?utf-8?B?WS9RTjA4QVpwcExjRGhWbnRCOU5QaWRoeWZGVU8zbGttS2ovWjNQeVZSVGs1?=
 =?utf-8?B?eit2S0pKUVlzNkg3cHlHTnZmZUJ1L1EvVkRYTEEwQitYWnRDek5oYlBNTDVq?=
 =?utf-8?B?RWJFYmZtdHBsakVha2lycEwwd3E4NGR4NTdxUVJIYzMwL1NoRGhpZ1J1dnRy?=
 =?utf-8?B?M05lZXg3eHdNZ0tCRGtpTmZIVzg0ems3OTBtem1rVFc2QUJSR3ZKa1Z2WjBB?=
 =?utf-8?B?d2tObnhtZG1VSU9NWUhvYjdUMlRPakNyM3FEY3JQcHdhZGZ4T1VRUDA1aWxr?=
 =?utf-8?B?cXVoWjR0NTNqL3BnaTIvQTlKaE56N1Z2VmtOWWUyYnhqSzVxQWJERXh6bk90?=
 =?utf-8?B?dkZZWDU5aHpnSkdoMndyK25ZY3QwbjhmbDh4RUhtelBkOG5oQnhqcEFTZ1BR?=
 =?utf-8?B?VkFOa243ampaclB3NGlJT2hKSVJEajM1R09CZW9Xa0tCZi9wR1dMK3pHK3hK?=
 =?utf-8?B?aHp3dktrZEdnUVczRnhjREx4Y0IwZDZMTDg5eUZyVitWZXc3U3cxZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <915437D61CDE9E4187EAF02EE743592A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XB0OddKXrqhr9ACc0v0oOYZKIjWsQZbrt6PRurJiQhK4Cf3LtvPSIMjsr4xckmNEIdKO9mXjlfgKamamPzEhnYcYiOq5lel6TyKH30pITyGo/HUo4c1N8nPXdp8vECJEosSNUN/g3RdIqsK9kbgiN7OAk37n7Hc5L6bI+6DGi09qbHnbsaTbqtsNadNo0E3DVDZ4zd6gslqUS7BJ7S93oQi3r92Mzk7e8ZMS/L1GMuKF3YjAfpBdNfbN7bNMDhDIXBktj0/7JLz0bkkf3hCtquMD1tiZ32oDafdKoBwsm9P6dfel1C3fHl+fz3weYIu6R0BBCeJqRejheDuPq30XQQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccebd3b6-b313-4c72-95ea-08de75171689
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 09:11:55.5964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sXnZf/xk5ykdkEDKFK6H7PIihVPkl2iGM8yBWfFKsF32kn7UMqJp6H+Nu41DWuL6+o8dwbIVRUZWBBp65ojfXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7548
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_091214_633032_21B0B62C 
X-CRM114-Status: GOOD (  14.16  )
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

T24gV2VkLCAyMDI2LTAyLTI1IGF0IDA5OjM4ICswMDAwLCBMdWNhIExlb25hcmRvIFNjb3JjaWEg
d3JvdGU6DQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBv
cGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhl
IGNvbnRlbnQuDQo+IA0KPiANCj4gVGhlIGNhbGwgdG8gbWlwaV9kc2lfaG9zdF9yZWdpc3RlciB0
cmlnZ2VycyBhIGNhbGxiYWNrIHRvIG10a19kc2lfYmluZCwNCj4gd2hpY2ggdXNlcyBkZXZfZ2V0
X2RydmRhdGEgdG8gcmV0cmlldmUgdGhlIG10a19kc2kgc3RydWN0LCBzbyB0aGlzDQo+IHN0cnVj
dHVyZSBuZWVkcyB0byBiZSBzdG9yZWQgaW5zaWRlIHRoZSBkcml2ZXIgZGF0YSBiZWZvcmUgaW52
b2tpbmcgaXQuDQo+IA0KPiBBcyBkcnZkYXRhIGlzIGN1cnJlbnRseSB1bmluaXRpYWxpemVkIGl0
IGxlYWRzIHRvIGEgY3Jhc2ggd2hlbg0KPiByZWdpc3RlcmluZyB0aGUgRFNJIERSTSBlbmNvZGVy
IHJpZ2h0IGFmdGVyIGFjcXVpcmluZw0KPiB0aGUgbW9kZV9jb25maWcuaWRyX211dGV4LCBibG9j
a2luZyBhbGwgc3Vic2VxdWVudCBEUk0gb3BlcmF0aW9ucy4NCj4gDQo+IEZpeGVzIHRoZSBmb2xs
b3dpbmcgY3Jhc2ggZHVyaW5nIG1lZGlhdGVrLWRybSBwcm9iZSAodGVzdGVkIG9uIFhpYW9taQ0K
PiBTbWFydCBDbG9jayB4MDRnKToNCj4gDQo+IFVuYWJsZSB0byBoYW5kbGUga2VybmVsIE5VTEwg
cG9pbnRlciBkZXJlZmVyZW5jZSBhdCB2aXJ0dWFsIGFkZHJlc3MNCj4gIDAwMDAwMDAwMDAwMDAw
NDANCj4gWy4uLl0NCj4gTW9kdWxlcyBsaW5rZWQgaW46IG1lZGlhdGVrX2RybSgrKSBkcm1fZGlz
cGxheV9oZWxwZXIgY2VjIGRybV9jbGllbnRfbGliDQo+ICBkcm1fZG1hX2hlbHBlciBkcm1fa21z
X2hlbHBlciBwYW5lbF9zaW1wbGUNCj4gWy4uLl0NCj4gQ2FsbCB0cmFjZToNCj4gIGRybV9tb2Rl
X29iamVjdF9hZGQrMHg1OC8weDk4IChQKQ0KPiAgX19kcm1fZW5jb2Rlcl9pbml0KzB4NDgvMHgx
NDANCj4gIGRybV9lbmNvZGVyX2luaXQrMHg2Yy8weGEwDQo+ICBkcm1fc2ltcGxlX2VuY29kZXJf
aW5pdCsweDIwLzB4MzQgW2RybV9rbXNfaGVscGVyXQ0KPiAgbXRrX2RzaV9iaW5kKzB4MzQvMHgx
M2MgW21lZGlhdGVrX2RybV0NCj4gIGNvbXBvbmVudF9iaW5kX2FsbCsweDEyMC8weDI4MA0KPiAg
bXRrX2RybV9iaW5kKzB4Mjg0LzB4NjdjIFttZWRpYXRla19kcm1dDQo+ICB0cnlfdG9fYnJpbmdf
dXBfYWdncmVnYXRlX2RldmljZSsweDIzYy8weDMyMA0KPiAgX19jb21wb25lbnRfYWRkKzB4YTQv
MHgxOTgNCj4gIGNvbXBvbmVudF9hZGQrMHgxNC8weDIwDQo+ICBtdGtfZHNpX2hvc3RfYXR0YWNo
KzB4NzgvMHgxMDAgW21lZGlhdGVrX2RybV0NCj4gIG1pcGlfZHNpX2F0dGFjaCsweDJjLzB4NTAN
Cj4gIHBhbmVsX3NpbXBsZV9kc2lfcHJvYmUrMHg0Yy8weDljIFtwYW5lbF9zaW1wbGVdDQo+ICBt
aXBpX2RzaV9kcnZfcHJvYmUrMHgxYy8weDI4DQo+ICByZWFsbHlfcHJvYmUrMHhjMC8weDNkYw0K
PiAgX19kcml2ZXJfcHJvYmVfZGV2aWNlKzB4ODAvMHgxNjANCj4gIGRyaXZlcl9wcm9iZV9kZXZp
Y2UrMHg0MC8weDEyMA0KPiAgX19kZXZpY2VfYXR0YWNoX2RyaXZlcisweGJjLzB4MTdjDQo+ICBi
dXNfZm9yX2VhY2hfZHJ2KzB4ODgvMHhmMA0KPiAgX19kZXZpY2VfYXR0YWNoKzB4OWMvMHgxY2MN
Cj4gIGRldmljZV9pbml0aWFsX3Byb2JlKzB4NTQvMHg2MA0KPiAgYnVzX3Byb2JlX2RldmljZSsw
eDM0LzB4YTANCj4gIGRldmljZV9hZGQrMHg1YjAvMHg4MDANCj4gIG1pcGlfZHNpX2RldmljZV9y
ZWdpc3Rlcl9mdWxsKzB4ZGMvMHgxNmMNCj4gIG1pcGlfZHNpX2hvc3RfcmVnaXN0ZXIrMHhjNC8w
eDE3Yw0KPiAgbXRrX2RzaV9wcm9iZSsweDEwYy8weDI2MCBbbWVkaWF0ZWtfZHJtXQ0KPiAgcGxh
dGZvcm1fcHJvYmUrMHg1Yy8weGE0DQo+ICByZWFsbHlfcHJvYmUrMHhjMC8weDNkYw0KPiAgX19k
cml2ZXJfcHJvYmVfZGV2aWNlKzB4ODAvMHgxNjANCj4gIGRyaXZlcl9wcm9iZV9kZXZpY2UrMHg0
MC8weDEyMA0KPiAgX19kcml2ZXJfYXR0YWNoKzB4YzgvMHgxZjgNCj4gIGJ1c19mb3JfZWFjaF9k
ZXYrMHg3Yy8weGUwDQo+ICBkcml2ZXJfYXR0YWNoKzB4MjQvMHgzMA0KPiAgYnVzX2FkZF9kcml2
ZXIrMHgxMWMvMHgyNDANCj4gIGRyaXZlcl9yZWdpc3RlcisweDY4LzB4MTMwDQo+ICBfX3BsYXRm
b3JtX3JlZ2lzdGVyX2RyaXZlcnMrMHg2NC8weDE2MA0KPiAgbXRrX2RybV9pbml0KzB4MjQvMHgx
MDAwIFttZWRpYXRla19kcm1dDQo+ICBkb19vbmVfaW5pdGNhbGwrMHg2MC8weDFkMA0KPiAgZG9f
aW5pdF9tb2R1bGUrMHg1NC8weDI0MA0KPiAgbG9hZF9tb2R1bGUrMHgxODM4LzB4MWRjMA0KPiAg
aW5pdF9tb2R1bGVfZnJvbV9maWxlKzB4ZDgvMHhmMA0KPiAgX19hcm02NF9zeXNfZmluaXRfbW9k
dWxlKzB4MWI0LzB4NDI4DQo+ICBpbnZva2Vfc3lzY2FsbC5jb25zdHByb3AuMCsweDQ4LzB4YzgN
Cj4gIGRvX2VsMF9zdmMrMHgzYy8weGI4DQo+ICBlbDBfc3ZjKzB4MzQvMHhlOA0KPiAgZWwwdF82
NF9zeW5jX2hhbmRsZXIrMHhhMC8weGU0DQo+ICBlbDB0XzY0X3N5bmMrMHgxOTgvMHgxOWMNCj4g
Q29kZTogNTI4MDAwMjIgOTQxMDA0YWIgMmEwMDAzZjMgMzdmODAwNDAgKDI5MDA1YTgwKQ0KPiAt
LS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0NCg0KUmV2aWV3ZWQtYnk6IENLIEh1
IDxjay5odUBtZWRpYXRlay5jb20+DQoNCj4gDQo+IEZpeGVzOiBlNDczMmI1OTBhNzcgKCJkcm0v
bWVkaWF0ZWs6IGRzaTogUmVnaXN0ZXIgRFNJIGhvc3QgYWZ0ZXIgYWNxdWlyaW5nIGNsb2NrcyBh
bmQgUEhZIikNCj4gU2lnbmVkLW9mZi1ieTogTHVjYSBMZW9uYXJkbyBTY29yY2lhIDxsLnNjb3Jj
aWFAZ21haWwuY29tPg0KPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8g
PGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQo+IHYzOiBB
bHNvIGluaXRpYWxpemUgaXJxX3dhaXRfcXVldWUgYmVmb3JlIGNhbGxpbmcgcGxhdGZvcm1fc2V0
X2RydmRhdGENCj4gdjI6IEFkZGVkIEZpeGVzIHRhZw0KPiANCj4gIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHNpLmMgfCA5ICsrKysrLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
c2kuYw0KPiBpbmRleCBkNzcyNjA5MTgxOWMuLmFjZWUyMjI3Mjc1YiAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RzaS5jDQo+IEBAIC0xMjMyLDYgKzEyMzIsMTEgQEAgc3RhdGljIGlu
dCBtdGtfZHNpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+IA0KPiAgICAg
ICAgIGRzaS0+aG9zdC5vcHMgPSAmbXRrX2RzaV9vcHM7DQo+ICAgICAgICAgZHNpLT5ob3N0LmRl
diA9IGRldjsNCj4gKw0KPiArICAgICAgIGluaXRfd2FpdHF1ZXVlX2hlYWQoJmRzaS0+aXJxX3dh
aXRfcXVldWUpOw0KPiArDQo+ICsgICAgICAgcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgZHNp
KTsNCj4gKw0KPiAgICAgICAgIHJldCA9IG1pcGlfZHNpX2hvc3RfcmVnaXN0ZXIoJmRzaS0+aG9z
dCk7DQo+ICAgICAgICAgaWYgKHJldCA8IDApDQo+ICAgICAgICAgICAgICAgICByZXR1cm4gZGV2
X2Vycl9wcm9iZShkZXYsIHJldCwgIkZhaWxlZCB0byByZWdpc3RlciBEU0kgaG9zdFxuIik7DQo+
IEBAIC0xMjQzLDEwICsxMjQ4LDYgQEAgc3RhdGljIGludCBtdGtfZHNpX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAgICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9w
cm9iZSgmcGRldi0+ZGV2LCByZXQsICJGYWlsZWQgdG8gcmVxdWVzdCBEU0kgaXJxXG4iKTsNCj4g
ICAgICAgICB9DQo+IA0KPiAtICAgICAgIGluaXRfd2FpdHF1ZXVlX2hlYWQoJmRzaS0+aXJxX3dh
aXRfcXVldWUpOw0KPiAtDQo+IC0gICAgICAgcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgZHNp
KTsNCj4gLQ0KPiAgICAgICAgIGRzaS0+YnJpZGdlLm9mX25vZGUgPSBkZXYtPm9mX25vZGU7DQo+
ICAgICAgICAgZHNpLT5icmlkZ2UudHlwZSA9IERSTV9NT0RFX0NPTk5FQ1RPUl9EU0k7DQo+IA0K
PiAtLQ0KPiAyLjQzLjANCj4gDQo+IA0KDQo=

