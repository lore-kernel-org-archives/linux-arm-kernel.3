Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34366C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 05:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJZs8bMRVKmGs4Cd3LHuVa9ANwwZwquKKBIWb6XCSpQ=; b=tWP3NfRom4jRYifIVIkc+Naiyu
	rNg22dCCNZfPYwHBZqkBMiXqxVwe3fbDsGqUsMxisc7YQ3WBdHCv76ABoXH3AcOL/YADzNX1ILIzz
	w2Zs904Ndf/5vRCyw7jJNGwJm7ntoVovgTaGTvFKdY45sofg+UTEK+WjUXTWFaSS57MtdN1Rsibca
	JHakassyMsqWSgXIc3KzfCAv8U1wMt7IdkbYAR7D1NC53HdfM9KuMe+J0grLbN+IrOclODlhCH/co
	WGSO1VLN/xXsJGB/39WcwebJXGDPjbsUlogBfTlvqCG7h/7uzh0FQVY0xonFuvRF91d/mVeDqD3WV
	jAmRfyJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wukqw-00000001zf5-1Ymb;
	Fri, 14 Aug 2026 05:53:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wukqt-00000001zeZ-1wM7;
	Fri, 14 Aug 2026 05:53:12 +0000
X-UUID: 6a58989897a411f1acbe4559397dec65-20260813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=airoha.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=XJZs8bMRVKmGs4Cd3LHuVa9ANwwZwquKKBIWb6XCSpQ=;
	b=S9LpS8iV5DBRKG5lE/LVh7nF9Ykl0DTJB9EE3Vxoe/prL5u14L4uirtsWJfGxORYzdCBn5zbLIuZ8G2VHy08p9MNF7O1ZQpn0WEOfzCurqFOJ1fDKG7NPIkOnMy18/sXbr//prSzD5H7YgJ03IxLsKYT1ZVpEubw60ZQvpjo+x4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:0f2223dc-019e-41a8-85e7-9a3179a8146b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:7774dcf1-0685-46a3-9cac-19d8f3a05ae7,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|110|111|836|865|888|898,TC:-5,Conten
	t:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6a58989897a411f1acbe4559397dec65-20260813
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <leto.liu@airoha.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 957537824; Thu, 13 Aug 2026 22:53:03 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 14 Aug 2026 13:53:01 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 14 Aug 2026 13:53:01 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kzwx0uSQUtqN1r9FRegP/hQ86ZcxTdD2k3s0N2aJz5xNK+ZQHCfIXeqTFX5x2CHSaOFjfZJoajKOoq1gVCXuL9vruT6AMMSQ0rVuZpat0BUwPbsvKb9yDHwottBk6Av20PeRYW9JpLSvN6Mzef5wt+l6ahtzZNflHeg6QkWuzqkSeE0pg6ee2kQ5laKN6GonbDLCNiR8mymUzV1KW8gb80ghSbq24VxFJVp+3qpS01RSFwgA6W0ARE6PGLZSD8IF9T58BgpU7BoKJ0+gm0nhkDRY6TCK8w5w3E2i/ooHHvmxh/J0ht4dccdR0bBaKNgBxluBNFAmLGxm96EqNnerQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJZs8bMRVKmGs4Cd3LHuVa9ANwwZwquKKBIWb6XCSpQ=;
 b=Lwm6ewr4dIx9zAxSsQeALlVAcfzyiuZg77/Gl7t+AxxZ6Amp6oK5dghFRVJuZdJUONdVTE4OXMHuJ3ng0DZHvcM3iiwr+KyVnkNLnjbHGDf36vhe4KgNZ2YK0svzVYrce2rbfexPJMXoQVWayJlOMkGwjKY2KbXOvTJizhsYV7LD2pek9YU7dIJJKnlg67x8JPGvPIbXgqJ6RfM+VxvqGyKDc0U/gNptJRuFbylNuKBMwvXc7yG2xXw/z9dCXxJFY+TS1lTZYCwFi5yjtV8gdEIViTOA5zid9dF63iFjH3B1rnydISD359yLGcGd1o70zUe20DzKs8qZE0G/ItQlZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=airoha.com; dmarc=pass action=none header.from=airoha.com;
 dkim=pass header.d=airoha.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJZs8bMRVKmGs4Cd3LHuVa9ANwwZwquKKBIWb6XCSpQ=;
 b=bMEuo1fCWm5MfTfeHzbmRT0QiostR1r12GHGh2jyClcZM5mg0TwsZ6k9x+0TuGR+H9uFQccR3vDzxfKcyC/kCAFzlMNdNUk+wTqXfgfysBDJ6UtAPAloRG85+t9Ru5dRqMRxNV5iFxA68Qarnv/6ncjSHUZBMGHvr4ghYG9QZyE=
Received: from TYSPR03MB7881.apcprd03.prod.outlook.com (2603:1096:400:482::8)
 by OSNPR03MB10058.apcprd03.prod.outlook.com (2603:1096:604:496::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Fri, 14 Aug
 2026 05:52:59 +0000
Received: from TYSPR03MB7881.apcprd03.prod.outlook.com
 ([fe80::3c23:dd73:e52:6a7]) by TYSPR03MB7881.apcprd03.prod.outlook.com
 ([fe80::3c23:dd73:e52:6a7%4]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 05:52:59 +0000
From: =?utf-8?B?TGV0byBMaXUgKOWImOa2myk=?= <Leto.Liu@airoha.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, =?utf-8?B?QnJvd24gSHVhbmcgKOm7g+afj+e/sCk=?=
	<Brown.Huang@airoha.com>
Subject: [PATCH net v3] net: airoha: Add retry mechanism to
 airoha_qdma_set_trtcm_param()
Thread-Topic: [PATCH net v3] net: airoha: Add retry mechanism to
 airoha_qdma_set_trtcm_param()
Thread-Index: AQHdK7EpU92nARSnGUaIVGzVUkKy9Q==
Date: Fri, 14 Aug 2026 05:52:59 +0000
Message-ID: <TYSPR03MB788128C2AB24C778F8AA3DEDE5DA2@TYSPR03MB7881.apcprd03.prod.outlook.com>
References: <20260622-airoha_qdma_set_trtcm_param-retry-fix-v2-1-95a83ac99dbd@kernel.org>
In-Reply-To: <20260622-airoha_qdma_set_trtcm_param-retry-fix-v2-1-95a83ac99dbd@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-rorf: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=airoha.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYSPR03MB7881:EE_|OSNPR03MB10058:EE_
x-ms-office365-filtering-correlation-id: 4b920011-f75c-4497-0b5d-08def9c84bbb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|11063799006|38070700021|56012099006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: bNJVChlydroGwX0cn49Yptyo/voXhEuiwTHAOk22VMzRtj+xH6X3uxuCi0otz7LAKRI9SUb5wSM2gwTSnzf7xpvGycR30j+w4yS5xpab6V4ka90APYSqbz44sP/F3mfB5NxNmjCfqgZhkJkYa92ASJNFu7H8KyMGcuIKs02PeCcYl3XdWAjcegUtFKGyoBf0LdcH0JKNstu4CdbkDbwKaOEULz+ox+hl3xPCklL+Fvo+lQsaH0YZfj8RQbabCJntoiF7/OLJzQLto8RNOgu9QIXunTLDUL6nc3s3lRKH6V/YCO79UsFL6pyInXTca9P/0S4SygDGylY9i3UMdi86zzQuvII+P+uTBKXa/JacYWqd0eviiiR9hFjSVmHXd2MhYzX1fL/gmIZrd+FW2SsXnPAvMRFpDSgUvXTSKShGZovB8r1F8JDIETpcG3BHDIeFWP49tYqqjZfyI9ZHzia4yntUh5wFzLqnKQ3w/RUbOjTmHd09rMYU6bq+osbYI/+yNdoiyZTrkXct/fHGCdVn9HGLdh/bRTEdKQiFJ5SxLM/qc0wRxTeuIK3Yc8in/hd95PdotfuodkzrAWcIHM9euL85UIu+USWNmOTcSVrH90adNlZoa89/BCvvSTvxAxhc/zJTQZ8ItBTJOCcDERcBZkebXVY8HFQa/JD55guv3TA794EhKG2QulvTH8iCsRA1qCqhE2bFE6wdYERBFG2qzIjA3yR7rEafxA1fRq+snyU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB7881.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(38070700021)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bHRzaVZYSU5UYjgvQVc1b3BwSXNhTEZTMEp3Q24yWlNTZmRyTTU4R0NmOVBF?=
 =?utf-8?B?UUxYMkpUL3hySWJnelR4VC9xR2dBT2ZiTm9JaUJTSExxaDZWNHdObGxScjdx?=
 =?utf-8?B?cmcyaUlVNTAxc3BGdjA4U2NyWUNUWGxhaVBLeE13eDBOaXBCZVVTVTZkcWxn?=
 =?utf-8?B?clV6M2JJYTBXa0JHbVJhTU00T1pxbkZMSWloNXJ2TUdNQ2o3MUJqTnNreS9l?=
 =?utf-8?B?VGI3TXB3cmlDTWlvUVA4NWk5VG85NnVyV255OXY2R2ltUk5WeUZqUmlDTDVE?=
 =?utf-8?B?enQxRVJ4YXNqUTFLME5nMnFBbXprSlNqWUdIZnlhakhUMEYzL29vbnF0Y2FH?=
 =?utf-8?B?RGNsQkp1TDZtQTZFZWp0WDMyVlZrMGJ4NVBKSGJXMDZSaHpNM21FM0ZBbFcx?=
 =?utf-8?B?WnduV0tFcmZ2eGlZdVoxbzJBZkVvWnBXRWpkeGZ4MndmUkRpd2NObnZrclFw?=
 =?utf-8?B?NFdvZENnS1paTGhpRU5uRDdKcDgwNTFaTkozN0tvcm9CYUdHSjdFaEZyTXZR?=
 =?utf-8?B?a3NyM3pyeVIwRjB1K05SbHZ5bm5FRWdJV2wvY2orOXRtZVIvZlR3VGQ3bUhr?=
 =?utf-8?B?eWhnQll6UldoRzRFeW5DaWZYUFJzeDNOTCt6NDl4aVMxeVFzTUJmOHdGNzIw?=
 =?utf-8?B?UXN2dm9oVWJHUmdST0NRRXQ5QnZiWWlTeFJyWUZPcThQZ3NVQUYwZ212ek5k?=
 =?utf-8?B?QWw0THdKWnZYYzJrVGlVSmc0R0hjRnlqYmZMRHJ0V0hLbUhqNHRDZTE1ZVAy?=
 =?utf-8?B?N2ZwM1I1NGlSVGEvRC9oSXBPQmdMREZxeERQT2xMcU5aeXZ3aU5adytvemxp?=
 =?utf-8?B?ZmkvbXpPdnlSSkZ1NlpnenhpR05kMThkVUVPWGJYR3lsVjBDTTRrdElJb2Va?=
 =?utf-8?B?Q3loOHd0Ym5SUmNHaG1JK0J1Qy9nMWpiRnRrcTYvNUUxSk83Z3V4S2Z2ZGtj?=
 =?utf-8?B?QzZoRkR3S1pFSWtpallMbUpsNXR4UHNESzl3QTFhcUFyaWtUM0hRRStQemRt?=
 =?utf-8?B?V0h6a0Q5Rk80dXQzZFRBS0tvbktnR3BsY0ZuVUJqNmN0WE85Ky83UVFpZzhx?=
 =?utf-8?B?c3dNOEdpVGw3QUxXUDhlY2hRa3FRRWtTc2tlbGtoTGxIMFRJcE8rMnp4MnJR?=
 =?utf-8?B?a1dtdW9oQmFlMG9RQkc3eTh3cCswUGxkOEtqc1pLYjFKUmJZTm42NmxWT0Z2?=
 =?utf-8?B?YjJpeTA4TElBNTBRWk0wVDVpRWxJNVJScVNISkViR1p3Q3pkOFFFd3p4bldx?=
 =?utf-8?B?NG54S084WjlOR3c1WkVIdjg3L0Z2bVJYai9FYkZDSkR0WVd5ZW1aQVZNZkEw?=
 =?utf-8?B?ZExHemxub1JNU2Njb29RcGpVb1F2a1Y2eVNFR0V2SlNJdXlxVGFpTUMxbitO?=
 =?utf-8?B?NGhrT3l1eXB2ZFhWaS9tbVA1TW42MTJrbjM4WDlzdDJ4TC8vMzNjVlliTkIv?=
 =?utf-8?B?RUJ1YndlR0x3Z05OZktXOVpBVjBsci92blNuc0taNWk1Q1B5TDRpY1lBejVa?=
 =?utf-8?B?a09YUXFZK3pwd1ZkcGFkS0o0OXFhdk1RNk82SG53aHkwQTIwZ0hZTEhFS2JW?=
 =?utf-8?B?TTZUYWxkdWtHYThER3FKbzducmROVUNyMXF6bU1CcW1BUlRpckxrZzc1TEIr?=
 =?utf-8?B?TmQ5anBJcmVzdzVnWTY5Y29hbHBDMGdBL1p6eFVZb3lLOU9wQThYaEdLZkhu?=
 =?utf-8?B?Y1lhbFU5MnJsZGhuRG8ycDdMZDhBN0tSaUw1ZzZwWDE1ZFhhUjJ0bFVoQmdR?=
 =?utf-8?B?YXoxM0NEamdwU25HY01EM1RYQ0lWTkhxMG5tcEtpN2Q4VVErRFVmWTVGVWVE?=
 =?utf-8?B?Qnd0ZVAxeklhVEljUi9UUEd5UGR5YkVvUDM4aVMvY2ptdWxTMVVKUElGd0V1?=
 =?utf-8?B?RXlZdk5GR2YxV2U3UElYcEpROGtoMTErV3ZQdjRiSWtyRkpML0Q3cG00T0ZN?=
 =?utf-8?B?ejJXaDc1b0RjZ0VxanVzRThQZzZUOHdLU1MrU25BWjdDNVlaTC9yQTNueWhJ?=
 =?utf-8?B?NmRZMGRsMEN6R0h3YWJNaUl3cDMyZlRTU0tiUFVmRkVXWEdseG9DdDdjck10?=
 =?utf-8?B?YzdKTU5FZ1o5ZElzVFQxaTNOemowQXc1QTVLdGsxenRIZXVqcE5FS24zaThI?=
 =?utf-8?B?U2pFaVlBZ3YrRURIUURJUFlXM3pSSVZaQVZXYktSbXppRzlKZU1FODYvbEdC?=
 =?utf-8?B?cmxUVXZweUtkOGltYUpFM0RpNXZzMXlDVVprK2RoWlVWMTVHMVZ2bmRLQXRp?=
 =?utf-8?B?WUNqNjlNZC9pS0ZXSm5LOVZvaWt4cW4yRitLM2NSQ1VpcFU1MHJMeVdCMWNM?=
 =?utf-8?Q?0M+k+u1teMmgnEUdjP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: U9jA5VDYU3KIhtRm1JdazkUZjy9FpFlrgmHrMC8NCP5hWDdhqJVuTSf1p2X1ag1ankfnVjreqerrmv4HcXcmG2yxY2neecf7+sFHjcaIZfMJGQWDUiwSofcu27iHINGfUFoqBX/QaO5JcALXsctlhFfzW0QVUuVEhd2xl5oVz/utMgwQ1rPkfUmEvG5/wN8dQ7v57IoAM9ZNIHM+BvEA6DOuBJf8h8Yqu3WcRdQWQEkDhyiQNrcQHdII8KCg4UoPp4tOy/t0t7VJ8TcE3j+ZMubNStkyjv9/5HZg4s72tz6iXX5hpyQAlBIGli0CaR/Q/CYo+c4tJfG7CIUYhnPwxQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB7881.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b920011-f75c-4497-0b5d-08def9c84bbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2026 05:52:59.2272
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GRgekb1xOP8nWeU/g2nBvowA7gkjXYx+K2PBh5NEZ2af/nt9tl7FqKwhEvXAKHeouyQonnC9SIW0xs+3JugLlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR03MB10058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_225311_528155_E1B3C982 
X-CRM114-Status: GOOD (  11.18  )
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

SGkgTG9yZW56bywNCg0KVXBkYXRlIHRoZSBwYXRjaCB2MzoNCg0KDQpkaWZmIC0tZ2l0IGEvYS9k
cml2ZXJzL25ldC9ldGhlcm5ldC9haXJvaGEvYWlyb2hhX2V0aC5jIGIvYi9kcml2ZXJzL25ldC9l
dGhlcm5ldC9haXJvaGEvYWlyb2hhX2V0aC5jDQppbmRleCA3OTQxOGU2Li45ZmExNTQzIDEwMDc1
NQ0KLS0tIGEvYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9haXJvaGEvYWlyb2hhX2V0aC5jDQorKysg
Yi9iL2RyaXZlcnMvbmV0L2V0aGVybmV0L2Fpcm9oYS9haXJvaGFfZXRoLmMNCkBAIC0yNzEzLDEz
ICsyNzEzLDMxIEBAIHN0YXRpYyBpbnQgYWlyb2hhX3FkbWFfc2V0X3RydGNtX3BhcmFtKHN0cnVj
dCBhaXJvaGFfcWRtYSAqcWRtYSwgaW50IGNoYW5uZWwsDQogCQkgICAgIEZJRUxEX1BSRVAoVFJU
Q01fUEFSQU1fSU5ERVhfTUFTSywgaWR4KSB8DQogCQkgICAgIEZJRUxEX1BSRVAoVFJUQ01fUEFS
QU1fUkFURV9UWVBFX01BU0ssIG1vZGUpOw0KIA0KLQlhaXJvaGFfcWRtYV93cihxZG1hLCBSRUdf
VFJUQ01fREFUQV9MT1coYWRkciksIHZhbCk7DQotCWFpcm9oYV9xZG1hX3dyKHFkbWEsIFJFR19U
UlRDTV9DRkdfUEFSQU0oYWRkciksIGNvbmZpZyk7DQorCWludCBpOw0KIA0KLQlyZXR1cm4gcmVh
ZF9wb2xsX3RpbWVvdXQoYWlyb2hhX3FkbWFfcnIsIHZhbCwNCi0JCQkJIHZhbCAmIFRSVENNX1BB
UkFNX1JXX0RPTkVfTUFTSywNCi0JCQkJIFVTRUNfUEVSX01TRUMsIDEwICogVVNFQ19QRVJfTVNF
QywgdHJ1ZSwNCi0JCQkJIHFkbWEsIFJFR19UUlRDTV9DRkdfUEFSQU0oYWRkcikpOw0KKwlmb3Ig
KGkgPSAwOyBpIDwgMTAwOyBpKyspIHsNCisJCXUzMiBkYXRhID0gMDsNCisNCisJCWFpcm9oYV9x
ZG1hX3dyKHFkbWEsIFJFR19UUlRDTV9EQVRBX0xPVyhhZGRyKSwgdmFsKTsNCisJCXdtYigpOw0K
KwkJYWlyb2hhX3FkbWFfd3IocWRtYSwgUkVHX1RSVENNX0NGR19QQVJBTShhZGRyKSwgY29uZmln
KTsNCisJCXdtYigpOw0KKw0KKwkJaWYgKHJlYWRfcG9sbF90aW1lb3V0KGFpcm9oYV9xZG1hX3Jy
LCBkYXRhLA0KKwkJCQkgICAgICBkYXRhICYgVFJUQ01fUEFSQU1fUldfRE9ORV9NQVNLLA0KKwkJ
CQkgICAgICBVU0VDX1BFUl9NU0VDLCAxMCAqIFVTRUNfUEVSX01TRUMsDQorCQkJCSAgICAgIHRy
dWUsIHFkbWEsIFJFR19UUlRDTV9DRkdfUEFSQU0oYWRkcikpKQ0KKwkJCWNvbnRpbnVlOw0KKw0K
KwkJaWYgKGFpcm9oYV9xZG1hX2dldF90cnRjbV9wYXJhbShxZG1hLCBjaGFubmVsLCBhZGRyLCBw
YXJhbSwNCisJCQkJCQltb2RlLCAmZGF0YSwgTlVMTCkpDQorCQkJY29udGludWU7DQorDQorCQlp
ZiAoZGF0YSA9PSB2YWwpDQorCQkJcmV0dXJuIDA7DQorCX0NCisNCisJcmV0dXJuIC1FQlVTWTsN
CiB9DQogDQogc3RhdGljIGludCBhaXJvaGFfcWRtYV9zZXRfdHJ0Y21fY29uZmlnKHN0cnVjdCBh
aXJvaGFfcWRtYSAqcWRtYSwgaW50IGNoYW5uZWwsDQoNCkJlc3QgUmVnYXJkcywgTGV0bw0K

