Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC934CD4F50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 06:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6O1ICdWN4yeWnS17BkX1f3AB76ALr0jZSbYGRErvLQ=; b=YzPwuVPBt8pDFZ0vu05ukOREkw
	Vntbk8nblSoljQJbOjxni9TD05EeuGkVdgUX78gVhA1nK6KkS+gI+L2OwQvMkD3D0fTo+lKQETPl+
	3HtyN8kRb884d6NGla3Lnpn3/pSvUiNpyF7rWM8j3RiuRYfsDxX7aD5D0uxcAR/nrKEd1mTVBHy8b
	2zjqm8ObjeqiYiSQF6zzHgrFoXfBFa3d5l80e88fraT3zd9Lzb0GHc7A3LqtPhZSsLMjXQAEj5QSc
	6uvOyluYpYzIsutil7yWlCQPshrjyUS5cG24rTKttqU3FFlz0R52IvyAu1Rb29hvZYhWRepscFvh1
	HK2ADyug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOrpp-0000000EU87-3RRz;
	Mon, 18 May 2026 06:52:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOrpo-0000000EU7J-0dAx;
	Mon, 18 May 2026 06:52:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To
	:From:Sender:Reply-To:Content-Description;
	bh=R6O1ICdWN4yeWnS17BkX1f3AB76ALr0jZSbYGRErvLQ=; b=D4olbQto6/SovLuEO+rTlA/GtY
	OsOcMpQp6yJV5MxYJZ71q5zyymN3SPWDd8mJiTXQVhAsLlUGdLBT0Jt/zoxjpHIOsOsqHIjtECXhj
	DyxhmuKoZs3A1xIn6VBZXCAw8qt52HQi0MJi2Qf1g5lMT/8g30Mx0aEsTHNza7GMpnGH4aH0a0NPD
	nPnQJod7Kd+YGcf/NOCdyGT5o4wOet/YE3mZQFrxDMu3G5b4ZfK6/wvYPepYJdWKpoJy4NttDAYzq
	lIy3O5zDeW/D7dksDRMb6tzkB+ywx2cPV9jKlebH+YjJoVp/B3PRW2OB7nwbB0pKnCaKI1W+5lCWn
	5QpdJQcw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOrpa-0000000A50p-1f6G;
	Mon, 18 May 2026 06:52:13 +0000
X-UUID: 0c1c84dc528611f1acbe4559397dec65-20260517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=R6O1ICdWN4yeWnS17BkX1f3AB76ALr0jZSbYGRErvLQ=;
	b=FK+5I+XSqWkJ8c3LdilZuLQ3z4EVTbW4/RhVcDwfdAyAMj1QsfBnxJbQ+OgSiOmVwdbpvGRJ3oByOaMpQkaBaWDNioJ/oq2T9QM8IqQngJPRltngxSVVb86Dr+q+GYybWjv5nND3iCmrzH5IDUc5IphZEDjSfH5Q9oF3Brxnb9o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.14,REQID:d7d39e11-ebd6-4334-b1d8-ad272f8a4f94,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:9091e75,CLOUDID:1d8681a4-a669-48ac-a1cb-3b38a93be682,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
	l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0c1c84dc528611f1acbe4559397dec65-20260517
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <xueqi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 743955222; Sun, 17 May 2026 23:51:50 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 18 May 2026 14:51:48 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 18 May 2026 14:51:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gr8WLFD/HSPL4QsRuXXNDHtYYp5h2l++Fv396gvANRmmwy0LDlV/CNqNvsGKElCj2jJv+5jAnNNLqb7/IVYz/4kF8dUzk1QtLIvMdaI9NsLPwZ7os5qP8mh4eIr+M/MnnTFWmZ249fQL8thL4kDrAyYrBUhvsX4Lrybqint6zY/NTNsAF7L7F1ZMysMax1aUir5qCywzQjCirvhmEON+x5J8cnHVmzeR5uKg9gidEWmpfrNmzaXdIAneHO9x3rZjub80e37/4gjPbvszwo3v/82uWvETCDwNVMuTC7UH+h7qjOIJ+5fhEGKUkA/OPp2bnq+08US7crpdhAgLJTqN0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6O1ICdWN4yeWnS17BkX1f3AB76ALr0jZSbYGRErvLQ=;
 b=SPLrApPrCqXWcaWlZlEaihXmjnG7JWBGvhY1jylN0zHOyJeFOq/VcvV0G6hdeMcJCRWYIvyYpybL1I2aYCvtBBRvNmBV1A8JLOIT3Ik7MGIp5fVzC8Z52r83Ur2C39eo/pDKuVDn0DrR8w1sjkDWnKXQmOXUuX9j1H8s5qr1g03Ce65OyLGVzVw/zDXZAj5Vqq68DAFwpWQCOPM+tajcaWoTOeCd027M6M6O+gMXLBkxUV5qYN7ypV341ks8oaLUEkMEd4aci/jI+48VQ5CCQ2ZMsD1dNgwYBVayYCNvW7eFgO4OgV1Z8aSLHssyHDs96MqavhQHpKPwgDG1QkjGgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6O1ICdWN4yeWnS17BkX1f3AB76ALr0jZSbYGRErvLQ=;
 b=tawSlm5MeHJYnt2E6T0+P+2wsiZGZAtgX1FKFrhFHCt5xeVpGjF25TxhgXApdBzegT03GsAy7WfLFmz1ywLyE1sNq7y7mUoHW2HMHIWc1tcKkXxi/Cs9wpHhM6q+CHinrhzsO46Ab74pp4sifHffAXObhh12hwfUVgn0McouPIA=
Received: from TYZPR03MB6471.apcprd03.prod.outlook.com (2603:1096:400:1c9::8)
 by SE1PPF499066549.apcprd03.prod.outlook.com (2603:1096:108:1::850) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.16; Mon, 18 May
 2026 06:51:43 +0000
Received: from TYZPR03MB6471.apcprd03.prod.outlook.com
 ([fe80::6c05:f611:5357:7326]) by TYZPR03MB6471.apcprd03.prod.outlook.com
 ([fe80::6c05:f611:5357:7326%5]) with mapi id 15.21.0048.010; Mon, 18 May 2026
 06:51:43 +0000
From: =?utf-8?B?WHVlcWkgWmhhbmcgKOW8oOmbqueQpik=?= <Xueqi.Zhang@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?=
	<Yong.Wu@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "krzk@kernel.org"
	<krzk@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: =?utf-8?B?V2VuZHktU1QgTGluICjmnpfoqanluq0p?= <Wendy-ST.Lin@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/3] memory: mtk-smi: Add a flag skip_rpm
Thread-Topic: [PATCH 2/3] memory: mtk-smi: Add a flag skip_rpm
Thread-Index: AQHbmWr+ThkPYzLV/EeJKX653FeCxLN777UAgpoDBYA=
Date: Mon, 18 May 2026 06:51:43 +0000
Message-ID: <80b16f367c2f9a65b3629efd0b8f30715d2c2c5a.camel@mediatek.com>
References: <20250320073625.25225-1-xueqi.zhang@mediatek.com>
	 <20250320073625.25225-3-xueqi.zhang@mediatek.com>
	 <46e0e1f1-e094-40f9-99f9-22678bb40d39@collabora.com>
In-Reply-To: <46e0e1f1-e094-40f9-99f9-22678bb40d39@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6471:EE_|SE1PPF499066549:EE_
x-ms-office365-filtering-correlation-id: 0384d4b3-2972-4e8b-165f-08deb4a9ebe1
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021|18002099003|22082099003|56012099003|11063799003|4143699003;
x-microsoft-antispam-message-info: 5AtVOc98u9StU6cNInwd9D9hH7Lv71QJ0VUkanHdQidLYfMoGUDg+G6Fv2Kp2QZA57XQjIy5BUiPkojGJXwE450YIzGzVSCLEKwusK3eUxejIyZRfsmlhw5eKU0RM3r/3xvu+Km/ynnFDO4qPI78uVzbyIcW0lk5b1JAPyzGnTQKsB1CTthlOMaYwKvShnBXpuIwWItZRvJEdDE/027fwZYn8WWJ4K9IcyOpsn4PYtPvpJeYBmYraPaqN/4VM2mQY93UApj3loas0zC5Lt0Q0e7LZZ+ARF1wVq7/7ioHf8JIwPC3VlgbGPXmoZhR7bN3xxoV3GDcckk1dxkPpBvUFEXogYpu14KpWJdRnUt/Q2DYixRfs3WKqHBNJ3mXb0qQY782EM9KZN3XllZm6TqSI8KPAp1ipGoYa4dBMdQga+QoUz0CCc0aq3qnjhxhrnxP4sLBHpXH6Mg3DvdER3/AbLDx3IaetwzWhSsh5K2iYJdymDLdtm/SxuI0uXYj+mG2uZXb6rWWQ7hBtxLX9MpySk7+szON6z4JS3oXt/QdXYp/gsQfJgZIaJbEmlLeXSKQsUKeZyg/p/Bw32GH1pOzApS3dqX8LdtYpRomDZBA88dI0hFX88JixPf8F1AfbL9zfZdnzeVMEGiECKqmwglvqee1bJLyuRwIjr0JRGCZSkxv9SZN8ih9X9lY2LVFyvw70RGIsfZxdVNV5GlaqvlmduRKX9PGx6g8bbFQ1O3Yh2P0pu6swI+C/rKLlGYYm8oa
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6471.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021)(18002099003)(22082099003)(56012099003)(11063799003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QmZxbjNBdWxBUFRVMElnSDcya1pROGF3djF0NWZuTytRQ0pSSjlLK3lyQXMz?=
 =?utf-8?B?OXpqZGxUeE5rQmVqOEhFU0dBeDYrUWlqbFRJemNYdmROdTIvZCtTOTVQSDBM?=
 =?utf-8?B?MTRRaFU1OGM3NTd2ZDZsSHphT3FnMjJWV2FUV3dXSExOaEp0Z1haZzNQMWZJ?=
 =?utf-8?B?NEVXRGEvcjJnSFlFVTY3UGE2anpsU201YWlwSkpqZitXWTFXcWU0YTlUOG9D?=
 =?utf-8?B?aTZFQlRRWVV5V3puZzNoVkpmQkR1QTE0WXZNUFJPbjJ3WC84M241VXVYeEdq?=
 =?utf-8?B?MHhjSFMrRkRQYTZSOXhrRFlNRERLSzVJWUtzMXlUNU1SUTB6dEpEelB2NHVy?=
 =?utf-8?B?eVZNRjh4VGZ3Wkt0L3BDTDFxcW16RUtYaFNnVC9TaE1hZzQzWld6RzZvckth?=
 =?utf-8?B?OXpVbTkwbUtFY1oxb2ZYMzZLbDlpbjAwU0tFc3VJQ01xbHorOWFnWDBrNi90?=
 =?utf-8?B?YUx0MllaVWZhMzhDcWFmRlJBb1Nqbmg1L0lzOWdXNVFzQks0WjJ6YUR3WUdk?=
 =?utf-8?B?eUtzYUhjeExMS2x0UzJKNzJqK3hEbVo5V0xmVUNYWnRSbmtVWktGa1k1bXFy?=
 =?utf-8?B?dllLUGo5S0w0VEg3WGtWZGNVMU4xeWxwSmtweVFwQ2M1cStyZkpyRjJmajBk?=
 =?utf-8?B?MlYraU9jSkJIOXAwc1hNaUw1Vmp5ZUtjUVdjdTdEK0JRenRISDJuUjdBUVRC?=
 =?utf-8?B?UkJ0TzU1MWZmUUpwY3Q0YWhWTnhvVTlxWE5na29sVmZFcStVYXZzOHA0Nkdz?=
 =?utf-8?B?eDlRVEVEaTJTYngrMy82STIzRWJhUjJsRGs0RFQrZjQzdmt5c1dDNkp5ZDJ3?=
 =?utf-8?B?eHRJMTdWMEFST1pqdDk2SzM3bmJzSG56amtTMmxyZWNxakI4TGFjcHNyM1kv?=
 =?utf-8?B?OHV3aURrazZpS1htTkRWYVJjc3pZZzF6aFg2MFBNM1ZBR1pJbFVHUk5laHRu?=
 =?utf-8?B?UHR5aC80MEZMQXBaVzhDYU4vQ1R3YlVSNnBlN3Yyc1V4VWRvK1BXRHM3aG1Q?=
 =?utf-8?B?akxscW05T1RpcmlsZEpMT3JPOFF5cjRZdThMOGE5UDc2cDhqTzdDRSt1V3Zr?=
 =?utf-8?B?WjBDWk9WY1JGaVZERnVaU21YS3N4b0xqd2JsMmM3ZE16RVhXTUViWDBsRlVR?=
 =?utf-8?B?TzNybVdlM2JVM0dWWTl6dHpUTGVRSGhudE5yVXhEeld0VXJvSTd2NVBPUkhV?=
 =?utf-8?B?WVJ2MVRoOEZTclJERk5pRXRERmpLZGk5NVB0ckp2bHkrSEN1L05hSElocHlm?=
 =?utf-8?B?WklDNUlYZ0NDL0l3ZVZqZUZ1UlNWcytJSkFhaTZiK2lIRWdQZVJuWUdPU0lQ?=
 =?utf-8?B?QXRmSSsxYWpHcjJxeUJFd2duamJxblZCK0RHMVBuN1l2cWQrNnhZckd4ZGdj?=
 =?utf-8?B?OStjZlUvdnJ1ZE0xL1BBSmM1eDNkcS9RYXpLemRvZi9CcndZV2NESVo1eEJs?=
 =?utf-8?B?NzdYR0JKbVI0bnJYdmsrYy80RElNa25BckdrdXZoVjh5MkJNQUhtUHNoK3Zo?=
 =?utf-8?B?SjNaQ1JPa05paHZsQnNlMkM4VTJsa2tZeWRzaUd4WjBjZGhPUnlTazVSVlVi?=
 =?utf-8?B?c2RxdnI0NjhQS2E2ZjRUVkJSdGVKbkJWNTFmdTZKaGRHdU5oeThHRVhRZExD?=
 =?utf-8?B?M29idTFFSE5OdFhOdnRzSGpPbW5wR1pmTWNQZlN0RlVmUnRtT1RpRk9OMTgy?=
 =?utf-8?B?Z2Q2eS9lOFNkNEVab29vWjNDSVhHYWl0Y05oVFpjTWNodVU2M3JkTnRaTE90?=
 =?utf-8?B?YzVQQVFZQzZLNmd0YWNDbEowK0FYZCtiNFRGdWtSNk5ZTWtRS0w3UlFXTlYz?=
 =?utf-8?B?SFQrOHhOMUwyV1J5TGlPcGxia3IyUDkzSjN1U29WMG05U3lYT0pRTVBTR3NI?=
 =?utf-8?B?d3BIZ0RiUnhLa3dNN0lxOFE2TzJvTElMc2l1K3RrUk1rMXhDMmRTdHR0bTBn?=
 =?utf-8?B?TzVZMFF2NG9XZTNzbm1NTmlwVVlYN0gyWnJxZHdnLzBrejZxc2tFUDdmRHhQ?=
 =?utf-8?B?NGFvcHhjNCs1cHIxRzNtQW1XajQzVW1SZ2VXV0xTaVdFaldsY1I2Q3JPbkFG?=
 =?utf-8?B?YWljd0R5eW50eTVtYTgvMTc4ZTY5YnIrOTBzaTlUU1lGTDh3OU9wM2VoeWlU?=
 =?utf-8?B?Y1c3TEZTM000Um1US0tnekNOQkRPOVJwTFo1ZnBOdVNhSUtiNTFWSG5rdkhD?=
 =?utf-8?B?T2J6L3hLNUFCc2NvZ3kvRVV0VmYvVndZL2Q4aVFYY0tOcW1nOUpnaVpWUUk4?=
 =?utf-8?B?Z0FaWUU3NFI5U2lHQkRGdkZNMEpIdi93Ukc0Sy9HUzNCRmtZQ0FpOEUxWGVw?=
 =?utf-8?B?ejhlSGJsRUgvUFI2bUdmeTVsU2FoeDhzTUEyN2JVaitNYm9wTFpPQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF61A6134E998A4EA8B628B0B4766E87@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: oObWT5qVN7tgqFnX3ptMgS3c20LShPL8w6QTk3hFK556dGaZWa4DSSdNtD28G2e4pT4wpG0jJ93CFxIw5B1VfTbXxGtxIJkawK4yHUYsp+VTfdg/aEEXKxAzvLorRIB5Oqyw8RZNpL0AMnuq5NOuLmCziLy00r3wzQtBfz63xszmRlYvCRJ48vv2p7rBYqvf/dH8GBaevoxOFhMXNfm6NS1hKKwZgTr0umXRLltTNtw3a/VZ8WXWdieUCD6t4A7p11ZK7YTPaulFwZsAgVGDyT2LO1Q2m17cJQZaYQqPcWN37QslnhwKaZQ4qs/2LV+TpZSfQfOEEDQeOvkmHtf3wg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6471.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0384d4b3-2972-4e8b-165f-08deb4a9ebe1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2026 06:51:43.1796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 84Of/vazns6MKue5OsfDiKeMMQN0WmBCFW4iNGEo1HdpHg9Dwk0HnB5Mn7WMzEBDGKI1+NhlTYFBLrj5F6eTBw0ambo0+uX2Vwip/TJ7DOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPF499066549
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_075204_459711_F829699C 
X-CRM114-Status: GOOD (  27.75  )
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

SGkgQW5nZWxvDQoNCkZpcnN0IG9mIGFsbCwgcGxlYXNlIGFjY2VwdCBteSBhcG9sb2dpZXMgZm9y
IHRoZSBkZWxheWVkIHJlc3BvbnNlLiBJDQpoYXZlIGJlZW4gZGVlcGx5IG9jY3VwaWVkIHdpdGgg
TVQ4MTk2IEFsdW1pbml1bSBwS1ZNIFNNTVUgYW5kIFNNSQ0KcmVsYXRlZCB0YXNrcyByZWNlbnRs
eS4NCg0KUmVnYXJkaW5nIHlvdXIgcXVlc3Rpb24sIG15IHByZXZpb3VzIGRlc2NyaXB0aW9uIGlu
IHRoZSBwYXRjaCB3YXMgbm90DQphY2N1cmF0ZSBlbm91Z2ggYW5kIG1heSBoYXZlIGNhdXNlZCBz
b21lIGNvbmZ1c2lvbi4gSW4gZmFjdCwgbm90IGFsbA0KU01JIGNvbW1vbnMgaGF2ZSB0aGVpciBi
YWNrdXAvcmVzdG9yZSBoYW5kbGVkIGJ5IHRoZSBSVEZGIGhhcmR3YXJlLiBUaGUNClNNSSBjb21t
b25zIGFyZSBkaXN0cmlidXRlZCBhY3Jvc3MgdmFyaW91cyBzdWJzeXN0ZW1zIChlLmcuLCBtbWlu
ZnJhLA0KdmVuYywgZGlzcGxheSwgY2FtLCBldGMuKS4gQ3VycmVudGx5LCBvbmx5IHRoZSBTTUkg
Y29tbW9uIHVuZGVyIHRoZQ0KbW1pbmZyYSBzdWJzeXN0ZW0gaXMgYmFja2VkIHVwIGFuZCByZXN0
b3JlZCBieSB0aGUgUlRGRiBoYXJkd2FyZS4NCg0KVGhlcmVmb3JlLCBJIGJlbGlldmUgYWRkaW5n
IGEgc3BlY2lmaWMgc2tpcF9ycG0gZmxhZyBpcyBtb3JlDQphcHByb3ByaWF0ZSBoZXJlLiBJZiB3
ZSB3ZXJlIHRvIGRpZmZlcmVudGlhdGUgdGhpcyBiYXNlZCBvbiBhIG5ldw0KTVRLX1NNSV9HRU4z
IHR5cGUsIGl0IHdvdWxkIGltcGx5IHRoYXQgYWxsIFNNSSBjb21tb24gbW9kdWxlcyBvZiB0aGF0
DQpnZW5lcmF0aW9uIHdvdWxkIHNraXAgdGhlIFJQTSBvcGVyYXRpb25zLCB3aGljaCBpcyBub3Qg
dGhlIGludGVuZGVkDQpiZWhhdmlvci4NCg0KVG8gbWFrZSB0aGlzIGNsZWFyZXIsIEkgcGxhbiB0
byB1cGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlIGluIHRoZSBuZXh0DQp2ZXJzaW9uIGFzIGZvbGxv
d3M6DQoNClN1YmplY3Q6IG1lbW9yeTogbXRrLXNtaTogQWRkIHNraXBfcnBtIGZsYWcgZm9yIGNl
cnRhaW4gTVQ4MTk2IFNNSQ0KY29tbW9ucw0KDQpCb2R5Og0KT24gTVQ4MTk2LCBjZXJ0YWluIFNN
SSBjb21tb25zIGFyZSBiYWNrZWQgdXAgYW5kIHJlc3RvcmVkIGJ5IHRoZSBSVEZGDQpoYXJkd2Fy
ZSByYXRoZXIgdGhhbiBieSBzb2Z0d2FyZS4NCg0KRm9yIHRoZXNlIHNwZWNpZmljIFNNSSBjb21t
b25zLCBzb2Z0d2FyZS1jb250cm9sbGVkIHJlZ2lzdGVyIGJhY2t1cCBhbmQNCnJlc3RvcmUgaW4g
dGhlIHJ1bnRpbWUgY2FsbGJhY2sgaXMgbm8gbG9uZ2VyIG5lY2Vzc2FyeS4gVGhlcmVmb3JlLA0K
aW50cm9kdWNlIGEgc2tpcF9ycG0gZmxhZyB0byBieXBhc3MgdGhlc2UgcmVkdW5kYW50IFJQTSBv
cGVyYXRpb25zIGZvcg0KdGhlc2UgU01JIGNvbW1vbnMuDQoNCldoYXQgZG8geW91IHRoaW5rIGFi
b3V0IHRoaXMgYXBwcm9hY2g/DQoNClRoYW5rcywNClh1ZXFpDQoNCk9uIFRodSwgMjAyNS0wMy0y
MCBhdCAxMzoxMSArMDEwMCwgQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gd3JvdGU6DQo+IEV4
dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1l
bnRzIHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQu
DQo+IA0KPiANCj4gSWwgMjAvMDMvMjUgMDg6MzYsIFh1ZXFpIFpoYW5nIGhhIHNjcml0dG86DQo+
ID4gTVQ4MTk2IFNNSSBjb21tb25zIGlzIGJhY2tlZCB1cC9yZXN0b3JlZCBieSBSVEZGIEhXLg0K
PiA+IEl0IGRvZXNuJ3QgbmVlZCBTVyBjb250cm9sIHRoZSByZWdpc3RlciBiYWNrdXAvc3RvcmUN
Cj4gPiBpbiB0aGUgcnVudGltZSBjYWxsYmFjay5UaGVyZWZvcmUsIGFkZCBhIGZsYWcgc2tpcF9y
cG0NCj4gPiB0byBoZWxwIHNraXAgUlBNIG9wZXJhdGlvbnMgZm9yIFNNSSBjb21tb25zLg0KPiA+
IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFh1ZXFpIFpoYW5nIDx4dWVxaS56aGFuZ0BtZWRpYXRlay5j
b20+DQo+IA0KPiBTbyB0aGUgTVQ4MTk2IFNNSSBjb21tb24gZG9lc24ndCByZXF1aXJlIGFueSBj
bG9ja3M/DQo+IA0KPiBUaGF0J3MgZmluZSBmb3IgbWUsIGJ1dCB0aGlzIGxvb2tzIGJsb29keSBz
aW1pbGFyIHRvIE1UNjk4OSdzIFNNSQ0KPiBjb21tb24sIHdoaWNoDQo+IGlzIFNNSSBHRU4zIGFu
ZCBub3QgR0VOMi4uLi4NCj4gDQo+IC4uLi5zbywgYXJlIHlvdSBzdXJlIHRoYXQgeW91IG5lZWQg
YSBgc2tpcF9ycG1gIGZsYWcgYW5kIG5vdCBuZXcNCj4gTVRLX1NNSV9HRU4zIGFuZA0KPiBNVEtf
U01JX0dFTjNfU1VCX0NPTU0gdHlwZXM/IDotKQ0KPiANCj4gUmVnYXJkcywNCj4gQW5nZWxvDQo+
IA0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9tZW1vcnkvbXRrLXNtaS5jIHwgMTEgKysrKysrKyst
LS0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
DQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVtb3J5L210ay1zbWkuYyBiL2RyaXZl
cnMvbWVtb3J5L210ay1zbWkuYw0KPiA+IGluZGV4IGE4ZjU0NjdkNmIzMS4uYjlhZmZhM2MzMTg1
IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVtb3J5L210ay1zbWkuYw0KPiA+ICsrKyBiL2Ry
aXZlcnMvbWVtb3J5L210ay1zbWkuYw0KPiA+IEBAIC0xMjMsNiArMTIzLDcgQEAgc3RhdGljIGNv
bnN0IGNoYXIgKiBjb25zdCBtdGtfc21pX2NvbW1vbl9jbGtzW10NCj4gPiA9IHsiYXBiIiwgInNt
aSIsICJnYWxzMCIsICJnYWxzMQ0KPiA+ICAgc3RydWN0IG10a19zbWlfY29tbW9uX3BsYXQgew0K
PiA+ICAgICAgIGVudW0gbXRrX3NtaV90eXBlICAgICAgIHR5cGU7DQo+ID4gICAgICAgYm9vbCAg
ICAgICAgICAgICAgICAgICAgaGFzX2dhbHM7DQo+ID4gKyAgICAgYm9vbCAgICAgICAgICAgICAg
ICAgICAgc2tpcF9ycG07DQo+ID4gICAgICAgdTMyICAgICAgICAgICAgICAgICAgICAgYnVzX3Nl
bDsgLyogQmFsYW5jZSBzb21lIGxhcmJzIHRvDQo+ID4gZW50ZXIgbW11MCBvciBtbXUxICovDQo+
ID4gDQo+ID4gICAgICAgY29uc3Qgc3RydWN0IG10a19zbWlfcmVnX3BhaXIgICAqaW5pdDsNCj4g
PiBAQCAtNTQ3LDYgKzU0OCw5IEBAIHN0YXRpYyBpbnQgbXRrX3NtaV9kdHNfY2xrX2luaXQoc3Ry
dWN0IGRldmljZQ0KPiA+ICpkZXYsIHN0cnVjdCBtdGtfc21pICpzbWksDQo+ID4gICB7DQo+ID4g
ICAgICAgaW50IGksIHJldDsNCj4gPiANCj4gPiArICAgICBpZiAoc21pLT5wbGF0LT5za2lwX3Jw
bSkNCj4gPiArICAgICAgICAgICAgIHJldHVybiAwOw0KPiA+ICsNCj4gPiAgICAgICBmb3IgKGkg
PSAwOyBpIDwgY2xrX25yX3JlcXVpcmVkOyBpKyspDQo+ID4gICAgICAgICAgICAgICBzbWktPmNs
a3NbaV0uaWQgPSBjbGtzW2ldOw0KPiA+ICAgICAgIHJldCA9IGRldm1fY2xrX2J1bGtfZ2V0KGRl
diwgY2xrX25yX3JlcXVpcmVkLCBzbWktPmNsa3MpOw0KPiA+IEBAIC03ODMsNyArNzg3LDcgQEAg
c3RhdGljIGludCBtdGtfc21pX2NvbW1vbl9wcm9iZShzdHJ1Y3QNCj4gPiBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpDQo+ID4gICAgICAgY29tbW9uLT5kZXYgPSBkZXY7DQo+ID4gICAgICAgY29tbW9u
LT5wbGF0ID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKGRldik7DQo+ID4gDQo+ID4gLSAgICAg
aWYgKGNvbW1vbi0+cGxhdC0+aGFzX2dhbHMpIHsNCj4gPiArICAgICBpZiAoIWNvbW1vbi0+cGxh
dC0+c2tpcF9ycG0gJiYgY29tbW9uLT5wbGF0LT5oYXNfZ2Fscykgew0KPiA+ICAgICAgICAgICAg
ICAgaWYgKGNvbW1vbi0+cGxhdC0+dHlwZSA9PSBNVEtfU01JX0dFTjIpDQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgIGNsa19yZXF1aXJlZCA9IE1US19TTUlfQ09NX0dBTFNfUkVRX0NMS19OUjsN
Cj4gPiAgICAgICAgICAgICAgIGVsc2UgaWYgKGNvbW1vbi0+cGxhdC0+dHlwZSA9PSBNVEtfU01J
X0dFTjJfU1VCX0NPTU0pDQo+ID4gQEAgLTgxNCwxMyArODE4LDE0IEBAIHN0YXRpYyBpbnQgbXRr
X3NtaV9jb21tb25fcHJvYmUoc3RydWN0DQo+ID4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+
ICAgICAgIH0NCj4gPiANCj4gPiAgICAgICAvKiBsaW5rIGl0cyBzbWktY29tbW9uIGlmIHRoaXMg
aXMgc21pLXN1Yi1jb21tb24gKi8NCj4gPiAtICAgICBpZiAoY29tbW9uLT5wbGF0LT50eXBlID09
IE1US19TTUlfR0VOMl9TVUJfQ09NTSkgew0KPiA+ICsgICAgIGlmIChjb21tb24tPnBsYXQtPnR5
cGUgPT0gTVRLX1NNSV9HRU4yX1NVQl9DT01NICYmICFjb21tb24tDQo+ID4gPnBsYXQtPnNraXBf
cnBtKSB7DQo+ID4gICAgICAgICAgICAgICByZXQgPSBtdGtfc21pX2RldmljZV9saW5rX2NvbW1v
bihkZXYsICZjb21tb24tDQo+ID4gPnNtaV9jb21tb25fZGV2KTsNCj4gPiAgICAgICAgICAgICAg
IGlmIChyZXQgPCAwKQ0KPiA+ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+
ICAgICAgIH0NCj4gPiANCj4gPiAtICAgICBwbV9ydW50aW1lX2VuYWJsZShkZXYpOw0KPiA+ICsg
ICAgIGlmICghY29tbW9uLT5wbGF0LT5za2lwX3JwbSkNCj4gPiArICAgICAgICAgICAgIHBtX3J1
bnRpbWVfZW5hYmxlKGRldik7DQo+ID4gICAgICAgcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwg
Y29tbW9uKTsNCj4gPiAgICAgICByZXR1cm4gMDsNCj4gPiAgIH0NCj4gDQo+IA0K

