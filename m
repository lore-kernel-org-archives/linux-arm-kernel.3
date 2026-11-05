Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A66606A332
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 01:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nshnAyTg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=uyTMPlSo8J08T436NfenhjstbNn28KsY6Iy7AcCUSWY=; b=nshnAyTgZcWO00Tq0CxqafU42A
	zQTQZIvZawvS0hHCgoAMlup+KoQV5cB1BXJkboUC4OVXnfyOWupjcTcB9aUVIfEcrNsru7c7j20t/
	54oWmZHPnGvxRxmAzCCUsG4ZfVMHYfJJgQ0swa+CyZAmRGYfHROZqWligIzvqu2ImGrUVAVxUF2OY
	Vz3fyBDJhYsj6TmwnTWMZ/fT8rr8rgrBP4vxM79vH0d5SrlrtIuYRCJm6wZ2vCZZKugBrdXSBHd2R
	oiWjIVaWpJ+hMSGjd34uVW7CJusm5jKeOiP+9r3dBuUsVWuikaYGJeWMzLFegSXrZzvYJEGZEl6k2
	EqvECt2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOm7g-00000007RzR-2Zew;
	Thu, 05 Nov 2026 01:18:36 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOm7V-00000007RqI-0Kcb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 01:18:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXh2iVxrBqaibFqgLndYzWs3XAtPN89eoB7nRzMrK6kGi/GNNsWYsCrj5K6wqETk1Z69BtaXdWjkIIp1mTVGFVmj+JX6N+Vu6u3/2HTfF9BaF2gXheKb2xQL4i1leX8aC1lJjut9ahDA8Ew8Q9GJ/9JAZAICZVSLuTv5y4X2tmRuNJz5KVorjgk+FFn2XcCK5/clxxt6iKW4uHDHZCNt2xNlOpl+HPVJab7ZJ4kxTW44xAqeQVwkODy8EbEtEkQ/Od/TbU8UqLZIeO6rcZ06IzwsYNFmw4jMhRBwdyuwRzTo7XrsAKc5YpCJH6ekrA7psmX5jF4ZuTulnyJWbgRhgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uyTMPlSo8J08T436NfenhjstbNn28KsY6Iy7AcCUSWY=;
 b=qQ1io6aKyrhH+Jx3vxSf2Tckrm/HmIEGBRoYtyCXz4Q7jshfYNjnRAWBTsqWmggbJnpUZKGOTj+ifcv2+aSWLbwLqf2RWdK7q7UGItNXnDcRyCBQvMMdV1oZSnA742+LV0viihRWYIQ3yQDSxe2alCwuz1sPkf/rg6auxIB+TeVsnEx+hWe5RZvuX+OiNI16Lt/TP3bzTHTUUuNyUp//mTohzonfM2jFJFPmWjQX4sLvdj8blL3aFZYqOFL57QhlFYNLykYz1RJM5XJYT8iwTl/oiBjMgs3Cozso4sZzgaLh9yQXsL16h1S3iMf24mXPdZddMymKmCoHSlqHOeaYsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PSAPR06MB4439.apcprd06.prod.outlook.com (2603:1096:301:80::7)
 by TYSPR06MB6921.apcprd06.prod.outlook.com (2603:1096:400:468::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 01:18:08 +0000
Received: from PSAPR06MB4439.apcprd06.prod.outlook.com
 ([fe80::c772:e1f:2c48:f9ac]) by PSAPR06MB4439.apcprd06.prod.outlook.com
 ([fe80::c772:e1f:2c48:f9ac%3]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 01:18:07 +0000
From: =?utf-8?B?SG9uZ2xpYW5nIFlhbmcgKOadqOWuj+S6rik=?=
	<hongliang.yang@cixtech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen
	<peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, Roger Quadros
	<rogerq@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, =?utf-8?B?R2FyeSBZYW5nICjmnajmlrDkvJ8p?=
	<Gary.Yang@cixtech.com>, =?utf-8?B?RnVnYW5nIER1YW4gKOauteWvjOWImik=?=
	<fugang.duan@cixtech.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>,
	=?utf-8?B?SG9uZ2xpYW5nIFlhbmcgKOadqOWuj+S6rik=?= <hongliang.yang@cixtech.com>
Subject: [PATCH v6 0/3] usb: cdns3: Add CIX Sky1 USBSSP controller support
Thread-Topic: [PATCH v6 0/3] usb: cdns3: Add CIX Sky1 USBSSP controller
 support
Thread-Index: AQHdbMODCRmwEXC/EEm2gKkfb8EMRQ==
Date: Thu, 5 Nov 2026 01:18:07 +0000
Message-ID: <20261105011803.4058557-1-hongliang.yang@cixtech.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4439:EE_|TYSPR06MB6921:EE_
x-ms-office365-filtering-correlation-id: 53f79d5d-ff4c-48e1-03c3-08df3adaa65e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|10067099003|18002099003|261102123227099003|56012099006|38070700021|261021121427099003|261022075727099003|261026121527099003|261026140227099003|261009223027099003|261028144727099003|261022105027099003|921020;
x-microsoft-antispam-message-info: jtFrBBSU8v5NVS3YKfu32RBJ4jbBQRBd9LJk9iJlcgDI1zEZcWnDZahONHunMRrjopq+WEabRswTqJR5pE45RtGgPzktbIL+5oxIU1A9jd907vuIAXlwWlEzZjBcVW3IXqf7Obkd/njHtLFk8p27ATaiTcDhAaDUGjfZvl+eqTjauY3aNjWWsCUvaaM2HiVikMEW1JxfSlWOgII2iZcv3O+M+bIqnS9x7x/MNARXSg1+4UfJGkHFgvDwi0X7ctcNI5+hlAFrpIIdLB8ZerlOCSt90q+TNQV6yUvEUEnjo77Kb8N06fTsrA6M0iIHiCRSMUr7dXYloFd8v1XuAlZrwajLR0mZzL1GqTSfKizfYD0CpxxKEHc3QNxoMgUzpFgyMVmOc1sSZXCsxGpaTQkjuLMsJH81rfUyRhSWEuX8pDUFcgkLYI55exM2R/H4BgXjelw430PjM4EOIVDgJM3uw/e8qL7pjNIHGduwo7ir7xSu62WQj79qEVFbKPwG373jd5r+LzoXfb+J1JDsSWRau/VIta+NB4orSGKaSAZ7FFZXtBQ1cJlWr/s+vTeUeFcz84XI3l8jgNzdMhGFsInM4VNIxzfOvLl1onFXYZVJ5BCk/ucnDd4zQsPZ9S6UwxNhfC5KEO9prd3glUOJ4oE4gqEsso17sBuyDkpecQy93rDYotbAAh3F7pcuAYxQ00r+EDr0BFPzKtpvBiy3IyjOQOIWJxgOK188CBgNwRmYzWU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4439.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(18002099003)(261102123227099003)(56012099006)(38070700021)(261021121427099003)(261022075727099003)(261026121527099003)(261026140227099003)(261009223027099003)(261028144727099003)(261022105027099003)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZXg1L3ZQRkNDaUhzTjRaTGhCLzFhaTgzMDNVZEhHRkk3citUVU9zbUF6Sk9W?=
 =?utf-8?B?V0dUOWpYcmJ4UzEvSXdZZWxLekZ1MXA4WXhPL2JxZlROOE9CRmN0SHhBamU5?=
 =?utf-8?B?MUJJbzdXN3M2OG9pb3JOdWFiMC9ZN3VVVXU1K1lQQnp4R04yTStiaVdzUjlk?=
 =?utf-8?B?cG1mdVlieGRoS0prWU8raHc3OGFybW1uVWUxSlBwMmp6UGIydHBsY1FBSm9W?=
 =?utf-8?B?WUhSK1A1M3FPUjNoUmVwUG5kZFNwYjlQNVI4UnFnL0VtUUtYNm00VWZzdnQ5?=
 =?utf-8?B?L2E4TzkvbnAzL0g0QTB5bGVoNWl5ZVVWUlBqaVF6UXVsV1ZBZ1g5Nm9uY290?=
 =?utf-8?B?SDNUS2dtVy9vbWdLZFAydi8ydExJVWhjcTdTS1dJU0YzT3hsdkFPSUtDcEVy?=
 =?utf-8?B?dFA2UWo3cjBDbHNyeFl3R1Z3aXJQQWM5OWMydkhiODJqdFJPMFFFZERMWGtW?=
 =?utf-8?B?RVNpdHp0UitQeXR0dnpVRG9iNS9mL1JhdHRKeEVwMXBOejdEY3UzeUM4Q0Fo?=
 =?utf-8?B?OCtRblVwSXB3MkRZbzc5eUYyWlJQM0RFL1RpVjdycUhjZkpXSkY3MWJhOEpQ?=
 =?utf-8?B?Y2YzREh6Y3pjekJQbUtSdkpYWG1VOXNjK3d3MGExU0sybEs3R0d5cEw3eDBz?=
 =?utf-8?B?R3ljM1lyK1FNU2RTeldEWTZTZjBOaHd2a2VZZTJmWExBM2hPWGpWOG05dSsx?=
 =?utf-8?B?V1FxTVdtY0dFZk81TEtFd3UrdzZJUU5wUzBJM3R2b3kzWVh4OXNtK3pzdlRQ?=
 =?utf-8?B?V0NJbzRyQnVrSnFiSml1eTY1eWYzNDRIcUc1dzlRL1J5aUVyTXFOejVFNi9z?=
 =?utf-8?B?QlBLL25PbmxVajRiVXlaVUFHeVcxbmdydjAzMzlqVzMvL1hZcjhIL3htS3dU?=
 =?utf-8?B?YkhLcUdNZHBGckx6ZVZpNzBpRlh0aDNhc2FjMlFVaDJEMk1xUlZuNnBSZ0hS?=
 =?utf-8?B?MDFONFUydFhlbkdJZWh5YXRnQXA4MXZPYmJJUlZjMk43bHczbHVEWTNDRG1k?=
 =?utf-8?B?OUhnZFF6Z0dPdU9ZUmRTdm16WHUwNmlXd1FUOTFnbWFXbUdaYm5NODUyWlRP?=
 =?utf-8?B?OFRLYzdvT1gxcDJPb25ieVVQOGJlT3F3RkgxMFhEeFpMSnhTdGtoUDQ4VkJ3?=
 =?utf-8?B?ODhYelovUEhSblBVajRNRThtQmFTd2ZKNTZCNmxsL3BYRGNFSURsaE9uNTNv?=
 =?utf-8?B?cTNSa1lsSklTWWlTOHAvb2g5djlmdG5qVG1GZVZJOStHWW9KMDNlYXF5TWlv?=
 =?utf-8?B?UytQVk9IeXlaLzYxczNqb0tRMnlsZ2t4b3R3MXp0S29lcXlhVldZL0JsdmxE?=
 =?utf-8?B?OG5jOS9taXg3aFdOUUJ6Q2RmSnNvN1VBQ1RIajVST3oxdVJDSEJ3VHRDNjZY?=
 =?utf-8?B?YU84Y1JHVWZnVDdqL04xcnlFU3BzQ2RSS0hhcEwxbndXUW0wOVA3bHF0VThq?=
 =?utf-8?B?a2lmODJydFhTY3JGSjlOU3hQcnlTTTNlTWF5eDhYNjllb1p2Tzdybmh3d2pX?=
 =?utf-8?B?RDdqZFlzTzQvOWF1LzFkTGNnaW1ITEFtajY3d3FveEcxSnJjaDZBQXdrS1RR?=
 =?utf-8?B?dXRodlVWRnhkY0VVS0RhTWsrUVNXOXpxVWY0M1EyOGw1dk4rZ0dwREpCYm9l?=
 =?utf-8?B?Z2ZLK2hOOXBxWGVoSVdZSHkvdnZLa1h1MGIwRG1CaGNvVVhGeVF5NlJhUytz?=
 =?utf-8?B?SXdTdndGejVUaStmUTFIL3lEeitJL0loNjJxSk5GYkhWWGpzblI5Y1JZSk55?=
 =?utf-8?B?TEJtbGV5UDFGRlRQWFEvNlBlVGdHdkFKVmd1VUZ3REZ5Nm95aGJBdm9jbFpN?=
 =?utf-8?B?bFNyWm1RMDFBb3BpQ2FRaWVsVTNnWXpBbTRBaDY2dmhodXNyVlF5eFZPOEMx?=
 =?utf-8?B?eUJjMGxUbk9ZWU5zY21Bd29Wb0VXbzFFTUpYSjJnV1hjd3F0eXJxZjFPMEhV?=
 =?utf-8?B?bktuLzJwYVdHWEJLdVRGUFFvbWZUQVQyTms2WnBseGpwdFI1bkM3NmxkWEVQ?=
 =?utf-8?B?clZGYldLblRDMFMraExXYnNNUkVRR1FQYXVYRlllUEsyRkJ1ZUJ1d1FMVTJY?=
 =?utf-8?B?UTNiZkFwNHJHeHpUUzR4UWpDUmgzZGJFMGhVaTQvalcwaG0rbkpHOVpaR1FK?=
 =?utf-8?B?N1g1NlRBb2dpUnRjNnI3RGw5OGdUR01RcmYyU0VoQ05pRElFL0Zsa1ZCYTUv?=
 =?utf-8?B?Y2ZkMVRvS25icVlXbzVMeHo4eHZvYVM3STRwam1CWDhJMHd4a285Um1sd1Jy?=
 =?utf-8?B?cWNZaEJHdHZnNnIrKzl2L0srY2xTNVE0RUlWZXcwVVNjUnFXa0dGTFFGa0Np?=
 =?utf-8?B?R3ljS1I4aXlqTk43akFQZDBlcE9ZMzlIZXJTT1Z1MXYyck11Y0RKRURHdU8x?=
 =?utf-8?Q?TvDIyyHdGLD1ZqDI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F4AAF2FB45823F44867DF989B66A9F68@apcprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4439.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f79d5d-ff4c-48e1-03c3-08df3adaa65e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 01:18:07.7738
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gdPodoEzyXeD4wYpR4v2q4EcizMPfoHwSqGplPSRgwtjRDoqkKvxAHx2rVZNw1n5Q0W95a/OyVBIPHCrVKEjmwdRnrWeT+WKRGtPuUetBA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_171829_462771_4A5AFC0E 
X-CRM114-Status: GOOD (  17.02  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciB0aGUgVVNCU1NQIGNvbnRyb2xsZXJzIFVTQjQg
YW5kIFVTQjUgb2YNCnRoZSBDSVggU2t5MSBTb0MuDQoNClBhdGNoIDEgYWRkcyB0aGUgZGV2aWNl
IHRyZWUgYmluZGluZywgcGF0Y2ggMiB0aGUgZ2x1ZSBkcml2ZXIsIGFuZA0KcGF0Y2ggMyB0aGUg
U29DIG5vZGVzIHBsdXMgdGhlIGJvYXJkIGVuYWJsZW1lbnQuDQoNClRoZSBjb250cm9sbGVycyBh
cmUgQ2FkZW5jZSBVU0JTU1AgaW5zdGFuY2VzLiBUaGUgQ0lYIGludGVncmF0aW9uIGFkZHMNCnBl
ci1jb250cm9sbGVyIGdsdWUgcmVnaXN0ZXJzIGluIHRoZSBTb0MgUkNTVSwgYW4gQVhJIGJ1cyBh
dHRyaWJ1dGUNCmNvbmZpZ3VyYXRpb24gcmVnaXN0ZXIgYW5kIGEgY29udHJvbGxlciBzdGF0dXMg
cmVnaXN0ZXIsIGFuZCBtb2RlIHN0cmFwDQpjb250cm9scyBpbiB0aGUgUzUgc3lzdGVtIGNvbnRy
b2xsZXIuIFRoZSBnbHVlIGRyaXZlciBtYW5hZ2VzIHRoZQ0KY2xvY2tzLCB0aGUgcmVzZXRzLCB0
aGUgc3RyYXAgY29udHJvbHMgYW5kIHRoZSBnbHVlIHJlZ2lzdGVycywgYW5kIHRoZW4NCnBvcHVs
YXRlcyB0aGUgQ2FkZW5jZSBVU0JTU1AgY29yZSwgd2hpY2ggaXMgZGVzY3JpYmVkIGFzIGEgY2hp
bGQgbm9kZQ0KYXQgdGhlIGNvcmUgYWRkcmVzcy4NCg0KVGVzdGVkIG9uIFJhZHhhIE9yaW9uIE82
IChTa3kxKSBpbiBob3N0IG1vZGUsIHRvZ2V0aGVyIHdpdGggdGhlIENJWA0KVVNCMyBQSFkgc2Vy
aWVzIHBvc3RlZCBzZXBhcmF0ZWx5Lg0KDQpUaGUgc2VyaWVzIGFwcGxpZXMgb24gdG9wIG9mIHY3
LjQtcmMxLg0KDQpDaGFuZ2VzIGluIHY2Og0KLSBEcm9wcGVkIHRoZSBzaW1wbGUtYnVzIFJDU1Ug
Y29udGFpbmVyLiBFYWNoIGNvbnRyb2xsZXIgbm9kZSBpcyBub3cNCiAgcGxhY2VkIGF0IHRoZSBh
ZGRyZXNzIG9mIGl0cyBnbHVlIHJlZ2lzdGVycyBhbmQgdGhlIENhZGVuY2UgVVNCU1NQDQogIGNv
cmUgaXMgYSBjaGlsZCBub2RlIGF0IGl0cyBvd24gYWRkcmVzcy4NCi0gUmVwbGFjZWQgdGhlIHVz
Yk4gYWxpYXNlcyBhbmQgdGhlIHVuZG9jdW1lbnRlZCBpZCBwcm9wZXJ0eSB3aXRoIHRoZQ0KICBy
ZWdpc3RlciBvZmZzZXQgYW5kIGJpdCBwb3NpdGlvbiBhcmd1bWVudHMgb2YgdGhlIGNpeCx1c2It
c3lzY29uDQogIHBoYW5kbGUuDQotIERvY3VtZW50ZWQgdGhlIGNpeCx1c2Itc3lzY29uIGFyZ3Vt
ZW50cyBhbmQgYWxsb3dlZCAjc3lzY29uLWNlbGxzIG9uDQogIHRoZSBTNSBzeXN0ZW0gY29udHJv
bGxlciBiaW5kaW5nLg0KLSBDb252ZXJ0ZWQgdGhlIHByb2JlIGVycm9yIHBhdGhzIHRvIGRldl9l
cnJfcHJvYmUoKS4NCi0gUmVtb3ZlZCB0aGUgdW51c2VkIG92ZXItY3VycmVudCBHUElPIGhhbmRs
aW5nIGFuZCB0aGUgdW51c2VkIGRyX2Jhc2UNCiAgYW5kIGNkbnNwX3BkZXYgZmllbGRzLg0KLSBE
byBub3QgZGlzYWJsZSB0aGUgY2xvY2tzIGJlZm9yZSB0aGV5IGhhdmUgYmVlbiBhY3F1aXJlZC4N
Ci0gRHJvcHBlZCB0aGUgcmVkdW5kYW50IGRlcGVuZHMgb24gVVNCX0NETlMzIGFuZCBmaXhlZCB0
aGUgY29tcGF0aWJsZQ0KICBuYW1lIGluIHRoZSBLY29uZmlnIGhlbHAgdGV4dC4NCi0gUmVmZXJl
bmNlIHRoZSBzaGFyZWQgVVNCMyBQSFkgdGhyb3VnaCBpdHMgc2luZ2xlIHBoYW5kbGUuDQotIEZp
eCB0aGUgMTI1dXMgcHJlc2NhbGVyIHZhbHVlOiB0aGUgaGFyZHdhcmUgZGVmaW5lcyBpdCBhcw0K
ICB0aW1lICogZnJlcXVlbmN5IC0gMS4NCi0gTWFrZSB0aGUgQVhJIGhhbHQgd3JpdGVzIHJlYWQt
bW9kaWZ5LXdyaXRlIHNvIHRoZSBwcmVzZXJ2ZWQgYW5kDQogIFJXMUMgYml0cyBvZiBYRUNfQVhJ
X0NBUCBrZWVwIHRoZWlyIHN0YXRlLg0KLSBDb3JyZWN0ZWQgdGhlIG1haWwgc2VuZGVyIG5hbWU6
IHY1IHdhcyBzZW50IHdpdGggYSBub24tQVNDSUkNCiAgZGlzcGxheSBuYW1lIGluIHRoZSBGcm9t
IGhlYWRlciwgdjYgdXNlcyB0aGUgcGxhaW4gQVNDSUkgbmFtZQ0KICB0aGF0IG1hdGNoZXMgdGhl
IFNpZ25lZC1vZmYtYnkuDQoNCkNoYW5nZXMgaW4gdjU6DQotIEFkZGVkIHRoZSBNQUlOVEFJTkVS
UyBlbnRyeSBmb3IgdGhlIGdsdWUgZHJpdmVyLg0KLSBGaXhlZCBjb250aW51YXRpb24gbGluZSBp
bmRlbnRhdGlvbiByZXBvcnRlZCBieSBjaGVja3BhdGNoLg0KDQoNCkhvbmdsaWFuZyBZYW5nICgz
KToNCiAgZHQtYmluZGluZ3M6IHVzYjogQWRkIENJWCBTa3kxIFVTQlNTUCBjb250cm9sbGVyDQog
IHVzYjogY2RuczM6IEFkZCBDSVggU2t5MSBnbHVlIGRyaXZlcg0KICBhcm02NDogZHRzOiBjaXg6
IEFkZCBVU0I0L1VTQjUgbm9kZXMgZm9yIFNreTENCg0KIC4uLi9zb2MvY2l4L2NpeCxza3kxLXN5
c3RlbS1jb250cm9sLnlhbWwgICAgICB8ICAgMyArDQogLi4uL2JpbmRpbmdzL3VzYi9jaXgsc2t5
MS11c2Jzc3AueWFtbCAgICAgICAgIHwgMTU1ICsrKysNCiBNQUlOVEFJTkVSUyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKw0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvY2l4
L3NreTEtb3Jpb24tbzYuZHRzICAgICB8ICA0MiArKw0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvY2l4
L3NreTEuZHRzaSAgICAgICAgICAgICB8ICA4NSArKysNCiBkcml2ZXJzL3VzYi9jZG5zMy9LY29u
ZmlnICAgICAgICAgICAgICAgICAgICAgfCAgMTMgKw0KIGRyaXZlcnMvdXNiL2NkbnMzL01ha2Vm
aWxlICAgICAgICAgICAgICAgICAgICB8ICAgMSArDQogZHJpdmVycy91c2IvY2RuczMvY2Ruc3At
c2t5MS5jICAgICAgICAgICAgICAgIHwgNjgwICsrKysrKysrKysrKysrKysrKw0KIGRyaXZlcnMv
dXNiL2NkbnMzL2NkbnNwLXNreTEuaCAgICAgICAgICAgICAgICB8IDEwMCArKysNCiA5IGZpbGVz
IGNoYW5nZWQsIDEwODEgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2NpeCxza3kxLXVzYnNzcC55YW1sDQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdXNiL2NkbnMzL2NkbnNwLXNreTEuYw0KIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL3VzYi9jZG5zMy9jZG5zcC1za3kxLmgNCg0KDQpiYXNlLWNvbW1p
dDogNjYyOGU3ZDRjNmIyNWM4ZDE4ZjEzNDVlM2EyMGQyMTgyOWFhZTdlNA0KcHJlcmVxdWlzaXRl
LXBhdGNoLWlkOiAyZjE0NTlmNzVlOTJkN2ZhZWI5M2ExZTJmMzlkMjc5MDFiZWEzZTM5DQpwcmVy
ZXF1aXNpdGUtcGF0Y2gtaWQ6IDM5ZTc4Y2UxNzY3OTA4ZGIxMjkzYzQ4NjhiYzMyMGFiZWRhY2Zl
YmYNCnByZXJlcXVpc2l0ZS1wYXRjaC1pZDogMGYwZmQ0NWFlMGQ3Y2M1N2ViOGM4OTlhMmVjYjlm
MWVmYTZlYmJmYw==

