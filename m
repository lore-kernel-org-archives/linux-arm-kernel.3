Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1A1606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 07:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MUp6/D+D;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=rW8gkoLP;
	dkim=pass (1024-bit key, unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=mcIvcIPd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zFj3o19Vk1c/UG4Lt8u+rSlSEx4ADEDLPVZsfuCQy80=; b=MUp6/D+DFxeTZxRzjumBbXNTWB
	Bh7rvZpZeN9oWHhnlv2BnWjuebfoIywPrRz2j6Wm9nTr3zxNvDJT3UsER6CCmKryu/8rKrGh2VRGZ
	PHkxEXAjvrA6HfbgGQriuKcwoRmMkeeIJdGLLF05udHZ5+nDsYsNLJve33dDTTZAl8O4A4cLuy23E
	11bmqX/Tuems/sujYssvMuAo3PrbG1B5mdNtnyKdjGTBxlZcn9O0x7ROsRfZsziGTk8XvhRMVhaNs
	xoJ0nsJGGmGDHDxotQQHEF3IEJ5xS7axKItaVLc247uqvSjHMLsb5/M0T+oMCPp96d6jwfX8QTZFi
	td6/wYeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOV3h-00000004SPQ-2mzj;
	Wed, 04 Nov 2026 07:05:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOV3e-00000004SOa-2b40;
	Wed, 04 Nov 2026 07:05:20 +0000
X-UUID: 154eedb0d81e11f1acbe4559397dec65-20261104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=zFj3o19Vk1c/UG4Lt8u+rSlSEx4ADEDLPVZsfuCQy80=;
	b=rW8gkoLPVz0c6WtRzH2NxQoL0VrX0tMZLqK97tvTqZUduuLMhdBLFbO4N1GgruTnTcVIgiQGqJmu2LdWiSJST1gZ06N2ijkZPxcQlOswdJd0y6BRUu0QpTfbvdyD+5P0IOKP55R1IhcF+gWcEsB0+gLCqyWTK5wTST9bIVrJTt8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:9515b71e-431c-49e4-a638-e33cfbd46459,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:3bca15ee-6961-456c-adce-6d277e14e6ad,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|136|836|865|888|898,TC
	:-5,Content:0|15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:
	nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
	C:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 154eedb0d81e11f1acbe4559397dec65-20261104
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 730794132; Wed, 04 Nov 2026 00:05:14 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 4 Nov 2026 15:05:11 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 4 Nov 2026 15:05:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ig460VtPYW8b5dW+bjj3dlacVYjzChT8ujuUNdPjq14+m8Ag9ZdrspSeQtvoiZi6veoYomxj6kiJ9XBjdEanId+C9h6FHIF/vWlfAlypnVPfK4NGTzpaEN6noI9OmxOE5+JGNh6BTA/muo8LfT9fJ9MJOMRL+6gPEiirq3E9Jpyj0dt9mjpTinSPHMa8d8ZGj++iGwgJPD31p5SClm4HtpD/24MWzGVKaYarogUQx/dUbV9Ah9SvpMuF3ZXGn721CB2auxCVDOKWdM30grVMwDjVxp7i/7VxO0nQWpRuoq+CXndgUBtOCUcnOuitiexDpFgpa6DAKd4WZxHScSx5+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zFj3o19Vk1c/UG4Lt8u+rSlSEx4ADEDLPVZsfuCQy80=;
 b=VwNJU2rLBvS7sZxgz5F9h7VI8EaJFHHv1bBKrMXbcU4inRNWlYEYZBYABH3X370Fy5WmL5pU4vrmQeP5WcnkjtyZ3ZaJNPvlixsVpDKZ03PuxDCDHPAqHlQMn/KdbUC0knJ/q/ZirRmXfibkZnKb2GvjT8w16B9KpjZomW5n0vnw1mqJ3B7EteKE9iO+uTosojUzoiCoUGaqXgUcuuT4bFE54qohf6G2n1U7e2fy4O906xY3eLdW6Xe09gNqsH+FdVnXBHUfNwLV7tbhcWfhTf/QSpQColrFUsK0iXLT9IKiAxAnaj+yV+M7RdnOBT20sjA1t1TgOG92FiOQqnNKKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zFj3o19Vk1c/UG4Lt8u+rSlSEx4ADEDLPVZsfuCQy80=;
 b=mcIvcIPd+Vx+R9ogmP+Uf+ggp//osOiVVtS3xlbSWiMLRBBdsA8AyYchoxVXZekm+12mm4qiT7lADS1xn+AjWp3/4oy6/WTxExvjcUq1FbLwITchrFQIvpEITAn0NpS0iKmwHd+4HHbAeKbd8QDfTbDvIpFTRRFTYVQ2SpPhBsY=
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com (2603:1096:604:471::11)
 by SE1PPF173A0EBB1.apcprd03.prod.outlook.com (2603:1096:108:1::846) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 07:05:07 +0000
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02]) by OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 07:05:06 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"westeri@kernel.org" <westeri@kernel.org>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "YehezkelShB@gmail.com"
	<YehezkelShB@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "andreas.noever@gmail.com"
	<andreas.noever@gmail.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 2/4] thunderbolt: add support optional dedicated wakeup
 irq
Thread-Topic: [PATCH 2/4] thunderbolt: add support optional dedicated wakeup
 irq
Thread-Index: AQHdaEhMvwQ7X9y2/U+m6TxIF+UpZrcVxmsAgAZOCACAADCbAIABQASA
Date: Wed, 4 Nov 2026 07:05:06 +0000
Message-ID: <00cc6cd3c95f3e2a14ade28c8543eaf94581450c.camel@mediatek.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
	 <20261030082539.1208733-3-chunfeng.yun@mediatek.com>
	 <20261030084854.GQ158991@black.igk.intel.com>
	 <34de87bb4da20626d440346f9aa0cf7873ef85d1.camel@mediatek.com>
	 <20261103115942.GZ158991@black.igk.intel.com>
In-Reply-To: <20261103115942.GZ158991@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSNPR03MB9677:EE_|SE1PPF173A0EBB1:EE_
x-ms-office365-filtering-correlation-id: 05073b74-73e3-46c7-5378-08df3a41f4e0
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|38070700021|261022075727099003|261021121427099003|261026121527099003|4143699003|11063799006|56012099006|261028144727099003|261022105027099003|261026140227099003|10067099003|18002099003|22082099003|261102123227099003|6133799003;
x-microsoft-antispam-message-info: L2QFP/zDVoLWb4zWeKYI7qG0UjOwcMr1SH44q0xkonAFtGkkYI5yjl8gxZQkCp7uUeoO/Pi9f6GhiJWH3sK6rYCGJs1GWkkBbKNjm4U/8IRAp54XGmGREFEuasQ2A2XGPZieJcu239sRwjw5bfjti18bnfiMK8+zQNqTEKVuRrouoWf61Qo0xVsTgZN7EEnMxEjzdM5xM5mSrJnKaAEIsbqzQZjSXIfYfhXn/coC+LXyIfLNhUzdq009dQHFHWBtDQNWGT5T/r72LLdMmp0WXLe1tfc0KMa2Ul7zTrqkK46rYuIAKTbgjPUktAC3mSw8JYewWGLuj8RlszOF2ERfgPZiR/YiTCYjndPFCF0NnkcShYx5Du2Xd5frdt67fUloZXazqvQPioFVdhDRTtom8mY73IJpVgxM6jB6v/xKX/yPZhB/oH6tJOBh2xB8M2irx6X9P4Z/zD1aslwjHhNoxqT+bQPKkdEcH4+NefBGv0+ON1pBx7doSw8/saO3D009PlPMb7Q9i4+W8Z8zyyCXbLCS8pK1VLEb4Lz3JDROybZZroDM17TMCGdUC4XzNtSLPchUslvBf35za2doWoLJ0wOtjAkPOL9gfnKOY+hss0ETCYZelbt3+HzLMRgbFCaMcnckGOj3pXN+XUf5KX4iUxo8vCfoFSqpBBcPca8PoPZNFgKQLA//5EmtJI7YUrxmwSXfhbP1snFs69zUcCscKnHtr6hJRuj3uW40xD0iMno=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSNPR03MB9677.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(38070700021)(261022075727099003)(261021121427099003)(261026121527099003)(4143699003)(11063799006)(56012099006)(261028144727099003)(261022105027099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(261102123227099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b0h0cmNlSXVxWmd3cVk1cGYwUlBpTk5WdkxPVGdDb2tOc0JUWVpzMnJKNnhk?=
 =?utf-8?B?bFN0U3BBNUJtTWdnUGZxZ04rOVN4Ky9uNTcvd1RPbWN5K1A5dit6MUlOZVJz?=
 =?utf-8?B?M1FNRzBsNm9tMlFpTi93SzduRWsxdmdKcy9oa0R6TGU4bEIyQk9iODUyL1Ji?=
 =?utf-8?B?MXl3QVBneDhHcWtDZFQzNzhQS1ZwTlQ3TlJhUGlsMzFxTS9tTlh4aU9uRkVz?=
 =?utf-8?B?QkVpSDFRNnNsVkV4ZU5ORnRWTmZzd0VZRXptZkd2dU5WNXkrMzFPbXNBVlVN?=
 =?utf-8?B?ZmF2bnNUVXAwNVBOSFhmVFV6MnlFc2RnRkpTVUdWejJnTmFGY0t1NHF3NUdu?=
 =?utf-8?B?VXFhNmdSM0hpVHYrMHh2RmdYUllPL3p1TWJvWkNxM3hhRHJPRGk1SkFEdUpr?=
 =?utf-8?B?WUtrZzZzMDdEbXZ4ZjY5RGZaeEtpNno0OFc2RkE0bG94cUI1TmlrQm1veDk2?=
 =?utf-8?B?RkdkOUxyTnlvb1lvQWJ0eDczVEFZcC9yWDQ0ZlN0cDNWdzl1WEtkTzJ6ZjNX?=
 =?utf-8?B?bVZTeHlUbUpZL2cxVmxML3lEYkJ5TzBUYmZwODlDZGppRWZpRWZEMHphYjBs?=
 =?utf-8?B?TE5wYzFPZFpMenFXdThUaEswd0FXcHEzNDZCRVYwWmxzb2h4M0RpeTRrOE95?=
 =?utf-8?B?TjFCZnFrazE4SmZDb2pLeDhsaDBzL2JUWXVzV2dTb1lrTm1ZRDlDdzZJSFky?=
 =?utf-8?B?cXZrd2NHQ0Z6L2VMbFJPczE0S2VBRzRmbEhoNEppY3dwL2JaSGpwK3RHb2s5?=
 =?utf-8?B?d2J2RURqemNHQ1ljYlJjeldaeDF6RlV1a3QwdmdCTjFCd3pxajZyT1FPYXNx?=
 =?utf-8?B?SFlQQk0vQlR5WmF5dDhwRnZvVWFvOTMvQWk3TElYUEVKeUhFRWlPNDduUWNC?=
 =?utf-8?B?ajk5QVRxcmkrbm1YS1VSdGpvYUlDNWR2TmxuR1ltclFYRnpPV2NqUm4vakNr?=
 =?utf-8?B?K2hDTTd2a3RvN2Z0Vm10RjB5M1lhMDhybnZhNVJNS25zMjJFSTNDTDN1WUh2?=
 =?utf-8?B?d3BMQmV2KytJMnVxWDUrWWpCYS9IRlBaVUZlUXgvNWQ2WG1sWGRjT0VmZGk1?=
 =?utf-8?B?bjAxYnE2YWUraEY3ejh0Tm0xSjlaM1h1dVZVMUxOZzkydmNqTnUybXNQcXBS?=
 =?utf-8?B?UlAxajN5S3Z6MEd4OXV6cGs2cDc1Vy9iT3NUVG9sUUhqdXhPYnBWVzFWK2xR?=
 =?utf-8?B?aHo1UEVTY2xCNzFpRlAwT3ZZOHd3aDQ3ejVDUFQwSGtjOE1DdzYzc2I0cEpr?=
 =?utf-8?B?YVdQdUdROEJPbEx1YmNyT2pyOW5Ub2FWTTFudG9BeEVhb3Z5dEY5VHhFYkl4?=
 =?utf-8?B?QlczcW9LdlEwZzBrOHcyWFZtYzk5SDFyblEvcmx4MmZqTWRiNHgvWjJGZy82?=
 =?utf-8?B?SWZFSFVlQ1pNZ2FHOTJlcU9KTGUvL0ZMaDNBNlpiWU9oOTlZTkdadzg3STZT?=
 =?utf-8?B?NU5jQzNjR2FqVXFyUzFJbmVBQ2hvSzlaa0lBMmVuV0krQS9WNWxSakNFaTRB?=
 =?utf-8?B?SFh1cjJvcERUcWVUcFNZWUJUUjh4enM0NGlVTVlFUUtzTHVCeWxZT3NJeXow?=
 =?utf-8?B?a0M2N0lCT01zZDQ0dXJnMXJ0VDl3aytzRDFtOHF5YmFWNEMwalJGK1dWK0Qx?=
 =?utf-8?B?RmI5eVE1aWJIMjlkSmU1bzZSR2RtbUUvQjNNT2lsRWRVYjVQTFFrcFNvdlI0?=
 =?utf-8?B?WGlBaFFxenVDRjNLWlhPMW1wWnpNdFowOFl2UXBxVGY2OUkvRy9TS09FUjkr?=
 =?utf-8?B?T2Nod0duN0dyVmp5YndRTUd5bFoxN1poSmJlaTlydFRrZEVBY2U0L0hXSWRG?=
 =?utf-8?B?aGZkWmlCMjZrYTdmRS83M3plMlJzaGJUa0N4OW5qVXJURW1XTWdrOWx2Wmta?=
 =?utf-8?B?dzlUajJCbG01K2ZXekxQVERMeXhpcjliQWRuRGpSQ3E0RkRtUXlrTzRlMW9j?=
 =?utf-8?B?V2NOTG5NM2ZodzRscTF6UGtTOGMxaVRqanZNaWVaUm93ZkY3RDJXa0xwL2Jv?=
 =?utf-8?B?RWFjTGlISCswdXp2MzQybGNvR0ZpazRnTVdoUkQvUVFUemI0Wk9ycUdBbTlh?=
 =?utf-8?B?V0ZScGF2eWhFSXZNcGxKYVZSeHVvaHBmamhETUFtd0t5UTEyOFBTOTUzWERP?=
 =?utf-8?B?SUxvaWV6dVNoRkRJTjM0alh5QnhsdzlvdDJZN0FYSTBEZlJya3RHZzhJZitX?=
 =?utf-8?B?dDRvRGpyQkNZOWdKeWZNMVkwalNodzk2cFFleWNqYlpBd1gwQ05PMldNdFdS?=
 =?utf-8?B?ZUVYL3JPUm1yMCtkdmhXVzJmcEJFeHhGNXZRMGFVSFROWmJGbDNFSWZjV3Bi?=
 =?utf-8?B?bFpUL1BJeHNIT2FTTnBEakk1WlpWc1JqVk9xelVVUVpZZkZlaGJkTFhqOXBk?=
 =?utf-8?Q?VC19g6gIXFKyPeLI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <25A9DB5A96718A4F850FE681C8ABB972@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: O6ANaMNuKKUwH/ZcwiZhVkp0zCnZlk9vNqj/GOlt4Tab5H4kYx9gbkGLs7y78uuqWSn9pTal7IL1YBbb2NFoX1+ATkVwWYjW7VOhWvgRNFYTneQdMoYszCK6J5dABiYzDWpS0XfPVUzf5956zx0sI7gPd5+YvCDOVB9rJ9rlFIFU5xafEBjBRg8r3FKNochpunrrN4cUuGb1X11OB6KNRnLDRRspVYNf4GOWiZxPdubkRWW9wqY2o8kiksM+iuU2C7edPOsLIzWHSCCE8nCX9Puvt2A67ZttrSz9c7QJov0lESLU4qxEDl6tEBeH3JOkqWAXlbYotfQ3gmbWH/bIUA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSNPR03MB9677.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05073b74-73e3-46c7-5378-08df3a41f4e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 07:05:06.5293
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uhNgyLkzooBp4P+INJ4De8q/5zZ2aJL/vucMgLWmlhzfRrbNv6ZA0orLbYWtvI1tmWx3BgnbkZ8UCIOVf8TAzv18lJnVgTIE9HjFyMxTJt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPF173A0EBB1
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_230518_702084_0AFC3062 
X-CRM114-Status: GOOD (  24.62  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCAyMDI2LTExLTAzIGF0IDEyOjU5ICswMTAwLCBtaWthLndlc3RlcmJlcmdAbGludXgu
aW50ZWwuY29tDQp3cm90ZToNCj4gSGksDQo+IA0KPiBPbiBUdWUsIE5vdiAwMywgMjAyNiBhdCAw
OTowNTo0NUFNICswMDAwLCBDaHVuZmVuZyBZdW4gKOS6keaYpeWzsCkgd3JvdGU6DQo+ID4gT24g
RnJpLCAyMDI2LTEwLTMwIGF0IDA5OjQ4ICswMTAwLCBNaWthIFdlc3RlcmJlcmcgd3JvdGU6DQo+
ID4gPiBPbiBGcmksIE9jdCAzMCwgMjAyNiBhdCAwNDoyNTozN1BNICswODAwLCBDaHVuZmVuZyBZ
dW4gd3JvdGU6DQo+ID4gPiA+IFRoZXJlIGlzIGEgZGVkaWNhdGVkIHdha2V1cCBpcnEgb24gbnZp
ZGlhIG4xL24yIFNvQ3MuDQo+ID4gPiANCj4gPiA+IE9rYXkgYnV0IHdoeSBpdCBpcyBuZWVkZWQ/
DQo+ID4gZHVlIHRvIG1hYy9waHkgaXMgaW4gcG93ZXIgZG9tYWluIHdoaWNoIGl0cyBwb3dlci9j
bG9jayB3aWxsIGJlDQo+ID4gdHVybg0KPiA+IG9mZiB3aGVuIGVudGVyIGludG8gc2xlZXAgbW9k
ZSwgc28gY2FuIG5vdCB1c2UgdGhlIG1hYydzIGlycSB0bw0KPiA+IHRyaWdnZXINCj4gPiB3YWtl
dXAgc2lnbmFsLCBpbnN0ZWFkIGFkZCBhIGRlZGljYXRlZCBpcnEgdG8gc2VuZCB3YWtlIHNpZ25h
bA0KPiA+IHdoaWNoDQo+ID4gc3RheSBpbiBhbHdheXMtb24gcG93ZXIgZG9tYWluLg0KPiA+IA0K
PiA+ID4gwqBDYW4geW91IGFkZCB0aGlzIHRvIHRoZSBjb21taXQgbWVzc2FnZT8NCj4gPiBPSywg
d2lsbCBhZGQgbW9yZSBpbmZvDQo+ID4gDQo+ID4gPiANCj4gPiA+IEFuZCB3aHkgeW91IGRpZCBu
b3QgYWRkIGl0IGFscmVhZHkgaW4gdGhlIGZpcnN0IGNvbW1pdCB0aGF0IGFkZGVkDQo+ID4gPiB0
aGUNCj4gPiA+IHBsYXRmb3JtIGRyaXZlciB0aGVyZSBhbnl3YXk/DQo+ID4gT0suDQo+ID4gYmVj
YXVzZSBJIHRlc3QgYmFzZSBmdW50aW9uIGZpcnN0LCB0aGVuIHN1cHBvcnQgc3VzcGVuZC9yZXN1
bWUNCj4gDQo+IEl0J3MgZmluZSB0byB0ZXN0IGl0IGhvdyB5b3UgbGlrZSBidXQgc3BsaXQgdGhl
IHBhdGNoZXMgbG9naWNhbGx5DQo+IHdoZW4geW91DQo+IHN1Ym1pdCB1cHN0cmVhbSwgYW5kIHRo
aXMgb25lIGJlbG9uZ3MgdG8gdGhlIGZpcnN0IHBhdGNoIElNSE8uDQoNCkdvdCBpdCwgd2lsbCBt
ZXJnZSB0aGVtIGludG8gb25lLg0KDQpUaGFua3MNCg0K

