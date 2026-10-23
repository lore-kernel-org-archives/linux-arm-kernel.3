Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A644606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 19:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RQHO+0bV;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=X2xLV8kw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2RPTICTgxeq6cpIcy+qSphAHJPQjIv/DimT41cgWwEs=; b=RQHO+0bVUWnFWaXdzWDoQvc+LP
	SvD7zWDkIBDiaV8w9INrM9hmtTuMBBNNdqJ/d4fxPLynfxfRwhlVuj7nyeVA92/KoxkJpmNyNoWAa
	TdWOz1Ruos9Vtrbbn4QxHm0dt6cDvva9kkF5q7ii/jKqoptj/UNpBW7ehRfbFF5qqx+peehVg06u3
	c9QFIxwX96BzThYeWlM0fRiZJzVtBlLq1OW6885jygAmrkZjfHL+EQpnnaI7q7zJC4+RuOWUYd8Bn
	OUmswsqs1T13aN2vQYyQf4u3Fd8/IYBahjB8KsN9cxdAafu2dHPdnme5xvi3MZ4fnOATv1qJAGwWl
	EGimhySA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKLKN-0000000GtId-0upy;
	Fri, 23 Oct 2026 19:53:23 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKLKE-0000000GtF3-2G2n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 19:53:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FI5T1mJdeXbSgPp/YznUiqOKTSiOFLoiyfOEU4gXMlANVBsgkCy9CIFNxis94OieCPi5nkCpP0ht99kdBfkA6xWq1j8wSK6xh8h2zXchSjE6y5oaBnutUS5D0bPFiGfnnlRwXNgVbWJQ74RwFY58QFU0I3Cq2Iy6w5S61mv82odes9TfYAp4YyoFFkSEDzfUxAzx7SuakDrrNxbqSX0BcNoPPalJ18kDp1CsNcPEAkIXkEAwOsS4I4pPgWDL/+xpASjDnyg9NfT/nj8HJ5bP5De1lHzY6eYU1XbyeqVLBTiOS6QLwHLJ6uaHELHE//MqOyQIXZ+JX8mLXT7JYnpGoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2RPTICTgxeq6cpIcy+qSphAHJPQjIv/DimT41cgWwEs=;
 b=bivnJDTtlIkV8ckWRZULfA29ZN/oHaaohA0T2qwFO65UrUqkqe3rirePSwJQESvJTq8LTq0h7GH5uNcr7dqUIQRAlLOP8B3BkyDQLxqw43IC6YgBe+K/qll+mUUvdr4Jx6yh69xcmAHtRC6VJHpOU3BYoBu0r1vuSW3MBf8GXJ6tS5XJetflUnRTP8AJhtjPwIGe/wRwgz350zl01yz4f/4VlhiyekQs0wgNnDseQw+DMdFFhcpZ+iCBIKtr4KC2Br756W107wJ6fOg2ObsZ2QFrRj93ZsjEogSVFsPEfLGr5ZEGGoNhdJCdTBqjFYX4GekYDj/miTzMhBcVlAEQgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RPTICTgxeq6cpIcy+qSphAHJPQjIv/DimT41cgWwEs=;
 b=X2xLV8kwsh6RTaGQSq/uSmqk9wYiKyNx2X45M0dtPPiTxrLUhHfqhMv+l/fybj+RJ6TP9BiW+afDHlsaphwHxwatm5nSzB9hPWiS/Sl14BI/kLaFMdpqoWxTeLK3kQFzJhhb6OAOttlMBBMJFgDBPipy/mxOyfBCJZWRF/KPWXPuMC2+1nvM5MKbGvwvwPp9XcCWPxbrzul7937U9ArnpqGVQPF/RV+zWBtM5cy7R9ssdq0gaiFdhFEQwMtQnSD8wFXd+ccLq9vgJsrxstxHf1doq2eK9TERmOzK7dItxjgz0PWUkJV7nhn1eysFqjmzxZdNKrVwVEFPY6GG1+XB7Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DBBPR04MB7978.eurprd04.prod.outlook.com (2603:10a6:10:1e9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 19:53:11 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 19:53:11 +0000
From: Frank.Li@oss.nxp.com
Date: Fri, 23 Oct 2026 15:52:49 -0400
Subject: [PATCH v9 1/2] dt-bindings: remoteproc: imx_rproc: document
 memory-region-names to avoid implicit ABI
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261023-memory-region-name-v9-1-ad597887dfe9@nxp.com>
References: <20261023-memory-region-name-v9-0-ad597887dfe9@nxp.com>
In-Reply-To: <20261023-memory-region-name-v9-0-ad597887dfe9@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792785180; l=2460;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=htOxPrGB8bnLPW/iqljdOOO+XnPG+AzYvPXfDL5nNeM=;
 b=db9czUienL5vFJFqfl+D/tUx9abEHMzrFoCTp+whDaXJEBsKLEYegpO/Xkll6ZJpbDRJSG/Lc
 J7lx8vIEFcFDl6gD1zekB9VMnjv+84nm3yAKxJwbl2AIjLwn6g4UPjn
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR07CA0018.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::15) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DBBPR04MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: 2408e819-de0c-4f40-b6dd-08df313f4442
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|19092799006|376014|7416014|1800799024|18002099003|22082099003|10067099003|11063799006|56012099006|261009223027099003|261022105027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: tKJipTP9DW9bZf2Zp6qIr1hupWoXxBD1oQcYNrDq1xUQbIAn5vp2v1zrK+/rdLhY/dWUIPFEZ2TSDXHk11adSBQ9upCzz1IF+hUGW5dVF7rdFSQjUkIjv+VWA9mkbnJ2yd6pLY5h1+Yf3xkQMPWLFVBuoVLAgBT9U/1UY9VvpOU25ygsQyvlypnQO2Q5BpYKge6YMPlSH3DFFDqXn0k1JBAQhRvlObXbYK6BNBlEAYU+qHHN5bkl3cRiQoHUZqxvgN0B40o/RFxsT3uSRV+ATamwqDNFcXbeB/UM2ZBpMU/5CNuovaPR1X7tvERetXPe+YEKpAnBkM838lFwiO4WXP4kejPm07WCgZfE4MQz8NC0PiKist3aQru6/BQeTFaZc81W/wBqYyPqHXR6OmacKicaTuxhh3OsbUqcsQDmc+Ns99j7IH2EgMEGkHyOA5/3RogCZyB45sElKxQfeOVX/RjOxH0FyVC23clpNSL7f/5e6i4Wg+pcyxdRq3x2+F2wNP+wDx7uzbn8UWB9t33Ca1WGt/5n82WmJCgrE4UIaEOP3XswcyaCBCwz4TtHAZGAJMzNZtswyICD5i6Ot9GdR1zMFs9pwB6Ej4SbTMUN76+zs4BBCAKaGUbNe6VwE2PI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(376014)(7416014)(1800799024)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXhqWHZGVTBvU0JDN25SamlHOUNONytuOWdJcWlybTU4N29BcEh1T0Rhd0VN?=
 =?utf-8?B?MEZhNjM0a1dDTDJMS3ZKaEZFMWwxbmdxOFNyT0dGWCtxQmZTKzNnNXNDb2h4?=
 =?utf-8?B?SGkwMHhsOWg1dDZvZm8zM3YrVzc1YUloRmM2Qy9kaEorRWRjQXB0NHlnYVp4?=
 =?utf-8?B?ZldNZnVvQmQ0QVgrakp5eStnSzBUeEpJN2xNTmZIOENQWldJczFuZXhieU9M?=
 =?utf-8?B?dm9abDhXOEFzYzJ1empjczZZMzdKUVFnV0wzSndnbXc4TlBtYW5sVXQ5L1Zt?=
 =?utf-8?B?ckNZcisvNXZWYW1qdXhSM3ZuM05ZaVpJSjZrbUhlK0poNGtGT2QrMlkrK0tO?=
 =?utf-8?B?emYxSUQyeTJQVzJ1eEJocE90TlY2czlyZHNUbnVIVHZ3ZU5nekNHdVlob1Np?=
 =?utf-8?B?YkVOK2VKY2RrNFppZHg2c0JuNGJhM25ZN0hpME9DZCtGVTlVbmNSQ3ZWenhP?=
 =?utf-8?B?Ny9vRVhjVVZrbU85eFJkU3c4QmZvbCs3TmFQRkRtTitOVzZmRnFRY051V1JB?=
 =?utf-8?B?aEtTZmpNTHNCdFhPb242TTFCRXlvdTIvWEhHNzIxb2N3aVRIdWt3cEl0UXFv?=
 =?utf-8?B?OUZTVm5jL2lYTnQ4MjJRL1ZPcXdIWERaMHg1cXNDU1RmOXVGWGlsdzBsaUg0?=
 =?utf-8?B?SmJmSGZ3eGNVMFNkSmx1MW9Sa2pvbVhaZ0kxeDZ3eHZ5MzZKVnZrNDZrUkV3?=
 =?utf-8?B?M2ZlZ01MeVJnWThEYTZSb2wvQUxxNlM2dUplSXUzSmpFV0hOU3h5UXhpamo1?=
 =?utf-8?B?SnNGTTJ2SHpDZTI3VXM0SEJReW4wcUtTeVRzeDI5RFhhTUNPQUtJTGFCQm5L?=
 =?utf-8?B?NlI5ZXp5T1NqSTJjcVh3TXcyMGY0bmxXVkgxQXRvLzNZNHYrSEoxd0Vkdllp?=
 =?utf-8?B?OGJ1OFZWTEY4c2dGMGlZVHYwYWxtN3ErM1hhMjRETEFIbGdGK3pZUW5EVFBE?=
 =?utf-8?B?UHBrcFFEZHZ1bENKbmhIMURPSzdQY3BoMnBjUDVwVXZIMmpKdDlEVnpWTXNC?=
 =?utf-8?B?MS9Qc28xN0V0QzlFb1lONDVJb3I2MG1ycU83ejRXNm5adEc3OHNqS1dOS1o4?=
 =?utf-8?B?cVVQRUV3K2xaUFhBalV6YTNjWmY4bzhSVVpOYmhUSEFTcm1vY1RmZWtPL1F4?=
 =?utf-8?B?cmwwSFFhODlMeDB3WFBDeTExYzY1SlVYUzl5RzQ0Wm1VeUNrNkdpNU54RWFr?=
 =?utf-8?B?OTVtUElKT0pHMGJXVnBPM3c1bml6QTdqWjBpY1ZJT3RsWXBuUnhremhld2x1?=
 =?utf-8?B?cTR2ZHB4d0Ixa29BL2RyNk5ycTBha3Z6RGc4K2N0ZFZwREhzVHFGazB5bHhR?=
 =?utf-8?B?czh1TWl5dm9wRTVjMHdMb1FVN24rc2kzQW1zcVl3WGx3dXlpOWJrRDFYbmln?=
 =?utf-8?B?bmdwdFRkemRkSXQ5eGJsQWNzVGVyQUxLeDY2ZzdKY3JUVktXS2JySHVHVEFx?=
 =?utf-8?B?akJySHBMdTI2dmVrQk1adlZxZEFqd2h0UTA4QTd1TkVESHRwRks0dTZCWEVY?=
 =?utf-8?B?d3ZmY2lpRVlZbmJ1SHRsNUs2bHUyenhEREJqNExGTGN5NUJyU3htZk9FVmow?=
 =?utf-8?B?bmhncWM5ZFJkcWFOTXJiQXBkZktmSExXaGYyWUVKYWJjVzJCcWduM0JZdUFI?=
 =?utf-8?B?TXdsd0JwV1NxQmZWOWVUc2hlSUNzNUNlTHFlWlQrTmoxOVZVM3FmNk5wclNJ?=
 =?utf-8?B?aEpLSVl1eXpSSDFMMjkzVUk4dXh4UkI5Q1diWnVaV2NBK2FvSWMxS0pkcmQ0?=
 =?utf-8?B?cW56RWFFZVRHYWtGMFN0NGRmTEhjRC9xVlF0aEVzZ3hHSG9yNFlyMG9tVURM?=
 =?utf-8?B?dzE5N0MwQWRyUjdCWXYweGI1eU9tY3RrR3Q0aWhpTzNCc2x6eVM4MGdkTGl5?=
 =?utf-8?B?bnFDZElhRVR0ZXJZQlNkYUZZTVRVMENjYytUZ1JVVVRobWcwK2l4UnJHTFc0?=
 =?utf-8?B?eHc1b2RHa2l5WjFCenFDWjFLV2xuakVRL2laZHFmUFpKVFgzUDEvZXdVd04z?=
 =?utf-8?B?b1Yxb1lwc09wbnljK2xRa215TklBQWJOdDVXVC9VL09ab3FKMFJ3TjhVaGdj?=
 =?utf-8?B?TytHcTRRdXFKOTVUOHRsYnB6RkE0eDFBTFRsakJnK3VTdDBOQ3BVVi8rQ3JB?=
 =?utf-8?B?dGtoNjJiMXpRbUtjMjNWZjVsNzJvQmlFTnFrcjNXTW9SdjRCMVI0RElxb2tV?=
 =?utf-8?B?dGNRUjVNUG9JZHIzRmZJWVZHRnI4akREeDllZHFEazVvanZFVzJ0S0E3R05m?=
 =?utf-8?B?MGFycjdpUmNPMEFXUnBrWDI4MWtIU2g2SDhDRVlXT2VMemt1MTh6UmY2UkhU?=
 =?utf-8?B?UFQySjQ2ZVMyTUdDVzhGNm53SVluaE9TeFdRcy9DUHkvbXdMelBqVVNXNlVX?=
 =?utf-8?Q?T0/d3ViNg1r9qqSTnecNsmM0OfTfieXJpluEE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2408e819-de0c-4f40-b6dd-08df313f4442
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 19:53:10.9998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WWMyhpfWKyc215HgFwjabMqIjborxIjLuq+dG1aIu5HPZEA7fcIAC84YU60CcqfOIgRwy6q1Gc/rcJjQmDs8apsb9GiXrimjne7FnAt7DMUbk0eV+BljKpqKQ9soBkD8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7978
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_125314_655788_305A9D77 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 0.0 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Document the optional memory-region-names property.
 
The driver currently derives the memory region type from the referenced
memory node name, creating a implicit DT ABI. Since memory node names are
not constrained by the binding, incorrect names can silently pass DT
validation, as seen in examples using "vdevbuffer" instead of
"vdev0buffer" ([1] and [2]).

Add memory-region-names to explicitly identify the expected memory regions
and avoid relying on memory node names as ABI.

Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Use optional property to keep back compatible with old platform.
New platform should use memory-region-names.
---
 .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index c18f71b648890..f87036299a7b6 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -62,6 +62,15 @@ properties:
     minItems: 1
     maxItems: 32
 
+  memory-region-names:
+    minItems: 1
+    maxItems: 32
+    items:
+      anyOf:
+        - const: rsc-table
+        - pattern: "^vdev[0-9]+(buffer|vring[0-9]+)$"
+        - pattern: "^m(4|7|33)-reserved(-[a-z0-9-]+)+$"
+
   power-domains:
     minItems: 2
     maxItems: 8
@@ -134,6 +143,7 @@ examples:
     imx7d-cm4 {
       compatible = "fsl,imx7d-cm4";
       memory-region = <&m4_reserved_sysmem1>, <&m4_reserved_sysmem2>;
+      memory-region-names = "m4-reserved-sysmem1", "m4-reserved-sysmem2";
       syscon = <&src>;
       clocks = <&clks IMX7D_ARM_M4_ROOT_CLK>;
     };
@@ -149,6 +159,7 @@ examples:
                 &mu 1 1
                 &mu 3 1>;
       memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
+      memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1", "rsc-table";
       syscon = <&src>;
     };
 ...

-- 
2.43.0


