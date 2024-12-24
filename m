Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E3DE7718D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 08:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5nuygfT/w1wIlEsR7U2D1+8LkIjKj/++m+IGZnHx3M=; b=bls6wJDFQlzyIxQDj/4/5E91zn
	UGnl32YuwYVRbOPPgqyKNEuovJrcfvsr5SKvMqho9dr5u5eVka9Cd2OXWVlI9FWygndQ3caOD9GmS
	8iexrYaFRiAXJHe5fzC3Lh+fJnY26jSlCNaNKOt2du0YHb7eUmj3+MURwbqfxzn25Ryus7hjcgKBE
	Yys6J2PGSKe2MR2VMPEnnf9MoutJZxm5mT5NWf4RMmBlkpBh9cW6ve3zjbsFV1DrHUx1zxYMwrte6
	zfrxYCS1URCAaCQsG1B6FBQhCKps5jro10X6ZOeW3yrJld8Woo5H1w0EcUM2LcqLrsgnmj7ZU8HNd
	G0GqzCzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ0OU-0000000BVXi-2lKH;
	Tue, 24 Dec 2024 08:35:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ0NI-0000000BVOU-0sYd;
	Tue, 24 Dec 2024 08:34:45 +0000
X-UUID: e9e963dac1d111ef9048ed6ed365623b-20241224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=G5nuygfT/w1wIlEsR7U2D1+8LkIjKj/++m+IGZnHx3M=;
	b=Q6UP7LKb6YV7jXeOrb6Q448FU7gGVU7J77udboJRofyK5gWYIOnHX56Gxd6+NAtHTvwfIvUKp8qqQR/gzd7tyUbe+BbUeCUDuck/SS14dupN5RGiTDl0zlx0fdwIvfa2yeoOzo7V/1pjFX31LoFoIB2/zCpaeZL8RRq5nDyBxRE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:3fb71965-c555-4f19-a703-5aa4b7209718,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:c467d036-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: e9e963dac1d111ef9048ed6ed365623b-20241224
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 616552290; Tue, 24 Dec 2024 01:34:38 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 24 Dec 2024 16:34:35 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 24 Dec 2024 16:34:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zs7XeZvviAtXeWmsfskYI/AhWDmz2D74ayo3+sjACF1Ebh3no7bV/9G/Sp0qzUJbZ9vguUtiNzYzgxkE/arSSoHKCpC9iorSeiv6IAzxNhKlF7fQEBCbjAKUJHfIfYpkQWuSe5NqxUtajt4PYaFfO6rWi/MdLm38MIXOoGauZsPVCcUxIlHXqvyTTxqqDmquopRoTMeCV1mdX3qwlJhG703DJSR5vrr85UmM9qJ5XuDk3Wjg+Wxr9SrmWrET574QfoG8VCn9Fq0Vk99/RhTToai0U239PF+FHFaMe3pnzr5z+Me43dI9CrCmvBhLhyoJafdfgTIoqJtBOqypi3BPrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5nuygfT/w1wIlEsR7U2D1+8LkIjKj/++m+IGZnHx3M=;
 b=p5h0n03bCQe97ShxR39jvBYV2T7uLMK7bGjc60dp8kbConrhapyGiJF9DcZaTVo2mKqB2GaOsch+Wn9MMcg1fTynxYoKMGInaXz3FuKxDG3LoOOFnTchmDLGSdCpoTEwAYlUxzlDCmHoe8GMUhb3PrzdKN7l/ejdNjhfhyiyu2kYjL3ESLAfMvprVF/X8kBIjwHcgb2VqXjz416CeNe+2LGHjqviqP+7otCQXcZTKZrLqRGChHYTnTQH7Kz9hXbCKVvY+4ZUOhciHZYJV6jgk2N8A9x9WE3mizQayEyjR36RxYy0nw+xhNc+ylrEF6gsC1+1WWF0wUFGY/YzSVvuZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5nuygfT/w1wIlEsR7U2D1+8LkIjKj/++m+IGZnHx3M=;
 b=XmZoFNpKqxshq5dGl1sHq6Ui0vtrxGO6CmOzT31V0pPxB/xN4UK6nm/FdAuqHWNcrCl8aNDmrdrKcfcwj82IQZg1njUJQePT47TNPKhCTt0uBOEmFl2Hji9PqF++0x1rsRdAOZ4U2RKVWIP+b3Mqyn+iEadhXwKRuvRnbzVId2c=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB8632.apcprd03.prod.outlook.com (2603:1096:405:90::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Tue, 24 Dec
 2024 08:34:33 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8251.015; Tue, 24 Dec 2024
 08:34:33 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "simona@ffwll.ch"
	<simona@ffwll.ch>, Alexandre Mergnat <amergnat@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"airlied@gmail.com" <airlied@gmail.com>, "sui.jingfeng@linux.dev"
	<sui.jingfeng@linux.dev>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "karansanghvi98@gmail.com"
	<karansanghvi98@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "skhan@linuxfoundation.org"
	<skhan@linuxfoundation.org>
Subject: Re: [PATCH] drm/mediatek: Initialize pointer before use to avoid
 undefiend behaviour
Thread-Topic: [PATCH] drm/mediatek: Initialize pointer before use to avoid
 undefiend behaviour
Thread-Index: AQHbNGWg5qUuRnOidEm5FFwseb6jorL1VIMA
Date: Tue, 24 Dec 2024 08:34:33 +0000
Message-ID: <fc9a381ef45100c76f26e9cbbc4a9febede54dd5.camel@mediatek.com>
References: <20241111-uninitializedpointer1601557-v1-1-7d03668e8141@gmail.com>
In-Reply-To: <20241111-uninitializedpointer1601557-v1-1-7d03668e8141@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB8632:EE_
x-ms-office365-filtering-correlation-id: b1bff082-112d-45dc-bd2b-08dd23f5cab3
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?K0JyUktzQUduWlRhK25kQTlHN0ltSnQ3dEV6WVBtblVsbTd0ZnA3NDk1NHNj?=
 =?utf-8?B?bDRPTGQrMVkvak1NTWo1UHlTYnZWZlRTTVMzNFQ4VW54RXNNME55WnF3TkJv?=
 =?utf-8?B?Wll1alNzVmRtWkVMNnJpVVM1enlON2ZtWjIvYVZDRC96M2NMRERVM2wrQU9w?=
 =?utf-8?B?Z25oNEJpMmF2OE5tL2tIMVBNcWpZZzM2eGlZaHE0cHRtTjdqc2dWVmFvSFcx?=
 =?utf-8?B?eU44OU1pR3RZQkdFeW9kb2N2ZmtVVUc1MFByVG1iZ2RzYnV1eXVGTVFuRVBO?=
 =?utf-8?B?akRsTm9aYW9MY2FINy8vcWFaUjNLSi8vRExnT2dmRXd2SjI1RFo0NE5kWjdu?=
 =?utf-8?B?emEyaWlkZW44ZS9yUGEwN25KaE03enYzQmtmelo1d3VKM0Jmdno3Z3ZVK2tU?=
 =?utf-8?B?M1lIN2dKUmhYeWJBd2VJQW1tM0lvQzFKU2JXVkZnT0RDQTJZeEU4NEt0OVJQ?=
 =?utf-8?B?Sjc5anR6eERhN2MxU0wzVzZ5MjVtdE1KcWFkVjZRdW95dFpXU3FZUnRGUTE5?=
 =?utf-8?B?dXRHdlJZSVFMcDUxMkJ5QXV5bmhxaDFkV1YzSXhPZjQyZ0tpM1lBcjNISTVy?=
 =?utf-8?B?UnRVTHdaNU9Vci9xak1mQ0JCVkZMbm5sNkJ0V0NuRjkydlhGYm40WTdNY2lC?=
 =?utf-8?B?bG4zTnhoR01aYVhOMUg5S0lGSlVJWHdxRG85aHBnamE4TTZUUmx4R2ZFMk5N?=
 =?utf-8?B?aFFBaHphRXVBc0U0WFZRanhWRStwcDMySGVob1B1aC9FYkFqSUUrMjJYbGVB?=
 =?utf-8?B?Siswd24zVjVpUnNJVHVCa3BTZElQSUhvaGFCKyt1eVpFUFZ6amtBa2Q2bXdM?=
 =?utf-8?B?QTNBNnVCNHJybHFEK09URlJxSTM2VTNzbUNHeFErUDFObnFpMUtoNktXMHov?=
 =?utf-8?B?VGIrNzhKV1A3MEtHZ2NMaHpFcWRQUHFzWVhGNFVaTkFIYlRKd1p3SVpvQUNh?=
 =?utf-8?B?QWxxN2U3ZjBaei9zNmFuTmFqYmpMdUZxMmd4dTArd216dXJnZTQ1TDFndWNz?=
 =?utf-8?B?ck0vRkt2NVU3UVZmcjlEZC9Ea2N5Slg0Um11NU5jM2tkUU10MzF1Y2YySXp1?=
 =?utf-8?B?SkE3eldNMVQ1S3p0b0poN1VlWXJ3ekNwRzFPSXBlQWJXVHUwc3JYOGVwcExZ?=
 =?utf-8?B?MGFuWmt4YVBheldsTVhlYVJrOU05dkR2KzJtNktEMzZXMVlOQ2swK3FibDJw?=
 =?utf-8?B?K3UxSGRvRTFuaENGMnA3RmdmT09kSytodnVhUmFBaGdPRWNZc1R5QXVTQzZN?=
 =?utf-8?B?Zk4vQ3pJU3VEZnlZMUZnL1ZEdG1ZTFBlTU01ZUsvRXYvRUlKVTZIK0U0M0Z4?=
 =?utf-8?B?R0w4bldwMC9QTk1Ib2FWS0ZDNVBVdmpvcnJSVmVUbTB5QjZUdUViWjBRSWNv?=
 =?utf-8?B?TlFjY21tSGxRbkRSZGxoOWlWVnd3NE5RT0RoZHdPUndyMU9pRkZ4UzdPeVp1?=
 =?utf-8?B?RDI0MUdrRWwwOUJwdW9xeUkwZlBXczhLY2t5Y2QxUEN4TW9mQThUSXJKdS9X?=
 =?utf-8?B?Q1BFNldYMzFqWWlwVjVOdWFBVVhYRzNiYTIvTVc5ZjVhcndlS2Q1NGVYRVdR?=
 =?utf-8?B?UkY4ZWR0a3paVnhmc1VVbnNCcmRNdVJsc1hYR3lkTitVWmtvc0cyQ2RwQXRz?=
 =?utf-8?B?NXdXUVhWYlZnU0lTWkZxdDdXN3BDZE1Mb3FvOGJWb1Nnd2VVVEgvZGpxeVNV?=
 =?utf-8?B?cHFtT3J3d0E1NktrVVUzd1dCdDgwYmFuNmNGVUp4a3RkRWp6Q0NtUkNtZlQz?=
 =?utf-8?B?QXpMZnhyTHdJeUxUMGwzM08wWWFxMDEvZ0hhMk54elJmaXBzWXJtNUpHdXpm?=
 =?utf-8?B?S29SS1ljckdocHA5WktNT050ci8xWVczWkpnRk83VlNJMGRseVVsOTc4b0Vh?=
 =?utf-8?Q?PojEY/UJfn1vA?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2lvL2ltckVZaUdJclFzUCtMZXB4SHoyVVR6UDNEbEtvbUdYcFFmcFJZeTdP?=
 =?utf-8?B?RDFOWmpmZnJPb3l5SUtMdnhVOHFPWENzcjVFanJuYTFvZzhObXJreG15TlFZ?=
 =?utf-8?B?RU42U1VBZUlzOVJKVWNINGxMVndvR0ZzS0NpU29kUDJ2RDJLVmtucmc4QUF1?=
 =?utf-8?B?eUllbUNlNXhjdGhsMjA5blFKaHVlOStzQ0ZJS2VqSHVITTZQK3VlWG5GTk1Z?=
 =?utf-8?B?S1NTQjYzSWFzNE96UWlUdjE4UFlrL0xDcDV2Z3ZHcEpHb0lYbmJ0TDFXazRS?=
 =?utf-8?B?enh3U29seisveTNINEtEYjYydUltZ1A3a1ZkZzNNK0xYRjR0REpyQzVjZU1x?=
 =?utf-8?B?NGdNWU4zZVQ1WGZKWE1VcVJ5OFNJMUIzMTFycGltdzEzaFdqWm04bEhRQlg2?=
 =?utf-8?B?Q1NXOWgzamdrYlJxeUFyVnRFS3BXbG1UaDgvT2FSWXI2V2F5UzcrV2xRR2VX?=
 =?utf-8?B?VE1DVysrV3ZjcWFtYUtQMmFmUnNnVjAzc1UvTUNrbklhalk2aXlPR0lxVEhi?=
 =?utf-8?B?bjVVaFFXOUg0RWRYK0pCZkJIcWtMbCtpOFAvT0x3Q3UrNlcxaHV4RW8wSDNN?=
 =?utf-8?B?c2d5SEpvbEtwV2hROU9zZjNzMHlDZUZFaUpXRmVsTXRhUVFCTWpGN2lZK3Vt?=
 =?utf-8?B?WGhwSC9HbDR5dW9lSzBZTDRnN0NvV2V2THJ2VTYwd050WjhpQWQ2Z0RRazVx?=
 =?utf-8?B?NU9zckZ5ckhzZW1Ta2wyWTc1emdnQ2ZTa0hQR0gyRVNxcDF2VjZmMmhrY3ZM?=
 =?utf-8?B?NVlNU01MaytxdEhUem1ZSEo4OTdnNExlQW55MlRCSWNLOXV3a2xqYnZvVjIw?=
 =?utf-8?B?SUZVOFlhdVA3NnBNYjJVdGdLV3MxRXhHWm1YeWFaZ0g5UG9jeUhYOTVmdTU5?=
 =?utf-8?B?eGxpMkZBaUNtd2JSUWVMeTlEK2ZqZ3U5WHdsQUhkLzR4UVJ2eXhubnpsTDhX?=
 =?utf-8?B?aHBndzl2aXJkZUpFWEhwQkNPVnJDY25XdXBHcGEvRkxaWktuWENkMmxOZDdH?=
 =?utf-8?B?a3RjMTNxQ05KQ1BCOWJUcm1tMW12RXF5UmZiL2NRM0d6RHY3WXRIOVVweHVu?=
 =?utf-8?B?Z05ITW5HTUwwWHg1aVE3NUpHa3NvMlpqcTFheUtGcDZua2FNb3B1S01VMHVK?=
 =?utf-8?B?cTNSWEpSQ0FMU24rM2RLNTExTWZTRWZWNzk2K01SbmdPWmxlNDVkMWYvUTN4?=
 =?utf-8?B?Vk9qejhwRkVYZVdkQXZNbTBUK3ZPR25rQW1zcXZTZjRXVzExWms4MXZWbWZV?=
 =?utf-8?B?T2xuMnhEV2lXZDJScDYzYlQxSTRPaFBoWGdQZmNON0hva0l4VWdtQmZkSEhH?=
 =?utf-8?B?TEFIcGhJYjJUMmtMWTFuL1pwd2FGRUFxNkJ3UWpFVjlPNlIwMEVnSW5YT29l?=
 =?utf-8?B?ZTF3SW9JZUhJOHZuSE5YVm5iWGVsSzhuQ3VvWWRZT1BnZGhOR0d6WE9iL1ls?=
 =?utf-8?B?a2hqUFFhbEpmSXZjcWsydmNNM1JTUktpQzZhS2JUbk1pVkIvVjhOTi8ydnFH?=
 =?utf-8?B?QXZFTjBlSHRHK21ka3FNdlpZTzFxek1LS3NmUGUrV04ySjVic3NRL2o2WDVs?=
 =?utf-8?B?VkNQenM4SDlxMTJTVU9VZ1lKblpCdy9HMnFYalBIUTU1aVF0NTJoOUlSd25z?=
 =?utf-8?B?KzRUbVRPUVlPaWx2Z2x3RU1OOXlneFVaSWdvQlAwL3NjQXdKSFNqMWtObnBm?=
 =?utf-8?B?cGVyM0dNUjZYUURscEd1ckJtVXN3Q2hCVEkzaVozQk9uNGZNU3JSTlNhMjZV?=
 =?utf-8?B?T3VwcGNFR25JRFA0Nkp4d3ZZSkpORGo4UzNMY3VwdEpCdk9YNTcrQnNFbUty?=
 =?utf-8?B?aUJWUGptYktrK3AxNG1td0E3eCs0a3dmYytWMU15QWYyakNHWHJKT0lsWlVr?=
 =?utf-8?B?M0hlVmc3bnljVHcxYmxEb1I1Nkh0Ui9lNytlSmd1bDUxMTJUbExyK2JuSndx?=
 =?utf-8?B?TE05d01pZVhVaEFYRG41OUc1YS93cVlSQkl3d3pWYWtQam1OSU1BSG1GaHVH?=
 =?utf-8?B?bzY5d0FWNFh1TU5KUEpCWUNkelo3MmdaNFlhOHFwZlZuSWFMNkhLTURraGNV?=
 =?utf-8?B?bkNuSE1YWGtlVWwrZ3N0OFRteUkwcVduY0g5WFU3MXIvNG5uTTJQT0pHdW9R?=
 =?utf-8?Q?6y7xcW51fE8nq9AsNHJeaxi4u?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD8605F72C7ABD4485EC206216628B52@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1bff082-112d-45dc-bd2b-08dd23f5cab3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2024 08:34:33.0683
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Lmkc6iuzs2QIecS9/rdLW8lUMlbFGNFetKtErtqIxPilCFlgig7c5Y6UGYVIWQWdSn00L6qyMTCPD/zFMkOtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8632
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_003444_288924_A043E6F3 
X-CRM114-Status: GOOD (  19.90  )
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

SGksIEthcmFuOg0KDQpPbiBNb24sIDIwMjQtMTEtMTEgYXQgMTg6MTQgKzAwMDAsIEthcmFuIFNh
bmdoYXZpIHdyb3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlu
a3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVy
IG9yIHRoZSBjb250ZW50Lg0KPiANCj4gDQo+IEluaXRpYWxpemUgdGhlIHBvaW50ZXIgd2l0aCBO
VUxMIGFzIG10a19kcm1fb2ZfZ2V0X2RkcF9lcF9jaWQNCj4gZnVuY3Rpb24gbWlnaHQgcmV0dXJu
IGJlZm9yZSBhc3NpZ25pbmcgdmFsdWUgdG8gbmV4dCBwb2ludGVyDQo+IGJ1dCB5ZXQgZnVydGhl
ciBkZXJlZmVyZW5jZSB0byBuZXh0IGNhbiBsZWFkIHRvIHNvbWUgdW5kZWZpbmVkDQo+IGJlaGF2
aW9yIGFzIGl0IG1heSBwb2ludCB0byBzb21lIGludmFsaWQgbG9jYXRpb24uDQoNClJldmlld2Vk
LWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+IA0KPiBGaXhlczogNGM5MzI4NDBk
YjFkICgiZHJtL21lZGlhdGVrOiBJbXBsZW1lbnQgT0YgZ3JhcGhzIHN1cHBvcnQgZm9yIGRpc3Bs
YXkgcGF0aHMiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBLYXJhbiBTYW5naGF2aSA8a2FyYW5zYW5naHZp
OThAZ21haWwuY29tPg0KPiAtLS0NCj4gQ292ZXJpdHkgTWVzc2FnZToNCj4gQ0lEIDE2MDE1NTc6
ICgjMSBvZiAxKTogVW5pbml0aWFsaXplZCBwb2ludGVyIHJlYWQgKFVOSU5JVCkNCj4gMy4gdW5p
bml0X3VzZTogVXNpbmcgdW5pbml0aWFsaXplZCB2YWx1ZSBuZXh0Lg0KPiANCj4gQ292ZXJpdHkg
TGluazoNCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vc2Nhbjcuc2Nhbi5j
b3Zlcml0eS5jb20vKi9wcm9qZWN0LXZpZXcvMTAwNDMvMTEzNTQ/c2VsZWN0ZWRJc3N1ZT0xNjAx
NTU3X187SXchIUNUUk5LQTl3TWcwQVJidyFob1ZsN0VRWUwzNnJnMnBuVkluZjJBTDZtNm1UYkll
QXNGeU91QWxmZGxTUk15dnJSX3ZVNENBdUl2MWg1Tm52R0VVd01zRVk4cXhEUThNZ2tjNUp5VG8k
DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgfCAyICst
DQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jDQo+IGluZGV4IDlhOGVmODU1OGRh
OS4uYmMwNmM2NjRlODBmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9kcnYuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
cnYuYw0KPiBAQCAtOTAwLDcgKzkwMCw3IEBAIHN0YXRpYyBpbnQgbXRrX2RybV9vZl9kZHBfcGF0
aF9idWlsZF9vbmUoc3RydWN0IGRldmljZSAqZGV2LCBlbnVtIG10a19jcnRjX3BhdGgNCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCB1bnNpZ25lZCBpbnQg
KipvdXRfcGF0aCwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBpbnQgKm91dF9wYXRoX2xlbikNCj4gIHsNCj4gLSAgICAgICBzdHJ1Y3QgZGV2aWNl
X25vZGUgKm5leHQsICpwcmV2LCAqdmRvID0gZGV2LT5wYXJlbnQtPm9mX25vZGU7DQo+ICsgICAg
ICAgc3RydWN0IGRldmljZV9ub2RlICpuZXh0ID0gTlVMTCwgKnByZXYsICp2ZG8gPSBkZXYtPnBh
cmVudC0+b2Zfbm9kZTsNCj4gICAgICAgICB1bnNpZ25lZCBpbnQgdGVtcF9wYXRoW0REUF9DT01Q
T05FTlRfRFJNX0lEX01BWF0gPSB7IDAgfTsNCj4gICAgICAgICB1bnNpZ25lZCBpbnQgKmZpbmFs
X2RkcF9wYXRoOw0KPiAgICAgICAgIHVuc2lnbmVkIHNob3J0IGludCBpZHggPSAwOw0KPiANCj4g
LS0tDQo+IGJhc2UtY29tbWl0OiA2ZDU5Y2FiMDdiOGQ3NGQwZjA0MjJiNzUwMDM4MTIzMzM0ZjZl
Y2MyDQo+IGNoYW5nZS1pZDogMjAyNDExMTEtdW5pbml0aWFsaXplZHBvaW50ZXIxNjAxNTU3LTk4
MDNiNzI1YjZiZA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiAtLQ0KPiBLYXJhbiBTYW5naGF2aSA8
a2FyYW5zYW5naHZpOThAZ21haWwuY29tPg0KPiANCg0K

