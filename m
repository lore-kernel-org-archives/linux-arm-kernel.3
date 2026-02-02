Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE65E73144
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 08:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MTw9uHeFvC9G1HeRVRsRAM5Lj5ejc0qZ71b1rkFNu9s=; b=fU1MHSlOLZlP+3b/c+7iYJSxKF
	XUYkIJj04R4bHpT+WeP7nNonl3pQlrdxp9XSoO6LC+TudGx+0VO198W0kkhEBVZVsbkoBIY5AbpU4
	zg4ruIRHXwOQiELRAIKJS26fbrP3JGQ/f9SjjK8JQ2G9MpbG/T99tRp/njCNopgOt8wZi7rK59fir
	U750iqkXX4Ya97f+RNkUJgpjmQNOsoh2XA9QR9fp012SjXIV+3UiQn+yPlwj4bmd0kMXsS3YIcPpg
	1J1TcB/48B0ebhjqXE6heQQaRr9OU7pHwiLZyM6LaANfCKMVg5LokcY22cezcMBD4owIJpAd3T/tC
	0kLMVrHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmpbG-00000004f6T-3i4G;
	Mon, 02 Feb 2026 08:48:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmpbE-00000004f5m-01v5;
	Mon, 02 Feb 2026 08:48:01 +0000
X-UUID: db1019a4001311f1ad39f32c34db0b1c-20260202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=MTw9uHeFvC9G1HeRVRsRAM5Lj5ejc0qZ71b1rkFNu9s=;
	b=DcDeIWutbjTYrhPVTuMeNCLQYZ0NFAdo7diTzxtuuk0A21/PiXntwWX8dHU+qM0grnIKErV9bIB4Gg/dg52N1jgiJmicRc8HRT2a2Yc3o6b9uL/MPLRJqKJ4fuhAdcbtq+rA6/oWwMh4eYLDw7wojbAxzcef6nNZXUxTPuHhun0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:acb814a9-54e3-4f34-b482-4652bf1c9b09,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:7807d45a-a957-4259-bcca-d3af718d7034,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: db1019a4001311f1ad39f32c34db0b1c-20260202
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 886493144; Mon, 02 Feb 2026 01:47:50 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 2 Feb 2026 16:47:48 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 2 Feb 2026 16:47:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bfHjyACY4p8IZTLBNJqjAt9HVlY1gqT6BOs9qACQf8uEEspIE0VE0D2sEH/3gyasHLS+cEAwe+hXR5dZzcPGnimXC77vBcnYGm3C9a0+IEb8x2cTZ5c38hVPLZiqesYIWduOGp2uJSlTyjPLHlA83/GywjThHOQeY0DBiIQvde041iCia28LhTLtp0vpt20yTnZwMGGVj+6SGoCaVeig+87Gxgp+qw9ALrSz7oPmlSQYVQNyR3/8MB7tFTs0qGWMo9FiEmH7yN8kLdDWWXI8wPAJub9ZfULi+N/7Fd0pX8MSeyKW+nPlhMa441R24oYhjTcmumqguqT9BUP98M0q4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTw9uHeFvC9G1HeRVRsRAM5Lj5ejc0qZ71b1rkFNu9s=;
 b=VINoK23V8pQ43KrPny1eyeFjkxD+RYdWOosJwF1tajhUFxEhAaOLLkjfN5ILA9+pBpsGX670XsiomkZkYGVHKIyvx6/q0JFMigB9PB1K2WtxLg7QwKX9XghjD+eEUlZ7VttzFW+QDk/xcyxFQ1++Q4eqE8B8BWdne7LywAsFPOQFvB2evOnHQpPU1rgrFsV8ZgaKH7Sf08eDP+7aDf3VRe/ua8wBkXKk2QkaqQi5trcVEgOXthONWNiRyHmF+GqqeVsAfGBZyF9ZQWBWhR7ki8R7l3a977uAOnhVMFZ6Sh6HhidZL0/k7pbCv5baYx0uwaUb4CgBJVJPKl3bIQllCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTw9uHeFvC9G1HeRVRsRAM5Lj5ejc0qZ71b1rkFNu9s=;
 b=cVskT0Opn2W0IR/DSHi33mV9gX0d3BhNGiEchNU5wJNRS5cg/9W6lPnKLA5oeZB5GaFKmvS9WtEafL3uxJ8msXjXujJSzw2rtaDKCXX58HBHvIn0/Vqd41nZ9uKXp28+qZ532oYzCP1P16OPvjTVgvWGzoGwTOKzXdk1ybvzdk8=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB8011.apcprd03.prod.outlook.com (2603:1096:820:101::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 08:46:22 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::a3c2:b94a:70f:e640%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 08:46:21 +0000
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
Subject: Re: [PATCH RFC 3/6] drm/mediatek: ovl: Fix misaligned layer source
 size on AFBC mode
Thread-Topic: [PATCH RFC 3/6] drm/mediatek: ovl: Fix misaligned layer source
 size on AFBC mode
Thread-Index: AQHceZU/SlrIiCW2Fky/SXbbIg72WbVvTaSA
Date: Mon, 2 Feb 2026 08:46:21 +0000
Message-ID: <b640f9839f16980b6e9582815ce8588180237977.camel@mediatek.com>
References: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
	 <20251230-mtk-afbc-fixes-v1-3-6c0247b66e32@collabora.com>
In-Reply-To: <20251230-mtk-afbc-fixes-v1-3-6c0247b66e32@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB8011:EE_
x-ms-office365-filtering-correlation-id: 2fd6d1d7-9626-4092-d3e2-08de62378a66
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|42112799006|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?SzVtTVZONzNiSzR5WnZpT3c1eTFQY3dEMmdZTkFMSjFZWFZ4K2puR3lnQVUw?=
 =?utf-8?B?ME1qT1gxRGc2MHMyazU0bk1rOGRBcXRtaitocG11UURSSTNvLy96U25jbCt4?=
 =?utf-8?B?UjZjbXRzQnZKQW40dTdWK0JLYVl2M3g5aFFCVSsvVm56K1BlaWMxK1JYeERv?=
 =?utf-8?B?M245VklGc0pVSHVUN003eXFpSFJPV3RuYjFpNGFmZzZacHFPN1hmd01jV0Y2?=
 =?utf-8?B?MUhUMXdkVlNUYTRGNmRVVy93NmxteXV1R3lseWJyMlVleDRqNUhiNGo4b0tH?=
 =?utf-8?B?SFkxYnpvVUFHTFE1M3ZHMDlmZE5PRjRTOXpVNkdjUXd6a3hab0NUTGZDMmtG?=
 =?utf-8?B?cGIwanVwcWJXMUo1c2dQVEJDYi9WbDN2VHBzVDdSa3VJV0xFcnpYSXEwYmc4?=
 =?utf-8?B?alZialBMSlMyQ2cvYVRFNmZXMjFPZVJ4T1hUZWJ0eVluMGdjaG9IOHUxeVFq?=
 =?utf-8?B?aUQ4MHdJU0xVcHU2SEFsYXoxcmJzL0pFcnZvdlgyTHByak1VYzZwd0FkNkZH?=
 =?utf-8?B?OEFna0FWcFpCc0xTNjNncHJrejRUMmpPNTl4QzNYbTVKNURSSVpnajJ3WElG?=
 =?utf-8?B?NjVocDNhMHdJdmhXZ0dmSU8yb3h0cXFTSVJsNVl6SlFhZHhnWHdQTEdsb3JV?=
 =?utf-8?B?ZWxnMUs1Z2t0dGpyMG8ySTVVWXRvRUpwRkF0S1NEYk43T2JCa1IyOGJXY1po?=
 =?utf-8?B?dWZlRlNzTE9vY2VMUTlndGpnWUhEY3pHYUZKTjJGYXZnNWpyVWx1ODNBVVZv?=
 =?utf-8?B?bGcyUnFBTksvYkhjUFhoRVV5ZDMvQTZBQUl1c1VzVFY3NXl2ZVdhUTF1MFo0?=
 =?utf-8?B?NEg3ZFRFalBPVzRabUt6aFJ4Sk9NTWlMdGRVcjlvVEJ5aDBlc3BXdDNMU2dz?=
 =?utf-8?B?SllPWXV0MHhQcXJBVW0xc2doQ1FHK3JXWkNSYTJkUVVzTzRBdVJ6ZUpUMTZ3?=
 =?utf-8?B?eEhaWTZib1FwanNlb1VzNVNxNmZiTmUwUDFwQTA0T0NWNzlCVXE4YUg3bDhO?=
 =?utf-8?B?Rld5bEloQnJJcEY5VmdpdWNKa3hmVjVxQXdtTG9PMTRaTW8yUGlDWGFBOGRo?=
 =?utf-8?B?akJneW50dDBBdTVhTGJNTXNtZzg1OE5pUTVuUVQ5Vmw5c3VqZUE1aHAvQTF0?=
 =?utf-8?B?QmJpL3pvTjlyWGR5ZkVnYk81c2NJTzZFN0NCemhJa2c0RWpNM3RNY0srNGJ6?=
 =?utf-8?B?N3pZODdNenE0K3JWWWtGQ2lXWlg5THhsQVBaOUNBemdyaUlrSGtNNngxOSto?=
 =?utf-8?B?VnF1YWFZYzF3N0RqaGdkYjgxNU1HWmNJS2ZIRXd4ZUxkbVBBOG5MSXRwV2Vj?=
 =?utf-8?B?ZFhSZXp5NnpFUlJYaVoyWDE5eE1INlJlcnMvTEs1aTZsbCtFQkQ2OFFrcW93?=
 =?utf-8?B?a1FaYjNRUkFIYnFvRWV0Q01yTW0zYms3Ymtqc1lMZ1Nma2NiSERhSitWdHAr?=
 =?utf-8?B?ZnEwaElWcFkwVzVvNk9jcitoeFJSVVVpdFVvcVFiQlFQdzg2UEdrR3huYllx?=
 =?utf-8?B?a3RMSXVmZjZPTVBjeVJzWUloeW9IOHVlRlJEcVUzTmowbXkyTXU0OXRka0ZK?=
 =?utf-8?B?ejlkS280OFgvdWdYOGYvMlR0WHZlSWR0ajBVWDNOanFSMCtUYks4VzlJY1hU?=
 =?utf-8?B?dldnWWRjT2FtdEdKMmc2UDkxQzZ3Tk9LVlhpK2UvK0ttOUxEaGVQZTRhYldW?=
 =?utf-8?B?ZXJBUUFHTDJ2bld0a1hPK0ZNZlZPVFNiUlYrVnoramVOaU9BS2VxN2pXaXFy?=
 =?utf-8?B?czc2K0RpSnplSUVWS1ZOYjVXbjUyeDRHeDZCU2dHQldibzY2aFgrelhmQkF5?=
 =?utf-8?B?K3hLTjFCaHFTSzAxQy9WdEwwY1hEWDZxZjBPUDVXUmxQdzJwOFRFaDQ3RXB0?=
 =?utf-8?B?SkNQTkRqenIrR1RHbC83dzJqMFo1QzZNRm5ZWXlZUkV0NmUwUjROYi9yY0N4?=
 =?utf-8?B?d0NrZFBaQzBBckZIQTlucG94YjlOeVJLV3crNFJON0N2ZHp5VngzT01lelVh?=
 =?utf-8?B?V1FVa3lOOEtoa0cxWWo0ZjBSYU12WkxiL1JlSVYzVUZhc0NFRmloeWIyL05j?=
 =?utf-8?B?NDJOQmtUaGVhWHArUHJlR2tCZlFwSTZBQno5OHVCTU9kbDV6UnZyRVJ5WE1q?=
 =?utf-8?B?K2VDNnZXSlNQVWF3cWQrTkZncVFzU1NXa3ZmNUZvSHZnQVBnTHozNTV4Mm1w?=
 =?utf-8?Q?G0B1GdBS7cbij/XuIy4pnA8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(42112799006)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?di9rQ0p6WlRZVUNEMVlXTjAyaVU5MEw3YTZ1UHZuNEZNRjNwbGxKQ2lVVnJs?=
 =?utf-8?B?ZlhzeHBNR213b1R5YlowSmVzcjZRY1NaM1UyNHRqUnV3bW9MUW0xSlV5UUZ0?=
 =?utf-8?B?c1AxZTNRV0ROaVVwekVDKy9VMWV1dlZkbVU3QnVScURIaTJPeDQ0UFZURyta?=
 =?utf-8?B?WUMrSnZ3MGJDVWgzM2hlSE1rT2NWVnRpb1JYOXNrTDFrR1lnQ2Z0TGlzOElh?=
 =?utf-8?B?M212TmpzZ1N3bWJ3amJ5TjE5TENiOUVxWnJYei92eUFRdnl5Q2NGL2k0VmJq?=
 =?utf-8?B?dFQ1UXlSbEpUL2VjeGtTL3dyaFc1bXlxd1ZFQUpGb2x3bStoMTZhSUFpb0d4?=
 =?utf-8?B?V29oY0gzaHpyNTIwZFdkaVdVY29LNUxpdURKSXdHNHN5clloT29ORTBYOFp4?=
 =?utf-8?B?NVNEallQRGtVMDAvdWRidERqRjI1enM0a0ZYVnovNlY1QWkraW96WGF3bCsx?=
 =?utf-8?B?dERBQTMvSFp3ZkxESHlhbENQWWxGNmhZenM4TnJaS21EZDFlelFuZ21QWFFl?=
 =?utf-8?B?cld0SWg3RXA0WnRUakJ0amxzNzRKZzU1b2czL3NiMWZkKzllYS92T0pDRUx4?=
 =?utf-8?B?YjJuYzJLTDZWS0VGVkRUZFVSTHZtNmlsVVM2dXpBRXhRS3p0aFhaaEwzMFVT?=
 =?utf-8?B?YjlUcHZCUHRXV2tHWkVoVnJaWkxNSmR3Q09XK1NHNmhxYlRjeitmaTFyNTlJ?=
 =?utf-8?B?aS94TmYxSFpodDkvWVhmbW9xaXdPUkM5NVRKeDIzMjZaaklZRnVHYlJacEtv?=
 =?utf-8?B?WTNEYjQvemo1M0Y5cy9FVnN4NUw4bHFNL2VmWnlTTWV2MldVSHRZU3hJNW5W?=
 =?utf-8?B?SVd4WUlkVnBwRnptQUd5NjQ3aHc5SkpLa1BvOUl3aU9EWHFPLytQVjRabzN5?=
 =?utf-8?B?SjZCazJkdXVGdGJ6YnpFT2RxWklOWmJWZllaTEdUYkxna3FCZE1GQVl0c1ow?=
 =?utf-8?B?MlY1bUMwbXBjbU9IMFNFSElha1RyU2IxS1JnVFp4dmhZYWk2alJiMVVuQWhI?=
 =?utf-8?B?NkswbkhkVVMrMWFiaXZvdzN0Y3lRWm1mck14SGw4UEJnYXhMUGxnS3JTRTF0?=
 =?utf-8?B?KzkxSUtrYm81cjdpc050dlQwTXExS1NtOUtrTGl1TnN1ZVJoYUdGSTFhVzNn?=
 =?utf-8?B?dys2TU5Eb3Y2VTMwZU1aeU9BLzQ5WXU3V0UzbXBKdnExVGJpd2hlRnZhMTlw?=
 =?utf-8?B?SjJPRTlkSy93NU1jQUVQVlNka20vMldXd3JGQ3dDb25DNHUzcUpqTnVUclYz?=
 =?utf-8?B?Y1NERE5MUkRJZ2Z4K2xrbEk0NFV5aVNFWmJvSWljZlNpdFhnWHBsMHFTbERC?=
 =?utf-8?B?Q1QwK2EzZmQ2MU5OZm9IUkJ2VXJZaysvVFFlVjlnaFRocEdjTElhUjB1TExx?=
 =?utf-8?B?eDVUNzFiWnJZcmZIajdaNzRicVlCZXdpN2g1d0s0WE42aTlGS2VCOGh5d3l1?=
 =?utf-8?B?WUlWd0FlVkRIaTVlYXd2cVBXb1lrd0t2VFgwSWZ5ZzRNRGM2Y1hUUFhmeHpK?=
 =?utf-8?B?bzNhZ2l6MXFwUnNwbUhNaXNGY0Q1MW0zM0FzdnFlWTZzNHBwTXFpWlRmT0lh?=
 =?utf-8?B?RHRpZVFGbUF6NHlSQy91WXRDUldsN1NDaDNvRy9BQ28xVi9wellQMFRoWVhH?=
 =?utf-8?B?VXA3bnZnWlFzazhFWmd4N1VTUW54SS9XbEJLck4zS3kyTFNGbmVjc0V2STJI?=
 =?utf-8?B?cERaVWh1NzJUbGVIVzRKaFV1Z3RSVTVjY082TC80Q29rTDRMTXRjN1U2TDhw?=
 =?utf-8?B?QXEyTTdQUTA5MTFnWmhqUm1pWXc0ajlCaWhGems2MTJSSUxibGEyQ0R5TVNt?=
 =?utf-8?B?NFArckdVaXMwTUhBY3FGbXVGOTdOd2VIYzJXcFZuWG9zTkhOR1QxWXdBQTNv?=
 =?utf-8?B?VU9jb3hzaEFIVmRjWEp5Sm1hV21ZZWFmVUp2TmZVT1cwWjJpOXlXZTdVd0Zz?=
 =?utf-8?B?YVNZdkxHMjZ1L1BhN08yT3I5d2tyamE2TlI2V3RoUldIcGt6Ymo0bjkyZVFQ?=
 =?utf-8?B?UWNXN0xSczB3TzZqNjVFSEJtdFlhd3FLR2NEQnpWRkUydC9kdk1ONGNxRmlW?=
 =?utf-8?B?dGppVW9abVlUVGFacWdFb2VTU2F4M0hQY3hoNTdrMlRBeFJ4QUZ4Wms2WWJ4?=
 =?utf-8?B?ZG9RUktPRmJ4Ymo2R1BlUkJpTVZnR0hwblhLMitkYWljcHVoQUMydVVDZ04w?=
 =?utf-8?B?MEg2SThDSzFhVmpKWlF0RVlMalZlNkNobkVEMCtJZDBTTkVkUDg3NHJSalE0?=
 =?utf-8?B?M2NqWG5lRjRobVR1TnNzZWtlMGJKM3dzTmpHd0ZMWVc5di84bmlxQ3BqK0Yz?=
 =?utf-8?B?ckZrQWJGdEo3djd0bmVYbXFOUkxmTCtzTWdYWDRBSG5landXRkg2UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <380B12DF8E49FF41B746B7B83BFE370D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fd6d1d7-9626-4092-d3e2-08de62378a66
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 08:46:21.7302
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ttYyGnG4TFavpTGzX19wdPHfMYLCT5uO1KfBF6xr/m+ubOqvwp25ZKsxnlkLeMby0ok6ihzIWOUubV5yNjjmrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8011
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_004800_073322_ED6A5782 
X-CRM114-Status: GOOD (  13.44  )
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
byB3cm90ZToNCj4gRnJvbTogQXJpZWwgRCdBbGVzc2FuZHJvIDxhcmllbC5kYWxlc3NhbmRyb0Bj
b2xsYWJvcmEuY29tPg0KPiANCj4gSW4gQUZCQyBtb2RlLCBPVkxfU1JDX1NJWkUgbXVzdCBiZSBi
bG9jayBhbGlnbmVkLiBEdWUgdG8gdGhpcyBsaW1pdGF0aW9uDQo+IG9mIHRoZSBBRkJDIGZvcm1h
dCwgT1ZMX0NMSVAgbmVlZHMgdG8gYmUgdXNlZCB0byBhY2hpZXZlIHRoZSBkZXNpcmVkDQo+IG91
dHB1dCBzaXplIG9mIHRoZSBsYXllciB3aGlsZSBzdGlsbCBtZWV0aW5nIHRoZSBhbGlnbm1lbnQg
Y29uc3RyYWludHMuDQo+IEZhaWx1cmUgdG8gZG8gdGhpcyB3aWxsIHJlc3VsdCBpbiB2Ymxhbmsg
dGltZW91dHMgYW5kIG5vIHJlbmRlcmVkIG91dHB1dA0KPiB3aGVuIHRoZSBBRkJDIGRhdGEgc291
cmNlIGlzbid0IGFsaWduZWQgdG8gdGhlIEFGQkMgYmxvY2sgKDMyeDgpLg0KPiANCj4gQ29uZmln
dXJlIE9WTF9DTElQIHNvIHVuYWxpZ25lZCBBRkJDIGxheWVycyBjYW4gYmUgZGlzcGxheWVkLg0K
PiANCj4gVGhlIGZvbGxvd2luZyBpbGx1c3RyYXRlcyBob3cgdGhlIGFsaWdubWVudCBpcyBhY2hp
ZXZlZCB0aHJvdWdoIHRoZSBjbGlwDQo+IHNldHRpbmdzIGZvciB0aGUgaG9yaXpvbnRhbCBjb29y
ZGluYXRlcywgdGhlIHZlcnRpY2FsIGNvb3JkaW5hdGVzIGFyZQ0KPiBhbmFsb2dvdXM6DQo+IA0K
PiAvLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXA0KPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfA0KPiA+ICAg
ICAgICAgICAgLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uICAgICAgICAgICAgfA0KPiA+ICAgICAg
ICAgICAgLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uICAgICAgICAgICAgfA0KPiA+ICAgICAgICAg
ICAgLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uICAgICAgICAgICAgfA0KPiA+ICAgICAgICAgICAg
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uICAgICAgICAgICAgfA0KPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfA0KPiBcLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLw0KPiAgICAgIHwgICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICB8ICAgICAgIHwNCj4gICAgICB8ICAgICAgIHNyYy54MSAgICAgICAgICAg
ICAgICAgc3JjLngyICB8DQo+ICAgICAgfCAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgIHwg
ICAgICAgfA0KPiAgICAgIHwgICAgICAgfDwtLS0tLS0tLS0tLS0tLS0tLS0tLT58ICAgICAgIHwN
Cj4gICAgICB8ICAgICAgICAgICAgICBzcmNfd2lkdGggICAgICAgICAgICAgICB8DQoNClRoaXMg
cGF0Y2ggbG9va3MgdG8gbWUuDQpCdXQgIkluIEFGQkMgbW9kZSwgT1ZMX1NSQ19TSVpFIG11c3Qg
YmUgYmxvY2sgYWxpZ25lZCIsIHNvIHRoaXMgZ3JhcGggc2hvdWxkIHNob3cgYXM6DQoNCiAgICAg
fCAgICAgICBzcmMueDEgICAgICAgICAgICAgICAgIHNyYy54MiAgfA0KICAgICB8ICAgICAgIHwg
ICAgICAgICAgICAgICAgICAgICAgfCAgICAgICB8DQogICAgIHwgICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICB8ICAgICAgIHwNCiAgICAgTiAqIEFGQkNfREFUQV9CTE9DS19XSURUSCAgICAg
IHwgICAgICAgTSAqIEFGQkNfREFUQV9CTE9DS19XSURUSA0KICAgICB8ICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgfCAgICAgICB8DQogICAgIHw8LS0tLS0+fCAgICAgICAgICAgICAgICAg
ICAgICB8PC0tLS0tPnwNCiAgICAgfGNsaXBfbGVmdCAgICAgICAgICAgICAgICAgICAgICBjbGlw
X3JpZ2h0DQogICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwNCiAg
ICAgfDwtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0+fA0KICAgICB8ICAgICAg
ICAgICAgICBzcmNfd2lkdGggICAgICAgICAgICAgICB8DQoNClJlZ2FyZHMsDQpDSw0KDQo+ICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfA0KPiAgICAgIE4gKiBB
RkJDX0RBVEFfQkxPQ0tfV0lEVEggICAgICAgICAgICAgIE0gKiBBRkJDX0RBVEFfQkxPQ0tfV0lE
VEgNCj4gICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8DQo+ICAg
ICAgfDwtLS0tLT58ICAgICAgICAgICAgICAgICAgICAgIHw8LS0tLS0+fA0KPiAgICAgICBjbGlw
X2xlZnQgICAgICAgICAgICAgICAgICAgICAgY2xpcF9yaWdodA0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQXJpZWwgRCdBbGVzc2FuZHJvIDxhcmllbC5kYWxlc3NhbmRyb0Bjb2xsYWJvcmEuY29tPg0K
PiBDby1kZXZlbG9wZWQtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29s
bGFib3JhLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5m
cmFwcmFkb0Bjb2xsYWJvcmEuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZGlzcF9vdmwuYyB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQ0K
PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19wbGFuZS5jICAgIHwgMjEgKysrKysrKysr
KysrKysrKysrKysNCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfcGxhbmUuaCAgICB8
ICA0ICsrKysNCj4gIDMgZmlsZXMgY2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rp
c3Bfb3ZsLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCj4gaW5k
ZXggOGUyMGI0NTQxMWZjLi5jNmEwMGMyMjU2ZGQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMNCj4gQEAgLTM5LDYgKzM5LDExIEBADQo+ICAjZGVmaW5lIE9W
TF9QSVRDSF9NU0JfMk5EX1NVQkJVRgkJCUJJVCgxNikNCj4gICNkZWZpbmUgRElTUF9SRUdfT1ZM
X1BJVENIKG4pCQkJKDB4MDA0NCArIDB4MjAgKiAobikpDQo+ICAjZGVmaW5lIE9WTF9DT05TVF9C
TEVORAkJCQkJQklUKDI4KQ0KPiArI2RlZmluZSBESVNQX1JFR19PVkxfQ0xJUChuKQkJCSgweDAw
NEMgKyAweDIwICogKG4pKQ0KPiArI2RlZmluZSBPVkxfQ0xJUF9MRUZUCQkJCQlHRU5NQVNLKDcs
IDApDQo+ICsjZGVmaW5lIE9WTF9DTElQX1JJR0hUCQkJCQlHRU5NQVNLKDE1LCA4KQ0KPiArI2Rl
ZmluZSBPVkxfQ0xJUF9UT1AJCQkJCUdFTk1BU0soMjMsIDE2KQ0KPiArI2RlZmluZSBPVkxfQ0xJ
UF9CT1RUT00JCQkJCUdFTk1BU0soMzEsIDI0KQ0KPiAgI2RlZmluZSBESVNQX1JFR19PVkxfUkRN
QV9DVFJMKG4pCQkoMHgwMGMwICsgMHgyMCAqIChuKSkNCj4gICNkZWZpbmUgRElTUF9SRUdfT1ZM
X1JETUFfR01DKG4pCQkoMHgwMGM4ICsgMHgyMCAqIChuKSkNCj4gICNkZWZpbmUgRElTUF9SRUdf
T1ZMX0FERFJfTVQyNzAxCQkweDAwNDANCj4gQEAgLTQ5OSwxMyArNTA0LDE0IEBAIHZvaWQgbXRr
X292bF9sYXllcl9jb25maWcoc3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgaWR4LA0K
PiAgCXN0cnVjdCBtdGtfcGxhbmVfcGVuZGluZ19zdGF0ZSAqcGVuZGluZyA9ICZzdGF0ZS0+cGVu
ZGluZzsNCj4gIAl1bnNpZ25lZCBpbnQgYWRkciA9IHBlbmRpbmctPmFkZHI7DQo+ICAJdW5zaWdu
ZWQgaW50IHBpdGNoX2xzYiA9IHBlbmRpbmctPnBpdGNoICYgR0VOTUFTSygxNSwgMCk7DQo+ICsJ
dW5zaWduZWQgbG9uZyBsb25nIG1vZGlmaWVyID0gcGVuZGluZy0+bW9kaWZpZXI7DQo+ICAJdW5z
aWduZWQgaW50IGZtdCA9IHBlbmRpbmctPmZvcm1hdDsNCj4gIAl1bnNpZ25lZCBpbnQgcm90YXRp
b24gPSBwZW5kaW5nLT5yb3RhdGlvbjsNCj4gIAl1bnNpZ25lZCBpbnQgb2Zmc2V0ID0gKHBlbmRp
bmctPnkgPDwgMTYpIHwgcGVuZGluZy0+eDsNCj4gLQl1bnNpZ25lZCBpbnQgc3JjX3NpemUgPSAo
cGVuZGluZy0+aGVpZ2h0IDw8IDE2KSB8IHBlbmRpbmctPndpZHRoOw0KPiAgCXVuc2lnbmVkIGlu
dCBibGVuZF9tb2RlID0gc3RhdGUtPmJhc2UucGl4ZWxfYmxlbmRfbW9kZTsNCj4gIAl1bnNpZ25l
ZCBpbnQgaWdub3JlX3BpeGVsX2FscGhhID0gMDsNCj4gLQl1bnNpZ25lZCBpbnQgY29uOw0KPiAr
CXVuc2lnbmVkIGludCBzcmNfc2l6ZSwgY29uLCBzcmNfd2lkdGgsIHNyY19oZWlnaHQ7DQo+ICsJ
dW5zaWduZWQgaW50IGNsaXAgPSAwOw0KPiAgDQo+ICAJaWYgKCFwZW5kaW5nLT5lbmFibGUpIHsN
Cj4gIAkJbXRrX292bF9sYXllcl9vZmYoZGV2LCBpZHgsIGNtZHFfcGt0KTsNCj4gQEAgLTU1MCw5
ICs1NTYsMjYgQEAgdm9pZCBtdGtfb3ZsX2xheWVyX2NvbmZpZyhzdHJ1Y3QgZGV2aWNlICpkZXYs
IHVuc2lnbmVkIGludCBpZHgsDQo+ICAJCWFkZHIgKz0gcGVuZGluZy0+cGl0Y2ggLSAxOw0KPiAg
CX0NCj4gIA0KPiAtCWlmIChvdmwtPmRhdGEtPnN1cHBvcnRzX2FmYmMpDQo+IC0JCW10a19vdmxf
c2V0X2FmYmMob3ZsLCBjbWRxX3BrdCwgaWR4LA0KPiAtCQkJCSBwZW5kaW5nLT5tb2RpZmllciAh
PSBEUk1fRk9STUFUX01PRF9MSU5FQVIpOw0KPiArCWlmIChvdmwtPmRhdGEtPnN1cHBvcnRzX2Fm
YmMgJiYgKG1vZGlmaWVyICE9IERSTV9GT1JNQVRfTU9EX0xJTkVBUikpIHsNCj4gKwkJLyoNCj4g
KwkJICogSW4gQUZCQyBtb2RlLCBPVkxfU1JDX1NJWkUgbXVzdCBiZSBibG9jayBhbGlnbmVkLiBE
dWUgdG8gdGhpcw0KPiArCQkgKiBsaW1pdGF0aW9uIG9mIHRoZSBBRkJDIGZvcm1hdCwgT1ZMX0NM
SVAgaXMgdXNlZCB0byBhZGp1c3QgdGhlDQo+ICsJCSAqIG91dHB1dCBzaXplIG9mIHRoZSBsYXll
ci4NCj4gKwkJICovDQo+ICsJCWNsaXAgPSBGSUVMRF9QUkVQKE9WTF9DTElQX0JPVFRPTSwgcGVu
ZGluZy0+Y2xpcF9ib3R0b20pIHwNCj4gKwkJICAgICAgIEZJRUxEX1BSRVAoT1ZMX0NMSVBfVE9Q
LCBwZW5kaW5nLT5jbGlwX3RvcCkgfA0KPiArCQkgICAgICAgRklFTERfUFJFUChPVkxfQ0xJUF9S
SUdIVCwgcGVuZGluZy0+Y2xpcF9yaWdodCkgfA0KPiArCQkgICAgICAgRklFTERfUFJFUChPVkxf
Q0xJUF9MRUZULCBwZW5kaW5nLT5jbGlwX2xlZnQpOw0KPiArCQlzcmNfaGVpZ2h0ID0gcGVuZGlu
Zy0+aGVpZ2h0ICsgcGVuZGluZy0+Y2xpcF90b3AgKyBwZW5kaW5nLT5jbGlwX2JvdHRvbTsNCj4g
KwkJc3JjX3dpZHRoID0gcGVuZGluZy0+d2lkdGggKyBwZW5kaW5nLT5jbGlwX2xlZnQgKyBwZW5k
aW5nLT5jbGlwX3JpZ2h0Ow0KPiArCQltdGtfb3ZsX3NldF9hZmJjKG92bCwgY21kcV9wa3QsIGlk
eCwgdHJ1ZSk7DQo+ICsJfSBlbHNlIHsNCj4gKwkJc3JjX2hlaWdodCA9IHBlbmRpbmctPmhlaWdo
dDsNCj4gKwkJc3JjX3dpZHRoID0gcGVuZGluZy0+d2lkdGg7DQo+ICsJCW10a19vdmxfc2V0X2Fm
YmMob3ZsLCBjbWRxX3BrdCwgaWR4LCBmYWxzZSk7DQo+ICsJfQ0KPiArDQo+ICsJc3JjX3NpemUg
PSAoc3JjX2hlaWdodCA8PCAxNikgfCBzcmNfd2lkdGg7DQo+ICANCj4gIAltdGtfZGRwX3dyaXRl
X3JlbGF4ZWQoY21kcV9wa3QsIGNvbiwgJm92bC0+Y21kcV9yZWcsIG92bC0+cmVncywNCj4gIAkJ
CSAgICAgIERJU1BfUkVHX09WTF9DT04oaWR4KSk7DQo+IEBAIC01NjAsNiArNTgzLDggQEAgdm9p
ZCBtdGtfb3ZsX2xheWVyX2NvbmZpZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCBp
ZHgsDQo+ICAJCQkgICAgICAmb3ZsLT5jbWRxX3JlZywgb3ZsLT5yZWdzLCBESVNQX1JFR19PVkxf
UElUQ0goaWR4KSk7DQo+ICAJbXRrX2RkcF93cml0ZV9yZWxheGVkKGNtZHFfcGt0LCBzcmNfc2l6
ZSwgJm92bC0+Y21kcV9yZWcsIG92bC0+cmVncywNCj4gIAkJCSAgICAgIERJU1BfUkVHX09WTF9T
UkNfU0laRShpZHgpKTsNCj4gKwltdGtfZGRwX3dyaXRlX3JlbGF4ZWQoY21kcV9wa3QsIGNsaXAs
ICZvdmwtPmNtZHFfcmVnLCBvdmwtPnJlZ3MsDQo+ICsJCQkgICAgICBESVNQX1JFR19PVkxfQ0xJ
UChpZHgpKTsNCj4gIAltdGtfZGRwX3dyaXRlX3JlbGF4ZWQoY21kcV9wa3QsIG9mZnNldCwgJm92
bC0+Y21kcV9yZWcsIG92bC0+cmVncywNCj4gIAkJCSAgICAgIERJU1BfUkVHX09WTF9PRkZTRVQo
aWR4KSk7DQo+ICAJbXRrX2RkcF93cml0ZV9yZWxheGVkKGNtZHFfcGt0LCBhZGRyLCAmb3ZsLT5j
bWRxX3JlZywgb3ZsLT5yZWdzLA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19wbGFuZS5jDQo+
IGluZGV4IDEyMTRmNjIzODU5ZS4uOGZiMDg3NjhlOGNlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX3BsYW5lLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19wbGFuZS5jDQo+IEBAIC0xMTQsNiArMTE0LDcgQEAgc3RhdGljIHZvaWQgbXRr
X3BsYW5lX3VwZGF0ZV9uZXdfc3RhdGUoc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqbmV3X3N0YXRl
LA0KPiAgCQkJCSAgICAgICBzdHJ1Y3QgbXRrX3BsYW5lX3N0YXRlICptdGtfcGxhbmVfc3RhdGUp
DQo+ICB7DQo+ICAJc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIgPSBuZXdfc3RhdGUtPmZiOw0K
PiArCXVuc2lnbmVkIGludCBjbGlwX2xlZnQgPSAwLCBjbGlwX3RvcCA9IDAsIGNsaXBfcmlnaHQg
PSAwLCBjbGlwX2JvdHRvbSA9IDA7DQo+ICAJc3RydWN0IGRybV9nZW1fb2JqZWN0ICpnZW07DQo+
ICAJc3RydWN0IG10a19nZW1fb2JqICptdGtfZ2VtOw0KPiAgCXVuc2lnbmVkIGludCBwaXRjaCwg
Zm9ybWF0Ow0KPiBAQCAtMTQ4LDYgKzE0OSwyMiBAQCBzdGF0aWMgdm9pZCBtdGtfcGxhbmVfdXBk
YXRlX25ld19zdGF0ZShzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpuZXdfc3RhdGUsDQo+ICAJCWlu
dCB4X29mZnNldF9pbl9ibG9ja3MgPSAobmV3X3N0YXRlLT5zcmMueDEgPj4gMTYpIC8gQUZCQ19E
QVRBX0JMT0NLX1dJRFRIOw0KPiAgCQlpbnQgeV9vZmZzZXRfaW5fYmxvY2tzID0gKG5ld19zdGF0
ZS0+c3JjLnkxID4+IDE2KSAvIEFGQkNfREFUQV9CTE9DS19IRUlHSFQ7DQo+ICAJCWludCBoZHJf
c2l6ZSwgaGRyX29mZnNldDsNCj4gKwkJaW50IHNyY193aWR0aCA9IGRybV9yZWN0X3dpZHRoKCZu
ZXdfc3RhdGUtPnNyYykgPj4gMTY7DQo+ICsJCWludCBzcmNfaGVpZ2h0ID0gZHJtX3JlY3RfaGVp
Z2h0KCZuZXdfc3RhdGUtPnNyYykgPj4gMTY7DQo+ICsJCXVuc2lnbmVkIGludCByZW1haW5kZXJf
cmlnaHQsIHJlbWFpbmRlcl9ib3R0b207DQo+ICsNCj4gKwkJLyoNCj4gKwkJICogSW4gQUZCQyBt
b2RlLCB0aGUgc291cmNlIHNpemUgY29uZmlndXJlZCBuZWVkcyB0byBiZSBhDQo+ICsJCSAqIG11
bHRpcGxlIG9mIHRoZSBBRkJDIGRhdGEgYmxvY2sgc2l6ZS4gQ29tcHV0ZSBhbmQgc2F2ZSB0aGUN
Cj4gKwkJICogbmVjZXNzYXJ5IGNsaXBzIHNvIHRoZSBpbmRlZGVkIHgsIHksIHdpZHRoIGFuZCBo
ZWlnaHQgYXJlDQo+ICsJCSAqIG9idGFpbmVkIGluIHRoZSBvdXRwdXQgZGVzcGl0ZSB0aGlzIGNv
bnN0cmFpbnQuDQo+ICsJCSAqLw0KPiArCQljbGlwX2xlZnQgPSAobmV3X3N0YXRlLT5zcmMueDEg
Pj4gMTYpICUgQUZCQ19EQVRBX0JMT0NLX1dJRFRIOw0KPiArCQljbGlwX3RvcCA9IChuZXdfc3Rh
dGUtPnNyYy55MSA+PiAxNikgJSBBRkJDX0RBVEFfQkxPQ0tfSEVJR0hUOw0KPiArCQlyZW1haW5k
ZXJfcmlnaHQgPSAoc3JjX3dpZHRoICsgY2xpcF9sZWZ0KSAlIEFGQkNfREFUQV9CTE9DS19XSURU
SDsNCj4gKwkJY2xpcF9yaWdodCA9IHJlbWFpbmRlcl9yaWdodCA/IEFGQkNfREFUQV9CTE9DS19X
SURUSCAtIHJlbWFpbmRlcl9yaWdodCA6IDA7DQo+ICsJCXJlbWFpbmRlcl9ib3R0b20gPSAoc3Jj
X2hlaWdodCArIGNsaXBfdG9wKSAlIEFGQkNfREFUQV9CTE9DS19IRUlHSFQ7DQo+ICsJCWNsaXBf
Ym90dG9tID0gcmVtYWluZGVyX2JvdHRvbSA/IEFGQkNfREFUQV9CTE9DS19IRUlHSFQgLSByZW1h
aW5kZXJfYm90dG9tIDogMDsNCj4gIA0KPiAgCQloZHJfcGl0Y2ggPSB3aWR0aF9pbl9ibG9ja3Mg
KiBBRkJDX0hFQURFUl9CTE9DS19TSVpFOw0KPiAgCQlwaXRjaCA9IHdpZHRoX2luX2Jsb2NrcyAq
IEFGQkNfREFUQV9CTE9DS19XSURUSCAqDQo+IEBAIC0xODcsNiArMjA0LDEwIEBAIHN0YXRpYyB2
b2lkIG10a19wbGFuZV91cGRhdGVfbmV3X3N0YXRlKHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKm5l
d19zdGF0ZSwNCj4gIAltdGtfcGxhbmVfc3RhdGUtPnBlbmRpbmcueSA9IG5ld19zdGF0ZS0+ZHN0
LnkxOw0KPiAgCW10a19wbGFuZV9zdGF0ZS0+cGVuZGluZy53aWR0aCA9IGRybV9yZWN0X3dpZHRo
KCZuZXdfc3RhdGUtPmRzdCk7DQo+ICAJbXRrX3BsYW5lX3N0YXRlLT5wZW5kaW5nLmhlaWdodCA9
IGRybV9yZWN0X2hlaWdodCgmbmV3X3N0YXRlLT5kc3QpOw0KPiArCW10a19wbGFuZV9zdGF0ZS0+
cGVuZGluZy5jbGlwX2xlZnQgPSBjbGlwX2xlZnQ7DQo+ICsJbXRrX3BsYW5lX3N0YXRlLT5wZW5k
aW5nLmNsaXBfdG9wID0gY2xpcF90b3A7DQo+ICsJbXRrX3BsYW5lX3N0YXRlLT5wZW5kaW5nLmNs
aXBfcmlnaHQgPSBjbGlwX3JpZ2h0Ow0KPiArCW10a19wbGFuZV9zdGF0ZS0+cGVuZGluZy5jbGlw
X2JvdHRvbSA9IGNsaXBfYm90dG9tOw0KPiAgCW10a19wbGFuZV9zdGF0ZS0+cGVuZGluZy5yb3Rh
dGlvbiA9IG5ld19zdGF0ZS0+cm90YXRpb247DQo+ICAJbXRrX3BsYW5lX3N0YXRlLT5wZW5kaW5n
LmNvbG9yX2VuY29kaW5nID0gbmV3X3N0YXRlLT5jb2xvcl9lbmNvZGluZzsNCj4gIH0NCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfcGxhbmUuaCBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfcGxhbmUuaA0KPiBpbmRleCA0NmJlNDQ1NGJjOTIuLmE5Y2Zi
MmVlNTg1OSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19wbGFu
ZS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfcGxhbmUuaA0KPiBAQCAt
MjgsNiArMjgsMTAgQEAgc3RydWN0IG10a19wbGFuZV9wZW5kaW5nX3N0YXRlIHsNCj4gIAl1bnNp
Z25lZCBpbnQJCQl5Ow0KPiAgCXVuc2lnbmVkIGludAkJCXdpZHRoOw0KPiAgCXVuc2lnbmVkIGlu
dAkJCWhlaWdodDsNCj4gKwl1bnNpZ25lZCBpbnQJCQljbGlwX2xlZnQ7DQo+ICsJdW5zaWduZWQg
aW50CQkJY2xpcF90b3A7DQo+ICsJdW5zaWduZWQgaW50CQkJY2xpcF9yaWdodDsNCj4gKwl1bnNp
Z25lZCBpbnQJCQljbGlwX2JvdHRvbTsNCj4gIAl1bnNpZ25lZCBpbnQJCQlyb3RhdGlvbjsNCj4g
IAlib29sCQkJCWRpcnR5Ow0KPiAgCWJvb2wJCQkJYXN5bmNfZGlydHk7DQo+IA0KDQo=

