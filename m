Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC18EE83042
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 02:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MUvz9JbbfYErAW0Hb/BaAeaj1zyY0aQFE43cHFrrE3g=; b=viPxbl8PrYrZMjr7g3eB+0Z6rk
	bm7i0Cep2gnY/nugJeP3M6WselSm25h7bewl6qP2cw+pcbwHsMb47qHBlzGZOpBDQ4M2SYClFZidE
	A7Yw2T23wjCws+m9J+rxI2CTgJN8IFus6dD6w8/BJECye57imWKjYf+I3VVX6nflNvRDNmfJ5LmxR
	zPcyOMjO3A34hArGTtJS2hvnNA9cVZw3/GKo2c9OHvzq6ILk8IovUE9HnoTVIe4k51IjW4PnQhcZz
	1h+oah5heDw0dF8v+JJfWn+u/m2WHKoRefT66T2RIoTiAJ/okEyriXwmeGxWn4lQbBtDhBlSVTw6x
	ldt7HVqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn62b-00000005uts-4Bg7;
	Tue, 03 Feb 2026 02:21:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn62Y-00000005usT-46GL;
	Tue, 03 Feb 2026 02:21:20 +0000
X-UUID: 0431a13400a711f1a16f0188aa809bee-20260202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=MUvz9JbbfYErAW0Hb/BaAeaj1zyY0aQFE43cHFrrE3g=;
	b=FV8ccyKcwlzpJhJwhmDRqCgoxVL6B1to67pCcWFLUZ44q40ttqpiilei6jMDKffrJNC94tqGdrmGYCY6QeDbcwef74F3Yr18II09pGlHdALmj+XllVE5i6W1T+OXdiaih2YeenmNqZ5fGeRV/N7gy1r87llUd2rNPsixcxmUsHU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:84fe9f87-1e07-452f-b091-8001949b22f3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:b11a3de9-ef90-4382-9c6f-55f2a0689a6b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0431a13400a711f1a16f0188aa809bee-20260202
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 486926862; Mon, 02 Feb 2026 19:21:15 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 3 Feb 2026 10:21:13 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 3 Feb 2026 10:21:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JRQ8CgSmepc+rBOwzldSnDZVgZF976bPTQZNdAagm7d5taLDML1UeVhxKQ8kZT+5cmcSULSUi0vEgpTnRZMySKuhxVNgm+xIfvFr9E8x1tCEOfnQw642nk+T69JNznjezwel2fQxlA7frdlY+zaW9pep8wL1l+JDkBlVsWZE8x+xDV0JgWRPu0xY5yu5Pk2l0m4LJZbhO9wWnOGKglUPLMHgYL7EaPIqZXxYGWgWpQjLTxdWSrBpn8oWAmmO/oYz1Y5x/DVZogARSAKt5fFnOsfXELudpooA42EDtz7htSQmU1j8I+F1N84wHwxyoCAFy8+MF58AreycLCoq33I7Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MUvz9JbbfYErAW0Hb/BaAeaj1zyY0aQFE43cHFrrE3g=;
 b=WISLWEZHgU7kAqXGCh+6hJ7U/grwbK6auVBp+9cWIoNZwFXXy8SRdIEQvzG1kOFBEuYVnRjIq/RK9vUPk0rYvfUQDPxvWKHLBssZdgDHp0/5ufgFl/qGlZb/r5GvaZOu9zScTs3eZ+zYYI/q5WpmRj6QZMbfEjMYrqm8wTZAASqho3BPUFIjce+vXFIzUJ4RwJuENQ7QjbybX67uSCypN9oX4p4oWx7Gcy0/yqgz4HNK2YE/NfKk+9++gtTBmG9ICQk6BvXsLvLPp+VU2Q75SloRa97u6tk3bXa2iMLtKPokXnTeTrmH6CUJWNMiKe65BIVLUJKVrz0EHaQj81QnrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MUvz9JbbfYErAW0Hb/BaAeaj1zyY0aQFE43cHFrrE3g=;
 b=YpqVMZDEjlYwnV6QCt75LNx6SuxbXm5DnmXoSVM3HDCV1K8RRzm9MH7oQtHHzeRpi3bHGLV6/LD/YynTzqygtu/zeZVyFSgajfK2EpWvo2jT/eE1iKZYgfgvk1gya7GvxpnNTTv9WHWHo5QycIqXkpVKc2o6FyJ+VKCM37kanu4=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SI2PR03MB7263.apcprd03.prod.outlook.com (2603:1096:4:1bf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 02:21:10 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 02:21:10 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "simona@ffwll.ch"
	<simona@ffwll.ch>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "greenjustin@chromium.org" <greenjustin@chromium.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, Nicolas Prado <nfraprado@collabora.com>
CC: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Daniel Stone <daniels@collabora.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [PATCH RFC 4/6] drm/mediatek: ovl: Disallow AFBC buffers with
 width over 1920
Thread-Topic: [PATCH RFC 4/6] drm/mediatek: ovl: Disallow AFBC buffers with
 width over 1920
Thread-Index: AQHceZU0bz/CrPf9ZkGdTjuiflzEEbVwdFmA
Date: Tue, 3 Feb 2026 02:21:10 +0000
Message-ID: <22c471af2206bbef5715a28b735a05dbd95bced0.camel@mediatek.com>
References: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
	 <20251230-mtk-afbc-fixes-v1-4-6c0247b66e32@collabora.com>
In-Reply-To: <20251230-mtk-afbc-fixes-v1-4-6c0247b66e32@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SI2PR03MB7263:EE_
x-ms-office365-filtering-correlation-id: 205c785d-0928-40c5-f6aa-08de62cae543
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|42112799006|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?UzFEdFpjM3JVVmlSdENTaitwZG5LUmVYTVUrVzBqZTRaK1RNeTJyN0tCejhG?=
 =?utf-8?B?OS9YTDBZM1grOUNQOVNwS0EyK1p1M0poRGdqdlU1RG5ZQzBLRkI1U2UzUmwy?=
 =?utf-8?B?dmE0SU4xdW4yQmJ1aEpxRjF6c2hHZllkMG5FUVRZaGtuVitWM2tYS3pzQk5w?=
 =?utf-8?B?MDRWRncvbEkzTWZhMXNtYVFlTExqemZjRnFFZUErcE1hT1VRdG85ZlhxdEJC?=
 =?utf-8?B?MkpndlZ1ODN0Wk40V0VFV1JLdGQ1cGZwU1VoRmVDR2xaeTYyRmw5MFoxY2xD?=
 =?utf-8?B?UkQrUkdLQXBuZ0xxcGxacHhpWFF2ZFhKM1Q5SHNKdk5NUTlLc2NXMGI1Q2RZ?=
 =?utf-8?B?NXRqWlU1UXNUTVZ2ODV0NTNyYWkzNGRXU240dGxDa3JNRE5NZ25lakFmVnVX?=
 =?utf-8?B?RTVOck1DYS9HcE1WRG81S1dOVktQNk1tOUl1cDd0dGM2Q2Z4ajJacWdTalA0?=
 =?utf-8?B?Y0xzU2QwSEs3YTBtQTdLNVdLMU45YWdRRHVkWHZrUWJlbXN6WHBETEJWNlBo?=
 =?utf-8?B?RkhzVG9CL2JjMDdKTWdpLytxR1NOWEd5ZDFGRXcxRjBWK2g2aS9PejhEaFRT?=
 =?utf-8?B?R1ZGOFc0ZDk0WWdRYTR1VmtNOXlpTzk4T2RyczBZU2d5cTZtYi9oSHdlcXBF?=
 =?utf-8?B?TGNlR2Y4OThXa2hxbVBUaVUyeWU0cEo0a2dJYzZNKzBVSmZPSWNQNndTMzJV?=
 =?utf-8?B?MXBwaGpJeXhsUlgvQmEvMlhja0tuZEJlN3k4dDMrOFlsZWJXbXN5R1dFdXU3?=
 =?utf-8?B?ajVGWGM4endhbDEveUczcVhySU9JL0VsR2FJWXROcEZkNVcvOGtZRUdLT1Iw?=
 =?utf-8?B?c25hS3oyR0RwWXZsUXAzajRXMFB5OWUxdzBOYTBLeWg0Wk9CcXM5NTNlVUEx?=
 =?utf-8?B?TFlBd2kwV3Q1OXdTSTJLQk1xbFI3K2lETGtJY01VVDFCbC9keW1wS1pqY0xy?=
 =?utf-8?B?anBLU1NtZVdJZjh6ZlhvMjNObDIyV1QyR2pqK2t2MnV2K1p4bi83aDBXVEJD?=
 =?utf-8?B?Ty8xRUVLQ21RdWZ0VUVHNDFNZjU1bG94aDFJN21QdnJxS25VNEhvc3IxdSt5?=
 =?utf-8?B?VCtBZmlKVGxla1c3ZzJHZGVHN0xsTWRWczNzdTZzWEhXeXJoOXQxSVYyWUxJ?=
 =?utf-8?B?ZlZSY3BqYlNhdkZKQTIwNGFCcGlQa0NkNmd3M3lkMHI5OHNybXVKRVFXZU1k?=
 =?utf-8?B?eTU5QlV6eXkxQk8vRlcvbEhKemdiZ3JMT2pEV2VpSmdLWG5xaTVVWHdQclZP?=
 =?utf-8?B?Yjg0am1hK1ZWWDBYYVcyQVI4aHhyaHB6UnlFR0RhMzhWaFJSNUlCc0Y0K1RW?=
 =?utf-8?B?TERBaHpWZUZmT1E5YnJzcGdHY1RMRnhBNzBUNG1vVldsQk5hMy9mcjRMVnR4?=
 =?utf-8?B?Z1ZNUmw2Sk1jTWo3UzNPY2JvRTRkMyszVXhrVFI4QlVCK2VpYkJKMjQ5M1Zm?=
 =?utf-8?B?Ynh0VTY3bGp3NWFzTitZR2p2d2Fyc2FxOVhSNEk3eHdScWhMbFZaVUFoRURI?=
 =?utf-8?B?UzdZbW4wUDJEOFpCOC9kZ1FSS0Mvc2Z2K2kvQkZRNmRZSEJSVERacmQwOXVO?=
 =?utf-8?B?WlEwTkUzOVdpSU1UaXAwTDlrNjhqd0F5R1dWVHg0bTRaZ2l1SVNFMTJyaGJL?=
 =?utf-8?B?QUkrbnRPU1N2M0YwYWZSWFU5VFpRa1RzNSs1aDRXNU1QOW8wSHV0VVcyUzZy?=
 =?utf-8?B?bldsZnhwVGU4dGRuWU9ubm04aHVPcnF0S1J0TitlSkJXTHY3KzcxSGdZRFI5?=
 =?utf-8?B?SmtaWmtObngvOVltNmtONGYyNzI4cTNQS05WbnYyMCt0UXBDSEdNSkJGZFov?=
 =?utf-8?B?OWJuL0ZaUVNZMnYzL0EyOUdNbEpaSVVQUXJZSmRRbFF1Zmk3TXREaENxcnRt?=
 =?utf-8?B?MlRoR3F2em5RYWVlOENFcE5xUnZIT2twUDA4c1kwQWtGenU4ZEtwMnZSVFFt?=
 =?utf-8?B?Zmh1QW9vczNRMmJHLy9FV1RrMzhaczByazlTV01zQnNYdjB1ZnprZ0dERXlE?=
 =?utf-8?B?WGgwZTdZQi9BWXJqQWlLU0ZJbGRWdW5ZeWhmRDg2MkZWTVlDcTVNQk1DYzRH?=
 =?utf-8?B?M3ppMFEzUzlSRDRaNExaMnY4RUtZaTdCWEk3dFZxKzNVQVg4MkZaRnRpdVQ2?=
 =?utf-8?B?SmxoQW8zamxPR2NrOVV0OU1MRDNsZlo1MisybGNHSVVjcTBpdVM3ZU9sUW9L?=
 =?utf-8?Q?MjD+djaQxhMk0YG8h4dVcFg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(42112799006)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SERQUDlDMjlUcHNBZHhZVW9GQlhVbkdDUllOTC9IQU1QRWk3QU1zVWxQb3Bh?=
 =?utf-8?B?K1BhZVFXNkJFa01XeE1CbXpEbVAvV3hqL1poTXZjTXFxbW56YnZSWjBQTGNB?=
 =?utf-8?B?bnNtWWU5YjZEaVFLN2pYMEl1WmlnTXZsQkhicGNoYVlsOFVNSjlWSHZjUlVE?=
 =?utf-8?B?RXIzQS9BUWFtSkswTUI0a3hGRFpQM2Zud2UyaEtRb0lqZXdkSHFOS2dodVQ2?=
 =?utf-8?B?Nm1xNHpaZEpkVmFkVHFVcjNnWS9kZStxcjBWemwxU0xpbnVXbG4xM1BmbWlY?=
 =?utf-8?B?L0QxeWNOZW0yVlZ2RWlxa0RJZWdEZ0p6aUIreXhFVE9oMTdOUi9kUndUNlN6?=
 =?utf-8?B?K3BNZ0QvaWtXd2trS0EwTzkxL1RRS3NlYUpsSlNRWW50U1VUSFRmNjhnRVVL?=
 =?utf-8?B?Z1QvVG5xVlNsaktSdzUwMXo2VGpydFZjU00yQlJnRERaRmNiZDVvUHpKSDgy?=
 =?utf-8?B?NzJXWjhEWmlmVzFYN0Mvdm9udmthOWd0T0JEUVgycjZqaEFVYUFGMzVPWXZH?=
 =?utf-8?B?ZkQzQ2xZc3JGeHFmY0g5QXdLdHQyYUpJL1FzY0pkRTFtYXE0TmdIeDh0RG91?=
 =?utf-8?B?dVNTdytkSmZaeHBqTktNQS8zM0RXZWlFVnlRNFlGR3hNODhBTkd1Q09pNGx4?=
 =?utf-8?B?NFlqVHVQaUc1OTZaVzRVem92T1BQL25VK1BIeDh3QVZXeTE5TUJ4dHhEQ1py?=
 =?utf-8?B?THc2bi9XSitRNGs2bThDUzBoUE8rTkp2V2VsWTlhbHU0WmhmY0tYQlVMclV4?=
 =?utf-8?B?NFdJYVQyNSt5NlZjUy9uQStoUWdLSUYyQWJZL0JiTS85d3c3ZnUrVklJRmxo?=
 =?utf-8?B?MStyZ0JsS2pTYWxGakVmUlJYWlVQOEJEbzN0dXlKdnBaWDlKUi9zYy8rY3Zk?=
 =?utf-8?B?ZjE0Y3RRRnU1QWVzS1RZYkF4Q0ppTVBtaGhaajJFS21oWER4YmVCalJoU25O?=
 =?utf-8?B?bFpncEhkY0M0bHB0b0pITnFCT2VRZlhLenBoWStDZVdWZEF4aVZYQTk3Y0Ju?=
 =?utf-8?B?b0hlTmZRbkd4UGpkdnpBd0NMM2hBRXJXZWZ3aXR5aEtNa2xoVkU4QTVjZ2o0?=
 =?utf-8?B?QzU1MkRUNy91RGFqRzVJY05ZM3diU0tWajVRUWVjS0hmMnY1d0syd0NJaWx1?=
 =?utf-8?B?Mkl5QW5GRkY1NnJWWTVoWFF5YksrN2QvYmNuMmVLdkxiQUpRMkNpVzM3NlFK?=
 =?utf-8?B?Y1VvSGk3NTU5SFhIcURud2daTmd2ZFd1b3pPZ01oR0ZLQzdMOFhobDhpaUlx?=
 =?utf-8?B?cnBUNE8xSEExTkF3eHBHS1N1WUp1RDkyVytrRUczQzFaaFpQQ2dCYmpvTUor?=
 =?utf-8?B?RlZMM0VzN0gwdDJVeko2azRVdzF5ckUySUdMT2cweFJLcEh3c3JtUkRselpv?=
 =?utf-8?B?KzNyaDJ3NitDRndpMXJWa2dTaFNYL3VVUGRJM3pIREhZNkNEVzJQUXdFVGxq?=
 =?utf-8?B?blA5dHV5cUQzanM4OFRQYkU5RWRUMTdtbmUwZUJYK2tYNEY4WHd0dHhpbmk5?=
 =?utf-8?B?SlByMnF4NjY2QlArV1BobzF6WmVOSGJQZTVNVUFwUU5PQkwwd2pMTVlJcVhC?=
 =?utf-8?B?RUxtRTYxdWhZNmNKa1htTW9xZ3dQQlhURkJwSkZWYUpQWm01Rk05ZHhidkpn?=
 =?utf-8?B?YnpnQVdIQUwwdkgvNjNkcnQzWVNDbXVrVkg5L1FRakVlaTc2amttZ2dnTFJI?=
 =?utf-8?B?dUg3czBvVWZyajQ0SHJiZUl0OHVEd25BRjljOWRtRVhUay9QOGpSd0tjaks3?=
 =?utf-8?B?QldRWStsMGxZbUpGUTlia2d6OXZxMGsvRldJbDVuRVVkTWw1OGJ5Z0czT0FH?=
 =?utf-8?B?dW9QNVdaNUllclBBTlhtYThmU2pKVExzdjZodkVIc29tdFRiV05ydFk4Z3Er?=
 =?utf-8?B?TUd3eDBJUEFHQ2NhVmkyTFZvK2NSVGxUdkNzRGs2U0VrNVk0Mm9NYWw2T3hD?=
 =?utf-8?B?RWppL3h2aDhXZzN5M1gwaS85Q2RtTUE1UUtTUmNoRjVoNGVnQ25iSTdieUJT?=
 =?utf-8?B?QktxNlNmd0k4M3NQbkxQREFCbnlUVndnQ202cWZBN0dLcEFkNVFsYUIya0x4?=
 =?utf-8?B?dndteUVZUHV2cW1XU2NCbzhVSlJDdEVaMEpGb3E1eUMzTzJXNXJ2M1dabDhi?=
 =?utf-8?B?dGRCVWphU0FlNHZXZVhmQ0xGc2ZxeGEwamJFQVNoR0tnM1c5WU1Gdk5FUlgv?=
 =?utf-8?B?QTk0bXQxaWpmMTNOeUFHSi9tckRIaVUrUndCS0NGaG9jdEVxc1B0UVRGd3lJ?=
 =?utf-8?B?T2JhSkxuc0lWaEpvK2hPOVVjYUNEZ2N3TVo0VkZadDRyLzdnbTVnQWx3dThM?=
 =?utf-8?B?Y3BBK1BGTnJRODF2N0pna0cvRTU3TlNrZGNDOXp1WnVhUk1JMDlEdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <594FF385B0148E4EA58A3FFA8DDECDE5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 205c785d-0928-40c5-f6aa-08de62cae543
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 02:21:10.2296
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JSF8qkzEuHFSuwFzareAR2BRnfolVYoX1+s3SFI7qwUKXxXZSoq1v5LQsXWNBCfMos2Oznt6QA7QhBtL8iq+uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB7263
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_182119_025127_2F5A8A65 
X-CRM114-Status: GOOD (  18.66  )
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

T24gVHVlLCAyMDI1LTEyLTMwIGF0IDExOjAzIC0wMzAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToNCj4gQUZCQyBidWZmZXJzIHdpdGggd2lkdGggb3ZlciAxOTIwIGFyZSBub3Qgc3Vw
cG9ydGVkIGJ5IE9WTC4gSWYNCj4gYXR0ZW1wdGVkLCB0aGUgaW1hZ2UgZGlzcGxheWVkIGNvbnRh
aW5zIG1hbnkgYXJ0aWZhY3RzLg0KPiANCj4gQWRkIHRoaXMgcmVzdHJpY3Rpb24gdG8gdGhlIGxh
eWVyIGNoZWNrIGNhbGxiYWNrIHNvIHN1Y2ggY29uZmlndXJhdGlvbnMNCj4gYXJlIG5vdCBhbGxv
d2VkLg0KPiANCj4gTk9URTogVGhpcyBkb2Vzbid0IHNlZW0gdG8gYmUgYSBnb29kIHdheSB0byBo
YW5kbGUgdGhpcyByZXN0cmljdGlvbiwgYXMNCj4gd2hlbiB0ZXN0ZWQgd2l0aCBXZXN0b24sIGl0
IHNpbXBseSBmYWlscyB0byByZW5kZXIsIHJhdGhlciB0aGFuIGZhbGxiYWNrDQo+IHRvIG5vdCB1
c2luZyB0aGUgbW9kaWZpZXI6DQo+IA0KPiBbMTk6MDk6MDMuODU3XSBhdG9taWM6IGNvdWxkbid0
IGNvbW1pdCBuZXcgc3RhdGU6IEludmFsaWQgYXJndW1lbnQNCj4gWzE5OjA5OjAzLjg1N10gcmVw
YWludC1mbHVzaCBmYWlsZWQ6IEludmFsaWQgYXJndW1lbnQNCg0KUmV2aWV3ZWQtYnk6IENLIEh1
IDxjay5odUBtZWRpYXRlay5jb20+DQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYu
IFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgfCA3ICsrKysrKysNCj4gIDEgZmlsZSBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2Rpc3Bfb3ZsLmMNCj4gaW5kZXggYzZhMDBjMjI1NmRkLi4xOTZiODc0MDU3YmEgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCj4gQEAgLTM2OCw2ICszNjgs
MTMgQEAgaW50IG10a19vdmxfbGF5ZXJfY2hlY2soc3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25l
ZCBpbnQgaWR4LA0KPiAgCWlmIChzdGF0ZS0+ZmItPmZvcm1hdC0+aXNfeXV2ICYmIChzdGF0ZS0+
cm90YXRpb24gJiB+RFJNX01PREVfUk9UQVRFXzApKQ0KPiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4g
IA0KPiArCS8qDQo+ICsJICogQUZCQyBidWZmZXJzIHdpdGggd2lkdGggPiAxOTIwIGFyZSBub3Qg
c3VwcG9ydGVkIGFuZCBwcm9kdWNlDQo+ICsJICogYXJ0aWZhY3RzLCBzbyBzaG91bGQgYmUgZGlz
YWJsZWQuDQo+ICsJICovDQo+ICsJaWYgKHN0YXRlLT5mYi0+bW9kaWZpZXIgIT0gRFJNX0ZPUk1B
VF9NT0RfTElORUFSICYmIHN0YXRlLT5mYi0+d2lkdGggPiAxOTIwKQ0KPiArCQlyZXR1cm4gLUVJ
TlZBTDsNCj4gKw0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiAgDQo+IA0KDQo=

